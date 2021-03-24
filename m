Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E838347486
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Mar 2021 10:27:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DF203C9438
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Mar 2021 10:27:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C8E613C9408
 for <ltp@lists.linux.it>; Wed, 24 Mar 2021 10:26:59 +0100 (CET)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390092.outbound.protection.outlook.com [40.107.139.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 49E2B14010DC
 for <ltp@lists.linux.it>; Wed, 24 Mar 2021 10:26:58 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrF5hWAUbgNeQSO0gScJTjgZExU0L/qvzW4ys3gI4gI+Ai/XERE9h3T56MrAGwvbccaC0HipPYBaaR42gECvq2+v86vCtXLxXlGU3J5e7OFLs3nYOwW/h81x0RCBiKNUyFaMksmgsH5DWZF9DMjXQNvvlO/0W5vO9ywlrQNSaEfYTjkCxwy0NHOB42pacJwVQhdbskvkhlIlGiNATzTVBlV3bpAoP8cEmnPvlZBzFLIVDI102XaibthAqxdSphtqvrGmKhx0eG4N1TdEH39csFBdIvEWeEc503X3lcjQFOrBkWber6gPBynXY9jC9fa0t0AxR5crJAzje4ujVie8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMRLZX5cIs2g7Xs+m454mh+PfDUHvVwEGiOcotrpYoc=;
 b=WBNhcWDeY6+bxTZALXF3n5iZ8zGQH4yTeyzNdKhocx/HNEaYSfT8ubIISj74CNmeT0kyXxTU7CFUI6IpHj1ZX2bZGxm4zUyh/Pn/PUWHwO+MyXjwq9H1jvScs6KgnrfvuBN/0/oF0q5mpKe2B32nDRAipbmKCLORnYj8l1tCuoVeK1ITF7Veey+lirYXpqVZPR15cf4FlRCrCt35mLCAUG6E/An4cVuwVv/+T0EhVUs3wcDOKeZKnxtNoS4R8+EfKIwMNKhYmL4B8fnGgG48EaNhqfkT+fPd13vEj5QeeE7h0jAZtcvkvwv39kcHx9hS89Uhn+WXmVDVMJcIrUc1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMRLZX5cIs2g7Xs+m454mh+PfDUHvVwEGiOcotrpYoc=;
 b=Yaf3PSag9+agSRnSFyna5e9DiU0O4JPEdJA37Ck+vU7z67Mz+qPPMEQD6xdmAdI60ib0zxuG2mHVCi07espcd8smJhG5YbrKYzCl37zauOeCkiKZPaCkj9IDzvwEbremEpTqqHa5RN+I5Hjed4DOLfQ6mcx84tYH4bZmsPwOxyY=
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2f::22)
 by BM1PR01MB4961.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 09:26:53 +0000
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::10fe:7e69:3f57:8f77]) by BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::10fe:7e69:3f57:8f77%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 09:26:53 +0000
From: "Pankaj  Vinodrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Joerg Vehlow <lkml@jv-coder.de>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [LTP] kdump failure on x86
Thread-Index: AQHXH++0pS2jX1RCe0OAcFN+RYlWWKqSz0wAgAAQdt0=
Date: Wed, 24 Mar 2021 09:26:53 +0000
Message-ID: <BMXPR01MB28704FBCBB43FA5BE924AF12EE639@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB2870D7110A3D2AD3DF1B495AEE649@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>,
 <cbc294d7-830c-9491-13b1-836be7da043f@jv-coder.de>
