Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8D12B9071
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:55:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2523D3C4EE8
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:55:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id AD2D23C2F45
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:55:10 +0100 (CET)
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2550E1A00E66
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:55:10 +0100 (CET)
Received: by mail-io1-xd41.google.com with SMTP id i18so5575807ioa.3
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 02:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P+GrWc0+do2xqnKBgYafSCpS11un4x9UVB9GOIjC2Ho=;
 b=bsyXFXUjROaDgiz8c9fmBXFfL/tWot737g/6oRnA9R8w5DAe0sTeWNZ9czTwcWiOZH
 OrAd6SUn83lmKbje46FE8pjXGO5ChCOns6XizRX2ojFBDD8190F/LDUQ4eMWkHivosei
 LR1kh5L6hANFSqxlC2eh16G7iSUBlgatK5+FUAsR066hLenc9/4NFhJ3Ihuo8Oj921Ca
 q6/H9xBpCC5OPhUHCTJNjB1OvauZo9ekpdwa1hU7cbB9pQkJlQV1XnF78LzXWSXk21m7
 tU7wjvhIYFxPfOcDP4Avp79WPfC1IMqf5YEkt9jMllANORIIYlPcO+0Jplj/7/PaUagM
 Ua5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P+GrWc0+do2xqnKBgYafSCpS11un4x9UVB9GOIjC2Ho=;
 b=pJhA+IRYpHreGCEegV+u6Yeeg5Gf3NbIRv1B1UhKIsCprUnoaEhvv8WaVidYziDqPA
 Mzvix5KAOCjj5drGKkIaEomyfMl0dZegqqt+pDd2c/37xifUupS8unRD/BAbjIYxd1Yj
 NfABrOD3bgFJOAtC97IgXcpnairC2Dx8WXUI09WJpq24H/DK/1ztCYOeBjy2l1jaFwv+
 /MGNw/B8FYZcyfsE6XR+YnwcNF0S1F0O2exdjAi/EzCTSlu4w93KQOw9SW+Hau5J0DXb
 PuX9edLUzgJrSr2S9g1kj2oYqkZTCOml235zWpwGV3NCOW2/+mKKQCJE6VyKmOUJ/uej
 SqpA==
X-Gm-Message-State: AOAM533XacjH15AMmvpOWd7A47uDaTq8WHVsuwFbxYHxx7yZxeNuQwqR
 6NEhF8Jd3Aoz4IvPIVZgeYUGa6kNXogTzuo5WDw=
X-Google-Smtp-Source: ABdhPJxDjYcU42cMgXyZLOw/ig9WogC35DLc+2yiWA6WRunC1YwBhKTQ+eIrnGn/Veey9cBU/ZMnQmzEuztQBvAILNg=
X-Received: by 2002:a5d:964a:: with SMTP id d10mr16118118ios.5.1605783308810; 
 Thu, 19 Nov 2020 02:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20201113164944.26101-1-pvorel@suse.cz>
 <20201113164944.26101-4-pvorel@suse.cz>
 <20201119102740.GD2785@yuki.lan>
