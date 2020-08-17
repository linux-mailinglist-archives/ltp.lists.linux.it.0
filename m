Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E6246791
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 15:44:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56D343C58D5
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 15:44:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 25C533C2FFF
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 15:44:20 +0200 (CEST)
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E4A751A00682
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 15:44:19 +0200 (CEST)
Received: by mail-ua1-x942.google.com with SMTP id g11so4762964ual.2
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 06:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YK1g7CpAj1uxdUMop0TAQ/KlG7NubSk4gl7YMK07x3k=;
 b=ckeoC9vO/EDF3YhPTlzEiluCGyrsP53BCP34FHVrdI8dpxxDV3K+SwS1hVvx0mZcmM
 e2O91NKmU+NTYcN/tz61BiWW9QlDpE/ctnp1RkSV1f3S0tJquoPdWFtFvwbM/qj+ig42
 Zx0Etpm3KzjpWimA7LfYgeTbvIYJ+MqLP2/1WK0GsLq/AJ4Gq3/IYaIVHao2TI3hcZfP
 68I7yu3R0UWmbe6eTH+cBL+DEwLUN/83wu07NWUwmKKz3AZctOS6JJatO5ps/e1MpIEc
 FG4FYDE5qqMgZ9NiMEdTtKRZS7MBhdsf9UCzEXzeLnjCseF8vqop52zofptLynay9JjQ
 6qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YK1g7CpAj1uxdUMop0TAQ/KlG7NubSk4gl7YMK07x3k=;
 b=Cekbg4ktmFFs7Rr4IcjXOe6IF6O9nf7/C07yurTG95GPeBAWE3eq6yZJe2pTYVnhJB
 h1ZSF9sTu5ZtABfVVMX2d7wc+i/WwVVCXhjaLnDceyoJpHsBgcI+upeQx4weYlZcT9YD
 VWLiyS5/t3phYVNF+lN6IbRNsrNwityDN6tZiRL9+7ZLsMDicNsaKtfPghXNJ8Ak8uqc
 pGkpY2NZwf7qr5tQBcdhmU1zL/EcXI2GjfxISLKbr0jXSHS82rpYLqBY18ceE6quMS4I
 8w1Jmkthe9K3KzU12cGZHd5NiCdO0v0K17AzODEf2J3mS5a1FcKxniH53qZgrUo8fN0D
 Ju9Q==
X-Gm-Message-State: AOAM533i+SOvvO6+DwHHvrxgPt34Hjt3pqRwGajVLatc5Yp4GtOEXog8
 468eXzN+TDGMuaR6wdQrWm282qGIrVN3II8YyZIVXg==
X-Google-Smtp-Source: ABdhPJx2boyWtvrgXSxzxAFNpocIavvkFNhc8FhgjvFzGZM8f5Qera674/ApAjhCKTryvJlmcUOHc2HfleHlukxtHlM=
X-Received: by 2002:a9f:35d0:: with SMTP id u16mr7432899uad.113.1597671858524; 
 Mon, 17 Aug 2020 06:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200728163416.556521-1-hch@lst.de>
 <20200728163416.556521-3-hch@lst.de>
 <CA+G9fYuYxGBKR5aQqCQwA=SjLRDbyQKwQYJvbJRaKT7qwy7voQ@mail.gmail.com>
In-Reply-To: <CA+G9fYuYxGBKR5aQqCQwA=SjLRDbyQKwQYJvbJRaKT7qwy7voQ@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 17 Aug 2020 19:14:04 +0530
Message-ID: <CA+G9fYs4w46bZtgaKTzTLgaqNDcw3vdRaKWuGJ4wN4SSKJqUKA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 02/23] fs: refactor ksys_umount
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-raid@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 6 Aug 2020 at 20:14, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Tue, 28 Jul 2020 at 22:04, Christoph Hellwig <hch@lst.de> wrote:
> >
> > Factor out a path_umount helper that takes a struct path * instead of the
> > actual file name.  This will allow to convert the init and devtmpfs code
> > to properly mount based on a kernel pointer instead of relying on the
> > implicit set_fs(KERNEL_DS) during early init.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  fs/namespace.c | 40 ++++++++++++++++++----------------------
> >  1 file changed, 18 insertions(+), 22 deletions(-)
> >
> > diff --git a/fs/namespace.c b/fs/namespace.c
> > index 6f8234f74bed90..43834b59eff6c3 100644
> > --- a/fs/namespace.c
> > +++ b/fs/namespace.c

<trim>

>
> Regressions on linux next 20200803 tag kernel.
> LTP syscalls test umount03 mount a path for testing and
> umount failed and retired for 50 times and test exit with warning
> and following test cases using that mount path failed.
>
> LTP syscalls tests failed list,
>     * umount03
>     * umount2_01
>     * umount2_02
>     * umount2_03
>     * utime06
>     * copy_file_range01

The reported issue has been fixed in linux next 20200817 tag by
below patch.

fs: fix a struct path leak in path_umount
Make sure we also put the dentry and vfsmnt in the illegal flags and
!may_umount cases.
Fixes: 41525f56e256 ("fs: refactor ksys_umount")

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
