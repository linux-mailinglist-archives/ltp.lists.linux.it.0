Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 678D535B9C7
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 07:18:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2DB53C1CA9
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 07:18:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 839E73C1C3C
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 07:18:13 +0200 (CEST)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390093.outbound.protection.outlook.com [40.107.139.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2CC586000F6
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 07:18:12 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKZU4sjXECCQez8ASBUhTCN3XnXldLTfTQV5XQqyL/btHv+wKSdguaGeiFvtTWhK0oY1gZsGCcfqdaGcVm0WN+JIYchlBHZ1PrtyiRZfZOlMFtEp6mpkjaMGtGJ4f+H/6avc0P1yuThzBt55i9sfF3ZFHeR+dc+3WX48Oue1uwW96fSJYlz+YXn7GOfdzBQIlB/sGGgT0Zjfed4r7obtWV/bhGyCn6cIMUh9rPTO8M4ZHq0S268S3fNBgi0t/MsPigIuXH+pj9DJAFaBgXgw3NVe2RGj9cgjzv/o9jQXvi4WQ/BftwZZ5qbU9tNpnceKFrv9yIDCI/bAX7Ho0SeRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APMHu+H6Grw6p6QWSQOoaCYkYtgPogRacBlX5yFU278=;
 b=XGZEoT9S5ybpVSH6xwWu5XZJpi980WbGw6NEijxbevThxGx2AtrV+bSb+BLJR1KRs9Zl/ECP+nzXcbAGr4vvTO0BMLnVh0liirgcPif2aMicoHr2Q1q8gvf/GGHo2ofZyw3CTq8ggvL6m5GGksrfptRnuoIhlglvMcUUbmjoNqVFeEwT7XZQZEcJpSP7EnOCV0mmh9oGEWhkWXjQGrl3dO1pSSzFEs0PKh48mevHhiYA6566fa/rhQEu+OM+wUyZIt5d+oN40UDe05FxPNzwf0x76i9ccPVlyi2IcDuAZs5pk9gaZBRwZ2HYDO59T9NEl63Vx17FO7yx1rhOiG/noQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APMHu+H6Grw6p6QWSQOoaCYkYtgPogRacBlX5yFU278=;
 b=SJalZ8/blr4xKxgWHXfesjkaxi4gQwcXilefIFIX5mPt6qAk+zXkL3flou7S4yjWU+Ag8H8CwhD+2WKJ3bXuLYBo/HqvH0QjuuBEsPGoUbztGu7xvNeIU9PZW0aDykW0t/LN5CgYrlNuNqvuCzCxoH6awaC/cpeb/ebRhZuZICU=
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2f::22)
 by BMXPR01MB3319.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:56::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Mon, 12 Apr
 2021 05:18:09 +0000
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::10fe:7e69:3f57:8f77]) by BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::10fe:7e69:3f57:8f77%6]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 05:18:09 +0000
From: "Pankaj  Vinodrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] LTP msgstress03, msgstress04 failure on linux 5.10.19 and
 5.10.22
Thread-Index: AQHXLFXnprJft4mvqE6Igyuj8pAZiaqqWgaAgAACGtyAAA7pAIAACPhm
Date: Mon, 12 Apr 2021 05:18:08 +0000
Message-ID: <BM1PR01MB2868EDABC10031EC53337C1FEE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB287023E7E5B34F6D27B63564EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
 <60619D5B.6090507@fujitsu.com>
 <BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
 <BM1PR01MB2868C0458678E57C87BBC708EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
 <YG7Mbc/ZTnD85SAh@yuki>
 <BM1PR01MB28686329F64867227F9F9279EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>,
 <YG7asu6B4EEa1HUD@yuki>
