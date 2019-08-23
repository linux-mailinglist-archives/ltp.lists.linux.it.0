Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9E09A861
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 09:15:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CE4F3C1D1B
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 09:15:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 943313C17A2
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 09:15:16 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CA879600148
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 09:15:15 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id b24so5876054pfp.1
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 00:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OvOnE/atNHLBADneIx4Ivgdqyv5VScnIWENM1NDy/nc=;
 b=qpcgPD6HTfJgZUK1EOTgSJkyY6zCAQvHSX0zaKh0Hsk67vXVAuMbOWLoWq1XCn4Smo
 kS4D3WKYkHG9+4odg9Gu6Y3teDfCs77l5eOxO1mIKS1s8/Fr/QgBmrRKAdgoX06N7U+/
 4uhv1dLoPDabqzPBSH+8AKQ0H5DBoBj6hdINMqS6Zf3RfNj4t8D3m6NhA6P1oM4109j+
 ulxBLnFLmY2H1GQ6BKeu+KjJ63eEmay677wFQUA7ZlVwG+AL2hVZY4jquWekapJjnqud
 FoDAOwco7O/rA5P7sSltgVYZIClugV9E0aI8ttnIRfFhY478qnibWqQneMANiy3tti9E
 ElJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OvOnE/atNHLBADneIx4Ivgdqyv5VScnIWENM1NDy/nc=;
 b=bSb6OR7EIkIeI5GtVzf08ytugIfrg38nPEJPShtFJu3qe9SdQveFHxyXS72c9OJi3Y
 BAO4EAIcnaIXEA5uPHN44+Snop72zQPzDBQwB4SQRKfd5fV0tNR3kzgaRPWdb6RLIVA2
 HC9Sp7CXsOdgwj2nUqC9Xkb+wz668VZqhuUrMCjjYyl6Ry530t+AhARZoYAaw3ytPn2U
 bqO9Qxbbk4ewAqPxFxKDMmejvQFiyj15MlOPfQArMCVbrRf5zKaFYB9C7PTXYfgcxsla
 6d7sPaMe2BMrmVNj6Sc9XeBg3oeOHS6lZWPAlOg/Lzw243kz/jOvtSiYAGvMBsTkvZ6B
 75Tg==
X-Gm-Message-State: APjAAAV1N8JVzU4mIfSvYPODHkDjz3C5BSjeufQeEJnuAxxRIpjMHduj
 Bjsqhbn/2jgZwCqQKVD4JVTdbEkN
X-Google-Smtp-Source: APXvYqw3hQuGrIcZyUVR4KOdBC+lnctrB+GPykicrZn5Np0vHv7G33xHYmJ4d/GxQD3jjgiHKkZivw==
X-Received: by 2002:a62:c584:: with SMTP id j126mr3559542pfg.21.1566544514437; 
 Fri, 23 Aug 2019 00:15:14 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id m34sm2945131pje.5.2019.08.23.00.15.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 00:15:14 -0700 (PDT)
Date: Fri, 23 Aug 2019 15:15:06 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190823071506.3d32pwkss7aaewi3@XZHOUW.usersys.redhat.com>
References: <1566541374-2225-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566541374-2225-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02: use .needs_tmpdir and
 MAX_LEN
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Aug 23, 2019 at 02:22:54PM +0800, Yang Xu wrote:
> Since commit bc514b22, we have removed EXDEV test. all_filesystem
> ,mount_device and mntpoint make no sense. Remove it and use tmpdir.
> 
> As man-page said, when we plan to write at a position past the maximum
> allowed offset, it will return EFBIG. So we should USE MAX_LEN as pos
> instead of MAX_OFF.

Test PASS. Thanks!

> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Signed-off-by: Murphy Zhou <jencce.kernel@gmail.com>
> ---
>  .../kernel/syscalls/copy_file_range/copy_file_range02.c     | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> index 9004c4a40..f502c75c0 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> @@ -74,7 +74,7 @@ static struct tcase {
>  	{&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE, "char device"},
>  	{&fd_fifo,      0,   EINVAL,     0,     CONTSIZE, "fifo"},
>  	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX, "max length lenght"},
> -	{&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF, "max file size"},
> +	{&fd_copy,      0,   EFBIG,      MAX_LEN, MIN_OFF, "max file size"},
>  };
>  
>  static int run_command(char *command, char *option, char *file)
> @@ -219,8 +219,6 @@ static struct tst_test test = {
>  	.setup = setup,
>  	.cleanup = cleanup,
>  	.needs_root = 1,
> -	.mount_device = 1,
> -	.mntpoint = MNTPOINT,
> -	.all_filesystems = 1,
> +	.needs_tmpdir = 1,
>  	.test_variants = TEST_VARIANTS,
>  };
> -- 
> 2.18.1
> 
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
