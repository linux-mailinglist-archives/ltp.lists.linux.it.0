Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A49826792C
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Sep 2020 11:32:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97B3B3C4F74
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Sep 2020 11:32:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 66EEA3C2BD5
 for <ltp@lists.linux.it>; Sat, 12 Sep 2020 11:32:48 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380129.outbound.protection.outlook.com [40.107.138.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9F5C26009FA
 for <ltp@lists.linux.it>; Sat, 12 Sep 2020 11:32:46 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwNA+dJeKY4JmlKNUkHOQl3mI3yc7PHY8d2l+2qPdd5vtVkkwDdLRCO9ahb3k+f4nu7RJVDRewj/RfegsiddrzEwGJd6/6+TXc6pv2XCl+VqgFY8guVlxiVdaMzaHp6owGppKom8RZrQnik5JXEg278ZyYn/HL31pp8xNUBKiu5QT0TWBfTqC+f8JtC8EZcxyFAIyBq/1zsonusPf8rTpNIhb0T31zNOeUC0rX47pB08ydS2R/FThFBXw4GSQzd6jyUgZM8b8l2KtxMo+P+S8eA+HcgCXvOJxcsgZMdoefEbGte+Fp7XKedFAKwdNyC8O+hO1zXJ4i615etq/+k48A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTme1KhBBzdMIgQ5OK1y+rKe0+pkliFCiDLoTWjuX0o=;
 b=Hecd2a8pcGqz0S9mwduliQ9DC/ezbtJWVbcsISbjm0IfMyYHdycVeBWnI1BWGqvUHfHzeFgK4LjZcqF7g2cnDmlOiQJ7i3vpYvKFMhT+EFtNI9sGYGlztqxUDOaXx0O8M71xh7vrLDwzds8/xvZShmGovs8Rj7udwto8f7tgnQwX9a3yG/E+Z2sA8v6KBXwhrimb9cdPKi6vls2m6ipI129w7CQhFIBk8SY1lpwaBW+rHmAnY0wmMZsi+cnHd2Zps+vKMffRe5QMuSWvjSI4mJ4uWfDxSct5I6LhdrUwa1SRF6SRlP4uSV7Mc/3ODS6pqdVVS8C4tcNGo9qvxSjA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTme1KhBBzdMIgQ5OK1y+rKe0+pkliFCiDLoTWjuX0o=;
 b=rHgBFT4856ujO7Pb6HIAv8a28lu1GsUT2Xp3tR/ojnjlD4mQnpQwsgj6na1OCFt79fFRQru4oyxqHpYRLD265nE3SQJ/Jt7DL9s+yj7pVEW6VnbY0v5UO2Ig7cEBAPeCUXLAHKHmKQwN1YlJWcd2lv8XokJss3dIxEWZip5jiK0=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BMXPR01MB3142.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:63::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Sat, 12 Sep
 2020 09:32:37 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6144:6c26:b949:82c1]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6144:6c26:b949:82c1%5]) with mapi id 15.20.3370.017; Sat, 12 Sep 2020
 09:32:36 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: Error with fs_fill  
