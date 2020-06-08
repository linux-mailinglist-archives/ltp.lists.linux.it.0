Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E3E1F1486
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 10:31:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE90E3C2EB8
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 10:31:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EFB0A3C1CF0
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 10:31:00 +0200 (CEST)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390094.outbound.protection.outlook.com [40.107.139.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 25422200DEB
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 10:30:59 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhk6S2Mt7k5c8mWW0Gcsq3OcLbwtzKT3LkP0bdRb1DMI7TCVWqJYTm1cpB+TDwiuysNJRSgcanGcfbBfCZDn+ZkxvZW2El6NXIiHxXkJGNh5qp//B4xDalryyW0B+lAlsvmiSOjx1Dk2507IevxtaiIQl7NYNcdCDtl0M4TLYZcYB0BehxnGn8dJKolO4zIWOM6C2EF2Ukfs8KmTvmIGjFWkFbCJxJ2oNe+z5jIcLsfQ7HVg13yKe23iNAelQgLhb4WODRqd/abMJIkQYfA/1/o/kz0L6YQz68NsoUvwnXdhyY6VnESmdTeG6jZgpNcCCfZQG5+iBSBRSZZ+bH87Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWTthk/xcPciMcZHG8+rHiUSdcuJ9Ug18vudlYLEP8s=;
 b=ORujw5txdSwGlIPtyCg4QMH0rG5kja61pFnMwkUTx/oK4gD7zxFY4W2V/AsyYuIloe1XQ28wOFr3jAcFc9K0Fd057QDpSa8wT6mws2g2FQSu5JcTpwir/5X3+QBs86IhktYGn226Rm5wKYc3SpBF7oncx3u3pRzZLWqSGESsC+6y3uk5k8GC+Eqd0B5l0OihoEOPzYL8dJql5vPTGGxsmmQsZwpeb9B+9z5+NS6mX26zWuEQZcHPteRX8tVflZvkF6eKBuWCFY3QrLGfIYbZKBYARgg/jVT1TKZOE5AWGP2MnhpBy1xnQY4HMDlxNZ+PmV4TXWWRRfaGgERdQkTzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWTthk/xcPciMcZHG8+rHiUSdcuJ9Ug18vudlYLEP8s=;
 b=C52rd7JmTKpmP21Qv+jGVWFlPMAuIiWf2WG0/0aL5d+km3bnqfhhfQVZxc4VfMkWl0BF90J8rCUV3EdF/NvSIoxvALMPoplY+NDq1OvgUgVKqH27VqCXygqkghGtYyBloWC/c/WX4sRfUi0EXSmOAmd44jCavRYVWdHH+AwdUuA=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BMXPR01MB0760.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 08:30:56 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bc78:c2b:bbf1:704]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bc78:c2b:bbf1:704%2]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 08:30:56 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: LTP testcase failure sched_rr_get_interval01
 ,sched_rr_get_interval02 ,sched_rr_get_interval03
