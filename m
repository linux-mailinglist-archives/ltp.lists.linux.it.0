Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A61C2E1BCE
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 12:24:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9A783C322B
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 12:24:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4E7A23C23E1
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 12:24:25 +0100 (CET)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390120.outbound.protection.outlook.com [40.107.139.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4F1E61A013AA
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 12:24:24 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhjh+a/i5Av8VXnVzNBynqZ33S/i/zzmhmXvHbpArw1WRa15IkJAQfyD8mNR0H07n+SDHJV/6da0uLBm6ARLlQ++dV8EoDkFS0Mu4rW7HkJkYiFw0rE9O2z2KBbtkT5Se4isn9HaOTNT18JtaxncabXyKuLsDL8rw9j+etFq1qMSXZWLibpbkqWRmMRVplVNfNFe0xgVUFDPSsiIfz+BP6+XXJZYpWcE3W9Je7pwgOYBcjBeISqqMkBHWSmuPvRffibqEsu42180fC1rIvjNzHw0tVPTNOGEPb/0Mb2kMw5ETR6Z6cyEIDA2pYZrpslUr7Ps55QJK6skxUO5huWtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2H7h8EC0LjlJqjIWcWYOM3Xn4Yz95FEjSOfYiJEYvE=;
 b=kFNuelsft0o+WjboA7jlhbd1nG4PKlMmvlWH++E8acvh2xPcf1F8W84So3Cic6LFy4GTVb4mte2d8PkiVzfcM5Z5slmSdxapV5SUoQ89X2OvFzT+7Fn+KkTc8qFd/NKPZyCy/HCnXrZbltZEBKrgXnQu4Tf6oZv1WA0Lo7LABqHUqtBjyX8vEOMPBzgcEM9RZ9vppsVzaY8KL5k52xH4ls97Y4jrhshPj1NCr5Dt5Qc2e0tQ7DNxXUrSM0UXQYC8iUKL5qrVnurA/j06o7Upjnn9/CCvmuM5UgOMbD/0WYU8lbWmNc3J9CqQLrdx3EkhMXBc67M/zhuloyH5GCGhKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2H7h8EC0LjlJqjIWcWYOM3Xn4Yz95FEjSOfYiJEYvE=;
 b=2bW6RNtw15OLoP8OG9VCs9Q4bVw4E6/R62owIjeuT7VrQEjmnGAHVcReisq9nIyuo9LYdIvp91PEmGk49hGjJfPvGPj9MVaHPPsJKyEPPMw6q8ydaumHIIRCBEP+99g3brHTYQC8VLkCkPEEX9PNejIqIaFLUAwxw26V3RAS0x8=
Received: from BM1PR01MB3825.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:6c::15)
 by BM1PR01MB3955.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:6d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Wed, 23 Dec
 2020 11:24:21 +0000
