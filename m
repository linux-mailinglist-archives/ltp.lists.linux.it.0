Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A48130F46
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 10:16:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CABED3C24AD
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 10:16:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E6C213C2463
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 10:16:36 +0100 (CET)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2B86C600BB2
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 10:16:36 +0100 (CET)
Received: by mail-lj1-x241.google.com with SMTP id l2so50200873lja.6
 for <ltp@lists.linux.it>; Mon, 06 Jan 2020 01:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/PwnthFt5Goi+BRxXbq1ROtP9cYWVnL0NQYzGLAAw2s=;
 b=Be5SVWw1wd6HPy+fWjJqgRruz0gFOTqVo19EeQKBMnUL9OW9rWmvMCkIZpTKsFoF06
 aRKrDhFJyGy5U+k17+QozT8zNAokCeVulc3GcBEcEhMd5TEMp4beQVDdXpkGstRKnlgA
 Y9JN7P29Eio1gxBAGaj8RAWKhRe5eeJRxq8OJ0mWVvyt/q9TMq5QRTWknChdA7xZ0ZrT
 npKwz0MfqQJuA6LSEhnxf9ufKLrGosZY5SMugPqKgBHgxum2qVBQ+VDI0ToWa6Pq3qlG
 oy+t2yPa8ShN7A8gpBr2jgjbE8bVtI/j++j5sQpa58mx0p9ZDpHzNd5wS4xfpaJXYwNq
 bGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/PwnthFt5Goi+BRxXbq1ROtP9cYWVnL0NQYzGLAAw2s=;
 b=lhLJiXyHOScVUNxgsOqFIMx/60koHbFVCnAaQx4Aq4ItAXuoASOEPls9Le+dgVfD47
 5dW6YoF88HWpm3wh0Tf0xBlCQSNPMkTxY1o6T+ibIynVt4RvOrbyRyg0Q+yPjPjMrWwx
 X0beyVQurFtPmMzhW8cZWtuurv47xLpVidt5HgWBILTF0ggYEYPrU69Gy+AHqxeqztfM
 hzPrwa2rifos1pDZmlFZjaq7x3xHX795ko+Y41GymEfR4hiqGz9kRdLf/1YT6F18+FvO
 qAI91CH8Ka/A3Aqgc31NZZ5Y3Qywa5RD73g6KI4/OYRM7xKJ4vzmtz2QAPa39Yks/l2X
 MXbQ==
X-Gm-Message-State: APjAAAVkKhv9HJ1HKaoOfsmY98H7PRje04eXWp109hUokdVBaToK7KY0
 2PM8WzFZa7eE89yFMKQYion8ySxjvienbD3Lp3+2fvSdfgI=
X-Google-Smtp-Source: APXvYqwCpQnp1uvARxWqcrp0R1qcM+iC/XRujk3p0ddu5YNvl/XSwTIa/OXM+BFeXqt/AGGQnNu5OCfuUpucGez3roU=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr57837770ljj.191.1578302195566; 
 Mon, 06 Jan 2020 01:16:35 -0800 (PST)
MIME-Version: 1.0
References: <1578299418-4961-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1578299418-4961-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 6 Jan 2020 14:46:24 +0530
Message-ID: <CAFA6WYMqnwT_m+hY8nO_w=EH3nSDL+hpxqBQKgp0gN2BsV-f6w@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_dev_bytes_written: parsing /proc/diskstats
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

On Mon, 6 Jan 2020 at 14:00, Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
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

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index 10f71901d..ad764a38d 100644
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
> +       SAFE_FILE_LINES_SCANF(NULL, "/proc/diskstats", fmt, &dev_sec_write, &io_ticks);
>
> +       /* If we create block device by attaching a free loop device, loop driver
> +        * needs to support blk-mq(commit b5dd2f6047c), so that kernel can get I/O
> +        * statistics about loop device.
> +        */
>         if (!io_ticks)
> -               tst_brkm(TCONF, NULL, "Test device stat file: %s broken",
> -                        dev_stat_path);
> +               tst_brkm(TCONF, NULL, "io_ticks on test device %s is always 0, "
> +                               "export LTP_DEV to test", dev);
>
>         dev_bytes_written = (dev_sec_write - prev_dev_sec_write) * 512;
>
> --
> 2.18.0
>
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