Thread-Index: AQHWPW5AOkR2efFNnkW4SNmwlCJKbA==
Date: Mon, 8 Jun 2020 08:30:56 +0000
Message-ID: <BMXPR01MB2344FC85BB37C4DFEB7317F8EE850@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [2409:4042:269e:1d93:d0ea:45a9:9004:c5d8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac1f0a87-6794-4626-58ce-08d80b8643a7
x-ms-traffictypediagnostic: BMXPR01MB0760:
x-microsoft-antispam-prvs: <BMXPR01MB0760022A5F91138AAF7B1186EE850@BMXPR01MB0760.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XryPpZOixuIBrDULnkW5m4yp2yU0D7r5vLoPQUE1HoUNNy5cNlihrRnb9jhPoJSPwQi9yj8C5qV1eUgsiU45u+1eLhQOF8FCVPoM9RsIHknl9N7EGq+E9Q0eMK9X1MlxOJx6pAQ8nCQlQ8IjrSZI6VKiWgYlQvcW5+tEmdoTq781Ieb4aPFaqAzH9uaKDUMq5esPsY7wBbsL4uYMySFfBCNtyDgEY8jbDX8JOW1hi/VZvaZnER0fTGMlLBJSCKJl6tlhZtatWKBf6sRd1DQEkzxwNBMwurvrMIDkOHgkFMhpuYTGLnQRU9gOWBYOirYhhCIk3cjXvVlcmNgBRvT3ng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39830400003)(396003)(376002)(346002)(366004)(136003)(33656002)(76116006)(2906002)(66476007)(66946007)(66556008)(316002)(52536014)(5660300002)(64756008)(19627405001)(6916009)(71200400001)(66446008)(83380400001)(9686003)(8676002)(7696005)(6506007)(186003)(508600001)(8936002)(86362001)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: mt8XPK8IzdmKu0aXSj1/3X2yFQ2DsuzJ0OQERHbw9B1DDnLOKz+QK3xlXH+wqT/hkkxf4VDWTqv0TExJLVbrtG64rZr0d8dqXKDoIMLnv1ZNICMqRQLmcfmd2bo8ch9rY9IIXYTsf3kYgU4rQAkFRPDp24Gvhz+7xLVx2g8jnz0Qd4tnAkPml3egYhHyP2IogqXzzXI+wapYO56izClcfV64QQa94ATi6jk6NBLMePs+aXBsK/X/1+0oqkjGAziQcVi5ABxW/yGStCObvqpVH7AtEVxF4j33EjNIp12yn8Iww7k6KssmV2/X9NUfMgLlA9yUk5yJBwqj0VYtvNxSoRi9Hc860fdyWrPP6+Pb+cvxvSbn/Km+8rOQmVOcoHMZOaSpjFGZ7tNc1b7n0peqY3yVVy6DaJrNqDwkM++ItOA0fYNibvO7lLttM36plQ4pOm04vLuF/PNCSZo5tfWDlUadhfdZ+wVzkImOHFAmK/sP75nOP6zr+AGClHZUvbu4F5uAutVlmON31+34koIor+LtVg0sD6F9rm1dCljZBDCqzyhSAFZlyWrilcrXBI7A
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1f0a87-6794-4626-58ce-08d80b8643a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 08:30:56.0809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ME5b6lRBbRU2OyZ+PDpkOo1zVPul/ixcJJkr5rhKGWwy/SMb6EOYtUM+YQiOgvjp3n6m9+gbaf+wJG6/OaNPl9I+N9mGu2HOupD4lf1/L1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0760
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] LTP testcase failure sched_rr_get_interval01  ,
 sched_rr_get_interval02 , sched_rr_get_interval03
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
Content-Type: multipart/mixed; boundary="===============0043079863=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0043079863==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB2344FC85BB37C4DFEB7317F8EE850BMXPR01MB2344INDP_"

--_000_BMXPR01MB2344FC85BB37C4DFEB7317F8EE850BMXPR01MB2344INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am running sched_rr_get_interval02 , sched_rr_get_interval02 ,sched_rr_ge=
t_interval03 test on riscv with linux kernel 5.5.6 but i am getting followi=
ng error(same kinf error for sched_rr_get_interval01 sched_rr_get_interval0=
2,sched_rr_get_interval03)

i am attaching the result produced after running this test..can someone hel=
p me out with this

root@exaleapsemi-r2:/opt/ltp# ./runltp -s sched_rr_get_interval01
INFO: creating /opt/ltp/results directory
INFO: no command files were provided. Executing following runtest scenario =
files:
syscalls fs fs_perms_simple fsx dio io mm ipc sched math nptl pty container=
s fs_bind controllers filecaps cap_bounds fcntl-locktests connectors power_=
management_tests hugetlb commands hyperthreading can cpuhotplug net.ipv6_li=
b input cve crypto kernel_misc uevent

Checking for required user/group ids

'nobody' user id and group found.
'bin' user id and group found.
'daemon' user id and group found.
Users group found.
Sys group found.
Required users/groups exist.
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

