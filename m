Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A07A1AD228
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2019 05:20:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 455B03C1CF7
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2019 05:20:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 99EE63C1C97
 for <ltp@lists.linux.it>; Mon,  9 Sep 2019 05:20:05 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0168D60070D
 for <ltp@lists.linux.it>; Mon,  9 Sep 2019 05:20:07 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id n4so6971450pgv.2
 for <ltp@lists.linux.it>; Sun, 08 Sep 2019 20:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PDMOKvnuHVKtK5q6amgpUvAYTQL7I1LWcmPCTMqDgd8=;
 b=MTHmDQrT/WA5HMwSQ0nnRXOrDwOrhjJL+yLD6cIZrA4VpD6WB2HypAL18IKoBGj+Bq
 VXV1lvZZiTOiKoQQRPndgdDE33oRNIWfWSkFBOm2iGVVLGsfS2rkdNWFT5yycXD2wrgh
 QeGZNmvOrxCIpUviqKb5uXBWek45XjP15qKxmA7tOkCyk4CmQJbm2JE8nlwwvtXZ5c4h
 j3ZZ7QXniqoBdc9/jJZHOSSRh3l4bUT1B/PcTbaay2SMlYWgLCeARWPQCtuXyqAUMCh1
 3/epkkkOki71EG/5FeVcb8TKs7em+rMidaSLx+jN2pqZiqH8zeQBIRXPUFQTXJRuGao+
 d1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PDMOKvnuHVKtK5q6amgpUvAYTQL7I1LWcmPCTMqDgd8=;
 b=KF1WzqCtCpJ4Sp1rLo/Da10lGEEa/7PLq1sybivCuZ+M3cxHN+7CLLzXtV1je1qtr7
 nZpPLgB+BrBsbKu8q4SPGcamNJoSlHjtmtMe893AjuUvsy86zyR82JlXbP/B/+KFhQ7g
 lMyUDhxULqzjUdeRYijG9WGeW74dbUqydd7lcQV+KRFsulLuXb8clrK3fAz6caFkfbxY
 9wBtXlnmLBedxhdI/vaFZjI8cyCf+Z8J6G/elNUxpDXbRE8Y1L/cRCYg0P9hLDZQuZ05
 JOYg0LiWKXiOlrRzpafuRgqRyRBExYlP4mx6QAmi1HHstjoPREmYG0PHAHQMx4xgiwlw
 3Ulg==
X-Gm-Message-State: APjAAAWzuZwRve0NCU2xGNS/hMc42RvjEwKTA9s7AdGYktw6ZSgOf4Ej
 4zeRCI7cuv2jD41b9bkM8ByTf4K2
X-Google-Smtp-Source: APXvYqzFUWjx6Rm90BnwUlmH+QQaH0B7w8Cidabfpd7boQcD22KbBnHNWIWHSDZwH6ay62F+sevb+Q==
X-Received: by 2002:a17:90a:1609:: with SMTP id
 n9mr3139481pja.64.1567999202788; 
 Sun, 08 Sep 2019 20:20:02 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id i137sm12727127pgc.4.2019.09.08.20.20.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 Sep 2019 20:20:02 -0700 (PDT)
Date: Mon, 9 Sep 2019 11:19:54 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20190909031954.7y6ajlwyojdbstcv@XZHOUW.usersys.redhat.com>
References: <20190828102256.3nhyb2ngzitwd7az@XZHOUW.usersys.redhat.com>
 <00923c9f5d5a69e8225640abcf7ad54df2cb62d2.camel@hammerspace.com>
 <20190909023600.sxygdyclxm4ivllw@XZHOUW.usersys.redhat.com>
 <77a371f6d9c290de0cca00ff272ea831e0d124b8.camel@hammerspace.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77a371f6d9c290de0cca00ff272ea831e0d124b8.camel@hammerspace.com>
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

