Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4EE647AC
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 15:57:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8F8F3C1C7C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 15:57:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3D53C3C0715
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 15:57:19 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EBCE61A016D6
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 15:57:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 06281B112;
 Wed, 10 Jul 2019 13:57:16 +0000 (UTC)
Date: Wed, 10 Jul 2019 15:57:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190710135710.GC5628@rei.lan>
References: <5D25B05A.8000600@cn.fujitsu.com>
 <1562755997-5626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562755997-5626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] lib: alter find_free_loopdev()
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
> Alter find_free_loopdev() to return the free loopdev minor
> (and -1 for no free loopdev) and then WE can safely use the
> minor number that find_free_loopdev() returned in test cases.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  doc/test-writing-guidelines.txt |  9 +++++++++
>  include/tst_device.h            |  6 ++++++
>  lib/tst_device.c                | 12 ++++++------
>  3 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
> index c6d4e001d..887801e68 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1045,6 +1045,15 @@ IMPORTANT: All testcases should use 'tst_umount()' instead of 'umount(2)' to
>  -------------------------------------------------------------------------------
>  #include "tst_test.h"
>  
> +int find_free_loopdev();

Once this is exported as public API it should be prefixed with tst_.

> -static int find_free_loopdev(void)
> +int find_free_loopdev(void)
>  {
>  	int ctl_fd, dev_fd, rc, i;
>  	struct loop_info loopinfo;
> @@ -82,10 +82,10 @@ static int find_free_loopdev(void)
>  		if (rc >= 0) {
>  			set_dev_path(rc);
>  			tst_resm(TINFO, "Found free device '%s'", dev_path);
> -			return 0;
> +			return rc;
>  		}
>  		tst_resm(TINFO, "Couldn't find free loop device");
> -		return 1;
> +		return -1;
>  	}
>  
>  	switch (errno) {
> @@ -121,7 +121,7 @@ static int find_free_loopdev(void)
>  				continue;
>  			tst_resm(TINFO, "Found free device '%s'", dev_path);
>  			close(dev_fd);
> -			return 0;
> +			return i;
>  		}
>  
>  		close(dev_fd);
> @@ -129,7 +129,7 @@ static int find_free_loopdev(void)
>  
>  	tst_resm(TINFO, "No free devices found");
>  
> -	return 1;
> +	return -1;
>  }

This needs more changes than this.

The problem here is that the function modifies dev_path which is
returned by tst_acquire_device() so if you call this function after
tst_acquire_device() it will rewrite the dev_path which means that the
test would end up with wrong device path in tst_device->dev.

I guess that the easiest solution would be changing the function to get
buffer parameter which, when non-NULL, is filled with the path.

I.e. the function prototype would became:

int tst_find_free_loopdev(char *path, size_t path_len);

And we would pass the dev_path inside of the tst_device.c and NULL from
the copy_file_range() tests.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