Received: from BM1PR01MB3825.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3cef:d382:53f0:1445]) by BM1PR01MB3825.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3cef:d382:53f0:1445%7]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 11:24:21 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: Query: LTP CVE test cherry picking 
Thread-Index: AQHW2R1eiZzC5HALUEeymFDhLwxYlA==
Date: Wed, 23 Dec 2020 11:24:21 +0000
Message-ID: <BM1PR01MB3825BDAFB8CB55CA9C46F1D8EEDE0@BM1PR01MB3825.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 155fe71b-7059-45d1-12fd-08d8a7354baf
x-ms-traffictypediagnostic: BM1PR01MB3955:
x-microsoft-antispam-prvs: <BM1PR01MB39551BBFC961CA901F238371EEDE0@BM1PR01MB3955.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YwE+9j5JbfQlWyHgkOjx7bM1LXdNVG3CoGDMx5b1VJCEqyHQuY6MJofoyz5TGeKfHeYjANd0GwMRMsp1T1SknwsW9gbpEdPverrARyfpVgAfACSy2Yg0B7+33rln59vKpvZ1CqJhi1taipY1ldgMQFmdkdcq9p4RJiajwwx5qR6ETjvsvFVN/AQhwHXbOihc0JjnHSxzGD8wIRlqnoL/X3Ss/tTTI+FhOCi8EJey6YJENLY8PZnVK8Bk8uh4vd7ZLIoNcc/6c2jYYS3VmUudW/kuobeFu9T/gakVha6yfsaOSmw3cQL0V7uBtI6vel1uG1nnmEOIp7OZ+jko8XkZOHHgyE9yY0I/tcI4B7h/yPvejW0FMeiTBhg3W0lWHTwLETfjP66ioL3RBwraMdoCBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BM1PR01MB3825.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(376002)(39830400003)(136003)(9686003)(55016002)(6506007)(55236004)(33656002)(478600001)(5660300002)(8936002)(7696005)(186003)(6916009)(8676002)(4743002)(558084003)(52536014)(26005)(66946007)(2906002)(66556008)(86362001)(19627405001)(71200400001)(316002)(76116006)(64756008)(66476007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?vRJrs5N1OLbyZHqVKkCAEQP0vW5e0G89xESmVePGoHyctV7M7BuP4E92He?=
 =?iso-8859-1?Q?NK9BygiqkgE1Tb0tHEiDeMhJpb/LVyl5b9BRZgNYTwwiFWm/FpCjpf2BYo?=
 =?iso-8859-1?Q?DbXQqqY9/NkeS6vk8xnaHo/WqJgjpy0VEk93tR5tSt4pnRwtcSEHB+dMUM?=
 =?iso-8859-1?Q?LX1kTf9Bb6BhTP84I8emaJLWTaG0sX+n275vxufC8l7LnIjjmyN1zOGXD0?=
 =?iso-8859-1?Q?SzqUIFlzyodP2ldKkkCWAer4frSGn70/BrYr2RMgQPB81hfEStAAHD7bm7?=
 =?iso-8859-1?Q?o0/lqsuW6CSdlFrJr2ZJFdx7bkeVAb3/gmzziFg5wZyEg1pNfe7+zBitwS?=
 =?iso-8859-1?Q?rxZzhXb1hJs4eChU0+riW2iYpqLCVPDq9CHSMwWbqHTXHe5oJxVdgCFSaq?=
 =?iso-8859-1?Q?JpvVbLNDNbMzAp2qKLm3QVqb/Buum+nUqzuqQdQnV6xM+8J9AXNIbIPYDV?=
 =?iso-8859-1?Q?244wlOCw1nb6YSlFP7Y8uQ0QGmHhokzAfsGQ3U7Yy7OaUmGirS+1M7DC/c?=
 =?iso-8859-1?Q?flYhS0CAA2mDXmP5WtidsznWzV6OItL/1MqUWz+0EMUjbbJ09w8qozon9P?=
 =?iso-8859-1?Q?3v29clyWxvBcD8fetOy7SSI1Jkm0F0Lg5Pd0IErBcy5Qx07agDwZWbpHHP?=
 =?iso-8859-1?Q?7DUOfONM0Iepcg67jPJ5RtVXE5wNF235pBapru4i5X+OMJglAJr1Ts7fqd?=
 =?iso-8859-1?Q?PNoJmVBQ+vec5StSMgrYUI+luMN4qZ2BDF8+oXMm7kfrRjxoOUowwhxYzG?=
 =?iso-8859-1?Q?ef15L1risKyiv9BKA0hqW7Cku0USpT4FCy4lMepn7VT/+cBzUBm8pXdw5S?=
 =?iso-8859-1?Q?IunUhqmwA5SDDpNWgXZE5irj7GkXye1hnslPvT7NseGjy4fP4u6O88uGH4?=
 =?iso-8859-1?Q?Cu9hwkDUWOqWx6OOgig6tpuxgPEpU4UP+jI9WKaA1y1FlloqudZAvYoIuy?=
 =?iso-8859-1?Q?We3VsIjV74D/t0xhLszz4kcs21EakMB9wtUC6UBtUuXwGA98DPIzEZvT2+?=
 =?iso-8859-1?Q?ZWPsm0AgoOAlVO2mI=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB3825.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 155fe71b-7059-45d1-12fd-08d8a7354baf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 11:24:21.6715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vj9nNt4QdHqf7j19fLjbEng+AtjmtfqpnqdrhVw/lpLEscsFN7zMIpPoycQWe2fgHEtO4MOX/tdPD+Kq3XR8QOMHZwz+CWHKzIwvGqRGBhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3955
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] Query: LTP CVE test cherry picking
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
Content-Type: multipart/mixed; boundary="===============1759072960=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1759072960==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB3825BDAFB8CB55CA9C46F1D8EEDE0BM1PR01MB3825INDP_"

--_000_BM1PR01MB3825BDAFB8CB55CA9C46F1D8EEDE0BM1PR01MB3825INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I know LTP covers CVE tests but i want to know does LTP covers all CVE test=
s, how  LTP cherry picks it ??


Thanks!

--_000_BM1PR01MB3825BDAFB8CB55CA9C46F1D8EEDE0BM1PR01MB3825INDP_
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
I know LTP covers CVE tests but i want to know does LTP covers all CVE test=
s, how&nbsp; LTP cherry picks it ??</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks!<br>
</div>
</body>
</html>

--_000_BM1PR01MB3825BDAFB8CB55CA9C46F1D8EEDE0BM1PR01MB3825INDP_--

--===============1759072960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1759072960==--
