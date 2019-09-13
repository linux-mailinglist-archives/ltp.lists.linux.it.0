Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A12C9B1FBD
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 15:31:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FF3B3C20BB
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 15:31:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8E7C23C0054
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 15:18:32 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150129.outbound.protection.outlook.com [40.107.15.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 86F81257339
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 15:18:31 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQNndqR6GAVqoC5PkEfnr12COHhrJXS2wbaZiI95y0K/gM894wuDp1jJAS8rIm6U2YxOkjNq1Pyc1SbQ/pSj7Lh+mdgHe9m+teqA0hKi7HsLnX6xQQk0cOajwGyxGuflHxZyWV4PTWf3+VwArCThJK5bmCYOdAOagg9RKOqrbBBOtDbXdxyPP0eVuNCCNVVNlnMSfe/aR8dpUivvI8kqh5JmhY5ld/PfABolsP/HM/b16JzgJakPOtYYuSi5RwFi48ZvLY8yFSGtOmIAy65EnuzR9r1pjsX3sj+xN26fikEtdGLaCiPizBjf6GJUaRWIVCewD1CppVa86u+M9Q/zFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AdTd+suv7Mbqw4b6hBERWg+Gm5+Ja1nnGhY9qoorp8=;
 b=lEAI32cz/px4M7LdFQmdj8kDK7RGzBsrDn4iO0BYiYnY03shblKKVEaXDfRJc2FgvQj+0UzKPRGhBnCM1nZLhUToXbgL1Ciqy+O5RFtN+JmQTrCP+i9ut8lK+/PP7fEpgIbnEFdS8RKemGotBUsSvTPlRcRtbKxvDn7t3C4qkXD7OQrwccCOiPs/KFIMCGACDFmmsnqVbZLLVaAn373JsumOroAljgRvoVu9kK9kFk+03OJXWQjadZ6J0y/ZWabKKhtIbuc5FKAP386RVfA18TYfM9OJZEQp+e/lTefm1qVbhwDnzbjCk6sphS4Whn7dF8gsrX8nOSPSinOaB+eCHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=l4b-software.com; dmarc=pass action=none
 header.from=l4b-software.com; dkim=pass header.d=l4b-software.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l4bsoftware.onmicrosoft.com; s=selector2-l4bsoftware-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AdTd+suv7Mbqw4b6hBERWg+Gm5+Ja1nnGhY9qoorp8=;
 b=UUw/g/KXGCt8dUXDOEcJ3lnnZn/hyP1CTrBEC2ZNIZbfXNWQYAHHE30VwGnyxZ613QPtvnphpi7giat/OLrcMzLwtyqCKURvAOLx6K5rzU1GXZgu61kMFqJ8TsJtQ+iXBBJgIVH3jcLemdfHjB7luxKZUya8yUddgFVJIx+FHMo=
Received: from VI1PR0101MB2557.eurprd01.prod.exchangelabs.com (10.168.64.14)
 by VI1PR0101MB2349.eurprd01.prod.exchangelabs.com (10.168.66.140) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13; Fri, 13 Sep
 2019 13:18:29 +0000
Received: from VI1PR0101MB2557.eurprd01.prod.exchangelabs.com
 ([fe80::f4f5:697e:1d42:ab50]) by
 VI1PR0101MB2557.eurprd01.prod.exchangelabs.com
 ([fe80::f4f5:697e:1d42:ab50%2]) with mapi id 15.20.2263.021; Fri, 13 Sep 2019
 13:18:28 +0000
From: Vladut Magas <vladut.m@l4b-software.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: Kdump update required
Thread-Index: AQHVajVj5zZWbzEFwU++B3CBMSFD0g==
Date: Fri, 13 Sep 2019 13:18:28 +0000
Message-ID: <VI1PR0101MB2557DC78E7B6994F8429AE11F0B30@VI1PR0101MB2557.eurprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vladut.m@l4b-software.com; 
x-originating-ip: [82.208.151.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fb00870-623c-403c-8a8c-08d7384cde05
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:VI1PR0101MB2349; 
x-ms-traffictypediagnostic: VI1PR0101MB2349:
x-microsoft-antispam-prvs: <VI1PR0101MB2349E2070F24939601817A14F0B30@VI1PR0101MB2349.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39830400003)(376002)(366004)(136003)(396003)(189003)(199004)(71200400001)(19627405001)(8936002)(86362001)(9686003)(105004)(76116006)(52536014)(66476007)(54896002)(64756008)(7736002)(2906002)(66616009)(66946007)(66556008)(66446008)(186003)(2501003)(508600001)(5660300002)(53936002)(99936001)(26005)(25786009)(6116002)(102836004)(6506007)(3480700005)(316002)(7116003)(71190400001)(33656002)(14454004)(256004)(7696005)(74316002)(14444005)(66066001)(6436002)(99286004)(6916009)(5640700003)(733005)(8676002)(81166006)(81156014)(55016002)(1730700003)(476003)(486006)(2351001)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0101MB2349;
 H:VI1PR0101MB2557.eurprd01.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: l4b-software.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WJS5B8QBEA0eOwCdMm9V7CTR0SR1FTVW+Aynz2CZ9EJuKmnbYTYQ75JZOFDOPjSbubxU5x9OvsJOd0hmSrEw2fb2c3D+Qob1vn52SMvLlcbYCZxPxJVn0wZ0ZrXFnxIkdLZtCfal/C9B0QJFRTMUoKy1tjqufQg2f8AKxSBwSk0psGy7RfH6XhpUbH/osIy59NzGaJ8EInRMcFXmUIpwb143IytU1cOxm4Mp3xuxVTLkaiovE/69uUNlFuItrWH/k8xTuFSvNmEx8pZX5vdqdPCn/CxIK2hVXhcLjlUzn68wjwFW6q1oo5lZISlCTgI7OmKCmZ4arLeeJ+pjm+IAnt+mNu6DOsbrXmEuEEAl+aMCTfcgh4E9Oj+oyp3wdFzZm6bnMkjT6czeRTJkftupqxiEw/ux+dAbBxtabZEqSPE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: l4b-software.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb00870-623c-403c-8a8c-08d7384cde05
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 13:18:28.4781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 83feffb6-f261-41dd-8a82-a738a5922e1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qDAbVvq0CAwVO01NpO5LYjdbZ3jIAfIibkkEdm4MiZqHsQs6ihen0lWNEDT0B35gVvScPFnkQRzlK7fsMaXBC/rXtp72uFxOnCmXr3HYZuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0101MB2349
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 13 Sep 2019 15:31:13 +0200
Subject: [LTP] Kdump update required
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
Content-Type: multipart/mixed; boundary="===============0564963676=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0564963676==
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_VI1PR0101MB2557DC78E7B6994F8429AE11F0B30VI1PR0101MB2557_";
	type="multipart/alternative"

--_004_VI1PR0101MB2557DC78E7B6994F8429AE11F0B30VI1PR0101MB2557_
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0101MB2557DC78E7B6994F8429AE11F0B30VI1PR0101MB2557_"

--_000_VI1PR0101MB2557DC78E7B6994F8429AE11F0B30VI1PR0101MB2557_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I am writing to you about the kdump. I am trying to run kdump on Debian 9 (=
Stretch), but the "setup.sh" has a small error as you can see below, based =
on the error received:

  CC      /root/Desktop/ltp/testcases/kdump/lib/lkdtm/lkdtm.mod.o
  LD [M]  /root/Desktop/ltp/testcases/kdump/lib/lkdtm/lkdtm.ko
make[3]: Leaving directory '/usr/src/linux-headers-4.9.0-9-amd64'
make[2]: Leaving directory '/root/Desktop/ltp/testcases/kdump/lib/lkdtm'
make[1]: Leaving directory '/root/Desktop/ltp/testcases/kdump/lib'
+ echo Modify Boot Loader.
Modify Boot Loader.
+ [ x86_64 =3D ppc64 ]
+ [ x86_64 =3D i686 ]
+ [ x86_64 =3D ia64 ]
+ args=3Dcrashkernel=3D256M@128M
+ [ -x /sbin/grubby ]
+ echo Warn: please make sure the following arguments are in Boot Loader:
Warn: please make sure the following arguments are in Boot Loader:
+ echo crashkernel=3D256M@128M
crashkernel=3D256M@128M
+ echo Hit any key when ready.
Hit any key when ready.
+ read
./setup.sh: 105: read: arg count
Makefile:2: recipe for target 'all' failed
make: *** [all] Error 2


In DEbian 9 there is no grubby tool and no way to install it, so the /sbin/=
grubby will never be found and the error will always occur. Is there someth=
ing I can do about this problem?

Thank you!

Best regards,

        Emanuel-Vladut Magas

L4B Software, Iasi, Romania
E-mail: vladut.m@l4b-software.com

[cid:7b200dcc-c609-4121-9302-956d034fc458]

--_000_VI1PR0101MB2557DC78E7B6994F8429AE11F0B30VI1PR0101MB2557_
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
Hello,<br>
<br>
I am writing to you about the kdump. I am trying to run kdump on Debian 9 (=
Stretch), but the &quot;setup.sh&quot; has a small error as you can see bel=
ow, based on the error received:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>&nbsp; CC &nbsp; &nbsp; &nbsp;/root/Desktop/ltp/testcases/kdump/lib/l=
kdtm/lkdtm.mod.o<br>
</span>
<div>&nbsp; LD [M] &nbsp;/root/Desktop/ltp/testcases/kdump/lib/lkdtm/lkdtm.=
ko<br>
</div>
<div>make[3]: Leaving directory '/usr/src/linux-headers-4.9.0-9-amd64'<br>
</div>
<div>make[2]: Leaving directory '/root/Desktop/ltp/testcases/kdump/lib/lkdt=
m'<br>
</div>
<div>make[1]: Leaving directory '/root/Desktop/ltp/testcases/kdump/lib'<br>
</div>
<div>&#43; echo Modify Boot Loader.<br>
</div>
<div>Modify Boot Loader.<br>
</div>
<div>&#43; [ x86_64 =3D ppc64 ]<br>
</div>
<div>&#43; [ x86_64 =3D i686 ]<br>
</div>
<div>&#43; [ x86_64 =3D ia64 ]<br>
</div>
<div>&#43; args=3Dcrashkernel=3D256M@128M<br>
</div>
<div>&#43; [ -x /sbin/grubby ]<br>
</div>
<div>&#43; echo Warn: please make sure the following arguments are in Boot =
Loader:<br>
</div>
<div>Warn: please make sure the following arguments are in Boot Loader:<br>
</div>
<div>&#43; echo crashkernel=3D256M@128M<br>
</div>
<div>crashkernel=3D256M@128M<br>
</div>
<div>&#43; echo Hit any key when ready.<br>
</div>
<div>Hit any key when ready.<br>
</div>
<div>&#43; read<br>
</div>
<div>./setup.sh: 105: read: arg count<br>
</div>
<div>Makefile:2: recipe for target 'all' failed<br>
</div>
<div>make: *** [all] Error 2<br>
</div>
<span></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">In DEbian 9 there is no grubby tool and no way to ins=
tall it, so the /sbin/grubby will never be found and the error will always =
occur. Is there something I can do about this problem?</div>
<div><br>
</div>
<div>Thank you!</div>
<div><br>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Best regards, <br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Emanuel-Vladut Magas</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
L4B Software, Iasi, Romania</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
E-mail: vladut.m@l4b-software.com<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<img class=3D"EmojiInsert" style=3D"max-width:100%" data-outlook-trace=3D"F=
:1|T:1" src=3D"cid:7b200dcc-c609-4121-9302-956d034fc458"><br>
</div>
</div>
</body>
</html>

--_000_VI1PR0101MB2557DC78E7B6994F8429AE11F0B30VI1PR0101MB2557_--

--_004_VI1PR0101MB2557DC78E7B6994F8429AE11F0B30VI1PR0101MB2557_
Content-Type: image/png; name="Outlook-zupgpryx.png"
Content-Description: Outlook-zupgpryx.png
Content-Disposition: inline; filename="Outlook-zupgpryx.png"; size=13801;
	creation-date="Fri, 13 Sep 2019 13:18:28 GMT";
	modification-date="Fri, 13 Sep 2019 13:18:28 GMT"
Content-ID: <7b200dcc-c609-4121-9302-956d034fc458>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAMIAAAApCAYAAABnYvZwAAAABHNCSVQICAgIfAhkiAAAIABJREFU
eF7tnXmwpldd53/vcvet9zVLZyEbAQJZCIFAElAEQSgHVFBHFBXFKqusKf+gLMvSocaySilGLYtS
RBRk0YIEkF0lQBKWxCQQkpCtk+5Or7e7b9+++7vO5/N73tO5OmPV1GT8w5CTvPd9n+c5y++c8/2t
55yna90T/X59IiJ68xGtRyNmFrngd6xGrHUjmlsi+lM8H+e7zqfNs5WI2gK/+3yGuG7yIdWqr/zO
372IOmX8Lh+KUKi6rjV4TuOZx3o7g2/z8yzrtf7hwTVfmaAr80rPWEWDtHndo+Eaz/s8r61xb5lv
6q57Lb3Wa17qlYxuoY3fz6Zn3ggktgZJvJrKd4wAu8mI8U3RrE/zAMDMH7o/jhy+M4aaR2J0bC16
AL4PGPu16ej3JrieiDpga/Zb3F2JRm2Za0DUGyJPxQgJb3DYHzCEEKufYQJ5o8d1P/EoY3RhhE5t
ODoSWxOoFTP0auSjrZ6M0IfYBG8zcWsdfZ4n2L2m/eg3yd+g3nqWq0FXTUahvka9ld/WaeonBUNZ
d11CYRjrfDY9M0egVquB+wEDOP+D3353+pPRGHtObNs1BBqaD/F4LmZXvhH7T9wRvc6TMTq8FvUG
UBkaIfM48neECkYSaA2A0wie82nICAlWuY4GwVVCXXxxJ4VzvwKsw1yTCAApI1QM4j3zWw/58ruT
oD3DCGoGgC4zWC+tDPJXEj4BT6r3ZMZGNLrNShlBic9qdescMI+0ocF6aJg+ffJJH0bpD5gqK3o2
PaNG4N9jAjvZ7W6PjZunYnzm3Gh2MUkExMTMxtix+4Jo1rbEUGOFTAB9qBltJG4XqS2ATIK/Drgb
0RpId1EvmAu06+Q354AhBhyolK7uVsA0i3XBbwluGaAPaGWWBDy3+nBzDYCrmc6kSp1waUFoV+Ir
56GzBrNUGqHSCsl0qT1gBOhJmmDoHhohv2mn01iLLmaTT6Xs2e9n7jh0wZbzW747vW0xNrYlRsen
o7bSbfdH6oCvPRe91lw0h5Ww+AAtfIWmUr4yUYBsYrECsOYNsMlP3uZBBbSE9eB3gX6VQV0hwCtg
ZjmZxEwDJqk0QpX7zF+1TdZXUlVrxQhokWQE0kAjVH4M19mO2khzS01UMWxoFyZTj1blmvgR9ae0
VnXz2b/PmBFw3tenYibx3QMLK52ZmJjaFrWlTr8/DMab4kvHMe10wNHnU/zKCsLcL2DnZwLZFgow
/e1zChWm8LswSkpwPgl6xf2gXO9MI1YwqMPvwfMzjLa+ncHNf9VHTajSnnk1tYrfMWg7zTiZQL8C
hlC76FCbLxlO+p79/oEZB+EqVOpYEws9GAFA1TuYEW3NIe0FNEKHqNGEYKkAqMVdRXEwO/I/QeUz
PwLT59aMKTOQvuk09wRblUentLLpzZ8U8HcUxWBUiHSGaapLq0xLKMtXdAyeDL6aGT8q5VBsmWw2
BQEA7xP96td1/Hv8VzFqHx9B88j8IzK+EaZ8VtH07PczaByMTDqvFRireU6/1fnmCYGeGnnSsxQ/
9Sb2U12pSqYG370qY1XASEux1S2CLW5FAnXgrD6VbwBZgUhKP5rS9cxXGMaBlpgahgvsMcibBbw7
yPbUbVsrzGMOK618Eu9mdv5kjYOy2aydTKcYR5u/UpH+AX2Rgkb2nWjTgNkt8mx6ho7Av8KYIKlS
rwsCmsSM/FEDERlCxEHGgwVjghZYtSk9rC3dSACtdesx3KhCpVpRRj0bRnSq3KkgqC5Nf3kpo6I8
q8GNnXY3ms0SxbH+drTby9HFXW/UWKeg/ha3h6lOaa4iEai9ZKC1ij6jQAN7jfhV0kStFSMkqKv2
pKeKFlQRIWkQ+G0IxBIkpPpUvmyn4laL/W9pjSEZQTGaOlpaVGbfTN2BzKiuqr/2vYXbYh7G9z8s
SYv1256/h7D2pCfH3LHgfjGP1/fB35YrffgPI/A/ScUDOEdtud/GajYKtMQMzkVNO0kHsyfSkaYr
yNGxzQBpPFaw54fQGgLOx0Mpdhl0fguoMgllDKyp21lLBqin04rJ5UJdfgR4FcGvU7eOS6fbgNFY
4Ej2AbSt0zjvynlmLz/CedBoLrL5W2r8Lr5GeW5ek+2ISJ9jhvHpxQRtUSNVTrAeV0oMCvwfvwRZ
Ab799HebLo25ngcJq3SpixSYnJT2Kq3QXZ8/nSTIba+sC9mu99YzWslTBJDtyYzO0ShybD1TeM9U
+vADzxCD6aq1+8eR6a1YOP1YLJzci828AGTa0VpztCdiePKcmNl8IVbGdu6OASSdTUyMXovVOA2W
jOynBK7jHHvlp06d/VxvKMBH+q8didMnD8Ty8gmYqIWkbcYqWmioOR6tVRY16lOxZcd5iODxaM8e
ipPHD8bwWAvJBpPW1QqgIBcphjNcqg/QafBMTUEvajBHWU/QJqthGuWiHPcbwzMxPk50YHwX/dpI
Haxos+YQI/bp32eFldUVGLkJjVX4uAfXt+GAkeFKTdh39WlJ7U4bkNk21ILaUu5Mhqf5o9VuxfBQ
5VN1e12YeS3+5V/+JR544AHA32JeECmosKuuuiquuvKqkB5paQwQ73OT9/KzjvanSdp/wuJPzXvT
hbFOdy5OnXgkDj95F9g6hBO5CiP0CSJNx7kXvjymprZiR7G+QFeVz11ArlSvcaeS0TrIWOGUE5TN
NNQRt31CsDXzLsTawuMxe/jhOHlsb6wuH+PeMmYQbaiN6mMwwnBMTWyLLaOUmdoUaycfi2P7H4DB
0FL1Jcw3VrMFHY5NHUaoGf7E0W31TmQbdanLdYRR8vhbJuW6MUb/iArUJokX74jpqXNj48Zzo7Zp
D0ywmXwutj0ltv8tMMZGXXyzP/YcfgTzqtN9B/bG0aNHE3gbNmyIs846KybHJwE+6yj6WYDM36Vc
Fn6aqd1lpXxQZ6fXSQb46Ec/Gl/72tfi+9//ftKxsLCAdlqLX/u1d8bFl1zImGp2mioG0Cyskn3y
84OcHJPKfmVYq60G9R6StTOLZGWLxUgbEwWDCanbQXrDFeh4TYuRNDCUyLq5jmkHT7eGuZRGDuPa
TeMVwOJnVE7ocrROPR5H9t0Ls+2NXvtYTDSXAT/RHJimrY/CfqFGeyiGe4DbuP44hlhjlXsnsX3V
Bqepa4n29BFcOBuEP6mhWWfPEwzhwpsaoJb7i5R2lalUYzFwNekai9X5E9FaOBqrp5+MXV36tfsK
8EGbMKJJCZnf66Rkpwtjg3ylr1JX8D300EPx5JNPxokTJ1L6Dw8Px44dO+LKK6+MV7ziFXHhBRdm
PWuMW9EceeP/IamB1LSpidbaMTHuxrCIO267Iz70oQ/FP/zDP6Tm2bxxc1xwwQVx5MiRmJ2djW1b
tsX0xHSW87kawXrUEGW1VQ0yOaEp+oOa1mmEXIhikEYA7hBmUbM5F+OjXYJHw5gAALQPaNNkJ58M
pEQEYzrAGQ7lvmCoEgwBUzRygcoPq7ZzB2Lu6GMxP7s3WstPIjWXY3oMFxegt3vtWCOe39eUIErV
HAKxQwK4m1s8euxrGhm1wRpMoFxGeiMVU0LjuJuSKZT8/JcAVsjlQpofCGZP1BALJZpiXepbXV2K
Ewuz0Zg9HZvo0tCO7SiFCvqGfesyw4AhrL/ZGI5jx47FbV//etx8yy3x1VtvjaNcT4yPx/TMTCwt
qvVqsYaTcMvNn47X/MiPxNt/8RfjmquvzrKakU8ndVoIJUxIezc2KhPU47HHHoubP3FLfPpTMAGC
Z+u2bbGyvBz79z0Zx2GCqelpGAFTlgDFEF70Is9GYNYmv5cWlmNyairNveGhwaLi0yHwP3PZdUES
bBomClOm0UOSdk6DnVmkdgtHlSjRSjc2TgMm7YHcjzCYV4p4S9Q1UxuYuInH3ExblLq6mFenDsah
/Q8lA9S68zE+xITAbHXWKWrdJdko2o3N0aXMGhqobhvtSl0t83sF5qgbnkKqNQZbJepKeiR0ZQqh
HXozlRmUDACj5K5TzDF8ih6ftu1wf6g5Go0RmAEyV9ZqcXxtKdbmJ+OcnTdAa8UAWvsUHnyyU5kE
3fv+7M9i7xNPxJZNm+Li51wSXfyEVSTqru27MNsasQxDzKIhvvyFLydjNWHOa17ykqdtfQw3XQmH
6PTBoI1+3va12+NrX/kaNPTi/D3n55aBY4eOxtbt2+PySy+PHbt2xYXnXZiR8I9+7CNxz3e+g3xB
2OG5t2DYq1/84nj1D/1QyrXxiUrDnOnsD+QPPckeZgGA62P312qrSHecMdcUAHU7N94xMmy1GKC9
EnCJlQowOUdyiNuzu2x5dvNQH3Nmfn+cOPSdOPrkN3DeFlibW4VJkueiRd5mghXzC7Xt5tW+wHUB
rMfmPqJIdRzC5oj7lXQ+MX3Y96S9X2tsgQlwduubqQu7H/veOvvMeh9N1KfuHnWniYRvsXrqACFT
/QzMqiY29hC0AuA1FhDry4fpCH0mrw5zpRdkZPtWSfL/+Z73xs033xyPPPJIbN68Gf9iY8zNzcXp
06eJCI3FSYAloGQQTZODBw7EZz7zmdi+dWtcfOmlMYPd/rTSQNsK4GHaWzh1Ks2zxx9/PPacf34s
woAy5O7du+O//eZvxiuuvz4Z8qILL0ypr+n0pX/8RzZTdthKMMXcNvP7Da9/faXanxZxz4TCWg16
Cl0kzsgMk9kFMKsxXh9noRUTooV8BIwLSL5NhlQbmCTsw+jg5K4Q/58YmlEfaOXnvXG3PI8AsjYO
86EH4sihb8bS0v2xbdO+WCZa1Ecis26NPT0VLdYn5peOI003xfAiUp322rVF/JINAFYJzzc2ea1P
+LR/CvOMyA2h3BMLtdiw9bI47/lvpO0LoBkpr/8iE+Z5AxgBrugaGUEz1ClfO3BXnJy9N5aWH8L1
WIwRgJCr50jtPuA6uP/+2L1nZ4J/ZbWF+TGJw7lEgGBD7HviQHzilk/E/gP7Ywvmh2bGwtIKi4/D
celznxuvec1rkiE+ecvN8f2HH45rr3tJjCFhO9D+xS9/OV7z+tfFy69/Oc565Wckf6Xmqr69n6bP
6Eja70aE+mjAkTFjnv5P3G1lNYZGiHq5UEC5wzjo993/vZiGwU4vEuGj3NLKcvzSL/1S/Jc3vymm
Jqdi97nnJFs/uvexzF/DQ96146zMv7C0FM+/4gXJvLK6GrQGs52EeaYxqTSfWkSihok8tWEw+1xM
Rc1AI1Lm6RnHJXXQStLfbSPEBBTaOv0Q+uH99f3Vz5LeNCfo3+oawlFTGiFn+TqS0nGwn4unF2Jy
GkeffNa3urwSUzOcGeDacbN+fR3NXn2dEeLEhW6/9YlcKDPZD813r6W7nlaLtCOQ0bgGPKqcDEm1
FdrhkUgy0mCP6Eu1gc5iREP460aFZi4gqCpwvujcCCDNMGnvVPSPPI4muCeWT30fQO6N5ugs5xsw
SbpjMX8q2Pa6Pbbv2BT1U2NM4CJAJ2yK7V6vYS4pxd1ukYdttPppK1d9DY+OcT3OpG3l+mz01x4Y
dwSGVBsp/fUd9Az0eSr/pd5fiK076ChO5lzrJIwBIHMt2whXNaBqKbWh15Vv0YMJJvAlVuLWW7+S
kaEO0nT3rrPj5MmTcQqJ/JM/+ZPxq7/6jrj0ssvi9MLpuOzy58Yf/dEfxf79+xPMaorjJ0+k1H4J
5pEDrSPuZJQwcw4zEzk6/lTESqdbDWkbU0htJ/PM82ru4tjx2SpaBdWjTL40nXvuuXHl1VdlGZPt
qA0OHz6MadhJ8LYAk2HfXWftjnPOgVHouKFX7SdBtAltV1Lx+YagZz2DTEw+5VgLJkGVYCcJZgHp
8Ms8PS0DE/203VWEjvVKMxDN+9JVAhTN4aEUKtI9jv81MVW1pbNvfUMzMCj1W4/jZD1V6mU/7EMJ
DcvEmpL6Txnqtp2BZi3tWdb2Nm3eCkOICwiqNqcJc9EgyOUPfhubJxwZmCt9zBhqowt2XJASw2Ec
x2t0zOy1+egce5wQ7Ldj4cR9XD+JJFshvOlYy9l7MI+2xq4NV8bkhhkiOI04vvgQHA2QcZyFcG4H
SZPL1WIAbDSp0QEcVNJh+HDMWSnguWvKmCSadDCKndPfcCuFT3St098A+EOTO3HOt8Y8mq/XKVvE
yUt3W/wxxLrKmsnIyGhlg2f9tVhdacXtt9/Bmsdy5j116nQumL3qVTc9xQTz80jmmXjZy14Wn/jE
J+LrONSaTk7SAUykb37zm/FzP/dzOUEptZiQAjLBLoiN8MxTz86dO+Piiy/OSTYMalpCeltOYFjW
tG/fvgSD4JBBZSaB7cd2VljFM78AuP/++5MZCwB9bnTLPtl+Aoy4oWC3fust4WBBJCPKIKcwBWVQ
67V+GU4myfYxMaVfOrzvt8B0ThwHf0/CQMkctG+07fjx4wl480ubfbffaiTzW4fl7b802KZ1GaUr
46uAcizGx0ayHgMX0rg+OQYHDx7MsbAO0zY0+25C3abC/PajYgTgI7jOpDT8B1LfqAxgd8+OwZgM
1gCo9FnBsPwRhF67c9+HCb4Vp07fw73DmAiYMzxbYqFseWUyNm+4OJ6z59qo77ycZYVjsTyPiuX4
p+ZLtQ+ptK5qdK3bD8DBP+myAbDPqrMbA4eQcG4KrDeXcLwbdB5CGMweznYKdcrprNY9FEHkS82l
1qmzeJZ+gFrO7sm9rjsQXtW1rdNWE9PPQRsawjyksqNHZ1loXIoLsbdPnjyVk3Q10aDnPOc5SWwZ
/E34B7twUJ1UASZgnFhj+trwAqFIMIH5pS99KWP/SuwSgtXGt95rr702fvzHfzyBY3vWLdD+8i//
Mn0DQTSB+WVblrdeAfGHf/iH2aYTrUay7B133JGAKiCUZv0b65IhXvCCF8SJ48fiW9/6VtYpkC66
6KJ461vfmpEo0yOYfH/xF3+RTCJ4Zbif/dmfjc1btqT5dODAwXjf+95XhWwpI0DVUD/zMz8Te/bs
ybal+atf/Wp8GXPRPhiFky6Z7/X4Krb5I0TbrLswpP1y/AwRO2aOoTRcfvnlOU4KHgXNE48/Fj/9
0z8dv/3bvx1b8MtMmnB333133HPPPfG5z30uBY7SX0Y7H7/KOm666aa47qUvzfypQfNXGj1VEiwZ
PcnjkUgd9xsNFqh0ShNgPodv6uKsfRQmuDsOHfoSIGBBrskJt3EW21CNSx0k7/DGmBx9Ds4cTLDl
hRRAO7CA18EvqOMce8CnWo3G6LLqJAnfA+Zz24W09FjP8BCPUG4SjYq+Z6rnKA/AG1XnZYJM/Mj1
vLwBgWsQuoItaH+w7es8RMfwmzpZPxgdn0rmgK15xtFRFqr83Uc9LS3CcAxStSYB/w1UbdttI5qH
TKYSS4n0Yz/2Y+ksO3kCUtDIQF47iUpDne5PfepT8e1vfzsBY93mtQ5BfSuh2X/6p3/KiROMMoFJ
5pR5vvCFL8R2IkOWsazSUeDYxhe/+MVsU0Y1vKrkFUzm8blAEJRKWZ15AeHHNnWoZV6B9mIiSj9E
RKkwwj/iaP/5n/959lFA+1xGTX+C9m677bb48Ic/nAxvW7b9lre8JX+bBKuLfvZbTWTAwfGwTyaB
bt0uCL797W+P5+J7qREcL5lWJlS7boHxlOoysIx277335vUq/pH5Z9AIpmOM69/8zd/E3/3d3yUz
OCfSpmZVOMiECgjHR1ouvuSyHKcBI2QdpMIAlUaQT3LHqgY0t/Rx6g1vGCGiaPdUrBy8la0Qt8Xc
6TvBz4H0B/rkWVwjpLg2FtvRADu3XR9DW14Mq+LsaGfgvLHWA4E4s4CybJ9WVPcwvzTANFnUCu0u
9dm8tid+QF0mWDkkKjEyYQr2I3WNJuVLBaojnnARzynUXYzu0XtiYf5h2mEBLYiwtFdiRYcJJ8ko
zPSGLQQGtN2rPlcmiK6mjv0okzadIFViDrMj8Pbbb48bb3pFXHX1lZgMJwk/ziQwb7jhhpRq61Pa
rgOTRvD9wR/8QU64E+BKtAygtBeEgkpJ7qQLPJ/98i//cgLYiJX+hzQ44U6soJIpBLlMIRikw7qK
6aOk9bnJuk2WddFNM+yFL3xh3HH71xNkglOgywzWZToIWL73ve+lALAtaRGg1qVEF4hKeduTaWU0
gfqjP/qjSeddd90Vv//7vx/33Xdf0qHWs1/FvLPOYkbKKFuR6DKC96z/0CHmmSSjSJ/9E9CaO7Zl
/qNHDqUp6fgdpV8y3V//9V+npnWB0z45B+lvUa/JsZT5nZ///u7/kXMxYATtnXWfNIv8GAXwryDT
xvICj9d1Aoz/xcPfiROzn2Mx524Y5DBbhIxzNJGk2LNDu2PT1ktjx9kvj5GJ5wPKcwZSeo5qCJUO
ncKEYt0iF8RUBdr7XA4UTheGUEMYATISNMQuVdc3XJPoHr2XPUq8UGB4IpbwAzp53rPaoVqjUANG
GMJ8U3sszj1GNOEAbR1EQazFMgtyrToAn5mITdvOpll8HJz9ThvK03OuhmRqaob9OtfEgw8+hMnQ
SvD20BZf+cpXYuOmmfQTlL691JxUAxgFTPor0Jz2Nx+T5sDf//3f5wQUie4ElckRJIJPMAmyJ554
Iv75n/85o1Jnn312SjGlo2CwjTKx3i+2uRJYkKhNpNW6vZYWy3ktYAWNZpxMoikkYMxnvQLN9gWe
SSZQI1jWJJMV/8PIkYB+9NFHU/rbjvQIZLWGSbNE6Wt9MlthStu3rTJOtikdju2b3/zm1FSOo9pF
zWGb5rXffluPNKtV7YMmlc6w2klNcP/9D9LmRI6F9aqZ7Z9Cp5hHmrDmv/POO9czggAYgCCBUAwN
JtTQaUZzNEe8P8sXmgBpuH/f13BgH+TeIcKOSKQRQnqniQYtTsfmndfEeRe8KpqTLD61NsBCLNzo
7+lozK/hO5xmZZPozhrSl12t9TPnH/RVyOOaAusCPbRAo8EGP3awtgjTLsMIx4724tQSu5SIDvWa
OHh8khHUCjBCDSaos2WjYVSDsvW6zhbVjk6xTQFw9rcCuqtj287ruDlWAZbFjD6D3MUPcfBHccLc
LvHpT386pYpOrZOnFPr85z/PAH4rNcBb3vpfU/L4rKTitMkcgk9zx0m2XifCugSP9rFlfabZ40QV
UKkFNKFkHMH1O7/zO+l/KO2UlIJJUAiCK664Ih1225MJlNSaJH/yJ3+S9NquZW37TW96UwJDO9m2
ij9jGem2H0pXI0ICRVNKian0tB4/SmQZSpBLp0AXmGosNWMxXTQFrVNGFLxqI9s31CuT/d7v/V7e
l9mlzy0sakxpti41sXTZJ5N1eS0Nxdycmtya5ecA/Uc+8pEE9qWXXpwO+IMPPphRu5/4iZ/IefjY
xz6WwkjN4Fip4aTDedTsTvAokY221JDEMKM3eeT2abz4pcNRM4abm+32xuG9d8exJw5htx8HzIts
N5iBuEacOGoI66I476zrY+eeG9jpeSGgIwxGfZretE1vdHD19LfHycNPEOmECVADht/qALvbYUsH
7QyPAPQuap+w6ugI6xc9tn8QYWq3FxmMg9joRJSIGCHnqJzVY8Auk9Wx32r4Ao0aodYeG+YYtCam
U2sZB3JpIiY2Xx4XnQttm5RaO/hU0oZwdiY3tTUwm3BJ4sYbb0g1r9qenT3K4LptodpdKkA+/vGP
xydv/kz8JgtZb3zjG3PwBYRgEjh+a+oIXgGn5FNqan781m/9Vko/wXg9i2DWqwSV6YrJI9BkFoHr
x6jU+9///pxEmUDwyBC//uu/Huedd17VAf5Km8+VqrZlu9b/ohe9iM14v5YgVpNImwApZpU062zv
woTZN9BKSlL7JP1qOJlVQLoiLT2W8Zl12q7awHzSLpD9bfRKaS7z/SLbT573vOflWOnwfve7301A
2ifrUUhoVlmvzq60CVzpUMLbxk/91E/FZYSuZZC11eV4NUD+4F/9VZpi1q0W8LdM8J73vCeFhYxl
+/bfMVYoWLcazT6dMY3SIQQNuSU5FQID6dYGIim1UaU0ZkwH7/vEd7G5H2CgT7IYwkY4NsktLK5C
+FhMjJ4FN18XG3a9jI3+52NRjeUbIjzt0HTDkmBj9bmGpM8t04KVb/cPdbmXr4rJw/i+lIsdp9j0
Xex8QZ4r35CWUSqryeVkrB20SQPA91jQy+3gKrDB2zCMRnkg28mwf+32KGZcAzOjE5u0mUcmCf+5
/7Xa22S9agWFgZOtSfAbv/EbOVEf//hHUxULXNV8F5qdFCfwj//4jzPyorMnqB3g4h/cijPqwBcp
ZP7rrrsuAVOcYYEvoJVyJYTpxAtSQSj9AllTQVpMAt26BK4AMllGaV7sa+n3d2FeJ7/4LNJoeZlE
KVuNEXumAKBJ57uA0uui5Yqd/RgAEkTWkfY5Y2Pf1U6mV73qVUmPPoN1F2bS7PHasZORrdc6TPaj
9MUxs6+Oh2ah347Xz//8z6fvpBaoTDZMdLSKQkQGsI9lXF7+8penADHUa5IZnD81k3ksL3NZd8UI
gGpd8DQLmWrpxTIw2OfImZg78lAcPnJ3tJaU5EwQ94dZCGljToxxeGfH9vNjcvdFWBuYQfkmvHkY
yReCWV7bhFa41++x5YGYvNupm5xF6FJ3nmHIFwfABLxpr87H9ys18Seq+5gsaK428dsOUZ5VTDmO
WGNSEaPGJOo2YBjWIzSlkhk0t6ipDp063BnhGmrjwD8aq0egqDEeW3dfzT6dGTSNEQeY0wkhOtDD
odcGNm3ZuhHp/S4k0CXxgQ+8P9Xtlq2bkFpVDNzB1KZ3sgSRDqGT7YQoaVTVpmITC0oZQXOnJCdF
6VY0ieAVIAWUAsp77notgPJaUJa2rKuA1d+aGAJU+qzHb0FZGME8AlKzRpqsrzDOCUCoSShgBJ/l
zWOSRhnUiIyMKfNKh89vuOGGZGiTPoi0qQFl9Aq0rsecSoDv3cvZF7SEfZcpTYJUs8hkVMe8ti9z
+Nu8trFnz57MUzF+PRnSdjThMpIEsM1z0003ZRlXlr0v6IsJa5/M532JDAtUAAAVlElEQVT7PlhQ
09mUFZCGgD9XuXmoRuhSSW5h6CzE3PEn4/SpQzE+TGx8rDr522KHY4NdlpNjcPMoIn/xML1djjUP
xeA3rDZmkd7Y+ByEGcL/aPIaydWFJ1jtnUsNkHuEFO0Ctr0Q83P7Y5pdqSsLh2A03qYHI7rC3MUB
7rJlutbcHOMcFhpqMoErwzHT3ZJ82iVvj0M6XbaC5AvC7AtlF08fZF8R26VhsCbbyxs46MvLD8fh
A9xhJ+q5l7yOfhuuo51cNORYKVpieARmYftAAgiTyFi1kZZPf/qW+OznPsNEHUrQuy3D+0o4HdwP
fvCDaSoJME0P7WklkZPuxDkBKaUAoRPhR7NiPfAFcEk5D3wEmvH0wgAyhJPshJeIUCnjMxlB2ov0
FazSa5mi7SwnbUWLWN58OveWL6Av9PgtHTrJD7O+IIhcmfVbOl5KXF5NZZ8Er7QqELTddbqV8vo3
alSTJpN9N780yQiFkWQEGdH7jp0fTaayhmMZae0Shi/jLEOVgICMYejVIIX0SbvMZPvWab/LWDoO
HkaAJCSCm9JSQ3mNSPUv5kQya4ZvsM+ZxDrScoIY+jhapN1ihymLXR7UqcfRmD3+AC+/YBFqGe+C
EOrwdD/m24DeF2gheUc5mzxOtKepedQl1Frn1FqbiXEfE0BcWz0RRw8/guPDDth4Asah7tZStHNv
iscsN/Missti69kv4pDZObgsOFHLu6ENMwdGMBqV7znKbdg4JexfWjpyD871Pew1uh9mbMfUiJpo
Hsn6UMzN1uLci3CYORm3vLLE3nz9IH0Ee18JBRnDpOS76ZU3suB1TfzwD/9wTu43vvGN3LrgMwfV
idAxft3rXpdOsJPlhAgOJ0MQmrcAwWvLmZSSTqIT7j2ZRiA7aV4LorL2UPI7uUrBkszvPTWRQLKc
96TLdmUE03pGML9tCnCZVCbSJypAsw7teTWeeazbGL5aUABZl7QpfS9lk6F9kglkFsHv4p0SW+CZ
BLcOqxpQIBdms26BXsbG8tKzXhtJh9rFVCS79ElbGTvbl6E06zTvfO7Y2v8ijIrmc4yl1TIwgjah
HxeSKhVs4XKwxZXXXFBrjMQoTugq30rXPotK7bUWe98BEVK+zbbmRTbXNTnC2SAC1OV02gqDNjzO
i8NcO+iw/N6exozChgOQI4152kAjDE2kgwqXEBLtsLnqBAyxwCCxQss9eIH8rDJzsKZbm2Ghjvj7
JGZFjUkdYcGp7kuKpQ+tlRvv5GZNMLXc6ZjYszGmmdz5hScB4yHOKBMR4gUFDbXO2jRabn/MbNsJ
DXK8DFQDDCtMMj4Mfs0qDDLKOQB/nzwxhwTcGK/FgVaqu7/oc1/4/BmbswBA8KshBKNREcezSHAj
KsUOdkLKQpCTJRgEjN9+lKZKdPMJjPWMIgD1DzR3TAXc/lYLCbhy3/Y1MQrTyJimAgh/CwoZRolZ
mEiatfntqyvDMo39MtIi+AQWbwNKQLsiXvwH6TSM+YEPfCCZxHKCU7psx3LSa9+8Lv6O2kHAmkro
1PExj5+M91OXv2VUf7tAqoCQ9uJky6wykG3YrvXLOJaTRp9JYwlM+JyaZAAdUTVCZR6lV8tagie+
eBEeuOIam3p0iAMdxEB7gLMzsPHr7EMaJQzaB3h91hbwGOgojSK/lzmPPD7qcU72AK0RO3WFWHMD
AkeV2jjiXTRSC9umOczuIjrTh9gue3/qHAgaBrB9VoCbvH91hbcWd7obYq29iR2b2ziDfDZrCJQZ
Opn0a8ESCadVHUe2S/AZsYNs126O78Tm34i2OoJ/gdT1zRkwbItNgqfnjsTGbf0YY3JkoIcefgD7
997YspkIEHR0WJhTEj33suclE6wsVxMgOH73d3837n/wgVTNSjgHWgA6EQ64zpuaoEhDf5dFJIGu
JDIJONW25Z3cosr3YG4Uyad/4OQLaifd+zKVzGBy0kt9Stxid1vG+zJCYZosMCgjM5hHGmU8mUD6
C3BuwCY36qLZZ51+BJ40m+yHC3OuqZgE2C0cYDJUKfNqNjoORpCM6Kgt1RxqVEO8grIIBPviuCk8
7EPRaNIn01i+jEdhGOdM6a/w8Zn3HUt/y1gKGOuxfJkLx9jntn3NNddkGQx5pKlHFXE6ewDOMwFd
D7jIGGiKNV/96Mu+hjZB8DRhzO2YO0gBnjcB6uEjJ5MTxwlnrmAmtFYAn3yDE9ypbYrloyeQ4pgj
RHbq2PhNIknDmFw1wqVNFsJW2pg+aIw+DNFH4/TZWIfvHSstD/xw/AZp32dZuZfeLs4fZovlNGFq
AL3Pb08+ux3E1zT5gl82LuQRimZqBzbeccJrYpqNfpxbNpLk1g5PxdmC4EsNwpNjx4/GZz/72fjw
hz4KM0+gmYjcLLXita99LSHKHeHuSwe06Sk6xmh8YjQnWsex+AFFKzj4qvmilgWjA6+EcuCtxySA
BV5hBPMJNs0OAVgArX9QFpK8Zz6ZT/CWegSUHyVdqUcQec82i/aRNlNhRkEtXQJHRiihRcupEWQi
65HWwiCWV5KqIdyz5FYGk/1wDA0qCFw1jG3bl3e9610hY5k0maTTtgqASxRNwFqP7dtX27EOI0VF
swpmfx/Y/0TOoULBMXWMvHavk59Cs+ULLc6D187NNO/8dc7wfpCEDc63jl/OTr5H6NjdSFveLDFJ
nPrEQaT0VCwcejimztkSWy6+NoY3nBWHZrHfCGs2iPVv3Mo3OOqiGYbHU1/QTQBIVAfLE4ieYB85
3AegOiyeTY7sjMWlA3G0dSo2TnK2YW45D5gvtTn2SJx/cmI3K7csCnWQ/qvYuZxqa+G8ttiq7dnl
oaF90LuXNlgTqKP2aAGFlxqg7hu7YaSGzj2SP2rHKXMY5mR7NM55nY15tTrOWe77R7I2N0SLb5Qz
IF3heONOwD0d9z/wSGzftpsJIq597EQcgZlPzXPYCPzYHiKG9ntx5NhhbOW9OZBOmsBykJVsArFI
oBJmVRsYudA0MCk9lYAuJJVtHAVw2vPW47WT5reTLPgFhsyjprJd03qHWbNCCelzQS8dgqiAuJSx
nBt7R0bH8aE4Okt4fIItJQ0EkqC58cYb45oXvyQd45kNm3JrxjBv/ZCWVba2S4dRHhfzillku+YX
lJpPBg2k4R3veEfG9QW2dcvYjoP5BKT5zjvvvOzLdzhRZ/9KnxxL63dM7EPRmJbVWZ8/7XFZVpRW
1tB6u3I8t/N9+fNekBra8XNeduzcfUYA2eZFF1+a7ZmqBTUA1Bgi+jK6jcP6I7HUgghMlYkppHBb
afUoAJqMyU0XxDQ26fTusymKlsiP/oXA0BnSy1RlKond24K0Zb2hcsgZ8Xzf6KbYcOS+eHj/o7HQ
eSKmJyfQAsjp1mjMTJ4d5198TcSG7XFq31A8spddiji/jEM0MLGarDWMjbDFo3GEurGNkeyekmD5
rGq/Rv1uSpKGmltBZqM/h6PMdu+1tYPk4k0YSPOUsjCqcSXfPIFuIqJkeNcBH0dybmSyMbQICkxN
TbPoA71M7hUvvHxgfrDAxzrCnXey5Rxwqg0caE0AB11N4OT7cQKdMCdQk0IQKAnLNgMnWQmqGWFZ
65JBdLY1OYqpoHMq8GxHiSdIDMEqxU1OuO0U36SsxipZ1QTFLFKSFi0jA/vcVOLv0iydlnGLhzQV
wEqXbdumwBWsgteFupJcDVcg2D/psV/+VmMUAWBUynErvpD5ZKjizNsX+yHgpdG8Ple6mwojS6u/
1SSWkSbNJPPJtCbpNymAFAwu4GnKulBqG8Vsdf8x+MXB5U1XUxs3cYJpEjv4MKDpxBSvMlkiCjR/
Etv3NIsVHLbZuB2puZG9KMPIRiamMTivEPxjIhVDII3dpuF98cZO09o4DKUFMorHD1iHYbh6d5Jz
vrWYctUT6bJGpGnct22xZB4w3VCuBuNvuFaBI6xL4dvyTsw+htPtieAlfBAWaoaPpzln+/orvhq+
QUi24fuZ6rymZv77MMI+fJ1ZJsI39fkeIxcOfW8q25w3T/PtncpcMDznquX37nt4YO6M5uDqLL7g
iueh4s9iAXGRbdRfzRVjbdkNSEsB7cQ44U6814JELeCkOCGCUEmkbWyM3Tyf/OQnczHICZVZBKbA
kBGsT+C7jcE6nPACguJs5iyTLFvKyzQ+F0DeEyC2VXwZwSXIZLKywKWZIcjN6zNXYXWArcePjGIf
ZCJpsG6Z+ld+5VcSYNIp0IsGsg8KBvuvZpMOk6aXq84ysgJDIMosxTwzj4wiMzqW1icDaqKV0Kp1
SYf3pUUGKsEFtZXXAt6NdS6qSbtjr5/jxkf7d8kll6Q5VVLT8wUu+gZx+Q2b96AiL+Bg+xyZeQkX
gPLAeHOYcCeveTk9N0vk5F58ZwYDnDd4C4LRnDxR1tVJpbJ8nQqM4D81lakittcZ4mjmZbHxfLbn
eiKImL1bH3ocuGkSiRriDRbmiXmk+Qbi5i2k6RA2PWFVO1EjhGqodnF+gTUGTC62WqzhsHeGDtEs
2ysGjGAEyR2t+jcNTKlmk+V7mGJmHFONo6f6Ki3WJBqsa4wMT8P8u2OZ45IN6h/BJNApVoU/+EC1
ijs6ylZtAKNzd/sdX8cpvBK/aQn1fW9KGYHjZPjbAXd1VQYw6RQ64EZZnDgnXwAZbfI8gna5+4wE
uRERNYWM4n4cJVaRoDKH0tc6lHwCWQlvGSde+grQ/BaE5hNoglvwaZMbU3ffzTvf+c7ML8isy7pt
S2Yp5o4hYgWC96TT/LZlfkErCO2f5pN0OUcm/QXzWaeaQ4DKgO9973uTKWRStYZ5bL8ECDTdCtCl
3XZ9Jmhtq0SMbLvQXqT585///GQ258C5cDxc6bffChSvFWYyR1l9/tM//dN497vffYbuJvvTSBoX
0zE6wT+js42zAsu8+e7kIziKOBNjWN+YE5olbc4juwhl7Ly26uEXwl9uVtPkQRonIxiOJeLUx/n2
usamt45rBfgiPTa7he8pYsvGGNK5x8EZneEmZw9GWatoNtA0ANUDNU3+bbWxUc5Fs8fIExLDeODD
OCMdfIWeq8+sJA8b2VJbaLfnhjt9E5olpJby3fMK7C51iX2I8r7adQkt1O+wnXlqN+r/MjKxEMgu
1mQdfIcNMxtyneCO278dd915L5O3IyWekTAn9DgHWWQEo2TnnXc+9NUY5BMJPN8upzlRVkdlEuty
85oMoLkiMwgGY9wmrwW1zwWh4HIvTYmXm8fFLZlEQAoswSHI/u1Ksfa5zCgdTrrgLsykhNV2duuD
ScAoxQWZoLRur5XO9ldw2ZY0FUkvCAWctr9Af8Mb3pCh1WKimF+a1Kr2WYkuOC3neQqZSKbX7BLE
0iBdjkvxfRwbx9L+FaaXoa1TOtY7y9kRkk75K1/5ytSuRVNKp6aPZqd9sJxjI01qWAWQzHHGNKr+
dRsAE8TogcPUzIuYBEDX3xjLCzqZp4jts/OUg+9GiYYgZpRXMsqtqxycrw9xHlnTxE8mNuklc7n3
RxfELQ/caLJ+gDmV/gL29bKTwBvZGpxN6LPAdppo09QwYGbLBg2ky724xPlUNIVmWv5jHrwUrM1b
83poiRpv36hjZtW7LJH7XOZz7YDV6irZFlGNVeLVaB3NtRbM221xrG9yd2ze+rxonHUFTE/odtwI
UjPmFjiyuGkibrzhxnjibS5IfSgefuhRBu7hlFZO+hH2v0+MT8XY+Eg6fCvLawB/e+5gdB+M5oSp
2J+GC90A5oQU08S6BLPglxGU+DrLHojxUMsNN9yQoFTKChbBYX0CQukmuFT/RfMIQLWAktnnlndf
vtsYnHwnW6Y0z/oFONsoUayyjmEd7oOyjsJElhOYSmnbKiaUW0VKJMr+KKnN9wu/8Au5aiwzas7Z
vvXLdNYl6GUAQWt5nzkG1u+Y6OzLBOaTMaVZOu1bScVfsg4Fz9ve9ras08U+mc0xduxsT8a2fsv7
zDH33Hnpn3U2PXgjcHvY5SgVRMV0bGDAx5vnYobsZZPdwwCIt8OtnmSRrHqjHG8KzoWUPq9tcVOc
odY8dC98faUK3zqiKZ75khE88+w/HOiBHgG5zHuTWgB5xe3TLGa1WFNYa7BNAjPHbRUtVqY7ZJ/C
mfYfLexxQN9JcnOd/xHTImBKyJc4vzBWG8g8tqlSUCv0aatbcyndI59TdHyGIMBO1gguIFB2Mf7I
2Zzdcc1Bta6ZUGkxNZmnsLbwtriP/O3HUno4OVPTE0yUe9pxaidhRCZOW/qlL70+B7bsw3dyiqkg
AD1t5rU2q3a1EyCwnaTifFqP+dzK4QTaVyWtE6g6N68LUjkGg2iNwFLKes9UtIixcXe2eohIqSe4
lPqCTtrULjKVTCJzek9mE7R79uzJNQFBU8wQ81hemgWo9SgUNGdKMq8As85Xv/rVGVz4INtNbFvm
KUxt3Y6JfbLv1qkmK2sT9tdrGctnjoV0SaP3bMPk2FtnYQ61oDtb9bf82G6JRgl+r2VSNYJhVfPa
p5Jqy61+n7YyBOp2I+onKeE9CXYg2os4XrwKcmWN00sr1Yqdp7d8ce/wCLZ8hxCl2gCJmwzBtgn3
+qS5RGrwNmtt8rXV8di97aqY3H49JzUJse37LGbNId7WuED4jo1crE00hs5iC/erYnhmZyzM6iB+
j3DrIo4yq9BsnKuxJbvfOEn9btHjXaysNNdZ3fYfJKQl7vldMYQb79R2MmQD02d0dBMfFmwmmLyx
neRzox2DKoNyAm+F0NsUp82s5zThuOnpKhqzf9+hdN7uvueulGjujTp16mROiBvLrr32upRY6yMe
gtOJEhxOnsBx0mUoT3QpiWUIY+smfRJVuyBy4p0gy/vbOspZBuvynmA0ZCloiyaQOXxWQC7TaH5p
Vgko29dfMYwpfSbrEyQ6r4JVCWx9OqaaOIUZLat0t06BKpB1nDWz1ptP1mlezSbr8qSdmkFAKtHV
DO4cFby33nrrGUYrmkm/SImuBnVM7bu0ywhq2uL0W59jVZL57L/1ylD22yCGzCazqLkVDmpQ50w/
pjj3pQ7+7T5FO5flU4nVlOS+ICuIvOQWbF8bn6FRRbymBkBPQSQTWAip6u7RfBepYS5Dmt73ZJuI
hPDubvJeyDX5GvfhIxzCvCEf2fPNMnWiLYGkBpz5ihZ2qUbdrQI6w3zpFDe4J209nG79En2D9BG4
6f0zH4iTL6SRdzVV4V19EKJbHa65n/zjjr3c9Wryhv2rGMo7SmVTF8fcAW+75RVilOqV00YYlknw
Y14BXMpYLoeXj/ereirJpoTznuAoz3xuPSbr8FPAmDcHqdS5vt71z9f/lqkEp20IFJnFZDvr2/33
yv/f3i80mb/Q7m8BJ7P43PZlNJPX/z/S+rFe3yf7LKObbNNP6Xtpe33Z/wWPm4aAx94C3wAAAABJ
RU5ErkJggg==

--_004_VI1PR0101MB2557DC78E7B6994F8429AE11F0B30VI1PR0101MB2557_--

--===============0564963676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0564963676==--
