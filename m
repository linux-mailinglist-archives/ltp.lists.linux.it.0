Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE41D0BD1
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 11:20:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B73913C25E1
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 11:20:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A56303C2508
 for <ltp@lists.linux.it>; Wed, 13 May 2020 11:20:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 27F73140180A
 for <ltp@lists.linux.it>; Wed, 13 May 2020 11:20:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2FE06AEA8;
 Wed, 13 May 2020 09:20:33 +0000 (UTC)
Date: Wed, 13 May 2020 11:20:28 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200513092028.GA4598@dell5510>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <5EBB5B3D.4020302@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5EBB5B3D.4020302@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Yang,

> For the patch set, I and Viresh have the following doubts so do you have any
> suggestion about them?
> 1) I keep TEST() in pidfd_open01/pidfd_open03 for now but I think it is
>    surplus because pidfd/fd and TERRNO are enough to check return value
>    and errno.
>    I wonder if it is necessary to keep TEST()?

yes, I've noticed your discussion at v1, sorry I wasn't able to follow.
https://patchwork.ozlabs.org/project/ltp/patch/20200430085742.1663-1-yangx.jy@cn.fujitsu.com/
Just to get context, We're talking about part of the changes between v1 and v2:

+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
@@ -27,9 +27,11 @@ static void run(void)
                exit(EXIT_SUCCESS);
        }

-       fd = pidfd_open(pid, 0);
+       TEST(pidfd_open(pid, 0));
+
+       fd = TST_RET;
        if (fd == -1)
-               tst_brk(TFAIL | TERRNO, "pidfd_open() failed");
+               tst_brk(TFAIL | TTERRNO, "pidfd_open() failed");

        TST_CHECKPOINT_WAKE(0);

I haven't found Cyril's request to use TEST(). To be honest, not sure if it was
meant to make sure that errno needs to be reset before (which TEST()) does.
If not, using pidfd_open() directly would be ok for me.


> 2) tst_syscall() is enough to check the support of pidfd_open() and I
>    don't want to define check function as fsopen_supported_by_kernel()
>    does.
>    Do you think so?

> BTW:
> I don't like the implementation of fsopen_supported_by_kernel():
> a) syscall()/tst_syscall() is enough to check the support of
> pidfd_open(2) and 'tst_kvercmp(5, 2, 0)) < 0' will skip the check if
+1 for tst_syscall()

> a kernel on distribution is newer than v5.2 but drop the support of
> pidfd_open(2) on purpose.
"drop support of pidfd_open(2) on purpose": would anybody has a reason to do
that?

> b) tst_syscall() has checked ENOSYS error so we can simple
> fsopen_supported_by_kernel() by replacing syscall() with tst_syscalls().

Well, one of the benefits of fsopen_supported_by_kernel() was to reduce a bit of
duplicity. Even if the implementation is like TEST and SAFE_CLOSE(), it's
a fewer lines (+ function name as a self docs).

void fsopen_supported_by_kernel(void)
{
	TEST(tst_syscall(__NR_fsopen, NULL, 0));
	if (TST_RET != -1)
		SAFE_CLOSE(TST_RET);
}

For your change for pidfd_open03.c:

static void setup(void)
{
	int pidfd = -1;

	// Check if pidfd_open(2) is not supported
	pidfd = tst_syscall(__NR_pidfd_open, getpid(), 0);
	if (pidfd != -1)
		SAFE_CLOSE(pidfd);
}

 static struct tst_test test = {
-       .min_kver = "5.3",
+       .setup = setup,

How about to call the function pidfd_open_supported_by_kernel()?
Than you can remove the comment (which BTW should use C style /* */).
And IMHO you don't have to assign pidfd to -1.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