In-Reply-To: <cbc294d7-830c-9491-13b1-836be7da043f@jv-coder.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jv-coder.de; dkim=none (message not signed)
 header.d=none;jv-coder.de; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [2409:4071:e9c:19bc:8d25:c718:4639:61f5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4d137ef-5a63-4289-7ef8-08d8eea6f626
x-ms-traffictypediagnostic: BM1PR01MB4961:
x-microsoft-antispam-prvs: <BM1PR01MB49616B90F3DF04849C8074B6EE639@BM1PR01MB4961.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7L82C/Htg3YxORZHuBuNnXHvF+nB9PoJM7pqFQ/S5RTYjOeF580fpgBvIPwHerGEfAkLKpq7NkQRmgaQnyjkCntDIeunGXMLKOAWRcqBbk4AQfu+/guOORJSIWwcWWWvmhKAsToY3PTXU+rRl7vfPW8k39oo5wdvrgnEcNnmsu0rxMJ1D1Vv+W3HnyXydNAnSpiYCN05R5dZ+xB+Vc9svM38+73/oBTa1jono6iq2/zGspSjHtcg2FNFYNcmL/jJhm6yjBhKBGtTZBA/tPyjlgmEuY86rUm09qWqJoMyRujVsy8mTlvO1Wnxjb9cToD6JGf7LjIsZ4z6M43SPwU3TnL71ZjhIk8NmnkZk2wQpnO6CcMVYuQa1twkCIRfv95PPpIag6JBRzmQfLeZeD27Y48IMlTd+xX/5J4kLVSIKNY0R5Mh/Ox8vVTrxJRJoYPzsjvWSMz2dU3Lefg574wX69MUdCTxpqbjawCTATeeg0qsC6XzSCyzivcJ4+hH4jHQbj4CqJYX3x/KCxBwhV6qUZxmjtBM+rrcdm7FK02r0h3G6RVH/SS7IvaRGPbP5yliy/AiijHt35ghjrsg/tKXyive0pUCxxlTok43wxeqcdIeClm1kVw0bc7GpleQJ6mmGsadPkt7WA227oDKFQ8Ze25VBiaGd1Fci4kgjEoBxxFRpNvunjBcBUKnuSaQ0SZVKBvrpkyvTgWCNqKeQ64GfBjZJcPpdSv3HVhSWJWjtts=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(136003)(346002)(39830400003)(376002)(396003)(366004)(478600001)(966005)(8936002)(6506007)(53546011)(2906002)(64756008)(55016002)(38100700001)(19627405001)(110136005)(9686003)(7696005)(71200400001)(186003)(166002)(86362001)(76116006)(66476007)(66946007)(66574015)(83380400001)(4744005)(52536014)(316002)(8676002)(5660300002)(66446008)(66556008)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?B7pfia3R7BNaHrNabBkbo0DdjsBqkeO5jRTKTEgwKxbnHB4lpozFJVNjHC?=
 =?iso-8859-1?Q?e3gHmXupj+b/mQgJebBpcZ/J9kG5mIKyFlkQX76IC89t553qZjB3fITST5?=
 =?iso-8859-1?Q?6MicqO8S+8h+8uiqbTrXVg0+GS9qAW5M7tp8okYNL9lVokJNBMOu7yf8P4?=
 =?iso-8859-1?Q?OBulqC4k7ZwYWpsx7n5+qrbZm4G09MwP2oUMt5kFs7uizhqhB3xkGkn1+z?=
 =?iso-8859-1?Q?xMW/dF6l+ldSjbGcHuDjhJ2a1+EYfCJJzkeY5P8ox+alkrdC8b9HMEh+Co?=
 =?iso-8859-1?Q?/JRRaVCkChXRi0XcIimBrpr9sFUFtRboS9jXK8VoIIPGMR4rgS7t6WOsDm?=
 =?iso-8859-1?Q?M7mKOPU4vAg2nA6YntXk5ucFUBMt4y996ErSPPWcSZoo3jll96y7sl+83P?=
 =?iso-8859-1?Q?PF09MT6B4x803KDnmiPZhAb5E3+nUCXuzs++FXOfRmTTDrQy4EhxbMaiXR?=
 =?iso-8859-1?Q?mASdDKlO3TXcDPeJfWBI3GHVcrYFbmRpLsE6nfHq+zh1h8Q2z1HlA8L1j8?=
 =?iso-8859-1?Q?t20gP4xpkzDtjmSB5Bfbe6D2Zs8AV4Hm/+si4xL/89tsB/jLx88QhKGaJa?=
 =?iso-8859-1?Q?7d+LaCJYJQgh+Db8I+MpGTGEY9RMDdCOXaHPpgOxft55cAMex7Atr64zrA?=
 =?iso-8859-1?Q?mSuU1mNvCKXvn01mCS8eqhWBdvy79MuPHHd0uWZCiUlDTHEhmjCZMyKC/A?=
 =?iso-8859-1?Q?SSEXB4kUFPAvX1TsME9g4bqlIgVHJkEc2utG2zzC+Ud75Qr0MGFJU+tdzo?=
 =?iso-8859-1?Q?3SU3Tqiy9DqoFSH47lVy9H3tqYqxM5D9JfwfTzlWSn3cnWIenpKX6e+0FR?=
 =?iso-8859-1?Q?gLno8GOmlOKdEdx3GPC1hpT7MufgAM5wIZ5ha5YbwmmXFCrTvy06NdmR4v?=
 =?iso-8859-1?Q?zg4wqX5WjRT0yQg+jLIwwhaB6EHqWFUzKVp4jLrdGKpek92UBBlYOufcr0?=
 =?iso-8859-1?Q?IWTsrF4Hm7I32JkNUj1taD1LDtFMb2jDqcOzcIMcA+auPRJcr9ptZzAnpi?=
 =?iso-8859-1?Q?tOgC4XyC4qMeYNBWRbAkPeiA6R3dwNY8PTjPvJ38k9DdgTy2glTb/FZBmy?=
 =?iso-8859-1?Q?XfeH4qbYuvAzCDEiEf1IfaD1kHc7JMbhE/n+6ntZ5UNyxYt2JtNSiJ6mXy?=
 =?iso-8859-1?Q?99nS9ubYIakrP7xVE+tWzTtkGHFGBcAKVuubg/sSgXyN5npRy7PNZJT9Rl?=
 =?iso-8859-1?Q?3uK2aJSKAeOiGT9Wdeu3x8T1Y1mfNjHqZXL63dCPS4awIscZ0D4wGlhxqG?=
 =?iso-8859-1?Q?Xs3dMq/ezzKePn4jwL8hyN4DXBtq/s0gzhQWKJEBnm3ZqhUalvorkceq3n?=
 =?iso-8859-1?Q?rq5WcimuTNowbZb3gis149PzYCd0B04gxcA2t0h4GsGJdgPVEJoXS1prWN?=
 =?iso-8859-1?Q?AyxC/cvcenzBDwoOD5ZAEXTIQ06eS4/rQJJqxkudR8N46hVs9cLdWX32jv?=
 =?iso-8859-1?Q?7lCCZt6b3Mk6JmWh?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d137ef-5a63-4289-7ef8-08d8eea6f626
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 09:26:53.3405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z0xDxIQNQj+SJJDs1+9ngytX6rT8+OZKWDL9gXtC7vYR2hM9Ti1nYR+Qy7iSpcSbXgsTEGrGJuJRc+zOu6oHWh3PJ4YOSeuZGrQWqQhquj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB4961
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] kdump failure on x86
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
Content-Type: multipart/mixed; boundary="===============0896141617=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0896141617==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB28704FBCBB43FA5BE924AF12EE639BMXPR01MB2870INDP_"

