Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4916C9DED8
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 09:35:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E38EA3C1D00
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 09:35:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5AE203C1C64
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 02:59:54 +0200 (CEST)
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730117.outbound.protection.outlook.com [40.107.73.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 54D881000B20
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 02:59:45 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6qemutHvNUA+4v2OjdwFdWPgRwkIt+aEm3HmAE/Tp5/hZ+W+/CSH+I/Tw3P+MppLVmG9zA2bggGWycp3BKgVX7PrWEJNAr2Qq5bwPLb9QFOG3CIv2CDZ2ZEmoTa7nh56BifdozSwFuoW+axvyJX+sg2t4yXDq7ImLuPPbVNmJaBywontRbmQ/oabS/eEuppgL6vOnewvslaHSfUZ5meh3iaJEB3iUBiLCY1vo6567gLQdyK2isy2qWHWSGNHwRyrLtXRaGfhxCoNWz8ag3Tl5eiXKyd76VSNzSQslygnen3SMmJ8+YNf58IiNKIRJkixfUdLLy9e6jBhMtunoEa4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEHW3BHNUROp0IXrZLS9iVBMrz2osmyxLmhRS//y3Eg=;
 b=nTBVbI41r/xsfcyI07JCT5zMt/v+PtGRX3dyErTc/AKQyJKoG7wcFofQrI7JzUAQwGSLTNP0h6wu9/1mFypf7ldmNMcjlg0j9UWd7JXCtk6q/vvpqgEgPj2SsRN3TO5Hdbrp2eG8MxPlaYFdrA2BvTSTov6c9VyICEtR/xXrqHmTH85kYRRRpAcnBGElH6n0Z/xazWoPY2tw0t1kfqF4skBURL+vb/K8wIExvP4Ha2QO6kxOl3JP0r+ckUWzQ21SgcGqXPLDguvB7bBz6TF70RktSZ4XDvYz4t9msoDw2Ad+YaMDhROhPAy0cYLjR2jUafMmYN1ySN0qoU812KYMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEHW3BHNUROp0IXrZLS9iVBMrz2osmyxLmhRS//y3Eg=;
 b=aGU6ew2Kds9XGdl2VeAgaLtJLjqCI14LArhE/XHQ1KU8Hp9cPQMQWXxRZxcRt/x+1lsM6UH08qF3dKZg42DYfqnga9U1AXPYER17BRZFT/nNaC9zWNl5c598FTSVmJjKLD/rZYfZMXIQKXqHrWcokA7528B5Co/aUsObrk3L5HM=
Received: from DM5PR13MB1851.namprd13.prod.outlook.com (10.171.159.143) by
 DM5PR13MB1130.namprd13.prod.outlook.com (10.168.115.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.13; Tue, 27 Aug 2019 00:59:48 +0000
Received: from DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75]) by DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75%7]) with mapi id 15.20.2220.013; Tue, 27 Aug 2019
 00:59:48 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "jstancek@redhat.com" <jstancek@redhat.com>
Thread-Topic: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed
 to run cmd: useradd hsym
Thread-Index: YFeV1UC3LeIsRdovt5+kMdO7I/BycvuMo5UAj4lK/k3wd0xbAA==
Date: Tue, 27 Aug 2019 00:59:48 +0000
Message-ID: <566e862d9bfaf88cdde6d66f0f59033fe6225a22.camel@hammerspace.com>
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
 <20190826104127.GA14729@haruka>
 <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
 <CA+G9fYsHpNKFHr=ZukVvj+uMJDyHj2Xwb9bCfzPQyYzMjZ0rCw@mail.gmail.com>
 <203971593.8175020.1566830285708.JavaMail.zimbra@redhat.com>
 <fcd20866bb836d45b1e384dd68080c671bcde938.camel@hammerspace.com>
 <2039173876.8300255.1566861172742.JavaMail.zimbra@redhat.com>
