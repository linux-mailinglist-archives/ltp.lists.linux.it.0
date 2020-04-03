Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 006DC19D24A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 10:32:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DF613C2FA6
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 10:32:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1A3DB3C2F78
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 10:32:44 +0200 (CEST)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390110.outbound.protection.outlook.com [40.107.139.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5FE411001986
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 10:32:43 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdncxfO/euDdKf5FaR3nt3dgz6jKFjPm2eKrEGM1llG8z4XwfUng/MvbTjgN/Nfg2fjqbUktZ91GK48ITqZ7BJ2nE6vYMOTLFVh8Y4ING7L7UicklF54s23Ms0MD07x0mhC037vHwyRdj/RFr26TDyfYZaII4Y9aVQiuug0yrHg9FSWk3U/jUeR6sztgwtTSTtMLqnNHJgr8I1M2U8A7jjoKWXO1m2/feA8pFb3cVYcqD4RYD3UlMvDNEp5HgPVuew6wUyElwSdAK8EY2xowRQrOjvpiuBw85OB6vEG3T3LdRnLkyu5E9rrfCSMmd/PK1I2VvP08qE6cklcX4LoBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvyNOfWEoH79lNaQc6nQR5SEE1o8vsD1Mjyr6BlnkX8=;
 b=KqUPkjONWc/o1eN4rLRsgx0YFD5RFwNvRq9gAsPJ7FYBr1n2ALRF7fayHwLQJcuYdznwReTidvXgt9WJKNqVUyIspt5orLbT+gsi66694z4M2Ga7CHngzXtSpPZ9Oq9OH4mTlGzfSWvkRbHSbZK95EJj+O4jD2eNYssEv6/vZJd14BcwbO6CjzljB/xOXDj7G6mwH7WbY4uV0xvCsV3ROV3aoXO//bUOGZPgiXw97Qtxm+cb4b+nXoKgUd5rqWYmv449SLxO98DwjbLq//g25ZW4n5urk8kKsFp445hWfwQ2x/4vQ4iGhz7ey79D2FFH4tSHQmP1no4/5ZtcQFlg+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvyNOfWEoH79lNaQc6nQR5SEE1o8vsD1Mjyr6BlnkX8=;
 b=jCgNByM9ap8smMgiXFqy7z9IM66GuRiqJMz9A+ENDH//d2Y8Tsqyr/63fguCKOlgUjzfjJ6nOnZZ+KF3lyOfh0igRkRArwL7xXeZdRfJvwFzkuJvogDdVPQpXWRDuzTuPtIQeuTOfJ1QjgKCLPyq8rPTznBrn6iNZQmFoC47f3o=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1851.INDPRD01.PROD.OUTLOOK.COM (52.134.130.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 3 Apr 2020 08:32:39 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2878.018; Fri, 3 Apr 2020
 08:32:39 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: LIBTIRPC Error
Thread-Index: AQHWCZFxR5muTjHBwU+joxck3iuyFA==
Date: Fri, 3 Apr 2020 08:32:39 +0000
Message-ID: <MAXPR0101MB14688E4E7604C8BD9D17CB40EEC70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e914778-d475-43d6-201c-08d7d7a991f7
x-ms-traffictypediagnostic: MAXPR0101MB1851:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR0101MB18518272974B6EAE7F978822EEC70@MAXPR0101MB1851.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(136003)(346002)(376002)(39830400003)(366004)(186003)(86362001)(6506007)(19627405001)(76116006)(2906002)(4326008)(26005)(55236004)(3480700007)(9686003)(7696005)(316002)(508600001)(71200400001)(66476007)(64756008)(107886003)(5660300002)(33656002)(81156014)(55016002)(66446008)(4744005)(8936002)(7116003)(6916009)(81166006)(8676002)(52536014)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ngd3ycAqmtEBkOSof98fEBRMon6lt7zn7a0S/HgRLs9tFv3Y3ZyZ4skOZRjCpv6qIWSq5VAjc52g2wXAo+5W4ZfSBv+gbcoR35U+d6FXNk6cXNu+BHsk3uGtk8jM14cEsq43t+Ku4VRLBrDU26cS/M+Ap7361QbeFl0jnvYO01ikOlPjRzY/RRjWUbcITCbcb0vO7KT3oduan4YS/+PtldD1/36gViZyabAXkY42YT2oZGIimbljLw7XEAKy7ANFob/AHvTmMY3fvNVI27qXaWxQXstP6K7kE2Prg0xHjYJxzBy99b8VRWh/hSCFyI+4QW0O1Rzn8LE9g4Dr5EsPkBG6v5sz1ifGfg3Ht/0jc3R4xVtisiPP0qo/ofUnA+Pw7EHOn2C3Nzf7XaqdqKHvJ9J1/CqN5moC4HAjeFc6gEgz+QJCasGYT0uGNJyjeTgk
x-ms-exchange-antispam-messagedata: uRTFmUEetJpo8+Ac7QFW524i3TlN4BWwCvbTvylaLh8zb7CUj18tuXvxY3GVkSsJrOjgXmWs2C0lxhSGAwpJaLIyZCPTBYBdRt2tojcIJ9NcQR2DTw3S38BSA2rvNFEOlEToQ3AslfOluzLLGmSUxQ==
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e914778-d475-43d6-201c-08d7d7a991f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 08:32:39.4021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Bpci6L6V5B3qSFFG2cLtM7rPIamDU+lis2dXQwmFTLD3r2RqniUEw+sajFi4Pnlns+VbRXPg65nNDn8rggHX9jbXWsoNSKZTroL0KA5240=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1851
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] LIBTIRPC Error
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
Cc: Deepa Ballari <deepa@exaleapsemi.com>
Content-Type: multipart/mixed; boundary="===============0773127384=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0773127384==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB14688E4E7604C8BD9D17CB40EEC70MAXPR0101MB1468_"

--_000_MAXPR0101MB14688E4E7604C8BD9D17CB40EEC70MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am trying to run ltp on 5.4.3 kernel with our custom yocto distro but i a=
m facing following issue , i have installed

pkg-config libtirpc-dev libtirpc1 but still the same error is getting encou=
ntered,can someone help us to solve it??

./configure: line 6794: syntax error near unexpected token `LIBTIRPC,'
./configure: line 6794: ` PKG_CHECK_MODULES(LIBTIRPC, libtirpc >

Thanks!

--_000_MAXPR0101MB14688E4E7604C8BD9D17CB40EEC70MAXPR0101MB1468_
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
<span>Hi,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>I am trying to run ltp on 5.4.3 kernel with our custom yocto distro b=
ut i am facing following issue , i have installed&nbsp;</span><span>
<p>pkg-config libtirpc-dev libtirpc1 but still the same error is getting en=
countered,can someone help us to solve it??<br>
</p>
</span><span></span><span></span><span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>.<b>/configure: line 6794: syntax error near unexpected token `LIBTIR=
PC,'<br>
</b></span><b><span>./configure: line 6794: ` PKG_CHECK_MODULES(LIBTIRPC, l=
ibtirpc &gt;</span></b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks!<br>
</div>
</body>
</html>

--_000_MAXPR0101MB14688E4E7604C8BD9D17CB40EEC70MAXPR0101MB1468_--

--===============0773127384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0773127384==--
