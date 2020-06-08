Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 887301F18A2
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 14:20:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25D463C2E93
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 14:20:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EB20D3C2029
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 14:20:01 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380120.outbound.protection.outlook.com [40.107.138.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8388A1A00CD5
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 14:19:59 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmbMv3u69HX+b2r7Tc5fCRGjFq4ooeVvszxOj6c4GNstOJIbcRV2PXLIeSEpcji2D8ow/Q9GgaPS2dZLc6QGr4zbdqwPLwTUjh+NTwBBxg+csfIsXYnQNBch9ln1dPgDUbMwXQxTMzmj6Bs5bOezNnqOzi0yYH0A/nUt4DqWIP3r1BrD0o/TqCutUd/nUsIcY+W93A1DhUpF5okUrLiP8gJxgHgXBIqy+/M9UeLk3lMLDIbn+KoaZ+SkYAD037Zc2Nc8Gi3bBRoL8JHyK6W977MeOtUmZmEvH+N35p4jzBzG0WPKEZ7EBWfO3addLaqZU9fErDdoDnN1cZ5+JbtAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfsbvLczJ/boX/5aQezcdXq1z3k/TGWK/MAJdLTAAKk=;
 b=OpMokLDbb0cA3QPKW16fdAlRJ4id1FXyz/SvT0TfWftG0N1v69UyKsFXokINBZodx7doI5AUicYfagJlbXYerM+J8ZuYfNiEiSrYX2thIHuyMVV7L8NgXRDSJUi7Z0bLnHHr2+uQ/DJNXRM1jakvW18m+wxq9li3iwzH90fTciIuM9HzZYlDP/3o0hf10Vj6tPPiFt+4GRotwStdAFoZegRh2wdR9Eq/1F5P03uXDIi4Lp76D35AuNNPydL+T24KIjyjNqpxedxhhO/t1nATHovZm87YSZ4ChdDB9+hWrZXH5HNMQlKa5M46LAt7U71YGP1ff88l/GHBJg1I081NyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfsbvLczJ/boX/5aQezcdXq1z3k/TGWK/MAJdLTAAKk=;
 b=q3C2er+OfOeKYw58fULvt4mJqrFeFQ2VwyyqvsHuIUUzDYVPzS0blR7Cty+wjzocr501i6tuxFSi5Nsx4k0HHTHhXibR0H2n6khPHGnwDyuawUf60FgVTOMD0FTqRX0jrFGYXMcGIMiDsD5GWv7o8ztjEDhV5HlogxrRIf0cYks=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BMXPR01MB2901.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Mon, 8 Jun
 2020 12:19:56 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bc78:c2b:bbf1:704]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bc78:c2b:bbf1:704%2]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 12:19:56 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: sched_rr_get_interval01 , sched_rr_get_interval02
 ,sched_rr_get_interval03 testcase failure
