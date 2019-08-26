Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA32C9DED7
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 09:35:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70AB23C1C98
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 09:35:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B20A43C02A0
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 17:58:13 +0200 (CEST)
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700104.outbound.protection.outlook.com [40.107.70.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BE2351001754
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 17:58:03 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIx6MXqqsuAR3N+M3ioFwi3d6I7kX7gml+0ndR7NL/IrknAePCIsphE0ItS+4URF6Q98pMSTJmgldUlK/7srZIvxC6y0gx0Drug6qsZhqNidkrKu5dCO2bDKFEPEbnaTgsIqiEnLJARkuxprOooLYh98SYX4X/TvX9kjhWT0sBBQYJuqPeQIIWT63E3dxHXfo9OhHZSv3ig18JHMjUFghzjJ5yg6jrOvXDmZHD4GeI5zDqRC2h3FjHP3c+yl9EWzahgyi0s/FpUS5YqNuAH1qob/NhqI2IJ0MoIj6ghIoPxnqZMXIZkfZCySlf3kHMOprAmy4iyoXH9VUHoN1LA+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3livyXFbZmRcksN3UJ44A495x69C0g2qogsuns2cSxg=;
 b=klWfSyeiTfh+yKjyvYXSbNZM8AbrcgtQVJUMFerrlI5rrrvhNAxsK/IKm0vGoE070vBwichFRLNc6h+1E5KZFVZ9rQW4K7vwQSgcsfNeahB/m5OZjGnZXtGy9kY7VFzsueinsL04iLCbRf/KdVsj26GduZK0vbxNJAKZ0J0BEYNAuLyaYdZ0RCPq298ZxTzOXrd7MQ2fX3cZ/tUC2AFgiuY3zEJSqi1ldEeXXDQsvwpSJGIxTFwsM+Lt0OgR0qSti3/yBU5lGZNaDNH/4UoBYHg3PJc72WqmCPYSrx3YsUneaBWzqE2Kq8gH8Cxp8yauefpGQxiTQNBVEYgS7OXLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3livyXFbZmRcksN3UJ44A495x69C0g2qogsuns2cSxg=;
 b=AzJ0CXOsHZwo4fVRrJdD++Y9TCzFTIlLxpOLpjIYQES6vt2cz2eB3aLtgJlYAncp1FTb0EnPus+RVvlWA3vnRxYo/347amn1xOe0gOVXoR4Iy11dollwzoDNOQTmlX3V4xjIeifaahQVFybhNQyrFD85YakWgNvKrHd6aGp/jlE=
Received: from DM5PR13MB1851.namprd13.prod.outlook.com (10.171.159.143) by
 DM5PR13MB1193.namprd13.prod.outlook.com (10.168.237.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.13; Mon, 26 Aug 2019 15:58:06 +0000
Received: from DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75]) by DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75%7]) with mapi id 15.20.2220.013; Mon, 26 Aug 2019
 15:58:06 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>,
 "jstancek@redhat.com" <jstancek@redhat.com>
Thread-Topic: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed
 to run cmd: useradd hsym
Thread-Index: YFeV1UC3LeIsRdovt5+kMdO7I/BycvuMo5UA
Date: Mon, 26 Aug 2019 15:58:06 +0000
Message-ID: <fcd20866bb836d45b1e384dd68080c671bcde938.camel@hammerspace.com>
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
 <20190826104127.GA14729@haruka>
 <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
 <CA+G9fYsHpNKFHr=ZukVvj+uMJDyHj2Xwb9bCfzPQyYzMjZ0rCw@mail.gmail.com>
 <203971593.8175020.1566830285708.JavaMail.zimbra@redhat.com>
