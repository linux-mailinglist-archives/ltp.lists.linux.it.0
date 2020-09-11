Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D43265AA0
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 09:39:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80CD83C2BF7
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 09:39:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id CB07E3C262C
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 09:39:04 +0200 (CEST)
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5EE261000D91
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 09:39:04 +0200 (CEST)
Received: by mail-il1-x141.google.com with SMTP id y2so8185822ilp.7
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 00:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R09jV3EFzcz54ocXphMWdz+tbSUs+0qqgDafbeBEAMQ=;
 b=GLnV1IfHM5TrrOmy3SANBuQMFeIcRJVntBPJx7PuYDPwPeeXJSPV+PHI/30nc6E5Na
 yCIvpwv4tFTpdojzdTEKjfSCrHx1UX9KsfnpPU9bVDCPsnvcOo9QmZaWPtPA1B28E7Dj
 YMFuWtvfm82TTUCzq0JESv6P5Yt5wb1yrt0AXcBX/apxBuEZ5aQryBmyp4ukXIS3kycs
 4mAd6KBCVPDErg3pIs/i2QdWAwKO3bR/05XlYj+++pUP8q1ehjTwvx00yv4wSNDBRsdB
 t+xF+MOekkNRbzVvA5ykmscuvpNfIxs0aa18i8Z6433EcS+nb8GJeqPx6O+TgvRTcie/
 oqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R09jV3EFzcz54ocXphMWdz+tbSUs+0qqgDafbeBEAMQ=;
 b=FWtMnABIGL3iRGVLNhdSONKgcgXs22YTyItuFDY+h3pc13U7BHxZ1VkXMCN8N/acGv
 68OJc2aWfJrmuJ0QMpusB/O+PSGR4Z6L/ZBbAZRc0ySqBgAOtikMv/SxksqjAQjT3Idu
 1MSfAuqckFCi4xls6qwXkEaWkgXgJW/s7imPoFI2uZkzFOCqndmsqIRJKjzgjBXd9wPq
 1a96QB9X5CkvHOyJHYbpd+4cSVTKwN/RNm47LzAXijdRRdnenFjFgLPve1bUlO0USVMb
 hL1R63cGuPumDxoVHqboVr4G5N/cxh6zptmuoL/GqWMLnJyhLngvxLnDLbDI6vafbG5K
 YxHA==
X-Gm-Message-State: AOAM530fJV/9krHze25p6x2r60jDB6ljZfz86M1yompnJBsspXFBeb9e
 SqLmyXF+py3WY0Xdv+K/YTbQQJ9g4LzoNOv78PAzTuW9XZA=
X-Google-Smtp-Source: ABdhPJwhk2ptRMc+Mv/Mc4XaaBHXTK+4BCEZ9UoIzAjt7MVSV4Gop6+rSvFVBKQwNmE2Ch46nZ8xSjljO8ZXuXQngks=
X-Received: by 2002:a92:d482:: with SMTP id p2mr824014ilg.9.1599809943130;
 Fri, 11 Sep 2020 00:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200911065124.18992-1-pvorel@suse.cz>
In-Reply-To: <20200911065124.18992-1-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 11 Sep 2020 10:38:52 +0300
Message-ID: <CAOQ4uxjUj35ePAzQuEO6BrTskrrp0TLX-tnV7L4Opcda0Mm8gg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] fanotify10: Skip non zero ignored_onchild
 tests for < v5.9
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Sep 11, 2020 at 9:51 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> ignored mask in combination with flag FAN_EVENT_ON_CHILD has
> undefined behavior on kernel < 5.9.
>
> Also remove wrong kernel commit (left in e8189ff3c).
>
> Acked-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  testcases/kernel/syscalls/fanotify/fanotify10.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
> index 2c4401f61..64426b876 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify10.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
> @@ -20,10 +20,10 @@
>   *
>   *     2f02fd3fa13e fanotify: fix ignore mask logic for events on child...
>   *
> - * Test cases #17-#23 are regression tests for commit:
> + * Test cases #17-#23 are regression tests for commit (from v5.9, unlikely to be
> + * backported thus not in .tags):

If we are being accurate, it is only the 4 test cases with non zero
ignored_onchild
that are regression tests for this commit. The other 3 test cases are
just completing
the test matrix of possible combinations of marks.

So you may rephrase above as "Test cases with 'ignored_onchild'..."
or what not.

Thanks,
Amir.

>   *
>   *     497b0c5a7c06 fsnotify: send event to parent and child with single...
> - *     eca4784cbb18 fsnotify: send event to parent and child with single...
>   */
>  #define _GNU_SOURCE
>  #include "config.h"
> @@ -451,6 +451,12 @@ static void test_fanotify(unsigned int n)
>
>         tst_res(TINFO, "Test #%d: %s", n, tc->tname);
>
> +       if (tc->ignored_onchild && tst_kvercmp(5, 9, 0) < 0) {
> +               tst_res(TCONF, "ignored mask in combination with flag FAN_EVENT_ON_CHILD"
> +                               " has undefined behavior on kernel < 5.9");
> +               return;
> +       }
> +
>         if (create_fanotify_groups(n) != 0)
>                 goto cleanup;
>
> @@ -567,7 +573,6 @@ static struct tst_test test = {
>         .tags = (const struct tst_tag[]) {
>                 {"linux-git", "9bdda4e9cf2d"},
>                 {"linux-git", "2f02fd3fa13e"},
> -               {"linux-git", "497b0c5a7c06"},
>                 {}
>         }
>  };
> --
> 2.28.0
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
