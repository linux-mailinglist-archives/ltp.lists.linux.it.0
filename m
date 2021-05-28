Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F593943E1
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 16:10:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 83D9C3C935E
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 16:10:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D68523C2DF8
 for <ltp@lists.linux.it>; Fri, 28 May 2021 16:09:56 +0200 (CEST)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390121.outbound.protection.outlook.com [40.107.139.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B7EF9600864
 for <ltp@lists.linux.it>; Fri, 28 May 2021 16:09:55 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzgrA42qGMhA1/2SFGpulxh6p5Rh3r4EVxOiyu3NyYY6r6ehyyMCB058GZ7QGcPGMBle1yYKL7Eeq/+rfrSPD/AYDbU5p2MFeqki8I1BuWVFzHTAt+chW2tPEIGlMBprkO6DIb6dThjbMR37qEpFnqpucpC9TD6f7JueLs9rnzq8VPN1wbMOEtFohQV2R0d8WUr3HVUZBs1suobUQm9Cjh43sa8b8NHzlI+27q9jUCD5FP7sUpqirkUb4BaSQCBHbKIp4U0F37BEFQ5YIJQEWBghUpUmMclm9VhoAMECkddBph3/IP43W9/P3c0hkZUsqhSNFQDNJg17KFhEJ17pZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq1rF5m48GZ41VimR5kcAyC6pwT2FhHEB0o6/xtOM3Q=;
 b=m2m4kHpad0+I7VwoRx/AcG52v2G3pDA/zhJUQVAIoTYnTKTDakKGlgs3VxoE5/u7ZUU0XoWs3wW03Jz9+VQ1awPhRtmxgPwFw8nwjyA7xXkoHk6oJxWGMt9UK2hE1m2hiuOlPK8y5wLinFuTr9T0E1QKEwKCEMOGavRioP7R4tuOY22ZbbdYTub3HSC1dsgpdppCUKiFuu92riw1rtggOs7bz85m3OyNH8okkPqF4By4xH7OgSVzU8egifzD7QGc83NM8CDv08sEfxkL+47u6PbzXzcBN35YvSyJ/7z/bmhhK7bq/DlYjk5DNY13zB2hSfOQ4po5n0LWFeNpvEXAkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq1rF5m48GZ41VimR5kcAyC6pwT2FhHEB0o6/xtOM3Q=;
 b=yDrl20Z1uUvLjsE/+L/SMifVu8uFuFHY8kUHQTEkb68BGiSX98F33+8mn2XsxJtXSiSLO156lnFqW4dzSFWTfPXG9ApsW3I42F743You1EPnPuN34h8O7AUhNTg358a2VeUJDj5/js8zlG595sbzNf5UPh9TpBmKeWsI5h7pjR4=
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2f::22)
 by BMXPR01MB4037.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:64::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 14:09:52 +0000
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bd48:bcd1:78ce:125b]) by BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bd48:bcd1:78ce:125b%3]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 14:09:52 +0000
From: "Pankaj  Vinodrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: Networking testcase failure
Thread-Index: AQHXU8lAQZswZgrvUUKJ4kNCGV9dEA==
Date: Fri, 28 May 2021 14:09:52 +0000
Message-ID: <BMXPR01MB28709F3E93557EBD46666858EE229@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [106.79.210.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4d0b156-6858-4c34-81d9-08d921e2434e
x-ms-traffictypediagnostic: BMXPR01MB4037:
x-microsoft-antispam-prvs: <BMXPR01MB4037CC2E3DB5B60F76E0224EEE229@BMXPR01MB4037.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QbYYZYTLita7K8fnlo3h1P4mofX1jn6ZMioHGVJB9YEBAxjBtgt49LI/wdG00XACwkUCWW7/MtD7BWjJBH5/LaZfOyTBBnodtSnJHQRS7BucLpMgy2WkPUlKDvuyjF1E91Uvfh+LWWQLJKVNvY5nsKmL7tD8Rsjeju7AuekeqiQeaVSUO4AGyUmpRPuNoJhEJaGaXkgZzzfanf+5sC9Xz3n+LTVQwY4bbFKAmHaJAedxgUViupA/UYsEpfEnN8DpBPwherECekQSkgSGWWrEAjP67bR4wdP39SnfpB8dbBjpoAezplaiZdGuriEtmyHzw9IexzzHIEkj27jT/z9cyCRzy5sa5ZjR0DEb0Qy0xXDTgPbTzhQ9SSTgQ99XRrqntElWNKPEIvgkylCaLPBNB37CX1pCYN9xGLOs0K09MphDuMqjjv3KlSIExFlAgAxCEyGvAGEW02BBFRXrpsaKL1oTElt62IKssTAXcPwGe7p2byw9Ypx9leKN2o2yWTtXqmuA5Bi6VXX4AEkPNwKZCpBCnjC4NZlDqfTvNU2+KH3PR+mya0MXRf1ORestIcNRfLy3YGxhXBnMbvfU1i1sn5c73JgU+DlSGjHD+6BaHp0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(39830400003)(136003)(376002)(346002)(396003)(66446008)(66476007)(66556008)(66946007)(64756008)(76116006)(122000001)(5660300002)(19627405001)(186003)(33656002)(52536014)(71200400001)(26005)(6506007)(9686003)(55236004)(7696005)(55016002)(3480700007)(86362001)(6916009)(83380400001)(478600001)(8936002)(7116003)(38100700002)(316002)(2906002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?1dtvODSiNG+7iSz2yAN8PjKaabH4IptHWonzqpsXfaCwie2q4h7AWLb4LD?=
 =?iso-8859-1?Q?DJjItdzmRdDSMKPylifsygmm/wFSJw/7ZTF0yeDFts1iiNUDlCHCuVs+Su?=
 =?iso-8859-1?Q?mzsl+57yfukSOOtUBtZNeWxmK6eA5ir1lXon8PcIJgTIRIiKhHiEx6q0fX?=
 =?iso-8859-1?Q?4oCDXxBthH+eUl7biw99Lufe/s4+EgiFgl5GNml2T7whsqXHX0WD+OZnZe?=
 =?iso-8859-1?Q?Sg+AQ19SnlctlapN2kNVnVHxWBNaxla4/tjuMSbW3E2teW+VisTCoqs8QC?=
 =?iso-8859-1?Q?vxgs01WIFyqPTEYvwu87kvV9OTwWr43hEO7mqGhxnw8wapXtJyzXj04cf4?=
 =?iso-8859-1?Q?1BsDyCaHswLocA6pCEcqUOAufa3nL854B/NcH7cN6tDT5TTGX0GHotrmmr?=
 =?iso-8859-1?Q?lTlK0W3f3kWhUXnz4suvTpm3pvGpCEagx723YwKdajDXaiQMO8i3KHLaor?=
 =?iso-8859-1?Q?5NDtnS9EFs6bxo9TKoOAnTGSkBs3O2RvAN7za9eYkARJqBK2vJyOvi/zgY?=
 =?iso-8859-1?Q?McwzilINsXEt2A24teXjkzC5WlMwNo2WRRoc03Q6oSbNcUduRytZOHwctm?=
 =?iso-8859-1?Q?E/4AaIcI4rqlGyJlVqmAAnPOGvKtmtEKwDZ52wkzF9gKLxlN8yHTR7gfD5?=
 =?iso-8859-1?Q?c4tORBkDTzUTlJbixR6f4SMokWEaKwCN+ulqKud0m/JpD/SXA7fUYhtjRZ?=
 =?iso-8859-1?Q?8ylw9iMurzoQQheuPYuuiY26uY5qoBM3J1K+NQD2coXEcZvJ3ciRIBOjOt?=
 =?iso-8859-1?Q?9PgBpdDhA8csB82crxRMrHrWQhXqwaCxyYIoVVMlgKd5DhNXSI8peCM5Cw?=
 =?iso-8859-1?Q?YhtIPISMbOmR/0GuFPN6RzjCeMdMAcrdRlBxDQDYQ/ZBA34vhdS97xIH7+?=
 =?iso-8859-1?Q?8BjyQDSd0omsUCk5dwHsDyrUfXyz88F6ZMqo3EHkgrIOAEaPTdaTiJQJl2?=
 =?iso-8859-1?Q?/CEoEXvEpX1FESbr8FLP7tJ1XKKX6mFKK2lnDOzYUx/6g/RgKKF+q8YNGh?=
 =?iso-8859-1?Q?Sqp6Us/Br+XiAcZRTi7h14bS9qyjRiL/DzzOZlJ3GoqA7prp93mS0rVR9Y?=
 =?iso-8859-1?Q?7mMU8ewqvR/4Z8SM+tYvK/gwIQVmrF0KtqAMCyRiNlrw7houUlMx6laZDr?=
 =?iso-8859-1?Q?82XdO6C+0BXXyov4PRib1+2CVIa8NTMeWfwGzETYxjBNUD4dd+tM88jyVG?=
 =?iso-8859-1?Q?kfZ5SAT3agK1y5CKvt43I7cloqYStBFUofX6Ldwv3OWkqwv1SbBITUxKvF?=
 =?iso-8859-1?Q?CpncmynIgqEOpJkt907VEj0PZ5/QxeInSf1grl082eAEqpfj6UwMJ62yWU?=
 =?iso-8859-1?Q?SOfVuxKZewFQKllLFa8wsdWvFzkPkdGfcNmCvgfhkqSRsOA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d0b156-6858-4c34-81d9-08d921e2434e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 14:09:52.3300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7JMjwIItlbeYy3fXcVbOfKjC+5ut+gE1wg0soV31XDFTZpra6ic6aJ0e0DgfWTKQXpD5jx0GHF6RaUGkE+4ehAJALACwEn3bJGREmOeAcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB4037
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] Networking testcase failure
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
Content-Type: multipart/mixed; boundary="===============0271721412=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0271721412==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB28709F3E93557EBD46666858EE229BMXPR01MB2870INDP_"

--_000_BMXPR01MB28709F3E93557EBD46666858EE229BMXPR01MB2870INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am running ltp on kernel 5.10.19 custom kernel with LTP version 20200515 =
but following networking tests are getting failed.

I have enabled following kernel configs w.r.t. network tests

CONFIG_VETH=3Dy
CONFIG_MACVLAN=3Dy
CONFIG_TUN=3Dy
CONFIG_TAP=3Dy
CONFIG_VETH=3Dy

1) netns_netlink

