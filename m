Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297D305752
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 10:49:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36FD73C79F0
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 10:49:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 82AD03C5D1D
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 10:49:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 26579600747
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 10:49:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 883B0ADA2;
 Wed, 27 Jan 2021 09:49:07 +0000 (UTC)
Date: Wed, 27 Jan 2021 10:50:13 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
Message-ID: <YBE3VUzecdhq7gJQ@yuki.lan>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
 <CAEemH2csSFf7Ujz8H+KV7hTdmDVsxn5_oW2JZbwY=NsJUSat_w@mail.gmail.com>
 <2021012714540739834212@chinatelecom.cn>
 <CAEemH2dhpbm19HEaHkhv1WE+70VkDjM9C5L1-KJZqPX2G2BgrQ@mail.gmail.com>
 <2021012716492236006117@chinatelecom.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2021012716492236006117@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
 invoked oom-killer
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Signed-off-by: Xinpeng Liu <liuxp11@chinatelecom.cn>
> ---
>  lib/tst_memutils.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
> index dd09db4..21df9a8 100644
> --- a/lib/tst_memutils.c
> +++ b/lib/tst_memutils.c
> @@ -10,14 +10,33 @@
> 
>  #define TST_NO_DEFAULT_MAIN
>  #include "tst_test.h"
> +#include "tst_safe_stdio.h"
> 
>  #define BLOCKSIZE (16 * 1024 * 1024)
> 
> +static unsigned long get_available_ram(void)
> +{

Can we prefix this function with tst_ and make it non-static?

I guess that there may be other tests that may use it later on.

> +       char buf[60]; /* actual lines we expect are ~30 chars or less */
> +       unsigned long available_kb = 0;
> +       FILE *fp;
> +
> +       fp = SAFE_FOPEN("/proc/meminfo","r");
> +       while (fgets(buf, sizeof(buf), fp)) {
> +               if (sscanf(buf, "MemAvailable: %lu %*s\n", &available_kb) == 1){
> +                       break;
> +               }
> +       }
> +       SAFE_FCLOSE(fp);

Just use FILE_LINES_SCANF() instead.

Also we should fall back to something as 90% of (MemFree + Cached) here
if MemAvailable is not present so that the function returns sensible
number on older kernels as well.

> +       return 1024 * available_kb;

Can we just return kilobytes instead?

It will be less likely to overflow if we do all the calculations in
kilobytes instead.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
