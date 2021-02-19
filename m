Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3B331F740
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 11:21:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E4C63C65C9
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 11:21:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4D50B3C4EF7
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 11:21:43 +0100 (CET)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390109.outbound.protection.outlook.com [40.107.139.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 65106140123E
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 11:21:42 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcQTZB1w1BrdiZKEEj602usiXeqfIoYG+u3J1G9voq1t5L7Yb83YGK3pwvDNMWFgaflFohnmYvdB1mf9xY9i4P6Ol57h7sEA33myApzu9aRvQJpGP5vyE/nmZT7J8qwSjykrpVXU9bjNqqLkRLvoD8+/Nyaj2dFdBmdiZbgE6440X8bt7GmDnXmk1xaLHLdIejDBEkddR0K/R6XYZXzOb87jG63tE8fD2/OzqHgRUwjUIg+WPo1ISgYxe8b9fWilT3F3iWSWRMMY4tlVu3UbAl+vA+skzbLzfir3xjM1vKaqMNuCKf677N2xGcv63i7goby1Yu6H2MohkeeG5OYcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8YMgYXPVNhw6hxwWyG17NW1m+MUbuCj8zhjUOLftO0=;
 b=EgP07l104IPAWyL9THaC/AtAqGR1oxFhPLVAXrYYh+A8HLisrF4zImHeTkpxL1qkmNfgEDIjtjMT/vyWYLS8OhcS8ikp8Es0oczrUZeMTqxLS2w/xuBQMPev8B2aIt8V9wI0U6PslHmKAoG3tlaKJU0o+HVJD56CgQd659mkaQzGnnqd0KXLECqUCcwvgztx6/V1Ff80SWCphh78vFF1aivba1m4hAH6+D7fxZ9OmI+o6nQ+R0mdQEEm6iwAEJXpqJns+bEt6poeEQMtj4KlExybBXRFpVae+0aTzomykO8kBhLy8i7u3FIfZhFnuUvBNuJAHhowUh6lS1uHuxdn/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8YMgYXPVNhw6hxwWyG17NW1m+MUbuCj8zhjUOLftO0=;
 b=VhZ5KHex2ht1tj7DLTLTrSe+tykHCNv/9qH2rEz7qPqQa1hxVjyTl0L69pktQpDR9AJmDOPIfDR69iLr5yyMIibHpK7Jxvx1zcmEYIq3FUHJLr+JwitXX/AZlNDnA1REyUMJDNPBrVrg8GiG4IH1e5KJFGKhC2EiT/JBxy9ZUZw=
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2f::22)
 by BMXPR01MB2471.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Fri, 19 Feb
 2021 10:21:36 +0000
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7069:eebb:c39d:f1e1]) by BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7069:eebb:c39d:f1e1%5]) with mapi id 15.20.3868.029; Fri, 19 Feb 2021
 10:21:36 +0000