Thread-Index: AQHWPY7/FIIF6rRND0e6piB5foPEvA==
Date: Mon, 8 Jun 2020 12:19:54 +0000
Message-ID: <BMXPR01MB23442B106F1292542BA7F85CEE850@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=exaleapsemi.com;
x-originating-ip: [2409:4042:269e:1d93:d0ea:45a9:9004:c5d8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0236a10e-92be-4099-2cea-08d80ba6416d
x-ms-traffictypediagnostic: BMXPR01MB2901:
x-microsoft-antispam-prvs: <BMXPR01MB29013E236EA6331150946901EE850@BMXPR01MB2901.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3R+E9JshtSz+5Fy+W691tvvua14VCX4cAuSBGiTEMA9tEoUsbAhVm+NnCL6w0B//GR0HdZ/gj/2JJblLUwn+GXzlSN9tPOVV1xv7NAtGoh5o/Pq0bNo4+O8R+OdsspXKwpN02f3sd26LitqZHr21MiT2QsCRxXJhENM9nq4znBR1bpTb7eVZVq0mPN0Pr5dY2MY3y9rCBNApGIXogE1IsFZv4pV6wihQjVyHASsASIO2ILeMspvAaqks7oXQpZWdRWXrlcZWS72VJmUo60E22FZoTpfjIvLsVvIhBWhTuHBojf20JYjWqjlABpVkuLukVAS00GR1RRNCVgeHO54mRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(396003)(136003)(39830400003)(376002)(366004)(86362001)(5660300002)(52536014)(7696005)(8936002)(83380400001)(6506007)(71200400001)(8676002)(6916009)(2906002)(4326008)(19627405001)(33656002)(316002)(186003)(66946007)(66446008)(64756008)(76116006)(9686003)(508600001)(55016002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kO8wVSVx43bvBsIlhlzUlXXHmHM/r50IN45Xz30NSUM3kQLzyq7Q/8Q8J82UhfgR9C5pDpUiDZrsPzHhHVmJvNauwa7WU2C9WTzjTrs3e/qtJ+7TYQxe3Uf6ZDynM1UOQ1ahDMHUCzZDj2sDak0Csy6g7OeCW+N43cBFovJXbcqKq+HZtL/wnw+igNQRNYcffTu0tAEyF7rDlhsDHtu0Mpgaa5ekxh1Cjf8dHJIzWiWb+rMKhfOn5LJyBoQBp+8dr2JJxXZ8410uELKlpwx692LUMUOgpBzhT57DS2ciDYlXDicarC72yGpIO2IU/Z+Dwl9eN1yXX1AuOZzzYkcZsx4hZXQaIErZHRKfd4Uc7oRCBjJq07Fxe5wCpVAbx5zbKcp8gbDC/o6046eW7KHh2cE3ZXrkwJPciU6kE+Dmfujp/vRs4T9pdnE+drGP7NpDVa4ZCvYzZAs+vylEB4ZgsPrSwZrU0reC1IJb4Bu70pE0yZDJtPaBv3XpSzU9Tn+mQMPVT5U6olYG+Xeoib9NfbXLxrvuOb0VSHuyiyP+lynCXY7lyrtC9XJYKRVZffO9
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0236a10e-92be-4099-2cea-08d80ba6416d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 12:19:55.7878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P2IQXI/b8J9YxyZrC3bE18ehWXeP65hD9V83n7Eo4m1r2zg9BCL3FUVVsMpYztcguATjACSaWq+qFswhsFiIV4NmbcZ0VAw5gvNBkTjuIKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2901
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] sched_rr_get_interval01 , sched_rr_get_interval02 ,
 sched_rr_get_interval03 testcase failure
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
Content-Type: multipart/mixed; boundary="===============0403623731=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0403623731==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB23442B106F1292542BA7F85CEE850BMXPR01MB2344INDP_"

--_000_BMXPR01MB23442B106F1292542BA7F85CEE850BMXPR01MB2344INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am running sched_rr_get_interval01 , sched_rr_get_interval02 ,sched_rr_ge=
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


--_000_BMXPR01MB23442B106F1292542BA7F85CEE850BMXPR01MB2344INDP_
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
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; background-color: rgb(255, 255, 255)">
Hi,</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; background-color: rgb(255, 255, 255)">
I am running&nbsp;<span style=3D"margin: 0px">sched_rr_get_interval01 ,&nbs=
p;<span style=3D"margin: 0px">sched_rr_get_interval02 ,<span style=3D"margi=
n: 0px">sched_rr_get_interval03 test on riscv with linux kernel 5.5.6 but i=
 am getting following error(same kinf error for<span>&nbsp;</span><span sty=
le=3D"margin: 0px">sched_rr_get_interval01&nbsp;<span style=3D"margin: 0px"=
>sched_rr_get_interval02,<span style=3D"margin: 0px">sched_rr_get_interval0=
3</span></span></span>)</span><br>
</span><span style=3D"margin: 0px"></span><br>
</span><span style=3D"margin: 0px"></span></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px">i am attaching the result produced after runnin=
g this test..can someone help me out with this</span></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px"><br>
</span></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px"><span style=3D"margin: 0px"><b>root@exaleapsemi=
-r2:/opt/ltp# ./runltp -s sched_rr_get_interval01</b><br>
</span>
<div style=3D"margin: 0px">INFO: creating /opt/ltp/results directory<br>
</div>
<div style=3D"margin: 0px">INFO: no command files were provided. Executing =
following runtest scenario files:<br>
</div>
<div style=3D"margin: 0px">syscalls fs fs_perms_simple fsx dio io mm ipc sc=
hed math nptl pty containers fs_bind controllers filecaps cap_bounds fcntl-=
locktests connectors power_management_tests hugetlb commands hyperthreading=
 can cpuhotplug net.ipv6_lib input
 cve crypto kernel_misc uevent<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">Checking for required user/group ids<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">'nobody' user id and group found.<br>
</div>
<div style=3D"margin: 0px">'bin' user id and group found.<br>
</div>
<div style=3D"margin: 0px">'daemon' user id and group found.<br>
</div>
<div style=3D"margin: 0px">Users group found.<br>
</div>
<div style=3D"margin: 0px">Sys group found.<br>
</div>
<div style=3D"margin: 0px">Required users/groups exist.<br>
</div>
<div style=3D"margin: 0px">If some fields are empty or look unusual you may=
 have an old version.<br>