In-Reply-To: <YG7asu6B4EEa1HUD@yuki>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=exaleapsemi.com;
x-originating-ip: [122.166.120.168]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e57b0cc-581f-4b5c-7865-08d8fd725c67
x-ms-traffictypediagnostic: BMXPR01MB3319:
x-microsoft-antispam-prvs: <BMXPR01MB3319B44C5A9023A0B26070D2EE709@BMXPR01MB3319.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qg9oeAPG60z5bqx3BFQap1e5arDbm0pFyKH8jKs44LE83CFAiG7PjBfLJFkfXdODtqWi+ScF0lji+1QI1EjGlNcPaslrlELIlwxS3sEbU2XCKDD37VRlIemoOu45kXCx7pRiIHPrqhVcOxE4SYYdFgu9R8CnXXY1l1Gfj9LkcTnGuxPNGnRpwKBHrO1QWG0Wi+Ve4CYLlWa7wpC5h+/lbsYwYXcQhUoqg39ahPLTkAPE+8Ex7Yx0D+kAedRwaK0gbCqfSXs1rDkGkDPWnuW5k/RAVTrcagpXP+KXH4CNMljUfOhApHI2MgZurj/ZQ31HZOiFgjkSLJi62KuKW9TCHjfm+NSIY7ya82rXMf8Mzfx8rwoWUxvbu71SGeKvxYs2o4sPNMo64dgR97OVUZrt01opbmxzTcqPMjWyqO8/noIHtlAH7ZbEOjfuVAcK/qQ8UXPO7S8gJsW6pOiEGLqalq29BRNDx4bdlDVIx2CBO96Ce2RRnrCrjEszljOmM75L96Peh6DNh2CI/NyY+Kf8nVRadUN1Fwbi0z+xZOCn5KFG2B7/k+y55RJTR7Teg0V9r44vmBjZY/YTh30MilbEKPvTvho3799bGpLDeqaNKbE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(39830400003)(376002)(136003)(33656002)(83380400001)(66446008)(76116006)(478600001)(6486002)(316002)(26005)(6506007)(8936002)(8676002)(6916009)(53546011)(66556008)(71200400001)(66946007)(4326008)(66476007)(186003)(52536014)(5660300002)(91956017)(38100700002)(6512007)(2906002)(9686003)(19627405001)(86362001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?svUR62gE1lSZpdqgPob3xKlliATiZKc+sdOcKU2mTS2Fqy57WBIQAdZTQt?=
 =?iso-8859-1?Q?U9YDZUE7Twg04vcpVL6aFsDPphyXzBgCO4bETjZOUnH+dtGbd23SJU0pJb?=
 =?iso-8859-1?Q?p68Mp1ihtJxdcSgukJlklbF6Mognd2DUt1oSag9xpXs9E04LUwcItwzq5B?=
 =?iso-8859-1?Q?F5USQq4hHL+PhZYd+5aMFO/hii/LKCussT8QkGmJGKGusINiZ/TPBERIxI?=
 =?iso-8859-1?Q?u3cukGC836sFIkgeR3+qHY05V/i1k7GnWg1xrus4zaRcP/o5CAiqiLAD8z?=
 =?iso-8859-1?Q?sY0YeMpzxLet5GPoMiIX5HinspxEIvQyy+PKiN3okkh7Dcpd06ejvl9stw?=
 =?iso-8859-1?Q?rvvchgEiBEFSzQSDnq423s/qJgXorhmoL2x7Ll0NxTuj04C8gINBO+DHHE?=
 =?iso-8859-1?Q?NRMjTLN0IJ6ne+pAVZzs23E/dYMFHMgclBrh+D4u2P6Nqlz1F5ndrtKAzr?=
 =?iso-8859-1?Q?3j1wNH8jTr3s4soA7K1ibCwN0z0Ys2Z3Fzkxi7Z8b14PyqidxMcbYaChsi?=
 =?iso-8859-1?Q?SjozGJ7FsdXUAiM82OX1hVI6OnLcXU2KTOCR40kB95UssGpwjKQClRs/De?=
 =?iso-8859-1?Q?W0w31ERwwo0SnIJ3oweBk+xoCbR8K3zlL+1Xue/dprcjysrIJzZqZQdQpy?=
 =?iso-8859-1?Q?zbOxovTeCp9/K4ai6+mTLxnl4e4pBScyIiDDzv8xXykgkRg+qnqslcQt2E?=
 =?iso-8859-1?Q?GAld4hNMsFxCru7eAopnvan/NsJlk5t6bUD4RfFhOkI7xd7HmOh3jaq7I7?=
 =?iso-8859-1?Q?hPOBGSk+0u/KMcRVzbwoRNY38DyQXG0k4S1HohaaKgbCrFY6DjL0b5VO6H?=
 =?iso-8859-1?Q?2kAt1eJPfZWmEdW+JLQ9AxXGWj6cDB/ZEWm3+rPLAV9eveDmHZJM34hWtT?=
 =?iso-8859-1?Q?cnxG3t6L0Zw4k+FQWD/4jakUV0ZMwUI44fhtqY7ICG58Ge7t4Ln480ylzt?=
 =?iso-8859-1?Q?Z6yuAJE9iVg4/NQmJAAhFIu+WA4i/R0fSsZq313iRf4LQupZ9bIAIN0+ZF?=
 =?iso-8859-1?Q?caVYEPaGmMWdZuvrPgPh0rgDY0r2/k+HjbmDVC7P8xJ+fL3IoNCBPe4Ric?=
 =?iso-8859-1?Q?OlVdMnckHWysafp2aYspmMh+6esXvZRm4Z7BXdsGbhmUmeRN8kDaAyaVlz?=
 =?iso-8859-1?Q?/M8OhpuH0rNRF9aLqrPiPUE083mFrHbjXj9lmNP1nYE3Loc1FV1Ui6Pyzw?=
 =?iso-8859-1?Q?fAgn7y20w4Csb1LPsmg8MeppRw4zR4JFxzXTcWDQll1FFB4pSY3Rv8lqDu?=
 =?iso-8859-1?Q?EBZ/MWOOsMJTehDdLK0EuWylwf7x3W+dXIDHPbUq8MBOIf7Gic569WXQw+?=
 =?iso-8859-1?Q?BIF/wd59YJhRu15XxSwIik2VI1CU8fPmgAus8mEqorMXwX7SvX6o96Dwb3?=
 =?iso-8859-1?Q?3pJE8uwOxz?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e57b0cc-581f-4b5c-7865-08d8fd725c67
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 05:18:09.0009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tbdCyljPgYj49z0+FmSXVX4nK8QjQoNbI5rEoiMLfqXDOWYM209bMmmBgnEu3QDgTYQetaR/oVz5wXt/FIihpqSb9ZKq5XJwJRV4FA/jhKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3319
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1141450662=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1141450662==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB2868EDABC10031EC53337C1FEE749BM1PR01MB2868INDP_"

--_000_BM1PR01MB2868EDABC10031EC53337C1FEE749BM1PR01MB2868INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Cyril,
Thanks for your response and help for understanding the reason of testcase =
failure
I too running the test on the machine with 8GB of RAM and the value for the=
 msgmmni is 32000 by default and i have changed 16000 then also i am not ab=
le to see any diff in output.

Anything else that i can try ??


Thanks
________________________________
From: Cyril Hrubis <chrubis@suse.cz>
Sent: Thursday, April 8, 2021 3:58 PM
To: Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] LTP msgstress03, msgstress04 failure on linux 5.10.19 an=
d 5.10.22

