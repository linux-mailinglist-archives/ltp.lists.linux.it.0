Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFDB130E3C
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 08:58:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 832CB3C2463
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 08:58:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3E4863C2452
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 08:58:03 +0100 (CET)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0878C200C0B
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 08:58:02 +0100 (CET)
Received: by mail-lj1-x244.google.com with SMTP id h23so50017622ljc.8
 for <ltp@lists.linux.it>; Sun, 05 Jan 2020 23:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BOddFa5zG7yyusHUSKgdHjatzfaewg8F6jxLkvjjCLo=;
 b=I47z+NIxpP0mU1yftp31KUDgvnNz4jh9s6jfo4YXdlGKT74kw6FG8eyzHR85uulo7U
 7OdtdYK7/J2U9HPEm/sxKBKMMpC0VRSTTJhDoXbOv3LMZYm7vKmGpzh0khxPATeenWHl
 zDWjjFcdcHgidmB+j7HaO5zPGOyvQ5su9U3rVY2Rmd1zef1kXK482qqImy7Mz14BeXZK
 rF0H+yUAIUu3z612y+CgZHrYP4tiaI7vwedQkElKloLhaetq2tvyJFLj0joGzSknKO/P
 2NWiltaJIALRz6FLh+iZC6laO7Wi+Bd7Or4q982qG96t/zADEGI4cMFMjpL6kA1MfRLi
 tXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BOddFa5zG7yyusHUSKgdHjatzfaewg8F6jxLkvjjCLo=;
 b=UgPC76QLAaLhVgkIaUE8QLAKJguQ3lTTH6/eIDq2E9lgkqNVp8DqtMd4GbnBGaALUx
 ME7sbKesUhOqEuAuCL+q1mn8UT237w61ioCg9X4FN/GmMcjysIIyeWbi71pkFL3doP5D
 UC/dQVPqQTcyfXKaSTr+da+ccS/wiGSv3Lzare/ET24+3GScI553uwAS0MewXUlXg2pB
 c+mdfrhQzQQUIiI7PSRKgLR4y9sxczu7+mfQTsPftkeaLMYcIVFuvZvFWWRcomemFKwx
 wnXYWGXHvq5F8S2iDUYDueWt+V0y+n+4QJX+yQXArBmVopFXb6keTsKT2XffAFRDqz14
 woUw==
X-Gm-Message-State: APjAAAUENKRfZi8KULgFjl3tPFejtkfvEPIwoaUEeGARYmSvgbnyVmye
 3039t67a82spzlSB34ZiIlG13KSQwbtgMw0qRi0bpRV8M9g=
X-Google-Smtp-Source: APXvYqw3ewLeh7hv9oEi/oY6Lp1RTA4MUT7ZeS8l/vxeXpPjbWGFwK69nt/EFGQB2A0d9cGoUd3FHjaKxUnySLnxqjY=
X-Received: by 2002:a2e:9687:: with SMTP id q7mr51390639lji.232.1578297482224; 
 Sun, 05 Jan 2020 23:58:02 -0800 (PST)
MIME-Version: 1.0
References: <1578289125-2491-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1578289125-2491-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 6 Jan 2020 13:27:50 +0530
Message-ID: <CAFA6WYOPWBeu75DEopZF=+ZWf-QmGZXj0zcL1GTG7S8ZYq5Xbw@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_dev_bytes_written: parsing /proc/diskstats
 instead of sys file
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

On Mon, 6 Jan 2020 at 11:09, Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> Now, tst_dev_bytes_written api can get the whole disk stat correctly(such as /dev/sda),
> but can not get partition stat correctly(such as /dev/sda5).
> fail as below:
> export LTP_DEV=/dev/sda5
> tst_device.c:388: CONF: Test device stat file: /sys/block/sda5/stat not found
>
> To fix this, use /proc/diskstats to parse instead of /sys/block/<devices>/stat.
> Data format as same as diskstats_show function in kernel genhd.c[1].
>
> Also, add hint when loop driver doesn't support blk-mq[2]. So that, user can export
> LTP_DEV to test.
>
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/block/genhd.c
> [2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b5dd2f60
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  lib/tst_device.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>

Overall patch looks good to me but with minor comments below.

> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index 10f71901d..58877c810 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -375,24 +375,22 @@ int tst_umount(const char *path)
>
>  unsigned long tst_dev_bytes_written(const char *dev)
>  {
> -       struct stat st;
> -       unsigned long dev_sec_write = 0, dev_bytes_written, io_ticks = 0;
> -       char dev_stat_path[1024];
> -
> -       snprintf(dev_stat_path, sizeof(dev_stat_path), "/sys/block/%s/stat",
> -                strrchr(dev, '/') + 1);
> +       unsigned long dev_sec_write = 0, dev_bytes_written;
> +       unsigned int io_ticks = 0;
> +       char fmt[1024];
>
> -       if (stat(dev_stat_path, &st) != 0)
> -               tst_brkm(TCONF, NULL, "Test device stat file: %s not found",
> -                        dev_stat_path);
> +       sprintf(fmt, "%%*4d %%*7d %s %%*lu %%*lu %%*lu %%*u %%*lu %%*lu %%lu %%*u %%*u %%u",
> +                       strrchr(dev, '/') + 1);
>
> -       SAFE_FILE_SCANF(NULL, dev_stat_path,
> -                       "%*s %*s %*s %*s %*s %*s %lu %*s %*s %lu",
> -                       &dev_sec_write, &io_ticks);
> +       FILE_LINES_SCANF(NULL, "/proc/diskstats", fmt, &dev_sec_write, &io_ticks);

Shouldn't we use SAFE_FILE_LINES_SCANF() here?

>
> +       /* If we create block device by attaching a free loop device, loop driver
> +        * needs to support blk-mq(commit b5dd2f6047c), so that kernel can get I/O
> +        * statistics about loop device.
> +        */
>         if (!io_ticks)
> -               tst_brkm(TCONF, NULL, "Test device stat file: %s broken",
> -                        dev_stat_path);
> +               tst_brkm(TCONF, NULL, "Test device %s io_ticks is always 0, "
> +                               "exporting LTP_DEV to test", dev);

s/exporting/export/

-Sumit

>
>         dev_bytes_written = (dev_sec_write - prev_dev_sec_write) * 512;
>
> --
> 2.18.0
>
>
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
