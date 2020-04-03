Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7C19D3E4
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 11:38:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE6FF3C2F86
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 11:38:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 682613C2F77
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 11:38:55 +0200 (CEST)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390104.outbound.protection.outlook.com [40.107.139.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EC240600BF0
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 11:38:53 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnzIMrkyBLQB601Kd6ssv80hl+JV986rIwA+4E8v8M2k3S65jST3nXt5g9jbjfWMEjvhE8KWYv50NgNpSDaY//goSUDcIZkzSG6vqWva/+2iqzmv6X21AyrXm1vatyeokc8MO1mccRGBHIDSGEMHqU2T+sTZPLTOfDh+CO7/m9O452/yP5NtsVSo/a1CfDriuiiDdHMeqmtkGFyNBYtBCdVRL6CY6RbTt7i/2CX+LDv3ltvV/59hEUiAI0ehSoHiQCnN5WSuQdW8KA9/Hjqc/Qjd9oA2JRfOxiPy8wZvVaiXu/Edkb+scNQOYqhdL6nZppNHKtumEdnOnMlZ87zQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm0be9vmVD5EeQpQbJ2ymPm9e/fQzjGDnNeaXStO8WI=;
 b=EyVKDM4mJ5DdHg7GP1+IqizeD/ipUG5Az7xdiRZFzgbTUZvgHn8iLAPlt/SetUJzkP/74s15sBqr73XD7WJq5Gzb5ClyReKIH39om8TMXhd7X+kbKYNAIOZ5TC0OLValwv5BpJq4GNNnbXqnxSnfnCEjy7h7Q3An7uy4emJwLjmjGj/OZAkdYhetEU1iXWvT0KbKuWIXEphXJRQf3lk9OFJmc/pTAjqUSVqRnNnTwvrGfINzMF7rKuHmhIKof3kWr/C7TpSLtg2lACaQxmZiXxRFbzVhyu9kbG58L3VHpMqiee3A/fUB+UqCztzC/5RFBgJ61eXZT3WXn1eExRwlqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm0be9vmVD5EeQpQbJ2ymPm9e/fQzjGDnNeaXStO8WI=;
 b=wT3gdfyliALA89IUnFZYEn8quSH9r5cC+KnlwKtIMuQZBDHqSaeVQuUcxTt2I6BkZZt6PNe6NvajOe4Z7DK+wz+lfRbiXTMJHIVmH71gIEm+D4ErT3qE46HsL8TSdSPya4ub1b/CtdZ5bfZQJCv0M1m5m0+mCiu+S9W5o6je9Pg=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1964.INDPRD01.PROD.OUTLOOK.COM (52.134.133.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.17; Fri, 3 Apr 2020 09:38:50 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2878.018; Fri, 3 Apr 2020
 09:38:50 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Thread-Topic: LIBTIRPC Error
Thread-Index: AQHWCZFxR5muTjHBwU+joxck3iuyFKhnIGmSgAADhKE=
Date: Fri, 3 Apr 2020 09:38:50 +0000
Message-ID: <MAXPR0101MB1468590DACB631F9D703D70EEEC70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB14688E4E7604C8BD9D17CB40EEC70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>,
 <MAXPR0101MB1468C63FD2BF7CD9AF9051E6EEC70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR0101MB1468C63FD2BF7CD9AF9051E6EEC70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [2409:4042:2e84:d2c3:1906:40a8:1738:52b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 873c0fb9-0ce8-4c40-2911-08d7d7b2d0df
x-ms-traffictypediagnostic: MAXPR0101MB1964:
x-microsoft-antispam-prvs: <MAXPR0101MB196488FB7786287A1F6A07D1EEC70@MAXPR0101MB1964.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(136003)(39830400003)(376002)(396003)(366004)(4326008)(52536014)(81166006)(81156014)(66446008)(8936002)(8676002)(6506007)(186003)(66946007)(33656002)(55016002)(2940100002)(53546011)(76116006)(64756008)(66556008)(66476007)(7696005)(5660300002)(86362001)(6916009)(71200400001)(316002)(2906002)(508600001)(19627405001)(4744005)(9686003)(7116003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UJmOTGFRPv0+0JmmiZNCdkLXAnoa29qXdD/rJfZhPemnNkA0GvjIWYUHSDavpzMm+c5r5VNgkKhWaL6p6Fbr5BUSwF3dS1+WkMJDxVMSyxUeLL7nn4Rcegcm+KhK5xRrNe4j6OfFLXiB7oZmckqUKsIEuEi9h5oy5IKVBG5KXo1ZlIfKQa33JaaX6lcryk0fiBmU+bMjqCKGwJragPk82auhcf3F+Ie/mxITdVtK6NlUna7aRCoSwlIlOIWO4XVAIgxCISZLtZdLBFYVE9VdHLTmHKVB9hrCBzH0eFOSZMc7fKnKUZdimq6cd+uEAsOOXOOM5IDqLeUvldT9lL9gC2Py8CkMk18q8qZ460VB1dlIqjjDAX7xB7oNgRrV7XTvFo+jJshQrMHVHERogXxyM6kIOPfB4tmt+RqpNjkNvgqq17UWKKZr9j6f5mbdL3Nw
x-ms-exchange-antispam-messagedata: RblbD/x71CeyiIdVgVPC8RgRPcsHDcrbmw1zz0vWLkX7EVTHMMRf9gZ3hICdDtpmTQBQimumLteUdNhDqikPWAwz1SgNA21JsSrdnez8wHg0jLnAVRE27jAwSA5wF9YfEN21C6RZblVKROY3s6VY+OlTh/yycfqZiZCegYRa+SZ3bLIJPyKzIKwrBz6Zc+tC9iNs2WrPUmyOuteMRjBpxA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873c0fb9-0ce8-4c40-2911-08d7d7b2d0df
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 09:38:50.3811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eioCmreFyPDe3WtDFrghdQ0f8Fp62jQJGGXdzVluVhdWBpQD0FEmvxCMaB1ccDOB8I9nbnCuseciOJGZvHsIX37xmZaTlS6GD6XgHiCvfyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1964
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] Fw: LIBTIRPC Error
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
Content-Type: multipart/mixed; boundary="===============0225290017=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0225290017==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1468590DACB631F9D703D70EEEC70MAXPR0101MB1468_"

--_000_MAXPR0101MB1468590DACB631F9D703D70EEEC70MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

adding ltp back

________________________________
From: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Sent: Friday, April 3, 2020 2:59 PM
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Subject: Fw: LIBTIRPC Error

Hi,
As i already mentioned in previous mail, i already installed pkg-config lib=
tirpc-dev libtirpc1 but still i am facing same.

________________________________
From: Pankaj Vinadrao Joshi
Sent: Friday, April 3, 2020 2:02 PM
To: ltp@lists.linux.it <ltp@lists.linux.it>
Cc: Deepa Ballari <deepa@exaleapsemi.com>
Subject: LIBTIRPC Error

Hi,
I am trying to run ltp on 5.4.3 kernel with our custom yocto distro but i a=
m facing following issue , i have installed

pkg-config libtirpc-dev libtirpc1 but still the same error is getting encou=
ntered,can someone help us to solve it??

./configure: line 6794: syntax error near unexpected token `LIBTIRPC,'
./configure: line 6794: ` PKG_CHECK_MODULES(LIBTIRPC, libtirpc >

Thanks!

--_000_MAXPR0101MB1468590DACB631F9D703D70EEEC70MAXPR0101MB1468_
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
adding ltp back</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Pankaj Vinadrao Joshi=
 &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Sent:</b> Friday, April 3, 2020 2:59 PM<br>
<b>To:</b> Xiao Yang &lt;yangx.jy@cn.fujitsu.com&gt;<br>
<b>Subject:</b> Fw: LIBTIRPC Error</font>
<div>&nbsp;</div>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
As i already mentioned in previous mail, i already installed&nbsp;<span sty=
le=3D"font-family:Calibri,Arial,Helvetica,sans-serif; background-color:rgb(=
255,255,255); display:inline!important"><b>pkg-config libtirpc-dev libtirpc=
1
</b>but still<b>&nbsp;</b>i am facing same.</span></div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<b><br>
</b></div>
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Pankaj Vinadrao Joshi=
<br>
<b>Sent:</b> Friday, April 3, 2020 2:02 PM<br>
<b>To:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Cc:</b> Deepa Ballari &lt;deepa@exaleapsemi.com&gt;<br>
<b>Subject:</b> LIBTIRPC Error</font>
<div>&nbsp;</div>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>Hi,</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>I am trying to run ltp on 5.4.3 kernel with our custom yocto distro b=
ut i am facing following issue , i have installed&nbsp;</span><span>
<p style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0px; margin-bott=
om:0px">
pkg-config libtirpc-dev libtirpc1 but still the same error is getting encou=
ntered,can someone help us to solve it??<br>
</p>
</span><span></span><span></span><span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>.<b>/configure: line 6794: syntax error near unexpected token `LIBTIR=
PC,'<br>
</b></span><b><span>./configure: line 6794: ` PKG_CHECK_MODULES(LIBTIRPC, l=
ibtirpc &gt;</span></b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks!<br>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MAXPR0101MB1468590DACB631F9D703D70EEEC70MAXPR0101MB1468_--

--===============0225290017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0225290017==--
