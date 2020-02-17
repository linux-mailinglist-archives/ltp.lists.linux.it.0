Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B33160F14
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:46:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D1E73C243C
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:46:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id F37983C23B5
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:46:31 +0100 (CET)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380119.outbound.protection.outlook.com [40.107.138.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E25026011B5
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:46:30 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhovHb+i7Gl20u/KxIn8+3XStnQHwfJKsCZSverCVZPLTwNZJfGSLa1dcUQ5NLvsUCt0Akpn/we8qLGM29fzrSn+orU6edTZIPEziAIzSbX6OS0VlX/neu69jmHatImHT1vmItS2KII+DGPPSf8MiepU+jVYSzOo8fJJFrEZW4aZ9QonMGj7+MIqGj1uvwAbXnHUNz21BZ168S2AyCz8ctDythZcsc/RjXZ3tKODQZbG6Su/W2KVjOAKLoHx2INapgHhBHH60xHfQMVBVW61uOwRcEKUnPC/HYPgIgg8gNC5LSaGX2lsnkBGvIJZNNWenWj0lqcoKaMuKGIq/AX2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YVKxAH8k/G6sgV6YIAAtPXrbZG+U0XHuXZxow4adDg=;
 b=L7Nf/9LKrtH7zwjxrJ4XHqX4YbzAANkvbNnNuIHD8DLRt4vh6VGg4yd2VlEx4b76H9YEOzxZGokHOLBR6SJkdVB2Aum5FEms7FbX+hcdB0lCYCiJYH77Vdv2Hd8h+fp7R7e+4crGIBK28cB9gPgga8DswJyM8ht6w/jDpewGBG8ZVIdMsILPcHf4UG4GiVuAvBPJoktHYQkTdA91zglnEohpZ8pxvSOUbrDjYKTfDNTNhpv1PVlUMnm/7ZcPdxgvM8kiZdVzQt449916TXiEmotaKIPX0i1L5dXV6mxHP4tNKMHPWdMEfMR8XaBw4x7d5MYyWrdpEK6lrnVtONSvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YVKxAH8k/G6sgV6YIAAtPXrbZG+U0XHuXZxow4adDg=;
 b=1+Xkv1qjnytT5xP/AYLAKX4k1Tx1o+shBX34WxEWx0EiJORnQEba8xn5zRaOtbregIfVdEZUx2D7u4xOJdbAnWLpyXizRLoimlRjXBVa6rwdhg6cPFzpuIcQgbl5jZEpauLgPm24jQB7wDzbSjIc+9A55/rRSMGKgNkH2MaVJr4=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1578.INDPRD01.PROD.OUTLOOK.COM (52.134.131.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 09:46:27 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3066:1c66:a39:1bf8]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3066:1c66:a39:1bf8%6]) with mapi id 15.20.2729.032; Mon, 17 Feb 2020
 09:46:27 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: min_free_kbytes test  FAILING
Thread-Index: AQHV5XbOdWX+r6tB8ki1BvoQT6Csxg==
Date: Mon, 17 Feb 2020 09:46:27 +0000
Message-ID: <MAXPR0101MB146824A771FC9059D88B77BBEE160@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4384e67-11ea-4507-e827-08d7b38e4213
x-ms-traffictypediagnostic: MAXPR0101MB1578:
x-microsoft-antispam-prvs: <MAXPR0101MB157880EBCF4159566EBD7DE1EE160@MAXPR0101MB1578.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(189003)(199004)(71200400001)(8676002)(81166006)(81156014)(5660300002)(26005)(66476007)(19627405001)(558084003)(55236004)(66446008)(66556008)(2906002)(66946007)(7696005)(64756008)(6916009)(86362001)(508600001)(8936002)(7116003)(6506007)(76116006)(9686003)(55016002)(33656002)(186003)(52536014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1578;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vBZeGtTYFOjJ4aKKJMG5Q8jyVKu4mUZmRjr5pYzosZHGruv3eMWeOO4UbdxPKQ8JzEpUfWcWa2T3gIk2eL+GjXYFgQbDEow4kL216m3jP5FecI1zrAUInUW4k9nxM8U3cT9JSV2K1KSRvTnYdnrlwYqU5ridT3wDHjx3I5vs54j+2h5c0C/4ipmDyp6lhLmJxcZPNN3FsYuqrnOLMP9fxXHj/I+yMzYQ+u08s37IOBsLoyjZxYb1XCj04DJaLetWZcRPRRggIkIGp9jirXZb6rBSl6iNFEnl4znPYfHqeuA/PdHx0fhc5qXa/QH+Ktf79ka73Do6quAkzD/iGLkRP0EfYecvdtIM1v6txvsSIVaM4sLwYDKDcXGiTiihI0DeQnHCmi1Xt2b5ShoIvxyro2AFUwr5CELqh+wpHCKNtQjOzW5D3o7tN32bOxvEOSCD
x-ms-exchange-antispam-messagedata: jcZjgQsT2bR4kTPKnTUT8Rvdgk8ump+C0ic8TcWvCCWiTeLWThu6jjAcX9rp8//L2K8jx7osHCttxs+9/L4BTBmzaQQduEiWsBdP14weETKXk31GJ28EIjJkOa0velwyg+WMfY6npH7MbfOg0RW4+w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4384e67-11ea-4507-e827-08d7b38e4213
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 09:46:27.0153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKxfl9nn7bDHSLrMrAS+0Dzprw6JeZilDa0rhgBT+bQMa7mppju/flM6eWXaaO9iGfGtHa9dYDBDDUSFI6GBaSfaKUg4LLHV0lVB+52uND0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1578
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] min_free_kbytes test  FAILING
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
Content-Type: multipart/mixed; boundary="===============0374550715=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0374550715==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB146824A771FC9059D88B77BBEE160MAXPR0101MB1468_"

--_000_MAXPR0101MB146824A771FC9059D88B77BBEE160MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am trying to run min_free_kbytes test but only 1 test case is getting pas=
sed remaining cases are failing with min_free_kbytes.c:158: FAIL: child une=
xpectedly failed: 11
what may be the possible cause???

Thank you

--_000_MAXPR0101MB146824A771FC9059D88B77BBEE160MAXPR0101MB1468_
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
i am trying to run min_free_kbytes test but only 1 test case is getting pas=
sed remaining cases are failing with
<b>min_free_kbytes.c:158: FAIL: child unexpectedly failed: 11</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
what may be the possible cause???</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b><br>
</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>Thank you</b><br>
</div>
</body>
</html>

--_000_MAXPR0101MB146824A771FC9059D88B77BBEE160MAXPR0101MB1468_--

--===============0374550715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0374550715==--