proc/cmdline
earlycon=3Dsbi earlycon=3Dsbi root=3D/dev/mmcblk0p3 rootwait console=3DttyS=
IF0 console=3Dtty0

Gnu C                  gcc (GCC) 10.2.0
Clang
Gnu make               4.3
util-linux             2.36
mount                  linux 2.36 (libmount 2.36.0: btrfs, namespaces, asse=
rt, debug)
modutils               27
Linux C Library        > libc.2.32
Dynamic linker (ldd)   2.32
Linux C++ Library      6.0.28
Procps                 3.3.16
iproute2               iproute2-v5.7.0-77-gb687d1067169
iputils                'V'
/opt/ltp/ver_linux: line 115: ethtool: command not found
Sh-utils               8.32
Modules Loaded         snd_timer snd sha1_generic hmac dummy veth overlay n=
tfs btrfs blake2b_generic xor zstd_compress lzo_compress zlib_deflate raid6=
_pq xfs libcrc32c ofpart cmdlinepart spi_nor drm fuse drm_panel_orientation=
_quirks

free reports:
              total        used        free      shared  buff/cache   avail=
able
Mem:        8159408       84208     7874656       50964      200544     794=
4964
Swap:             0           0           0



netns_netlink    1 TCONF :  netns_helper.h:48: Failed while obtaining versi=
on for iproute check
netns_netlink    2 TCONF  :  netns_helper.h:48: Remaining cases not appropr=
iate for configuration


