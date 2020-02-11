Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 70375159145
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 15:00:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F299A3C2382
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 15:00:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A11E23C1CA6
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 15:00:43 +0100 (CET)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390103.outbound.protection.outlook.com [40.107.139.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 735D36012CB
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 15:00:42 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGgb/sK2bQIzuPTXojl45lGjnR9sHltp92rMam9cRE/z3cWdizbEuj6w9m/ujAgqzlihwzjrXRAytTAu2N5LMoZ7TefS8CVHqXjOrmUIgGo/nnzjvFaRcwAn47b8NbvnwxwOpJM1x5x8jVxkCi+8KpUr8fVU1VEdAJFWvnttAIplRFU+bw5e4jZTcB3OBoI3ncFO/tvYJT5e/RzZhm2W8Ccnf2nW57fZLUyzSpSSW9CoBuRfR7rtwQQhvbyuemSONHdEA9YOoirWqK8IOBgGNUJEL6Mgb7HcsnSuNsEEbSdsJwiSfvhFDq78Gsb027G3BTfiwwZ03xe9Tv5qJZZjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqSuFmhPqqmZ3AQ+87g0STxOWLHLY+lgbdaiXnWGooI=;
 b=NWa6LPSHI40xcSHp7L6mBQN5NjAr/OKs9RTLTQhA3FcrS6UemSQSgCyDbmrU0A7VkQI37o97rYO4325Qd4C9dhjux5YJC6aN5QdiOqqlX35k26Ahcr94oskZTQhh0omLjdCejAxdKJMVwFmG0Zfi/QiEWSmof0ezIXBDJhXUwd8TbJr4zmzmhTnLCFTAi1VxXFyHr731i1YPsO2jUYEEoFBo/fEGK8cng7tEMhVT5lpPUj4FPU5WZo8T+MciBK6dx3qtYAtRKV3XSm8W7OtT5pgXRY0UJXuoaPwtKXQGP0SaDlhgRNUVpu4oCldDqAd8wKrVVuL8qgx0DzeWpgFnrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqSuFmhPqqmZ3AQ+87g0STxOWLHLY+lgbdaiXnWGooI=;
 b=LgMR2b1j8DHZUt+uCwJ0sOmmLm6qHe91FlyyjFPok0290vvpyWYBAkl2BllLnlaJgfVpy0hjWy8db4XyVSoLQCZdUZEOEOGKNfqqvj+e5+dhwAKgI6YRwJ/R0uRQ7o+eLiqfnU1JR6/X3OIFnkl/P8YXMu5JvUtmz+R1Pc6csxE=
Received: from BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM (20.178.170.140) by
 BMXPR01MB2295.INDPRD01.PROD.OUTLOOK.COM (52.133.135.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Tue, 11 Feb 2020 14:00:39 +0000
Received: from BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3422:a591:b37a:113b]) by BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3422:a591:b37a:113b%6]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 14:00:39 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: Running kill11 failing with safe_macros.h:312: kill11.c:207:
 setrlimit(4,0x3ffff109c0) failed: errno=EINVAL(22): Invalid argument
Thread-Index: AQHV4OOkwNmmC0W8x0Cq49DHzSw9jg==
Date: Tue, 11 Feb 2020 14:00:39 +0000
Message-ID: <BMXPR01MB29991C0EF971408503911674EE180@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [106.201.59.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 869c0a9b-2964-4573-34de-08d7aefac693
x-ms-traffictypediagnostic: BMXPR01MB2295:
x-microsoft-antispam-prvs: <BMXPR01MB2295D9132FF63902B0F0D6FFEE180@BMXPR01MB2295.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(39830400003)(366004)(136003)(396003)(199004)(189003)(6506007)(316002)(7696005)(71200400001)(55016002)(2906002)(55236004)(86362001)(6916009)(33656002)(19627405001)(52536014)(91956017)(76116006)(26005)(5660300002)(9686003)(81156014)(81166006)(8676002)(508600001)(8936002)(186003)(66476007)(66556008)(66946007)(64756008)(66446008)(4744005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BMXPR01MB2295;
 H:BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PRhDl5CEu/7n0QOpzdkZbPTBvAD7V/Ycplk2/6+EoRFexNiW0O0akIsYYEKZqN2zkT8fwJJiCfxV+5/yDAe1mOoxp1Rvn7+wzM3jHVSl6aWv7Hs0WD6Nf8JAgkuhLbg4ZLFE6fYlUVLmXTQqLY37qg7K+0meM2ER74pQ93jg0n16r5gNsq2z0XxZ2K5UMLkdegrLcWJR2o0p2A4ZBDi32FX9/5FX4PUD9yikV9P8H9V8GynW0cl7/rrMJ8mvCoxtqeJ6oB7DoDKX1ZVzirmtc1ZsKM3s+7Qpf/L3ihScIwVtuKljWrx5n8hLc7FJVLN/PZLkT4AoZm/ZDtVetiaIBTKd1GhsXz7QvUYXARcKKUFqKjeb8RUYpIZ/O+rBp/LBH4ZYDLFFwFmL8y0XzXlvUgMnk6ljPX3oijOX5csClHbfbj3tO1A9rXA/ZbeQm+86
x-ms-exchange-antispam-messagedata: 68Dda7hCXn2+OV+xcSXcxeOE28Dc6bCEagvM5ss/2eZtq6x6nvnqnSc7jnl4gRdHiqmMtzTyByeHjETiBVrTQvIYeVfjOigWTvxl6G1s9rtGTg3q5M9ZqDubcpiZ6VVz1I68CM+aUU3Q19ApiJuiIQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869c0a9b-2964-4573-34de-08d7aefac693
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 14:00:39.1868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L91FDpJMdXQe1X2LLMYfg5RKSUlDCIsv1lZY2Psg9uUta/ssHdPJAvJBRK4aRZrdTE3RqMEgiT8Asis9ZDJHI3+JNbstWQHawLwJ9DVJuR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2295
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] Running kill11 failing with safe_macros.h:312: kill11.c:207:
 setrlimit(4, 0x3ffff109c0) failed: errno=EINVAL(22): Invalid argument
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
Content-Type: multipart/mixed; boundary="===============1411343221=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1411343221==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB29991C0EF971408503911674EE180BMXPR01MB2999INDP_"

--_000_BMXPR01MB29991C0EF971408503911674EE180BMXPR01MB2999INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am trying to run kill11 test on machine my test is getting breaked with f=
ollwing message.

kill11 0 TINFO : Adjusting RLIMIT_CORE to 1048576
kill11 1 TBROK : ../../../../include/old/safe_macros.h:312: kill11.c:207: s=
etrlimit(4,0x3ffff109c0) failed: errno=3DEINVAL(22): Invalid argument
kill11 2 TBROK : ../../../../include/old/safe_macros.h:312: Remaining cases=
 broken

--_000_BMXPR01MB29991C0EF971408503911674EE180BMXPR01MB2999INDP_
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
<p>Hi,<br>
i am trying to run kill11 test on machine my test is getting breaked with f=
ollwing message.</p>
<p>kill11 0 TINFO : Adjusting RLIMIT_CORE to 1048576<br>
kill11 1 TBROK : ../../../../include/old/safe_macros.h:312: kill11.c:207: s=
etrlimit(4,0x3ffff109c0) failed: errno=3DEINVAL(22): Invalid argument<br>
kill11 2 TBROK : ../../../../include/old/safe_macros.h:312: Remaining cases=
 broken</p>
</body>
</html>

--_000_BMXPR01MB29991C0EF971408503911674EE180BMXPR01MB2999INDP_--

--===============1411343221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1411343221==--