</div>
<div style=3D"margin: 0px">Compare to the current minimal requirements in D=
ocumentation/Changes.<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">/etc/os-release<br>
</div>
<div style=3D"margin: 0px">ID=3D&quot;Exaleap-riscv-linux&quot;<br>
</div>
<div style=3D"margin: 0px">NAME=3D&quot;Exaleap-riscv-linux&quot;<br>
</div>
<div style=3D"margin: 0px">VERSION=3D&quot;Exaleap-riscv-linux-r1.10&quot;<=
br>
</div>
<div style=3D"margin: 0px">VERSION_ID=3D&quot;exaleap-riscv-linux-r1.10&quo=
t;<br>
</div>
<div style=3D"margin: 0px">PRETTY_NAME=3D&quot;Exaleap-riscv-linux Exaleap-=
riscv-linux-r1.10&quot;<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">uname:<br>
</div>
<div style=3D"margin: 0px">Linux exaleapsemi-r2.00 5.5.6 #1 SMP Wed Jun 3 0=
8:57:06 UTC 2020 riscv64 riscv64 riscv64 GNU/Linux<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">/proc/cmdline<br>
</div>
<div style=3D"margin: 0px">earlycon=3Dsbi earlycon=3Dsbi root=3D/dev/mmcblk=
0p3 rootwait console=3DttySIF0 console=3Dtty0<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">Gnu C &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;gcc (GCC) 8.3.0<br>
</div>
<div style=3D"margin: 0px">Clang &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;<br>
</div>
<div style=3D"margin: 0px">Gnu make &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; 4.2.1<br>
</div>
<div style=3D"margin: 0px">util-linux &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; 2.34<br>
</div>
<div style=3D"margin: 0px">mount &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;linux 2.34 (libmount 2.34.0: btrfs, namespaces, assert,=
 debug)<br>
</div>
<div style=3D"margin: 0px">modutils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; 26<br>
</div>
<div style=3D"margin: 0px">e2fsprogs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;1.45.4<br>
</div>
<div style=3D"margin: 0px">PPP &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;2.4.7<br>
</div>
<div style=3D"margin: 0px">Linux C Library &nbsp; &nbsp; &nbsp; &nbsp;&gt; =
libc.2.30<br>
</div>
<div style=3D"margin: 0px">Dynamic linker (ldd) &nbsp; 2.30<br>
</div>
<div style=3D"margin: 0px">Linux C&#43;&#43; Library &nbsp; &nbsp; &nbsp;6.=
0.25<br>
</div>
<div style=3D"margin: 0px">Procps &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; 3.3.15<br>
</div>
<div style=3D"margin: 0px">Net-tools &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;1.60<br>
</div>
<div style=3D"margin: 0px">iproute2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; iproute2-ss190924<br>
</div>
<div style=3D"margin: 0px">iputils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;'V'<br>
</div>
<div style=3D"margin: 0px">ethtool &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;5.3<br>
</div>
<div style=3D"margin: 0px">Kbd &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;2.2.0<br>
</div>
<div style=3D"margin: 0px">Sh-utils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; 8.31<br>
</div>
<div style=3D"margin: 0px">Modules Loaded &nbsp; &nbsp; &nbsp; &nbsp; nls_c=
p437 btrfs blake2b_generic xor zstd_decompress zstd_compress xxhash lzo_com=
press zlib_deflate raid6_pq fuse xt_MASQUERADE nf_conntrack_netlink nfnetli=
nk xfrm_user xfrm_algo iptable_filter iptable_nat nf_nat
 ip_tables overlay xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 =
libcrc32c xt_addrtype<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">free reports:<br>
</div>
<div style=3D"margin: 0px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 total &nbsp; &nbsp; &nbsp; &nbsp;used &nbsp; &nbsp; &nbsp; &nbsp;free &nbs=
p; &nbsp; &nbsp;shared &nbsp;buff/cache &nbsp; available<br>
</div>
<div style=3D"margin: 0px">Mem: &nbsp; &nbsp; &nbsp; &nbsp;8165700 &nbsp; &=
nbsp; &nbsp;160228 &nbsp; &nbsp; 7027496 &nbsp; &nbsp; &nbsp; 26152 &nbsp; =
&nbsp; &nbsp;977976 &nbsp; &nbsp; 7890824<br>
</div>
<div style=3D"margin: 0px">Swap: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0=
<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">cpuinfo:<br>
</div>
<div style=3D"margin: 0px">Architecture: &nbsp; &nbsp; &nbsp; &nbsp;riscv64=
<br>
</div>
<div style=3D"margin: 0px">Byte Order: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Li=
ttle Endian<br>
</div>
<div style=3D"margin: 0px">CPU(s): &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;4<br>
</div>
<div style=3D"margin: 0px">On-line CPU(s) list: 0-3<br>
</div>
<div style=3D"margin: 0px">Thread(s) per core: &nbsp;4<br>
</div>
<div style=3D"margin: 0px">Core(s) per socket: &nbsp;1<br>
</div>
<div style=3D"margin: 0px">Socket(s): &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1<=
br>
</div>
<div style=3D"margin: 0px">L1d cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 32=
 KiB<br>
