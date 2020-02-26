Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B827616F6C7
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 06:07:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D1D63C137A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 06:07:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A08E53C03B1
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 06:07:05 +0100 (CET)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390115.outbound.protection.outlook.com [40.107.139.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 72451600BB6
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 06:07:04 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9MZZ6oblgc/TrIzmpw1/BAvMzJldx+FuBY3rzzGw18qGZPcYXT8N6YLySSQgjfEZXJhSusLzfeJ6ep6oKuPfDkrgu85W2GTxvnj3xNebxvs0i3VExZW7Wdiv/GVhRn6VbBbwgJHogCzvCIPBzRwcDLWhAcokmh9u01d8tlJLX9KuRJ9NxX2pYeKPfVwEdVvKgSpKtBL2v5EPW2FF4ksnKCImqUSWpkISDzdLW3q6ooFUTzN8dwsdq4AQJFiEthVF7vAFDn2o4caHluqqR4GVeAlKGhooUVrv5sCq2bZZLINDot9YRLmD+sQJtpc5WpL18RnV1DoQvLYqLh36hJc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3VM1yzm9++3ltsKkcS9JaKOaUMC/1CYFcZTncVC6o4=;
 b=NTTZ7Vy5aicWvqqwzs/ZuDcRX7TWS440FX1bIjtqvu2YCmZxNqdUow7PozwUqgWCqlnqSpZYDCujQ4ohYd2+aNgUjKambv7myXYVo98t/lmQbJhmBL7H2LKgC/WK1IysCvI+DX/OX7UWCqwZSF9C7Ec/stcwQeuCBbIZfg2WyP3ZdZA/mPxbs8Du23lJ6lLwccBX06EO7BB5FPIIY6Egp4cNAm2osLi9l3KKaTDkizWyJWaGy4D80pS+hw3LFZRWhrh8XQr5t7FBhlKjVXE5jQD6m14DR1TbYqy50/UlcLSZhwXVUgWHacKN8jmLxcuW9kafnlcCzMhnSmrzRUOung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3VM1yzm9++3ltsKkcS9JaKOaUMC/1CYFcZTncVC6o4=;
 b=F9w5Rgt1lxgNJs5oe1CUXd2H8qqRpmSI4tv7Z6ZjYhAyercO+zjx/4cBZ0P2I2rPKjqqEhZWov30wg47a63GCzwIA142TPRud6VG5XFD8k+69zUcekQvKnSjnJ6vpFW9lIO0snaMQSHWJE0eTsCgu2mFoCf+jbjRPNKw6AKcAAo=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1116.INDPRD01.PROD.OUTLOOK.COM (10.174.63.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Wed, 26 Feb 2020 05:07:01 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2750.021; Wed, 26 Feb
 2020 05:07:00 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: category of Running test
Thread-Index: AQHV7GHD2rP9PH4XOUqw0oDEzfhSBw==
Date: Wed, 26 Feb 2020 05:07:00 +0000
Message-ID: <MAXPR0101MB1468E9B371F52AD1B044DDFCEEEA0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 881a956a-e58f-443d-183f-08d7ba79b657
x-ms-traffictypediagnostic: MAXPR0101MB1116:
x-microsoft-antispam-prvs: <MAXPR0101MB1116FDB2D6BE78FCC7DB4292EEEA0@MAXPR0101MB1116.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(376002)(346002)(39830400003)(189003)(199004)(71200400001)(558084003)(55016002)(81166006)(26005)(2906002)(19627405001)(3480700007)(33656002)(52536014)(55236004)(8936002)(6506007)(9686003)(508600001)(81156014)(8676002)(64756008)(66476007)(76116006)(66946007)(7696005)(6916009)(5660300002)(66446008)(86362001)(316002)(66556008)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1116;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jJGYw/kl+sREz5jgKq3CWddHY8weKv+Zb5KMzpQuEWvrAXMdSCAvhj4T9qVGu3elVikZ2LA7I+RDll7jpnpbxy7p6i8R0mz9LnQq7/FGflMXmBMQ/JtKj6w6xo6gQ1k+PRu9GVyEdtTw/kvc1EvGtyalkTz6huna+Y2NcX/XZubRHsM0qHeShOGCCEoMXarSC+wZdZLv/sOSiiJyc4nPLwhK8PLVihW44hqAovVtW2N+BnqKEWTsQ1nNJ5dNZimlPeDza1+43KAvJGWVkKKJFmDK2C0pvQIlx0zwjODOb+h3ps3yUs+5QhDl3Try+T9okhtcEpDmV5OlF4iKtAA5jE1sT+uRpGBxvAaeKZFXxyt5ZRfLQNExJWE4d3DxVQapnK/+6KOR6NOLsB3PfjZxya25bDhAyggvf8RXpNAuj66JyN45zAgIhlPR7q3DurP+
x-ms-exchange-antispam-messagedata: dwvTJa/zeLINS/VbGVtT50z7sqyO3Jjf+/32gS8yml3a3q6S+kH54W/0omzcMc2wb47ZNLNtb3+bdkF/LNvA5l1SJBcrqZGDJKmNM2wm9qY2mPNhK4NS3lm5AuTZ20q5/oVeVMBGU6MPv8UMcYaMOw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 881a956a-e58f-443d-183f-08d7ba79b657
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2020 05:07:00.6835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5yJHwH3w4cqfIg8/eQx7Iul2ylPEjdTxf+qZ2pqF//NY8j5vi/QgP3l+09G3GdaaupsHzn8EObWh6sKWAb6dc79WBu02nG5jQAVsa90dby0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1116
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] category of Running test
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
Content-Type: multipart/mixed; boundary="===============0700029518=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0700029518==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1468E9B371F52AD1B044DDFCEEEA0MAXPR0101MB1468_"

--_000_MAXPR0101MB1468E9B371F52AD1B044DDFCEEEA0MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am running ltp on my machine and getting log in /opt/ltp with testcase an=
d its status,is there any way to get result with 3 parameters testcase stat=
us and group?
if yes how to run so and if no where should i make changes in existing ltp?=
?



Warm regards,
Pankaj V Joshi

--_000_MAXPR0101MB1468E9B371F52AD1B044DDFCEEEA0MAXPR0101MB1468_
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
i am running ltp on my machine and getting log in /opt/ltp with testcase an=
d its status,is there any way to get result with 3 parameters testcase stat=
us and group?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
if yes how to run so and if no where should i make changes in existing ltp?=
?</div>
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
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Warm regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Pankaj V Joshi<br>
</div>
</body>
</html>

--_000_MAXPR0101MB1468E9B371F52AD1B044DDFCEEEA0MAXPR0101MB1468_--

--===============0700029518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0700029518==--
