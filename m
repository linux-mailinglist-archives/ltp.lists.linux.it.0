Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C185E18F24A
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 11:01:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CAA53C4E5E
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 11:01:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 231E33C4E33
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 11:00:51 +0100 (CET)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380127.outbound.protection.outlook.com [40.107.138.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 88497601033
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 11:00:50 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev7/+PcQbGh/+y/Mc7BkiH43amLMyoq/k3btO9Lr2bVlqBe0NdpT+9zmeAlsY8ZlJLF92nf/yGmVNAC1fnmN2kSXQ6szVT/W3CMIE+VAEyD0tnICrbF9gbTovtlPMIIrWHAneCyx5RqkJc+3B5ve+bCwRZF7TaEGiDbxnVySI/r+UXVLvcJtNMPPqlTbSb9U5+LUDcOP3AFcQ/4ZGFz55oRebUR5XDZOWSLBNHdNEaEaXe0WI/LfJGZNjokXkgS0mJW7WrryrZRgW1SnwVQuYMBdVqBBYAACUIjnShrfklQB5XwbC839IQ7++EeNdziJHeOen2Mv1yfU7gm6v9DvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tcqlj49bS7enqNGJ/0pp/1jdCfiTpsLznNPWMxjl0w=;
 b=Uub8eqNMn/XR4Qbv5o68esbK6/R9WYL2cwtmNBuomH9b3cvDtrqh+qHLRnabez+SiUNqTLx8kEUOT/PBrM4ldiRasp+BzdjSs34Po41UfgoXCSYcOR8JtnLc5qgSPZDVoGA1rWUdOxA/ShKNCqJlDbOlmRzeCLdcloQQmxTx7Qzmss93N43pdIY51HA5IqBZu6mtD9+LwxtbdgQCOe8VTW75JnmZF78rnQ+JQDrlxDhsA/pDKV3vn8Qw8l/Nb4+ARZmhmctcM7MAxhglrDUlSIf5LVIRaZEgQiKa6QVt5+hMNXAGIN1a1KiXgtnsHJGnukGBpfj5W+VMjA9aqD3HKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tcqlj49bS7enqNGJ/0pp/1jdCfiTpsLznNPWMxjl0w=;
 b=zp8VbKCNb8BrjfctUuGcVcH1uUzfeQBlpsOy/9zUUi7H1y0mU7wrtZLJeu0CZPgGkDps0NBagrAl0a2D1u4kr3534PaEmxJE/k5gP/xhOa9D7xmNxt4se02AbHNBOSDnG/1Ll2DjyNfHk8bzpQkYG3XQFfnZG+NBtEA2jdqrS54=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1625.INDPRD01.PROD.OUTLOOK.COM (52.134.131.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Mon, 23 Mar 2020 10:00:47 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2835.021; Mon, 23 Mar
 2020 10:00:47 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: cpio01_sh testcase failure
Thread-Index: AQHWAPmNIXVB67Y/QUyQZovg2rhRUA==
Date: Mon, 23 Mar 2020 10:00:46 +0000
Message-ID: <MAXPR0101MB1468BC364EA06FEE7D6F217CEEF00@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [157.33.34.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be7b8ba9-2c14-49f2-6b68-08d7cf110f1e
x-ms-traffictypediagnostic: MAXPR0101MB1625:
x-microsoft-antispam-prvs: <MAXPR0101MB1625F9572972064C58BDCBDFEEF00@MAXPR0101MB1625.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:117;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39830400003)(396003)(346002)(136003)(376002)(199004)(26005)(19627405001)(8936002)(71200400001)(33656002)(76116006)(91956017)(66476007)(9686003)(186003)(66556008)(66946007)(66446008)(64756008)(508600001)(86362001)(55016002)(316002)(2906002)(7116003)(7696005)(5660300002)(6506007)(6916009)(8676002)(52536014)(81166006)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1625;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZPUsJZ8Io2T8mkx70v+3B1FOvk7ySAJ96WB3XRE47x2Jy9w5oiFdX5lyPMhe41e659MeKMuf1sMwQHJTTtq1q+yn6jgxoWlyGV1ZVEtp29G0W3eLbQX6bXN1RUu3o5+fvuzOk8ikMOYYNidv7Ar5Xqe/zGRZMylxo7jgXy3qdliN+OQXQvZ/bg6L0HlQsJY5SyIGKx4HhkoGCE76uqhG8l59Xfrmnlgl8fi+8mKgl+AIq8y+leuIYhxRhiu3QT0UiT/gidtQQzL3AecCzKs2m9edwHcxumnxknfPl7qBizFnZJVyuaPC0OmfIF1hv5LG7uIoQHwSZb21wXvQ2ZMeYFBFZGiGyjocqcW3d3NC78+7RVJZVBiWJEQK9IJZR9jAkgvyB5mSMUTPtH2PVStL6+L6ypmajroiMgsAJ6nc7f4VTzamohb/Ny4covjYq5bb
x-ms-exchange-antispam-messagedata: WZQRi9iz3dIAGE6TvwWWEvClRiwMV7Og0oK2y4KGPrPKEc31/u97579nySRadBu0dAcPOgvVlyGLrQfkJAtf9g+wD9V/KVCZi7bgUXb5o9jc/kGRb08tz+dHfI8Co3g4vwi9Ygi9T3HKupS+jaQglw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7b8ba9-2c14-49f2-6b68-08d7cf110f1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 10:00:46.9680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gguH6ueOpb/vrDVxRBfrVJDysd1H8XsWPUhJgm5zF1yFkgeouzvEGxzeUxEmMyCwTitvZyXKQXEsb1eNYHSiy19UwjUQfj4RetMmdqNL1y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1625
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] cpio01_sh testcase failure
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
Content-Type: multipart/mixed; boundary="===============1537582104=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1537582104==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1468BC364EA06FEE7D6F217CEEF00MAXPR0101MB1468_"

--_000_MAXPR0101MB1468BC364EA06FEE7D6F217CEEF00MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am running cpio01_sh testcase on RISC v with our customized yocto distro =
i am getting following failure i am usinf LTP version  20200120-105-gae32c0=
7c4
can someone help us to rectify
sage: cpio [-dmvu] [-F FILE] [-R USER[:GRP]] [-ti] [EXTR_FILE]...
cpio_tests 1 TFAIL: cpio -o > cpio.out < filelist failed unexpectedly
cpio_tests 1 TPASS: cpio -i < cpio.out passed as expected
Only in dir_orig: a
Only in dir_orig: b
Only in dir_orig: c
Only in dir_orig: d
Only in dir_orig: e
Only in dir_orig: f
Only in dir_orig: g
Only in dir_orig: h
Only in dir_orig: i
Only in dir_orig: j
Only in dir_orig: k
Only in dir_orig: l
Only in dir_orig: m
Only in dir_orig: n
Only in dir_orig: o
Only in dir_orig: p
Only in dir_orig: q
Only in dir_orig: r
Only in dir_orig: s
Only in dir_orig: t
Only in dir_orig: u
Only in dir_orig: v
Only in dir_orig: w
Only in dir_orig: x
Only in dir_orig: y
Only in dir_orig: z
cpio_tests 1 TFAIL: Directories dir and dir_orig differ
dir_orig:
a  b  c  d  e  f  g  h i  j  k  l  m  n  o  p q  r  s  t  u  v  w  x y  z

dir:

Summary:
passed   1
failed   2
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"


Thanks!

--_000_MAXPR0101MB1468BC364EA06FEE7D6F217CEEF00MAXPR0101MB1468_
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
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
i am running cpio01_sh testcase on RISC v with our customized yocto distro =
i am getting following failure i am usinf LTP version &nbsp;20200120-105-ga=
e32c07c4<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
can someone help us to rectify<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>sage: cpio [-dmvu] [-F FILE] [-R USER[:GRP]] [-ti] [EXTR_FILE]...<br>
</span>
<div>cpio_tests 1 TFAIL: cpio -o &gt; cpio.out &lt; filelist failed unexpec=
tedly<br>
</div>
<div>cpio_tests 1 TPASS: cpio -i &lt; cpio.out passed as expected<br>
</div>
<div>Only in dir_orig: a<br>
</div>
<div>Only in dir_orig: b<br>
</div>
<div>Only in dir_orig: c<br>
</div>
<div>Only in dir_orig: d<br>
</div>
<div>Only in dir_orig: e<br>
</div>
<div>Only in dir_orig: f<br>
</div>
<div>Only in dir_orig: g<br>
</div>
<div>Only in dir_orig: h<br>
</div>
<div>Only in dir_orig: i<br>
</div>
<div>Only in dir_orig: j<br>
</div>
<div>Only in dir_orig: k<br>
</div>
<div>Only in dir_orig: l<br>
</div>
<div>Only in dir_orig: m<br>
</div>
<div>Only in dir_orig: n<br>
</div>
<div>Only in dir_orig: o<br>
</div>
<div>Only in dir_orig: p<br>
</div>
<div>Only in dir_orig: q<br>
</div>
<div>Only in dir_orig: r<br>
</div>
<div>Only in dir_orig: s<br>
</div>
<div>Only in dir_orig: t<br>
</div>
<div>Only in dir_orig: u<br>
</div>
<div>Only in dir_orig: v<br>
</div>
<div>Only in dir_orig: w<br>
</div>
<div>Only in dir_orig: x<br>
</div>
<div>Only in dir_orig: y<br>
</div>
<div>Only in dir_orig: z<br>
</div>
<div>cpio_tests 1 TFAIL: Directories dir and dir_orig differ<br>
</div>
<div>dir_orig:<br>
</div>
<div>a &nbsp;b &nbsp;c &nbsp;d &nbsp;e &nbsp;f &nbsp;g &nbsp;h i &nbsp;j &n=
bsp;k &nbsp;l &nbsp;m &nbsp;n &nbsp;o &nbsp;p q &nbsp;r &nbsp;s &nbsp;t &nb=
sp;u &nbsp;v &nbsp;w &nbsp;x y &nbsp;z<br>
</div>
<div><br>
</div>
<div>dir:<br>
</div>
<div><br>
</div>
<div>Summary:<br>
</div>
<div>passed &nbsp; 1<br>
</div>
<div>failed &nbsp; 2<br>
</div>
<div>skipped &nbsp;0<br>
</div>
<div>warnings 0<br>
</div>
<div>&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
</div>
<div>initiation_status=3D&quot;ok&quot;<br>
</div>
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>Thanks!</span><br>
</div>
</body>
</html>

--_000_MAXPR0101MB1468BC364EA06FEE7D6F217CEEF00MAXPR0101MB1468_--

--===============1537582104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1537582104==--
