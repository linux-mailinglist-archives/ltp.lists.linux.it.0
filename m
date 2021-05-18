Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF01387335
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 09:23:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4897C3C604C
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 09:23:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8C2193C55FD
 for <ltp@lists.linux.it>; Tue, 18 May 2021 09:23:52 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380094.outbound.protection.outlook.com [40.107.138.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 89DBB1400F26
 for <ltp@lists.linux.it>; Tue, 18 May 2021 09:23:51 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hducDhg6RNFrwzD7qxRtgelK8xb+kMDCDOfCPtcbTus18YDRzE375QeT+HOdQrDcrEBid29iIPgKU20AH+rC1xNF5DjAcitcUsGa6k80pgqvgZtzijvOZIuPHIiZpigxnWkvglSCe2GFP+bUhXrLA7kdwjlvB7XPN0BPXRF+e2/s0s40dwNhJAOMN5qJIhvbuyuIe8RX0Ya86WGrtZEreXoc1bvhP5fwXCMsHjzTRslTcCsR3XzRU59D2gl0k6dJGNf716SKZ2Dtb35v6/zDoVTr2//qFxSoDd8HvDw/PDzH7bO9SW9O3TOJE8zowoFyp4+57KSBVoF6gIEJyksgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDjXDGSaZSZEood7Mv7pMrl8T1HzH4xCMgRFdypyeAc=;
 b=GWqOumJsF8qIbxLvs6Dy6y1z1h8bHaB39fCAhmREhExx3seG1PiycT63K8mUh+IMoMxl9rDuIwU9edXiqdMI5YwChLrNuuNL4QdzZsYFfPZByRQ7/Uyopm5qvaEt+yjmTFMGT5Ln6uTdlTdtWTSjZN4oSApcJIfmi1WGhhT8ozEP66La2G2OWHlWkck84DynZnjAaFqlmE4gG2Gweez7ertcl4rvXJVHEQRJ+ic0F08dRK8TQbEnLGZK9NHHbZNjCNXx3RrKoaqF4+S+IS/SvNnC0CwYrFnuIwM3VGScDembjnsDe/7vNqDgHzZgA2RHTIV/Okgf+PRZLUV9RtufXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDjXDGSaZSZEood7Mv7pMrl8T1HzH4xCMgRFdypyeAc=;
 b=N6JxL97kfgTyOkYxmbUk1jNRHLIsLBy8wSXGPCYf05QHIdd8rFHQAItxyZVb1XBmR21ZDWLYWlKL+wqf1ZctdZIjMODR98boIozZ13juAi4vjtGJmHuyqrdEeIDnWp7CeDKqVUT7y/dSgiVaQKMnanv+ettILmqX/aa2gsqwbv0=
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2f::22)
 by BM1PR01MB2418.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 07:23:47 +0000
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bd48:bcd1:78ce:125b]) by BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bd48:bcd1:78ce:125b%3]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 07:23:47 +0000
From: "Pankaj  Vinodrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] LTP msgstress03, msgstress04 failure on linux 5.10.19 and
 5.10.22
Thread-Index: AQHXLFXnprJft4mvqE6Igyuj8pAZiaqqWgaAgAACGtyAAA7pAIAACPhmgAZRTgCANrxQU4ABktO4
Date: Tue, 18 May 2021 07:23:47 +0000
Message-ID: <BMXPR01MB287078E4F686A47E30C5F642EE2C9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB287023E7E5B34F6D27B63564EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
 <60619D5B.6090507@fujitsu.com>
 <BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
 <BM1PR01MB2868C0458678E57C87BBC708EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
 <YG7Mbc/ZTnD85SAh@yuki>
 <BM1PR01MB28686329F64867227F9F9279EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
 <YG7asu6B4EEa1HUD@yuki>
 <BM1PR01MB2868EDABC10031EC53337C1FEE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>,
 <YHQu6l0xp8VmG+ry@yuki>,
 <BMXPR01MB2870B48DB06939CF5F7FF3FCEE2D9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB2870B48DB06939CF5F7FF3FCEE2D9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=exaleapsemi.com;
