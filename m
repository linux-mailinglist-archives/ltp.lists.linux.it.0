Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FD6262A6B
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 10:35:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47B5E3C2E28
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 10:35:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E7AD53C2C0E
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 10:35:16 +0200 (CEST)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390105.outbound.protection.outlook.com [40.107.139.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6417060035F
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 10:35:15 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isxg4Wp4EH09S+kYEy/fdv7GnelNDt3wR3qmLZxgc0TTVs8l4vUFEs3gE9Fd4S0+1X/zvBa7xi6SmqDBAwmP+g2FGFFF7phSxyaBU7YNw+yfPYEtYoCSo3otptZrV8zA5JGFhNLeTjRuwn3FeG5tRskHj68aKi3bPCP7+dRKu1xtskuimHvFs6Uotq5+YIley902He8nt99ribVvebhx9Up5jr7KaSkFswX50Jg6iWPh9bfX+UKaryKWng7d+ecnj/oiUmiPOTpuH8das3NXi1PY8R3ZIcw321lzXnEp10YDJj5HsSVmnU9BLHETLIApHP7vEdb/HDX4SlfmVwU0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYEFz2rc2U3ia0Os4ytGcYMIUDnvwMFglaYCih4J8LE=;
 b=ofiPeXJIQZifpwZGFl+qbMqd74PQplOLsm3ROVPCo+Bh2UumcIh0ia76grRAeIixdJdT87VRrdyFZpYRA0Hk2q9owjpz2Updh0JXmK+vJtNVAUkhhjrnYAFt6VJitI8b+GDIDRCdpaceckPJwjCEN0M8RYgyq3/YUN1UpIIgiCi6wK5gWSal65SysjkIVdkHbm9jkZacQRG2PlIBv0FgK5qk1z4vMpXiMO8Hpvjwhi7vDUOwZAiA85g6I7eXdVjJfLQ6+d7665gtdFlvszbky9dO+NKF/ClZD0ghEYzK8pjI9QupVnFbZ6UVqJGXkNVIUjG2tDYSBXe1Zt2oDNGiOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYEFz2rc2U3ia0Os4ytGcYMIUDnvwMFglaYCih4J8LE=;
 b=otkFtx8G37qvaYqsuOEn7Xmi7QhqWFhWmbQigavFRXLdkIMIpf2HJQl79LgobS0NUKoeeiCvSVNnGgDgqTwsnXwXG7QFo8Tlf9O7yXQlto8mM21unRB93YYKVZhpUgHCLnAzsLS8yc+3FOAO1BrwjaYXBprycBvdcRI9B5tv8z0=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BM1PR01MB3908.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:77::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 08:35:10 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a5b2:8c66:c439:2d46]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a5b2:8c66:c439:2d46%5]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 08:35:10 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: Error with cpuset_inherit
