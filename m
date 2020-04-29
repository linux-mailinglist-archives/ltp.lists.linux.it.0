Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D61BDFB2
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:56:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 446993C5EE7
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:56:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0142A3C0302
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:56:45 +0200 (CEST)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390139.outbound.protection.outlook.com [40.107.139.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ABE4D201414
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:56:44 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUQI7QjfPNNx2XZcZANOMgQsBkENM6SX5IFbgBFC9rd4hb6MgsBuFjwgnhEnTtDMAimXaVoUAgKIQ0SvT3DxU+Ab04LEyXmJxO0ASea+gYsp2DQsMQz1mnFIlSHoseZautFfSaGZLVmSuPbqbktqtX2s6NFkfVkFRGwBSMZLktPPdQ574IYslKre5nvDRm7YsvtNM2H/kFd2yb+FkakC56xiFZD8BIEo2maxK/Xsz94Oo/mFghLSM3I1TQQFC3Zl2NckzwAW7LvvVNuCTC/ef+1r8XmXBPcoGXcvsiB6BktcbFM5p2rKKK301MPZPF8NOjvhpPGGphco/RY8dNvJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxC4NvDiv3rXqrAw3LGFbAXQZ6obiOKkPlk2fmGDsVI=;
 b=nVTr5VzIq5Qw27OtXHWDmpoV8ToTfDjr8qZwn9oqPJXL0IghE89U9mOIRyWuLlR7dwUW1TBVdpfSeCM9he42k68OIAwzFO8KVuICfgGq2vVCrzyC9w/44kC1/FHOVpsMUzvFyiaNER1XiYPoaAALJOSVQ0l6ayFptedx3TiiKSia96GPnAUZPr9n2GMzSDmrPikGQbuXCSjptJVP2Qr6XoV2Pdnmw/AF0YyhAs0Tq/9dl5xUfg1QVkebPSi0C0NcyOta0+xruEHYjc9+KTHN9cNt8kv6ZuwQs51/p/hL5orkRg9uJwx4CPJj0mtRggUz1x5mjuaT9QFdtb4ojd94UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxC4NvDiv3rXqrAw3LGFbAXQZ6obiOKkPlk2fmGDsVI=;
 b=07no/7FTF7J1vkxsns4gnJIhvHBImYwOZmusBMuLT209XPsHd4QK8ZiajUm0Sevzeo93oHli8b0NmMbIvT+IewvPOgxNwVyGu2TlksT3omfDAB8eTB4pTPcEYgV8hF5lA6D1HGrP9a4d0bsyKPv0jCJgfOsbroee//LJduv84G4=
Received: from BM1PR01MB2227.INDPRD01.PROD.OUTLOOK.COM (20.178.171.141) by
 BM1PR01MB3108.INDPRD01.PROD.OUTLOOK.COM (20.178.172.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.22; Wed, 29 Apr 2020 13:56:42 +0000
Received: from BM1PR01MB2227.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7ded:4f3d:9a9a:c256]) by BM1PR01MB2227.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7ded:4f3d:9a9a:c256%7]) with mapi id 15.20.2937.023; Wed, 29 Apr 2020
 13:56:41 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: LTP driver testsuite
