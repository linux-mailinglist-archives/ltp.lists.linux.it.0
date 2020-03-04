Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40693178A34
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 06:26:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBDCB3C65A7
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 06:26:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B1D573C659D
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 06:26:41 +0100 (CET)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390093.outbound.protection.outlook.com [40.107.139.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2500860090E
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 06:26:40 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qza66VoqcMlIxFXDf1BU+V7ABEbDgI4SPwPng5asRlepJeLF4clOnMOhC/B87MK5EgIzSEjXiTRqYI52z7HbccPTnExJT0PmCVh9YDbpyncB4uuyjC4r2/dDWYhL3XDwzQudtv1HREzueVMJ6s5LDNPji+gm/8VQBVoqJuV5Rsni4t0i+1YRiM3CDJ3gSLMc+dQyY4MF0s1gaYYatLOjY+vi0booFeXBUyafWABhBj6GqAcpq7TWh78vhFqRgG4aP6ALTqlW8JVTtuFfPloDefGfyIERj9rdTOrRKi4ckg59PSk820wFWyge2t4b2rWJKnzfJ1DWytGRR/DmWNVRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWtSY7ncFa4runCB+Ng5VLL9wLAAgPbmoFOFgwjkxzg=;
 b=ZAoxzsfwiTgeqO2TE5p3RgbZpQEk2PYQfBunXywZV6GpcpSEclt+OBSHJSzseT5fF/8XIzaYCqodjd1fwYwYpP9B1j0htZXtrnjPFgHwFK2IDVwujDyCpFPZpQnHc0LFsyVXFo6fw1HHqeaXxPOWbxr2fbYyoLv2uOaf8Y4iHs43u0NA+vfAwS51H+ICKbHfZq7qVv/kJzWDZFTrXloBN+KvKgu3aFxRiP7NiSeI9cYV83W0HxbkI/G610zAAvJz2CavLpd1s6y0o15UX1h5q7WlIhURbOku6ITitd3FHSNsWK2Xd96YBtFoyt0V4ZuipZS8H8DROQriG9B5ApY7UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWtSY7ncFa4runCB+Ng5VLL9wLAAgPbmoFOFgwjkxzg=;
 b=UlhsZSvyxdFdWbbg3Vfub6iYucnfAilGs+KMXSQay0C/fW6RFaU8HdNvL0Wk3XQyMMK6fEoxr3CGYQb1Eg6fVHQgpPMrHnem4VUIj04MUu0VaOumaDeo1CiZffTkhYgBJk4VAA/uyBWIgxy+4f8OJOTyyJKcy1LmvucqrWpcdRg=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1801.INDPRD01.PROD.OUTLOOK.COM (52.134.128.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Wed, 4 Mar 2020 05:26:37 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 05:26:37 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Thread-Topic: LTP autoconfig
Thread-Index: AQHV8eTZrco0Wjs8VUi/ptBgpOWo+g==
Date: Wed, 4 Mar 2020 05:26:36 +0000
Message-ID: <MAXPR0101MB14687839FE18D4BC633BF475EEE50@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [117.99.88.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a49e9e61-d094-4439-d18d-08d7bffc9c4c
x-ms-traffictypediagnostic: MAXPR0101MB1801:
x-microsoft-antispam-prvs: <MAXPR0101MB1801EA3ACCFC77F39D091670EEE50@MAXPR0101MB1801.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(376002)(39830400003)(396003)(346002)(199004)(189003)(8936002)(316002)(2906002)(8676002)(81156014)(4744005)(86362001)(508600001)(19627405001)(81166006)(66556008)(66446008)(64756008)(66476007)(76116006)(66946007)(55016002)(7116003)(9686003)(6916009)(5660300002)(33656002)(4326008)(71200400001)(7696005)(26005)(3480700007)(186003)(52536014)(19627235002)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1801;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LugwnvoJZB/UTiylRTAHbcnQnPpdExviJxVPbbh4AQ5m8nZ/nSSpwNc3D3/f5hwbep+sYBz0GPjQ6lOPs6mOi1lMaFb7zHO3E2U+k9Y/+I3sEhK+0PKogdJiWzvPgr4pUZUClsVK4H0K5sJ3kAL4pxpaAnPtttEDy9KW7gmJIrY6BjhleJwE8QBq5HcK6lfczDg4PVVXSfmKSWFkoTaQB8xfoyOWRtIX2VHW1GlByDjxvSSL7FdAJEtiW6wtJbaywpOmqHyjN9wtZKsISglQs33JoJOegAcvUWf8Rai9/EkxKgJv39V5z4LM5MZNQJINsAqBGsjd9RjAFkS3BEMNTbvnbgNYlNjqvDEPfoqAfYnSj6nE3EA6JtjZUbuj4/hoA5mKVjSVQtp7EaSrktoko9vNd8Nxm3cj17kWpAemsn0zpGiD3Fuu3UjLycWyzFqz
x-ms-exchange-antispam-messagedata: xrm+q1sBQJjDOKIgR4sfbTasqRTlrp2c1XoaKJlv/IP6hCYBqkJNvsFPyMg30RsMhw5L91v5QzsGHGQRPO87rai76pL56voMQgZ+qqhCc4rv5u7ly1twU15P1Hn1ekIV0OVXC4/inX358UttTDUO7A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49e9e61-d094-4439-d18d-08d7bffc9c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 05:26:36.7679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W2NOO9vSOcbZymcv2ir9ALHBVOLABTkvYs6DD5/wSZv9QaxoOTkWhQQPWmq5fWz2Upq4HdfBb9LMS5j3M5Jo8HvTTraae+oaCRTex5y1RUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1801
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] LTP autoconfig
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
Content-Type: multipart/mixed; boundary="===============0866508425=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0866508425==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB14687839FE18D4BC633BF475EEE50MAXPR0101MB1468_"

--_000_MAXPR0101MB14687839FE18D4BC633BF475EEE50MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i have cloned git from github and going ahead with procedure i facing follo=
wing problem

root@exaleapsemi:~/pankaj_ltp/ltp# make autotools
aclocal -I m4
Can't locate Exporter.pm in @INC (you may need to install the Exporter modu=
le) (@INC contains: /usr/share/automake-1.16 /usr/lib/perl5/site_perl/5.30.=
0/riscv64-linux /usr/lib/perl5/site_perl/5.30.0 /usr/lib/perl5/vendor_perl/=
5.30.0/riscv64-linux /usr/lib/perl5/vendor_perl/5.30.0 /usr/lib/perl5/5.30.=
0/riscv64-linux /usr/lib/perl5/5.30.0 .) at /usr/share/automake-1.16/Automa=
ke/Config.pm line 22.
Compilation failed in require at /usr/bin/aclocal line 37.
BEGIN failed--compilation aborted at /usr/bin/aclocal line 37.
make: *** [/home/root/pankaj_ltp/ltp/include/mk/automake.mk:45: aclocal.m4]=
 Error 2


Thanks


--_000_MAXPR0101MB14687839FE18D4BC633BF475EEE50MAXPR0101MB1468_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
i have cloned git from github and going ahead with procedure i facing follo=
wing problem<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
root@exaleapsemi:~/pankaj_ltp/ltp# make autotools<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>aclocal -I m4<br>
</span>
<div>Can't locate Exporter.pm in @INC (you may need to install the Exporter=
 module) (@INC contains: /usr/share/automake-1.16 /usr/lib/perl5/site_perl/=
5.30.0/riscv64-linux /usr/lib/perl5/site_perl/5.30.0 /usr/lib/perl5/vendor_=
perl/5.30.0/riscv64-linux /usr/lib/perl5/vendor_perl/5.30.0
 /usr/lib/perl5/5.30.0/riscv64-linux /usr/lib/perl5/5.30.0 .) at /usr/share=
/automake-1.16/Automake/Config.pm line 22.<br>
</div>
<div>Compilation failed in require at /usr/bin/aclocal line 37.<br>
</div>
<div>BEGIN failed--compilation aborted at /usr/bin/aclocal line 37.<br>
</div>
<div>make: *** [/home/root/pankaj_ltp/ltp/include/mk/automake.mk:45: acloca=
l.m4] Error 2</div>
<div><br>
</div>
<div><br>
</div>
<div>Thanks <br>
</div>
<span></span><br>
</div>
</body>
</html>

--_000_MAXPR0101MB14687839FE18D4BC633BF475EEE50MAXPR0101MB1468_--

--===============0866508425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0866508425==--