Thread-Index: AQHWhoKZ2w8FT52Wy0GEKiPLdR/6Zw==
Date: Wed, 9 Sep 2020 08:35:10 +0000
Message-ID: <BMXPR01MB234415DBFA9A047126CABB85EE260@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [49.35.34.237]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6916a2ec-4f8c-43aa-979f-08d8549b4383
x-ms-traffictypediagnostic: BM1PR01MB3908:
x-microsoft-antispam-prvs: <BM1PR01MB3908F0B49A98EF98446E1789EE260@BM1PR01MB3908.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y6UA2o2eIEe69jXjG4fR10tzqrHYcnZJ2q5/GRs9VuvrVxay7w7t7Jw8OSPI0c6moRSwPbL8FhL43ZNz5aiMWp8pfs60a+9epcsFUZxNGaRTX0IX/lh3Fy7qZIpSQimP0Aeep1YUcA7AFzP+1vdxZ+UTOysf9aJ23i3LnLeznOOMOrbbRFediMlPtFViELMaNufQUzXvXLWt2HHrcCepyOwuGTEqx0JFIHN+97aRvXIDhWzCKm/tw0UuQY0cMlccMXrkmSadzWbgeiDLUQZqQgN0H/Wy8vpa2y1HCvA4E6BpTrUrdwEn7i8ohs3vnPxC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(39830400003)(136003)(366004)(396003)(376002)(346002)(64756008)(7116003)(66556008)(66476007)(26005)(2906002)(19627235002)(6916009)(66946007)(186003)(66446008)(76116006)(83380400001)(9686003)(55016002)(86362001)(6506007)(7696005)(478600001)(71200400001)(316002)(8676002)(19627405001)(52536014)(8936002)(5660300002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qFRgHcp/3jyvwQ9Y6gNbGDEzl/x6smWi041nThxEu4PHjScs4BMM1WCGCgPcHTG5DvkfHGurXcYJp45Ehttqnf8KuJQZUxYAC/Gces4nGHCctf5zfM4LnK6py0HAGEab5Y5DEVelqel+ZDiT0/d0LB0x2wEaogDgE/Rou/SQVAhz2L15l7S/Mlqfnu8za1DH+H7phNCaxifRw0OA/53LR7HVlvZvhhVdIn7dsdf1xsh6mLPnT3ANSJqSCn6BvT821lwvIdhFml0VJGNPrR0oV5KMGjg8u8gnBJVNxGQ8+SX0eUlFgSpA8KUxDv3ryYhJIQS4aKySEliVgkDwsY6uZDmoGhLHXe3ZmvnOh5WnWc701b19tdiXMMKibNcY9966e+E8Lb150JCZnuUI3MLvbmJwwKQ3vrItoiSCOCal3xC/AdMo5XI5KYj1xPeDErMtw2zrh84UYIYLwG+D8G1hM8niN4SewC9c6wijEDxNoeUkESLS7tlqzzyAghG1TsplFaF0r5JW9hGWcXm2V2RfOrwynYCxxlvvfBhISfXSbjL7pzIJ1NVDLyfTBllfaGL2C/4V4eIPe/3SuDVrXwQGsqaqo60kTd/ONH12utmH7O2a9+0Exz0USkjc7OdnFmw+W5ZOBDFL/qydgT6n/4BwXQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6916a2ec-4f8c-43aa-979f-08d8549b4383
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 08:35:10.1717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ikJ102lb/VYw2QuEITtFOvo/IZ3QDGu/B2i62rbWFGWna9S6xe8OzY2tmRyFjQIX1GcaHsBGb4ZpYQSuNMQqFpxToPKq+Ipp8kAArcOY7rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3908
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] Error with cpuset_inherit
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
Content-Type: multipart/mixed; boundary="===============1847486430=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1847486430==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB234415DBFA9A047126CABB85EE260BMXPR01MB2344INDP_"

--_000_BMXPR01MB234415DBFA9A047126CABB85EE260BMXPR01MB2344INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am running cpuset_inherit from LTP version:20200515-267-g9677c5573 on cus=
tom kernel 5.5.6 but i am getting following failure with the mentioned test=
case

earlycon=3Dsbi earlycon=3Dsbi root=3D/dev/mmcblk0p3 rootwait console=3DttyS=
IF0 console=3Dtty0

Gnu C                  gcc (GCC) 8.3.0
Clang
Gnu make               4.2.1
util-linux             2.34
mount                  linux 2.34 (libmount 2.34.0: btrfs, namespaces, asse=
rt, debug)
modutils               26
e2fsprogs              1.45.4
Linux C Library        > libc.2.30
Dynamic linker (ldd)   2.30
Linux C++ Library      6.0.25
Procps                 3.3.15
iproute2               iproute2-ss190924
iputils                'V'
Kbd                    2.2.0
Sh-utils               8.31
Modules Loaded         veth ofpart cmdlinepart spi_nor

free reports:
              total        used        free      shared  buff/cache   avail=
able
Mem:        8167360       63568     7098176       17980     1005616     799=
4892
Swap:             0           0           0

cpuinfo:
Architecture:        riscv64
Byte Order:          Little Endian
CPU(s):              4
On-line CPU(s) list: 0-3
Thread(s) per core:  4
Core(s) per socket:  1
Socket(s):           1
L1d cache:           32 KiB
L1i cache:           32 KiB
L2 cache:            2 MiB

AppArmor disabled