Thread-Index: AQHWHizyFscZQ922DU+gUyYA7on+Wg==
Date: Wed, 29 Apr 2020 13:56:41 +0000
Message-ID: <BM1PR01MB22279080FA97CD05A583FA0CEEAD0@BM1PR01MB2227.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82fef169-3f57-4931-c821-08d7ec45255d
x-ms-traffictypediagnostic: BM1PR01MB3108:
x-microsoft-antispam-prvs: <BM1PR01MB3108BAE851008488BCD8B4B2EEAD0@BM1PR01MB3108.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BM1PR01MB2227.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39830400003)(136003)(396003)(346002)(366004)(55016002)(7696005)(7116003)(76116006)(6916009)(52536014)(64756008)(66946007)(66446008)(66556008)(9686003)(2906002)(66476007)(4744005)(6506007)(3480700007)(186003)(26005)(33656002)(5660300002)(86362001)(19627405001)(316002)(55236004)(8676002)(8936002)(508600001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vRPAbIB60mIAXI9ICor1M6E5F7d4JVbtgTSuO/FnL2Z88ToAlMmRaT1Kbqf5qtYKEbHnxSYSuK+LuXmUFGXib5zd2Xuo+N0ZDT7yoFXiQqjSW7N+auRXJzCAsSyQaakkMjytpHCBsOiKKL0rcOTjmDwMMxU1RaDzpPZrC+eRoe0BCi5cBdzpyeBMHjbzkBq9PiCYhisUYrMa9GmZnUn/RgLp5dyeo2qS0cVg+i8007eE1TXp2dIz/PlW7Q/gvkoq2nmrya+0gz89nBRoWNFPth8A+tU1zaZrCPUe7C5jdL/GKmw9EAhVWdk4zrxxVAsAP0soucUhFMWE8TEovX7no0MEiYT+mYmdCMD4vtKoYH+1MCkMNVhfN0q6s6n8kr4KMncjG95Bc1v4qYqoMfJ7oUZK8M/c1Dn4vV1HnN51cUron80cMDwTCtT3fZVarIp2
x-ms-exchange-antispam-messagedata: J/OQpnU4EH1tl05x47D1D5kNtmkApPUGRx6f5HGTfebG0mywLCcuRlyaMv3alMrceZ0kgLMxZWm44ljN0w8b5LVIu9H7NpU6LvCYLYGyimCgFqZvQWCHM944Q5F4R29TQV+CuXq7qlRMk769Q91JjYsHsXlgvkr9m94N4AtpbhjJunlLiRxlafu6iBS2StlBqKT3dGZUEGISWiqKm8yZI8TMUDfqeTjKKIYRVdNyaDFYmOZvXlnGBoQ5+SPkE8Jo29oFpY6wddEMijX1EV1S2yZaN89Ge3YxDtMmGqbCOjXx2fc4StTM6AfeCrI0ioEbvTl03mmJAlZpB893DnaFtw8W8SIWp1zdgHK4rNz7VsL8GF2BoVog41HPVgVUkhRMBr2mF3ZzuNXws7dqbl8uZrd+/RZWdygILuj1nh7siA3vF5AzFf5Cxib6ffoM+KVJoBHZyh2Rz4ogLIhjukiC/kyzBJsCyJf2dXb1tEMiZvwhcGgl5uA6LSU5GHzObFI/g2SX4DFZDo5X7ny/ITLNJ9ISTIAkbnIE8cs52V9Ri/V953XInVFA3toK1Vb30Tdz5E4Jssi5S3mKHB8jYfXOZY0LHi6XnFRVuUU7wKkrbebcl2RTG5JW1QzBREkNwoJ4O42yR7qLbz9yi1NKTsGfXFUAOYs8CIuQKhmeSGGt8RLU20+5tkZ6X8mi4IunKH9diJ1oZoOnAr5+F3w14OMAJwIFyFsUSU51q13E13P3gVTfMNQd25LfcZJz0mvE0knQ89RQZ7eDS7yii9UBx79fxK/+kID5oQs/I9mN+tV+qRU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fef169-3f57-4931-c821-08d7ec45255d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2020 13:56:41.9346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zWrnFRnnZptV1Wk6yC5xJKIFRgDMjRL2pN1EK29cUkl1Q3hJiWDPY/2YYK21bb5CzbsGr4pQq8LPrdU4Mi9EXX7FWPocvNpMO1P8txk1IoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3108
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] LTP driver testsuite
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
Content-Type: multipart/mixed; boundary="===============1277210062=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1277210062==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB22279080FA97CD05A583FA0CEEAD0BM1PR01MB2227INDP_"

--_000_BM1PR01MB22279080FA97CD05A583FA0CEEAD0BM1PR01MB2227INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am running LTP on risc V on 5.4.3 with custom distro but all the driver r=
elated tests are getting skipped,
saying  Failed to find module.

e.g. when i am running block_dev then the test is getting skipped with the =
error msg like
block_dev    1  TCONF  :  tst_module.c:69: Failed to find module 'ltp_block=
_dev.ko'
block_dev    2  TCONF  :  tst_module.c:69: Remaining cases not appropriate =
for configuration
<<<execution_status>>>
same msg when running other tests like tbio,rtc,zram01 etc.

why tests are getting,what could be reason??


Thanks!

--_000_BM1PR01MB22279080FA97CD05A583FA0CEEAD0BM1PR01MB2227INDP_
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
I am running LTP on risc V on 5.4.3 with custom distro but all the driver r=
elated tests are getting
<b>skipped,</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
saying &nbsp;<b>Failed to find module</b>.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
e.g. when i am running block_dev then the test is getting skipped with the =
error msg like
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b><span>block_dev &nbsp; &nbsp;1 &nbsp;TCONF &nbsp;: &nbsp;tst_module.c:69=
: Failed to find module 'ltp_block_dev.ko'<br>
</span></b>
<div><b>block_dev &nbsp; &nbsp;2 &nbsp;TCONF &nbsp;: &nbsp;tst_module.c:69:=
 Remaining cases not appropriate for configuration<br>
</b></div>
<div><b>&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
</b></div>
<b><span></span></b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
same msg when running other tests like tbio,rtc,zram01 etc.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
why tests are getting,what could be reason??</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
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

--_000_BM1PR01MB22279080FA97CD05A583FA0CEEAD0BM1PR01MB2227INDP_--

--===============1277210062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1277210062==--