/etc/os-release
ID=3D"Exaleap-riscv-linux"
NAME=3D"Exaleap-riscv-linux"
VERSION=3D"Exaleap-riscv-linux-r1.10"
VERSION_ID=3D"exaleap-riscv-linux-r1.10"
PRETTY_NAME=3D"Exaleap-riscv-linux Exaleap-riscv-linux-r1.10"

uname:
Linux exaleapsemi-r2.00 5.5.6 #1 SMP Wed Jun 3 08:57:06 UTC 2020 riscv64 ri=
scv64 riscv64 GNU/Linux

/proc/cmdline
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
PPP                    2.4.7
Linux C Library        > libc.2.30
Dynamic linker (ldd)   2.30
Linux C++ Library      6.0.25
Procps                 3.3.15
Net-tools              1.60
iproute2               iproute2-ss190924
iputils                'V'
ethtool                5.3
Kbd                    2.2.0
Sh-utils               8.31
Modules Loaded         nls_cp437 btrfs blake2b_generic xor zstd_decompress =
zstd_compress xxhash lzo_compress zlib_deflate raid6_pq fuse xt_MASQUERADE =
nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo iptable_filter iptable_n=
at nf_nat ip_tables overlay xt_conntrack nf_conntrack nf_defrag_ipv6 nf_def=
rag_ipv4 libcrc32c xt_addrtype

free reports:
              total        used        free      shared  buff/cache   avail=
able
Mem:        8165700      160228     7027496       26152      977976     789=
0824
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
COMMAND:    /opt/ltp/bin/ltp-pan   -e -S   -a 40320     -n 40320 -p -f /tmp=
/ltp-s8OHAGE4Sl/alltests -l /opt/ltp/results/LTP_RUN_ON-2020_06_08-08h_20m_=
33s.log  -C /opt/ltp/output/LTP_RUN_ON-2020_06_08-08h_20m_33s.failed -T /op=
t/ltp/output/LTP_RUN_ON-2020_06_08-08h_20m_33s.tconf
INFO: Restricted to sched_rr_get_interval01
LOG File: /opt/ltp/results/LTP_RUN_ON-2020_06_08-08h_20m_33s.log
FAILED COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_06_08-08h_20m_33s.fail=
ed
TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_06_08-08h_20m_33s.tconf
Running tests.......
<<<test_start>>>
tag=3Dsched_rr_get_interval01 stime=3D1591604435
cmdline=3D"sched_rr_get_interval01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
incrementing stop
sched_rr_get_interval01    1  TBROK  :  sched_rr_get_interval01.c:131: sche=
d_setscheduler() failed
sched_rr_get_interval01    2  TBROK  :  sched_rr_get_interval01.c:131: Rema=
ining cases broken
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D2 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20200515-28-gb54247721

       ###############################################################

            Done executing testcases.
            LTP Version:  20200515-28-gb54247721
       ###############################################################

How i can ressolve this issue??

--_000_BMXPR01MB2344FC85BB37C4DFEB7317F8EE850BMXPR01MB2344INDP_
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
I am running&nbsp;<span>sched_rr_get_interval02 ,&nbsp;<span>sched_rr_get_i=
nterval02 ,<span>sched_rr_get_interval03 test on riscv with linux kernel 5.=
5.6 but i am getting following error(same kinf error for
<span>sched_rr_get_interval01&nbsp;<span>sched_rr_get_interval02,<span>sche=
d_rr_get_interval03</span></span></span>)</span><br>
</span><span></span><br>
</span><span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>i am attaching the result produced after running this test..can someo=
ne help me out with this</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span><b>root@exaleapsemi-r2:/opt/ltp# ./runltp -s sched_rr_get_inter=
val01 </b>
<br>
</span>
<div>INFO: creating /opt/ltp/results directory<br>
</div>
<div>INFO: no command files were provided. Executing following runtest scen=
ario files:<br>
</div>
<div>syscalls fs fs_perms_simple fsx dio io mm ipc sched math nptl pty cont=
ainers fs_bind controllers filecaps cap_bounds fcntl-locktests connectors p=
ower_management_tests hugetlb commands hyperthreading can cpuhotplug net.ip=
v6_lib input cve crypto kernel_misc
 uevent <br>