SELinux mode: unknown
no big block device was specified on commandline.
Tests which require a big block device are disabled.
You can specify it with option -z
COMMAND:    /opt/ltp/bin/ltp-pan   -e -S   -a 10318     -n 10318 -p -f /tmp=
/ltp-NOCHmuGYM1/alltests -l /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_=
36s.log  -C /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.failed -T /op=
t/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.tconf
INFO: Restricted to cpuset_inherit
LOG File: /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_36s.log
FAILED COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.fail=
ed
TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.tconf
Running tests.......
<<<test_start>>>
tag=3Dcpuset_inherit stime=3D1599563376
cmdline=3D"cpuset_inherit_testset.sh"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
cat: /sys/devices/system/node/has_normal_memory: No such file or directory
cpuset_inherit 1 TPASS: cpus: Inherited information is right!
cpuset_inherit 3 TPASS: cpus: Inherited information is right!
cpuset_inherit 5 TPASS: cpus: Inherited information is right!
cpuset_inherit 7 TPASS: cpus: Inherited information is right!
cpuset_inherit 9 TPASS: cpus: Inherited information is right!
cpuset_inherit 11 TPASS: cpus: Inherited information is right!
cpuset_inherit 13 TPASS: mems: Inherited information is right!
cpuset_inherit 15 TPASS: mems: Inherited information is right!
cpuset_inherit 17 TPASS: mems: Inherited information is right!
cpuset_inherit 19 TPASS: mems: Inherited information is right!
cpuset_inherit 21 TPASS: mems: Inherited information is right!
cpuset_inherit 23 TFAIL: mems: Test result - 0 Expected string - ""
cpuset_inherit 25 TPASS: cpu_exclusive: Inherited information is right!
cpuset_inherit 27 TPASS: cpu_exclusive: Inherited information is right!
cpuset_inherit 29 TPASS: mem_exclusive: Inherited information is right!
cpuset_inherit 31 TPASS: mem_exclusive: Inherited information is right!
cpuset_inherit 33 TPASS: mem_hardwall: Inherited information is right!
cpuset_inherit 35 TPASS: mem_hardwall: Inherited information is right!
cpuset_inherit 37 TPASS: memory_migrate: Inherited information is right!
cpuset_inherit 39 TPASS: memory_migrate: Inherited information is right!
cpuset_inherit 41 TPASS: memory_spread_page: Inherited information is right=
!
cpuset_inherit 43 TPASS: memory_spread_page: Inherited information is right=
!
cpuset_inherit 45 TPASS: memory_spread_slab: Inherited information is right=
!
cpuset_inherit 47 TPASS: memory_spread_slab: Inherited information is right=
!
cpuset_inherit 49 TPASS: sched_load_balance: Inherited information is right=
!
cpuset_inherit 51 TPASS: sched_load_balance: Inherited information is right=
!
cpuset_inherit 53 TPASS: sched_relax_domain_level: Inherited information is=
 right!
cpuset_inherit 55 TPASS: sched_relax_domain_level: Inherited information is=
 right!
cpuset_inherit 57 TPASS: sched_relax_domain_level: Inherited information is=
 right!
cpuset_inherit 59 TPASS: sched_relax_domain_level: Inherited information is=
 right!
cpuset_inherit 61 TPASS: sched_relax_domain_level: Inherited information is=
 right!
cpuset_inherit 63 TPASS: sched_relax_domain_level: Inherited information is=
 right!
cpuset_inherit 65 TPASS: sched_relax_domain_level: Inherited information is=
 right!
incrementing stop
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D3 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D131 cstime=3D194
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20200515-267-g9677c5573

       ###############################################################

            Done executing testcases.
            LTP Version:  20200515-267-g9677c5573
       ###############################################################

Can someone help me why this test is getting failed and how i can resolve i=
t??

Thanks!



--_000_BMXPR01MB234415DBFA9A047126CABB85EE260BMXPR01MB2344INDP_
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
i am runnin<span style=3D"background-color: rgb(255, 255, 255);">g&nbsp;</s=
pan><span style=3D"font-family: Calibri, &quot;Segoe UI&quot;, Calibri, Tho=
nburi, Arial, Verdana, sans-serif, &quot;Mongolian Baiti&quot;, &quot;Micro=
soft Yi Baiti&quot;, &quot;Javanese Text&quot;; font-size: 14.6667px; backg=
round-color: rgb(255, 255, 255); display: inline !important;">cpuset_inheri=
t
 from LTP version:20200515-267-g9677c5573 on custom kernel 5.5.6 but i am g=
etting following failure with the mentioned testcase</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, &quot;Segoe UI&quot;, Calibri, Thonbur=
i, Arial, Verdana, sans-serif, &quot;Mongolian Baiti&quot;, &quot;Microsoft=
 Yi Baiti&quot;, &quot;Javanese Text&quot;; font-size: 14.6667px; backgroun=
d-color: rgb(255, 255, 255); display: inline !important;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, &quot;Segoe UI&quot;, Calibri, Thonbur=
i, Arial, Verdana, sans-serif, &quot;Mongolian Baiti&quot;, &quot;Microsoft=
 Yi Baiti&quot;, &quot;Javanese Text&quot;; font-size: 14.6667px; backgroun=
