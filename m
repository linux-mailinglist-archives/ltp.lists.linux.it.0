Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8701A765E
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 10:45:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD6213C2B44
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 10:45:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id EAF7C3C2B35
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 10:45:40 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380108.outbound.protection.outlook.com [40.107.138.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C7E2D1401124
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 10:45:39 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beWXokOibyWmDiL+PXc3YwJTWpva7o0V1uQWFP0rlwvCq8GlAHXk59njnhAryC9hQEqXjhPid7z9NLkaBraRI+cbyPbzAEavjzC9fN25c7r/s3Ux+6mOo/srUJRWmdNxBQH7pSwJ5H8NBK3dIGFeo7YYJ/ITyKLcA+IBoMNyiQWQxTCrU4EzjB/00vK24tQxXafMG2A1BmMKvNeHxW2FtF/Y0IXL63vB2FSjuQNYkmHY142z4LLZKWHJ8Edh2VM3OQSwDomaCCEbkim0P7vEx9fGlGuUo5f2+pzz0yGu+pAMq0ahPbLb+8N4/iQpDlPK3rdep2jSW6+YsjtpZJ2Csg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifkfzHTsjL8WOnXiyvmRCU2EANpnon98NTWun7cvUb0=;
 b=NQZ7P3vaxBhLAFCe7YjcwzzCjjRRqtWXjmu1qbE91vszuAhNAiwKD8MOiO3iUFlFdP/DaC8HxN/03H50JQ5wtOzwplZndanKWsV7UMLfI+qQj6e1pKo8jNSe5lGJ5FBUbhecU7Lk6lp5jTgdTyBuHfSa8s/EDH+kJAOHsaULa3vQHkY/m1AFGdo7w4CheLGlLbKdZVh1lJgGmIfQ855GYQpkAXW68wKQQzPSlqWz3jaifbI0nBOWWJgiNIcatdVR+gTBh0COeD9R1LrPgnOkmKFtppq5Uv2xvZhOhrwdkcr917XY4VOUG17USRKAZZu7Z8uASWj1k8Q9UOtNDWp6qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifkfzHTsjL8WOnXiyvmRCU2EANpnon98NTWun7cvUb0=;
 b=sPIOs32dS3/t63113fE0dV93VJjNw1e67Yk3kPKzdWsdcFkKnVWtnkLCXe5mMj+6Y8gCFOUVa5ZfJyQEuDv6ZB2jxAbC/XI5meCeajQIOe51s6RE2PZCX+YvGc/ELhWKs+xJVHwTMwZsV8Inw28u8FRGjowQFUDvUr0UTohKLzY=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1371.INDPRD01.PROD.OUTLOOK.COM (52.134.130.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.26; Tue, 14 Apr 2020 08:45:37 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2900.028; Tue, 14 Apr
 2020 08:45:37 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: LTP testcase analysis
Thread-Index: AQHWEjgx3ddmJ2MnQkKn1rxsZFdvGw==
Date: Tue, 14 Apr 2020 08:45:36 +0000
Message-ID: <MAXPR0101MB14684E021A23A6B00ED69DC0EEDA0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [2409:4042:200e:c2db:6d47:2e6f:2aba:34b8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09f31cef-9b97-4d1e-db2c-08d7e05033fe
x-ms-traffictypediagnostic: MAXPR0101MB1371:
x-microsoft-antispam-prvs: <MAXPR0101MB1371589B548182ACA80E7D04EEDA0@MAXPR0101MB1371.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(136003)(376002)(346002)(396003)(39830400003)(366004)(76116006)(9686003)(55016002)(66476007)(110136005)(316002)(7696005)(6506007)(5660300002)(2906002)(508600001)(4326008)(8936002)(81156014)(4744005)(186003)(71200400001)(8676002)(7116003)(3480700007)(52536014)(66946007)(86362001)(66446008)(64756008)(66556008)(33656002)(19627405001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LvqRSD3w2R99P0QluDL8dMqUGIfoOcWpPHOxahRTUxZ0nsH0m6GmhFl71mEwTdLDuPiQoEKjgo+rtfXIRHz11yk9KZL4kXscE7pQPw/BnZPmFiQewYXHMP22aTWYSg3ie6aw73dFj71WIU3Aj/NfjZil9PZItiz3R8yQgb6kor5wN2a0kNMvD5JFLLfYVCU/Nu8bnRCRYWwcBkCrURee01t6kErc99/HrGqF+as17A12AZdPPJNNoG/Vt2WXkvYE12AT3fugEkfkbrQpA4oNbvt4qkcQvH/kr02Op2U0Q+rp/ypFUkajverdbqlDQXBQjwPBoi/jeUI+vZTpPVjqfOhpMFBjG8soYsej+CTwpYZjWafHvWgKMNeYL17rIB9Uz36jQ13YyMhEWZ4/iF3McPKBMK9sZApM2vJPmo4gaqxRgwSZm/sfxRhCNq2qrz7G
x-ms-exchange-antispam-messagedata: jDlPcQkjzEUAkP2zIZW9kEY7J9Hc/6UD0YBW/Xp2JN3gzbPOrTl37VnFzbz2hBr/0wn3XBOXl0k3dvUcW+lqPsfKL5RGZshSs9yqe+u/wlLGs8h2RidFg7QgzNMf0jxK35NsxNwF2WUqXHCU3wk71e/sYGyBaH7D1YM3hycXnItxjo0TR0c0vwXxke6gKKq+BwoNt+v4XySafrBlgYM1xA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f31cef-9b97-4d1e-db2c-08d7e05033fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 08:45:36.9300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hZhpJskz8AHjz6U1zz49EV+l3TnsEE8VBoIV/DhC73Zvlm7Av81Wp4pxbqqWDh68MYOxy3O+HrPTctcKGdno4KBp/KxGZOMi67NLtCYl5bY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1371
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] LTP testcase analysis
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1924304856=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1924304856==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB14684E021A23A6B00ED69DC0EEDA0MAXPR0101MB1468_"

--_000_MAXPR0101MB14684E021A23A6B00ED69DC0EEDA0MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am running LTP on x86 with 5.4.3 kernel.i gave $ ./runltp command to run =
the complete LTP but found some failures,like oom01,futex_wait05,select04 e=
tc.

When i tried to run single test some of them turns into PASS which earlier =
got failed.like oom01 was failed then i gave coomand $./runltp -s oom01 and=
 after that it got pass.

why it could be happened,any specific reason,if you know please suggest??


Thanks!

--_000_MAXPR0101MB14684E021A23A6B00ED69DC0EEDA0MAXPR0101MB1468_
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
i am running LTP on x86 with 5.4.3 kernel.i gave $ ./runltp command to run =
the complete LTP but found some failures,like oom01,futex_wait05,select04 e=
tc.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
When i tried to run single test some of them turns into PASS which earlier =
got failed.like oom01 was failed then i gave coomand $./runltp -s oom01 and=
 after that it got pass.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
why it could be happened,any specific reason,if you know please suggest??</=
div>
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
Thanks!</div>
</body>
</html>

--_000_MAXPR0101MB14684E021A23A6B00ED69DC0EEDA0MAXPR0101MB1468_--

--===============1924304856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1924304856==--