On Mon, Sep 09, 2019 at 02:58:35AM +0000, Trond Myklebust wrote:
> On Mon, 2019-09-09 at 10:36 +0800, Murphy Zhou wrote:
> > On Wed, Aug 28, 2019 at 03:32:25PM +0000, Trond Myklebust wrote:
> > > On Wed, 2019-08-28 at 18:22 +0800, Murphy Zhou wrote:
> > > > Hi,
> > > > 
> > > > If write to file with O_DIRECT, then read it without O_DIRECT,
> > > > read
> > > > returns 0.
> > > > From tshark output, looks like the READ call is missing.
> > > > 
> > > > LTP[1] dio tests spot this. Things work well before this update.
> > > > 
> > > > Bisect log is pointing to:
> > > > 
> > > > 	commit 7e10cc25bfa0dd3602bbcf5cc9c759a90eb675dc
> > > > 	Author: Trond Myklebust <trond.myklebust@hammerspace.com>
> > > > 	Date:   Fri Aug 9 12:06:43 2019 -0400
> > > > 	
> > > > 	    NFS: Don't refresh attributes with mounted-on-file
> > > > informatio
> > > > 
> > > > With this commit reverted, the tests pass again.
> > > > 
> > > > It's only about NFSv4(4.0 4.1 and 4.2), NFSv3 works well.
> > > > 
> > > > Bisect log, outputs of tshark, sample test programme derived from
> > > > LTP diotest02.c and a simple test script are attached.
> > > > 
> > > > If this is an expected change, we will need to update the
> > > > testcases.
> > > 
> > > That is not intentional, so thanks for reporting it! Does the
> > > following
> > > fix help?
> > 
> > Hi Trond,
> > 
> > Will you queue this fix for v5.3 ?
> > 
> > Thanks!
> > 
> 
> It is already in 5.3-rc8: 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eb3d8f42231aec65b64b079dd17bd6c008a3fe29


Oh sorry.. I'll go to get some coffee. Checked that with this patch regression
tests looks good.

Thanks!
M

> 
> Cheers
>   Trond
> 
> > > 8<------------------------
> > > From ce61618bc085d8cea8a614b5e1eb09e16ea8e036 Mon Sep 17 00:00:00
> > > 2001
> > > From: Trond Myklebust <trond.myklebust@hammerspace.com>
> > > Date: Wed, 28 Aug 2019 11:26:13 -0400
> > > Subject: [PATCH] NFS: Fix inode fileid checks in attribute
> > > revalidation code
> > > 
> > > We want to throw out the attrbute if it refers to the mounted on
> > > fileid,
> > > and not the real fileid. However we do not want to block cache
> > > consistency
> > > updates from NFSv4 writes.
> > > 
> > > Reported-by: Murphy Zhou <jencce.kernel@gmail.com>
> > > Fixes: 7e10cc25bfa0 ("NFS: Don't refresh attributes with mounted-
> > > on-file...")
> > > Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
> > > ---
> > >  fs/nfs/inode.c | 14 ++++++++------
> > >  1 file changed, 8 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> > > index c764cfe456e5..d7e78b220cf6 100644
> > > --- a/fs/nfs/inode.c
> > > +++ b/fs/nfs/inode.c
> > > @@ -1404,10 +1404,11 @@ static int
> > > nfs_check_inode_attributes(struct inode *inode, struct nfs_fattr
> > > *fat
> > >  		return 0;
> > >  
> > >  	/* No fileid? Just exit */
> > > -	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID))
> > > -		return 0;
> > > +	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID)) {
> > > +		if (fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
> > > +			return 0;
> > >  	/* Has the inode gone and changed behind our back? */
> > > -	if (nfsi->fileid != fattr->fileid) {
> > > +	} else if (nfsi->fileid != fattr->fileid) {
> > >  		/* Is this perhaps the mounted-on fileid? */
> > >  		if ((fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
> > > &&
> > >  		    nfsi->fileid == fattr->mounted_on_fileid)
> > > @@ -1808,10 +1809,11 @@ static int nfs_update_inode(struct inode
> > > *inode, struct nfs_fattr *fattr)
> > >  			atomic_read(&inode->i_count), fattr->valid);
> > >  
> > >  	/* No fileid? Just exit */
> > > -	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID))
> > > -		return 0;
> > > +	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID)) {
> > > +		if (fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
> > > +			return 0;
> > >  	/* Has the inode gone and changed behind our back? */
> > > -	if (nfsi->fileid != fattr->fileid) {
> > > +	} else if (nfsi->fileid != fattr->fileid) {
> > >  		/* Is this perhaps the mounted-on fileid? */
> > >  		if ((fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
> > > &&
> > >  		    nfsi->fileid == fattr->mounted_on_fileid)
> > > -- 
> > > 2.21.0
> > > 
> > > -- 
> > > Trond Myklebust
> > > Linux NFS client maintainer, Hammerspace
> > > trond.myklebust@hammerspace.com
> > > 
> > > 
> Trond Myklebust
> CTO, Hammerspace Inc
> 4300 El Camino Real, Suite 105
> Los Altos, CA 94022
> www.hammer.space
> 
> -- 
> Trond Myklebust
> Linux NFS client maintainer, Hammerspace
> trond.myklebust@hammerspace.com
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
