Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B15C6B9D6
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 12:14:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3652F3C1D39
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 12:14:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E8C4A3C1CA0
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 12:14:34 +0200 (CEST)
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 39F6C6998F9
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 12:14:34 +0200 (CEST)
Received: by mail-yb1-xb43.google.com with SMTP id j6so797028ybm.7
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 03:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cCsDtbniZUMINuxyZUJU41t6wIrDPZsRrMB72Seuh+I=;
 b=u+b9X5senTyvlDXwTeGre5HpedGDDkPamqDPqq0MxmOaCP2BAW+YlLmN8i/iYDDN43
 F37w6B5Vrz23xGtGvZX8N2aBtbR2SUCPkBWD7lzd3jx5Tc/Um+zljL5Nt/C1bmRuyYtP
 6sLEAN/Lb0RO5ySlscW3g1X+KFNB4gNGk5OTPBqeu7Pc0QYd3XtW+oyu26X2vxbXmG6c
 pGAww0XCfh4YXsLZjVtnH8VX3VK94VRqqD3j58A+SMEgFGhkAXobOGCUHhK5JjIya/PS
 F8qIsfneNJq1V5iuzniWCKybXrLKpx69hGO9TvXeguLM8Bfmz0SCEfs38iPrg+SkiDC9
 8vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cCsDtbniZUMINuxyZUJU41t6wIrDPZsRrMB72Seuh+I=;
 b=Cqm3Od0T9Em7owGHsrXuQ+1p+w3SL1kCepsK6F91Np4Js78NVL2UHRwSIQL7zKvkm3
 HLSElLlbCs+QdlZftGQDL/jQHU07Vj/fwAI+Vg2mbvBB8Bv1A+0Mk0v/1u33L3djBL5p
 lgPu21RqZOhg49zbPB2FIVfxhgNN/aw6G/39SmjcMHM391HwDi5NskvpoND5dvQdR1cD
 alGk910HlUUdzxafjybvOy8JGjxeJLui8cJ92efwWr9ueGI0yXYwVOKk1b7YokwglD9B
 f0YNx+CSVP+s+LhnOnX1LbyUhJyXNapx35sVuKoL7B96AZA4/dBMd1Ws5j33fSzQSa7a
 b2kw==
X-Gm-Message-State: APjAAAUar936icYsJk2XsLnmqHg/zUJHWz91mSmP9SU1LISN9b2XtqXs
 POHHbHrJVHCPQMX0pn1oPh3P/2/Y5peJCFxRje0hy3l+
X-Google-Smtp-Source: APXvYqx9Ej8CjjWLccQ3FhwZ1ciWnUFHBQVFOEW31eU1hziLoSvC2hy4lO5s5YiahsFpeaOjRSHJ/cenGgFbyBKAL+I=
X-Received: by 2002:a25:8143:: with SMTP id j3mr3876669ybm.132.1563358472957; 
 Wed, 17 Jul 2019 03:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190711125108.GB8709@rei>
 <1563356676-2384-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1563356676-2384-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 17 Jul 2019 13:14:21 +0300
Message-ID: <CAOQ4uxiV_weQXVnDn0vFq5exk=Z_F=70Lk1D+783fOV=hsf_6A@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/3] lib: alter find_free_loopdev()
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

