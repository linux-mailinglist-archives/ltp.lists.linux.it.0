Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 383F9AD1FA
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2019 04:36:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA2B13C1CF7
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2019 04:36:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 567873C1C97
 for <ltp@lists.linux.it>; Mon,  9 Sep 2019 04:36:11 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C664C60070D
 for <ltp@lists.linux.it>; Mon,  9 Sep 2019 04:36:12 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id bd8so5841988plb.6
 for <ltp@lists.linux.it>; Sun, 08 Sep 2019 19:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fGl0467DNWpNCh493JC4NyhOyXJ6p/TNVqtSivK+TJI=;
 b=HYwl7A60IgY2Ug7EoRZYJ2ZglmB3AiqiKeS4PDpXAgHXGUUF3OnPughxkYBhvJllGh
 NKvNofNK90zFh+7kS12nuOsYp/bkCrFiz8K5V5RG9hm9fzarRyc5o4bchDphihgQJuDE
 q5oxvtaJCuz4XutsRGc6F126TuZFm/TtZCkNTlIu12ijuFi2As3wgCv7wO9ZTkv3CYDe
 8uM9pTO02g7xGLguGhLj4+bheZO9QnFdXCsbuTjiacRowZfhRlSHaisHfk41BirhQyR8
 l0azkTX9iM275kfpiXVS9mJMYRiaaR9ktYyPPfd/oxbQJl/e2I8DB+j3g/yD2634Y+hj
 mF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fGl0467DNWpNCh493JC4NyhOyXJ6p/TNVqtSivK+TJI=;
 b=TpCDukGX3MUKIJsGYtPDuiVMcydHGJKtsvPNCtRjSPKrmyZFPJ3FgT5E5a0ua2TPT9
 oEB20JKOmnYJP5b8b0uHQrA5JbhnW+JYAKZyrBaBx9W2iZCBmRqKPlO0c3EKFsqsdZfT
 h4LkBKXhOq+DZeZEr48o5uw4j1mZwbz1yW9ilRl687/nWl+VoCYCEAvZZTygFOYMqVlE
 3SFFrfugBM8aP5ozUJ6ez6LaPvjikW7tQ350cxfEE7FPicUQ+sDtaF+gSzsM/0E/5snX
 Xv+jFq9vd5pTH/wzbvMh9wMkGdIqRaa0eUzRU0GlkvHaURcZkAYExfEAxEAtKvEVee6A
 1vtA==
X-Gm-Message-State: APjAAAUkEyKWLonwiybB5nyvFkyIlRc9p7ILfCuO48Td7yGGFZ+Z19sQ
 qtjqtkSHznydka4wMBxs4+k=
X-Google-Smtp-Source: APXvYqyGx4rquNY6/gEt8u82zXsQzGMoJZr2XrNq99W3GnVShtGxLvERLqYuPtNIYWYc0UgTcsq8Qg==
X-Received: by 2002:a17:902:9a05:: with SMTP id
 v5mr9301914plp.237.1567996568556; 
 Sun, 08 Sep 2019 19:36:08 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q42sm13378860pja.16.2019.09.08.19.36.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 Sep 2019 19:36:07 -0700 (PDT)
Date: Mon, 9 Sep 2019 10:36:00 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20190909023600.sxygdyclxm4ivllw@XZHOUW.usersys.redhat.com>
References: <20190828102256.3nhyb2ngzitwd7az@XZHOUW.usersys.redhat.com>
 <00923c9f5d5a69e8225640abcf7ad54df2cb62d2.camel@hammerspace.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00923c9f5d5a69e8225640abcf7ad54df2cb62d2.camel@hammerspace.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

Hi Trond,

Will you queue this fix for v5.3 ?

Thanks!

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