In-Reply-To: <20201119102740.GD2785@yuki.lan>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 19 Nov 2020 12:54:57 +0200
Message-ID: <CAOQ4uxigsk5e7GHgDHydd03D1bAih1SJv36dB4209mpE_dU6PQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Nov 19, 2020 at 12:26 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> >       return rval;
> >  }
> > +
> >  #define SAFE_FANOTIFY_INIT(fan, mode)  \
> >       safe_fanotify_init(__FILE__, __LINE__, (fan), (mode))
> >
> > @@ -189,6 +190,41 @@ struct fanotify_event_info_fid {
> >  #define MAX_HANDLE_SZ                128
> >  #endif
> >
> > +static inline int safe_fanotify_mark(const char *file, const int lineno,
> > +                     int fd, unsigned int flags, uint64_t mask,
> > +                     int dfd, const char *pathname)
> > +{
> > +     int rval;
> > +
> > +     rval = fanotify_mark(fd, flags, mask, dfd, pathname);
> > +
> > +     if (rval == -1) {
> > +             if (errno == ENODEV || errno == EOPNOTSUPP || errno == EXDEV)
> > +                     tst_brk(TCONF,
> > +                             "%s:%d: FAN_REPORT_FID not supported on %s filesystem",
> > +                             file, lineno, tst_device->fs_type);
>
> I guess that we should use tst_brk_() and pass the file and lineno here
> and in the rest of the tst_ calls in this function.
>
> > +             if (errno == EINVAL && (flags & FAN_MARK_FILESYSTEM) == FAN_MARK_FILESYSTEM) {
>
> The comparsion in (flags & FAN_MARK_FILESYSTEM) == FAN_MARK_FILESYSTEM
> seems to be useless. How is this different from a simple
> (flags & MARK_FILESYSTEM) when converted into a boolean value?
>
> > +                             tst_brk(TCONF,
> > +                                     "%s:%d: FAN_MARK_FILESYSTEM not supported by kernel?",
> > +                                     file, lineno);
> > +             }
> > +
> > +             tst_brk(TBROK | TERRNO, "%s:%d: fanotify_mark() failed",
> > +                     file, lineno);
> > +     }
> > +
> > +     if (rval < -1) {
> > +             tst_brk(TBROK | TERRNO, "%s:%d: invalid fanotify_mark() return %d",
> > +                     file, lineno, rval);
> > +     }
> > +
> > +     return rval;
> > +}
> > +
> > +#define SAFE_FANOTIFY_MARK(fd, flags, mask, dfd, pathname)  \
> > +     safe_fanotify_mark(__FILE__, __LINE__, (fd), (flags), (mask), (dfd), (pathname))
> > +
> >  /*
> >   * Helper function used to obtain fsid and file_handle for a given path.
> >   * Used by test files correlated to FAN_REPORT_FID functionality.
> > @@ -242,7 +278,6 @@ static inline void fanotify_save_fid(const char *path,
> >  #define INIT_FANOTIFY_MARK_TYPE(t) \
> >       { FAN_MARK_ ## t, "FAN_MARK_" #t }
> >
> > -
> >  static inline void fanotify_access_permissions_supported_by_kernel(void)
> >  {
> >       int fd;
> > diff --git a/testcases/kernel/syscalls/fanotify/fanotify01.c b/testcases/kernel/syscalls/fanotify/fanotify01.c
> > index 03e453f41..7690f6b88 100644
> > --- a/testcases/kernel/syscalls/fanotify/fanotify01.c
> > +++ b/testcases/kernel/syscalls/fanotify/fanotify01.c
> > @@ -101,19 +101,8 @@ static void test_fanotify(unsigned int n)
> >                       "failed", tc->init_flags);
> >       }
> >
> > -     if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
> > -                       FAN_ACCESS | FAN_MODIFY | FAN_CLOSE | FAN_OPEN,
> > -                       AT_FDCWD, fname) < 0) {
> > -             if (errno == EINVAL && mark->flag == FAN_MARK_FILESYSTEM) {
> > -                     tst_res(TCONF,
> > -                             "FAN_MARK_FILESYSTEM not supported in kernel?");
> > -                     return;
> > -             }
>
> Here we had tst_res(TCONF, ...) followed by a return but we will can
> tst_brk() after the change. I guess that we may skip part of the test on
> older kernels with that change.
>

That's not good. I missed that in my review.
There are many tests where only the FAN_MARK_FILESYSTEM
test cases are expected to result in TCONF, but the rest of the test
cases should run.

In most of these tests the FAN_MARK_FILESYSTEM test cases are
last because they were added later. This is not the case with fanotify01
and fanotify15 and we do not want to reply on the ordering anyway.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
