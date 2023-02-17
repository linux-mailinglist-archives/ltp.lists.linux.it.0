Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3522E69AF7B
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Feb 2023 16:27:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 047333CBE62
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Feb 2023 16:27:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 528DF3CB072
 for <ltp@lists.linux.it>; Fri, 17 Feb 2023 16:27:50 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7891F60067F
 for <ltp@lists.linux.it>; Fri, 17 Feb 2023 16:27:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 444B820418;
 Fri, 17 Feb 2023 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1676647668;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vMhE3Le27+NjJ+19Lhv5F5QcRzT/W+GdZT96SpE50zk=;
 b=VrVBzNMqqTMSJ2bYfvdMc/m0cBf6ehHxEolXmYSjr19eNauWXZSNTwL/3mdg3KL8x+3l8o
 ett/NYjW7NnxyxIhHWEu+E2a5LwfbLW5+HwAk5Scyy2bcC+UImZHb/dS6BnpiX5dlhuuSe
 Q5VOvJiNaelTkeRSait20EcYiqgb9T0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1676647668;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vMhE3Le27+NjJ+19Lhv5F5QcRzT/W+GdZT96SpE50zk=;
 b=gvog4xx/ib5jC8RmutW5KK2FS+DWCzvz8uD44+hcSaogpwmHwBpaH9WQ/Xo1BAAE+PLekt
 iCLvl1TMuzXqfiBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02AA9138E3;
 Fri, 17 Feb 2023 15:27:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mmSkOfOc72MvOAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 17 Feb 2023 15:27:47 +0000
Date: Fri, 17 Feb 2023 16:27:45 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrei Gherzan <andrei.gherzan@canonical.com>
Message-ID: <Y++c8fBZxmUIR3Lb@pevik>
References: <20230216114745.2389810-1-andrei.gherzan@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216114745.2389810-1-andrei.gherzan@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs_fill: Fix test when running on a 256 CPU+
 machine
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Andrei,

> The fs_fill test runs a fill test on all the supported filesystems. One
> of them being vfat. This filesystem is configured dynamically or through
> flags/arguments for its file allocation table type (12/16/32).

> The size of the test device (which is a loop-mounted fs) is 300MB. When not
> instructed, mkfs will "automatically select between 12, 16 and 32 bit,
> whatever fits better for the filesystem size"[1]. In the case of a 300Mb that
> would end up as FAT16.
Interesting. BTW we plan to change 300 MB to minimal filesystem which would fit
to all existing tests (255 MB was for Btrfs, 300 MB was for XFS, but there might
be minimal systems which can use vfat, ext4, ... with smaller resources, e.g.
16 MB for filesystem). Therefore I wonder what is minimal reasonable required
size for vfat. i.e. what MB is required for FAT32? (I guess we don't want to
check FAT12 or FAT16).

> This is linked with another configuration that is the actual impact on
> this issue: the maximum number of directories in the root of the
> filesystem. FAT12 and FAT16 use a special system region: "Root Directory
> Region". And by default (there is also an argument to configure this at
> mkfs-time) this ends up being 256 when no custom arguments are provided.

> On the other hand, the test sets up the filesystem with a
> "tst_ncpus_conf + 2" number of directories in the test filesystem's root
> which can break the limit explained above on systems with a number of
> CPUs that would amount above the limit.

> This change addresses this situation by using a subdirectory in the test
> filesystem which is not subject to this limit.

> Signed-off-by: Andrei Gherzan <andrei.gherzan@canonical.com>
> ---
>  testcases/kernel/fs/fs_fill/fs_fill.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

> diff --git a/testcases/kernel/fs/fs_fill/fs_fill.c b/testcases/kernel/fs/fs_fill/fs_fill.c
> index 2027b6df1..dd8ad2935 100644
> --- a/testcases/kernel/fs/fs_fill/fs_fill.c
> +++ b/testcases/kernel/fs/fs_fill/fs_fill.c
> @@ -18,6 +18,7 @@
>  #include "tst_test.h"

>  #define MNTPOINT "mntpoint"
> +#define THREADS_SUBDIR "subdir"

>  static volatile int run;
>  static unsigned int nthreads;
> @@ -99,9 +100,13 @@ static void setup(void)
>  	nthreads = tst_ncpus_conf() + 2;
>  	workers = SAFE_MALLOC(sizeof(struct worker) * nthreads);

> +	// Avoid creating the thread directories in the root of the filesystem
> +	// to not hit the root entries limit on a  FAT16 filesystem.
> +	SAFE_MKDIR(MNTPOINT "/" THREADS_SUBDIR, 0700);
> +
>  	for (i = 0; i < nthreads; i++) {
>  		snprintf(workers[i].dir, sizeof(workers[i].dir),
> -			 MNTPOINT "/thread%i", i + 1);
> +			 MNTPOINT "/" THREADS_SUBDIR "/thread%i", i + 1);
>  		SAFE_MKDIR(workers[i].dir, 0700);
>  	}

Reviewed-by: Petr Vorel <pvorel@suse.cz>

If you don't mind, I suggest to merge slightly changed patch.

Kind regards,
Petr

+++ testcases/kernel/fs/fs_fill/fs_fill.c
@@ -18,6 +18,7 @@
 #include "tst_test.h"
 
 #define MNTPOINT "mntpoint"
+#define THREADS_DIR MNTPOINT "/subdir"
 
 static volatile int run;
 static unsigned int nthreads;
@@ -99,9 +100,15 @@ static void setup(void)
 	nthreads = tst_ncpus_conf() + 2;
 	workers = SAFE_MALLOC(sizeof(struct worker) * nthreads);
 
+	/*
+	 * Avoid creating the thread directories in the root of the filesystem
+	 * to not hit the root entries limit on a FAT16 filesystem.
+	 */
+	SAFE_MKDIR(THREADS_DIR, 0700);
+
 	for (i = 0; i < nthreads; i++) {
 		snprintf(workers[i].dir, sizeof(workers[i].dir),
-			 MNTPOINT "/thread%i", i + 1);
+			 THREADS_DIR "/thread%i", i + 1);
 		SAFE_MKDIR(workers[i].dir, 0700);
 	}
 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
