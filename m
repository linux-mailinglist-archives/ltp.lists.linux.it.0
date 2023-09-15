Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2321F7A18C2
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Sep 2023 10:27:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B655E3CE69E
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Sep 2023 10:27:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D2C093CB0E7
 for <ltp@lists.linux.it>; Fri, 15 Sep 2023 10:27:27 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E21FA60154B
 for <ltp@lists.linux.it>; Fri, 15 Sep 2023 10:27:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DBE682185F;
 Fri, 15 Sep 2023 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1694766445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e/9cmRl5h5dk9/6GIiA/UL/CcKYJr741B4XrAqoH0bo=;
 b=HhPUUVPIKYDk4cHDfHf9NUBAcx1eQaUNE/HIu/4IMcIIBO+VqlirOobpmx5kvEYGwC+/cy
 f2C/ycBwAruaMhMRBCbZtCDlxAFDEZSRFsCSF5kZKhixgraZRHktj2jAArBrwl7wmX0/NX
 S0ElwK2hqPilCwjbqTErK1rD8ubHfvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1694766445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e/9cmRl5h5dk9/6GIiA/UL/CcKYJr741B4XrAqoH0bo=;
 b=ZVLDXUygJOL75iPXLdPy3UYa2DvtxRIJKVzCXK+7tySblAXSy9j9w4Yzkl9GLHYiDeUVhi
 FTit6oqQ4mDDOwDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA31F1358A;
 Fri, 15 Sep 2023 08:27:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kqaDMG0VBGUYQQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 15 Sep 2023 08:27:25 +0000
Date: Fri, 15 Sep 2023 10:28:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <ZQQVm5p08PmHRX1A@yuki>
References: <20230903111558.2603332-1-amir73il@gmail.com>
 <20230903111558.2603332-2-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230903111558.2603332-2-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] fanotify13: Test watching overlayfs upper fs
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> ---
>  lib/tst_fs_setup.c                            |  2 +-
>  testcases/kernel/syscalls/fanotify/fanotify.h | 21 +++++++
>  .../kernel/syscalls/fanotify/fanotify13.c     | 62 +++++++++++++++++--
>  3 files changed, 79 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/tst_fs_setup.c b/lib/tst_fs_setup.c
> index 6b93483de..30673670f 100644
> --- a/lib/tst_fs_setup.c
> +++ b/lib/tst_fs_setup.c
> @@ -42,7 +42,7 @@ int mount_overlay(const char *file, const int lineno, int skip)
>  			tst_res_(file, lineno, TINFO,
>  				TST_FS_SETUP_OVERLAYFS_MSG);
>  		}
> -	} else {
> +	} else if (skip) {
>  		tst_brk_(file, lineno, TBROK | TERRNO,
>  			"overlayfs mount failed");
>  	}

The skip flag should be called strict, at least that is what we usually
name it, but that is very minor.

...

>  static struct tst_test test = {
>  	.test = do_test,
>  	.tcnt = ARRAY_SIZE(test_cases),
> +	.test_variants = 2,
>  	.setup = do_setup,
>  	.cleanup = do_cleanup,
>  	.needs_root = 1,
>  	.mount_device = 1,
> -	.mntpoint = MOUNT_PATH,
> +	.mntpoint = OVL_BASE_MNTPOINT,
>  	.all_filesystems = 1,
>  	.tags = (const struct tst_tag[]) {
>  		{"linux-git", "c285a2f01d69"},

The git hash for the regression test with variant=1 should have been
added here.


The rest looks good to me. With the two minor issues fixed:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

@Peter Vorel Feel free to push the patch with the two fixes applied.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
