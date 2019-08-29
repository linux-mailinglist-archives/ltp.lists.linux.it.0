Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0796A0E86
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 02:06:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B9BE3C1D09
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 02:06:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A29CD3C1CE4
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 02:06:19 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8CCD41401AE4
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 02:06:18 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id y200so806272pfb.6
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 17:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Wspgap3Tf9JL/6azrZxB+h+6c/nV/dmEy9Ir2yl5KrQ=;
 b=TbFpvo9PpaHCR6YW+JQ12YiRJ9k3A25bK9ANjq1tGMedJiQImOQ+IbGo9aOXHTPgYs
 aAxfWYDJj93N993CgGdaXndV2AlOHYEPx7/VnPOWMBPltFh0XV15blrLeQQqdsXQeZTg
 bn7+d1UYp+h9ha/rj4cAfNgd1XiA3v09cjwJ/uMrVdLF8aHYSdkfTcRACTy0oU17aLyZ
 ft9t3IMH+9e45fuYEKduuO+s1Lrz+dktcyVf3fKwOeRu/Q5VbQGxUHYvGVmuDEbEj6/d
 zYIRuFDIs+DGo/qgJGILXVuedmQQ8oPv5b8s+UAaAI95bywtFOfi9q2h4viheXwOw9Qr
 V19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wspgap3Tf9JL/6azrZxB+h+6c/nV/dmEy9Ir2yl5KrQ=;
 b=BTpBWtbpTvsrDJxO5r+5v63Ir7vTQfwdEJhgg+MN2pNBR1YGA71ZQJ+ioUSjo3q+6x
 k+juH7tiwJPJARP9jEaYeKSxQaQPc55XzOMgaqkh1co6eqflk2dA6O5dHvxxq349pZVm
 lEVS7Tl1DhTYnWDtZfnq9/Nihdv2FnfYw3LMDsAhkahkN4EJm2XIuxP8uu5ZNTCzqDZ0
 DxDt27bHt+2ykVqim+E1OpONweK8+FUUU6k4GEqrawzxSlFsHZx5F2hHpHNDkZJ09n24
 AoKL8bx8yrTpyyxwErFp/iqSnLy/zLLV/b2TiiwrMUt2es2D2I2kSjs9f1Z+DwChCNdH
 uf7Q==
X-Gm-Message-State: APjAAAW6oy3a3tZZSOb8m4F2VHlpMNRE00V7x4dcJE+fjhhlT92AOrRu
 d0r4XDSY0hD0VRt8tOUaYgw=
X-Google-Smtp-Source: APXvYqztPn+/A3A6ACsh1Yjef7lBM1aJNRwz7nSZPs81i1MwGqTmUq6kCeW2MYRtIm76uF2kp6VI4A==
X-Received: by 2002:a17:90a:b288:: with SMTP id
 c8mr6894939pjr.135.1567037176611; 
 Wed, 28 Aug 2019 17:06:16 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id e9sm282404pja.17.2019.08.28.17.06.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 17:06:16 -0700 (PDT)
Date: Thu, 29 Aug 2019 08:06:08 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20190829000608.hugn6q5tgmttxxw5@XZHOUW.usersys.redhat.com>
References: <20190828102256.3nhyb2ngzitwd7az@XZHOUW.usersys.redhat.com>
 <00923c9f5d5a69e8225640abcf7ad54df2cb62d2.camel@hammerspace.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00923c9f5d5a69e8225640abcf7ad54df2cb62d2.camel@hammerspace.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] nfs-for-5.3-3 update "breaks" NFSv4 directIO somehow
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
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Aug 28, 2019 at 03:32:25PM +0000, Trond Myklebust wrote:
> On Wed, 2019-08-28 at 18:22 +0800, Murphy Zhou wrote:
> > Hi,
> > 
> > If write to file with O_DIRECT, then read it without O_DIRECT, read
> > returns 0.
> > From tshark output, looks like the READ call is missing.
> > 
> > LTP[1] dio tests spot this. Things work well before this update.
> > 
> > Bisect log is pointing to:
> > 
> > 	commit 7e10cc25bfa0dd3602bbcf5cc9c759a90eb675dc
> > 	Author: Trond Myklebust <trond.myklebust@hammerspace.com>
> > 	Date:   Fri Aug 9 12:06:43 2019 -0400
> > 	
> > 	    NFS: Don't refresh attributes with mounted-on-file
> > informatio
> > 
> > With this commit reverted, the tests pass again.
> > 
> > It's only about NFSv4(4.0 4.1 and 4.2), NFSv3 works well.
> > 
> > Bisect log, outputs of tshark, sample test programme derived from
> > LTP diotest02.c and a simple test script are attached.
> > 
> > If this is an expected change, we will need to update the testcases.
> 
> That is not intentional, so thanks for reporting it! Does the following
> fix help?

This patch fixed the issue. Thanks!

Murphy

> 
> 8<------------------------
> From ce61618bc085d8cea8a614b5e1eb09e16ea8e036 Mon Sep 17 00:00:00 2001
> From: Trond Myklebust <trond.myklebust@hammerspace.com>
> Date: Wed, 28 Aug 2019 11:26:13 -0400
> Subject: [PATCH] NFS: Fix inode fileid checks in attribute revalidation code
> 
> We want to throw out the attrbute if it refers to the mounted on fileid,
> and not the real fileid. However we do not want to block cache consistency
> updates from NFSv4 writes.
> 
> Reported-by: Murphy Zhou <jencce.kernel@gmail.com>
> Fixes: 7e10cc25bfa0 ("NFS: Don't refresh attributes with mounted-on-file...")
> Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
> ---
>  fs/nfs/inode.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> index c764cfe456e5..d7e78b220cf6 100644
> --- a/fs/nfs/inode.c
> +++ b/fs/nfs/inode.c
> @@ -1404,10 +1404,11 @@ static int nfs_check_inode_attributes(struct inode *inode, struct nfs_fattr *fat
>  		return 0;
>  
>  	/* No fileid? Just exit */
> -	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID))
> -		return 0;
> +	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID)) {
> +		if (fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
> +			return 0;
>  	/* Has the inode gone and changed behind our back? */
> -	if (nfsi->fileid != fattr->fileid) {
> +	} else if (nfsi->fileid != fattr->fileid) {
>  		/* Is this perhaps the mounted-on fileid? */
>  		if ((fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID) &&
>  		    nfsi->fileid == fattr->mounted_on_fileid)
> @@ -1808,10 +1809,11 @@ static int nfs_update_inode(struct inode *inode, struct nfs_fattr *fattr)
>  			atomic_read(&inode->i_count), fattr->valid);
>  
>  	/* No fileid? Just exit */
> -	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID))
> -		return 0;
> +	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID)) {
> +		if (fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
> +			return 0;
>  	/* Has the inode gone and changed behind our back? */
> -	if (nfsi->fileid != fattr->fileid) {
> +	} else if (nfsi->fileid != fattr->fileid) {
>  		/* Is this perhaps the mounted-on fileid? */
>  		if ((fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID) &&
>  		    nfsi->fileid == fattr->mounted_on_fileid)
> -- 
> 2.21.0
> 
> -- 
> Trond Myklebust
> Linux NFS client maintainer, Hammerspace
> trond.myklebust@hammerspace.com
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