2) netns_breakns_ip_ipv4_ioctl
3) netns_breakns_ns_exec_ipv4_ioctl
4) netns_breakns_ns_exec_ipv6_ioctl
5) netns_comm_ip_ipv4_ioctl
6) netns_comm_ip_ipv6_ioctl
7) netns_comm_ns_exec_ipv4_ioctl
8) netns_comm_ns_exec_ipv6_ioctl

Failure log:-

/opt/ltp/testcases/bin/netns_helper.sh: line 71: [: too many arguments
/opt/ltp/testcases/bin/netns_helper.sh: line 75: [: too many arguments
ifconfig: bad address '192.168.0.2/24'
netns_breakns_ip_ipv4_ioctl 1 TBROK: adding address to veth0 failed
<<<execution_status>>>

Can someone help me what could be the reason behind failure of all ??


Thanks


--_000_BMXPR01MB28709F3E93557EBD46666858EE229BMXPR01MB2870INDP_
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
<span style=3D"font-size:12pt">Hi,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"font-size:12pt">i am running ltp on kernel 5.10.19 custom ker=
nel with LTP version 20200515 but following networking tests are getting fa=
iled.</div>
<div style=3D"font-size:12pt"><br>
</div>
<div style=3D"font-size:12pt">I have enabled following kernel configs w.r.t=
. network tests</div>
<div style=3D"font-size:12pt"><br>
</div>
<span style=3D"font-size:12pt"></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
CONFIG_VETH=3Dy</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
CONFIG_MACVLAN=3Dy</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
CONFIG_TUN=3Dy</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
CONFIG_TAP=3Dy</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
CONFIG_VETH=3Dy</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>1) netns_netlink</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
proc/cmdline
<div>earlycon=3Dsbi earlycon=3Dsbi root=3D/dev/mmcblk0p3 rootwait console=
=3DttySIF0 console=3Dtty0</div>
<div><br>
</div>
<div>Gnu C &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gc=
c (GCC) 10.2.0</div>
<div>Clang &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </div>
<div>Gnu make &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4.3</div>
<div>util-linux &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2.36</div>
<div>mount &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;li=
nux 2.36 (libmount 2.36.0: btrfs, namespaces, assert, debug)</div>
<div>modutils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 27</div>
<div>Linux C Library &nbsp; &nbsp; &nbsp; &nbsp;&gt; libc.2.32</div>
<div>Dynamic linker (ldd) &nbsp; 2.32</div>
<div>Linux C++ Library &nbsp; &nbsp; &nbsp;6.0.28</div>
<div>Procps &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3.3.16<=
/div>
<div>iproute2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iproute2-v5.=
7.0-77-gb687d1067169</div>
<div>iputils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'V'</di=
v>
<div>/opt/ltp/ver_linux: line 115: ethtool: command not found</div>
<div>Sh-utils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8.32</div>
<div>Modules Loaded &nbsp; &nbsp; &nbsp; &nbsp; snd_timer snd sha1_generic =
hmac dummy veth overlay ntfs btrfs blake2b_generic xor zstd_compress lzo_co=
mpress zlib_deflate raid6_pq xfs libcrc32c ofpart cmdlinepart spi_nor drm f=
use drm_panel_orientation_quirks</div>
<div><br>
</div>
<div>free reports:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total &nbsp; &nbsp; &=
nbsp; &nbsp;used &nbsp; &nbsp; &nbsp; &nbsp;free &nbsp; &nbsp; &nbsp;shared=
 &nbsp;buff/cache &nbsp; available</div>
<div>Mem: &nbsp; &nbsp; &nbsp; &nbsp;8159408 &nbsp; &nbsp; &nbsp; 84208 &nb=
sp; &nbsp; 7874656 &nbsp; &nbsp; &nbsp; 50964 &nbsp; &nbsp; &nbsp;200544 &n=
bsp; &nbsp; 7944964</div>
<div>Swap: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0</div>
<div><br>
</div>
<br>
<br>
<div><b>netns_netlink &nbsp;&nbsp; 1 TCONF :&nbsp; netns_helper.h:48: Faile=
d while obtaining version for iproute check</b></div>
<span><b>netns_netlink &nbsp;&nbsp; 2 TCONF&nbsp; : &nbsp;netns_helper.h:48=
: Remaining cases not appropriate for configuration</b></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
<span><span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
2) netns_breakns_ip_ipv4_ioctl
<div>3) netns_breakns_ns_exec_ipv4_ioctl</div>
<div>4) netns_breakns_ns_exec_ipv6_ioctl</div>
<div>5) netns_comm_ip_ipv4_ioctl</div>
<div>6) netns_comm_ip_ipv6_ioctl</div>
<div>7) netns_comm_ns_exec_ipv4_ioctl</div>
8) netns_comm_ns_exec_ipv6_ioctl</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(200, 38, 19);"><b>Failure log:-</b></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b><br>
</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>/opt/ltp/testcases/bin/netns_helper.sh: line 71: [: too many arguments
<div>/opt/ltp/testcases/bin/netns_helper.sh: line 75: [: too many arguments=
</div>
<div>ifconfig: bad address '192.168.0.2/24'</div>
<div>netns_breakns_ip_ipv4_ioctl 1 TBROK: adding address to veth0 failed</d=
iv>
<span>&lt;&lt;&lt;execution_status&gt;&gt;&gt;</span><br>
</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Can someone help me what could be the reason behind failure of all<b> </b>?=
?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b><br>
</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b><br>
</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks<b><br>
</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b></b><br>
</div>
</body>
</html>

--_000_BMXPR01MB28709F3E93557EBD46666858EE229BMXPR01MB2870INDP_--

--===============0271721412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0271721412==--
