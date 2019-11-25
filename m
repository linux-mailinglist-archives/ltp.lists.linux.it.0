Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA31108E5C
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 14:02:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB88A3C2216
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 14:02:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1E9C33C131B
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 14:02:02 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D7A6E20116C
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 14:01:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 12B37AE3A;
 Mon, 25 Nov 2019 13:01:57 +0000 (UTC)
Date: Mon, 25 Nov 2019 14:01:55 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20191125130155.GA8703@rei.lan>
References: <20191120072311.32333-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120072311.32333-1-liwang@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_fill_fs: enhance the filesystem filling
 routine
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
> diff --git a/lib/tst_fill_fs.c b/lib/tst_fill_fs.c
> index 4003dce97..3015c066e 100644
> --- a/lib/tst_fill_fs.c
> +++ b/lib/tst_fill_fs.c
> @@ -6,6 +6,7 @@
>  #include <errno.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> +#include <sys/statvfs.h>
>  
>  #define TST_NO_DEFAULT_MAIN
>  #include "tst_test.h"
> @@ -19,6 +20,8 @@ void tst_fill_fs(const char *path, int verbose)
>  	size_t len;
>  	ssize_t ret;
>  	int fd;
> +	struct statvfs fi;
> +	statvfs(path, &fi);
>  
>  	for (;;) {
>  		len = random() % (1024 * 102400);
> @@ -37,17 +40,20 @@ void tst_fill_fs(const char *path, int verbose)
>  			return;
>  		}
>  
> -		while (len) {
> +		while (len >= fi.f_bsize/2) {
>  			ret = write(fd, buf, MIN(len, sizeof(buf)));
>  
>  			if (ret < 0) {
> +				if (errno == ENOSPC) {
> +					SAFE_FSYNC(fd);
> +					len /= 2;
> +					continue;
> +				}
> +
>  				SAFE_CLOSE(fd);
>  
>  				if (errno != ENOSPC)
>  					tst_brk(TBROK | TERRNO, "write()");
> -
> -				tst_res(TINFO | TERRNO, "write()");
> -				return;
>  			}
>  
>  			len -= ret;

Wouldn't this cause second SAFE_CLOSE() here because we no longer do a
return from from the while loop on ENOSPC?

Why not just:

diff --git a/lib/tst_fill_fs.c b/lib/tst_fill_fs.c
index 4003dce97..2226171d8 100644
--- a/lib/tst_fill_fs.c
+++ b/lib/tst_fill_fs.c
@@ -41,6 +41,13 @@ void tst_fill_fs(const char *path, int verbose)
                        ret = write(fd, buf, MIN(len, sizeof(buf)));
 
                        if (ret < 0) {
+                               /* retry on ENOSPC to make sure filesystem is really full */
+                               if (errno == ENOSPC && len >= fi.f_bsize/2) {
+                                       SAFE_FSYNC(fd);
+                                       len /= 2;
+                                       continue;
+                               }
+
                                SAFE_CLOSE(fd);
 
                                if (errno != ENOSPC)


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
