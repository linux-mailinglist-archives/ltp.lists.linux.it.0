Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E82AFF0E3
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jul 2025 20:27:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1752085644; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=KNg8FQA3za3hEXzAlgrtg7IsePgp7+dBKiYNbRm8STc=;
 b=LlADwLUENwzNnsGBphvlGyzhOBiBhLPzGf44VbVWmcS7NMQLL9rRpj/lDpptJLpDifXQ/
 pcdLHKU2zI1kq2fSySNF0wd418JCGiUJ+6u9h1nKSXYtDJfz9kGEK6ddLXNDwqxUrIGVWKu
 NRlxXpDx6K6B0o5i/OiVq5xQO5lPtAI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86A883CAE86
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jul 2025 20:27:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B573A3C2707
 for <ltp@lists.linux.it>; Wed,  9 Jul 2025 20:27:11 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 97E0A600625
 for <ltp@lists.linux.it>; Wed,  9 Jul 2025 20:27:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F71C5C6AB3;
 Wed,  9 Jul 2025 18:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF20CC4CEF4;
 Wed,  9 Jul 2025 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752085626;
 bh=TkEtI4TBo+oLh+9EDnF1wp+1HPKjhz3UEa6azIGpx8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A0eLWdrX2EjFSwq0YRgjpLMGmLYq9wZ/5E1px/SdSaCuRcpGJhnSpY8Av8ZaTHqnF
 2uanjGMyhegxve7PCLAzmnAJEd4kQMd0IiqGJ9tI2Vj2UPsTM+oMXiK8QoCyhUwQl/
 Dfonxy1bBUy7AsVN/OT/ASxMcZ0SViomyGzvHtmu8g/8m/Zx1/AVhjFdSle0slHTAt
 +GwxwOSxKqU4/aW2UujOh/Hc3WHYx9pWBjMtxs1CMtHussLvrBzR5HN9Cfi9Qn4FXS
 0XSYsbHW8a8Untd/Sgxnm68Px4swGCddzbFY3Hn/sNUyRnTBOCcbrpFWZJ4lYn5S2w
 Q6Ge/2SbPzkYQ==
Date: Wed, 9 Jul 2025 11:27:06 -0700
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20250709182706.GF2672070@frogsfrogsfrogs>
References: <20250709181030.236190-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250709181030.236190-1-arnd@kernel.org>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] block: fix FS_IOC_GETLBMD_CAP parsing in
 blkdev_common_ioctl()
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
From: "Darrick J. Wong via ltp" <ltp@lists.linux.it>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Kanchan Joshi <joshi.k@samsung.com>, Eric Biggers <ebiggers@google.com>,
 Anuj Gupta <anuj20.g@samsung.com>, linux-kernel@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-block@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, dan.carpenter@linaro.org, rbm@suse.com,
 linux-fsdevel@vger.kernel.org, benjamin.copeland@linaro.org,
 ltp@lists.linux.it, Alexey Dobriyan <adobriyan@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Jul 09, 2025 at 08:10:14PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Anders and Naresh found that the addition of the FS_IOC_GETLBMD_CAP
> handling in the blockdev ioctl handler breaks all ioctls with
> _IOC_NR==2, as the new command is not added to the switch but only
> a few of the command bits are check.
> 
> Refine the check to also validate the direction/type/length bits,
> but still allow all supported sizes for future extensions.
> 
> Move the new command to the end of the function to avoid slowing
> down normal ioctl commands with the added branches.
> 
> Fixes: 9eb22f7fedfc ("fs: add ioctl to query metadata and protection info capabilities")
> Link: https://lore.kernel.org/all/CA+G9fYvk9HHE5UJ7cdJHTcY6P5JKnp+_e+sdC5U-ZQFTP9_hqQ@mail.gmail.com/
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> It seems that we have a lot of drivers with the same bug, as the
> large majority of all _IOC_NR() users in the kernel fail to also
> check the other bits of the ioctl command code. There are currently
> 55 files referencing _IOC_NR, and they all need to be manually
> checked for this problem.
> ---
>  block/ioctl.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/block/ioctl.c b/block/ioctl.c
> index 9ad403733e19..5e5a422bd09f 100644
> --- a/block/ioctl.c
> +++ b/block/ioctl.c
> @@ -567,9 +567,6 @@ static int blkdev_common_ioctl(struct block_device *bdev, blk_mode_t mode,
>  {
>  	unsigned int max_sectors;
>  
> -	if (_IOC_NR(cmd) == _IOC_NR(FS_IOC_GETLBMD_CAP))
> -		return blk_get_meta_cap(bdev, cmd, argp);
> -
>  	switch (cmd) {
>  	case BLKFLSBUF:
>  		return blkdev_flushbuf(bdev, cmd, arg);
> @@ -647,9 +644,16 @@ static int blkdev_common_ioctl(struct block_device *bdev, blk_mode_t mode,
>  		return blkdev_pr_preempt(bdev, mode, argp, true);
>  	case IOC_PR_CLEAR:
>  		return blkdev_pr_clear(bdev, mode, argp);
> -	default:
> -		return -ENOIOCTLCMD;
>  	}
> +
> +	if (_IOC_DIR(cmd)  == _IOC_DIR(FS_IOC_GETLBMD_CAP) &&
> +	    _IOC_TYPE(cmd) == _IOC_TYPE(FS_IOC_GETLBMD_CAP) &&
> +	    _IOC_NR(cmd)   == _IOC_NR(FS_IOC_GETLBMD_CAP) &&

I think this problem was introduced by brauner trying to persuade people
to perform size independent dispatch of ioctls:

       switch (_IOC_NR(cmd)) {
       case _IOC_NR(FS_IOC_FSGETXATTR):
               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FS_IOC_FSGETXATTR)))
                       return SOMETHING_SOMETHING;
               /* Only handle original size. */
               return ioctl_fsgetxattr(filp, argp);

https://lore.kernel.org/linux-xfs/20250515-bedarf-absagen-464773be3e72@brauner/

though we probably want a helper or something to encapsulate those three
comparisons to avoid the SOMETHING_SOMETHING part:

#define IOC_DISPATCH(c) \
	((c) & ~(_IOC(0, 0, 0, _IOC_SIZE(_IOC_SIZEMASK))))

	switch (IOC_DISPATCH(cmd)) {
	case IOC_DISPATCH(FS_IOC_FSGETXATTR):
		return ioctl_fsgetxattr(filp, cmd, argp);

Assuming that ioctl_fsgetxattr derives size from @cmd and rejects values
that it doesn't like.  Hrm?

> +	    _IOC_SIZE(cmd) >= LBMD_SIZE_VER0 &&
> +	    _IOC_SIZE(cmd) <= _IOC_SIZE(FS_IOC_GETLBMD_CAP))

blk_get_meta_cap already checks this.

--D

> +		return blk_get_meta_cap(bdev, cmd, argp);
> +
> +	return -ENOIOCTLCMD;
>  }
>  
>  /*
> -- 
> 2.39.5
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
