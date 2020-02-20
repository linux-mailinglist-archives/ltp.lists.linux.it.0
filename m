Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1200316574C
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 07:09:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 958F43C223C
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 07:09:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 6C1523C1482
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 07:09:35 +0100 (CET)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380123.outbound.protection.outlook.com [40.107.138.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5DA421401A3C
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 07:09:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0fx0DRwgC3su8zoU/djZGkwoXRgi5RE+EssxupCInKwWZ9oGvkUBUzz512xg1FX1TKguAZ90Ob1lKJT+Wy54YeJkXT2g1qiGyoF9uFocIkvuBHpOow6Jir2Fke8qQnPrMzV6vZGR37zj3hmwaqg3mVoMekDSdy92IrIKpy13ePYM3HICZqnBItAvTSNd8mzIGpfX4v0he9ArFooyinh6MAfhts3QRgVr3MGp5Srlskhcwz4pmDPwrR9EVi9aKpTNlzb1/UwVCQ8hz58ETNxI6EfmLwOAWrDBWxFIgFv0cKkpvpDlVKlYOGX9edXFnPmNxCJjQfTcvMe2V4Mo+O/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6qtTt64CH2cqvdzHPcayP3y3FG0jbcGrgFoYUiIB4s=;
 b=J4kkxnfJi8KNd0Qs+fB7FYE3e7DWjamKgKbVS4xzK1SdIPOiJ1be4x2oH8Qi2XoG2Wsf0yZ/ue0XXd9KVCNXJP0f8AgtC8KfVktrGhePzw4AxH+21bBjJY9TmU30ggSWuTNrrpB/U0PTxHqcvlGC4k/nrybsLK5hf82NdK+NqhW/evKb3xOrU/Aoj7ptkyfuYK3EViFqXPg/BNrVe/vf/pIlzTPQoTSHkgzl8VxVckoHEofc3nLN0w8qAnm1kLMcPq/AO4ohErglB0wPprX2DS34yPilFl43PoAVdLPIX/GfZq28713LhU9zNLFBVR8uBR54vn9Lmjmwjdiksk4BmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6qtTt64CH2cqvdzHPcayP3y3FG0jbcGrgFoYUiIB4s=;
 b=fVUNaPxdLCJgkwz6rAXLyf6+TVHKqg6kX0GMnhhKa4OnP0fc/zo3G/kUgRMB2vlHnwO2T7lC0b45pnNA0hMMCWJZ/o4bqS6pK0nzcsFdRUfEnhJ21RDL3ai8+YFLTWh8duMNpG+E3SnrG/O7MM8jaVaYl1e0ibr1XF25FLVmvBU=
Received: from BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM (52.133.130.138) by
 BM1PR0101MB1364.INDPRD01.PROD.OUTLOOK.COM (10.174.222.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Thu, 20 Feb 2020 06:09:31 +0000
Received: from BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::79ec:9872:e794:f5e1]) by BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::79ec:9872:e794:f5e1%8]) with mapi id 15.20.2729.032; Thu, 20 Feb 2020
 06:09:31 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: min_free_kbytes  test failing
Thread-Index: AQHV57Oplweux/LgR0iKli0YqJLSHQ==
Date: Thu, 20 Feb 2020 06:09:31 +0000
Message-ID: <BM1PR0101MB1459EF571BFF86EE43FBF66BEE130@BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba9f66b2-5145-4c57-db32-08d7b5cb7347
x-ms-traffictypediagnostic: BM1PR0101MB1364:
x-microsoft-antispam-prvs: <BM1PR0101MB1364F39DC9D3C491877B36E1EE130@BM1PR0101MB1364.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(376002)(346002)(39830400003)(396003)(189003)(199004)(7116003)(81156014)(55016002)(508600001)(9686003)(6506007)(5660300002)(8676002)(186003)(52536014)(71200400001)(81166006)(2906002)(55236004)(8936002)(19627405001)(66946007)(26005)(76116006)(64756008)(7696005)(66556008)(86362001)(66446008)(316002)(6916009)(33656002)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BM1PR0101MB1364;
 H:BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d6UVN003tcLyab917YN3+13X19ElCwLtmZfQFnne6o7uu2+kANn8htMMMsmFxROn1Of5gldvkoH5UVF9BtA+XiiuZ/bOV4qPFEdRWDb0oR3ipSTktr52EAs76qnvPEw1sGkW6pWTU8+MLqbuZesixFDvs/7zllt0k2jtF90zUz9jIB1n/wL0LGydXArYTE/Il2qsMrJV8/oBRVVJ8046zzoReRfheXcmm/o/aPEtQB2yThYokbxYtdVy/CcAWb06QwoZEaYKqU7i2JrHo4y4DvGOnMZmzAFeSb6VuzIlv0s5JdkEPuvPZK3ryq1MElQKQe17XyM3PQk3j9vpYLENTZjFwv6uC6HPkBnUHzF/o4zDxtu1aVl2XOUaeK/dJA3JcgWJJ5IfT7cVXmmPYrjgh1kxWZV2CwgAd0nA4NAvmHeVFXZzjnQtLziXUwaDTbb+
x-ms-exchange-antispam-messagedata: Xcwrd05+C+6Fq0zvWMVeReAQ4ECFmHTWjP8W1nIs4f0/vo6Uix2hSVpl8klAPl6ZCE1oTYL89FvQDQLzQrjnbCKsdPq6zEERMcNVDTZCO8t9S0EBT6azqTEC9CfMVKIQtO6CL5bG7f8Begtn4kGe1w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9f66b2-5145-4c57-db32-08d7b5cb7347
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 06:09:31.1812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H0oBTa8i8yGaSlp+i7SYNPwecWda5jdqlRQU8idI11wk5VAFyTyJl64t+5CMSOXQHvKnRaWR6IcpNYyA97tbabJvBHY5nsTbXl/j87IkZIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1364
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] min_free_kbytes  test failing
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
Content-Type: multipart/mixed; boundary="===============1835813219=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1835813219==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR0101MB1459EF571BFF86EE43FBF66BEE130BM1PR0101MB1459_"

--_000_BM1PR0101MB1459EF571BFF86EE43FBF66BEE130BM1PR0101MB1459_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am running min_free_kbytes on my RISC  v system wth linux 5.4.3 with cust=
om Yocto distro,the test is getting failed with following errors.What could=
 be the possible reason for failure?


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


--_000_BM1PR0101MB1459EF571BFF86EE43FBF66BEE130BM1PR0101MB1459_
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
<span>I am running <span>min_free_kbytes </span>on my RISC&nbsp; v system w=
th linux 5.4.3 with custom Yocto distro,the test is getting failed with fol=
lowing errors.What could be the possible reason for failure?<br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
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
</body>
</html>

--_000_BM1PR0101MB1459EF571BFF86EE43FBF66BEE130BM1PR0101MB1459_--

--===============1835813219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1835813219==--
