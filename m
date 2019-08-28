Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FF9A065E
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 17:32:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 405D23C1D30
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 17:32:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 15F3E3C1CE5
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 17:32:35 +0200 (CEST)
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720138.outbound.protection.outlook.com [40.107.72.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A568F140199B
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 17:32:32 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGp8Qr96TnTt+qzUe0sQU0FtUM4jYIedIxMvMGfnzwJMOR+OkH6pMT8zNb4KHrn5/lbyN5qczgsKrDd0p9BKhrmkOLSfoaQ7Tq9e83R3rBPQM/PXm4AN4aMwSBS1gXVTBzJnTMvSmIksMkvzxXzcWJz9eOF6ASoZYtsdBZJfZgSKQRjUuWUnA2MXsnErF1VRbtlRrDJ4GK/MFYFjl2BxobEbYea8w8WT0Hnrzwziib7WbtqYd1LDYVRyRjVIjJ7Xn4kcqfS7WGw93zaDg5gSq8A4v1MT8x495YZ/Zusp3+t1AxQPfvsVLy7C2U6pbQw/0Fd/Jebkom7sIx91XQUEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPVxMC6B4aXNrRTvUUp4PtjWaWO9PlRQuNZnfP+WuUM=;
 b=jwlEx10L0icvHxkeP1GVryCbgYTfe2kdtvrEi7j5qQ3WcqCMvW9OO+f1awqAo3MVNLq7B9/g4cEjIjeiPma28n1SAWhO2p5NbFBvcUQPDcNAdyHe+f+pfl2JK10B8yOPHg2AhpCyBWOJCWjwuH5InAAgDpTqqRA1rq6qxPpU0ZEzmC01VHorG7HcV0oZyYS7gRxdbaweZRQyfts3ca0QsLXPHBHglmP0zqj6ZoXW1El8hm5PkxLhd5KON3KBu39Z7wa6jaCxVsASLX128lEvlZUBaFChyB9gCEQ2C0pD99ZWUbqgsmbmp2RWYWZOEDXc2ycgWXo2bvHU/4k792/qBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPVxMC6B4aXNrRTvUUp4PtjWaWO9PlRQuNZnfP+WuUM=;
 b=bD0J2+6QDuwpPer9ytZbk3wMWJGlsylQLb2g2B71HeUVFiq5Gbr4gR8VjAMFeOfnQpONScFKTiBQ7qJ+gJIM8sOk2aDXu2S0q1GbLf/AqSnTIkCVmyFDjgTp45gCdGkCIZ+hLmG0BbHVryxZZzFJ3AnrweCpIqG8qSpIMHVXajU=
Received: from DM5PR13MB1851.namprd13.prod.outlook.com (10.171.159.143) by
 DM5PR13MB1100.namprd13.prod.outlook.com (10.168.118.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.4; Wed, 28 Aug 2019 15:32:25 +0000
Received: from DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75]) by DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75%7]) with mapi id 15.20.2220.013; Wed, 28 Aug 2019
 15:32:25 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "jencce.kernel@gmail.com" <jencce.kernel@gmail.com>
