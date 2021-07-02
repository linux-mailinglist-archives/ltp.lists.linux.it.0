Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7DA3B9E81
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 11:46:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBF4E3C8259
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 11:46:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 784B93C6ADD
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 11:46:37 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AC306601D4A
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 11:46:36 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 995C421FB2;
 Fri,  2 Jul 2021 09:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625219195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yo6RPCO4EhnihFIZhjgjWoUWlh7sf8BkWfNK+MmdVgo=;
 b=os1naMBKhlh495X9hcS6pimJLRgtf4bUP3p+PBWrvJabnD6bHmJWKDaA+YPZXx8q2USW58
 MlTiIBczjDx6EJpibzeBTQHv4pzd1BoaeJ+BZVXAuilYUsChPa9N7QB9+ywuWgyTpojUJv
 zV1RWRn01BowDlR+jye5W/0N9oNHPEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625219195;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yo6RPCO4EhnihFIZhjgjWoUWlh7sf8BkWfNK+MmdVgo=;
 b=LF/OAR8TyFkzIP3w6AWvGNN6BCAkjHJ0+Kodgu8V0Sti/NETuOyW1jGp0B8/XKkoBdh9fi
 hKu4LgxEvgA7/7Ag==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 74E6C11CD6;
 Fri,  2 Jul 2021 09:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625219195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yo6RPCO4EhnihFIZhjgjWoUWlh7sf8BkWfNK+MmdVgo=;
 b=os1naMBKhlh495X9hcS6pimJLRgtf4bUP3p+PBWrvJabnD6bHmJWKDaA+YPZXx8q2USW58
 MlTiIBczjDx6EJpibzeBTQHv4pzd1BoaeJ+BZVXAuilYUsChPa9N7QB9+ywuWgyTpojUJv
 zV1RWRn01BowDlR+jye5W/0N9oNHPEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625219195;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yo6RPCO4EhnihFIZhjgjWoUWlh7sf8BkWfNK+MmdVgo=;
 b=LF/OAR8TyFkzIP3w6AWvGNN6BCAkjHJ0+Kodgu8V0Sti/NETuOyW1jGp0B8/XKkoBdh9fi
 hKu4LgxEvgA7/7Ag==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id +AiZGnvg3mBASgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 02 Jul 2021 09:46:35 +0000
Date: Fri, 2 Jul 2021 11:21:00 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YN7afAs3Mup5UbIf@yuki>
References: <20210701055208.715395-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210701055208.715395-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: limit the size of tmpfs in LTP
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
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  include/tst_device.h |  7 +++++++
>  lib/tst_device.c     | 15 +++++++++++++++
>  lib/tst_test.c       | 10 ++++++++++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/include/tst_device.h b/include/tst_device.h
> index 1d1246e82..51bde4190 100644
> --- a/include/tst_device.h
> +++ b/include/tst_device.h
> @@ -31,6 +31,13 @@ int tst_umount(const char *path);
>  int tst_is_mounted(const char *path);
>  int tst_is_mounted_at_tmpdir(const char *path);
>  
> +/*
> + * Limit the tmpfs mount size for LTP test
> + * @mnt_data: mount options from tst_test->mnt_data
> + * @size: tmpfs size to be mounted
> + */
> +char *limit_tmpfs_mount_size(const char *mnt_data, unsigned int size);

If we want this function to be public it has to be prefixed with 'tst_'.

Also do we really need this to be public?

>  /*
>   * Clears a first few blocks of the device. This is needed when device has
>   * already been formatted with a filesystems, subset of mkfs.foo utils aborts
> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index c096b418b..66a830b7b 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -45,6 +45,7 @@
>  #define DEV_FILE "test_dev.img"
>  #define DEV_SIZE_MB 256u
>  
> +static char tmpfs_buf[1024];

Can we please, instead of adding a global variable, pass the buffer and
it's size to the limit_tmpfs_mount size, and then create the path on the
stack in the prepare device function?

>  static char dev_path[1024];
>  static int device_acquired;
>  static unsigned long prev_dev_sec_write;
> @@ -368,6 +369,20 @@ int tst_clear_device(const char *dev)
>  	return 0;
>  }
>  
> +char *limit_tmpfs_mount_size(const char *mnt_data, unsigned int size)
> +{
> +	unsigned int dev_size = MAX(size, DEV_SIZE_MB);
> +
> +	if (mnt_data)
> +		snprintf(tmpfs_buf, sizeof(tmpfs_buf), "%s,size=%uM", mnt_data, dev_size);
> +	else
> +		snprintf(tmpfs_buf, sizeof(tmpfs_buf), "size=%uM", dev_size);
> +
> +	tst_resm(TINFO, "Limiting tmpfs size to %uMB", dev_size);
> +
> +	return tmpfs_buf;
> +}

If we passed the filesystem type to this function here as well we could
do:

	if (!strcmp(fs_type, "tmpfs"))
		return mnt_data;

As a first thing in this function and then we could pass the return
value from this function to the SAFE_MOUNT() unconditionally.

>  int tst_umount(const char *path)
>  {
>  	int err, ret, i;
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 55449c80b..27766fbfd 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -896,9 +896,19 @@ static void prepare_device(void)
>  	}
>  
>  	if (tst_test->mount_device) {
> +		char *mnt_data = tst_test->mnt_data;
> +
> +		if (!strcmp(tdev.fs_type, "tmpfs")) {
> +			tst_test->mnt_data = limit_tmpfs_mount_size(tst_test->mnt_data,
> +					tst_test->dev_min_size);
> +		}
> +
>  		SAFE_MOUNT(tdev.dev, tst_test->mntpoint, tdev.fs_type,
>  			   tst_test->mnt_flags, tst_test->mnt_data);
>  		mntpoint_mounted = 1;
> +
> +		if (!strcmp(tdev.fs_type, "tmpfs"))
> +			tst_test->mnt_data = mnt_data;

I guess that we are doing this in order to export the changes in the
mnt_data to the test, right?

Is that needed for something or are you doing this just in a case that
somebody will use that?

>  	}
>  }
>  
> -- 
> 2.31.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