From: "Pankaj  Vinodrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: LTP madvise06.c
Thread-Index: AQHXBqfppHt3eX81/0ybHWCxFOHImQ==
Date: Fri, 19 Feb 2021 10:21:36 +0000
Message-ID: <BMXPR01MB2870FA73C10D2EDB69D61050EE849@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9946849a-a04c-408f-560e-08d8d4c0238c
x-ms-traffictypediagnostic: BMXPR01MB2471:
x-microsoft-antispam-prvs: <BMXPR01MB2471470B3864CB05FEC2ED90EE849@BMXPR01MB2471.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7yz1s4Cq4kcrR0h1yJ3aECdwKhHbc8HmLu/CINtngqykMu7EF3ASWkYc6n/Ya86/WLPRGRZUtnPtI/sBEdgs/pk0iwtfnkcDXm8KW7Q78upCEEE8ZYk3NrDWwq+ffNy2TVGrk0CADs4wN0gfu83uj4ohlFpwTeKO7aO1sLzh74JZkWtwRul43DWI8rQiZlSgh0fWsSS2e9/QL/CzsA0XV5H5rzFX9vUWaNr8d0o1Ao4g77B5YGDHGF/G/z4BJ4IZUkfDHg/9TtetOALLA1npDhUX9QH9vvABcJw2PnXv2i3tIiQv8aFWkGfpsfjjZE71ENdDUOI57vLnKlj7H8/Q2vik10EmhOzJRO5bFBdunZa606XEn4PuhBtebj9SIen83xNdNh6iMUlTXFQ1W9UIzWffEgxbKSFX65FqEPdcq38NEaEAmLXOpPNtUSt3CBDkQBDlg9eR8IwhdxS138OkygIvU9idncdAPT59Tsc1PsHItR+GXF9jVncjGeCwJvK7n3WEAFIuhpMxUajDC8WGaw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(366004)(39830400003)(136003)(52536014)(91956017)(76116006)(8676002)(33656002)(186003)(558084003)(71200400001)(66946007)(316002)(478600001)(64756008)(66476007)(66446008)(66556008)(55236004)(6506007)(8936002)(26005)(19627405001)(2906002)(55016002)(9686003)(6916009)(83380400001)(86362001)(5660300002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?nfzJCPuOt+mVDgZfa8JywADQzZPyMNkgtno1D1FaZeAI+wx7uGX4+4k7sU?=
 =?iso-8859-1?Q?FIKoke+Sh2n6LsAYMcjbL6e6pOxX+Pcw2qFFCLGeHSIgGJCZIzzJvRcysG?=
 =?iso-8859-1?Q?OqpP2fNVfqFHSUcAnG61yriZJ/zV5RUSmNaHBaq827QKFCfireP8CmEW2u?=
 =?iso-8859-1?Q?MuE8buSK//Srq78Pvk6QqdfGY1t2MqKfCHxJhHZN7RqUQSOOQNr+RSe1e9?=
 =?iso-8859-1?Q?nRD0LUoEEYHxJeCSU55vUafyYzHyh7IgZllfdOH3M3u47E9p4Fo0AghsRc?=
 =?iso-8859-1?Q?tlRe0Sv12ZeIkITrEB4yUHUETyX2gZVBYGwHnJijdTsVHu2jHBaixwl9P1?=
 =?iso-8859-1?Q?Huznp8yVQIBOFlqSRQ+yulyGiUUSMnx9FKl8/EFlU9zeVa3C06sSobNbNj?=
 =?iso-8859-1?Q?JgQ7MjHlUGckLvHgvDMkXeOqJtryS+Y+sx+VRyp+9w9QZCuHy73LvEcQYP?=
 =?iso-8859-1?Q?RcJXbLKU6UrrP6qGm2DOisX6ZFBOkrP5HIIEBZYpF7VnyLd4nPOUXplPH/?=
 =?iso-8859-1?Q?JDMHuraF/FQFPk2xle4TX9cwjORdCYyRug3Wx90yDLghDhd0eBh5jaBKtm?=
 =?iso-8859-1?Q?rUxwZERyusoCbgJakErymAYlcuZS7k2u+th0Ar2JPyWOwdIjOFmMiSXbkt?=
 =?iso-8859-1?Q?IKzjCO+s+O2Uxpr9I3F2NSao9jLGvli0YsLfBVbVctS1fpXKz3bdiSLhXm?=
 =?iso-8859-1?Q?ICz1axjw4Zw7aLH2YqsK8edyQk/ZK9ptajsYdBwyJnura1GOJkcsSiqtI6?=
 =?iso-8859-1?Q?2EIafSJHbdSMCLIZZbazCWjxoW7FBVerUBZUFkLV7dvKCTkYCqXYCdrPvW?=
 =?iso-8859-1?Q?24/ritKgf79vKKTWrMmrs25bUdZYOFSKwZcEgg4OwJhEev8dmOytTcUfmO?=
 =?iso-8859-1?Q?TIE1JcVymfR6uaqeouFFSVQ0Y7kfBfFicAvQnk1XUwIgz9q0FHrReMAfHZ?=
 =?iso-8859-1?Q?Su9Ldf8wxrx/61MrXL6CGUe2VUp3O4TauzfIho882GXI3v6IGLIFy5piS7?=
 =?iso-8859-1?Q?4RbzADyBSvfMJDMI5EsiNLNxW8gB1g0UwETrKOY2EgkH0mtfINLZ4Wb7yV?=
 =?iso-8859-1?Q?LvtsVeGnJ+f3lS4haJIJYgvYoz/wDDk8T6nKqokg5rpM6ACuE7Pzq9OF4w?=
 =?iso-8859-1?Q?qsTc5m4MOAzESE1zRrJ933lpKvtKajAWdlcWleqCVIm9+YtHB9PAbh9C6v?=
 =?iso-8859-1?Q?tXfXBMh510M5T3rEOUqxBsc6rB0zc1mIxKOjJRRCXQVIK7nyLbpl8RiMAA?=
 =?iso-8859-1?Q?ZEkiOISKduosRwnmQYRgT5JrJ+Oo36bXz5Ze3WRum5Xwm/EOWYsTRWGl69?=
 =?iso-8859-1?Q?iDrVbQN+qBdfE+BQoVyTFcUkioGOfd2bfL3cHNE2eS04+5g=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9946849a-a04c-408f-560e-08d8d4c0238c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2021 10:21:36.6435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 68asqrGqw+z6pPWdUMNNRaSIfForEFLo6Is84SX0+S+HfHSi0XDFhOxr2/IHsEGyWfp9YNW9IcffHpYddI+Yww6QxQbfHV3+UX/8vVCAF3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2471
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] LTP madvise06.c
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
Content-Type: multipart/mixed; boundary="===============1543688634=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1543688634==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB2870FA73C10D2EDB69D61050EE849BMXPR01MB2870INDP_"

--_000_BMXPR01MB2870FA73C10D2EDB69D61050EE849BMXPR01MB2870INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am running madvise06.c but i am getting message madvise06.c:63: CONF: Sys=
tem swap is too small (838860800 bytes needed) can someone suggest if i can=
 increase size of swap and make this testcase work ??


Thanks!


--_000_BMXPR01MB2870FA73C10D2EDB69D61050EE849BMXPR01MB2870INDP_
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
i am running madvise06.c but i am getting message <b>madvise06.c:63: CONF: =
System swap is too small (838860800 bytes needed)</b> can someone suggest i=
f i can increase size of swap and make this testcase work ??</div>
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b></b><br>
</div>
</body>
</html>

--_000_BMXPR01MB2870FA73C10D2EDB69D61050EE849BMXPR01MB2870INDP_--

--===============1543688634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1543688634==--
