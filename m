Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3C43AFDF3
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 09:33:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8C403C700F
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 09:33:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF0EA3C2CEF
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 21:52:53 +0200 (CEST)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8EA481401245
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 21:52:52 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkLhy7lqZbz6OfjM9P4J/T3jZ4xuyTtK8J+DDqlffmFNUpdn0aUi2+ZBU7LgPR2tDXJIU+xN59M7LU6DWA02zVkyCpQ7/iMwbUFxd35AjpXRiY8y8DtTNy2tvvB7Bb33RgG4G/xKZqHPWeqYMYmmt8xAzD4xz7KjKclwzwka69yT8UI6q4aCfOxCNrvAFh17ZMYkmdZ4Bbuw/l3kgdIWaVSlR+KoU3qt/Vji2DxHKUIxoA+XOAUvTwtvxBMfN0ergqRAYZzAcCofgUsZIWle+cVBn+hl5sY98VDupli3yOj9oMGAmYu4gKcLpafwHe2TCTuClzRd9O9DyCDwf/PJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxBlP2NViRTIbUfiypXpruUWt/y4bIQRVkUaoj95YHg=;
 b=E4Lav9mIA2J5R1os0RzbE2qmlFso9gG4Nhq8wHnNswuw3xoQdMi5+I1Tlqs8h+Ov9X7tChqNpgVbzFSda3ZWTnn+Wwe2gY55mI6vUYgShv38K99OzOlziqL3VdZGyljqDfIhDayL1yGDfwtxnMTP9KDB1l8eWtysbYRPIOqasT6Sf8JDTQUKbMnzspp4YPyOKRX0gjkJr5LDzzeeGbBnc2iS64LHUDNrULMTZi77xEbstw4OEsJ1i/VVos/RjmlfZIYvRyQv6+Gl778ieoOhm8qZiW2xTobdsQz/cJYSON4FB3pPHTy9aNg0ATWGcCvgfuRSoY+qlmUhQgyOWyAgPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=idtechproducts.com; dmarc=pass action=none
 header.from=idtechproducts.com; dkim=pass header.d=idtechproducts.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=idtechproducts.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxBlP2NViRTIbUfiypXpruUWt/y4bIQRVkUaoj95YHg=;
 b=HeucgYvQ1PnWiYhhju7jlzb8hKipMpIb1XM6kqEXtHtlX7iDsYgnXi34zNwV8HcLxgRyZPcIr5hIJcD91dcjXSF1IXPnUk1Z/G01F4p7aWEvIK7zI502nOa6qIg6nR8wT9jNqVTQEU/ec9IIgJ2S19VSozsLBBE4WoYXa1FmR8opXMTxgOnuA9t63Hosc1XkbqpIumiiVFnbv9ImRUCnYA1IZIAReL5ltAvMdqEB/q9fSRJeICudzv60WGSOXjXKHDwASDqHcOVCJ2vHqSVVkaiWRJ1jcopqLzw7r6xvlJoxfjz+KH1cEBjB6+QUJumw0qbOyRK/QHRjNd7Unwx56Q==