Hi!
> sorry, i forgot to attach log file.The LTP version i am using is  LTP Ver=
sion:  20200515 and even i have tried with latest master sources as well

Using anything older than the latest stable release is strongly discouraged=
.

<<<test_start>>>
tag=3Dmsgstress03 stime=3D1617104557
cmdline=3D"msgstress03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
incrementing stop
Fork failed (may be OK if under stress)
Fork failed (may be OK if under stress)
Fork failed (may be OK if under stress)
Fork failed (may be OK if under stress)
Fork failed (may be OK if under stress)
Fork failed (may be OK if under stress)
msgstress03    1  TFAIL  :  msgstress03.c:155:  Fork failed (may be OK if u=
nder stress)
<<<execution_status>>>

Here is the real reason for the failures, the test fails to fork() a few ti=
mes,
that is since the machine seems to have 8GB RAM and for the default maximal
number of message queues 32000 (as set in /proc/sys/kernel/msgmni) is too h=
igh.

In other words we do have 8GB RAM and try to fork 64000 (two processes per
message queue) that leaves us about 125kB per process (aprox: 8 * 1024 * 10=
24 /
64000) which is likely too low. You can try to set the /proc/sys/kernel/msg=
mni
to half of it's default i.e. 16000 and re-run the test.

The test should be cleaned up changed to scale better with available memory
however estimating how much memory will the test process need is not an eas=
y
task.

