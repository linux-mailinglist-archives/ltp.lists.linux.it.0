Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 07212233074
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 12:38:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 727943C4BFD
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 12:38:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 906363C260D
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 12:38:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B9DBA601230
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 12:38:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CF41ABE9;
 Thu, 30 Jul 2020 10:38:13 +0000 (UTC)
Date: Thu, 30 Jul 2020 12:38:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200730103822.GC3457@yuki.lan>
References: <20200722125946.GA22573@yuki.lan>
 <1595556357-29932-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595556357-29932-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200729113946.GB7152@yuki.lan>
 <924c3fc1-c56c-a752-0720-bb12d6cf8ec0@cn.fujitsu.com>
 <20200730092802.GA3457@yuki.lan>
 <8d7cf7a7-1408-877c-05f2-e5566d7717d1@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d7cf7a7-1408-877c-05f2-e5566d7717d1@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] syscalls/ioctl_loop05: Using
 LOOP_CONFIGURE to set direct io
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

Hi!
> index 8d8bc5b40..bdd93f19e 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -497,17 +497,30 @@ unsigned long tst_dev_bytes_written(const char *dev)
> 
>   void tst_find_backing_dev(const char *path, char *dev)
>   {
> -       char fmt[1024];
> +       char fmt[20];
>          struct stat buf;
> +       FILE *file;
> +       char line[PATH_MAX];
> +       char *pre = NULL;
> +       char *next = NULL;
> 
>          if (stat(path, &buf) < 0)
>                   tst_brkm(TWARN | TERRNO, NULL, "stat() failed");
> 
> -       snprintf(fmt, sizeof(fmt), "%%*i %%*i %u:%u %%*s %%*s %%*s %%*s 
> %%*s %%*s %%s %%*s",
> -                       major(buf.st_dev), minor(buf.st_dev));
> +       snprintf(fmt, sizeof(fmt), "%u:%u", major(buf.st_dev), 
> minor(buf.st_dev));
> +       file = SAFE_FOPEN(NULL, "/proc/self/mountinfo", "r");
> 
> -       SAFE_FILE_LINES_SCANF(NULL, "/proc/self/mountinfo", fmt, dev);
> +       while (fgets(line, sizeof(line), file)) {
> +               if (strstr(line, fmt) != NULL) {
> +                       pre = strstr(line, " - ");
> +                       pre = strtok_r(pre, " ", &next);
> +                       pre = strtok_r(NULL, " ", &next);
> +                       pre = strtok_r(NULL, " ", &next);
> +                       strcpy(dev, pre);

We should break; here as well, since we already found the result.

> +               }
> +       }
> 
> +       SAFE_FCLOSE(NULL, file);
>          if (stat(dev, &buf) < 0)
>                   tst_brkm(TWARN | TERRNO, NULL, "stat(%s) failed", dev);

Otherwise it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
