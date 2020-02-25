Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5091516BE2E
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 11:03:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D542E3C25E9
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 11:03:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D37E73C137A
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 11:03:21 +0100 (CET)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380101.outbound.protection.outlook.com [40.107.138.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 784A61001739
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 11:03:17 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdleXgZBV9/tRowtmJn3w5AqtBhN6niKjNjhAJaBfYferf8TRg1x1hbv71JbtYTOFuj+daMDbLKfCPaJKx85tfWUIV+bv9brSuJ48fVkAmwv4IZFGuRD6Ao5DvLYarHqDCr9tn7414cqhfaPFHXgRk4XHo7S4K2ripDJIl0XhlByBjampMpmxTwyLY11MUwUJVvNfe8inOd10o8H9IRbwCwXdmw89Y+JQwKW4Uj9GtRid9yX3JupFn78JGTPIFM6hq1fjz8I4xToy4CXctgPR0/SVGbIlcyI9zHlK5U4RQ/ja6ulE+1EWTE8WEYS3ORsJQFxVVYi6aDeVK4MFv70mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKGkPnqiQGfyWfEiyFhWGs4Ui8mSPj25GK3Ut/ag8Y4=;
 b=IEAoUcNKHPgnSlh+Mgnu03KG5lHjzT+RIFas25SXzAJB0GfboRAyPwthd35VeLagnmw+sMTX1FlJK51TyawVF+8ejffTllljgAbH84Hnp74Bcr/ZyywYKYX4bL1z6SpFRBp6br0abb9lUkPDxZlbRWErfW1jMVZU8nx74IUDyA/+BeftMqTqNqLWmx2NxM9ku/Pn2RvXz3JOrvhWp8v06qLFddhsdHw5XEjle8JC+a/g89D4GejD4w1oM6c/C8FF6+R5yCI7m3GFwoaqse6at8uQjHEp5EMBTO/Fx8wxSClYU3aUCUx1bZ4+v7YUGzuqb/vPmi7bPDscWZHi9zlWcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKGkPnqiQGfyWfEiyFhWGs4Ui8mSPj25GK3Ut/ag8Y4=;
 b=r0pUkVvnBAdkd1hD045EAJUpkdh/mR50yVIroWJ5aszGRkXY21XLWMMdTXPCTY2k8+DTux6dyn+eoa3/166bUyPxLU4o0F5quUt7ZnUzIhZOmGOjcw4iKpAjwFvnE/9SAkanM4EnLdubhOSkmK5LMNUF3fHkoYaeS6sZbVgGtTg=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1497.INDPRD01.PROD.OUTLOOK.COM (52.134.130.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Tue, 25 Feb 2020 10:03:14 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2750.021; Tue, 25 Feb
 2020 10:03:14 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Jan Stancek <jstancek@redhat.com>
Thread-Topic: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly failed: 139
Thread-Index: AQHV4mZtdlpcIR01/E2nMHLN6pJmPrc5w5Tp8OWOEejzESWd3Yzu4zT/UFIizlH9fo4IJsCrKxiBv1U/UJVpzTJVDPyxoTV7zPgp7IyzCSf2TxjR/rEk/0KbJ1ejmne95aOaSEC3fN/mZvPLG2tk0w==
Date: Tue, 25 Feb 2020 10:03:14 +0000
Message-ID: <MAXPR0101MB1468590F5585E000D2380876EEED0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB14687E3C724A815D2857EA14EE1A0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <MAXPR0101MB14685FEB7F52C97C8835B106EE110@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <558576867.8097569.1582098912792.JavaMail.zimbra@redhat.com>
 <BM1PR0101MB14596D9D318FF13C32724A32EE100@BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM>
 <732362668.8105497.1582103304747.JavaMail.zimbra@redhat.com>
 <MAXPR0101MB1468CAB5F98BE95E3170E7A3EEED0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <641229800.8775991.1582616022386.JavaMail.zimbra@redhat.com>
 <MAXPR0101MB14681EB0C7F8BBC970B19ED9EEED0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>,
 <768964483.8786340.1582619493789.JavaMail.zimbra@redhat.com>
In-Reply-To: <768964483.8786340.1582619493789.JavaMail.zimbra@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1cc32ce-0e3c-4f4e-edf2-08d7b9d9eda1
x-ms-traffictypediagnostic: MAXPR0101MB1497:
x-microsoft-antispam-prvs: <MAXPR0101MB1497F690457E24B8C6499DC0EEED0@MAXPR0101MB1497.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(396003)(39830400003)(136003)(346002)(189003)(199004)(316002)(55236004)(81166006)(6506007)(76116006)(5660300002)(19627405001)(66946007)(6916009)(4326008)(86362001)(81156014)(508600001)(9686003)(52536014)(53546011)(55016002)(2906002)(8676002)(8936002)(33656002)(71200400001)(66446008)(66556008)(66476007)(64756008)(21615005)(7696005)(26005)(186003)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1497;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NLwDMONcc0+4d+HZGhp69AoSSNuQhVqlzN6KfxLg2Cwr955zjioMPOYPf6SbUj5gzoVoxkj6PlMQuxLHNLUF8yA4yVwwqVPjskEET7n1WVm3xl9vZVFIpKyWjNmIa+tTLYs8vDCnFdFlKvUWWRBEJAYxbq3AvMg2mAXrB+/dhOUbCfcKl3Jhiz5rcTe/zv1k4v1WPxTt9sVDkLjuVn5zktJeS5cvMHfHVlibpqkNiCF/TPDDFN0qmo8vREAu+40dlrXNHhIWfpaqbPBPcCdMqH0MnqdEJup5XhbMwAj+ScxW4389x/Qptg0DN//47BpFltv6/4Nha9Ezd07fcqO3IawIIZUH/xISuiYLpzOo2S7F+DMTIItcF+2avls6WouEBvoUduEcm3doGxiXsSolIMQe3+52Xiukbr26QUk8pyj8VmYB+yCOX3gBN8vx11304UDwWlDuWXUhI3lDCyoBBUBRvRmFmxLzSQ1SbhPa9SLJ4g5cUhRbYzFQflxD/qlE2t04JZrvBMdXeuQxRkKkihnJN3hWa2UqAYiyzWR7CTxaSp/2SwUe+LtU/nEleuRV
x-ms-exchange-antispam-messagedata: FrtqNW8MjV0FrxOdQX9Xc6LuuSq9ZZKYSb6ZWhG4fET4Mq2V5KwB6ljTxpczYsl8ICZkdPcT8x2tNkF5S+xuGBI7jLLlbOARZccae20DV/39lkkrjINqVwEYqOTUc89ZbvWj+pQI/QoFiG1uo8nBxQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cc32ce-0e3c-4f4e-edf2-08d7b9d9eda1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 10:03:14.0599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gBNvoCFktan2hUGPuMCHrAPkNjikVrpzqhhnrv7dWaPEqhXOTKRaLUfWDOfhgzLfzW8tcv0fnTOURSea7rPAkALye2u0TI+iM+sUukVBRRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1497
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly failed:
 139
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
Content-Type: multipart/mixed; boundary="===============0621652479=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0621652479==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1468590F5585E000D2380876EEED0MAXPR0101MB1468_"

--_000_MAXPR0101MB1468590F5585E000D2380876EEED0MAXPR0101MB1468_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

LTP is built natively,atleast for now i seeing crash for this particular te=
st only. I am also not able to get how and that is failing there?


________________________________
From: Jan Stancek <jstancek@redhat.com>
Sent: Tuesday, February 25, 2020 2:01 PM
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Cc: LTP Mailing List <ltp@lists.linux.it>
Subject: Re: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly failed: =
139

[adding back LTP list] Please keep the list CC-ed, you might get more respo=
nses
from other members.

----- Original Message -----
> (gdb) bt
> #0  0x0000003fe1713b92 in __vfscanf_internal (s=3D0x23000, format=3D<opti=
mized
> out>, argptr=3D<optimized out>, mode_flags=3D<optimized out>) at
> vfscanf-internal.c:345
> Backtrace stopped: Cannot access memory at address 0xfffffffffffffff9

Which is unfortunate.

Only place I see child reaching vfscanf is via check_monitor -> get_sys_tun=
e,
but per test output it's not check_monitor child, but eatup_mem one.

I don't see why it would crash here, and why it happens on RISCV only.
I can only recommend to try simplify the testcase to see what triggers it.

Is this the only LTP test you see crashing?
Is it built natively on RISCV or is it cross-compiled in other environment?

> (gdb) where
> #0  0x0000003fe1713b92 in __vfscanf_internal (s=3D0x23000, format=3D<opti=
mized
> out>, argptr=3D<optimized out>, mode_flags=3D<optimized out>) at
> vfscanf-internal.c:345
> Backtrace stopped: Cannot access memory at address 0xfffffffffffffff9
>
> (gdb) info registers
> ra             0x16438 0x16438 <safe_waitpid+40>
> sp             0x3fffd94850 0x3fffd94850
> gp             0x29f10 0x29f10 <ipc_path+544>
> tp             0x3fe16cd720 0x3fe16cd720
> t0             0xffffffffffffffff -1
> t1             0x1366c 79468
> t2             0x1000 4096
> fp             0x1 0x1
> s1             0x180 384
> a0             0x180 384
> a1             0x3fffd948c4 274875369668
> a2             0xa 10
> a3             0x0 0
> a4             0x3fffd948c4 274875369668
> a5             0xffffffffffffffff -1
> a6             0x1 1
> a7             0x104 260
> s2             0x3fffd948c4 274875369668
> s3             0xa 10
> s4             0x79 121
> s5             0x3fe17e6008 274366095368
> s6             0x21ad0 137936
> s7             0x22000 139264
> s8             0x22000 139264
> s9             0x22000 139264
> s10            0x23000 143360
> s11            0x1fed70 2092400
> t3             0x3fe17e5790 274366093200
> t4             0x3fe17a2070 274365816944
> t5             0x3fe17a2970 274365819248
> t6             0x5 5
> pc             0x3fe1713b92 0x3fe1713b92 <__vfscanf_internal+1126>
> (gdb)
>
> ________________________________
> Sent: Tuesday, February 25, 2020 1:03 PM
> Subject: Re: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly failed=
:
> 139
>
> ----- Original Message -----
>
> > Hi Jan,
> > i have tried to collect the core through GDB this is the result i
> > found??what
> > i should conclude from this??
>
> Can you paste the output of backtrace? ('bt' command in gdb)
>
>
> > root@exaleapsemi:~/pankaj_ltpn/ltp/testcases/kernel/mem/tunable# gdb
> > ./min_free_kbytes core.378
> > GNU gdb (GDB) 8.3.1
> > Copyright (C) 2019 Free Software Foundation, Inc.
> > License GPLv3+: GNU GPL version 3 or later
> > <http://gnu.org/licenses/gpl.html>
> > This is free software: you are free to change and redistribute it.
> > There is NO WARRANTY, to the extent permitted by law.
> > Type "show copying" and "show warranty" for details.
> > This GDB was configured as "riscv64-oe-linux".
> > Type "show configuration" for configuration details.
> > For bug reporting instructions, please see:
> > <http://www.gnu.org/software/gdb/bugs/>.
> > Find the GDB manual and other documentation resources online at:
> > <http://www.gnu.org/software/gdb/documentation/>.
>
> > For help, type "help".
> > Type "apropos word" to search for commands related to "word"...??
> > Reading symbols from ./min_free_kbytes...
> > [New LWP 378]
> > [Thread debugging using libthread_db enabled]
> > Using host libthread_db library "/lib/libthread_db.so.1".
> > Core was generated by `./min_free_kbytes'.
> > Program terminated with signal SIGSEGV, Segmentation fault.
> > #0 0x0000003fe1713b92 in __vfscanf_internal (s=3D0x23000, format=3D<opt=
imized
> > out>, argptr=3D<optimized out>, mode_flags=3D<optimized out>) at
> > vfscanf-internal.c:345
>

[EXT]

--_000_MAXPR0101MB1468590F5585E000D2380876EEED0MAXPR0101MB1468_
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
LTP is built natively,atleast for now i seeing crash for this particular te=
st only. I am also not able to get how and that is failing there?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jan Stancek &lt;jstan=
cek@redhat.com&gt;<br>
<b>Sent:</b> Tuesday, February 25, 2020 2:01 PM<br>
<b>To:</b> Pankaj Vinadrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Cc:</b> LTP Mailing List &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly f=
ailed: 139</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[adding back LTP list] Please keep the list CC-ed,=
 you might get more responses<br>
from other members.<br>
<br>
----- Original Message -----<br>
&gt; (gdb) bt<br>
&gt; #0&nbsp; 0x0000003fe1713b92 in __vfscanf_internal (s=3D0x23000, format=
=3D&lt;optimized<br>
&gt; out&gt;, argptr=3D&lt;optimized out&gt;, mode_flags=3D&lt;optimized ou=
t&gt;) at<br>
&gt; vfscanf-internal.c:345<br>
&gt; Backtrace stopped: Cannot access memory at address 0xfffffffffffffff9<=
br>
<br>
Which is unfortunate.<br>
<br>
Only place I see child reaching vfscanf is via check_monitor -&gt; get_sys_=
tune,<br>
but per test output it's not check_monitor child, but eatup_mem one.<br>
<br>
I don't see why it would crash here, and why it happens on RISCV only.<br>
I can only recommend to try simplify the testcase to see what triggers it.<=
br>
<br>
Is this the only LTP test you see crashing?<br>
Is it built natively on RISCV or is it cross-compiled in other environment?=
<br>
<br>
&gt; (gdb) where<br>
&gt; #0&nbsp; 0x0000003fe1713b92 in __vfscanf_internal (s=3D0x23000, format=
=3D&lt;optimized<br>
&gt; out&gt;, argptr=3D&lt;optimized out&gt;, mode_flags=3D&lt;optimized ou=
t&gt;) at<br>
&gt; vfscanf-internal.c:345<br>
&gt; Backtrace stopped: Cannot access memory at address 0xfffffffffffffff9<=
br>
&gt;<br>
&gt; (gdb) info registers<br>
&gt; ra&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x16438 0x16438 &lt;safe_waitpid&#43;40&gt;<br>
&gt; sp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x3fffd94850 0x3fffd94850<br>
&gt; gp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x29f10 0x29f10 &lt;ipc_path&#43;544&gt;<br>
&gt; tp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x3fe16cd720 0x3fe16cd720<br>
&gt; t0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0xffffffffffffffff -1<br>
&gt; t1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x1366c 79468<br>
&gt; t2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x1000 4096<br>
&gt; fp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x1 0x1<br>
&gt; s1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x180 384<br>
&gt; a0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x180 384<br>
&gt; a1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x3fffd948c4 274875369668<br>
&gt; a2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0xa 10<br>
&gt; a3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x0 0<br>
&gt; a4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x3fffd948c4 274875369668<br>
&gt; a5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0xffffffffffffffff -1<br>
&gt; a6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x1 1<br>
&gt; a7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x104 260<br>
&gt; s2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x3fffd948c4 274875369668<br>
&gt; s3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0xa 10<br>
&gt; s4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x79 121<br>
&gt; s5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x3fe17e6008 274366095368<br>
&gt; s6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x21ad0 137936<br>
&gt; s7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x22000 139264<br>
&gt; s8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x22000 139264<br>
&gt; s9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x22000 139264<br>
&gt; s10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0x23000 143360<br>
&gt; s11&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0x1fed70 2092400<br>
&gt; t3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x3fe17e5790 274366093200<br>
&gt; t4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x3fe17a2070 274365816944<br>
&gt; t5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x3fe17a2970 274365819248<br>
&gt; t6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x5 5<br>
&gt; pc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x3fe1713b92 0x3fe1713b92 &lt;__vfscanf_internal&#43;1126&gt;<br>
&gt; (gdb)<br>
&gt;<br>
&gt; ________________________________<br>
&gt; Sent: Tuesday, February 25, 2020 1:03 PM<br>
&gt; Subject: Re: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly fai=
led:<br>
&gt; 139<br>
&gt;<br>
&gt; ----- Original Message -----<br>
&gt;<br>
&gt; &gt; Hi Jan,<br>
&gt; &gt; i have tried to collect the core through GDB this is the result i=
<br>
&gt; &gt; found??what<br>
&gt; &gt; i should conclude from this??<br>
&gt;<br>
&gt; Can you paste the output of backtrace? ('bt' command in gdb)<br>
&gt;<br>
&gt;<br>
&gt; &gt; root@exaleapsemi:~/pankaj_ltpn/ltp/testcases/kernel/mem/tunable# =
gdb<br>
&gt; &gt; ./min_free_kbytes core.378<br>
&gt; &gt; GNU gdb (GDB) 8.3.1<br>
&gt; &gt; Copyright (C) 2019 Free Software Foundation, Inc.<br>
&gt; &gt; License GPLv3&#43;: GNU GPL version 3 or later<br>
&gt; &gt; &lt;<a href=3D"http://gnu.org/licenses/gpl.html">http://gnu.org/l=
icenses/gpl.html</a>&gt;<br>
&gt; &gt; This is free software: you are free to change and redistribute it=
.<br>
&gt; &gt; There is NO WARRANTY, to the extent permitted by law.<br>
&gt; &gt; Type &quot;show copying&quot; and &quot;show warranty&quot; for d=
etails.<br>
&gt; &gt; This GDB was configured as &quot;riscv64-oe-linux&quot;.<br>
&gt; &gt; Type &quot;show configuration&quot; for configuration details.<br=
>
&gt; &gt; For bug reporting instructions, please see:<br>
&gt; &gt; &lt;<a href=3D"http://www.gnu.org/software/gdb/bugs/">http://www.=
gnu.org/software/gdb/bugs/</a>&gt;.<br>
&gt; &gt; Find the GDB manual and other documentation resources online at:<=
br>
&gt; &gt; &lt;<a href=3D"http://www.gnu.org/software/gdb/documentation/">ht=
tp://www.gnu.org/software/gdb/documentation/</a>&gt;.<br>
&gt;<br>
&gt; &gt; For help, type &quot;help&quot;.<br>
&gt; &gt; Type &quot;apropos word&quot; to search for commands related to &=
quot;word&quot;...??<br>
&gt; &gt; Reading symbols from ./min_free_kbytes...<br>
&gt; &gt; [New LWP 378]<br>
&gt; &gt; [Thread debugging using libthread_db enabled]<br>
&gt; &gt; Using host libthread_db library &quot;/lib/libthread_db.so.1&quot=
;.<br>
&gt; &gt; Core was generated by `./min_free_kbytes'.<br>
&gt; &gt; Program terminated with signal SIGSEGV, Segmentation fault.<br>
&gt; &gt; #0 0x0000003fe1713b92 in __vfscanf_internal (s=3D0x23000, format=
=3D&lt;optimized<br>
&gt; &gt; out&gt;, argptr=3D&lt;optimized out&gt;, mode_flags=3D&lt;optimiz=
ed out&gt;) at<br>
&gt; &gt; vfscanf-internal.c:345<br>
&gt;<br>
<br>
[EXT]<br>
</div>
</span></font></div>
</body>
</html>

--_000_MAXPR0101MB1468590F5585E000D2380876EEED0MAXPR0101MB1468_--

--===============0621652479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0621652479==--