In-Reply-To: <2039173876.8300255.1566861172742.JavaMail.zimbra@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [68.40.189.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b5c719d-463b-4067-9e46-08d72a89dbcb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR13MB1130; 
x-ms-traffictypediagnostic: DM5PR13MB1130:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR13MB1130550FCA23C94948AFAFA1B8A00@DM5PR13MB1130.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(376002)(39840400004)(396003)(136003)(199004)(189003)(13464003)(4326008)(478600001)(6512007)(71200400001)(6506007)(8676002)(14444005)(256004)(102836004)(86362001)(6306002)(5640700003)(25786009)(966005)(6916009)(6116002)(2906002)(76116006)(1730700003)(81166006)(91956017)(64756008)(81156014)(66556008)(6246003)(66446008)(71190400001)(66946007)(229853002)(66476007)(6436002)(486006)(316002)(53546011)(2616005)(99286004)(36756003)(54906003)(2501003)(305945005)(476003)(11346002)(446003)(6486002)(2351001)(76176011)(186003)(118296001)(7736002)(26005)(14454004)(66066001)(5660300002)(53936002)(3846002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR13MB1130;
 H:DM5PR13MB1851.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d97oSfCizUq2LoNn1xU+e/xzp8ZoHx+a98X6NyoaACWZOuLJpcbZKyONC2AHsGUq1ZriJ9ZOTivcsqZlqDMUVp5oMhzVKj9j3efuh3aHkEsD2aq8aWjPsGGriuJtCf+0iws1F81DBz0BHEMbk/a+K9cEFfYQyaYg6OdL7vj4LrJGWuwax5V1VZp6fARrDeciLm/zRApxPZNLnpTo/sVcfdaJ+r+hPBgqn2tFiJ/vgZi59HZPJEpgcwg06kvA1iR4qTU040K3HVHKc474N0Me/vK/kpXWPxDHKXtiDo+0acD3O7WHDqjAF6qHR4OI/bg6uCTYPq2Jnc9O3TOU9P2sUwljo3JkTlDpVM4Dgjnf+vCqIatEK/Fuz5z2EyZ+jNsyPY1F1EadSlIVXfNN9QV0uRUbX06nh/wB80mvldlKmeA=
x-ms-exchange-transport-forked: True
Content-ID: <B19382394E78504CB4989A57CB12E973@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5c719d-463b-4067-9e46-08d72a89dbcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 00:59:48.0476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JaovbplLelN9zWWfdk9so+wR7wg7TN6RxM4KsqGVspWNyxNl6w7lXgE9yfxBC2PWVsWzO9wFNnE0OtcKtv2Kow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1130
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 27 Aug 2019 09:35:40 +0200
Subject: Re: [LTP] Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325:
 Failed to run cmd: useradd hsym
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "the_hoang0709@yahoo.com" <the_hoang0709@yahoo.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 2019-08-26 at 19:12 -0400, Jan Stancek wrote:
> ----- Original Message -----
> > On Mon, 2019-08-26 at 10:38 -0400, Jan Stancek wrote:
> > > ----- Original Message -----
> > > > Hi Jan and Cyril,
> > > > 
> > > > On Mon, 26 Aug 2019 at 16:35, Jan Stancek <jstancek@redhat.com>
> > > > wrote:
> > > > > 
> > > > > ----- Original Message -----
> > > > > > Hi!
> > > > > > > Do you see this LTP prot_hsymlinks failure on linux next
> > > > > > > 20190823 on
> > > > > > > x86_64 and i386 devices?
> > > > > > > 
> > > > > > > test output log,
> > > > > > > useradd: failure while writing changes to /etc/passwd
> > > > > > > useradd: /home/hsym was created, but could not be removed
> > > > > > 
> > > > > > This looks like an unrelated problem, failure to write to
> > > > > > /etc/passwd
> > > > > > probably means that filesystem is full or some problem
> > > > > > happend
> > > > > > and how
> > > > > > is remounted RO.
> > > > > 
> > > > > In Naresh' example, root is on NFS:
> > > > >   root=/dev/nfs rw
> > > > >  
> > > > > nfsroot=10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extr
> > > > > act-
> > > > > nfsrootfs-tyuevoxm,tcp,hard,intr
> > > > 
> > > > Right !
> > > > root is mounted on NFS.
> > > > 
> > > > > 10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extract-
> > > > > nfsrootfs-tyuevoxm
> > > > > on / type nfs
> > > > > (rw,relatime,vers=2,rsize=4096,wsize=4096,namlen=255,hard,nol
> > > > > ock,
> > > > > proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=10.66.16.123,
> > > > > moun
> > > > > tvers=1,mountproto=tcp,local_lock=all,addr=10.66.16.123)
> > > > > devtmpfs on /dev type devtmpfs
> > > > > (rw,relatime,size=3977640k,nr_inodes=994410,mode=755)
> > > > > 
> > 
> > The only thing I can think of that might cause an EIO on NFSv2
> > would be
> > this patch
> > http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=627d48e597ec5993c4abb3b81dc75e554a07c7c0
> > assuming that a bind-related error is leaking through.
> > 
> > I'd suggest something like the following to fix it up:
> 
> No change with that patch,
> but following one fixes it for me:
> 
> diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
> index 20b3717cd7ca..56cefa0ab804 100644
> --- a/fs/nfs/pagelist.c
> +++ b/fs/nfs/pagelist.c
> @@ -590,7 +590,7 @@ static void nfs_pgio_rpcsetup(struct
> nfs_pgio_header *hdr,
>         }
>  
>         hdr->res.fattr   = &hdr->fattr;
> -       hdr->res.count   = 0;
> +       hdr->res.count   = count;
>         hdr->res.eof     = 0;
>         hdr->res.verf    = &hdr->verf;
>         nfs_fattr_init(&hdr->fattr);
> 
> which is functionally revert of "NFS: Fix initialisation of I/O
> result struct in nfs_pgio_rpcsetup".
> 
> This hunk caught my eye, could res.eof == 0 explain those I/O errors?

Interesting hypothesis. It could if res.count ends up being 0. So does
the following also fix the problem?
8<----------------------------------------
From b5bc0812350e94f8c9331174d22f24692411aef9 Mon Sep 17 00:00:00 2001
From: Trond Myklebust <trond.myklebust@hammerspace.com>
Date: Mon, 26 Aug 2019 20:41:16 -0400
Subject: [PATCH] NFSv2: Fix eof handling

If we received a reply from the server with a zero length read and
no error, then that implies we are at eof.

Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
---
 fs/nfs/proc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/proc.c b/fs/nfs/proc.c
index 5552fa8b6e12..5919878549d2 100644
--- a/fs/nfs/proc.c
+++ b/fs/nfs/proc.c
@@ -594,7 +594,8 @@ static int nfs_read_done(struct rpc_task *task, struct nfs_pgio_header *hdr)
 		/* Emulate the eof flag, which isn't normally needed in NFSv2
 		 * as it is guaranteed to always return the file attributes
 		 */
-		if (hdr->args.offset + hdr->res.count >= hdr->res.fattr->size)
+		if (hdr->res.count == 0 && hdr->args.count > 0 ||
+		    hdr->args.offset + hdr->res.count >= hdr->res.fattr->size)
 			hdr->res.eof = 1;
 	}
 	return 0;
-- 
2.21.0

-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
