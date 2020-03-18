Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DDB189790
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 10:05:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A2DF3C551F
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 10:05:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B61F53C5510
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 10:05:30 +0100 (CET)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380119.outbound.protection.outlook.com [40.107.138.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 07DEA6005F2
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 10:05:28 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5U21PYHit4pOz3qiZ04vYQjKA0/9jSl/ljdBzBRiLloa/OH5LOVLWka0WO1LQzK0JY0YW1KS27Q5oqG87w0IP78bjIW8y+XJBsmvjAcdAlJ3w/OyKl/fm57EM9sQVJJ2lSnQKdo+u9xy9zddxcXf8hH/IG+IYgvigQuzpfmsy7nOppA+onXe5dtnkmr8QPWB7FyqGYWheam+iG66f8PBJXwHpMR4o9atv/q9dM5FrObAG0WmSTOOSN8UBsXOzk9rZqQ5tK/ALMGrLG7qvo62qzXHFeQNhDEosUstK4Rzz30Ekqi68fKnBPBmF2PfTqIOKznc3JVaWz4dLgBEJIAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6tQZOogwrHBYsdktTNXrYggED11ak/od4ijuqg6B20=;
 b=Kw17cEQoKuByFwAP1uhRtIzLF3T1Dr4Sv359hpQ02OSR45LWhYnJ6YC4xSFAlJ50zvd5HIGzYzWgz4DCu71PuONjbCpawDVJVY4bMnm4TDcBzDVHouucriFTIxnpdh0wK758Zn8CyO9340Xw2sKu04JUUiXAPCeUmbNbMX0TZ6DMmgN9Pzk4v5N8fPEzo8ClklAybenoep896Q9ZVA10/5U+S3VWbG911p99tad95Y0Yp5t3PnOfjPCHgbBzhWF0rbX4cI4LvWCJFDBW/R8+FxifJwFbj6ZvUYece5JB4oXrapJ0Es0QfqTY07w1hZ5iuvk50t+b8svfWmyAUsitOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6tQZOogwrHBYsdktTNXrYggED11ak/od4ijuqg6B20=;
 b=fJrFGZgQqCCRvfN35TVFJZaS+QnU/K3CdUdKbiYdPQ5GZPOJHlhKBIMSATJq/5XFAE7mzYcoUn6636dWlHINkkdJpJFMCOQa5H2zdH/6uhRKllZk5R0R7GwahyNRRq3M0nunlKbYezMbOFUrKCeDVN8Xqdvs0TVsAuIVQT60YRE=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1402.INDPRD01.PROD.OUTLOOK.COM (52.134.129.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.22; Wed, 18 Mar 2020 09:05:26 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2814.021; Wed, 18 Mar
 2020 09:05:26 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Cixi Geng <gengcixi@gmail.com>
Thread-Topic: [LTP] LTP build failure
Thread-Index: AQHV/PbMSDJiDYW6Gk+7EdwA4FqBrqhOBd+AgAAHz+6AAAB5Aw==
Date: Wed, 18 Mar 2020 09:05:26 +0000
Message-ID: <MAXPR0101MB1468457E110C4026E1EEA9C9EEF70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB1468D80C07532533C7698F85EEF70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>,
 <CAF12kFvy41q24NOqrAbZe-2h6-q0B_0ifzDAyr3RPoVxeA5BQw@mail.gmail.com>,
 <MAXPR0101MB1468ACD2C1D67F06BB109198EEF70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR0101MB1468ACD2C1D67F06BB109198EEF70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [2405:204:97a6:35aa:a0ec:5a62:9224:bd56]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4efbf1f8-6d3f-41d2-b50a-08d7cb1b7fee
x-ms-traffictypediagnostic: MAXPR0101MB1402:
x-microsoft-antispam-prvs: <MAXPR0101MB140226313C594C071D2D8E4BEEF70@MAXPR0101MB1402.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03468CBA43
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39830400003)(376002)(366004)(136003)(279900001)(629001)(199004)(4326008)(5660300002)(52536014)(71200400001)(2906002)(6916009)(7696005)(53546011)(186003)(9686003)(55016002)(6506007)(316002)(64756008)(66446008)(66476007)(66946007)(19627405001)(76116006)(91956017)(86362001)(66556008)(8676002)(81156014)(81166006)(8936002)(2940100002)(966005)(508600001)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1402;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lKCYVy/zqGa2O9WsaBv2X4YtmamZ7uRDAt8eJxNUmuQSm9Lz8CvvFsyYfgUTZpwxndH9vWSuIUyMnFtALTvNLGz3WKIHX7Fpu/A2xif3BE+aOdHe9Bw94BIy3exf8BFsGsZCPn8YZXuFatoQugG0eOsKdSDU8RpQMQiGqvvQ/wCqHfInRfzclW6e04Mnck/exhiFVXFHdFFQGJvbYxR0ynhXMjSoPHPURZ98BBAuNEOrf0RfIrgPYZSjbKXj1lD/9ZvRIpXIRkAMGgA7B1PK2o7nfOGEL88W1W7wJyyPh5IlsVG315Emzb8giFrC/RXeskAlDyipBZNysmXVRJD888Jy9D8JgCsHY0YmEd5evx9XlKPvovzvWb7NbvGtZ1tZoY8RjxHb8xg/mB8KQ8IEMUXeodAyL2yNzKnE207MxI4egKBvCQnuuxdInhzFyohCR1ACYcxRF/eKq1KSmjcAELpZd+9XGosDSqw3ura1fFfbcg3kuGONiD6qmnDmQVvDRVUnuoccGAW5VAw9xnPJmw==
x-ms-exchange-antispam-messagedata: yRJE9qN6IaNmlqax51cqoW1651TOaYz66VNcqPT0ezq2jBxml85cHmZRzrydhb8UZuEMvbwPOcKxVVKz6fRfrKfScRsmSlzNl+FWR09qA0fKC1QuWdnUsPuBAQhrF5L/atXG+CqNzsa7ko+A3etKIgOMI9yLAvdsLlndN2GPz0OES7+YdJHQ/Pa9/uLe7ayzM/4m7h0nRwjLm0rXAVPkRw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efbf1f8-6d3f-41d2-b50a-08d7cb1b7fee
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2020 09:05:26.5701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 43cD6DM2aIXKjUhDWulM5Z7sj+JACb0l/Cr6KzskYLH+dqWxwqQKo+1jNYURKX60U6ZGcDQ8pQVuA+RS5Hdcznp1ZeSpTGmrzcHYkW7ONJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1402
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS,WEIRD_PORT autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP build failure
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
Content-Type: multipart/mixed; boundary="===============0849034447=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0849034447==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1468457E110C4026E1EEA9C9EEF70MAXPR0101MB1468_"

--_000_MAXPR0101MB1468457E110C4026E1EEA9C9EEF70MAXPR0101MB1468_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQppIHllcy5pIGRpZA0KbWFrZSBhdXRvdG9vbHMNCi4vY29uZmlndXJlIGFuZCB0aGVuIGkg
dHJpZWQgbWFrZSBidXQgaXQgZmFpbGVkIHdpdGggZXJyb3INCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQpGcm9tOiBQYW5rYWogVmluYWRyYW8gSm9zaGkgPFBhbmthai5WSkBleGFs
ZWFwc2VtaS5jb20+DQpTZW50OiBXZWRuZXNkYXksIE1hcmNoIDE4LCAyMDIwIDI6MzIgUE0NClRv
OiBDaXhpIEdlbmcgPGdlbmdjaXhpQGdtYWlsLmNvbT4NClN1YmplY3Q6IFJlOiBbTFRQXSBMVFAg
YnVpbGQgZmFpbHVyZQ0KDQp5ZXMuLmkgZGlkDQptYWtlIGF1dG90b29scw0KLi9jb25maWd1cmUN
Cm1ha2UNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBDaXhpIEdlbmcg
PGdlbmdjaXhpQGdtYWlsLmNvbT4NClNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMTgsIDIwMjAgMjow
MyBQTQ0KVG86IFBhbmthaiBWaW5hZHJhbyBKb3NoaSA8UGFua2FqLlZKQGV4YWxlYXBzZW1pLmNv
bT4NClN1YmplY3Q6IFJlOiBbTFRQXSBMVFAgYnVpbGQgZmFpbHVyZQ0KDQpISSBQYW5rYWo6DQpk
aWQgeW91IHJ1biAuL2NvbmZpZ3VyZSBiZWZvcmUgbWFrZSA/DQpUaGUgcXVpY2sgc3RhcnQgc3Rl
cA0KMS4gLi9jb25maWd1cmUgLjIgbWFrZSBhbGwgMy4gbWFrZSBpbnN0YWxsDQoNClBhbmthaiBW
aW5hZHJhbyBKb3NoaSA8UGFua2FqLlZKQGV4YWxlYXBzZW1pLmNvbTxtYWlsdG86UGFua2FqLlZK
QGV4YWxlYXBzZW1pLmNvbT4+INPaMjAyMMTqM9TCMTjI1dbcyP0gz8LO5zM6MzDQtLXAo7oNCkhp
LA0KSSBhbSB0cnlpbmcgdG8gYnVpbGQgTFRQIG9uIHg4NiBpIGFtIGZhY2luZyBmb2xsb3dpbmcg
aXNzdWUsY2FuIHNvbWVvbmUgcGxlYXNlIGhlbHAgbWUgb3V0IHRvIGZpZ3VyZSBpdD8/DQoNCg0K
cm9vdEBMQVBUT1AtTlFCT0gwVjU6L2hvbWUvcGFua2FqL3Bhbmthal93b3JrL2V4YWxlYXBfbHRw
L2x0cCMgbWFrZQ0KL2hvbWUvcGFua2FqL3Bhbmthal93b3JrL2V4YWxlYXBfbHRwL2x0cC9pbmNs
dWRlL21rL2Vudl9wcmUubWs6MTExPGh0dHA6Ly9lbnZfcHJlLm1rOjExMT46IC9ob21lL3Bhbmth
ai9wYW5rYWpfd29yay9leGFsZWFwX2x0cC9sdHAvaW5jbHVkZS9tay9jb25maWcubWs8aHR0cDov
L2NvbmZpZy5taz46IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCi9ob21lL3Bhbmthai9wYW5r
YWpfd29yay9leGFsZWFwX2x0cC9sdHAvaW5jbHVkZS9tay9lbnZfcHJlLm1rOjExMjxodHRwOi8v
ZW52X3ByZS5tazoxMTI+OiAvaG9tZS9wYW5rYWovcGFua2FqX3dvcmsvZXhhbGVhcF9sdHAvbHRw
L2luY2x1ZGUvbWsvZmVhdHVyZXMubWs8aHR0cDovL2ZlYXR1cmVzLm1rPjogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeQ0KbWFrZSAtQyAvaG9tZS9wYW5rYWovcGFua2FqX3dvcmsvZXhhbGVhcF9s
dHAvbHRwIGhlbHA7IGZhbHNlDQptYWtlWzFdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy9ob21lL3Bh
bmthai9wYW5rYWpfd29yay9leGFsZWFwX2x0cC9sdHAnDQpQbGVhc2UgcmVhZCB0aGUgQ29uZmln
dXJhdGlvbiBzZWN0aW9uIGluIC9ob21lL3Bhbmthai9wYW5rYWpfd29yay9leGFsZWFwX2x0cC9s
dHAvSU5TVEFMTA0KTWFrZWZpbGU6MTk4OiByZWNpcGUgZm9yIHRhcmdldCAnaGVscCcgZmFpbGVk
DQptYWtlWzFdOiAqKiogW2hlbHBdIEVycm9yIDENCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5
ICcvaG9tZS9wYW5rYWovcGFua2FqX3dvcmsvZXhhbGVhcF9sdHAvbHRwJw0KL2hvbWUvcGFua2Fq
L3Bhbmthal93b3JrL2V4YWxlYXBfbHRwL2x0cC9pbmNsdWRlL21rL2F1dG9tYWtlLm1rOjExNTxo
dHRwOi8vYXV0b21ha2UubWs6MTE1PjogcmVjaXBlIGZvciB0YXJnZXQgJy9ob21lL3Bhbmthai9w
YW5rYWpfd29yay9leGFsZWFwX2x0cC9sdHAvaW5jbHVkZS9tay9mZWF0dXJlcy5tazxodHRwOi8v
ZmVhdHVyZXMubWs+JyBmYWlsZWQNCm1ha2U6ICoqKiBbL2hvbWUvcGFua2FqL3Bhbmthal93b3Jr
L2V4YWxlYXBfbHRwL2x0cC9pbmNsdWRlL21rL2ZlYXR1cmVzLm1rPGh0dHA6Ly9mZWF0dXJlcy5t
az5dIEVycm9yIDENCg0KLS0NCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cA0KW0VYVF0NCg==

--_000_MAXPR0101MB1468457E110C4026E1EEA9C9EEF70MAXPR0101MB1468_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
i yes.i did</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
make autotools</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
./configure and then i tried make but it failed with error</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Pankaj Vinadrao Joshi=
 &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Sent:</b> Wednesday, March 18, 2020 2:32 PM<br>
<b>To:</b> Cixi Geng &lt;gengcixi@gmail.com&gt;<br>
<b>Subject:</b> Re: [LTP] LTP build failure</font>
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
yes..i did</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
make autotools</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
./configure</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
make</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Cixi Geng &lt;gengc=
ixi@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, March 18, 2020 2:03 PM<br>
<b>To:</b> Pankaj Vinadrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Subject:</b> Re: [LTP] LTP build failure</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">HI Pankaj:
<div>did you run ./configure before make ?</div>
<div>The quick start step</div>
<div>1. ./configure .2 make all 3. make install&nbsp;</div>
</div>
<br>
<div class=3D"x_x_gmail_quote">
<div dir=3D"ltr" class=3D"x_x_gmail_attr">Pankaj Vinadrao Joshi &lt;<a href=
=3D"mailto:Pankaj.VJ@exaleapsemi.com">Pankaj.VJ@exaleapsemi.com</a>&gt; =D3=
=DA2020=C4=EA3=D4=C218=C8=D5=D6=DC=C8=FD =CF=C2=CE=E73:30=D0=B4=B5=C0=A3=BA=
<br>
</div>
<blockquote class=3D"x_x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bo=
rder-left:1px solid rgb(204,204,204); padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>Hi,</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>I am trying to build LTP on x86 i am facing following issue,can someo=
ne please help me out to figure it??</span></div>
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
<span>ro</span><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,H=
elvetica,sans-serif; font-size:12pt">ot@LAPTOP-NQBOH0V5:/home/pankaj/pankaj=
_work/exaleap_ltp/ltp# make</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div>/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/<a href=3D"http://=
env_pre.mk:111" target=3D"_blank">env_pre.mk:111</a>: /home/pankaj/pankaj_w=
ork/exaleap_ltp/ltp/include/mk/<a href=3D"http://config.mk" target=3D"_blan=
k">config.mk</a>: No such file or directory<br>
</div>
<div>/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/<a href=3D"http://=
env_pre.mk:112" target=3D"_blank">env_pre.mk:112</a>: /home/pankaj/pankaj_w=
ork/exaleap_ltp/ltp/include/mk/<a href=3D"http://features.mk" target=3D"_bl=
ank">features.mk</a>: No such file or directory<br>
</div>
<div>make -C /home/pankaj/pankaj_work/exaleap_ltp/ltp help; false<br>
</div>
<div>make[1]: Entering directory '/home/pankaj/pankaj_work/exaleap_ltp/ltp'=
<br>
</div>
<div>Please read the Configuration section in /home/pankaj/pankaj_work/exal=
eap_ltp/ltp/INSTALL<br>
</div>
<div>Makefile:198: recipe for target 'help' failed<br>
</div>
<div>make[1]: *** [help] Error 1<br>
</div>
<div>make[1]: Leaving directory '/home/pankaj/pankaj_work/exaleap_ltp/ltp'<=
br>
</div>
<div>/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/<a href=3D"http://=
automake.mk:115" target=3D"_blank">automake.mk:115</a>: recipe for target '=
/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/<a href=3D"http://featu=
res.mk" target=3D"_blank">features.mk</a>'
 failed<br>
</div>
<span>make: *** [/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/<a hre=
f=3D"http://features.mk" target=3D"_blank">features.mk</a>] Error 1</span><=
br>
</div>
</div>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">
https://lists.linux.it/listinfo/ltp</a><br>
</blockquote>
</div>
[EXT] </div>
</div>
</body>
</html>

--_000_MAXPR0101MB1468457E110C4026E1EEA9C9EEF70MAXPR0101MB1468_--

--===============0849034447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0849034447==--
