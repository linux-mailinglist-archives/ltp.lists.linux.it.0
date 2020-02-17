Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A51609E3
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 06:25:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 524D33C245C
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 06:25:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2A40A3C13DF
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 06:25:01 +0100 (CET)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390117.outbound.protection.outlook.com [40.107.139.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A01161A00E15
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 06:25:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvHdEmXnyw4KAVE8X0TT54xDFO3JpQ9g2luzXdePbbC7gkPQWqWIiGAygVkdsD2SeHoSfFoEthpcv8SUXX1n4o4wQpPANoVRze1hF37n1gkayVlYdSmBSvCCUAGRTUUhgsFLSWr89nSNBJ9I/ag9UgZrFEVEnLipfp0XEzba94+/UF4ajzVhy0I0EoZBghfeq6xk1xCU+o25fsNFc+P7Dz4dRw4iVJugVE2I0Ec0tL4l1tNpDm5q03k6+5V55WPrCQfkW310/hBmq/0cF3o2nsH9nv8fn9CDBzh1/9DtYQCdNZlpufNVmmhFZPQJt7pAXmBjpP31IhMskR8uF/APUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpQ7BW7eF/9MTSwu0Y2OU4ydtSGY3jOfXLpyVszu3KY=;
 b=mkCT4NFlIlNYwA2BKGMfG8U8vQvhR5oV63jIJWia0AjSTMF8zY0j9/yOXyDNZERhynLHN5Me+4KI/OBLAUijTFQ9qGB3RlKH4NRU6eA4yojjcOTt5DxCgIUn47JAY7CkhCN3U1H/fW59QrQVFDuuGSj7itYyiCXE87rXnaAf/AoJTejmx/RtevPEsjR6tBFr0QN3TUhvuys6OpO4uzyxMdCzCPAfNvUpgfVWw7zPuRb9fSQZVbn+XdMQyl9xIYZtIVissoLHZVNfZxR91WgSz+EVLi7zbxGbPC/jU6WNVE3naqnlDAdge4O2oVjlLM3Z7qmsW87qoB5XOu+ZrHbGIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpQ7BW7eF/9MTSwu0Y2OU4ydtSGY3jOfXLpyVszu3KY=;
 b=mPwEyrN+ypgoqHhiCKen5j8fe/ass8YUMFsO8XiR4C9gBlyx9xcq20KSXkRSHaPi6lsIBgfjSFoJ3aTB14Uksd3wRretqmGgtp9Wfn3blOMWSGgNAjWsbOB6XkJUWv4FLsu7CeTa/PEvMN9GxkF+jWR1DOweuJ3eB6c0jOSKVog=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1180.INDPRD01.PROD.OUTLOOK.COM (52.134.128.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 05:24:57 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3066:1c66:a39:1bf8]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3066:1c66:a39:1bf8%6]) with mapi id 15.20.2729.032; Mon, 17 Feb 2020
 05:24:57 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: Networking test failing
