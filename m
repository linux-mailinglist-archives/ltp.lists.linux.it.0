Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DBF189635
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 08:30:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E1613C5538
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 08:30:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 94D2B3C0489
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 08:30:01 +0100 (CET)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390114.outbound.protection.outlook.com [40.107.139.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7C2B9201028
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 08:30:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haoZsjSn+SAEH7K4ya6rZaTRCwQ39RcTiFK2JgFsC7ows03KxAbIlVd1gcagCvA1R3wIt8nFDc28doRg+UtU9CHRWsTfUK2RlexbjdAE2IY9w51tL8qowBbnLR7ojPfWp+QPtc4bCnFcG8ta3qrAKLzjtdji/KBQmp8hSp0jFR1ZP4wjVuXYH9d4LXbifpg+6gPC0FXz/IVO1nDbO23W7HUPh7u6b7IeCWhKzmhmlThHH/yf6Uq/aOeZxrNSUmZBiboc865iJpPgXWFD+DWgCjoll2CcvclSck5Kc6ozOS17pmC0/RKC3GACC+AoXvC1epOX7EAOkHjEHOVGBFU3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bZ04o91qNbvRzLDYlouP3VStb2VeCOjNWz5BqnXmO0=;
 b=BsAF0R/WZ1pDlAHkEplW6FshQHVydihMth6RNvfH4K4rIkWtHJMYL7zvF2gMpw/VLmpDZ9zjWOyoRtE8ii9mtou1V1VN1MwDdBl9nD4abhAED1ET8+6h8HdwBMgOa62+JaJVSwfC/wlvKCL0hEOF7esvHRbJU02F0oomvc6/pKdXyVx0esf1rnGifOCLZHMsC3FuXWtDCVb0JlEzG/WEQU02fQQeIXfC/4TU8rg4ZU5uO5LcShWmExN+V3XI+ykcjnp7Gk31E0urmG8nIyBz4z1Cg2AsGj2aGwz/8RiywOEVPgFP5yeys6gc2MT1ZK4UB8Ha86c9edXTD0SOjZv/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bZ04o91qNbvRzLDYlouP3VStb2VeCOjNWz5BqnXmO0=;
 b=V1RPq+LQrEjZ2dYGnjdD4i0ZHQZkHcI5URm06A3a+859XHb8yGLu4tsNTeqHE8m/uWw8m8Fa78FeiyNOy5bZ9zBIslCtOjPr07Bmvwqth6V+RYKB7prqFUaymZAiN8OUTU/F+YN/UAZYHX1/8SklxccrDG0OsFwjtEd+PxCyPOo=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1481.INDPRD01.PROD.OUTLOOK.COM (52.134.133.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.23; Wed, 18 Mar 2020 07:29:56 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2814.021; Wed, 18 Mar
 2020 07:29:56 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: LTP build failure
Thread-Index: AQHV/PbMSDJiDYW6Gk+7EdwA4FqBrg==
Date: Wed, 18 Mar 2020 07:29:56 +0000
Message-ID: <MAXPR0101MB1468D80C07532533C7698F85EEF70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [2405:204:97a6:35aa:a0ec:5a62:9224:bd56]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18aeb833-bda9-480c-3b8c-08d7cb0e286f
x-ms-traffictypediagnostic: MAXPR0101MB1481:
x-microsoft-antispam-prvs: <MAXPR0101MB148155339CB9693A7B2AADBDEEF70@MAXPR0101MB1481.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 03468CBA43
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(39830400003)(376002)(396003)(366004)(199004)(316002)(33656002)(66446008)(76116006)(91956017)(66946007)(64756008)(52536014)(66476007)(5660300002)(81156014)(8936002)(2906002)(7696005)(6506007)(81166006)(66556008)(8676002)(86362001)(55016002)(508600001)(71200400001)(9686003)(19627405001)(186003)(3480700007)(6916009)(7116003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1481;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vece1MwEA/3uu7Pm0KH5JNAYdmHRwkS0Nv7l3bWeWD/hwmXWXzT2Y1F/jF0IxlkSS0W3Gfiw6VOXubufXJxIhhb5ixO7o3PJT22ngFwtOXQQIJcSZiEOndUTLvgJ674ywnKG8c2E6dXCWR4x2IeQKuIZiNEhaOIqBGuo0YCaeX7YCsvb137q7cqq2alHivP+EM3/iUW+hTK8xMKHqNTdo1uqv/FbV33j0FUEVKY0qBfy4/oczs8wM35VCruFcI600VgeipttRa3bZfrmCjWDu/DKQCtMr9I5N3Vz2VM5NOE70Q5qCKbQieuyEqu/fLdgo1TFHQBlene2fzTPtuiuo4YXXt/D/1akwrytcIlGzvGPOmykfmut1+AZAkhP7K1QTiFiE1wW24w+aRP4lWMJq6jG4XbH/FFmqiNw69ht/LvAKl0fSDBpwQC4VHyK2h/K
x-ms-exchange-antispam-messagedata: dSXwa0owo9t3WsxPLm9gAeNad8gikzHyhcdPuS/NkE4fWHD8LGImfyb8E2x7ZCtGojbofIP0JW8LCRnShbeqMJX/u008EmnkPK1UJeWMnP5HHx6+cghSNlyIIzY5bxzGo2zPyEGPnIOahn4VgzUkHK7NVf+/zLRTcf6+B/PvbM3gfT4zuZ1WzhMKkXbo509xL/LSijanWOI+0UK75xjcqQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18aeb833-bda9-480c-3b8c-08d7cb0e286f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2020 07:29:56.3304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: foTJfnVyh9rTV0vjcx4khKJPgKbBuF8g7dlDHmez7YDRwHJLkdr2EKXSKGuQbnFCxUKvW5IaNeMonHwYZLS4eD6FjwRr8fAglYIA/7W0rcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1481
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] LTP build failure
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
Content-Type: multipart/mixed; boundary="===============1725291848=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1725291848==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1468D80C07532533C7698F85EEF70MAXPR0101MB1468_"

--_000_MAXPR0101MB1468D80C07532533C7698F85EEF70MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am trying to build LTP on x86 i am facing following issue,can someone ple=
ase help me out to figure it??


root@LAPTOP-NQBOH0V5:/home/pankaj/pankaj_work/exaleap_ltp/ltp# make
/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/env_pre.mk:111: /home/p=
ankaj/pankaj_work/exaleap_ltp/ltp/include/mk/config.mk: No such file or dir=
ectory
/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/env_pre.mk:112: /home/p=
ankaj/pankaj_work/exaleap_ltp/ltp/include/mk/features.mk: No such file or d=
irectory
make -C /home/pankaj/pankaj_work/exaleap_ltp/ltp help; false
make[1]: Entering directory '/home/pankaj/pankaj_work/exaleap_ltp/ltp'
Please read the Configuration section in /home/pankaj/pankaj_work/exaleap_l=
tp/ltp/INSTALL
Makefile:198: recipe for target 'help' failed
make[1]: *** [help] Error 1
make[1]: Leaving directory '/home/pankaj/pankaj_work/exaleap_ltp/ltp'
/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/automake.mk:115: recipe=
 for target '/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/features.m=
k' failed
make: *** [/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/features.mk]=
 Error 1

--_000_MAXPR0101MB1468D80C07532533C7698F85EEF70MAXPR0101MB1468_
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
<span>I am trying to build LTP on x86 i am facing following issue,can someo=
ne please help me out to figure it??</span></div>
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
<span>ro</span><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Ar=
ial, Helvetica, sans-serif; font-size: 12pt;">ot@LAPTOP-NQBOH0V5:/home/pank=
aj/pankaj_work/exaleap_ltp/ltp# make</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div>/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/env_pre.mk:111: /h=
ome/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/config.mk: No such file o=
r directory<br>
</div>
<div>/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/env_pre.mk:112: /h=
ome/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/features.mk: No such file=
 or directory<br>
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
<div>/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/automake.mk:115: r=
ecipe for target '/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/featu=
res.mk' failed<br>
</div>
<span>make: *** [/home/pankaj/pankaj_work/exaleap_ltp/ltp/include/mk/featur=
es.mk] Error 1</span><br>
</div>
</body>
</html>

--_000_MAXPR0101MB1468D80C07532533C7698F85EEF70MAXPR0101MB1468_--

--===============1725291848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1725291848==--