x-originating-ip: [2409:4042:e1d:d178:e5a7:74eb:d6d5:973c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57d2de50-dcd6-44b1-329a-08d919cde0a3
x-ms-traffictypediagnostic: BM1PR01MB2418:
x-microsoft-antispam-prvs: <BM1PR01MB24182EA91A8F6F946797C6EFEE2C9@BM1PR01MB2418.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8PRbL3J4Wy2GkWDhiEinG6FmpTyb8MB7EQjQFEZwDX+fIs/HZV0Gq76Vw5TcxVOD8fz95N+uNsluO0s/x7cXFLsG6+fJghh1m97vOBfyHx27iU1+A+yTpOoiCINFc2g7MoF5EroKDWsryMyZuFMehT8jFGpjMj2j2JYn7WUfnSWIb3/R6E8KO08aP6dSNMESEv3SdZ/N9riyDscSmbz1on1aGuekd+s4EyROZFuaqttV36TO6fdgZBF34eravppG0E0xwJ8a2Q9ipCnl1ruHsuDs/AUMON5zroJaAw4HMr6m4ZH55XK9zWqjCnfczoa/zcxst1SMdc3yDQ74huFOiTPIulUvW+9iHq91cFIA2Cg2RXb5B/+smHaVOrXsLuZK7tpK31eCUFgpiYVgjDA40Sd+B0Ptrdlxw0vrOyaqgwo8k/QCqNuDmiivEjSIfk+d5oWpuxy2eLdxOFCsRg8ZmqIYIPLWotf5agEzY0aWnCjEiNLb0SkMsORaD7Mjcf2+duRX4p2sA+p+o3sAc57emgML3CbSo1NFTg7nBj1LjnIUNmqC7HdfcWwnKk4KVCqX/+uvf9ckCgICxyTxQRfkW5DfgrGo7JdY1vdd3oH+EGE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(136003)(366004)(39830400003)(346002)(376002)(4326008)(86362001)(52536014)(7696005)(2906002)(8936002)(19627405001)(478600001)(53546011)(83380400001)(5660300002)(6506007)(33656002)(186003)(66946007)(6916009)(55016002)(76116006)(66476007)(8676002)(64756008)(66446008)(91956017)(9686003)(38100700002)(122000001)(66556008)(316002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?NHDsloDMqcOCc/z396qiSAxjh7zqm8avmrrJL8bxacSB+Opbg5Yq7suIB1c8?=
 =?us-ascii?Q?ZnpNfuzoq0BoSMuLLOj1UavuS0hwVY7kRbEBhqQt9rgNKnvl9kBsMlmHR47m?=
 =?us-ascii?Q?1NFoGS9tQkNyTnKZZVUAk44/TS4Muj7VZeI/VX0vLTpSBkIXbSrDFCbwdvcd?=
 =?us-ascii?Q?mJwzA3AKz7FAYV6TpsH0QUDt32TiGQS3Apaip6zuCGnuTK9oWyUW0+XsVoYs?=
 =?us-ascii?Q?tc0LKZ+nTfGuZF5kv5MAOIQ1p2bOBT9LZikV1BrD9eeZTmLVr8zy/Zm+mHZK?=
 =?us-ascii?Q?3iOrazqdufH4NehBY4U7+NTJk+EqaIneaLdi7cNBPrxYKE/wTalB78hS5RPW?=
 =?us-ascii?Q?EK+cdcdqeQBOs2fZBRkvsPYHTasvMO03TZpcNUfqp3p2t7drlKxGQlckrC6S?=
 =?us-ascii?Q?zSprmjMaE2RCsA+F6zP75+zEj+oSveIeWLzruK+260P/LMYkn93W72Aa1z4h?=
 =?us-ascii?Q?/EsHOvDkkPQRvJd6dHeHCoRwW0Uoqa4BHlqsAJaaXGlR0h+1I31jvxPo3Ugs?=
 =?us-ascii?Q?fPOmO+HDvTpSWtYZUZlIq6Mm3eMWDsYzXstGomIFuyAgw6TXvONUFCgr4scl?=
 =?us-ascii?Q?IoAUtc41eOkoyAAbVB1apShmYfsQFb9RgFZlZ1eE9+1wihfhZgQDYHBpth8l?=
 =?us-ascii?Q?7S+4bZAjEy2bk+HFMCM/4EFB70sUzajP6oXYq2JQdH02bNIFv1rXxlzyZfrp?=
 =?us-ascii?Q?5XrA4QpQ207S8YICOL18N9uak54eT0AmWg69Bu06E4yVUX0MNjtzFsSVMZZ6?=
 =?us-ascii?Q?CSOvD7KFU/SM+uX6L8s5Ojt5CJJZcfc+ImUorMPr+8AVKRKQxoV5JEtSavsN?=
 =?us-ascii?Q?ahQNeNG12voAvF+bHGRIbp9+9PpeWTVkYN9qW+sCZ7kiL2RTyauPM0lmc4bX?=
 =?us-ascii?Q?kYqcdCxFlYG9POQeqbUJ2YG0WlGAdXDVAWLwCANh2qcteVbLTUWEmzsK6JgA?=
 =?us-ascii?Q?ZVXF08ZwWMAnO59b7XmLo0GH7DYcgaOqdZ2Cgzoi2+ilUijW3YILT/NyBqXn?=
 =?us-ascii?Q?is++pQr7MqegGDGDHj7krSYoYduOffvUfNJj3lCxBlxjwAypH3QS7GXQ1sRR?=
 =?us-ascii?Q?UE/dX2rz+d9LYISsWkwnxrPaGaJ13XvxhPZBqpyomYMIGcfOzkElshcTqd2T?=
 =?us-ascii?Q?qRHogMhmIDXv2P5vmHTKvpHBhbY3BUnO/GvvvH7Cctfhyhe+6N2Y+QfCsaPK?=
 =?us-ascii?Q?tDtiZ4yzrNkvTSBdL/vWmqfrkfEbDmMGOYhvruDMfmpAg3AId8aRNwCBChb/?=
 =?us-ascii?Q?DDrEB2m9lIi7dJOpTgfzk0FF7gGekLr4URhe/L7oM909fWsDyvbgDxCvbdaA?=
 =?us-ascii?Q?sfiLT0bNIQacX8FgQkdv+tYFhHyRip0YokFJPNFZSoNTvtUAiUkntPoUKO1B?=
 =?us-ascii?Q?YtvTeUScH39Rd7RzOeiFZX2kbOIL?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d2de50-dcd6-44b1-329a-08d919cde0a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2021 07:23:47.6178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogpfdwXf7BZ6rUBUVaWc0NAVX5B3xsVqV//JQ+xtJI8JWU5fGZ85iVHq5HW/C56Nx8DCJfq4c8/x6y3//LkMdWbH0ed33lNSai0GDNAe5Ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2418
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] LTP msgstress03,
 msgstress04 failure on linux 5.10.19 and 5.10.22
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
Content-Type: multipart/mixed; boundary="===============1961518026=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1961518026==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB287078E4F686A47E30C5F642EE2C9BMXPR01MB2870INDP_"

--_000_BMXPR01MB287078E4F686A47E30C5F642EE2C9BMXPR01MB2870INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kind reminder. Please help me with approaches.


Thanks
________________________________
From: Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>
Sent: Monday, May 17, 2021 1:11 PM
To: Cyril Hrubis <chrubis@suse.cz>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] LTP msgstress03, msgstress04 failure on linux 5.10.19 an=
d 5.10.22

