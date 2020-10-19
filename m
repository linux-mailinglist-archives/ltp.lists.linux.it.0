Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D495292195
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 06:10:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9425E3C31F4
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 06:10:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 879BD3C2530
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 06:10:23 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380139.outbound.protection.outlook.com [40.107.138.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 362481007C85
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 06:10:22 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJy3MVTlUocDDNy/jtfz5ZxvxI29STcGiD3v6oYDqaBklYLKl/KX2u1uKM2Q48vgzorNo2UX14l8uuXxG0fS7hCUeyfMWqmVr20mCQj9O2i5p93MymYmBal33VSrLpD4cpNsbq5OIplTgC1SB6x13kpBvMXuMwxEuOCCZQEzIhbiYT5PU/plew9bTJ/rG3Tv7OkyEuu4JMIfB4pIM35V9ePI3HksFToJ3kJsfkRv3OxBFsQHeJ1XKNsbEMhq3B5VOD73L7vvIYs6CkRN/mypCoL9R96l6++HuKjAeuOQEoezrCv6RgmzsNGy/JGFkoMy650+HIBb6Zp8Sr/grq+JbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjGd+uIO7tb1qAn2rQIkTUzA/Hs2n9qOuMw35wOyhus=;
 b=MMn9b/pd9H2O4H6SgeuvtjtKHdBKblwo9qMt0WIKGe/iCgdPjoQa9smXLPLr9eCoS5qMGKBTEdOiem9Ef9dcNL1RtXZjf5rj7ieGfvLOxFt9VwbhRImFIcWUX2RNJxIYy3vTqO3JhIuyd+Y97Tgi0sKKPldhyPhfVMqoQVwpT7q+3bOavahA129fmnB5WphfH7BrA8NRkBWTgAF0aDDGfVdDJKX2gy8/yhzZaC7Q7tFgkg3RwhuSYs13JczblM1nb4Bi6ktcuZ+cR4OjReJXG2Gjtxx48Scfp0wwu3bi5powYLjLXghULTn/RoJM7g3HQ/83LPvplqSYDQ1IIp28zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjGd+uIO7tb1qAn2rQIkTUzA/Hs2n9qOuMw35wOyhus=;
 b=eCSZG+Lic51h8n2vvWyWGbOkWQze5RZ6oUrHdwko4B4zl0+4ilALdHP3lGBoZ89CA1BisLta1LHvX01YYv3SnxHEoDKK+qe6549Jm7qY7UndgR6svPzX5M3+xGHDtf0nuPKOEuMaYroLhjk5zUcEWGyDCr6h8OAT5gpyYB+otF0=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BMXPR01MB2661.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Mon, 19 Oct
 2020 04:10:18 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4:ea98:7220:e7ea]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4:ea98:7220:e7ea%7]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 04:10:18 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: Power Management Test