d-color: rgb(255, 255, 255); display: inline !important;">earlycon=3Dsbi ea=
rlycon=3Dsbi
 root=3D/dev/mmcblk0p3 rootwait console=3DttySIF0 console=3Dtty0
<div><br>
</div>
<div>Gnu C &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gc=
c (GCC) 8.3.0</div>
<div>Clang &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </div>
<div>Gnu make &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4.2.1</div>
<div>util-linux &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2.34</div>
<div>mount &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;li=
nux 2.34 (libmount 2.34.0: btrfs, namespaces, assert, debug)</div>
<div>modutils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 26</div>
<div>e2fsprogs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.45.4</div>
<div>Linux C Library &nbsp; &nbsp; &nbsp; &nbsp;&gt; libc.2.30</div>
<div>Dynamic linker (ldd) &nbsp; 2.30</div>
<div>Linux C++ Library &nbsp; &nbsp; &nbsp;6.0.25</div>
<div>Procps &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3.3.15<=
/div>
<div>iproute2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iproute2-ss1=
90924</div>
<div>iputils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'V'</di=
v>
<div>Kbd &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;2.2.0</div>
<div>Sh-utils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8.31</div>
<div>Modules Loaded &nbsp; &nbsp; &nbsp; &nbsp; veth ofpart cmdlinepart spi=
_nor</div>
<div><br>
</div>
<div>free reports:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total &nbsp; &nbsp; &=
nbsp; &nbsp;used &nbsp; &nbsp; &nbsp; &nbsp;free &nbsp; &nbsp; &nbsp;shared=
 &nbsp;buff/cache &nbsp; available</div>