Thread-Topic: nfs-for-5.3-3 update "breaks" NFSv4 directIO somehow
Thread-Index: AQHVXYqWkaBiigZLzUiLlkqzKNa/B6cQsH6A
Date: Wed, 28 Aug 2019 15:32:25 +0000
Message-ID: <00923c9f5d5a69e8225640abcf7ad54df2cb62d2.camel@hammerspace.com>
References: <20190828102256.3nhyb2ngzitwd7az@XZHOUW.usersys.redhat.com>
In-Reply-To: <20190828102256.3nhyb2ngzitwd7az@XZHOUW.usersys.redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [68.40.189.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d205597-b75e-4b64-29ce-08d72bcced96
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR13MB1100; 
x-ms-traffictypediagnostic: DM5PR13MB1100:
x-microsoft-antispam-prvs: <DM5PR13MB1100AE78767E7E66486F2000B8A30@DM5PR13MB1100.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:288;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(136003)(366004)(376002)(39840400004)(189003)(199004)(8936002)(229853002)(36756003)(86362001)(6486002)(118296001)(66066001)(478600001)(5660300002)(316002)(14454004)(7736002)(66556008)(64756008)(66446008)(66476007)(2501003)(110136005)(53936002)(71190400001)(71200400001)(4326008)(25786009)(76176011)(66946007)(6246003)(5024004)(14444005)(256004)(76116006)(91956017)(305945005)(6436002)(11346002)(446003)(99286004)(81156014)(3846002)(2616005)(26005)(476003)(486006)(15650500001)(53546011)(6506007)(6512007)(102836004)(8676002)(81166006)(186003)(2906002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR13MB1100;
 H:DM5PR13MB1851.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gAcWUjlXzDPBo+ruxrhBxDuAUBYlnzxhrqmVkIXSJHjt6lmhsz4iDerBBKNQQcX9Gb968NRBEEPCM036HQ7zkepy0mZmOvj+xEbaI0/Pg1jNDIQw/6xX4Dhwewu22f/Yqml7QeuijTDXoqXbZgu9Zj49Q4B6VGqAtsMHyvhtg7fiQD4rRulpmAKMEwTYrmVycc5Y84/F+NjC3O21K5hJuZj8e8eOgL7A7M4MVzi7h0X8YDU6Lgd//2sGP9YKFesUWQGqtoKZou5C88XC+stn5RDCmd+tMUQ6QrDdUn3I7Gny3g0WfbaUnAfR9tLpcJgRvX2QMnKkVFMergQsh5d2zdRQG6qFK4btBpNv4TeczF+MUF9D8LW8H9yE47fChOpB6N8g5fN6FILH19iC6J6UW3PonFFzGUKR1WdiqQ1OXGM=
x-ms-exchange-transport-forked: True
Content-ID: <E0C4B619E3829145A82C32C87B11A883@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d205597-b75e-4b64-29ce-08d72bcced96
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 15:32:25.4669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+aq1GarNvhddVpKsSC315iAgfTegqVR153zkXyJpARQwFbghNkHZ56xJkC0vAJR4RuXZme1d1mqu2k6AZOA0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1100
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 2019-08-28 at 18:22 +0800, Murphy Zhou wrote:
> Hi,
> 
> If write to file with O_DIRECT, then read it without O_DIRECT, read
> returns 0.
> From tshark output, looks like the READ call is missing.
> 
> LTP[1] dio tests spot this. Things work well before this update.
> 
> Bisect log is pointing to:
> 
> 	commit 7e10cc25bfa0dd3602bbcf5cc9c759a90eb675dc
> 	Author: Trond Myklebust <trond.myklebust@hammerspace.com>
> 	Date:   Fri Aug 9 12:06:43 2019 -0400
> 	
> 	    NFS: Don't refresh attributes with mounted-on-file
> informatio
> 
> With this commit reverted, the tests pass again.
> 
> It's only about NFSv4(4.0 4.1 and 4.2), NFSv3 works well.
> 
> Bisect log, outputs of tshark, sample test programme derived from
> LTP diotest02.c and a simple test script are attached.
> 
> If this is an expected change, we will need to update the testcases.

That is not intentional, so thanks for reporting it! Does the following
fix help?

8<------------------------
From ce61618bc085d8cea8a614b5e1eb09e16ea8e036 Mon Sep 17 00:00:00 2001
From: Trond Myklebust <trond.myklebust@hammerspace.com>
Date: Wed, 28 Aug 2019 11:26:13 -0400
Subject: [PATCH] NFS: Fix inode fileid checks in attribute revalidation code

We want to throw out the attrbute if it refers to the mounted on fileid,
and not the real fileid. However we do not want to block cache consistency
updates from NFSv4 writes.

Reported-by: Murphy Zhou <jencce.kernel@gmail.com>
Fixes: 7e10cc25bfa0 ("NFS: Don't refresh attributes with mounted-on-file...")
Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
---
 fs/nfs/inode.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index c764cfe456e5..d7e78b220cf6 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -1404,10 +1404,11 @@ static int nfs_check_inode_attributes(struct inode *inode, struct nfs_fattr *fat
 		return 0;
 
 	/* No fileid? Just exit */
-	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID))
-		return 0;
+	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID)) {
+		if (fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
+			return 0;
 	/* Has the inode gone and changed behind our back? */
-	if (nfsi->fileid != fattr->fileid) {
+	} else if (nfsi->fileid != fattr->fileid) {
 		/* Is this perhaps the mounted-on fileid? */
 		if ((fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID) &&
 		    nfsi->fileid == fattr->mounted_on_fileid)
@@ -1808,10 +1809,11 @@ static int nfs_update_inode(struct inode *inode, struct nfs_fattr *fattr)
 			atomic_read(&inode->i_count), fattr->valid);
 
 	/* No fileid? Just exit */
-	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID))
-		return 0;
+	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID)) {
+		if (fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
+			return 0;
 	/* Has the inode gone and changed behind our back? */
-	if (nfsi->fileid != fattr->fileid) {
+	} else if (nfsi->fileid != fattr->fileid) {
 		/* Is this perhaps the mounted-on fileid? */
 		if ((fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID) &&
 		    nfsi->fileid == fattr->mounted_on_fileid)
-- 
2.21.0

-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