</div>
<div><br>
</div>
<div>Checking for required user/group ids<br>
</div>
<div><br>
</div>
<div>'nobody' user id and group found.<br>
</div>
<div>'bin' user id and group found.<br>
</div>
<div>'daemon' user id and group found.<br>
</div>
<div>Users group found.<br>
</div>
<div>Sys group found.<br>
</div>
<div>Required users/groups exist.<br>
</div>
<div>If some fields are empty or look unusual you may have an old version.<=
br>
</div>
<div>Compare to the current minimal requirements in Documentation/Changes.<=
br>
</div>
<div><br>
</div>
<div>/etc/os-release<br>
</div>
<div>ID=3D&quot;Exaleap-riscv-linux&quot;<br>
</div>
<div>NAME=3D&quot;Exaleap-riscv-linux&quot;<br>
</div>
<div>VERSION=3D&quot;Exaleap-riscv-linux-r1.10&quot;<br>
</div>
<div>VERSION_ID=3D&quot;exaleap-riscv-linux-r1.10&quot;<br>
</div>
<div>PRETTY_NAME=3D&quot;Exaleap-riscv-linux Exaleap-riscv-linux-r1.10&quot=
;<br>
</div>
<div><br>
</div>
<div>uname:<br>
</div>
<div>Linux exaleapsemi-r2.00 5.5.6 #1 SMP Wed Jun 3 08:57:06 UTC 2020 riscv=
64 riscv64 riscv64 GNU/Linux<br>
</div>
<div><br>
</div>
<div>/proc/cmdline<br>
</div>
<div>earlycon=3Dsbi earlycon=3Dsbi root=3D/dev/mmcblk0p3 rootwait console=
=3DttySIF0 console=3Dtty0<br>
</div>
<div><br>
</div>
<div>Gnu C &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gc=
c (GCC) 8.3.0<br>
</div>
<div>Clang &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br>
</div>
<div>Gnu make &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4.2.1<br>
</div>
<div>util-linux &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2.34<br>
</div>
<div>mount &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;li=
nux 2.34 (libmount 2.34.0: btrfs, namespaces, assert, debug)<br>
</div>
<div>modutils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 26<br>
</div>
<div>e2fsprogs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.45.4<br>
</div>
<div>PPP &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;2.4.7<br>
</div>
<div>Linux C Library &nbsp; &nbsp; &nbsp; &nbsp;&gt; libc.2.30<br>
</div>
<div>Dynamic linker (ldd) &nbsp; 2.30<br>
</div>
<div>Linux C&#43;&#43; Library &nbsp; &nbsp; &nbsp;6.0.25<br>
</div>
<div>Procps &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3.3.15<=
br>
</div>
<div>Net-tools &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.60<br>
</div>
<div>iproute2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iproute2-ss1=
90924<br>
</div>
<div>iputils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'V'<br>
</div>
<div>ethtool &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5.3<br>
</div>
<div>Kbd &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;2.2.0<br>
</div>
<div>Sh-utils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8.31<br>
</div>
<div>Modules Loaded &nbsp; &nbsp; &nbsp; &nbsp; nls_cp437 btrfs blake2b_gen=
eric xor zstd_decompress zstd_compress xxhash lzo_compress zlib_deflate rai=
d6_pq fuse xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo=
 iptable_filter iptable_nat nf_nat ip_tables overlay
 xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c xt_addrt=
ype<br>
</div>
<div><br>
</div>
<div>free reports:<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total &nbsp; &nbsp; &=
nbsp; &nbsp;used &nbsp; &nbsp; &nbsp; &nbsp;free &nbsp; &nbsp; &nbsp;shared=
 &nbsp;buff/cache &nbsp; available<br>