Received: from BY5PR22MB1826.namprd22.prod.outlook.com (2603:10b6:a03:239::8)
 by SJ0PR22MB2557.namprd22.prod.outlook.com (2603:10b6:a03:320::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 17 Jun
 2021 19:52:49 +0000
Received: from BY5PR22MB1826.namprd22.prod.outlook.com
 ([fe80::1d83:4e64:b88c:5939]) by BY5PR22MB1826.namprd22.prod.outlook.com
 ([fe80::1d83:4e64:b88c:5939%7]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 19:52:49 +0000
From: Duc Ly <Duc.Ly@idtechproducts.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: LTP environment setup
Thread-Index: AQHXY6GdRekjYWzz6EW6CMVKGNw/DQ==
Date: Thu, 17 Jun 2021 19:52:49 +0000
Message-ID: <BY5PR22MB1826245B4D2C69C3553F0DDAF30E9@BY5PR22MB1826.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=idtechproducts.com;
x-originating-ip: [67.218.109.206]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50364015-159e-49e7-debf-08d931c97c4b
x-ms-traffictypediagnostic: SJ0PR22MB2557:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR22MB25577EEF70D452FE6CE24C90F30E9@SJ0PR22MB2557.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J5aAlL+8rfsG3zDmCgOTC6+UoET0n0EFpte7Zm1bnDYou7ta0i6OURQhFLs210l6WnUGXo9iqCA9sNYmnkg3kdqayzVNuCV9u/GimLwMoxX1WT7Bt1ltcKKQvpMZrP7N/qj3qjQEcXjA3W+h2wxpBaE/YCPoV6an0KQoStY48g1ZNd4Z+yyQS68lfYZE2s7ehB1AYvQWT5PWQYxXr9HUVs6pYbrqyaPco2DvaOpDnNBbc7jMJNplxAdsDcfl8bnhvZHreKaL3nCzTYyzvtSJyCCl0chiVtSiBQPoP9TQlkBfBXZ6+22wb9A6iCRfviuOddxmJ9rxqVYj78mx61UNpyJYirsWxeWc0Vwiuq4M3nhnmqNos+FnUigw2FwfK9K/bl9K3yczsx7Y4wYdS0HPYuY4riqitBpkap1u/w1r1xDtlZEFll+wzjUdru/lkDIUN+xzLTHidEYXyAmPKyet9yRBbKo89iu79LNboal7Vd9E1vPGZmEaeFlN+XJbCAWrUlJP8NJDiPKNDUdZPkWLK9f//2ZERfT0KFw3oAKQ6QP3d+d7VYDoH02mPHSeAVZioTfMttDVo+e5TB+z6NQdFOUPZRt+++tCIDdvUQB1ieQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR22MB1826.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(39840400004)(376002)(3480700007)(122000001)(2906002)(9686003)(38100700002)(8676002)(64756008)(7696005)(26005)(4744005)(76116006)(186003)(19627405001)(71200400001)(66556008)(52536014)(66946007)(66476007)(8936002)(6916009)(55016002)(6506007)(66446008)(316002)(83380400001)(33656002)(86362001)(5660300002)(7116003)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZXsEVAjS4/eLQP8gbKlp7LiPuTwT44oYXoPOx6czVOaLmlLRKKXGalbCSm?=
 =?iso-8859-1?Q?zcBiAuxfELAe+DZCWTcLw/z3ptqWKLxLLuixM2E/C/jGshaa/HfrPJHZ7W?=
 =?iso-8859-1?Q?7y6oIAoGLGNjGxFVp1ZqcBntC213N5QoX/jU9ugGCKiRmG9NMMeau84QTt?=
 =?iso-8859-1?Q?Brud8ugjQH5knvjWSmvWc0vsZ+/pz44iyOHTbsMogigZZoOWDqE/MQb8Of?=
 =?iso-8859-1?Q?xnPoXotpJeo6IVDToDtw9kura7XNbOCnGjvm/wVkQdbJ6peq/MuCCzRDQv?=
 =?iso-8859-1?Q?aw0QMj5s1zGzwzfGSQiQdB2214RsAV0jVFtgf4wvXmb8VNemPLtlP48XEc?=
 =?iso-8859-1?Q?dObYn/ytK9G9SBwZBiB76zCN0e31h1IGE4X84nznQRo4Rkr74nURJuYGGU?=
 =?iso-8859-1?Q?IHG9mqbfGYXFLEAZ0Od9ZqzxCBr+Gh0s9MW8uAdBmoEIVrze41yaQTrSKN?=
 =?iso-8859-1?Q?ntTsW32xx/f+OuNH0vcHOshToc9tMx3Nqfry4OcGQ5ZjWWlfdnwtryI/Uh?=
 =?iso-8859-1?Q?tOGwRjBfdcW3HoZRcvzYvYt4g7f32DR1jvXfKpQLBbVKIfJz1581dsuYNk?=
 =?iso-8859-1?Q?jxiSkd6ZpcvNp9BqElz2FBGcxv4Jypa/dOUR8GQysPIqYT0aKZs3iD1APV?=
 =?iso-8859-1?Q?HOtV8gqDv+g9reaNe9rYSKyQB7g8nf9Qje5uNjLtiBZoPVMiHvVOFilNu6?=
 =?iso-8859-1?Q?RKUd9dACN9xVphaPfV5E8S52z/XGcL77wEfxhg9PchR+4uRJg3hBNRM9b4?=
 =?iso-8859-1?Q?uVEh7iljIRJH5MVXyf/HONawuHlQEjParVSYHzW3jmOwKUBvUl2aowGr6X?=
 =?iso-8859-1?Q?/cAKuUuIdHV7pq2NDmIV/HqrVY0xWAVm9WT02CrtZZAbIBnM5G+Enc98Pc?=
 =?iso-8859-1?Q?99LWJDWhGnEgsMLwBxwnRs0UYaHnNbzh44IJefNALhDy0ktg8S4jR3kKBs?=
 =?iso-8859-1?Q?r6GabU9eMMg0hq/WJtuJfmtwcnMEetzynI7CkKRomsyEldlParVw8nHlRm?=
 =?iso-8859-1?Q?KYurp6VmjT1FG+dxd+cXkL+HFXiBT+XZucNIZCYrmw8+fU6rgftXwK4ClE?=
 =?iso-8859-1?Q?InN9s0ti5tdjQAZjgZ29/Kg07hzZbKnh4qJnm51zIzIFKYuB9Iv/cBSpoI?=
 =?iso-8859-1?Q?NKh1q2LgWrbpdZvFkPYtessLwsdgFIHkGhjXrvcZOFlFnDFk/w7KvDmJtK?=
 =?iso-8859-1?Q?i0Y1SK1MxTYUypkJO5Ogn+WJRyObfvDKZNUBYJKponzOB+wQRDH01t5S3f?=
 =?iso-8859-1?Q?1LCZsCedaTbW3zikY9ivBdkiqmL2BrGfSXN0At2IuGxrloXYzUwITDs12Q?=
 =?iso-8859-1?Q?rwN5cirTVRJWAnJqPs3BYomZZ/wQTrwKL+adMB2NMb4KkHtyHtrgyquk7/?=
 =?iso-8859-1?Q?/+hTWSdnoQ?=
MIME-Version: 1.0
X-OriginatorOrg: idtechproducts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR22MB1826.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50364015-159e-49e7-debf-08d931c97c4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 19:52:49.1567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d31c477-b852-4f1c-9eeb-8f88232ff699
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dEwNzk0cwKBGLZdCg6Il1R0WE/2ZOfP4r7CwScgWAFjnY3pr8BNBFmZKFv6i0I6P0aOleg/FHDeE2J62bxBJgcTF1D3vLQmbDqYCUL5EGaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR22MB2557
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 22 Jun 2021 09:33:45 +0200
Subject: [LTP] LTP environment setup
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
Content-Type: multipart/mixed; boundary="===============0834559591=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0834559591==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY5PR22MB1826245B4D2C69C3553F0DDAF30E9BY5PR22MB1826namp_"

--_000_BY5PR22MB1826245B4D2C69C3553F0DDAF30E9BY5PR22MB1826namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Can you provide any links or documents on how to set up LTP environment fro=
m scratch?

I am a novice at this and would like a more detailed explanation on how to =
proceed. Thank yo in advance.



Regards,

Duc

NOTICE: This e-mail message and all attachments may contain legally privile=
ged and confidential information intended solely for the use of the address=
ee. If you are not the intended recipient, you are hereby notified that you=
 may not read, copy, distribute or otherwise use this message or its attach=
ments. If you have received this message in error, please notify the sender=
 by email and delete all copies of the message immediately.

--_000_BY5PR22MB1826245B4D2C69C3553F0DDAF30E9BY5PR22MB1826namp_
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
Hi, <br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Can you provide any links or documents on how to set up LTP environment fro=
m scratch?
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am a novice at this and would like a more detailed explanation on how to =
proceed. Thank yo in&nbsp;advance.<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p style=3D"margin:0in 0in 0.0001pt; text-align:start; font-size:11pt; font=
-family:Calibri,sans-serif; color:rgb(32,31,30); background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-family:Titillium">Regards,&nbsp;</span></p>
<p style=3D"margin:0in 0in 0.0001pt; text-align:start; font-size:11pt; font=
-family:Calibri,sans-serif; color:rgb(32,31,30); background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-family:Titillium">Duc&nbsp;</span></p>
<p style=3D"margin:0in 0in 0.0001pt; text-align:start; font-size:11pt; font=
-family:Calibri,sans-serif; color:rgb(32,31,30); background-color:rgb(255,2=
55,255)">
</p>
<br>
</div>
</div>
</div>
</div>
NOTICE: This e-mail message and all attachments may contain legally privile=
ged and confidential information intended solely for the use of the address=
ee. If you are not the intended recipient, you are hereby notified that you=
 may not read, copy, distribute
 or otherwise use this message or its attachments. If you have received thi=
s message in error, please notify the sender by email and delete all copies=
 of the message immediately.
</body>
</html>

--_000_BY5PR22MB1826245B4D2C69C3553F0DDAF30E9BY5PR22MB1826namp_--

--===============0834559591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0834559591==--
