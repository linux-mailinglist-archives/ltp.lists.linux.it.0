Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4243864309
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:47:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 106043C1C7C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:47:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D364F3C02C2
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:47:46 +0200 (CEST)
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7320F201351
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:47:45 +0200 (CEST)
Received: by mail-yw1-xc43.google.com with SMTP id u141so517017ywe.4
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kG6/VaZzCs+/33k54ukSAzSBN1XnVeF+rMVOrLdByeM=;
 b=TopW/goVUC/SSi30qKA2vK94rNeVpPZ6jF3n7zAbwB9GIDgH5jogPr1msu51qrkAjo
 cjk9futraaWmGD8xwMaYqHzUuijwq+GwNDEz2xRYhKLy6o5DzGwZcb4uItN3imyGbObP
 G/b1nhTmlq5AZoLUceQdQ2soRj1XA25+oMU3mEh59nEyli+BE16or+pxF/SFqYLbXite
 6m6D39DLZAJ4JTKaTnxC0ptobbLC7Qgldvp0Sn7Fq+EH5Yct5ATeIk6g8D3SqTmrA3Ot
 0H8GfZIy+QvekQlDMrc6JA6SRguR6KHtaMTNZcBxePMJBBmIAeoIJQzPPqIFHh2k7r2O
 4KBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kG6/VaZzCs+/33k54ukSAzSBN1XnVeF+rMVOrLdByeM=;
 b=BqnCwIFeYX9DQ/m7drFDqzUtE7H+FunmldvRie8sqF187FIvqZmzKO7cc+O+9g3ahj
 1iGYI2ARgjIFWWJNEKizVnwf1ldpd/cSTJsiHIk5vm54lUI4SsiWXb59ErXVY4CVn9d4
 dxh0eBRPNvEcDc+pgWRy9X272tCplkgWDFMRG3JsiyqrAYOVzewHKuuJYOfpbhEhKcKg
 qV/ffSJPiG/4jtxmqv8SVl4hCY8eG7gW9OYugJ5wMLmghq9gi4wD9eqeO6VEFWXFYJ0e
 o0UXf9KEqz8Ul+X3WXQIG6a/WBmQc7ggj0bYZflR9FZFLC1mVUlPxOEMiVNgs7zfUYGs
 LHLQ==
X-Gm-Message-State: APjAAAVge3D8WH/ts3fxZVw0EGy+z4ez48vjGH9E8k/nNYofetxlaNlP
 rEPdmVvn6HT+5UgLdSAoz+TlANSdso2uyX1cbaY=
X-Google-Smtp-Source: APXvYqzZjClrq38GlbdhhALPveD0ug0jkHwUzmgD8HQUINR+YP8hA5eVSU/IeXkAM4qcJPyzqRuC2bk4hgeg0+O1NvE=
X-Received: by 2002:a81:31c3:: with SMTP id x186mr13003648ywx.25.1562744864150; 
 Wed, 10 Jul 2019 00:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxhjbaszcCL0=QAncBT3PzqJR_7oyR+_0-zNa-pt6JNQSA@mail.gmail.com>
 <1562743104-2705-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1562743104-2705-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 10 Jul 2019 10:47:33 +0300
Message-ID: <CAOQ4uxjrFDJqUaFw=Fb1d_OKyq-qH9SV3ELVHPEDHM1Bak0ZaA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] lib: alter find_free_loopdev()
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

On Wed, Jul 10, 2019 at 10:18 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> Alter find_free_loopdev() to return the free loopdev minor
> (and -1 for no free loopdev) and then WE can safely use the
> minor number that find_free_loopdev() returned in test cases.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  doc/test-writing-guidelines.txt |  9 +++++++++
>  include/tst_device.h            |  6 ++++++
>  lib/tst_device.c                | 12 ++++++------
>  3 files changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
> index c6d4e001d..887801e68 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1045,6 +1045,15 @@ IMPORTANT: All testcases should use 'tst_umount()' instead of 'umount(2)' to
>  -------------------------------------------------------------------------------
>  #include "tst_test.h"
>
> +int find_free_loopdev();
> +-------------------------------------------------------------------------------
> +This function finds a free loopdev for use and returns the free loopdev minor(-1
> +for no free loopdev).
> +
> +[source,c]
> +-------------------------------------------------------------------------------
> +#include "tst_test.h"
> +
>  unsigned long tst_dev_bytes_written(const char *dev);
>  -------------------------------------------------------------------------------
>
> diff --git a/include/tst_device.h b/include/tst_device.h
> index 61902b7e0..8953b0828 100644
> --- a/include/tst_device.h
> +++ b/include/tst_device.h
> @@ -44,6 +44,12 @@ int tst_umount(const char *path);
>   */
>  int tst_clear_device(const char *dev);
>
> +/*
> + * Finds a free loop device for use and returns the free loopdev minor(-1 for no
> + * free loopdev).
> + */
> +int find_free_loopdev(void);
> +
>  /*
>   * Reads test block device stat file and returns the bytes written since the
>   * last call of this function.
> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index 65fcc1337..3b87dd1f1 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -68,7 +68,7 @@ static int set_dev_path(int dev)
>         return 0;
>  }
>
> -static int find_free_loopdev(void)
> +int find_free_loopdev(void)
>  {
>         int ctl_fd, dev_fd, rc, i;
>         struct loop_info loopinfo;
> @@ -82,10 +82,10 @@ static int find_free_loopdev(void)
>                 if (rc >= 0) {
>                         set_dev_path(rc);
>                         tst_resm(TINFO, "Found free device '%s'", dev_path);
> -                       return 0;
> +                       return rc;
>                 }
>                 tst_resm(TINFO, "Couldn't find free loop device");
> -               return 1;
> +               return -1;
>         }
>
>         switch (errno) {
> @@ -121,7 +121,7 @@ static int find_free_loopdev(void)
>                                 continue;
>                         tst_resm(TINFO, "Found free device '%s'", dev_path);
>                         close(dev_fd);
> -                       return 0;
> +                       return i;
>                 }
>
>                 close(dev_fd);
> @@ -129,7 +129,7 @@ static int find_free_loopdev(void)
>
>         tst_resm(TINFO, "No free devices found");
>
> -       return 1;
> +       return -1;
>  }
>
>  static int attach_device(const char *dev, const char *file)
> @@ -274,7 +274,7 @@ const char *tst_acquire_device__(unsigned int size)
>                 return NULL;
>         }
>
> -       if (find_free_loopdev())
> +       if (find_free_loopdev() == -1)
>                 return NULL;
>
>         if (attach_device(dev_path, DEV_FILE))
> --
> 2.18.1
>
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