On Wed, Jul 17, 2019 at 12:45 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> Alter find_free_loopdev() to tst_find_free_loopdev(path, path_len),
> it passes the dev_path inside of the tst_device.c and NULL from other
> tests. It returns the free loopdev minor (and -1 for no free loopdev).
> We can call tst_find_free_loopdev(NULL, 0) to get a free minor number
> without changing lib internal state.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  doc/test-writing-guidelines.txt | 12 ++++++++++++
>  include/tst_device.h            |  5 +++++
>  lib/tst_device.c                | 34 +++++++++++++++++----------------
>  3 files changed, 35 insertions(+), 16 deletions(-)
>
> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
> index 4b1e7d25b..c65c707e6 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1045,6 +1045,18 @@ IMPORTANT: All testcases should use 'tst_umount()' instead of 'umount(2)' to
>  -------------------------------------------------------------------------------
>  #include "tst_test.h"
>
> +int tst_find_free_loopdev(const char *path, size_t path_len);
> +-------------------------------------------------------------------------------
> +
> +This function finds a free loopdev and returns the free loopdev minor (-1 for no
> +free loopdev). If path is non-NULL, it will be filled with free loopdev path.
> +We can call tst_find_free_loopdev(NULL, 0) in tests to get a free minor number
> +without changing lib internal state.
> +
> +[source,c]
> +-------------------------------------------------------------------------------
> +#include "tst_test.h"
> +
>  unsigned long tst_dev_bytes_written(const char *dev);
>  -------------------------------------------------------------------------------
>
> diff --git a/include/tst_device.h b/include/tst_device.h
> index 61902b7e0..42b9fa95b 100644
> --- a/include/tst_device.h
> +++ b/include/tst_device.h
> @@ -44,6 +44,11 @@ int tst_umount(const char *path);
>   */
>  int tst_clear_device(const char *dev);
>
> +/*
> + * Finds a free loop device for use and returns the free loopdev minor(-1 for no
> + * free loopdev). If path is non-NULL, it will be filled with free loopdev path.
> + */
> +int tst_find_free_loopdev(const char *path, size_t path_len);
>  /*
>   * Reads test block device stat file and returns the bytes written since the
>   * last call of this function.
> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index 65fcc1337..f2516fb08 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -53,22 +53,22 @@ static const char *dev_variants[] = {
>         "/dev/block/loop%i"
>  };
>
> -static int set_dev_path(int dev)
> +static int set_dev_path(int dev, char *path, size_t path_len)
>  {
>         unsigned int i;
>         struct stat st;
>
>         for (i = 0; i < ARRAY_SIZE(dev_variants); i++) {
> -               snprintf(dev_path, sizeof(dev_path), dev_variants[i], dev);
> +               snprintf(path, path_len, dev_variants[i], dev);
>
> -               if (stat(dev_path, &st) == 0 && S_ISBLK(st.st_mode))
> +               if (stat(path, &st) == 0 && S_ISBLK(st.st_mode))
>                         return 1;
>         }
>
>         return 0;
>  }
>
> -static int find_free_loopdev(void)
> +int tst_find_free_loopdev(char *path, size_t path_len)

Another option is to leave this function internal and export a wrapper
for the exact needed functionality:

/* Just find a free minor number */
int tst_find_free_loopdev(void)
{
        return find_free_loopdev(NULL, 0);
}

I don't mind wither way.

>  {
>         int ctl_fd, dev_fd, rc, i;
>         struct loop_info loopinfo;
> @@ -80,12 +80,14 @@ static int find_free_loopdev(void)
>                 rc = ioctl(ctl_fd, LOOP_CTL_GET_FREE);
>                 close(ctl_fd);
>                 if (rc >= 0) {
> -                       set_dev_path(rc);
> -                       tst_resm(TINFO, "Found free device '%s'", dev_path);
> -                       return 0;
> +                       if (path)
> +                               set_dev_path(rc, path, path_len);
> +                       tst_resm(TINFO, "Found free device %d '%s'",
> +                               rc, path ?: "");
> +                       return rc;
>                 }
>                 tst_resm(TINFO, "Couldn't find free loop device");
> -               return 1;
> +               return -1;
>         }
>
>         switch (errno) {
> @@ -104,24 +106,24 @@ static int find_free_loopdev(void)
>          * Older way is to iterate over /dev/loop%i and /dev/loop/%i and try
>          * LOOP_GET_STATUS ioctl() which fails for free loop devices.
>          */
> -       for (i = 0; i < 256; i++) {
> +       for (i = 0; path && i < 256; i++) {
>
> -               if (!set_dev_path(i))
> +               if (!set_dev_path(i, path, path_len))
>                         continue;
>
> -               dev_fd = open(dev_path, O_RDONLY);
> +               dev_fd = open(path, O_RDONLY);
>
>                 if (dev_fd < 0)
>                         continue;
>
>                 if (ioctl(dev_fd, LOOP_GET_STATUS, &loopinfo) == 0) {
> -                       tst_resm(TINFO, "Device '%s' in use", dev_path);
> +                       tst_resm(TINFO, "Device '%s' in use", path);
>                 } else {
>                         if (errno != ENXIO)
>                                 continue;
> -                       tst_resm(TINFO, "Found free device '%s'", dev_path);
> +                       tst_resm(TINFO, "Found free device '%s'", path);
>                         close(dev_fd);
> -                       return 0;
> +                       return i;
>                 }
>
>                 close(dev_fd);
> @@ -129,7 +131,7 @@ static int find_free_loopdev(void)
>
>         tst_resm(TINFO, "No free devices found");
>
> -       return 1;
> +       return -1;
>  }
>
>  static int attach_device(const char *dev, const char *file)
> @@ -274,7 +276,7 @@ const char *tst_acquire_device__(unsigned int size)
>                 return NULL;
>         }
>
> -       if (find_free_loopdev())
> +       if (tst_find_free_loopdev(dev_path, sizeof(dev_path)) == -1)
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
