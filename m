Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF93AD214
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2019 04:58:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A91C33C1CF7
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2019 04:58:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C561D3C1C97
 for <ltp@lists.linux.it>; Mon,  9 Sep 2019 04:58:41 +0200 (CEST)
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740100.outbound.protection.outlook.com [40.107.74.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 47E4910006AA
 for <ltp@lists.linux.it>; Mon,  9 Sep 2019 04:58:32 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsUwrRQnvdQ0FL45E90FrF+5Rl9Lx5nBZ1pGUNaVSn5nTllZG58CiRGZrcYMo3cYH53KV1/Hb6jzgf4VrKu+emOWmErb4f5y76SWIp3shvvypvQbjCKA9tUnUSodbuPIAQUxCGQ2Hl0aT3+CZ+LbQbMzLa9z1Kf7Zzxxlv6ISiqhI65o7sT20CT2Eplf3/BqYm6kUS00DVQo5i6HxOVXcYjorfnXTqTawlMtLnSgbYDcwcNGr45IWxXGOFd+rlFpcC9mxLWi1EIuv8L9bfKSP8Y2U2YRQy9awB114LW9XmAkimOtz6PDURJaEi1aPEBqL/rsC4eCwjEYi5suG5p6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCgjx8pBNUVbIji12BS49huN1zrKtD64LRXCHnPbqKo=;
 b=akl4D1G92RtPh1aaaZ/Tf39xZpZqtv2EWGxm9Ra5MM9gL9pOJz00tJ3kxKTuqi347DI+de3wNtlt9mUhDTJT+WirUsddRTUDBATv02go1wN8xaLE90dlHNI9JTkq4fCxjcoJOvKRXWocK+emL7ZbZVnFp+APBuV1ouNzsFZ+cfU2GOH1B+IewiydC6qYzbp+aSBnZHAO0Zc0iZG8qFFmBWlDjJPlGWSg3WGY9smAw33ekZX6z5Rx9aXORecKUQz5CAPL3JWHhWLg0KmPiAD0mLGlZed8qfhDiIzlv0Tt2CZxHIDAodYDyLnLVk999rDvSNw2IWU0ekoRZPmIJbIw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCgjx8pBNUVbIji12BS49huN1zrKtD64LRXCHnPbqKo=;
 b=gShelNFSjdZWFXOxWjmLmOYxF1qB3IyZtFsVcqNtOUG3SgXjKfKmXqgHjODK9Qtsh9CI+zMgkgHD2EW/00zEMzBYPzXHuhhdK5cNpPeWFG2h83IOOfGWD9znJN9tGHIbg6TjGCRg1uTlwVZg6pdeSIBk83gCVII0punV45RvGu4=
Received: from DM5PR13MB1851.namprd13.prod.outlook.com (10.171.159.143) by
 DM5PR13MB1850.namprd13.prod.outlook.com (10.171.155.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.10; Mon, 9 Sep 2019 02:58:36 +0000
Received: from DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::70fd:85c2:8ea9:a0b6]) by DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::70fd:85c2:8ea9:a0b6%9]) with mapi id 15.20.2263.005; Mon, 9 Sep 2019
 02:58:36 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "jencce.kernel@gmail.com" <jencce.kernel@gmail.com>
Thread-Topic: nfs-for-5.3-3 update "breaks" NFSv4 directIO somehow
Thread-Index: AQHVXYqWkaBiigZLzUiLlkqzKNa/B6cQsH6AgBIDDgCAAAZNgA==
Date: Mon, 9 Sep 2019 02:58:35 +0000
Message-ID: <77a371f6d9c290de0cca00ff272ea831e0d124b8.camel@hammerspace.com>
References: <20190828102256.3nhyb2ngzitwd7az@XZHOUW.usersys.redhat.com>
 <00923c9f5d5a69e8225640abcf7ad54df2cb62d2.camel@hammerspace.com>
 <20190909023600.sxygdyclxm4ivllw@XZHOUW.usersys.redhat.com>
In-Reply-To: <20190909023600.sxygdyclxm4ivllw@XZHOUW.usersys.redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [50.36.167.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39fe7ae5-8adf-4b37-827b-08d734d19bba
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR13MB1850; 
x-ms-traffictypediagnostic: DM5PR13MB1850:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR13MB18502EA991897D58C2983EEEB8B70@DM5PR13MB1850.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39830400003)(366004)(136003)(346002)(376002)(189003)(199004)(6506007)(81166006)(118296001)(66066001)(5660300002)(81156014)(15650500001)(66446008)(64756008)(6436002)(66556008)(66476007)(86362001)(71200400001)(71190400001)(76116006)(76176011)(36756003)(66946007)(8676002)(91956017)(14454004)(15974865002)(99286004)(7736002)(102836004)(5024004)(14444005)(53546011)(2501003)(186003)(26005)(11346002)(476003)(2616005)(3846002)(2906002)(486006)(6116002)(6246003)(229853002)(25786009)(2351001)(316002)(54906003)(478600001)(8936002)(4326008)(6486002)(966005)(256004)(6916009)(6306002)(1361003)(53936002)(6512007)(5640700003)(305945005)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR13MB1850;
 H:DM5PR13MB1851.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oFiqGevtg6KHpE5k9j14k1AIQIPuYxdS4ac3xM6kFDz0PO5L1JmhGSux09bR43aO7W8ax3lilL68SVq00SWEZJldNtyr8eqGQr4KeVP0Ru9T+fNFqTvJA/ntYRq4pShPvnpCFpGhuB6oAw7bGq66s52HAXQnmiOpE0/myKVHEoAGBw8OL7bOIUxqbGT/oYEYvGt3vHEJ7RH+pRiDeVRVrULmJ9sJrQa2MgFJa4sDfl8qhr0PN+KJDK1WJW/xh4cK7SyxzzHldPIQwjQeMmBXDjvQWgwXjQu6T9fxuPkv9PLtCpxiU4WUsbNmn9oRkKzO69a984OnS/eoH7jZCUjzqxCWr0BaQRd/CUJlMaMSGK8PVHCdIWvmvfoqNWmuJFP6C6HYKMGoUwpYsE0+mIkvm53Tnv8M0BptCQ7R0Eh36JE=
