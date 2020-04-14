Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D53DC1A7B25
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 14:47:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99F5C3C2B6F
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 14:47:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 37C183C03CC
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 14:47:52 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380103.outbound.protection.outlook.com [40.107.138.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B39AC60006C
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 14:47:50 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIX4ZXb2+U4u55y3HZLtWg0NQTXMbS1LpOaeFpmOmRGwNJUT4pyeixkDqxoxgRSP9L/TTWAmnEBswhN9Wuqb03XIQGOgiHUoDkl1XKkhc/d9PSe7Z+s6InbDXtBC2RfVbRtIhxbdYEdOgjLqMpGL79IIoy/5AaYyBMNU2EH66fJ5Bt5PP/sI0wCQPybUM2rpoZJNj6c90VbC2sgdIu5XoYkLLh1+jPY0eRcRftkMRdCyNNjsdxHQCUT4/uKaVFObza9SV+WDDA4WnX/N+G4d/7rJSxtbGlOUgoIou5iRhGdhWxZiwX+5rADRbyaXC1wyDXemaQ8Be6j+xRSjoWaoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkYrtFahqdUfdXfQpjNmLPRIc+a4/Ds5q8ah4tzWYB0=;
 b=K9LwmtajUHV6+D8638D41KaPEhkVFTryOAr+wgvfAQr9Ps4Tg0kjgqOsfveq8mlaTCgzsweq6GDuVerOQPTMpWYpAPFoSYmRhPJA3iMrqPPSGUagG0eCIZF30gUAbPvTgTFnWG13Atp/r5u6YE425+UEdD5VYnUqUyimP4w6Y4f/z/d0LmDKnDj5gYj72UeIX/iMwlvUwydy+nGCwkjdr+PTeyn6dIbqMp0kJFru+/w1fLFm2rkKM+6GRxAaAl61cP76NFmZPGjWyBAKoo9Q+alE5CPVBWhtzYoAklIGgVA60D+KkBUme+al4KqUSLnK6h+0Y7CQc7Z9jpzfIh22XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkYrtFahqdUfdXfQpjNmLPRIc+a4/Ds5q8ah4tzWYB0=;
 b=y+BkfgBYmFVZwuiGCO6yJ4OpeBScgEjxY+G1lxtX7uAO6cdqsGX1x10ghe3qLUChoS+da9gRsz9MC+4Uet2cZt5YffwtbSIKOC89rllxrTeNMs98ODPJQA0lZixZpF8+QG07A2j9oT6HqUZKGUyKVxUdq7ncRfxKwCzoQTHdNRA=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB2107.INDPRD01.PROD.OUTLOOK.COM (52.134.134.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.24; Tue, 14 Apr 2020 12:47:47 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2900.028; Tue, 14 Apr
 2020 12:47:47 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] LTP testcase analysis
Thread-Index: AQHWEjgx3ddmJ2MnQkKn1rxsZFdvG6h4ZB2AgAAqhCA=
Date: Tue, 14 Apr 2020 12:47:47 +0000
Message-ID: <MAXPR0101MB146820F93DED85CE20C26FE0EEDA0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB14684E021A23A6B00ED69DC0EEDA0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>,
 <dbe77a95-1f43-8d74-5c8d-a06e465d3cca@suse.cz>
In-Reply-To: <dbe77a95-1f43-8d74-5c8d-a06e465d3cca@suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [2409:4042:200e:c2db:404d:c9b2:a883:8f2a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ab73661-6088-4109-84a6-08d7e07208ac
x-ms-traffictypediagnostic: MAXPR0101MB2107:
x-microsoft-antispam-prvs: <MAXPR0101MB2107CBDFE20B1D413C9C1331EEDA0@MAXPR0101MB2107.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(376002)(136003)(346002)(396003)(39830400003)(66476007)(186003)(66446008)(8936002)(9686003)(52536014)(64756008)(86362001)(53546011)(66946007)(6506007)(81156014)(66556008)(7696005)(8676002)(508600001)(71200400001)(55016002)(33656002)(19627405001)(76116006)(5660300002)(2906002)(316002)(6916009)(4326008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P2hIiiGjJzcBOEurl4ZtEbB2lv9ohBitpiI2pJI7KIqia8UNHJHo7ppsKsIbbaa3SlQTXmoteywnkXwjlITD4Qt59x3EozsnXmM+W3lSA6ah+lUDhv6x88Z3vP2MYs+3Ole/RRkTrf7xWxCKn94DTmRTJN6Km/LoXLXnUM8kU+HqlZe7Qkzohp5MANra7yfdMkaaeh1pNtfuqfuCWhrWT/2CW+IQKJcVu6zacyuP7hsuLNhwkvYr8KYQTm1wwx3+DZASrgm7Oyzc1TXFRPZoVzoIfOTWJ8+6VcaNNIgCXVcOhTP0/85lUO5mb2QmVzzo2XVDIcYZLrQtEAy1nPtLr2hEZwZn8ayj1obuW1RI/3/utVV01rvtZoYFbKm2WWCEj1+6Gr3F9vL1nWA8YK8D2ScSReIhNyLth7IRtc0U/9vxqmITMxLIhmMQVCUizmBp
x-ms-exchange-antispam-messagedata: D1kPSrQryPJxRGBf4GjKSOH2IcmugGppBrCZz9HQfmGRtFsC0kOmu/ReZnVwPp5PgO62xNxnYhOOG3ofjnnnLEvp1ZMa2mpTdrZDm6mXecF3qCS9u1iQM1l6DuNlwnOZeOZ8gXoc/TCyF4CGjEf1jI8KCCS42JfAnS8ydcu/QhIEKFR4F91lI2OX3jwalYr4aN3p7X4SfofM6RLWVPFRzA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab73661-6088-4109-84a6-08d7e07208ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 12:47:47.1132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vx1DX3FPQcukaC1+i1Y+U0zYSgxAUKhuWhU1z5pep3F+76AahEZ+3OZzbTiwK1lHLMioutZ8jIhiYEFfrt/vxQDlsZdse6afim+9f/QM3gE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB2107
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS,T_KAM_HTML_FONT_INVALID
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] Fw:  LTP testcase analysis
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
Content-Type: multipart/mixed; boundary="===============2013533187=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2013533187==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB146820F93DED85CE20C26FE0EEDA0MAXPR0101MB1468_"

--_000_MAXPR0101MB146820F93DED85CE20C26FE0EEDA0MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
Hi,
I forgot to mention that  i am running LTP on  VM and i am getting error li=
ke  futex_wait and select tests are "$SYSCALL slept too long" and the test =
is getting failed because  vm is not getting CPU time as expected.
Is there any that i can configure or manage this cpu time related issue for=
 now as i am running on slower machine the time constrain doesnt value for =
me...i just need test to be passed...is there any way to do so??
Kindly suggest.

Thanks!



________________________________________
From: Martin Doucha <mdoucha@suse.cz>
Sent: Tuesday, April 14, 2020 3:35 PM
To: Pankaj  Vinadrao Joshi
Cc: ltp@lists.linux.it
Subject: Re: [LTP] LTP testcase analysis

On 14. 04. 20 10:45, Pankaj Vinadrao Joshi wrote:
> Hi,
> i am running LTP on x86 with 5.4.3 kernel.i gave $ ./runltp command to
> run the complete LTP but found some failures,like
> oom01,futex_wait05,select04 etc.
>
> When i tried to run single test some of them turns into PASS which
> earlier got failed.like oom01 was failed then i gave coomand $./runltp
> -s oom01 and after that it got pass.
>
> why it could be happened,any specific reason,if you know please suggest??

The most common errors for futex_wait and select tests are "$SYSCALL
slept too long". These errors usually happen when you run the test in a
VM on overloaded host because the VM doesn't get enough CPU time to wake
the test process up within time limit.

OOM tests have issues in the mlock() test case. OOM killer is blocked by
mlock() which usually results in the parent shell being killed instead
of the expected OOM victim. This is a known kernel bug with some denial
of service potential but so far nobody came up with a fix that wouldn't
create memory corruption bugs.

That's all I can tell you without seeing the actual test output.

--
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic
[EXT]
___________________________________________________________________________=
_______________________


--_000_MAXPR0101MB146820F93DED85CE20C26FE0EEDA0MAXPR0101MB1468_
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
<div style=3D"">
<div style=3D"color: black; font-family: Calibri, Arial, Helvetica, sans-se=
rif; font-size: 12pt; margin: 0px; background-color: rgb(255, 255, 255);">
Hi,</div>
<div style=3D"color: black; font-family: Calibri, Arial, Helvetica, sans-se=
rif; font-size: 12pt; margin: 0px; background-color: rgb(255, 255, 255);">
I forgot to mention that&nbsp; i am running LTP on&nbsp; VM and i am gettin=
g error like&nbsp;&nbsp;<span style=3D"color: rgb(50, 49, 48); font-family:=
 &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Sego=
e UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue=
&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(255, 255, 2=
55); display: inline !important">futex_wait
 and select tests are &quot;<b>$SYSCALL&nbsp;</b></span><span style=3D"colo=
r: rgb(50, 49, 48); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (=
West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFo=
nt, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; b=
ackground-color: rgb(255, 255, 255); display: inline !important"><b>slept
 too long&quot; and the test is getting failed because&nbsp; vm is not gett=
ing CPU time as expected.</b></span></div>
<div style=3D"color: black; font-family: Calibri, Arial, Helvetica, sans-se=
rif; font-size: 12pt; margin: 0px; background-color: rgb(255, 255, 255);">
<span style=3D"color: inherit; font-family: inherit; font-size: 14.6667px; =
font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: in=
herit;">Is there any that i can configure or manage this cpu time related i=
ssue for now as i am running on slower
 machine the time constrain doesnt value for me...i just need test to be pa=
ssed...is there any way to do so??</span><br>
</div>
<div style=3D"color: black; font-family: Calibri, Arial, Helvetica, sans-se=
rif; margin: 0px; background-color: rgb(255, 255, 255);">
<span style=3D"font-size: 14.6667px;">Kindly suggest.</span></div>
<div style=3D"color: black; font-family: Calibri, Arial, Helvetica, sans-se=
rif; margin: 0px; background-color: rgb(255, 255, 255);">
<span style=3D"font-size: 14.6667px;"><br>
</span></div>
<div style=3D"color: black; font-family: Calibri, Arial, Helvetica, sans-se=
rif; margin: 0px; background-color: rgb(255, 255, 255);">
<span style=3D"font-size: 14.6667px;">Thanks!</span></div>
<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText"><br>
________________________________________<br>
From: Martin Doucha &lt;mdoucha@suse.cz&gt;<br>
Sent: Tuesday, April 14, 2020 3:35 PM<br>
To: Pankaj&nbsp; Vinadrao Joshi<br>
Cc: ltp@lists.linux.it<br>
Subject: Re: [LTP] LTP testcase analysis<br>
<br>
On 14. 04. 20 10:45, Pankaj Vinadrao Joshi wrote:<br>
&gt; Hi,<br>
&gt; i am running LTP on x86 with 5.4.3 kernel.i gave $ ./runltp command to=
<br>
&gt; run the complete LTP but found some failures,like<br>
&gt; oom01,futex_wait05,select04 etc.<br>
&gt;<br>
&gt; When i tried to run single test some of them turns into PASS which<br>
&gt; earlier got failed.like oom01 was failed then i gave coomand $./runltp=
<br>
&gt; -s oom01 and after that it got pass.<br>
&gt;<br>
&gt; why it could be happened,any specific reason,if you know please sugges=
t??<br>
<br>
The most common errors for futex_wait and select tests are &quot;$SYSCALL<b=
r>
slept too long&quot;. These errors usually happen when you run the test in =
a<br>
VM on overloaded host because the VM doesn't get enough CPU time to wake<br=
>
the test process up within time limit.<br>
<br>
OOM tests have issues in the mlock() test case. OOM killer is blocked by<br=
>
mlock() which usually results in the parent shell being killed instead<br>
of the expected OOM victim. This is a known kernel bug with some denial<br>
of service potential but so far nobody came up with a fix that wouldn't<br>
create memory corruption bugs.<br>
<br>
That's all I can tell you without seeing the actual test output.<br>
<br>
--<br>
Martin Doucha&nbsp;&nbsp; mdoucha@suse.cz<br>
QA Engineer for Software Maintenance<br>
SUSE LINUX, s.r.o.<br>
CORSO IIa<br>
Krizikova 148/34<br>
186 00 Prague 8<br>
Czech Republic</div>
<div class=3D"PlainText">[EXT]<br>
</div>
<div class=3D"PlainText">__________________________________________________=
________________________________________________</div>
<div class=3D"PlainText"><br>
</div>
</span></font></div>
</body>
</html>

--_000_MAXPR0101MB146820F93DED85CE20C26FE0EEDA0MAXPR0101MB1468_--

--===============2013533187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2013533187==--