The rest of the messages you see are as I've said fallout from the test doi=
ng
unclean exit, i.e. the main process exits without waiting for it's children=
.
Which should be fixed as well, when the test is being rewritten.

--
Cyril Hrubis
chrubis@suse.cz
[EXT]

--_000_BM1PR01MB2868EDABC10031EC53337C1FEE749BM1PR01MB2868INDP_
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
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi Cyril,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks for your response and help for understanding the reason of testcase =
failure<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I too running the test on the machine with 8GB of RAM and the value for the=
 msgmmni is 32000 by default and i have changed 16000 then also i am not ab=
le to see any diff in output.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Anything else that i can try ??</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks<br>
</div>
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Cyril Hrubis &lt;ch=
rubis@suse.cz&gt;<br>
<b>Sent:</b> Thursday, April 8, 2021 3:58 PM<br>
<b>To:</b> Pankaj Vinodrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] LTP msgstress03, msgstress04 failure on linux 5.1=
0.19 and 5.10.22</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi!<br>
&gt; sorry, i forgot to attach log file.The LTP version i am using is&nbsp;=
 LTP Version:&nbsp; 20200515 and even i have tried with latest master sourc=
es as well<br>
<br>
Using anything older than the latest stable release is strongly discouraged=
.<br>
<br>
&lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
tag=3Dmsgstress03 stime=3D1617104557<br>
cmdline=3D&quot;msgstress03&quot;<br>
contacts=3D&quot;&quot;<br>
analysis=3Dexit<br>
&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
incrementing stop<br>
Fork failed (may be OK if under stress)<br>
Fork failed (may be OK if under stress)<br>
Fork failed (may be OK if under stress)<br>
Fork failed (may be OK if under stress)<br>
Fork failed (may be OK if under stress)<br>
Fork failed (may be OK if under stress)<br>
msgstress03&nbsp;&nbsp;&nbsp; 1&nbsp; TFAIL&nbsp; :&nbsp; msgstress03.c:155=
:&nbsp; Fork failed (may be OK if under stress)<br>
&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
<br>
Here is the real reason for the failures, the test fails to fork() a few ti=
mes,<br>
that is since the machine seems to have 8GB RAM and for the default maximal=
<br>
number of message queues 32000 (as set in /proc/sys/kernel/msgmni) is too h=
igh.<br>
<br>
In other words we do have 8GB RAM and try to fork 64000 (two processes per<=
br>
message queue) that leaves us about 125kB per process (aprox: 8 * 1024 * 10=
24 /<br>
64000) which is likely too low. You can try to set the /proc/sys/kernel/msg=
mni<br>
to half of it's default i.e. 16000 and re-run the test.<br>
<br>
The test should be cleaned up changed to scale better with available memory=
<br>
however estimating how much memory will the test process need is not an eas=
y<br>
task.<br>
<br>
The rest of the messages you see are as I've said fallout from the test doi=
ng<br>
unclean exit, i.e. the main process exits without waiting for it's children=
.<br>
Which should be fixed as well, when the test is being rewritten.<br>
<br>
--<br>
Cyril Hrubis<br>
chrubis@suse.cz<br>
[EXT]<br>
</div>
</span></font></div>
</body>
</html>

--_000_BM1PR01MB2868EDABC10031EC53337C1FEE749BM1PR01MB2868INDP_--

--===============1141450662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1141450662==--
