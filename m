Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 437EB3BE60C
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 11:57:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12EB53C798B
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 11:57:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6B1813C6862
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 11:57:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CE998600912
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 11:57:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0521722498;
 Wed,  7 Jul 2021 09:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625651822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DEsgO3jmHeDVIs9He79XWmXrGTq/ORAAh2cONJ+mQd8=;
 b=nM6SVfK+5L7+I9byrp1PHzE+uIiOEFEnlC2EFfxUVB5TI7Hf0Tmiv3cCqYxOiK+SsSpk9X
 b/rr0MVgL5leqhd8pU8u6PFZo50o9Cq5eAHrcAnmJLhdLrOvtZzkzzX9zc/Q/T1Vf5Yo6K
 90T4QqkiXZYxGAfPppM0C1ZDV3sezxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625651822;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DEsgO3jmHeDVIs9He79XWmXrGTq/ORAAh2cONJ+mQd8=;
 b=mzDZ16W+SvVCsFDvtRxvRjfvz/c19UjK5DBoQmSdJTjsUe2/P4ww3Ao4DzkcQdSMhJPHgK
 nYjOaG6v8pNswkDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D536A13AC4;
 Wed,  7 Jul 2021 09:57:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OntqM2165WA8VwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 07 Jul 2021 09:57:01 +0000
Date: Wed, 7 Jul 2021 11:31:25 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YOV0bemK+1NI0Cz4@yuki>
References: <20210705082527.855688-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210705082527.855688-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: limit the size of tmpfs in LTP
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
>  lib/tst_test.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 55449c80b..93761868e 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -882,8 +882,35 @@ static void prepare_and_mount_dev_fs(const char *mntpoint)
>  	}
>  }
>  
> +static char *limit_tmpfs_mount_size(const char *mnt_data,
> +			char *buf, size_t buf_size, const char *fs_type)
> +{
> +	int fd;
> +	uint64_t dev_size;
> +
> +	if (strcmp(fs_type, "tmpfs"))
> +		return mnt_data;
> +
> +	fd = SAFE_OPEN(tdev.dev, O_RDONLY);
> +	SAFE_IOCTL(fd, BLKGETSIZE64, &dev_size);
> +	SAFE_CLOSE(fd);

We can as well add size to the struct tst_device and fill it in when
device is created, that would be a slightly cleaner solution.

Other than this the rest looks good.

> +	dev_size = dev_size/1024/1024;
> +
> +	if (mnt_data)
> +		snprintf(buf, buf_size, "%s,size=%luM", mnt_data, dev_size);
> +	else
> +		snprintf(buf, buf_size, "size=%luM", dev_size);
> +
> +	tst_res(TINFO, "Limiting tmpfs size to %luMB", dev_size);
> +
> +	return buf;
> +}
> +
>  static void prepare_device(void)
>  {
> +	char *mnt_data, buf[1024];
> +
>  	if (tst_test->format_device) {
>  		SAFE_MKFS(tdev.dev, tdev.fs_type, tst_test->dev_fs_opts,
>  			  tst_test->dev_extra_opts);
> @@ -896,8 +923,11 @@ static void prepare_device(void)
>  	}
>  
>  	if (tst_test->mount_device) {
> +		mnt_data = limit_tmpfs_mount_size(tst_test->mnt_data,
> +				buf, sizeof(buf), tdev.fs_type);
> +
>  		SAFE_MOUNT(tdev.dev, tst_test->mntpoint, tdev.fs_type,
> -			   tst_test->mnt_flags, tst_test->mnt_data);
> +			   tst_test->mnt_flags, mnt_data);
>  		mntpoint_mounted = 1;
>  	}
>  }
> -- 
> 2.31.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
