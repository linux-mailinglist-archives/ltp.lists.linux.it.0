Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BE21774BF
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 11:59:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 706E33C66A5
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 11:59:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 618C73C66A1
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 11:59:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9369C6012CB
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 11:59:14 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C63E0B22D
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 10:59:13 +0000 (UTC)
Date: Tue, 3 Mar 2020 11:47:37 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200303104737.GA42129@gacrux.arch.suse.de>
References: <20200221120850.15874-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221120850.15874-1-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add test for CVE 2017-10661
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Changes since v1:
> - typo fixes
> - code style fixes
> - move test from cve/ to kernel/syscall/timerfd/
> - add test to cve runfile
Thanks for fixing all Richie's comments.

> +++ b/testcases/kernel/syscalls/timerfd/Makefile
> @@ -20,6 +20,7 @@ top_srcdir		?= ../../../..

>  include $(top_srcdir)/include/mk/testcases.mk

> -LDLIBS			+= -lpthread -lrt
> +timerfd_settime02:	CFLAGS	+= -pthread
> +timerfd_settime02:	LDLIBS	+= -pthread -lrt
Interesting, I thought -pthread wouldn't be needed to be in LDLIBS
(enough to have it in CFLAGS), but old distros (CentOS 6 in our travis: gcc
4.4.7, glibc 2.12).

...
> diff --git a/testcases/kernel/syscalls/timerfd/timerfd_settime02.c b/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
...
> +static void setup(void)
> +{
> +	int ttype;
> +
> +	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
> +	errno = 0;
I guess reset errno shouldn't be needed, but sure it's safe.

> +	fd = timerfd_create(CLOCK_REALTIME, 0);
> +
> +	if (fd < 0) {
> +		ttype = (errno == ENOTSUP ? TCONF : TBROK);
> +		tst_brk(ttype | TERRNO, "Cannot create timer");
> +	}
It looks like we'd benefit from SAFE_TIMERFD_CREATE().
+ I like you take care about ENOTSUP.

...
> +static void run(void)
> +{
> +	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
> +
> +	while (tst_fzsync_run_a(&fzsync_pair)) {
> +		TEST(punch_clock(TFD_TIMER_ABSTIME | TFD_TIMER_CANCEL_ON_SET));
> +
> +		if (TST_RET == -1)
> +			tst_res(TBROK | TTERRNO, TIMERFD_FLAGS " failed");
Now this needs to be tst_res(TFAIL (person who merges this will do).

> +
> +		if (TST_RET != 0)
> +			tst_res(TBROK | TTERRNO, "Invalid " TIMERFD_FLAGS
> +				" return value");
The same here.


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
