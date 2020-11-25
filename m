Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD572C4780
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 19:24:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA75E3C4E3F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 19:24:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 84F0B3C2CF9
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 19:24:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EF23B60054C
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 19:24:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2E085AC1F;
 Wed, 25 Nov 2020 18:24:05 +0000 (UTC)
Date: Wed, 25 Nov 2020 19:24:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20201125182403.GB7323@pevik>
References: <20201113164944.26101-1-pvorel@suse.cz>
 <20201113164944.26101-4-pvorel@suse.cz>
 <20201119102740.GD2785@yuki.lan>
 <CAOQ4uxigsk5e7GHgDHydd03D1bAih1SJv36dB4209mpE_dU6PQ@mail.gmail.com>
 <20201125141624.GA32471@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125141624.GA32471@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/5] fanotify: Introduce SAFE_FANOTIFY_MARK()
 macro
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> > > > +++ b/testcases/kernel/syscalls/fanotify/fanotify01.c
> > > > @@ -101,19 +101,8 @@ static void test_fanotify(unsigned int n)
> > > >                       "failed", tc->init_flags);
> > > >       }

> > > > -     if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
> > > > -                       FAN_ACCESS | FAN_MODIFY | FAN_CLOSE | FAN_OPEN,
> > > > -                       AT_FDCWD, fname) < 0) {
> > > > -             if (errno == EINVAL && mark->flag == FAN_MARK_FILESYSTEM) {
> > > > -                     tst_res(TCONF,
> > > > -                             "FAN_MARK_FILESYSTEM not supported in kernel?");
> > > > -                     return;
> > > > -             }

> > > Here we had tst_res(TCONF, ...) followed by a return but we will can
> > > tst_brk() after the change. I guess that we may skip part of the test on
> > > older kernels with that change.


> > That's not good. I missed that in my review.
> > There are many tests where only the FAN_MARK_FILESYSTEM
> > test cases are expected to result in TCONF, but the rest of the test
> > cases should run.

> I'm not sure if I understand you. Is my approach correct here?
OK, I got that, I cannot use SAFE_FANOTIFY_MARK() in test_fanotify() in fanotify01.c
and in setup_marks() in fanotify13.c.

But FAN_REPORT_FID in is on both files already checked after fanotify_init()
call. Not sure if it must be check also for fanotify_mark(), because it's
only in FANOTIFY_INIT_FLAGS (via FANOTIFY_FID_BITS). FANOTIFY_MARK_FLAGS has
other flags.

If yes, I'll probably need to create fanotify_supported_by_kernel(...), which
check for all not supported flags and will be used in those 2 places and in
safe_fanotify_init(). Something like this:

typedef void (*tst_res_func_t)(const char *file, const int lineno,
		int ttype, const char *fmt, ...);

int fanotify_flags_supported_by_kernel(const char *file, const int lineno,
	unsigned int flags, int strict)
{
	tst_res_func_t res_func = tst_res_;
	int unsupported = 0;

	if (strict)
		res_func = tst_brk_;

	if (errno == EINVAL) {
		if (flags & FAN_REPORT_TID) {
			tst_res_(file, lineno, TINFO,
					 "FAN_REPORT_TID not supported by kernel?");
			unsupported = 1;
		}

		if (flags & FAN_REPORT_FID) {
			tst_res_(file, lineno, TINFO,
					 "FAN_REPORT_FID not supported by kernel?");
			unsupported = 1;
		}

		if (flags & FAN_REPORT_DIR_FID) {
			tst_res_(file, lineno, TINFO,
					 "FAN_REPORT_DIR_FID not supported by kernel?");
			unsupported = 1;
		}

		if (flags & FAN_REPORT_NAME) {
			tst_res_(file, lineno, TINFO,
					 "FAN_REPORT_NAME not supported by kernel?");
			unsupported = 1;
		}

		if (unsupported)
			res_func(file, lineno, TCONF, "Unsupported configuration, see above");
		else
			tst_brk_(file, lineno, TBROK, "Unknown failure");

		return -1;
	}

	return 0;
}

These are flags for fanotify_init(). Flags for fanotify_mark() are currently
handled by fanotify_exec_events_supported_by_kernel() (used for FAN_OPEN_EXEC
and FAN_OPEN_EXEC_PERM), using different approach. Testing fanotify_mark() flags
support in advance in setup makes tests faster, I'm just not happy we use
different approach. Any tip for improving this or improving readability is
welcome.

Kind regards,
Petr

> > In most of these tests the FAN_MARK_FILESYSTEM test cases are
> > last because they were added later. This is not the case with fanotify01
> > and fanotify15 and we do not want to reply on the ordering anyway.

> > Thanks,
> > Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
