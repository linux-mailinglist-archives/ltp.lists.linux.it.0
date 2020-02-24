Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B87169D68
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 06:09:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF2AF3C25A4
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 06:09:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0C5FB3C185D
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 06:09:16 +0100 (CET)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380107.outbound.protection.outlook.com [40.107.138.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C1331600BD8
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 06:09:15 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5neqPDSSmPg5/mXeD18eo2/O1LJeC7QqZSYLJAkFnXC5UdHkX+ohdNsRyEWinWJA1S5RNQs8KbRZjWHfbLFvM3HLNuS7y7qSByXG2sU7ErWSTWhdUfPBn4JwIYV6N8pefFQcE8La2pNfL70LlowGal+4SymkcvRcpqY3n2EFoOrZgeC6jhWLHxMLsTZXZXE/CWmstIFP1nNhY0VEkVI/yCk9IVvr8zMNGQKjf5HO4Z5XzgzSGy3JrXq8Fm1asoPZM5Ak86O13khPciBro5QfpQ4nv+efpQqO/YWsvn8xkmHVAV9iGcJmgrp/61647zZlhwlt1aobKtIKRzfg5VjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikPB6VFCHa/EZlIyI6xaug4CLeM00rA1jui9VtQZ/48=;
 b=J2luMiM0UM7FunecNe7YFmoiX/rOuJORl614wuUo2pSbOYgCEzR5czK+Vr63J1zfLYn8MebShqwxMOGlnCWhY/O9keILpzbR05jR9ZWG2vrjUeztLpNr6p6ikONFRoufO34RM63u3OOsKm+9+xdzGzGuc5RJpIiSFfVXV/ysr8RFcnNIc0Ta/PZZ/gdcbUgKSWMy8tXx0UesCMXINnuvoccj39hSsYeG+9S4i6JknkMr7PW/XQdLiEEXMeTpUoQeIPVLyRoKnJSDCBVnLOzAvCyhuYsnFii3sROFOKTdeO1BBsJRMRyKzIiRquYMixXiTvViviFbBg0EP5uS4rR87w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikPB6VFCHa/EZlIyI6xaug4CLeM00rA1jui9VtQZ/48=;
 b=EKIRVsT5rzp4BN0J3E0TivDzSbppVHsj1MB1oA+BWZnesRi6BHYqw46zcxEi64fx0jHi18XJOL0UeUCv54iaz8W1V27EB5wJDhLidqxSa9ahKp7i86Wi2vNYqwU7FP6qmv/QcyEt3bUwyw9a6WBd1Kugtz9xlOdawimp7tHB3V8=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1595.INDPRD01.PROD.OUTLOOK.COM (52.134.131.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Mon, 24 Feb 2020 05:09:12 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2750.021; Mon, 24 Feb
 2020 05:09:12 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: min_free_kbytes  test failing
Thread-Index: AQHV57Oplweux/LgR0iKli0YqJLSHagp0Te9
Date: Mon, 24 Feb 2020 05:09:12 +0000
Message-ID: <MAXPR0101MB146893B306F3375AD15DA76BEEEC0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <BM1PR0101MB1459EF571BFF86EE43FBF66BEE130@BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BM1PR0101MB1459EF571BFF86EE43FBF66BEE130@BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1953042-86b3-4a99-3bfa-08d7b8e7afe8
x-ms-traffictypediagnostic: MAXPR0101MB1595:
x-microsoft-antispam-prvs: <MAXPR0101MB1595570A48703EBD1663B6AAEEEC0@MAXPR0101MB1595.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(136003)(39830400003)(366004)(376002)(189003)(199004)(316002)(55236004)(6506007)(7116003)(5660300002)(76116006)(6916009)(52536014)(55016002)(9686003)(19627405001)(66946007)(86362001)(508600001)(81156014)(81166006)(2906002)(8936002)(8676002)(71200400001)(33656002)(66446008)(66476007)(66556008)(64756008)(7696005)(26005)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1595;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: itEL9YTUKoRQUvFUMgq5KBxTp3stkWQu5mt1LLBAMb07Bbmq8CogsRC6H5dOD2cv+HUkIzNB0gN/rhYRRq0XrJU8ZR+TXDnAFS3BtFLXizDcwpkKpMOiqwxSclFDuKVC9S9/ubfBNJDN5HaJ5QKWdDv/6eltuKzaOCM3h7d9EVYFlcjzzAmcu36/781/pvTUzf7e5YOHXGUu129f4860vpuUlPkKevPsEnhtrW1xPj+ue52aGIiaThtzAxiTWG2vScaoun4avV0CL8C4sIID5BKBFR9RI4Ii5vHTTe3tTW9BSropGLQRCFqmS64LxCDCkRbz6nAua4wWrJVU0mQEs3O1BopnGkXD0qhU8uObA8uVAvrYSavt1vykU1qCRCPbYSRavz5bQryZCHfrtY71GvDf7d0J8koRjYTdr2aGB9x6gJCU3qkZ3xgVc7n8dx4Y
x-ms-exchange-antispam-messagedata: DeJtEN6RIQdZfGUqYy0VadrwtCqGaudORnZ+PieiS5jHL1XY5VdxEaXIs+wZceM7peMwozKtVIFy/bsRSs20Eo1qq7quEWS2BX4c0+ugVr3NIM01Lp6dYcg9t+1YZ62KKM2Eq+qoGWGtUMxXyGWa7A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1953042-86b3-4a99-3bfa-08d7b8e7afe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 05:09:12.3163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bt1Ac+cG8rak6mLv2bMq7eYQLcWCZ12ZC3I4Xcfxz2E5oCtYOJKYkzXti658lcQlcZq9H3zkFCkOeKqUAxiM6rdlKKyrLSBZT1k4/vgnZyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1595
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] Fw: min_free_kbytes  test failing
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
Content-Type: multipart/mixed; boundary="===============1915391553=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1915391553==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB146893B306F3375AD15DA76BEEEC0MAXPR0101MB1468_"

--_000_MAXPR0101MB146893B306F3375AD15DA76BEEEC0MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



Hi,
I am running min_free_kbytes on my RISC  v system wth linux 5.4.3 with cust=
om Yocto distro,the test is getting failed with following errors.What could=
 be the possible reason for failure i have posted the same issue earlier bu=
t didnt find an appropriate solution?


root@exaleapsemi:~/pankaj_ltp/ltp/testcases/kernel/mem/tunable# ./min_free_=
kbytes
tst_test.c:1206: INFO: Timeout per run is disabled
mem.c:817: INFO: set overcommit_memory to 2
mem.c:817: INFO: set min_free_kbytes to 11441
memfree is 7968532 kB before eatup mem
memfree is 4196564 kB after eatup mem
mem.c:817: INFO: set min_free_kbytes to 22882
memfree is 7967752 kB before eatup mem
memfree is 4198660 kB after eatup mem
mem.c:817: INFO: set min_free_kbytes to 163642
memfree is 7967328 kB before eatup mem
memfree is 4186296 kB after eatup mem
mem.c:817: INFO: set overcommit_memory to 0
mem.c:817: INFO: set min_free_kbytes to 11441
memfree is 7966824 kB before eatup mem
min_free_kbytes.c:152: FAIL: child unexpectedly failed: 11
mem.c:817: INFO: set min_free_kbytes to 22882
memfree is 7992744 kB before eatup mem
safe_macros.c:633: BROK: min_free_kbytes.c:121: waitpid(34,0x3fffec0854,10)=
 failed: ECHILD (10)
min_free_kbytes.c:147: FAIL: child unexpectedly failed: 512
mem.c:817: INFO: set min_free_kbytes to 163642
memfree is 7987848 kB before eatup mem
safe_macros.c:633: BROK: min_free_kbytes.c:121: waitpid(34,0x3fffec0854,10)=
 failed: ECHILD (10)
min_free_kbytes.c:147: FAIL: child unexpectedly failed: 512
mem.c:817: INFO: set overcommit_memory to 1
mem.c:817: INFO: set min_free_kbytes to 11441
memfree is 7987748 kB before eatup mem
min_free_kbytes.c:134: FAIL: child unexpectedly failed: 11
mem.c:817: INFO: set min_free_kbytes to 22882
memfree is 7995428 kB before eatup mem
min_free_kbytes.c:134: FAIL: child unexpectedly failed: 11
mem.c:817: INFO: set min_free_kbytes to 163642
memfree is 7995760 kB before eatup mem
min_free_kbytes.c:134: FAIL: child unexpectedly failed: 11
min_free_kbytes.c:82: PASS: min_free_kbytes test pass
mem.c:817: INFO: set min_free_kbytes to 11441
mem.c:817: INFO: set overcommit_memory to 0

Summary:
passed   1
failed   6
skipped  0
warnings 0


--_000_MAXPR0101MB146893B306F3375AD15DA76BEEEC0MAXPR0101MB1468_
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
<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div id=3D"divRplyFwdMsg" dir=3D"ltr">
<div><span>Hi,</span> </div>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>I am running <span>min_free_kbytes </span>on my RISC&nbsp; v system w=
th linux 5.4.3 with custom Yocto distro,the test is getting failed with fol=
lowing errors.What could be the possible reason for failure i have posted t=
he same issue earlier but didnt find
 an appropriate solution?<br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>root@exaleapsemi:~/pankaj_ltp/ltp/testcases/kernel/mem/tunable# ./min=
_free_kbytes
<br>
</span>
<div>tst_test.c:1206: INFO: Timeout per run is disabled<br>
</div>
<div>mem.c:817: INFO: set overcommit_memory to 2<br>
</div>
<div>mem.c:817: INFO: set min_free_kbytes to 11441<br>
</div>
<div>memfree is 7968532 kB before eatup mem<br>
</div>
<div>memfree is 4196564 kB after eatup mem<br>
</div>
<div>mem.c:817: INFO: set min_free_kbytes to 22882<br>
</div>
<div>memfree is 7967752 kB before eatup mem<br>
</div>
<div>memfree is 4198660 kB after eatup mem<br>
</div>
<div>mem.c:817: INFO: set min_free_kbytes to 163642<br>
</div>
<div>memfree is 7967328 kB before eatup mem<br>
</div>
<div>memfree is 4186296 kB after eatup mem<br>
</div>
<div>mem.c:817: INFO: set overcommit_memory to 0<br>
</div>
<div>mem.c:817: INFO: set min_free_kbytes to 11441<br>
</div>
<div>memfree is 7966824 kB before eatup mem<br>
</div>
<div><b>min_free_kbytes.c:152: FAIL: child unexpectedly failed: 11</b><br>
</div>
<div>mem.c:817: INFO: set min_free_kbytes to 22882<br>
</div>
<div>memfree is 7992744 kB before eatup mem<br>
</div>
<div>s<b>afe_macros.c:633: BROK: min_free_kbytes.c:121: waitpid(34,0x3fffec=
0854,10) failed: ECHILD (10)</b><br>
</div>
<div><b>min_free_kbytes.c:147: FAIL: child unexpectedly failed: 512</b><br>
</div>
<div>mem.c:817: INFO: set min_free_kbytes to 163642<br>
</div>
<div>memfree is 7987848 kB before eatup mem<br>
</div>
<div><b>safe_macros.c:633: BROK: min_free_kbytes.c:121: waitpid(34,0x3fffec=
0854,10) failed: ECHILD (10)</b><br>
</div>
<div><b>min_free_kbytes.c:147: FAIL: child unexpectedly failed: 512</b><br>
</div>
<div>mem.c:817: INFO: set overcommit_memory to 1<br>
</div>
<div>mem.c:817: INFO: set min_free_kbytes to 11441<br>
</div>
<div>memfree is 7987748 kB before eatup mem<br>
</div>
<div><b>min_free_kbytes.c:134: FAIL: child unexpectedly failed: 11</b><br>
</div>
<div>mem.c:817: INFO: set min_free_kbytes to 22882<br>
</div>
<div>memfree is 7995428 kB before eatup mem<br>
</div>
<div><b>min_free_kbytes.c:134: FAIL: child unexpectedly failed: 11</b><br>
</div>
<div>mem.c:817: INFO: set min_free_kbytes to 163642<br>
</div>
<div>memfree is 7995760 kB before eatup mem<br>
</div>
<div><b>min_free_kbytes.c:134: FAIL: child unexpectedly failed: 11</b><br>
</div>
<div>min_free_kbytes.c:82: PASS: min_free_kbytes test pass<br>
</div>
<div>mem.c:817: INFO: set min_free_kbytes to 11441<br>
</div>
<div>mem.c:817: INFO: set overcommit_memory to 0<br>
</div>
<div><br>
</div>
<div>Summary:<br>
</div>
<div>passed &nbsp; 1<br>
</div>
<div>failed &nbsp; 6<br>
</div>
<div>skipped &nbsp;0<br>
</div>
<div>warnings 0<br>
</div>
<span></span><br>
</div>
</div>
</div>
</body>
</html>

--_000_MAXPR0101MB146893B306F3375AD15DA76BEEEC0MAXPR0101MB1468_--

--===============1915391553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1915391553==--