</div>
<div>Mem: &nbsp; &nbsp; &nbsp; &nbsp;8165700 &nbsp; &nbsp; &nbsp;160228 &nb=
sp; &nbsp; 7027496 &nbsp; &nbsp; &nbsp; 26152 &nbsp; &nbsp; &nbsp;977976 &n=
bsp; &nbsp; 7890824<br>
</div>
<div>Swap: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0<br>
</div>
<div><br>
</div>
<div>cpuinfo:<br>
</div>
<div>Architecture: &nbsp; &nbsp; &nbsp; &nbsp;riscv64<br>
</div>
<div>Byte Order: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Little Endian<br>
</div>
<div>CPU(s): &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4<br>
</div>
<div>On-line CPU(s) list: 0-3<br>
</div>
<div>Thread(s) per core: &nbsp;4<br>
</div>
<div>Core(s) per socket: &nbsp;1<br>
</div>
<div>Socket(s): &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1<br>
</div>
<div>L1d cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 32 KiB<br>
</div>
<div>L1i cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 32 KiB<br>
</div>
<div>L2 cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2 MiB<br>
</div>
<div><br>
</div>
<div>AppArmor disabled<br>
</div>
<div><br>
</div>
<div>SELinux mode: unknown<br>
</div>
<div>no big block device was specified on commandline.<br>
</div>
<div>Tests which require a big block device are disabled.<br>
</div>
<div>You can specify it with option -z<br>
</div>
<div>COMMAND: &nbsp; &nbsp;/opt/ltp/bin/ltp-pan &nbsp; -e -S &nbsp; -a 4032=
0 &nbsp; &nbsp; -n 40320 -p -f /tmp/ltp-s8OHAGE4Sl/alltests -l /opt/ltp/res=
ults/LTP_RUN_ON-2020_06_08-08h_20m_33s.log &nbsp;-C /opt/ltp/output/LTP_RUN=
_ON-2020_06_08-08h_20m_33s.failed -T /opt/ltp/output/LTP_RUN_ON-2020_06_08-=
08h_20m_33s.tconf<br>
</div>
<div>INFO: Restricted to sched_rr_get_interval01<br>
</div>
<div>LOG File: /opt/ltp/results/LTP_RUN_ON-2020_06_08-08h_20m_33s.log<br>
</div>
<div>FAILED COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_06_08-08h_20m_33s=
.failed<br>
</div>
<div>TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_06_08-08h_20m_33s.=
tconf<br>
</div>
<div>Running tests.......<br>
</div>
<div>&lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
</div>
<div>tag=3Dsched_rr_get_interval01 stime=3D1591604435<br>
</div>
<div>cmdline=3D&quot;sched_rr_get_interval01&quot;<br>
</div>
<div>contacts=3D&quot;&quot;<br>
</div>
<div>analysis=3Dexit<br>
</div>
<div>&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
</div>
<div>incrementing stop<br>
</div>
<div><b>sched_rr_get_interval01 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;sc=
hed_rr_get_interval01.c:131: sched_setscheduler() failed<br>
</b></div>
<div><b>sched_rr_get_interval01 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;sc=
hed_rr_get_interval01.c:131: Remaining cases broken<br>
</b></div>
<div><b>&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
</b></div>
<div><b>initiation_status=3D&quot;ok&quot;</b><br>
</div>
<div>duration=3D0 termination_type=3Dexited termination_id=3D2 corefile=3Dn=
o<br>
</div>
<div>cutime=3D0 cstime=3D0<br>
</div>
<div>&lt;&lt;&lt;test_end&gt;&gt;&gt;<br>
</div>
<div>INFO: ltp-pan reported some tests FAIL<br>
</div>
<div>LTP Version: 20200515-28-gb54247721<br>
</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;###########################################=
####################<br>
</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Done executing testcases.<br=
>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; LTP Version: &nbsp;20200515-=
28-gb54247721<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;###########################################=
####################<br>
</div>
<span></span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>How i can ressolve this issue??</span></div>
</body>
</html>

--_000_BMXPR01MB2344FC85BB37C4DFEB7317F8EE850BMXPR01MB2344INDP_--

--===============0043079863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0043079863==--
