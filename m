Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7935F372927
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 12:45:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4444F3C582E
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 12:45:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E79FF3C57D7
 for <ltp@lists.linux.it>; Tue,  4 May 2021 12:45:00 +0200 (CEST)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8CB1C1A00A31
 for <ltp@lists.linux.it>; Tue,  4 May 2021 12:44:56 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqJZ1XIXWDCoCRb46JyqWljvAE5qCEj2dJ/hB7H4WkoKOunHXF0Xf2lMsJlT2Qaqb4eR2S8/p8Z09wIZwXnNrJ6o8g0OLREykrW9cQiFyaYvORy1ER+MLCBXolzJBY+Y3hekDuONCKVo+rbZoxqQV+AuDSLJPE6p4EmBtVOL+gB8afJyztDIqb2y9DEC2bNR+w5sYeCDx0fpf7LD17gdbQynaRAvlwQghGCMzMDXpZomTMjwXWKPccALNz9SthhfgCKIO5NcGhPw3yYwfGVmm7/zZfLCfhMEYLJsna0olik1nTZUzQQy+PW/AyNz30jcpw6vR31KXqHV5SnCFtnZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NO02XsW6tFB3/N4t3ZSfEtlE87esdp6J0E8xCu5vQ7A=;
 b=UxjKce8iDSA0Ja7s3BnMkukmy4eyMR/n10MohGO6d74kS8dyyC5zTlUlArqMV9uZ7maKdhuqC/0DMKou7X2SxD3aprWapCypq6GvSX+lG1+Se0LohWjrfKT0Y13n41oEwYTq6Yj4S8fy5Nf1JJUuOmRX0jUb2diyslhvL/wtpCSIjLhR8AkWRa8hgU07TukS0wfGq1mX5ilP8xpWnNF0W7Gt1ntR6A08jQjQ7zmAzoQuYAlRav3C07ChGQfWLWOyDjVhYKknewboI1lqZcPZhgPBlk+bf8xX//6gnl9pVR7dhaReq9C1f27lTRTdkSOoHnqnJZT6DHBmt1dDG4w34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NO02XsW6tFB3/N4t3ZSfEtlE87esdp6J0E8xCu5vQ7A=;
 b=WZTeRhhGdhLgJnXMOcKN3prN30AoPl2j+zLjuRTWHwoXgqpkNA7wQckKlj0E9csfxMG5G3cOw4ljzVelXquVjcztYPOQ9Pdmm90DHsHiKs9hldxuObNiZ9nQL+dYpdnvVbDCs874swFh9ztw3WTEGN0cTH86iBloVuSET6EYXmw=