<div>Mem: &nbsp; &nbsp; &nbsp; &nbsp;8167360 &nbsp; &nbsp; &nbsp; 63568 &nb=
sp; &nbsp; 7098176 &nbsp; &nbsp; &nbsp; 17980 &nbsp; &nbsp; 1005616 &nbsp; =
&nbsp; 7994892</div>
<div>Swap: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0</div>
<div><br>
</div>
<div>cpuinfo:</div>
<div>Architecture: &nbsp; &nbsp; &nbsp; &nbsp;riscv64</div>
<div>Byte Order: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Little Endian</div>
<div>CPU(s): &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4</div>
<div>On-line CPU(s) list: 0-3</div>
<div>Thread(s) per core: &nbsp;4</div>
<div>Core(s) per socket: &nbsp;1</div>
<div>Socket(s): &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1</div>
<div>L1d cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 32 KiB</div>
<div>L1i cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 32 KiB</div>
<div>L2 cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2 MiB</div>
<div><br>
</div>
<div>AppArmor disabled</div>
<div><br>
</div>
<div>SELinux mode: unknown</div>
<div>no big block device was specified on commandline.</div>
<div>Tests which require a big block device are disabled.</div>
<div>You can specify it with option -z</div>
<div>COMMAND: &nbsp; &nbsp;/opt/ltp/bin/ltp-pan &nbsp; -e -S &nbsp; -a 1031=
8 &nbsp; &nbsp; -n 10318 -p -f /tmp/ltp-NOCHmuGYM1/alltests -l /opt/ltp/res=
ults/LTP_RUN_ON-2020_09_08-11h_09m_36s.log &nbsp;-C /opt/ltp/output/LTP_RUN=
_ON-2020_09_08-11h_09m_36s.failed -T /opt/ltp/output/LTP_RUN_ON-2020_09_08-=
11h_09m_36s.tconf</div>
<div>INFO: Restricted to cpuset_inherit</div>
<div>LOG File: /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_36s.log</div>
<div>FAILED COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s=
.failed</div>
<div>TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.=
tconf</div>
<div>Running tests.......</div>
<div>&lt;&lt;&lt;test_start&gt;&gt;&gt;</div>
<div>tag=3Dcpuset_inherit stime=3D1599563376</div>
<div>cmdline=3D&quot;cpuset_inherit_testset.sh&quot;</div>
<div>contacts=3D&quot;&quot;</div>
<div>analysis=3Dexit</div>
<div>&lt;&lt;&lt;test_output&gt;&gt;&gt;</div>
<div>cat: /sys/devices/system/node/has_normal_memory: No such file or direc=
tory</div>
<div>cpuset_inherit 1 TPASS: cpus: Inherited information is right!</div>
<div>cpuset_inherit 3 TPASS: cpus: Inherited information is right!</div>
<div>cpuset_inherit 5 TPASS: cpus: Inherited information is right!</div>
<div>cpuset_inherit 7 TPASS: cpus: Inherited information is right!</div>
<div>cpuset_inherit 9 TPASS: cpus: Inherited information is right!</div>
<div>cpuset_inherit 11 TPASS: cpus: Inherited information is right!</div>
<div>cpuset_inherit 13 TPASS: mems: Inherited information is right!</div>
<div>cpuset_inherit 15 TPASS: mems: Inherited information is right!</div>
<div>cpuset_inherit 17 TPASS: mems: Inherited information is right!</div>
<div>cpuset_inherit 19 TPASS: mems: Inherited information is right!</div>
<div>cpuset_inherit 21 TPASS: mems: Inherited information is right!</div>
<div><b>cpuset_inherit 23 TFAIL: mems: Test result - 0 Expected string - &q=
uot;&quot;</b></div>
<div>cpuset_inherit 25 TPASS: cpu_exclusive: Inherited information is right=
!</div>
<div>cpuset_inherit 27 TPASS: cpu_exclusive: Inherited information is right=
!</div>
<div>cpuset_inherit 29 TPASS: mem_exclusive: Inherited information is right=
!</div>
<div>cpuset_inherit 31 TPASS: mem_exclusive: Inherited information is right=
!</div>
<div>cpuset_inherit 33 TPASS: mem_hardwall: Inherited information is right!=
</div>
<div>cpuset_inherit 35 TPASS: mem_hardwall: Inherited information is right!=
</div>
<div>cpuset_inherit 37 TPASS: memory_migrate: Inherited information is righ=
t!</div>
<div>cpuset_inherit 39 TPASS: memory_migrate: Inherited information is righ=
t!</div>
<div>cpuset_inherit 41 TPASS: memory_spread_page: Inherited information is =
right!</div>
<div>cpuset_inherit 43 TPASS: memory_spread_page: Inherited information is =
right!</div>
<div>cpuset_inherit 45 TPASS: memory_spread_slab: Inherited information is =
right!</div>
<div>cpuset_inherit 47 TPASS: memory_spread_slab: Inherited information is =
right!</div>
<div>cpuset_inherit 49 TPASS: sched_load_balance: Inherited information is =
right!</div>
<div>cpuset_inherit 51 TPASS: sched_load_balance: Inherited information is =
right!</div>
<div>cpuset_inherit 53 TPASS: sched_relax_domain_level: Inherited informati=
on is right!</div>
<div>cpuset_inherit 55 TPASS: sched_relax_domain_level: Inherited informati=
on is right!</div>
<div>cpuset_inherit 57 TPASS: sched_relax_domain_level: Inherited informati=
on is right!</div>
<div>cpuset_inherit 59 TPASS: sched_relax_domain_level: Inherited informati=
on is right!</div>
<div>cpuset_inherit 61 TPASS: sched_relax_domain_level: Inherited informati=
on is right!</div>
<div>cpuset_inherit 63 TPASS: sched_relax_domain_level: Inherited informati=
on is right!</div>
<div>cpuset_inherit 65 TPASS: sched_relax_domain_level: Inherited informati=
on is right!</div>
<div>incrementing stop</div>
<div>&lt;&lt;&lt;execution_status&gt;&gt;&gt;</div>
<div>initiation_status=3D&quot;ok&quot;</div>
<div>duration=3D3 termination_type=3Dexited termination_id=3D1 corefile=3Dn=
o</div>
<div>cutime=3D131 cstime=3D194</div>
<div>&lt;&lt;&lt;test_end&gt;&gt;&gt;</div>
<div>INFO: ltp-pan reported some tests FAIL</div>
<div>LTP Version: 20200515-267-g9677c5573</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;###########################################=
####################</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Done executing testcases.</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; LTP Version: &nbsp;20200515-=
267-g9677c5573</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;###########################################=
####################</div>
<div><br>
</div>
<div>Can someone help me why this test is getting failed and how i can reso=
lve it??</div>
<div><br>
</div>
<div>Thanks!</div>
<br>
<br>
</span></div>
</body>
</html>

--_000_BMXPR01MB234415DBFA9A047126CABB85EE260BMXPR01MB2344INDP_--

--===============1847486430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1847486430==--