Thread-Index: AQHV5U8OBaUZtZhsmk2x+zlBnxCeVw==
Date: Mon, 17 Feb 2020 05:24:57 +0000
Message-ID: <MAXPR0101MB146826599C0BAB5162CFDD3FEE160@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae80f2dc-e06d-4cef-930d-08d7b369ba1b
x-ms-traffictypediagnostic: MAXPR0101MB1180:
x-microsoft-antispam-prvs: <MAXPR0101MB1180ACEA51CC00310FB5DC60EE160@MAXPR0101MB1180.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(366004)(346002)(39830400003)(376002)(189003)(199004)(76116006)(19627405001)(52536014)(5660300002)(66946007)(66476007)(66556008)(64756008)(66446008)(7116003)(508600001)(81166006)(81156014)(8936002)(71200400001)(55236004)(26005)(6506007)(6916009)(2906002)(186003)(55016002)(316002)(9686003)(3480700007)(8676002)(86362001)(33656002)(7696005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1180;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: djEQ1hSN6Suvxj4Hd/vZcpqmCIDtglESuTa6p/PT22M8nFPG9/baz52dueazP6FvhUeFYyokZ8XUCcAZ1vuDwEJEh+QYtwzSsnPzAHPtoNGl5Zj6lpJjrj2Ea2z+4XDJUWd2S5xdkcuqLjiThF/HzQBeacobNZDA2PJuxjiXkmFWO6q7g9wAIjaWf3v3OzS1ztSs5weEFCQ6UlorB++THiAoqZ+0agclGTVp0QrSgso8vWQe0bkXvofrQpYpv3vyo1xM/HoIB3/wodNuLZ5iI8mqW19HyGJ5sSmfM99ZEG1A+S+DXertJ65ejpdkN6rMYa19NE4/Qi3+cdXtIM0aOfUKyCiH8t961wF7qsVcu/NaOEEA0SQ/4Hr5AQDlerUpZ0xFgKuoWXFf9jG+707ZVyC5oyt2M1vwxo5R75Po9L3LO/Y/pZF2sbXbp+G3nEIU
x-ms-exchange-antispam-messagedata: VUrv2RazVT1DS1bm+5RREfMRQ35l5OmY1rL6gQcZ5vkRfdLQcTM+HwMDrhJjnvYYYJwIPnrl2nRKcCygSFQN7b0/OGx1m2iESEYRLHVQsk6dcsulV6qyBl2dbd8BXAwziixD2XVqubXPw7/GhiFtTg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae80f2dc-e06d-4cef-930d-08d7b369ba1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 05:24:57.0362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pqyxeWKZwkxBHBkKPV0m7jXjTXxEAKb8rmTXwsojBnpdf4Qmco/SCZKxpGVYNvvvXZqSWWL+wP5HU5sBYvpwsRoU6RudxZj4lj/vP/n+vVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1180
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] Networking test failing
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
Content-Type: multipart/mixed; boundary="===============1796309041=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1796309041==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB146826599C0BAB5162CFDD3FEE160MAXPR0101MB1468_"

--_000_MAXPR0101MB146826599C0BAB5162CFDD3FEE160MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am running ltp test when i checked log files i found following errors in =
networking tests. I am not getting how to run these test individually????

netns_netlink    1  TBROK  :  netns_netlink.c:143: system() failed
netns_netlink    2  TBROK  :  netns_netlink.c:143: Remaining cases broken

netns_breakns_ns_exec_ipv4_netlink 1 TBROK: unable to create veth pair devi=
ces
Cannot find device "veth0"

I am attaching log file report

netns_netlink                                                       FAIL   =
    2
netns_breakns_ns_exec_ipv4_netlink                 FAIL       2
netns_breakns_ns_exec_ipv6_netlink                 FAIL       2
netns_breakns_ns_exec_ipv4_ioctl                   FAIL       2
netns_breakns_ns_exec_ipv6_ioctl                   FAIL       2
netns_breakns_ip_ipv4_netlink                          FAIL       2
netns_breakns_ip_ipv6_netlink                          FAIL       2
netns_breakns_ip_ipv4_ioctl                              FAIL       2
netns_breakns_ip_ipv6_ioctl                               FAIL       2
netns_comm_ns_exec_ipv4_netlink                    FAIL       2
netns_comm_ns_exec_ipv6_netlink                    FAIL       2
netns_comm_ns_exec_ipv4_ioctl                         FAIL       2
netns_comm_ns_exec_ipv6_ioctl                         FAIL       2
netns_comm_ip_ipv4_netlink                              FAIL       2
netns_comm_ip_ipv6_netlink                               FAIL       2
netns_comm_ip_ipv4_ioctl                           FAIL       2
netns_comm_ip_ipv6_ioctl                           FAIL       2
netns_sysfs                                        FAIL       2


How i can resolve these errors please guide me how these tests needs to run=
 and from which path.

Thank you








