Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 512F79E880
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 14:58:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E0A23C1C95
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 14:58:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 60A4B3C136F
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 14:58:21 +0200 (CEST)
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680099.outbound.protection.outlook.com [40.107.68.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A1BF2140180E
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 14:58:19 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdDPN8DxDSTBFwxswdaXHXltlXKeWkZg9fwaK1ac1oFLixz+K3ORWpQuiip3ApRedzvYffYeH+wON0URto++tfdmvn0d3uEn6KUW9rqMW9b4vczRQ+9vCZFd4ph1TPUSbTeknZEczXHxsoBPqTiUnmf69BebmPCbVUFZ3CSqNs/kXxS1No0G5bPdLsH6uLRcg6SS2rydMGg6gKV7n2kGVYXJgiCAxpyv8nROLc0Rxkn3upOJmSDuTOWAHt4bTXX5GeQ5dhUxB1BmXTg5YjOh5WbzeHhA8BWNsPkf+TcDlbm+kv0HzE9gr652xNp8iAJMtjCY9hJjoqx+tBUEv3uiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/C4PkNQedwNYM1EURSjwvdEGsXbXUrRck47AsO7/eU=;
 b=JPmrRdijjnqoNNuYbsrJKaCCqILIWNmSJfWGt1gXjJO3DxO1ZQo1xd6zagrwbvPdURCinyD7nzoFiIuc611pVfGttr7tt0CHhuP5BWwCLoQkkDEy/yviAwUoBvmHkQ1iGi3NM/jGTtB7SpMk+LtO8RKNBrwriHNoT/BHVTmPhOZnyBede0HrqyXNoy7U/suvbiiXnL8cag0FDGtMSOMlDJro1iy5DubV8wuyVTkLLjYIMIXEz8wuUBS8BqkvuXQfjgHh2FwQ0qiBPF3TTvea//36FH+rvef5H69gk1usDz+HwU43gOl/9OdE/JpJkOsdS3uvA7hZeuSfyRAdP7P/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/C4PkNQedwNYM1EURSjwvdEGsXbXUrRck47AsO7/eU=;
 b=XRSKmg+toZ6E5ur/RzPEHpWpO0nwh29RixbNhx66o0g4zLcbUeItb4FbqrtKsMXMWKwdSrLVNlk81G9KG3CU6i46IKKljlrVsBiZfl2ezmknVk+MgwVNRXvXOsKSJnByDUizqjZECcs2bsxJfEXX/TBNDTypJ8G7GPJ6mO2v1mY=
Received: from DM5PR13MB1851.namprd13.prod.outlook.com (10.171.159.143) by
 DM5PR13MB1578.namprd13.prod.outlook.com (10.175.110.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.14; Tue, 27 Aug 2019 12:58:16 +0000
Received: from DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75]) by DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75%7]) with mapi id 15.20.2220.013; Tue, 27 Aug 2019
 12:58:16 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "jstancek@redhat.com" <jstancek@redhat.com>
Thread-Topic: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed
 to run cmd: useradd hsym
Thread-Index: YFeV1UC3LeIsRdovt5+kMdO7I/BycvuMo5UAj4lK/k3wd0xbAPZWZFoxiapkYwA=
Date: Tue, 27 Aug 2019 12:58:16 +0000
Message-ID: <294428f05e4dba1a6b10b8744cfa5da0637f84a4.camel@hammerspace.com>
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
 <20190826104127.GA14729@haruka>
 <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
 <CA+G9fYsHpNKFHr=ZukVvj+uMJDyHj2Xwb9bCfzPQyYzMjZ0rCw@mail.gmail.com>
 <203971593.8175020.1566830285708.JavaMail.zimbra@redhat.com>
 <fcd20866bb836d45b1e384dd68080c671bcde938.camel@hammerspace.com>
 <2039173876.8300255.1566861172742.JavaMail.zimbra@redhat.com>
 <566e862d9bfaf88cdde6d66f0f59033fe6225a22.camel@hammerspace.com>
 <866876796.8349197.1566901536625.JavaMail.zimbra@redhat.com>
