Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB19162168
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 08:14:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61C9D3C259C
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 08:14:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D0A763C2358
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 08:14:13 +0100 (CET)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390127.outbound.protection.outlook.com [40.107.139.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 09B6A1000ADC
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 08:14:10 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2HY0WY4nsZgljmb0FWQO+vUBanwhYhijvdnUA88YCXgQENctbtBgsaR8rm6BwT9mRzJoiKxSGcCyZmpUQBUU+bGkzLfIwTwSFOJWWmDuTCCEQjfsG2AmvmNWRjLDO7LScUFaypJQDHS12/JMzA19majRxc6AatRsZdcwzmnBjYW243D8mk1fsfFKzrqlylB+aNVg440/eaiYyzrlOYabQ/pJ5VPyLJjyDPDvYzuJKnFV5S/Phm0HaNGZtfOWSmVD3lnL6lgawLqlKxKF5yybSkgrC+f+s3Iy8R+l82YvBjOw/CQbCtRW2NHojWRTZkAk8n5GA2gMkVCS3y0UCz0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmgw8GKsKmsw4V895RJjGCXm2v+I54yNv8aG2nwKVho=;
 b=SbWkji3DLIrh75RK5OAHC91KRLxb8QG8hcAgzYRCsJIjlLSDm1/rGpkCLLO8/x5L5uZLNbuN3hbj28Bdgkw29thIVuLSiRRk/IUxJpbMzjCY+QbiwHWiqxKVRLVyJXmWveC4mJ0X9ygxnisthaWt34uY5Ewsg76ST9D41z7vl76Y0k8bGn8xiCZijREu9Vr5etSwoawPcMfhj2L1xE64SKKUSpOkDb1hGarIZVQZOmJekcd/8Z08SZxDiPc3Moh6AiP91TC9yl6m+rz7tnHyyTPVe+iLo2HBYIvEveoNfiWtuEqTZWv8EobqA6WjVrzh7BpeaDzmcZaHE2xF7GvcZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmgw8GKsKmsw4V895RJjGCXm2v+I54yNv8aG2nwKVho=;
 b=mJPVNrTV5CbPVlItxLc9XBno2PLOxcUNOK5pXO+TZrD6ypqfu6E2VrU1ClIuOhgXr3fQVmmio6flGgIZOnAWLeU/B6Ddq1SblJyNtAexHiGPC+pWelYecRayTHTS9M6gz0G/Fs9B0epQzMR1pOmRsyakTlASlaZVJe5cEybBxXQ=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1516.INDPRD01.PROD.OUTLOOK.COM (52.134.130.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.29; Tue, 18 Feb 2020 07:14:08 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3066:1c66:a39:1bf8]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3066:1c66:a39:1bf8%6]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 07:14:08 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: cpuset_regression_test failure
Thread-Index: AQHV5inBe/lSnlVQdUujQMFw9lJY1Q==
Date: Tue, 18 Feb 2020 07:14:08 +0000
Message-ID: <MAXPR0101MB1468A284450566343010E440EE110@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [117.99.88.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbda301f-7b3b-4339-a99e-08d7b4422594
x-ms-traffictypediagnostic: MAXPR0101MB1516:
x-microsoft-antispam-prvs: <MAXPR0101MB1516791050537585B095FE1FEE110@MAXPR0101MB1516.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 031763BCAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(346002)(39830400003)(366004)(376002)(199004)(189003)(6506007)(26005)(86362001)(5660300002)(8936002)(8676002)(19627405001)(81156014)(81166006)(7696005)(316002)(508600001)(4744005)(7116003)(33656002)(2906002)(52536014)(71200400001)(66446008)(66476007)(66556008)(64756008)(6916009)(186003)(76116006)(66946007)(9686003)(55016002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1516;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G/DQKz/4fms1d1APlVGc2b/U6PW4+7bUxYQL4nyhEVT4hURILLQgiRDliKYZU84J3022ViJarm3jyKqcAW6WNN85LtY6EqTYk11rMGf2CV/QhXi/8vBeJFViZf4uJcDGci92nKiQslZc3N5hyx/1G/Vb/x38FcmF/XVJdrMY/+hRAfyhCsV4xOel4U1Pws8auRZYcLqsoF4lzOAZdMg0UzdXFvFLZSRm+tTiEHBkcGF6dUlB3d1E5iwJ9OWKRmNhaTS3XC+7Nvn3hLjd/mr/wo435gTQ3OPAmzpvskv3HkaZse/mdujY430zDdxd2ZabYulURDPuk/MWZ6MTEJeouU/31Moz/qs9gv03Po6Q+2N0C+AHMMg8y5XAh7Rj2OZ71AUWvuIJhTFa8KOOJCBayjO8ehhvbwyE8MNb42VNaAe+cYhyh8Ik9pZPIF9pousq
x-ms-exchange-antispam-messagedata: XAs+Ajj07+w/dI3QCdKcbA5BkFcbOjk5F86j7/WClMr+Jax7cA9WPDI/uCF6N01jiyByvqGyaB1j+sNnEpvrtPzdWAhhaH7aZNevGnazq/ueoS1iNJa1fp8gM6CSwUl7CXRQ0fVO4j/pWIR/KlsHzQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbda301f-7b3b-4339-a99e-08d7b4422594
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2020 07:14:08.5046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aulOy61auRWey85EA9gJY5mVgvk+Nln4n+nxxqQ0agkoIQ0cqdlOdRPpLzy1uQLjRSNbrafu5WC6i2U5ni/10SXlNelfa9WDTpfwHLtU7lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1516
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] cpuset_regression_test failure
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
Content-Type: multipart/mixed; boundary="===============1435863871=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1435863871==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1468A284450566343010E440EE110MAXPR0101MB1468_"

--_000_MAXPR0101MB1468A284450566343010E440EE110MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am trying to run cpuset_regression_test on my linux 5.4.3 with our Yocto =
distro,i got FAIL result for this test when i ran complete ltp test but i d=
id not got reason for test failure but when i tried to run this test sepera=
tely it showing is it correct way to run this test,how this test needs to b=
e ran independently?

root@exaleapsemi:~/pankaj_ltp_new/ltp/testcases/kernel/controllers/cpuset# =
./cpuset_regression_test.sh

./cpuset_regression_test.sh: line 27: .: test.sh: file not found




--_000_MAXPR0101MB1468A284450566343010E440EE110MAXPR0101MB1468_
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
I am trying to run <b>cpuset_regression_test</b> on my linux 5.4.3 with our=
 Yocto distro,i got
<b>FAIL</b> result for this test when i ran complete ltp test but i did not=
 got reason for test failure but when i tried to run this test seperately i=
t showing is it correct way to run this test,how this test needs to be ran =
independently?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>root@exaleapsemi:~/pankaj_ltp_new/ltp/testcases/kernel/controllers/cp=
uset# <b>
./cpuset_regression_test.sh </b><br>
</span>
<div><br>
</div>
<div>.<b>/cpuset_regression_test.sh: line 27: .: test.sh: file not found</b=
></div>
<div>&nbsp;<br>
</div>
<div><br>
</div>
<span></span><br>
</div>
</body>
</html>

--_000_MAXPR0101MB1468A284450566343010E440EE110MAXPR0101MB1468_--

--===============1435863871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1435863871==--
