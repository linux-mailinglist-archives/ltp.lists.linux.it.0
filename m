Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E556C2C48F9
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 21:25:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82C853C4E42
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 21:25:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 41EFA3C2451
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 21:25:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5E129600AAB
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 21:25:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8011AF13;
 Wed, 25 Nov 2020 20:25:18 +0000 (UTC)
Date: Wed, 25 Nov 2020 21:25:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20201125202501.GA64574@pevik>
References: <20201113164944.26101-1-pvorel@suse.cz>
 <20201113164944.26101-4-pvorel@suse.cz>
 <20201119102740.GD2785@yuki.lan>
 <CAOQ4uxigsk5e7GHgDHydd03D1bAih1SJv36dB4209mpE_dU6PQ@mail.gmail.com>
 <20201125141624.GA32471@pevik> <20201125182403.GB7323@pevik>
 <CAOQ4uxiAppu2BMaj=ONU8fS4wriGdhPwgoHu3wjFMTTzS1EiQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxiAppu2BMaj=ONU8fS4wriGdhPwgoHu3wjFMTTzS1EiQw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

> On Wed, Nov 25, 2020 at 8:24 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi Amir,

> > > > > > +++ b/testcases/kernel/syscalls/fanotify/fanotify01.c
> > > > > > @@ -101,19 +101,8 @@ static void test_fanotify(unsigned int n)
> > > > > >                       "failed", tc->init_flags);
> > > > > >       }

> > > > > > -     if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
> > > > > > -                       FAN_ACCESS | FAN_MODIFY | FAN_CLOSE | FAN_OPEN,
> > > > > > -                       AT_FDCWD, fname) < 0) {
> > > > > > -             if (errno == EINVAL && mark->flag == FAN_MARK_FILESYSTEM) {
> > > > > > -                     tst_res(TCONF,
> > > > > > -                             "FAN_MARK_FILESYSTEM not supported in kernel?");
> > > > > > -                     return;
> > > > > > -             }

> > > > > Here we had tst_res(TCONF, ...) followed by a return but we will can
> > > > > tst_brk() after the change. I guess that we may skip part of the test on
> > > > > older kernels with that change.


> > > > That's not good. I missed that in my review.
> > > > There are many tests where only the FAN_MARK_FILESYSTEM
> > > > test cases are expected to result in TCONF, but the rest of the test
> > > > cases should run.

> > > I'm not sure if I understand you. Is my approach correct here?
> > OK, I got that, I cannot use SAFE_FANOTIFY_MARK() in test_fanotify() in fanotify01.c
> > and in setup_marks() in fanotify13.c.

> I gave fanotify01 as an example.
> There are many such cases, like fanotify03.

> The point is we cannot replace tst_res() with tst_brk() when only some of the
> test cases may be supported.

Sure, I'll check in all tests that tst_res() won't be replaced with tst_brk().

> > But FAN_REPORT_FID in is on both files already checked after fanotify_init()
> > call. Not sure if it must be check also for fanotify_mark(), because it's
> > only in FANOTIFY_INIT_FLAGS (via FANOTIFY_FID_BITS). FANOTIFY_MARK_FLAGS has
> > other flags.

> > If yes, I'll probably need to create fanotify_supported_by_kernel(...), which
> > check for all not supported flags and will be used in those 2 places and in
> > safe_fanotify_init(). Something like this:

> > typedef void (*tst_res_func_t)(const char *file, const int lineno,
> >                 int ttype, const char *fmt, ...);

> > int fanotify_flags_supported_by_kernel(const char *file, const int lineno,
> >         unsigned int flags, int strict)
> > {
> >         tst_res_func_t res_func = tst_res_;
> >         int unsupported = 0;

> >         if (strict)
> >                 res_func = tst_brk_;

> >         if (errno == EINVAL) {
> >                 if (flags & FAN_REPORT_TID) {
> >                         tst_res_(file, lineno, TINFO,
> >                                          "FAN_REPORT_TID not supported by kernel?");
> >                         unsupported = 1;
> >                 }

> >                 if (flags & FAN_REPORT_FID) {
> >                         tst_res_(file, lineno, TINFO,
> >                                          "FAN_REPORT_FID not supported by kernel?");
> >                         unsupported = 1;
> >                 }

> >                 if (flags & FAN_REPORT_DIR_FID) {
> >                         tst_res_(file, lineno, TINFO,
> >                                          "FAN_REPORT_DIR_FID not supported by kernel?");
> >                         unsupported = 1;
> >                 }

> >                 if (flags & FAN_REPORT_NAME) {
> >                         tst_res_(file, lineno, TINFO,
> >                                          "FAN_REPORT_NAME not supported by kernel?");
> >                         unsupported = 1;
> >                 }

> >                 if (unsupported)
> >                         res_func(file, lineno, TCONF, "Unsupported configuration, see above");
> >                 else
> >                         tst_brk_(file, lineno, TBROK, "Unknown failure");

> >                 return -1;
> >         }

> >         return 0;
> > }


> That seems too much and adds more noise than valuable info in many cases
> or maybe I didn't understand.

> > These are flags for fanotify_init(). Flags for fanotify_mark() are currently
> > handled by fanotify_exec_events_supported_by_kernel() (used for FAN_OPEN_EXEC
> > and FAN_OPEN_EXEC_PERM), using different approach. Testing fanotify_mark() flags
> > support in advance in setup makes tests faster, I'm just not happy we use
> > different approach. Any tip for improving this or improving readability is
> > welcome.


> I think the best would be to always test in advance like exec events,
> for FAN_REPORT_ fanotify_init() flags and FAN_MARK_FILESYSTEM
> fanotify_mark() flag whenever relevant.

> I didn't go over all tests to see how that would look, but I have a feeling
> that would end up being the cleanest approach.

> Thanks,
> Amir.

OK, I'll have a look whether FAN_REPORT_* will be easy to transform to checks in
advance.

I'll also try to wrote some automatic detection for testcases which use
struct tcase (looping the struct and collect flags with & and pass it to some
function). Maybe too complicated having to declare what is required to check
is something which is IMHO error prone (we probably forget to update what is
needed to be checked when we add/remove/change test structs).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
