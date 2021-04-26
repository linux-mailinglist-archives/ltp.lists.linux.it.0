Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B9236B399
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:55:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2BF73C6711
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:55:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E5CA63C1A7E
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:55:29 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2DA5710009AC
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:55:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DB0AACF9;
 Mon, 26 Apr 2021 12:55:28 +0000 (UTC)
Date: Mon, 26 Apr 2021 14:55:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: xieziyao <xieziyao@huawei.com>
Message-ID: <YIa4PuDonH1Jwnlc@pevik>
References: <20210422065732.61222-1-xieziyao@huawei.com>
 <20210422065732.61222-2-xieziyao@huawei.com>
 <YIaWnt5ksxVyBvxk@pevik>
 <ae16017b01474cbb9d4d0e74e473a7c4@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae16017b01474cbb9d4d0e74e473a7c4@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/tkill: Convert tkill01 to the new API
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi,

> Thanks for your review, Petr.

> > +	TEST(tst_syscall(__NR_tkill, tid, SIGUSR1));
> > +	if (TST_RET == 0) {
> > +		while (!sig_flag);

> This while loop is written to check whether the sighandler function captures the SIGUSR1 signal and set sig_flag to 1.

Oh, correct. But not sure if it's good to use plain while.
Maybe using usleep(1000) in while loop?

TST_EXP_PASS(tst_syscall(__NR_tkill, tid, SIGUSR1));

while (!sig_flag)
	usleep(1000);

Kind regards,
Petr

> > +		tst_res(TPASS, "tst_syscall(__NR_tkill, %d, SIGUSR1)", tid);
> > +	} else {
> > +		tst_res(TFAIL | TTERRNO,
> > +			"tst_syscall(__NR_tkill, %d, SIGUSR1)", tid);
> >  	}
> > -	cleanup();
> > -	tst_exit();
> >  }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