x-ms-exchange-transport-forked: True
Content-ID: <CAD735D8DBFECA479A1639498BDD391E@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fe7ae5-8adf-4b37-827b-08d734d19bba
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 02:58:35.9276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JUM1OiO58aC+gjeEWAXTK3eqWa4I4TsypzY/dRowbmK8OaCm2D8jmAhxhCyRXwKsgyg+CO0XIx2pFwpEhv9GKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1850
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

On Mon, 2019-09-09 at 10:36 +0800, Murphy Zhou wrote:
> On Wed, Aug 28, 2019 at 03:32:25PM +0000, Trond Myklebust wrote:
> > On Wed, 2019-08-28 at 18:22 +0800, Murphy Zhou wrote:
> > > Hi,
> > > 
> > > If write to file with O_DIRECT, then read it without O_DIRECT,
> > > read
> > > returns 0.
> > > From tshark output, looks like the READ call is missing.
> > > 
> > > LTP[1] dio tests spot this. Things work well before this update.
> > > 
> > > Bisect log is pointing to:
> > > 
> > > 	commit 7e10cc25bfa0dd3602bbcf5cc9c759a90eb675dc
> > > 	Author: Trond Myklebust <trond.myklebust@hammerspace.com>
> > > 	Date:   Fri Aug 9 12:06:43 2019 -0400
> > > 	
> > > 	    NFS: Don't refresh attributes with mounted-on-file
> > > informatio
> > > 
> > > With this commit reverted, the tests pass again.
> > > 
> > > It's only about NFSv4(4.0 4.1 and 4.2), NFSv3 works well.
> > > 
> > > Bisect log, outputs of tshark, sample test programme derived from
> > > LTP diotest02.c and a simple test script are attached.
> > > 
> > > If this is an expected change, we will need to update the
> > > testcases.
> > 
> > That is not intentional, so thanks for reporting it! Does the
> > following
> > fix help?
> 
> Hi Trond,
> 
> Will you queue this fix for v5.3 ?
> 
> Thanks!
> 

It is already in 5.3-rc8: 

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eb3d8f42231aec65b64b079dd17bd6c008a3fe29

Cheers
  Trond

> > 8<------------------------
> > From ce61618bc085d8cea8a614b5e1eb09e16ea8e036 Mon Sep 17 00:00:00
> > 2001
> > From: Trond Myklebust <trond.myklebust@hammerspace.com>
> > Date: Wed, 28 Aug 2019 11:26:13 -0400
> > Subject: [PATCH] NFS: Fix inode fileid checks in attribute
> > revalidation code
> > 
> > We want to throw out the attrbute if it refers to the mounted on
> > fileid,
> > and not the real fileid. However we do not want to block cache
> > consistency
> > updates from NFSv4 writes.
> > 
> > Reported-by: Murphy Zhou <jencce.kernel@gmail.com>
> > Fixes: 7e10cc25bfa0 ("NFS: Don't refresh attributes with mounted-
> > on-file...")
> > Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
> > ---
> >  fs/nfs/inode.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> > index c764cfe456e5..d7e78b220cf6 100644
> > --- a/fs/nfs/inode.c
> > +++ b/fs/nfs/inode.c
> > @@ -1404,10 +1404,11 @@ static int
> > nfs_check_inode_attributes(struct inode *inode, struct nfs_fattr
> > *fat
> >  		return 0;
> >  
> >  	/* No fileid? Just exit */
> > -	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID))
> > -		return 0;
> > +	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID)) {
> > +		if (fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
> > +			return 0;
> >  	/* Has the inode gone and changed behind our back? */
> > -	if (nfsi->fileid != fattr->fileid) {
> > +	} else if (nfsi->fileid != fattr->fileid) {
> >  		/* Is this perhaps the mounted-on fileid? */
> >  		if ((fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
> > &&
> >  		    nfsi->fileid == fattr->mounted_on_fileid)
> > @@ -1808,10 +1809,11 @@ static int nfs_update_inode(struct inode
> > *inode, struct nfs_fattr *fattr)
> >  			atomic_read(&inode->i_count), fattr->valid);
> >  
> >  	/* No fileid? Just exit */
> > -	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID))
> > -		return 0;
> > +	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID)) {
> > +		if (fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
> > +			return 0;
> >  	/* Has the inode gone and changed behind our back? */
> > -	if (nfsi->fileid != fattr->fileid) {
> > +	} else if (nfsi->fileid != fattr->fileid) {
> >  		/* Is this perhaps the mounted-on fileid? */
> >  		if ((fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
> > &&
> >  		    nfsi->fileid == fattr->mounted_on_fileid)
> > -- 
> > 2.21.0
> > 
> > -- 
> > Trond Myklebust
> > Linux NFS client maintainer, Hammerspace
> > trond.myklebust@hammerspace.com
> > 
> > 
Trond Myklebust
CTO, Hammerspace Inc
4300 El Camino Real, Suite 105
Los Altos, CA 94022
www.hammer.space

-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