Thread-Index: AQHWiOb1wR+MxSPuakqLwclLaeYqcg==
Date: Sat, 12 Sep 2020 09:32:36 +0000
Message-ID: <BMXPR01MB23445019F67B128E04B26612EE250@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [157.33.175.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7a393d2-f887-4518-5b62-08d856fec92a
x-ms-traffictypediagnostic: BMXPR01MB3142:
x-microsoft-antispam-prvs: <BMXPR01MB31420B4B5B480D3A2FA9670FEE250@BMXPR01MB3142.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EnOaTI6nqf7b+1iBKQGMCfRKcO30vZq/dukGH3tItXxgr3eMMSt6Lwv7W2HOiR6BXZdYjDCaNSaKmHBV/nIdIO5+a0/m2WPdRTAX0y9McuWKsac/SpMPTuBLkd+0oWum/IyEccpe37pJRgLbws8cIEr8FQrlKzjS88i/gNO4LeL8WFRziU18Y99fiXTBSYlsOtWu/B+3enisjdUXWOC8oSC5fm5dyjNVTpnHwpNgTk78jNLsr9mTLO5UozEaVdz7ZifBVHriRM2S0xSANGotii8P/cD1R+XI+WB5inS2uUjl9C6v7cIvr3YWctp4L8okzaMefF73ZS+5JLsApPDDEA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(396003)(39830400003)(136003)(6916009)(71200400001)(8936002)(9686003)(2906002)(66476007)(186003)(83380400001)(66946007)(76116006)(33656002)(19627405001)(86362001)(66556008)(7696005)(66446008)(316002)(5660300002)(64756008)(6506007)(19627235002)(52536014)(26005)(478600001)(7116003)(8676002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: lx21txiBQleJz66L5Z6GISSQIZGpKlEZBYtbySDkKla27KHcTUSAZTjKy+3gsh3Ysa6Mwwx62PeKYciqcjTvb4evGj9gUzbtOe2ou2jZzbGjmwnECL4n332HG59YPBY0/A8NM0uF3+W3B8+8kmJ7iWik1Gipm+DWcyEy0sVNyJRwPrFEwRFMAYm1WfLytY1Wbhd4FsKnPc+wjWxlf8RLgZhjV73zhOv+0j30VrV8WOlpAUUee/yTTW2fiUxAkVry3uuUm+GbQW0aVDmimiBO6t3oAbKlzqGbxCiKT/gRNvL0gs8yU/uRIx9c9ExJJM+oIF6cz89pPIyRhEjOvh/7tLXHq7gwZtD+QnVTmK8NCsN/UKxfehoI7/VPbq1p7visLakxDJT9NvADFhILRlnT4MiZH4ZH5fibmZvI9DQwtPEXwWKQXRdHWuvNm3GInJ9J6qA229Gg2f+VwZdG2J5LyUwSanOAFGqrEnb+iy736tr5gWnY81lQnW5tO78zBjDQpO9k0NAOF5Ul+GIc0nZ3mpCzjt6M8EVID4AIumpwQcG4p4RHFPpJX2AgkKA8EwrYwEQS9tS8Ewm87kTwOIpUM1tA0EdKomencPYwg5ptj7sCcEO/lB2ZAbGlCcGUTuTzC03nJCj2ADGgp+Yi0JxqJA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a393d2-f887-4518-5b62-08d856fec92a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2020 09:32:36.8444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fGTGVSALqGLuW7RS8NjglejjH51vWIsCQBYsYnGpkoCzryxW7RhBLO6Loud+jkXGpATxQy8K6k3Zbkt9Gw5ZlKNgSfuUf5owqZlVI2t11Lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3142
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] Error with fs_fill
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
Content-Type: multipart/mixed; boundary="===============0997467172=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0997467172==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB23445019F67B128E04B26612EE250BMXPR01MB2344INDP_"

--_000_BMXPR01MB23445019F67B128E04B26612EE250BMXPR01MB2344INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am running fs_fill but the test getting failed with following error ,the =
strange thing is sometime its getting passed and sometime is getting failed

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
ethtool                5.3
Kbd                    2.2.0
Sh-utils               8.31
Modules Loaded         btrfs blake2b_generic libcrc32c xor zstd_decompress =
zstd_compress xxhash lzo_compress zlib_deflate raid6_pq fuse ofpart cmdline=
part spi_nor

free reports:
              total        used        free      shared  buff/cache   avail=
able
Mem:        8167360       59740     8021268        9764       86352     801=
8456
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
COMMAND:    /opt/ltp/bin/ltp-pan   -e -S   -a 506     -n 506 -p -f /tmp/ltp=
-VepGwU5U7h/alltests -l /opt/ltp/results/LTP_RUN_ON-2020_09_12-09h_22m_43s.=
log  -C /opt/ltp/output/LTP_RUN_ON-2020_09_12-09h_22m_43s.failed -T /opt/lt=
p/output/LTP_RUN_ON-2020_09_12-09h_22m_43s.tconf
INFO: Restricted to fs_fill
LOG File: /opt/ltp/results/LTP_RUN_ON-2020_09_12-09h_22m_43s.log
FAILED COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_12-09h_22m_43s.fail=
ed
TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_12-09h_22m_43s.tconf
Running tests.......
<<<test_start>>>
tag=3Dfs_fill stime=3D1599902564
cmdline=3D"fs_fill"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
incrementing stop
tst_device.c:89: INFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:60: INFO: Kernel supports ext2
tst_supported_fs_types.c:44: INFO: mkfs.ext2 does exist
tst_supported_fs_types.c:60: INFO: Kernel supports ext3
tst_supported_fs_types.c:44: INFO: mkfs.ext3 does exist
tst_supported_fs_types.c:60: INFO: Kernel supports ext4
tst_supported_fs_types.c:44: INFO: mkfs.ext4 does exist
tst_supported_fs_types.c:83: INFO: Filesystem xfs is not supported
tst_supported_fs_types.c:60: INFO: Kernel supports btrfs
tst_supported_fs_types.c:44: INFO: mkfs.btrfs does exist
tst_supported_fs_types.c:60: INFO: Kernel supports vfat
tst_supported_fs_types.c:40: INFO: mkfs.vfat does not exist
tst_supported_fs_types.c:83: INFO: Filesystem exfat is not supported
tst_supported_fs_types.c:83: INFO: Filesystem ntfs is not supported
tst_test.c:1316: INFO: Testing on ext2
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.45.4 (23-Sep-2019)
tst_test.c:1250: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 6 writer threads
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file1
fs_fill.c:87: PASS: Got 7 ENOSPC runtime 2545ms
tst_test.c:1316: INFO: Testing on ext3
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.45.4 (23-Sep-2019)
tst_test.c:1250: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 6 writer threads
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
fs_fill.c:87: PASS: Got 6 ENOSPC runtime 3280ms
tst_test.c:1316: INFO: Testing on ext4
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts=3D'' extra opts=
=3D''
mke2fs 1.45.4 (23-Sep-2019)
tst_test.c:1250: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 6 writer threads
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
fs_fill.c:87: PASS: Got 6 ENOSPC runtime 1969ms
tst_test.c:1316: INFO: Testing on btrfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opts=
=3D''
tst_test.c:1250: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 6 writer threads
     tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
safe_macros.c:366: BROK: fs_fill.c:55: unlink(mntpoint/thread4/file0) faile=
d: ENOSPC (28)

Summary:
passed   3
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D136 termination_type=3Dexited termination_id=3D2 corefile=3Dno
cutime=3D23 cstime=3D3275
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20200515-267-g9677c5573

       ###############################################################

            Done executing testcases.
            LTP Version:  20200515-267-g9677c5573
       ###############################################################

Can someone help me out why this  may haappen,what may be the possible reas=
on of failure ?

Thanks!

--_000_BMXPR01MB23445019F67B128E04B26612EE250BMXPR01MB2344INDP_
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
i am running fs_fill but the test getting failed with following error ,the =
strange thing is sometime its getting passed and sometime is getting failed=
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Gnu C &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gcc (GC=
C) 8.3.0
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
<div>ethtool &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5.3</di=
v>
<div>Kbd &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;2.2.0</div>
<div>Sh-utils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8.31</div>
<div>Modules Loaded &nbsp; &nbsp; &nbsp; &nbsp; btrfs blake2b_generic libcr=
c32c xor zstd_decompress zstd_compress xxhash lzo_compress zlib_deflate rai=
d6_pq fuse ofpart cmdlinepart spi_nor</div>
<div><br>
</div>
<div>free reports:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total &nbsp; &nbsp; &=
nbsp; &nbsp;used &nbsp; &nbsp; &nbsp; &nbsp;free &nbsp; &nbsp; &nbsp;shared=
 &nbsp;buff/cache &nbsp; available</div>
<div>Mem: &nbsp; &nbsp; &nbsp; &nbsp;8167360 &nbsp; &nbsp; &nbsp; 59740 &nb=
sp; &nbsp; 8021268 &nbsp; &nbsp; &nbsp; &nbsp;9764 &nbsp; &nbsp; &nbsp; 863=
52 &nbsp; &nbsp; 8018456</div>
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
<div>COMMAND: &nbsp; &nbsp;/opt/ltp/bin/ltp-pan &nbsp; -e -S &nbsp; -a 506 =
&nbsp; &nbsp; -n 506 -p -f /tmp/ltp-VepGwU5U7h/alltests -l /opt/ltp/results=
/LTP_RUN_ON-2020_09_12-09h_22m_43s.log &nbsp;-C /opt/ltp/output/LTP_RUN_ON-=
2020_09_12-09h_22m_43s.failed -T /opt/ltp/output/LTP_RUN_ON-2020_09_12-09h_=
22m_43s.tconf</div>
<div>INFO: Restricted to fs_fill</div>
<div>LOG File: /opt/ltp/results/LTP_RUN_ON-2020_09_12-09h_22m_43s.log</div>
<div>FAILED COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_12-09h_22m_43s=
.failed</div>
<div>TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_12-09h_22m_43s.=
tconf</div>
<div>Running tests.......</div>
<div>&lt;&lt;&lt;test_start&gt;&gt;&gt;</div>
<div>tag=3Dfs_fill stime=3D1599902564</div>
<div>cmdline=3D&quot;fs_fill&quot;</div>
<div>contacts=3D&quot;&quot;</div>
<div>analysis=3Dexit</div>
<div>&lt;&lt;&lt;test_output&gt;&gt;&gt;</div>
<div>incrementing stop</div>
<div>tst_device.c:89: INFO: Found free device 0 '/dev/loop0'</div>
<div>tst_supported_fs_types.c:60: INFO: Kernel supports ext2</div>
<div>tst_supported_fs_types.c:44: INFO: mkfs.ext2 does exist</div>
<div>tst_supported_fs_types.c:60: INFO: Kernel supports ext3</div>
<div>tst_supported_fs_types.c:44: INFO: mkfs.ext3 does exist</div>
<div>tst_supported_fs_types.c:60: INFO: Kernel supports ext4</div>
<div>tst_supported_fs_types.c:44: INFO: mkfs.ext4 does exist</div>
<div>tst_supported_fs_types.c:83: INFO: Filesystem xfs is not supported</di=
v>
<div>tst_supported_fs_types.c:60: INFO: Kernel supports btrfs</div>
<div>tst_supported_fs_types.c:44: INFO: mkfs.btrfs does exist</div>
<div>tst_supported_fs_types.c:60: INFO: Kernel supports vfat</div>
<div>tst_supported_fs_types.c:40: INFO: mkfs.vfat does not exist</div>
<div>tst_supported_fs_types.c:83: INFO: Filesystem exfat is not supported</=
div>
<div>tst_supported_fs_types.c:83: INFO: Filesystem ntfs is not supported</d=
iv>
<div>tst_test.c:1316: INFO: Testing on ext2</div>
<div>tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts=3D'' extra o=
pts=3D''</div>
<div>mke2fs 1.45.4 (23-Sep-2019)</div>
<div>tst_test.c:1250: INFO: Timeout per run is 0h 05m 00s</div>
<div>fs_fill.c:103: INFO: Running 6 writer threads</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file1</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file1</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file1</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file1</div>
<div>fs_fill.c:87: PASS: Got 7 ENOSPC runtime 2545ms</div>
<div>tst_test.c:1316: INFO: Testing on ext3</div>
<div>tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts=3D'' extra o=
pts=3D''</div>
<div>mke2fs 1.45.4 (23-Sep-2019)</div>
<div>tst_test.c:1250: INFO: Timeout per run is 0h 05m 00s</div>
<div>fs_fill.c:103: INFO: Running 6 writer threads</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0</div>
<div>fs_fill.c:87: PASS: Got 6 ENOSPC runtime 3280ms</div>
<div>tst_test.c:1316: INFO: Testing on ext4</div>
<div>tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts=3D'' extra o=
pts=3D''</div>
<div>mke2fs 1.45.4 (23-Sep-2019)</div>
<div>tst_test.c:1250: INFO: Timeout per run is 0h 05m 00s</div>
<div>fs_fill.c:103: INFO: Running 6 writer threads</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file1</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file1</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1</div>
<div>fs_fill.c:87: PASS: Got 6 ENOSPC runtime 1969ms</div>
<div>tst_test.c:1316: INFO: Testing on btrfs</div>
<div>tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts=3D'' extra =
opts=3D''</div>
<div>tst_test.c:1250: INFO: Timeout per run is 0h 05m 00s</div>
<div>fs_fill.c:103: INFO: Running 6 writer threads</div>
<div>&nbsp; &nbsp; &nbsp;tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>tst_fill_fs.c:59: INFO: write(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0</div>
<div>tst_fill_fs.c:39: INFO: open(): ENOSPC (28)</div>
<div>tst_fill_fs.c:39: INFO: open(): ENOSPC (28)</div>
<div>tst_fill_fs.c:39: INFO: open(): ENOSPC (28)</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0</div>
<div>fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0</div>
<div><b>safe_macros.c:366: BROK: fs_fill.c:55: unlink(mntpoint/thread4/file=
0) failed: ENOSPC (28)</b></div>
<div><br>
</div>
<div>Summary:</div>
<div>passed &nbsp; 3</div>
<div>failed &nbsp; 0</div>
<div>skipped &nbsp;0</div>
<div>warnings 0</div>
<div>&lt;&lt;&lt;execution_status&gt;&gt;&gt;</div>
<div>initiation_status=3D&quot;ok&quot;</div>
<div>duration=3D136 termination_type=3Dexited termination_id=3D2 corefile=
=3Dno</div>
<div>cutime=3D23 cstime=3D3275</div>
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
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Can someone help me out why this&nbsp; may haappen,what may be the possible=
 reason of failure ?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks!</div>
</body>
</html>

--_000_BMXPR01MB23445019F67B128E04B26612EE250BMXPR01MB2344INDP_--

--===============0997467172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0997467172==--