Thread-Index: AQHWpcsBBzDwsPJj8kqPWiigo13AaA==
Date: Mon, 19 Oct 2020 04:10:18 +0000
Message-ID: <BMXPR01MB234447E6D624AF3311D14760EE1E0@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [2409:4042:2685:203:e90c:60b5:29e6:2733]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adeb0462-867d-4a24-0525-08d873e4e408
x-ms-traffictypediagnostic: BMXPR01MB2661:
x-microsoft-antispam-prvs: <BMXPR01MB266120F3AEA4C23DB639F9D4EE1E0@BMXPR01MB2661.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0iv6rG27XGchITusw3rw7NCT7HBNzdLA+Vs4asts72F9DOQ5w9MnCR+a5se5lpQ5ps04d6v5MsyzxlueMWeX8hmkr/UHbZE8Psgwz87mxH94I2Y1iaNYGkD6RNUDELcFugOrmw1qGUOmFbM/RXZn694LogbfGtmixw6lrg55FOaFksLg3e0Xy4s6L8X3hoXtCrqrZxzyziEs+647d22N/Qwz8Weo2QreKMC8C/WulqXYjJ0T66yeZO6bpUIMMjcBvsYTLSqGAJm3LKLTlzkwKjqcUd/eujBlSCzcSHatHTbJ+PCSI4nleuoL/vVEpwfc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(136003)(39830400003)(376002)(86362001)(9686003)(55016002)(4744005)(33656002)(2906002)(19627405001)(3480700007)(66556008)(52536014)(76116006)(66946007)(7116003)(8936002)(6916009)(478600001)(66476007)(186003)(66446008)(64756008)(8676002)(5660300002)(6506007)(316002)(71200400001)(7696005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qjPvDu2AuLCyfLL3bDqBy9p1Qn48W7StZY5lortYtKFLgGGr3BD3r6rE/hy0slksWtMA/p6i5VORIAJVXBASAdjrIXWIlxawsFN0NcEx5YXfeo6cjxpdTp9wL9kaoNjy2xCHVfYsMgxtadgkAuG/6BV/Kwcq1gw9N+nWLbyd/h7CM3YVSq+GoZgfiwz/2b37xbs+SZbS/Nv9oOaVxycN1Sa1lW1O+EUjPDI64en+sM4gbmMVYi/OHTRFfm3zs0pMMoDW6yfD9rMkFwj43gESzZ+fi0TGZmhLJUmdmf5/LwhdOF3Lo6H/IlFuXNBR2OBWFulUOMWBwk4u9Ww5Tzsd+XQJdOyVMstPLEUsd4aaJOdcx8M2lm52nqpwV+2B0nI6ocvS4YfJ+QJnbTaisn4xwAenpVdRyEwI6gQvZtI9aIdaDc7AKxUZBQvqbkuvNbFOB1j4gUjGwE7X8GKulrFU73hd4mDti6/l5fgutkGHpBEsETXyF5N871u7la/z+DtNPLWh6lCa5cdM9Zb+TnLo70s8n0JmjWTpVKjXtnVT393Nvj/N6sZBF6a53tCDK30MQ3IZLOJEA7pm4m0TwE/Se6CRQ5Iq20sfgOGY1bNt9AB/shgzfhtssDcahEMZ8sWPq7OvH8xjJOi2irazqtFa37jfnJj8tY6VP/2mjbEuQY1zEtxy9Rpm0a/26zhe6K3LE1hw7eEt486CzeOBEceD3A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: adeb0462-867d-4a24-0525-08d873e4e408
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2020 04:10:18.6155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQgP4MW5GcuL2UUgnPj1tYq3YG3znEIAsSQrLe9TuWfjQllyTor1pgfPau1ZT+LxPCVsVroeOkFbHSTT7Xf4rCRCNGrfilca+rdYEQak+7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2661
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] Power Management Test
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
Content-Type: multipart/mixed; boundary="===============1431900107=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1431900107==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB234447E6D624AF3311D14760EE1E0BMXPR01MB2344INDP_"

--_000_BMXPR01MB234447E6D624AF3311D14760EE1E0BMXPR01MB2344INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am running LTP on my RISCV arch with custom kernel 5.5.6 and i am  trying=
 to run power management tests from LTP. i want to test following states
1) Suspend to idle 2) Suspend to RAM 3) OFF state

Are the test covered in power management suite  are only x86 specific ?? Do=
es the test included in power management suite of LTP  covers above ?
KIndly suggest

Thanks!

--_000_BMXPR01MB234447E6D624AF3311D14760EE1E0BMXPR01MB2344INDP_
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
I am running LTP on my RISCV arch with custom kernel 5.5.6 and i am&nbsp; t=
rying to run power management tests from LTP. i want to test following stat=
es</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
1) Suspend to idle 2) Suspend to RAM 3) OFF state</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Are the test covered in <span style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; background-color: rgb(255, 255, 255); display: inline !impo=
rtant">
power management suite<span>&nbsp; are only x86 specific ??&nbsp;</span></s=
pan>Does the test included in power management suite of LTP&nbsp; covers ab=
ove ?&nbsp;&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
KIndly suggest&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks!</div>
</body>
</html>

--_000_BMXPR01MB234447E6D624AF3311D14760EE1E0BMXPR01MB2344INDP_--

--===============1431900107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1431900107==--
