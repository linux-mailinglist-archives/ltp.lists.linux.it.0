Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D94CE485E
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:15:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F16D3C22C5
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:15:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 48A9B3C1448
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 12:15:17 +0200 (CEST)
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 65E5E6018C3
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 12:15:16 +0200 (CEST)
Received: by mail-yb1-xb42.google.com with SMTP id i6so658203ybe.2
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 03:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=evqFoeqsoBnJ1+fRSbobm8CXJF+hLRI9KXIa4dP65ec=;
 b=HQhE1k2850cmEHqk6htrs+zQiXXycq/cnm0hvk3cO4Gh/P5WdwlVA6WPLRQYlWq4oK
 g+42mNS8iDHchULCYO6nHNf5z5Joe5kSYqbYn55JdewgAPJmst5Qr3RFRg8qPIluGPr3
 374iovN2x7/CTU+wDF+U7QPRVzEoH9O5raUwu3vM8x1Zg3945PBl/KIMzvxRdjTv5BUs
 nZrFOODpll+vTbjml/+/2CcUqLQrEW3GRPtNNpRBlk3Mbf1NdyyqRZNSyNCylEFYhuuk
 A+3vpvhQlmt57iJPHV5o2DLt9PzkrUZdK1PBFthuJyxYfzJWahyAyQ0njr9nO9HwGh/E
 qHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=evqFoeqsoBnJ1+fRSbobm8CXJF+hLRI9KXIa4dP65ec=;
 b=lDLVyyLgm9x3w070n5S1e4iwUqGeCKcvE/Vrm7rjKMvs96+GI0N3q1oLX8oB3A6XhM
 HoXAyLZFGfuQZRGCMgYIbNLwkEQEIUUKcudP9zHbebypXYDxCJNcj1R+JJoqhWNKrmjA
 FG377uel48xH3buhrnyaE4IrPjyDPnp1yHsSoW+5Wn1vUxCc6LagmZh8mPaEt3UzQIdx
 1sNdAs7hd8lDmnPKGv5U3VJtSBpRJdiO2X/jkLitgxJ/AfK15ySAHfRVB3XY+V+dmCkO
 tYmjLxuUjvZvBgpA/oMmwJQjqiSKFVo8tH/tNKgSbUsERYWWE6B0DoxnOAIMPcrzE+Ut
 +uIA==
X-Gm-Message-State: APjAAAVB5il7skO4g5k7mwCR+IOZve4ayxfvA2D0Hm9aW7BztX1bQjze
 19xt2ZL+WJ2m/DqpsdGMoWkHWhjb7Voup9TZ5s0=
X-Google-Smtp-Source: APXvYqxOpjZo1qHDskoxAG5y+DbAlmf1QJ38C0g2ostPyad3P1ydD0j1amy9IdXUH7RJM6Q+nhw8XRw5KHGWln5j618=
X-Received: by 2002:a25:8308:: with SMTP id s8mr2319482ybk.126.1571998514880; 
 Fri, 25 Oct 2019 03:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <1571968780-4810-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191025083738.GA13022@x230>
In-Reply-To: <20191025083738.GA13022@x230>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 25 Oct 2019 13:15:03 +0300
Message-ID: <CAOQ4uxiV56cNFXoJp4qYjoCDQ2pFEn8G9mgV_j8pMG2LkC=vfg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02: skip new error tests
 if cross-fs isn't supported
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

On Fri, Oct 25, 2019 at 11:37 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Xu,
>
> > We should not skip the whole error test if cross-fs isn't support because
> > old errors should be tested on all version. Even we use .mount_device = 1
> > and .mntpoint = MNTPOINT, the src and dest file are still in tmp directory
> > instead of mntpoint.
>
> > ps: I doubt whether we should skip new error test because it indeed exposed this
> > unreasonable copy_file_range behavior of the user.
>
> > Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Tested-by: Petr Vorel <pvorel@suse.cz>
>
> LGTM, but I'd like to have Amir's review/ack.
>

ACK. I'm fine with the test code.
If you tested it and it passed on both new and old kernel,
it's fine by me.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