Received: from SA1PR05MB8311.namprd05.prod.outlook.com (2603:10b6:806:1e2::19)
 by SN6PR05MB3933.namprd05.prod.outlook.com (2603:10b6:805:27::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.10; Tue, 4 May
 2021 10:44:50 +0000
Received: from SA1PR05MB8311.namprd05.prod.outlook.com
 ([fe80::c12b:982d:9085:a7f7]) by SA1PR05MB8311.namprd05.prod.outlook.com
 ([fe80::c12b:982d:9085:a7f7%6]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 10:44:50 +0000
From: Ankit Jain <ankitja@vmware.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH] realtime/func/pi-tests: testpi-2 parser
 indentation fix
Thread-Index: AQHXQBCVnUpHpZD8z0mAhXSWyLsW4qrTHs5u
Date: Tue, 4 May 2021 10:44:50 +0000
Message-ID: <SA1PR05MB8311C13BCB37A122FBB66337DD5A9@SA1PR05MB8311.namprd05.prod.outlook.com>
References: <1620029239-31643-1-git-send-email-ankitja@vmware.com>,
 <YI/gQjOJK3dtjiPr@pevik>
In-Reply-To: <YI/gQjOJK3dtjiPr@pevik>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [122.171.54.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce153fe6-ace4-4f3e-7858-08d90ee9a49c
x-ms-traffictypediagnostic: SN6PR05MB3933:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR05MB3933A66663D41A23C425D572DD5A9@SN6PR05MB3933.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vO2fHbWw7bAN63Rx5vQ/KORCSpI5m5nF4keRTK8D583++I1lfUQ2V5zJ3kfOkfSX/dQQhe2I+ZuHS/lNnG3m3SrVXF7Vl+rKaZslqznDp2PQXMvPyQLYAsf3RqNuHzTTA2jCkdKNyoUw7mRaacVYnHsbggUFS16meZFRfhUOMKbW6Z2FhsoND2yhxw4OkdDEVmR79oynwAhByaFWh/PeK8QwDJ5gP/uPgHDszxOMt60VtvnmlW7GemZFFK7mAS3GkMG/N6Xp5pAGkE30M78OsO2jkMgB6tdGL97uEriZ2PzpcWTzyqRQaOHYmr75PdOncvzUBXnuj4vPLZHY9+tQ5ZRkwhYKLQQbILRdcNxj/xTSP3MvMydrL6DFta5R7TieG2pyz3mKc+9VSYP4A8/MQgzGYkIByMlrdMbHLsxSG2dYv/uNHsr6v/uDWEgRiJlfJLXwi3RN9yYcgpD/SqTmO+aYTt5nvuc2ilu1hii/WfjOmSmoSCxeza6ijQbK/HXq2309D4NrhcphWa9BQdITRavWeI85KGDxztRa6FrtZUMftxpU5PoXVln0oY+r5Pie0+6zt9pnuTIVPKN5cmJz0gpK2RfevXXr4K4ptKSjXfc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR05MB8311.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(8936002)(54906003)(66556008)(9686003)(5660300002)(91956017)(55016002)(4326008)(66476007)(66946007)(86362001)(316002)(76116006)(33656002)(52536014)(66446008)(107886003)(8676002)(64756008)(4744005)(2906002)(26005)(122000001)(6916009)(186003)(71200400001)(7696005)(6506007)(478600001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ZF4WYHxv10HsMm40asqd+NxWtIpJPtDRuD2rZyvo4/SCxGl9yCl/jKb00yKn?=
 =?us-ascii?Q?OzjmrDHD6dhqM3Cf90TaOpm3zVG+zTDny9BZLiT4XMOBV6/FqfIaH6wAC+la?=
 =?us-ascii?Q?8r/rtsOflKKKwyLLtG0cCsHMnpg2NWaicIlJmyNwVXRK7QnVUCg3Kc2fgJH5?=
 =?us-ascii?Q?F9IW4qztaOmAVc+jvGW3NGyBHx4qkJ+hJMnt/D7opxyPpjVlCtkczMc78HJo?=
 =?us-ascii?Q?BdYAyoGucU03lqodZk6uy0a9TRA/4t2/GdigDrGl41BjFjc2fv/+A3ZxhT4b?=
 =?us-ascii?Q?GPsc4CCWes3qPkfVXeeBO5FxWs11SLl7MF15A/Ow8UXxNmXtjMRHTaA4fuHy?=
 =?us-ascii?Q?R8f9rxQbUvVV+Qh5gbnkf0WbXFNJMVhcmkRKAbzCC58pTATagHmKVxWaH6gc?=
 =?us-ascii?Q?UKvFeqjnS+IbewvvOmGKtg76bTe1YIBvDug9tCKYFQQK+w5YeJhvLsQoPiCh?=
 =?us-ascii?Q?oE9rUWsWUWxjCV6C4dlhSPuObskkjdfWoTZxdJjBqWD1eyOkaFf4l9HUPf8o?=
 =?us-ascii?Q?Uxs2S8RrGdWSzKPDk7AcILoRWKM+9Gerf4pkWeeqFmHIeHyKd3qdtXKzXkef?=
 =?us-ascii?Q?72IGM+NWUwhkPAM2mVj+ej9Wtpxk2HGJ8GJj0x2w27tHUAAvAANlDXeUEUvQ?=
 =?us-ascii?Q?Ql7Sok3qV7dGK5+qhQMJSpTsfF5aIPPXDoRUPnKb02M5gkd6nJ2dK1eUyQ6i?=
 =?us-ascii?Q?bpyBXaqkBmdByPuaNLKO7+PXFIN4Z3T19iH+Y16X4IRhmafxl21rdez0KukV?=
 =?us-ascii?Q?TL7hm6eGXDNiXY+BAuUIqSzvKuHJzgrS7mOIMMfVkYsPgQynTvcUU4kGppdk?=
 =?us-ascii?Q?1y5IASE50PSSSJGfpEpX2I4JQv2ydfYlJSO4DYCGqoaFUm7pq5IljTVLFloh?=
 =?us-ascii?Q?Soxet9SHbLeFpwU/zagLlJR6NhnLaUanVwLQJFb6RizggTDMsS7BqVAnx5GE?=
 =?us-ascii?Q?TvTcbhuMUe4LfFl6IrRKgFVjQd0HrRU1ygs++oRDFD2Lk4GC5MQspM4CwrZp?=
 =?us-ascii?Q?JWXbND08IqDKdciGud1FBCfrnouaSIkrBBxQSQ2mQcg/8NU1Hf/rb1yDwMOV?=
 =?us-ascii?Q?EHvImR3aHGOzaHRb4uvH4QIc/Y4bfD6aBScwHsqazPhSJL9WT38+KukBnHAS?=
 =?us-ascii?Q?FupOBQL6uTjCsbPsQjq18iIWXZNl/qb6TIt8XwOEPvQPxmMmE2pUIKUp8KDW?=
 =?us-ascii?Q?wVWedXDn+YLKIatUbWr9wONNDjPswxjoeuzofyMdLA85VdXbhiV6EdHF3PoS?=
 =?us-ascii?Q?2J1q2TROexefhPCTLCiFJOSWzb+goQ3d1pLKhvv/p8KrpL1WtcE3wHdttmsb?=
 =?us-ascii?Q?wTko7a9s9yLhsmM9guJOoySRTDqrxTrWdoBb2YfyJsKZ1g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR05MB8311.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce153fe6-ace4-4f3e-7858-08d90ee9a49c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2021 10:44:50.0188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ipYel1UXSAuO44lKeluOXPO3kly6RrrNTeQRgOMLpsME+LIZymgtczc8IUYOUjkMhhGJS0qFqZNSEUuPFUV/lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB3933
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,HTML_MESSAGE,SPF_HELO_PASS,
 T_SPF_TEMPERROR autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] realtime/func/pi-tests: testpi-2 parser
 indentation fix
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
Cc: Sharan Turlapati <sturlapati@vmware.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Him Kalyan Bordoloi <bordoloih@vmware.com>, Vikash Bansal <bvikas@vmware.com>,
 "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
 Srivatsa Bhat <srivatsab@vmware.com>
Content-Type: multipart/mixed; boundary="===============0932348434=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0932348434==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SA1PR05MB8311C13BCB37A122FBB66337DD5A9SA1PR05MB8311namp_"

--_000_SA1PR05MB8311C13BCB37A122FBB66337DD5A9SA1PR05MB8311namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Hi Ankit,
>
> > There is an indentation issue in parser for testpi-2
> > which causes incorect parsing of the logs.
>
> Thanks for your fix, merged!
>
> FYI the patch didn't apply, not sure why, I had to use patch to apply it
> (instead of git am). I guess it was wrongly generated, please make sure
> you use git format-patch properly.

Thanks Petr for merging the patch.
Sorry, you had to apply it through patch instead of git am.
I will take care of it from next time.

> If pi-tests are really working and worth to keep (one of my colleagues
> realtime expert in the past didn't see much value in them), it'd be good
> to rewrite these parsers to shell (to avoid unnecessary python3 dependenc=
y).

Is there any other test suite or project which supersede or replaces the pi=
-tests in LTP?

- Ankit


--_000_SA1PR05MB8311C13BCB37A122FBB66337DD5A9SA1PR05MB8311namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:260723417;
	mso-list-type:hybrid;
	mso-list-template-ids:-62772132 222972394 134807555 134807557 134807553 13=
4807555 134807557 134807553 134807555 134807557;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0D8 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1960838200;
	mso-list-type:hybrid;
	mso-list-template-ids:-588999914 -846159478 134807555 134807557 134807553 =
134807555 134807557 134807553 134807555 134807557;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0D8 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:Calibri;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal">&gt; Hi Ankit,<br>
&gt;<br>
&gt; &gt; There is an indentation issue in parser for testpi-2<br>
&gt; &gt; which causes incorect parsing of the logs.<br>
&gt;<br>
&gt; Thanks for your fix, merged!<br>
&gt;<br>
&gt; FYI the patch didn't apply, not sure why, I had to use patch to apply =
it<br>
&gt; (instead of git am). I guess it was wrongly generated, please make sur=
e<br>
&gt; you use git format-patch properly.<br>
<br>
<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks Petr for merging the patch.<o:p></o:p></p>
<p class=3D"MsoNormal">Sorry, you had to apply it through patch instead of =
git am.<o:p></o:p></p>
<p class=3D"MsoNormal">I will take care of it from next time.<o:p></o:p></p=
>
<p class=3D"MsoNormal"><br>
&gt; If pi-tests are really working and worth to keep (one of my colleagues=
<br>
&gt; realtime expert in the past didn't see much value in them), it'd be go=
od<br>
&gt; to rewrite these parsers to shell (to avoid unnecessary python3 depend=
ency).<br>
<br>
<o:p></o:p></p>
<p class=3D"MsoNormal">Is there any other test suite or project which super=
sede or replaces the pi-tests in LTP?<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
- Ankit<br>
<br>
<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_SA1PR05MB8311C13BCB37A122FBB66337DD5A9SA1PR05MB8311namp_--

--===============0932348434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0932348434==--