--_000_BMXPR01MB28704FBCBB43FA5BE924AF12EE639BMXPR01MB2870INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Got it, thanks!

________________________________
From: Joerg Vehlow <lkml@jv-coder.de>
Sent: Wednesday, March 24, 2021 1:57 PM
To: Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>; ltp@lists.linux.it <=
ltp@lists.linux.it>
Subject: Re: [LTP] kdump failure on x86

Hi,

On 3/23/2021 3:27 PM, Pankaj Vinodrao Joshi wrote:
> Hi,
> i am trying to run kdump on x86 with 5.5.6 kernel but i am getting
> following errors, can someone please tell whats going wrong here. I
> have lkdtm config in the kernel and installed kexec-tools as well what
> could be the cause of issue ???
It looks like the testcase is hopelessly outdated... The jprobe
interface was removed in linux 4.15 back in 2017 [1]
The tests needs a major rewrite, to work on kernels newer than 4.15.

J=F6rg


[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D590c845930457d25d27dc1fdd964a1ce18ef2d7d
[EXT]

--_000_BMXPR01MB28704FBCBB43FA5BE924AF12EE639BMXPR01MB2870INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span class=3D"smartReply">Got it, thanks!</span></div>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Joerg Vehlow &lt;lkml=
@jv-coder.de&gt;<br>
<b>Sent:</b> Wednesday, March 24, 2021 1:57 PM<br>
<b>To:</b> Pankaj Vinodrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;; ltp@lis=
ts.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] kdump failure on x86</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
On 3/23/2021 3:27 PM, Pankaj Vinodrao Joshi wrote:<br>
&gt; Hi,<br>
&gt; i am trying to run kdump on x86 with 5.5.6 kernel but i am getting<br>
&gt; following errors, can someone please tell whats going wrong here. I<br=
>
&gt; have lkdtm config in the kernel and installed kexec-tools as well what=
<br>
&gt; could be the cause of issue ???<br>
It looks like the testcase is hopelessly outdated... The jprobe<br>
interface was removed in linux 4.15 back in 2017 [1]<br>
The tests needs a major rewrite, to work on kernels newer than 4.15.<br>
<br>
J=F6rg<br>
<br>
<br>
[1]<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D590c845930457d25d27dc1fdd964a1ce18ef2d7d">https://git.kerne=
l.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D590c84593045=
7d25d27dc1fdd964a1ce18ef2d7d</a><br>
[EXT]<br>
</div>
</span></font></div>
</body>
</html>

--_000_BMXPR01MB28704FBCBB43FA5BE924AF12EE639BMXPR01MB2870INDP_--

--===============0896141617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0896141617==--
