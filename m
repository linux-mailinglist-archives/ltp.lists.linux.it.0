Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884B3C8A98
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 20:15:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDC273C8740
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 20:15:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF0BD3C60E0
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 20:15:52 +0200 (CEST)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 494981401166
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 20:15:52 +0200 (CEST)
Received: by mail-il1-x136.google.com with SMTP id a11so2520474ilf.2
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 11:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nx8XPSkDvbLki+GgyeK64V9GIHwjZmyQu0JXsYUGqio=;
 b=abWicCJfk0pfM/+YEUSBDYCvovecV8HZR8eE5Vn3Xnfm1j6NSApTqjmnqzWOXwql1L
 FNbnqLT8S0yT9Cg53CNQhPErlNOLtEcLW16rGbtyq1A3JZsBY5HFWtIxLwJ2ueHIdnuA
 GDB0m1M6XHl2wH9rrk8l34n4HG58+c/O1uKgwqcahG1iWQyYRea4zSCkTP5MF2OB7sNE
 FZTkp+W7d99Fxn1eRtDHIEWjh7+lyA0GLKT9ItcL6907bRSZAJgT423fnRl20wu0/6pV
 S26El3JN1N5bMjeOWJlFBayGtd11Ru6QcuVfs+TgfP6unyNojJ+VQfKXMDJHQJ2Y0hFl
 nDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nx8XPSkDvbLki+GgyeK64V9GIHwjZmyQu0JXsYUGqio=;
 b=d+QORAbQ6tnUbhf6HHHZhALI9lgo3S4U5cd2gmuB6tq6tBnNwnLGo/lAngEkUDWrPE
 P/x/VkTY0L1RgH6kCi5PTqJrO+Zf6X9H8HOfgL2VN3xm902aVZTNhIJPCDHrFQO9FQKB
 5tD6JfExpATLPXeZ7xVa9SsnVk3S0FewRH0I8mas+xUBrtQIlzaRm6nLAgju4ZpLA4FC
 8s9RIie2uRSHMklK4UQT/5iOpZhWNcLuAIb8K85i2BGUW14Z88FXI9W1pkI6O/BunbVF
 Yi8mj/E6Uvchy9QDadj/09hVlOh/RzlSEMwrBsg7XnvhJ/tF+R5sSzZa4vMAPYGeWMw8
 /+rQ==
X-Gm-Message-State: AOAM530UgxE4CBcnwxngQzZ+fJKCgIFvXUIJAdeqIrn2mjzHZ+Eu8QVE
 4zhsuwVv977xkACaFI9WR7cbZ/LBE9NWPpQ7OPU=
X-Google-Smtp-Source: ABdhPJyxP88+ehmCp6fuo6nb+BPJpyPKLBAIsls+wghxpiEJFwdh+D4Vt9iE0wi75h9KN9jt61qracDwBIHWEmJDzfo=
X-Received: by 2002:a05:6e02:1c02:: with SMTP id
 l2mr7622035ilh.9.1626286551014; 
 Wed, 14 Jul 2021 11:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210713162450.34947-1-amir73il@gmail.com>
 <YO6SFGTvHJkAR5+9@pevik>
In-Reply-To: <YO6SFGTvHJkAR5+9@pevik>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 14 Jul 2021 21:15:39 +0300
Message-ID: <CAOQ4uxjjbv996OC_xqAtV1wttK51ytb3dPavS8F28K3QMU6Xzw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fanotify19: Add test cases for elevated
 reader privileges
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Jul 14, 2021 at 10:28 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> > Even when event reader has elevated privileges, the information provided
> > in events is determined by the privileges of the user that created the
> > fanotify group.
>
> > Add test cases for unprivileged listener and privileged event reader.
>
> > This is a regression test for kernel commit
> > a8b98c808eab ("fanotify: fix permission model of unprivileged group")
>
> > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> > ---
>
> > Hi Petr,
>
> > Added test for a fix in v5.13-rc5.
>
> Thanks for your patch, pushed!
>
> Things I've found, not related to this patch:
>
> TBROK when running with higher number of iterations:
> ./fanotify19 -i 30
> ...
> fanotify19.c:224: TPASS: Received event: mask=2b, pid=11351 fd=-1
> fanotify19.c:224: TPASS: Received event: mask=b, pid=11351 fd=-1
> fanotify19.c:224: TPASS: Received event: mask=a, pid=11351 fd=-1
> fanotify19.c:224: TPASS: Received event: mask=8, pid=11351 fd=-1
> fanotify19.c:147: TINFO: Test #3 unprivileged lisneter, privileged reader - events by child
> fanotify19.c:151: TINFO: Running as privileged user, revoking.
> fanotify19.c:136: TBROK: Child process terminated incorrectly. Aborting
>
> Summary:
> passed   316
> failed   0
> broken   1
> skipped  0
> warnings 0
>
> Could you have look into it?
>

Posted fix.

> very minor nit: checkpatch complains about minor issues. Although all but quoted
> string split across lines are easily fixable we don't need to bother with it.
> But could you please use checkpatch for new tests?

Will do.

> Also I'd personally join also strings which are below 100 chars, because it
> helps to grep.
>
> > @@ -248,6 +285,10 @@ static struct tst_test test = {
> >       .needs_root = 1,
> >       .mount_device = 1,
> >       .mntpoint = MOUNT_PATH,
> > +     .tags = (const struct tst_tag[]) {
> > +             {"linux-git", "a8b98c808eab"},
> FYI we also support "linux-stable-git", but we mainly use it for stable branch
> specific patches (something required just for stable), not for regular backports
> of fixes.
>

I did not understand when linux-stable-git should be used or why it applies
to this case.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