Hi Cyril,

With value of msgmni 8000 it worked well for me but i want to understand wh=
ich part from the log (produced by strace or some other method) i should be=
 focused on to get to know ohkk it is failure because of value of msgmni is=
 more.
How you analyzed and helped me to fix ,what approach you have followed ?

Thanks
________________________________
From: Cyril Hrubis <chrubis@suse.cz>
Sent: Monday, April 12, 2021 4:58 PM
To: Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] LTP msgstress03, msgstress04 failure on linux 5.10.19 an=
d 5.10.22

Hi!
> Thanks for your response and help for understanding the reason of testcas=
e failure
> I too running the test on the machine with 8GB of RAM and the value for t=
he msgmmni is 32000 by default and i have changed 16000 then also i am not =
able to see any diff in output.
>
> Anything else that i can try ??

Try with less, I suppose 8000 should work fine.

If estimating how many processes we can run was easy the test would have
been fixed a long time ago.

--
Cyril Hrubis
chrubis@suse.cz
[EXT]

--_000_BMXPR01MB287078E4F686A47E30C5F642EE2C9BMXPR01MB2870INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kind reminder. Please help me with approaches.</div>
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
Thanks<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Pankaj Vinodrao Joshi=
 &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Sent:</b> Monday, May 17, 2021 1:11 PM<br>
<b>To:</b> Cyril Hrubis &lt;chrubis@suse.cz&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] LTP msgstress03, msgstress04 failure on linux 5.1=
0.19 and 5.10.22</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi Cyril,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
With value of msgmni 8000 it worked well for me but i want to understand wh=
ich part from the log (produced by strace or some other method) i should be=
 focused on to get to know ohkk it is failure because of value of msgmni is=
 more.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
How you analyzed and helped me to fix ,what approach you have followed ?</d=
iv>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Cyril Hrubis &lt;ch=
rubis@suse.cz&gt;<br>
<b>Sent:</b> Monday, April 12, 2021 4:58 PM<br>
<b>To:</b> Pankaj Vinodrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] LTP msgstress03, msgstress04 failure on linux 5.1=
0.19 and 5.10.22</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Hi!<br>
&gt; Thanks for your response and help for understanding the reason of test=
case failure<br>
&gt; I too running the test on the machine with 8GB of RAM and the value fo=
r the msgmmni is 32000 by default and i have changed 16000 then also i am n=
ot able to see any diff in output.<br>
&gt;<br>
&gt; Anything else that i can try ??<br>
<br>
Try with less, I suppose 8000 should work fine.<br>
<br>
If estimating how many processes we can run was easy the test would have<br=
>
been fixed a long time ago.<br>
<br>
--<br>
Cyril Hrubis<br>
chrubis@suse.cz<br>
[EXT]<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BMXPR01MB287078E4F686A47E30C5F642EE2C9BMXPR01MB2870INDP_--

--===============1961518026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1961518026==--
