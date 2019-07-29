Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2B878C28
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 15:01:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42C1D3C1D26
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 15:01:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 452493C1D10
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 15:01:10 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 10412200DE1
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 15:01:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4D911AFB6;
 Mon, 29 Jul 2019 13:01:08 +0000 (UTC)
Date: Mon, 29 Jul 2019 15:01:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190729130107.GA27006@rei.lan>
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 1/3] lib: alter find_free_loopdev()
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
> +int tst_find_free_loopdev(const char *path, size_t path_len);
>  /*
>   * Reads test block device stat file and returns the bytes written since the
>   * last call of this function.
> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index 65fcc1337..f2516fb08 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -53,22 +53,22 @@ static const char *dev_variants[] = {
>  	"/dev/block/loop%i"
>  };
>  
> -static int set_dev_path(int dev)
> +static int set_dev_path(int dev, char *path, size_t path_len)
>  {
>  	unsigned int i;
>  	struct stat st;
>  
>  	for (i = 0; i < ARRAY_SIZE(dev_variants); i++) {
> -		snprintf(dev_path, sizeof(dev_path), dev_variants[i], dev);
> +		snprintf(path, path_len, dev_variants[i], dev);
>  
> -		if (stat(dev_path, &st) == 0 && S_ISBLK(st.st_mode))
> +		if (stat(path, &st) == 0 && S_ISBLK(st.st_mode))
>  			return 1;
>  	}
>  
>  	return 0;
>  }
>  
> -static int find_free_loopdev(void)
> +int tst_find_free_loopdev(char *path, size_t path_len)
>  {
>  	int ctl_fd, dev_fd, rc, i;
>  	struct loop_info loopinfo;
> @@ -80,12 +80,14 @@ static int find_free_loopdev(void)
>  		rc = ioctl(ctl_fd, LOOP_CTL_GET_FREE);
>  		close(ctl_fd);
>  		if (rc >= 0) {
> -			set_dev_path(rc);
> -			tst_resm(TINFO, "Found free device '%s'", dev_path);
> -			return 0;
> +			if (path)
> +				set_dev_path(rc, path, path_len);
> +			tst_resm(TINFO, "Found free device %d '%s'",
> +				rc, path ?: "");
> +			return rc;
>  		}
>  		tst_resm(TINFO, "Couldn't find free loop device");
> -		return 1;
> +		return -1;
>  	}
>  
>  	switch (errno) {
> @@ -104,24 +106,24 @@ static int find_free_loopdev(void)
>  	 * Older way is to iterate over /dev/loop%i and /dev/loop/%i and try
>  	 * LOOP_GET_STATUS ioctl() which fails for free loop devices.
>  	 */
> -	for (i = 0; i < 256; i++) {
> +	for (i = 0; path && i < 256; i++) {

There is still a small problem here in the fallback code for older
kernels. The way we detect a free device there is by opening the device
and doing the LOOP_GET_STATUS ioctl(). So by disabling this loop if path
is not set we broke the detection on older kernels when NULL is passed
to the function.

We should work with a local temporary path in this loop and copy it over
to the path if we are succesfull and if path is not NULL.

> -		if (!set_dev_path(i))
> +		if (!set_dev_path(i, path, path_len))
>  			continue;
>  
> -		dev_fd = open(dev_path, O_RDONLY);
> +		dev_fd = open(path, O_RDONLY);
>  
>  		if (dev_fd < 0)
>  			continue;
>  
>  		if (ioctl(dev_fd, LOOP_GET_STATUS, &loopinfo) == 0) {
> -			tst_resm(TINFO, "Device '%s' in use", dev_path);
> +			tst_resm(TINFO, "Device '%s' in use", path);
>  		} else {
>  			if (errno != ENXIO)
>  				continue;
> -			tst_resm(TINFO, "Found free device '%s'", dev_path);
> +			tst_resm(TINFO, "Found free device '%s'", path);
>  			close(dev_fd);
> -			return 0;
> +			return i;
>  		}
>  
>  		close(dev_fd);
> @@ -129,7 +131,7 @@ static int find_free_loopdev(void)
>  
>  	tst_resm(TINFO, "No free devices found");
>  
> -	return 1;
> +	return -1;
>  }

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