In-Reply-To: <203971593.8175020.1566830285708.JavaMail.zimbra@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [68.40.189.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0c14d9d-4a02-45aa-cb3b-08d72a3e2f17
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR13MB1193; 
x-ms-traffictypediagnostic: DM5PR13MB1193:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR13MB119375D054E6A6C184836005B8A10@DM5PR13MB1193.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(396003)(39830400003)(136003)(376002)(13464003)(189003)(199004)(71200400001)(53546011)(2616005)(476003)(186003)(966005)(26005)(8676002)(478600001)(6246003)(118296001)(2906002)(305945005)(6306002)(53936002)(66066001)(8936002)(446003)(6486002)(5660300002)(81156014)(81166006)(14444005)(256004)(11346002)(2501003)(7736002)(4326008)(14454004)(36756003)(86362001)(6512007)(110136005)(54906003)(76176011)(3846002)(6116002)(66946007)(64756008)(66476007)(66556008)(91956017)(66446008)(76116006)(71190400001)(99286004)(6506007)(229853002)(6436002)(25786009)(316002)(102836004)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR13MB1193;
 H:DM5PR13MB1851.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 607cCHGyMdwGZB2EoB8QeagfV1YSGZRKySWy7EBRa6RsbBgUA7NoK95yMtf6rFje2pvTH0ssD/WHWRq22MmrEkB5FIdZE2fQ+/eCwaZMQqb10szEo4mAGrxhLfQTrEkNKuhT2RMgOg7V6bE4NYKs6zJnQUhZdP0TLgVbtQjmq6hRxAlgAKoHa3107tcWLtzSFcN4VK+pKS1DIM1qDCeISZeFBsZAaSBpcHz+kltc+7a/lhV6xYKBPwemx6yO8QGb3U5vQjEzX2SVFke3kzTQKhwpamIqhL28cpz1wVH360VpgMfyEjdjDYo8u7/ZpGFr+k26Z3q3ZpFBllgH7f3MnA5y8CblEmIHcgiEczKKdjLSkzqYRfPrvxMVfoAJ0ov4ue/mR7NdfiQOTzoq6I7m1/G+BuyELfNFTSASV9IZ3yw=
x-ms-exchange-transport-forked: True
Content-ID: <594F395B996E124B9C666F10A11B7824@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c14d9d-4a02-45aa-cb3b-08d72a3e2f17
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 15:58:06.1592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mdRXu3VtSLCIzWigkcglnGMCCqKT306B8NDY6MQqqpgf/nz1nfYeBi9ADViRut5wWnxQbHlv4Jj9pm+qdh4L2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1193
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

On Mon, 2019-08-26 at 10:38 -0400, Jan Stancek wrote:
> ----- Original Message -----
> > Hi Jan and Cyril,
> > 
> > On Mon, 26 Aug 2019 at 16:35, Jan Stancek <jstancek@redhat.com>
> > wrote:
> > > 
> > > 
> > > ----- Original Message -----
> > > > Hi!
> > > > > Do you see this LTP prot_hsymlinks failure on linux next
> > > > > 20190823 on
> > > > > x86_64 and i386 devices?
> > > > > 
> > > > > test output log,
> > > > > useradd: failure while writing changes to /etc/passwd
> > > > > useradd: /home/hsym was created, but could not be removed
> > > > 
> > > > This looks like an unrelated problem, failure to write to
> > > > /etc/passwd
> > > > probably means that filesystem is full or some problem happend
> > > > and how
> > > > is remounted RO.
> > > 
> > > In Naresh' example, root is on NFS:
> > >   root=/dev/nfs rw
> > >  
> > > nfsroot=10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extract-
> > > nfsrootfs-tyuevoxm,tcp,hard,intr
> > 
> > Right !
> > root is mounted on NFS.
> > 
> > > 10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extract-
> > > nfsrootfs-tyuevoxm
> > > on / type nfs
> > > (rw,relatime,vers=2,rsize=4096,wsize=4096,namlen=255,hard,nolock,
> > > proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=10.66.16.123,moun
> > > tvers=1,mountproto=tcp,local_lock=all,addr=10.66.16.123)
> > > devtmpfs on /dev type devtmpfs
> > > (rw,relatime,size=3977640k,nr_inodes=994410,mode=755)
> > > 

The only thing I can think of that might cause an EIO on NFSv2 would be
this patch 
http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=627d48e597ec5993c4abb3b81dc75e554a07c7c0
assuming that a bind-related error is leaking through.

I'd suggest something like the following to fix it up:

8<---------------------------------------
From 1e9336ac5363914dfcc1f49bf091409edbf36f8d Mon Sep 17 00:00:00 2001
From: Trond Myklebust <trond.myklebust@hammerspace.com>
Date: Mon, 26 Aug 2019 11:44:04 -0400
Subject: [PATCH] fixup! SUNRPC: Don't handle errors if the bind/connect
 succeeded

Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
---
 net/sunrpc/clnt.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/net/sunrpc/clnt.c b/net/sunrpc/clnt.c
index f13ec73c8299..a07b516e503a 100644
--- a/net/sunrpc/clnt.c
+++ b/net/sunrpc/clnt.c
@@ -1980,9 +1980,11 @@ call_bind_status(struct rpc_task *task)
 
 	dprint_status(task);
 	trace_rpc_bind_status(task);
-	if (task->tk_status >= 0 || xprt_bound(xprt)) {
-		task->tk_action = call_connect;
-		return;
+	if (task->tk_status >= 0)
+		goto out_next;
+	if (xprt_bound(xprt)) {
+		task->tk_status = 0;
+		goto out_next;
 	}
 
 	switch (task->tk_status) {
@@ -2045,6 +2047,9 @@ call_bind_status(struct rpc_task *task)
 
 	rpc_call_rpcerror(task, status);
 	return;
+out_next:
+	task->tk_action = call_connect;
+	return;
 retry_timeout:
 	task->tk_status = 0;
 	task->tk_action = call_bind;
@@ -2107,8 +2112,10 @@ call_connect_status(struct rpc_task *task)
 		clnt->cl_stats->netreconn++;
 		goto out_next;
 	}
-	if (xprt_connected(xprt))
+	if (xprt_connected(xprt)) {
+		task->tk_status = 0;
 		goto out_next;
+	}
 
 	task->tk_status = 0;
 	switch (status) {
-- 
2.21.0



-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