--_000_MAXPR0101MB146826599C0BAB5162CFDD3FEE160MAXPR0101MB1468_
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
<span>i am running ltp test when i checked log files i found following erro=
rs in networking tests. I am not getting how to run these test individually=
????<br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span><br>
</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span>netns_netlink &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;netns_ne=
tlink.c:143: system() failed<br>
</span><span>netns_netlink &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;netns_n=
etlink.c:143: Remaining cases broken</span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span><br>
</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span>netns_breakns_ns_exec_ipv4_netlink 1 TBROK: unable to create ve=
th pair devices<br>
</span><span>Cannot find device &quot;veth0&quot;</span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>I am attaching log file report</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span>netns_netlink &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; FAIL =
&nbsp; &nbsp; &nbsp; 2 &nbsp; &nbsp;<br>
</span>
<div>netns_breakns_ns_exec_ipv4_netlink &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; FAIL &nbsp; &nbsp; &nbsp; 2 &nbsp; &nbsp;<br>
</div>
<div>netns_breakns_ns_exec_ipv6_netlink &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; FAIL &nbsp; &nbsp; &nbsp; 2 &nbsp; &nbsp;<br>
</div>
<div>netns_breakns_ns_exec_ipv4_ioctl &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; FAIL &nbsp; &nbsp; &nbsp; 2 &nbsp; &nbsp;<br>
</div>
<div>netns_breakns_ns_exec_ipv6_ioctl &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; FAIL &nbsp; &nbsp; &nbsp; 2 &nbsp; &nbsp;<br>
</div>
<div>netns_breakns_ip_ipv4_netlink &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; FAIL &nbsp; &nbsp; &nbsp;=
 2 &nbsp; &nbsp;<br>
</div>
<div>netns_breakns_ip_ipv6_netlink &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; FAIL &nbsp; &nbsp; &nbsp;=
 2 &nbsp; &nbsp;<br>
</div>
<div>netns_breakns_ip_ipv4_ioctl &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FAI=
L &nbsp; &nbsp; &nbsp; 2 &nbsp; &nbsp;<br>
</div>
<div>netns_breakns_ip_ipv6_ioctl &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FAIL &nbsp; =
&nbsp; &nbsp; 2 &nbsp; &nbsp;<br>
</div>
<div>netns_comm_ns_exec_ipv4_netlink &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;FAIL &nbsp; &nbsp; &nbsp; 2 &nbsp; &nbsp;<br=
>
</div>
<div>netns_comm_ns_exec_ipv6_netlink &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;FAIL &nbsp; &nbsp; &nbsp; 2 &nbsp; &nbsp;<br=
>
</div>
<div>netns_comm_ns_exec_ipv4_ioctl &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FAIL &nbsp; &nbsp; &nbsp; 2 &nb=
sp; &nbsp;<br>
</div>
<div>netns_comm_ns_exec_ipv6_ioctl &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; FAIL &nbsp; &nbsp; &nbsp; =
2 &nbsp; &nbsp;<br>
</div>
<div>netns_comm_ip_ipv4_netlink &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; FAIL &nbsp; &n=
bsp; &nbsp; 2 &nbsp; &nbsp;<br>
</div>
<div>netns_comm_ip_ipv6_netlink &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FAIL &nbsp; &=
nbsp; &nbsp; 2 &nbsp; &nbsp;<br>
</div>
<div>netns_comm_ip_ipv4_ioctl &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FAIL &nbsp; &nbsp; &nbsp; 2 &=
nbsp; &nbsp;<br>
</div>
<div>netns_comm_ip_ipv6_ioctl &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FAIL &nbsp; &nbsp; &nbsp; 2 &=
nbsp; &nbsp;<br>
</div>
<span>netns_sysfs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;FAIL &nbsp; &nbsp; &nbsp; 2 &nbsp;&nbsp; </span><br>
</span></div>
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
<span>How i can resolve these errors please guide me how these tests needs =
to run and from which path.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>Thank you<br>
</span></div>
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
<span><br>
</span></div>
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
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_MAXPR0101MB146826599C0BAB5162CFDD3FEE160MAXPR0101MB1468_--

--===============1796309041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1796309041==--
