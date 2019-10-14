Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C30D5FFC
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 12:22:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A6B53C229B
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 12:22:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4BF5A3C228E
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 12:22:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 185251A00904
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 12:22:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 35917B750;
 Mon, 14 Oct 2019 10:22:31 +0000 (UTC)
Date: Mon, 14 Oct 2019 12:22:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Michael Moese <mmoese@suse.de>
Message-ID: <20191014102228.GA31459@dell5510>
References: <20190924112159.18845-1-mmoese@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924112159.18845-1-mmoese@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add a regression test for cve-2017-15649
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
> +void *task1(void *unused)
> +{
> +	int fanout = 0x3;
> +
> +	if (tst_fzsync_run_a(&fzsync_pair)) {
> +		setsockopt(fd, 0x107, 18, &fanout, sizeof(fanout));
> +		tst_fzsync_end_race_a(&fzsync_pair);
> +	}
This is a bit different usage of fuzzy sync than docs and other tests do.
As you don't need to run tst_fzsync_pair_reset(&fzsync_pair, task2) here
a warning is issued. If this is a correct usage, we might want to define
tst_fzsync_pair_reset() as inline to avoid the warning.

..
> +static void run(void)
> +{
...
> +	while (1) {
> +		pthread_t thread1, thread2;
> +
> +
> +		fd = SAFE_SOCKET(AF_PACKET, SOCK_RAW, PF_PACKET);
> +
> +		strcpy((char *) &ifr.ifr_name, "lo");
> +		SAFE_IOCTL(fd, SIOCGIFINDEX, &ifr);
> +		index = ifr.ifr_ifindex;
> +
> +		SAFE_IOCTL(fd, SIOCGIFFLAGS, &ifr);
> +		ifr.ifr_flags &= ~(short) IFF_UP;
> +
> +		SAFE_IOCTL(fd, SIOCSIFFLAGS, &ifr);
> +
> +		addr.sll_family = AF_PACKET;
> +		addr.sll_protocol = 0x0;
> +		addr.sll_ifindex = index;
> +
> +		SAFE_PTHREAD_CREATE(&thread1, NULL, task1, NULL);
> +		SAFE_PTHREAD_CREATE(&thread2, NULL, task2, NULL);
> +		SAFE_PTHREAD_JOIN(thread1, NULL);
> +		SAFE_PTHREAD_JOIN(thread2, NULL);
> +
> +		SAFE_CLOSE(fd);
> +
> +		if (tst_capget(&hdr, after))
> +			tst_brk(TBROK | TTERRNO, "tst_capget()");
> +
> +		if (memcmp(before, after, sizeof(after)) || tst_taint_check())
> +			tst_res(TFAIL, "kernel is vulnerable");
> +
> +		clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &now);
> +		if ((now.tv_sec - start.tv_sec) > TEST_RUNTIME)
> +			tst_res(TPASS, "kernel seems to be not vulnerable");
You miss return/break here or it's an infinite loop :).

> +	}
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.caps = (struct tst_cap []) {
> +		TST_CAP(TST_CAP_REQ, CAP_SYS_ADMIN),
> +		TST_CAP(TST_CAP_REQ, CAP_NET_RAW),
> +		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
> +		{},
> +	},
> +};

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