In-Reply-To: <866876796.8349197.1566901536625.JavaMail.zimbra@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [68.40.189.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cb6392f-fa45-4bd5-a064-08d72aee3a4e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR13MB1578; 
x-ms-traffictypediagnostic: DM5PR13MB1578:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR13MB15783D05D2CC0AE37C3DB1FDB8A00@DM5PR13MB1578.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(136003)(376002)(39840400004)(366004)(199004)(189003)(478600001)(71190400001)(53936002)(66066001)(6436002)(71200400001)(86362001)(1730700003)(81156014)(81166006)(8676002)(6512007)(5660300002)(5640700003)(91956017)(66946007)(6116002)(66556008)(66446008)(36756003)(118296001)(8936002)(76116006)(6486002)(6506007)(6306002)(64756008)(186003)(2501003)(2351001)(2906002)(76176011)(66476007)(486006)(6246003)(2616005)(476003)(26005)(25786009)(3846002)(966005)(102836004)(14444005)(14454004)(11346002)(4326008)(99286004)(7736002)(54906003)(305945005)(6916009)(256004)(229853002)(316002)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR13MB1578;
 H:DM5PR13MB1851.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VZElwg4Xi9UB1zKFdCKgk56rwCJWEoK/BU+HvS9g6Mogmm0LMEtJ6YrJRjW4K/HQ6z4PxAyGlWuH81jqYvNt4+6RcQo7V1SFiWDhGtKH3dqX8f2RLzWInrF254HjkpaZ81WbXM6swl3ifBXhe3QqyENzLvxGX1l1cpHmfvuytisjA/j7A7bVz6VvBOuOIx677f/gH/z2hH9XDVHEYYICaf2HNjlcLB5gtBU8MFGNlI1Y4rDacUTGku8M7swAdahqDLzosFWEE7fQPeIefPK6RC4kUraVk4Ab5o8WHn9LUEs0VDbY83iShbgNMkDVTLGfLBlMXezy+FbVB+fBz1Wm59ZMBsfSz9xEp7DLa6PCzrGB7RpZ0ETf/s4OP7cXeFxRsnR/EDo5L/fR/jY45mNgT4mskFrRJ8hWrHAD8GuM0hw=
x-ms-exchange-transport-forked: True
Content-ID: <3BAF43BB42B35B409DA83EB004335E6B@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb6392f-fa45-4bd5-a064-08d72aee3a4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 12:58:16.3949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNGIzV3qjUqBWzqLiyxFqHgbfg4Xubn971yOa0xSxiuixPBv8i3gFMQ5/IM2rJgJpci/RpUnzyyQGowR1cszow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1578
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

On Tue, 2019-08-27 at 06:25 -0400, Jan Stancek wrote:
> That theory is probably not correct for this case, since EIO I see
> appears
> to originate from write and nfs_writeback_result(). This function
> also
> produces message we saw in logs from Naresh.
> 
> I can't find where/how is resp->count updated on WRITE reply in
> NFSv2.
> Issue also goes away with patch below, though I can't speak about its
> correctness:
> 
> NFS version     Type    Test    Return code
> nfsvers=2       tcp     -b:base         0
> nfsvers=2       tcp     -g:general      0
> nfsvers=2       tcp     -s:special      0
> nfsvers=2       tcp     -l:lock         0
> Total time: 141
> 
> diff --git a/fs/nfs/nfs2xdr.c b/fs/nfs/nfs2xdr.c
> index cbc17a203248..4913c6da270b 100644
> --- a/fs/nfs/nfs2xdr.c
> +++ b/fs/nfs/nfs2xdr.c
> @@ -897,6 +897,16 @@ static int nfs2_xdr_dec_writeres(struct rpc_rqst
> *req, struct xdr_stream *xdr,
>                                  void *data)
>  {
>         struct nfs_pgio_res *result = data;
> +       struct rpc_task *rq_task  = req->rq_task;
> +
> +       if (rq_task) {
> +               struct nfs_pgio_args *args = rq_task-
> >tk_msg.rpc_argp;
> +
> +               if (args) {
> +                       result->count = args->count;
> +               }
> +       }
>  
>         /* All NFSv2 writes are "file sync" writes */
>         result->verf->committed = NFS_FILE_SYNC;

Thanks! I've moved the above to nfs_write_done() so that we do it only
on success (see 
http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=3ba5688da709dd0f7d917029c206bc1848a6ae74
)
-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