</div>
<div style=3D"margin: 0px">L1i cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 32=
 KiB<br>
</div>
<div style=3D"margin: 0px">L2 cache: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;2 MiB<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">AppArmor disabled<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">SELinux mode: unknown<br>
</div>
<div style=3D"margin: 0px">no big block device was specified on commandline=
.<br>
</div>
<div style=3D"margin: 0px">Tests which require a big block device are disab=
led.<br>
</div>
<div style=3D"margin: 0px">You can specify it with option -z<br>
</div>
<div style=3D"margin: 0px">COMMAND: &nbsp; &nbsp;/opt/ltp/bin/ltp-pan &nbsp=
; -e -S &nbsp; -a 40320 &nbsp; &nbsp; -n 40320 -p -f /tmp/ltp-s8OHAGE4Sl/al=
ltests -l /opt/ltp/results/LTP_RUN_ON-2020_06_08-08h_20m_33s.log &nbsp;-C /=
opt/ltp/output/LTP_RUN_ON-2020_06_08-08h_20m_33s.failed -T /opt/ltp/output/=
LTP_RUN_ON-2020_06_08-08h_20m_33s.tconf<br>
</div>
<div style=3D"margin: 0px">INFO: Restricted to sched_rr_get_interval01<br>
</div>
<div style=3D"margin: 0px">LOG File: /opt/ltp/results/LTP_RUN_ON-2020_06_08=
-08h_20m_33s.log<br>
</div>
<div style=3D"margin: 0px">FAILED COMMAND File: /opt/ltp/output/LTP_RUN_ON-=
2020_06_08-08h_20m_33s.failed<br>
</div>
<div style=3D"margin: 0px">TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2=
020_06_08-08h_20m_33s.tconf<br>
</div>
<div style=3D"margin: 0px">Running tests.......<br>
</div>
<div style=3D"margin: 0px">&lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
</div>
<div style=3D"margin: 0px">tag=3Dsched_rr_get_interval01 stime=3D1591604435=
<br>
</div>
<div style=3D"margin: 0px">cmdline=3D&quot;sched_rr_get_interval01&quot;<br=
>
</div>
<div style=3D"margin: 0px">contacts=3D&quot;&quot;<br>
</div>
<div style=3D"margin: 0px">analysis=3Dexit<br>
</div>
<div style=3D"margin: 0px">&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
</div>
<div style=3D"margin: 0px">incrementing stop<br>
</div>
<div style=3D"margin: 0px"><b>sched_rr_get_interval01 &nbsp; &nbsp;1 &nbsp;=
TBROK &nbsp;: &nbsp;sched_rr_get_interval01.c:131: sched_setscheduler() fai=
led<br>
</b></div>
<div style=3D"margin: 0px"><b>sched_rr_get_interval01 &nbsp; &nbsp;2 &nbsp;=
TBROK &nbsp;: &nbsp;sched_rr_get_interval01.c:131: Remaining cases broken<b=
r>
</b></div>
<div style=3D"margin: 0px"><b>&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
</b></div>
<div style=3D"margin: 0px"><b>initiation_status=3D&quot;ok&quot;</b><br>
</div>
<div style=3D"margin: 0px">duration=3D0 termination_type=3Dexited terminati=
on_id=3D2 corefile=3Dno<br>
</div>
<div style=3D"margin: 0px">cutime=3D0 cstime=3D0<br>
</div>
<div style=3D"margin: 0px">&lt;&lt;&lt;test_end&gt;&gt;&gt;<br>
</div>
<div style=3D"margin: 0px">INFO: ltp-pan reported some tests FAIL<br>
</div>
<div style=3D"margin: 0px">LTP Version: 20200515-28-gb54247721<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">&nbsp; &nbsp; &nbsp; &nbsp;#####################=
##########################################<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Done e=
xecuting testcases.<br>
</div>
<div style=3D"margin: 0px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; LTP Ve=
rsion: &nbsp;20200515-28-gb54247721<br>
</div>
<div style=3D"margin: 0px">&nbsp; &nbsp; &nbsp; &nbsp;#####################=
##########################################<br>
</div>
<span style=3D"margin: 0px"></span><br>
</span></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px">How i can ressolve this issue??</span></div>
<br>
</div>
</body>
</html>

--_000_BMXPR01MB23442B106F1292542BA7F85CEE850BMXPR01MB2344INDP_--

--===============0403623731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0403623731==--
