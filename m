Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 455341F51B5
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 11:59:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA1633C2E3C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 11:59:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 82E333C0198
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 11:59:11 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380124.outbound.protection.outlook.com [40.107.138.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7EFF8600910
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 11:59:07 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKUy0+UUX3GNoxKHxf9+wG287Nkw9Fe2J5MK5A/xcZ9PJ3w8RGpU1KV+gQoqOZiz13bNkERbnR/40lYAo7+oCuajBicg7kMj5ShBH5QKsTWHXFteWUMtJkalJKcpx9ASga/E1p0YCEohnO/ZUkZ4Kd4rrSZo2ce5Tspc4tluwOeMP2uAGILR/b/iYVtafmstVLp2Aji+Q5QCA9uVmV4xs7QEoDpEScg+8Kzm0FiJBKZzuC8WrXdvMUtJmM6YDwz7J9AWscAXo6iUeRkhu8xLSRrXW9Fs8K5zHxGpjKUHaFwNoFy+fsQ/kd58tyTMiWtAKez14Ep5mH8pvg51qiU7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUNK3qR8aVNYrgMOVElsP2eo8Vv2aGz9asIQbbuy5bo=;
 b=kOzQ/wGKxmel7iZeGsyfM13E9DzITAU0uMTNfwX9U6K3VZYZn2jiHnRJBAfLXMfvWosaxO56kRAUlkxHVrjDr2lkYlBXoKYOTATcVzjwpWplT1bSRPIMly7ff8JYwOsjW/WYMoqS7PgxVwbuwLQstcyQhEBaSnGBPLdVa1SSj6kF6wdzAOyFqWXxidVuhu3oROhnktnkG4JLkmKx8DSSLphZa+IP1ne098ue/V1GUL8NiPqtaTM0x3DOmXNeQkVzsLtxjDkKaApaBN4ErFtEWmnQ9ZtHjIUSY3YrdOmvuPrwC0z30HzSRPWEAjI1H2Qe6NGDdC3EyVHtnJ1+hPxXVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUNK3qR8aVNYrgMOVElsP2eo8Vv2aGz9asIQbbuy5bo=;
 b=dqLL36Hacfq/7DXT/8f8ZLOJ8/JEbK0Z73H/UtPImLxyVaiGOaE3NjL0y/43X0FCz2RG9xpyApjKvWWsAWFajfzQML1do+1GxBfYxbj/jfh9ujFZ1iwui1Aeq0D08fRTL5oJiTHjjdBAt1YWOJhlxG1MlnnBkiKv3T3vCEl22G4=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BMXPR01MB0949.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:13::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Wed, 10 Jun
 2020 09:59:02 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bc78:c2b:bbf1:704]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bc78:c2b:bbf1:704%2]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 09:59:02 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: Memory testcases memcg_max_usage_in_bytes, memcg_stat ,
 memcg_use_hierarchy , memcg_usage_in_bytes  failures
Thread-Index: AQHWPwD6Fs8GfIiZY0WNKQUb/HWSFg==
Date: Wed, 10 Jun 2020 09:59:02 +0000
Message-ID: <BMXPR01MB23446DABE616696D41B6CF4DEE830@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [2409:4042:2e02:3aee:f5cd:700e:88bf:accb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99116c4f-7893-4065-c07d-08d80d24e799
x-ms-traffictypediagnostic: BMXPR01MB0949:
x-microsoft-antispam-prvs: <BMXPR01MB094988E266F7A7A85DEF41BBEE830@BMXPR01MB0949.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0430FA5CB7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QO9ZRqJKLm/5PCd0CMLPKdNmRV8urF65qTHxFcUBw/fh0PVo2R1+eCG8sMUBhylLEXWelcVKFKjD+LWUfEVKfMh9w7xb0m3/67bPEg1K3sNFMJXMvMhmM4jMhGQloInxWjhb21tzdLlbN3QBBG2QliByeTw+3n99lRE7raesUqBQ9ry8t8Xx5TcjBAzEP/BNEu2RT/Xz9UsBfFs/y66foiDO3ljNCHU81PiCO+CpvwtxuEUp8HoP1uJtRzsECc9MJR30hmwhFt0QE2lMqfb8uyJXu1C4nv8gJyJ5cZWOu7SUxM06xx/YdzaDUfq41OmyPyinA0KHQ7SBRQrwOoeFNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39830400003)(346002)(136003)(396003)(376002)(366004)(186003)(6916009)(64756008)(8676002)(30864003)(19627235002)(66946007)(33656002)(66476007)(66556008)(66446008)(76116006)(316002)(2906002)(5660300002)(71200400001)(6506007)(52536014)(508600001)(83380400001)(19627405001)(86362001)(8936002)(55016002)(9686003)(7696005)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: N3GV6dazxTWvtOdAWiQawSi4ATOyyMdT9eP3D/SB29F/SZkemFvYwS75dmRABvtyQMiIJ06HlqKWQX9rPOxkqhaDOfbpsXuQhH4u5Bck3ZxdnRQaRbRLjRJaal6DoF++gYNHZDoHbjrfZ5fCGmvOuLGTSqAPjSkHUdTorMXPiyhiTGBcPy0DBpUGYH/Akn/bOvmv56+k2bzYiCliCHA+rTyvzFcr0WRRFyNh0hADO0xgTSm1HUDEuJuRoY+89Hivhc62BZM1s9JRsdsCknpvsnwLUDW9u2nzF3rJLy0n5tkEgu6hE9fSqKx8cdyjSpDSdm8PUWLb5LJbrqCCmeppTlcTyeMTh8IrX0Up5P41mQ37SiS06dKnI8z1WQu9SkZIWNJHrqEQv7VbNXxJ790h9Ll82HfnxOnXl6DwSsNxm6uf7DTxe5gbRlnmpqVCvKVAUokAoI0xL+AFw4CT44quZul7fYPl50Xi6cVBVMZCOE7okr520SilLIANRc1oJ2Do8YGLp2gvvTQjwOfBFmBw8SOnifkcXaV4V3rYGmnPHH7i5VqOrT70FShFydzzat3V
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99116c4f-7893-4065-c07d-08d80d24e799
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2020 09:59:02.7142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98MSv58Kle/pD8nPH7KN7LoUZHlqkD/BvUMlHZJYONTmsAm9eDnWvEnpwfR8dgoihVbqbBdSzStN33noqI+Sh8D4dYRNRAoAr1ogHgGIlR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0949
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] Memory testcases memcg_max_usage_in_bytes, memcg_stat ,
 memcg_use_hierarchy , memcg_usage_in_bytes  failures
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
Content-Type: multipart/mixed; boundary="===============0749174477=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0749174477==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB23446DABE616696D41B6CF4DEE830BMXPR01MB2344INDP_"

--_000_BMXPR01MB23446DABE616696D41B6CF4DEE830BMXPR01MB2344INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

 Hi,
I am running ltp memory group tests but i found that all of follwing tests =
are getting failed

1)memcg_max_usage_in_bytes
2) memcg_stat
 3)memcg_use_hierarchy
4)memcg_usage_in_bytes

i am attaching the output for memcg_max_usage_in_bytes with strace


root@exaleapsemi-r2:/opt/ltp# strace ./runltp -s memcg_max_usage_in_bytes
execve("./runltp", ["./runltp", "-s", "memcg_max_usage_in_bytes"], 0x3fffec=
6ca0 /* 16 vars */) =3D 0
brk(NULL)                               =3D 0xda000
uname({sysname=3D"Linux", nodename=3D"exaleapsemi-r2.00", ...}) =3D 0
faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) =3D -1 ENOENT (No such file=
 or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 3
fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D70080, ...}) =3D 0
mmap(NULL, 70080, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x3fe4e55000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib/libtinfo.so.5", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0000\317\0\0\0\0\0=
\0"..., 832) =3D 832
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D159728, ...}) =3D 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x3fe4e53000
mmap(NULL, 163688, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0x3fe4e2b000
mprotect(0x3fe4e4d000, 4096, PROT_NONE) =3D 0
mmap(0x3fe4e4e000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_D=
ENYWRITE, 3, 0x22000) =3D 0x3fe4e4e000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib/libdl.so.2", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0\200\16\0\0\0\0\0=
\0"..., 832) =3D 832
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D10200, ...}) =3D 0
mmap(NULL, 12600, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0x3fe4e27000
mmap(0x3fe4e29000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DE=
NYWRITE, 3, 0x1000) =3D 0x3fe4e29000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0d5\2\0\0\0\0\0"..=
., 832) =3D 832
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D1065488, ...}) =3D 0
mmap(NULL, 1076752, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0x3fe4d20000
mmap(0x3fe4e1e000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_D=
ENYWRITE, 3, 0xfd000) =3D 0x3fe4e1e000
mmap(0x3fe4e24000, 11792, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_A=
NONYMOUS, -1, 0) =3D 0x3fe4e24000
close(3)                                =3D 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x3fe4d1e000
mprotect(0x3fe4e1e000, 12288, PROT_READ) =3D 0
mprotect(0x3fe4e29000, 4096, PROT_READ) =3D 0
mprotect(0x3fe4e4e000, 16384, PROT_READ) =3D 0
mprotect(0xc6000, 4096, PROT_READ)      =3D 0
mprotect(0x3fe4e81000, 4096, PROT_READ) =3D 0
munmap(0x3fe4e55000, 70080)             =3D 0
openat(AT_FDCWD, "/dev/tty", O_RDWR|O_NONBLOCK) =3D 3
close(3)                                =3D 0
brk(NULL)                               =3D 0xda000
brk(0xfb000)                            =3D 0xfb000
getuid()                                =3D 0
getgid()                                =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
gettimeofday({tv_sec=3D1591782637, tv_usec=3D418138}, NULL) =3D 0
ioctl(-1, TIOCGPGRP, 0x3ffff9697c)      =3D -1 EBADF (Bad file descriptor)
sysinfo({uptime=3D77613, loads=3D[8041888, 24363616, 33553888], totalram=3D=
8361676800, freeram=3D2712469504, sharedram=3D77869056, bufferram=3D1584373=
76, totalswap=3D0, freeswap=3D0, procs=3D167, totalhigh=3D0, freehigh=3D0, =
mem_unit=3D1}) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8) =3D=
 0
rt_sigaction(SIGINT, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGQUIT, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, {=
sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGQUIT, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, {=
sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTSTP, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, {=
sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTSTP, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, {=
sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTTIN, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, {=
sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTTIN, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, {=
sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTTOU, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, {=
sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTTOU, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, {=
sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  =3D 0
rt_sigaction(SIGQUIT, {sa_handler=3DSIG_IGN, sa_mask=3D[], sa_flags=3D0}, {=
sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
uname({sysname=3D"Linux", nodename=3D"exaleapsemi-r2.00", ...}) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp", {st_mode=3DS_IFDIR|0755, st_size=3D4096, .=
..}, 0) =3D 0
newfstatat(AT_FDCWD, ".", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}, 0)=
 =3D 0
newfstatat(AT_FDCWD, "/opt", {st_mode=3DS_IFDIR|0711, st_size=3D4096, ...},=
 0) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp", {st_mode=3DS_IFDIR|0755, st_size=3D4096, .=
..}, 0) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp/testcases", {st_mode=3DS_IFDIR|0755, st_size=
=3D4096, ...}, 0) =3D 0
getpid()                                =3D 3700274
getppid()                               =3D 3700270
gettimeofday({tv_sec=3D1591782637, tv_usec=3D435083}, NULL) =3D 0
getpid()                                =3D 3700274
getpgid(0)                              =3D 3700270
ioctl(2, TIOCGPGRP, [3700270])          =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8) =3D=
 0
prlimit64(0, RLIMIT_NPROC, NULL, {rlim_cur=3D63791, rlim_max=3D63791}) =3D =
0
openat(AT_FDCWD, "./runltp", O_RDONLY)  =3D 3
newfstatat(AT_FDCWD, "./runltp", {st_mode=3DS_IFREG|0755, st_size=3D37752, =
...}, 0) =3D 0
ioctl(3, TCGETS, 0x3ffff96928)          =3D -1 ENOTTY (Inappropriate ioctl =
for device)
lseek(3, 0, SEEK_CUR)                   =3D 0
read(3, "#!/bin/sh\n######################"..., 80) =3D 80
lseek(3, 0, SEEK_SET)                   =3D 0
prlimit64(0, RLIMIT_NOFILE, NULL, {rlim_cur=3D1024, rlim_max=3D512*1024}) =
=3D 0
fcntl(255, F_GETFD)                     =3D -1 EBADF (Bad file descriptor)
dup3(3, 255, 0)                         =3D 255
close(3)                                =3D 0
fcntl(255, F_SETFD, FD_CLOEXEC)         =3D 0
fcntl(255, F_GETFL)                     =3D 0x8000 (flags O_RDONLY|O_LARGEF=
ILE)
fstat(255, {st_mode=3DS_IFREG|0755, st_size=3D37752, ...}) =3D 0
lseek(255, 0, SEEK_CUR)                 =3D 0
read(255, "#!/bin/sh\n######################"..., 8192) =3D 8192
read(255, "RN      Only run test cases whic"..., 8192) =3D 8192
read(255, "K_TYPE=3D\"$OPTARG\";;\n\n        N)  "..., 8192) =3D 8192
brk(0x11c000)                           =3D 0x11c000
read(255, "run\n    # these tests.  As a saf"..., 8192) =3D 8192
read(255, "   fi\n        if [ \"$OUTPUTFILE_"..., 8192) =3D 4984
brk(0x13d000)                           =3D 0x13d000
brk(0x15e000)                           =3D 0x15e000
brk(0x17f000)                           =3D 0x17f000
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  =3D 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
lseek(255, -87, SEEK_CUR)               =3D 37665
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700303
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8) =3D=
 0
close(4)                                =3D 0
read(3, "runltp\n", 128)                =3D 7
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700303, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], WNOHANG, NULL) =3D 3=
700303
wait4(-1, 0x3ffff95c08, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 7
read(3, "", 128)                        =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
read(255, "\nif [ \"$LTP_SCRIPT\" =3D \"runltp\" ]"..., 8192) =3D 87
rt_sigaction(SIGHUP, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP ABR=
T BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D0=
}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP ABR=
T BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D0=
}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGILL, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP ABR=
T BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D0=
}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTRAP, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP AB=
RT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGABRT, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP AB=
RT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGFPE, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP ABR=
T BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D0=
}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGBUS, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP ABR=
T BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D0=
}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGSEGV, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP AB=
RT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGSYS, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP ABR=
T BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D0=
}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGPIPE, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP AB=
RT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGALRM, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP AB=
RT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTERM, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP AB=
RT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGXCPU, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP AB=
RT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGXFSZ, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP AB=
RT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGVTALRM, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP =
ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=
=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGUSR1, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP AB=
RT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGUSR2, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP AB=
RT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700311
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8) =3D=
 0
close(4)                                =3D 0
read(3, ".\n", 128)                     =3D 2
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700311, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], WNOHANG, NULL) =3D 3=
700311
wait4(-1, 0x3ffff94df8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 2
read(3, "", 128)                        =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP ABRT BUS FPE USR1 SEGV USR=
2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
newfstatat(AT_FDCWD, "/opt", {st_mode=3DS_IFDIR|0711, st_size=3D4096, ...},=
 0) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp", {st_mode=3DS_IFDIR|0755, st_size=3D4096, .=
..}, 0) =3D 0
chdir("/opt/ltp")                       =3D 0
newfstatat(AT_FDCWD, "/opt/ltp/testcases/bin", {st_mode=3DS_IFDIR|0755, st_=
size=3D135168, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp/bin/ltp-pan", {st_mode=3DS_IFREG|0775, st_si=
ze=3D132904, ...}, 0) =3D 0
brk(0x1a0000)                           =3D 0x1a0000
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700316
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8) =3D=
 0
close(4)                                =3D 0
read(3, "2020_06_10-09h_50m_37s\n", 128) =3D 23
read(3, "", 128)                        =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700316
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700316, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff90758, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700320
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8) =3D=
 0
close(4)                                =3D 0
read(3, "20200515-28-gb54247721\n", 128) =3D 23
read(3, "", 128)                        =3D 0
close(3)                                =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700320, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], WNOHANG, NULL) =3D 3=
700320
wait4(-1, 0x3ffff909c8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700324
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8) =3D=
 0
close(4)                                =3D 0
read(3, "2020_06_10-09h_50m_37s\n", 128) =3D 23
read(3, "", 128)                        =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700324
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700324, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff90668, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700326
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8) =3D=
 0
close(4)                                =3D 0
read(3, "2020_06_10-09h_50m_37s\n", 128) =3D 23
read(3, "", 128)                        =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700326, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], WNOHANG, NULL) =3D 3=
700326
wait4(-1, 0x3ffff908e8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp/output", {st_mode=3DS_IFDIR|0755, st_size=3D=
253952, ...}, 0) =3D 0
fstat(1, {st_mode=3DS_IFCHR|0620, st_rdev=3Dmakedev(0x88, 0x2), ...}) =3D 0
write(1, "INFO: creating /opt/ltp/results "..., 42INFO: creating /opt/ltp/r=
esults directory
) =3D 42
newfstatat(AT_FDCWD, "/opt/ltp/results", {st_mode=3DS_IFDIR|0755, st_size=
=3D114688, ...}, 0) =3D 0
newfstatat(AT_FDCWD, ".", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}, 0)=
 =3D 0
newfstatat(AT_FDCWD, "/usr/local/bin/mkdir", 0x3ffff91a80, 0) =3D -1 ENOENT=
 (No such file or directory)
newfstatat(AT_FDCWD, "/usr/bin/mkdir", 0x3ffff91a80, 0) =3D -1 ENOENT (No s=
uch file or directory)
newfstatat(AT_FDCWD, "/bin/mkdir", {st_mode=3DS_IFREG|0755, st_size=3D31376=
, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/mkdir", {st_mode=3DS_IFREG|0755, st_size=3D31376=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/mkdir", X_OK) =3D 0
newfstatat(AT_FDCWD, "/bin/mkdir", {st_mode=3DS_IFREG|0755, st_size=3D31376=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/mkdir", R_OK) =3D 0
newfstatat(AT_FDCWD, "/bin/mkdir", {st_mode=3DS_IFREG|0755, st_size=3D31376=
, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/mkdir", {st_mode=3DS_IFREG|0755, st_size=3D31376=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/mkdir", X_OK) =3D 0
newfstatat(AT_FDCWD, "/bin/mkdir", {st_mode=3DS_IFREG|0755, st_size=3D31376=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/mkdir", R_OK) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [INT CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [INT CHLD], NULL, 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700333
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700333
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
newfstatat(AT_FDCWD, "/home/root/.terminfo", 0x18c6d0, 0) =3D -1 ENOENT (No=
 such file or directory)
newfstatat(AT_FDCWD, "/etc/terminfo", {st_mode=3DS_IFDIR|0755, st_size=3D40=
96, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/usr/share/terminfo", 0x18c750, 0) =3D -1 ENOENT (No =
such file or directory)
gettimeofday({tv_sec=3D1591782637, tv_usec=3D579431}, NULL) =3D 0
faccessat(AT_FDCWD, "/etc/terminfo/x/xterm-256color", R_OK) =3D 0
openat(AT_FDCWD, "/etc/terminfo/x/xterm-256color", O_RDONLY) =3D 3
fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D3778, ...}) =3D 0
read(3, "\32\1%\0&\0\17\0\235\0010\6xterm-256color|xterm"..., 4096) =3D 377=
8
read(3, "", 4096)                       =3D 0
close(3)                                =3D 0
gettimeofday({tv_sec=3D1591782637, tv_usec=3D580910}, NULL) =3D 0
ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
ioctl(1, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
ioctl(0, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700333, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff91758, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700337
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8) =3D=
 0
close(4)                                =3D 0
read(3, "/tmp/ltp-s7eufFujpP\n", 128)   =3D 20
read(3, "", 128)                        =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700337
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700337, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff914b8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
newfstatat(AT_FDCWD, ".", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}, 0)=
 =3D 0
newfstatat(AT_FDCWD, "/usr/local/bin/chmod", 0x3ffff92110, 0) =3D -1 ENOENT=
 (No such file or directory)
newfstatat(AT_FDCWD, "/usr/bin/chmod", 0x3ffff92110, 0) =3D -1 ENOENT (No s=
uch file or directory)
newfstatat(AT_FDCWD, "/bin/chmod", {st_mode=3DS_IFREG|0755, st_size=3D43680=
, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/chmod", {st_mode=3DS_IFREG|0755, st_size=3D43680=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/chmod", X_OK) =3D 0
newfstatat(AT_FDCWD, "/bin/chmod", {st_mode=3DS_IFREG|0755, st_size=3D43680=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/chmod", R_OK) =3D 0
newfstatat(AT_FDCWD, "/bin/chmod", {st_mode=3DS_IFREG|0755, st_size=3D43680=
, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/chmod", {st_mode=3DS_IFREG|0755, st_size=3D43680=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/chmod", X_OK) =3D 0
newfstatat(AT_FDCWD, "/bin/chmod", {st_mode=3DS_IFREG|0755, st_size=3D43680=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/chmod", R_OK) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [INT CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [INT CHLD], NULL, 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700342
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700342
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700342, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff91de8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
newfstatat(AT_FDCWD, "/tmp", {st_mode=3DS_IFDIR|S_ISVTX|0777, st_size=3D280=
, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/tmp/ltp-s7eufFujpP", {st_mode=3DS_IFDIR|0777, st_siz=
e=3D40, ...}, 0) =3D 0
chdir("/tmp/ltp-s7eufFujpP")            =3D 0
newfstatat(AT_FDCWD, ".", {st_mode=3DS_IFDIR|0777, st_size=3D40, ...}, 0) =
=3D 0
newfstatat(AT_FDCWD, "/usr/local/bin/cat", 0x3ffff91e90, 0) =3D -1 ENOENT (=
No such file or directory)
newfstatat(AT_FDCWD, "/usr/bin/cat", 0x3ffff91e90, 0) =3D -1 ENOENT (No suc=
h file or directory)
newfstatat(AT_FDCWD, "/bin/cat", {st_mode=3DS_IFREG|0755, st_size=3D27224, =
...}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/cat", {st_mode=3DS_IFREG|0755, st_size=3D27224, =
...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/cat", X_OK)   =3D 0
newfstatat(AT_FDCWD, "/bin/cat", {st_mode=3DS_IFREG|0755, st_size=3D27224, =
...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/cat", R_OK)   =3D 0
newfstatat(AT_FDCWD, "/bin/cat", {st_mode=3DS_IFREG|0755, st_size=3D27224, =
...}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/cat", {st_mode=3DS_IFREG|0755, st_size=3D27224, =
...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/cat", X_OK)   =3D 0
newfstatat(AT_FDCWD, "/bin/cat", {st_mode=3DS_IFREG|0755, st_size=3D27224, =
...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/cat", R_OK)   =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700347
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, INFO: no command files were provided. Executing following runtest=
 scenario files:
syscalls fs fs_perms_simple fsx dio io mm ipc sched math nptl pty container=
s fs_bind controllers filecaps cap_bounds fcntl-locktests connectors power_=
management_tests hugetlb commands hyperthreading can cpuhotplug net.ipv6_li=
b input cve crypto kernel_misc uevent

[{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700347
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700347, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff91b68, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
newfstatat(AT_FDCWD, ".", {st_mode=3DS_IFDIR|0777, st_size=3D40, ...}, 0) =
=3D 0
newfstatat(AT_FDCWD, "/usr/local/bin/touch", 0x3ffff92130, 0) =3D -1 ENOENT=
 (No such file or directory)
newfstatat(AT_FDCWD, "/usr/bin/touch", 0x3ffff92130, 0) =3D -1 ENOENT (No s=
uch file or directory)
newfstatat(AT_FDCWD, "/bin/touch", {st_mode=3DS_IFREG|0755, st_size=3D64216=
, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/touch", {st_mode=3DS_IFREG|0755, st_size=3D64216=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/touch", X_OK) =3D 0
newfstatat(AT_FDCWD, "/bin/touch", {st_mode=3DS_IFREG|0755, st_size=3D64216=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/touch", R_OK) =3D 0
newfstatat(AT_FDCWD, "/bin/touch", {st_mode=3DS_IFREG|0755, st_size=3D64216=
, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/touch", {st_mode=3DS_IFREG|0755, st_size=3D64216=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/touch", X_OK) =3D 0
newfstatat(AT_FDCWD, "/bin/touch", {st_mode=3DS_IFREG|0755, st_size=3D64216=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/touch", R_OK) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700363
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700363
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700363, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff91e08, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700367
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(4)                                =3D 0
close(4)                                =3D -1 EBADF (Bad file descriptor)
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700369
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700367
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700369
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(3)                                =3D -1 EBADF (Bad file descriptor)
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700367, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff91f48, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
newfstatat(AT_FDCWD, ".", {st_mode=3DS_IFDIR|0777, st_size=3D80, ...}, 0) =
=3D 0
newfstatat(AT_FDCWD, "/usr/local/bin/rm", 0x3ffff923d0, 0) =3D -1 ENOENT (N=
o such file or directory)
newfstatat(AT_FDCWD, "/usr/bin/rm", 0x3ffff923d0, 0) =3D -1 ENOENT (No such=
 file or directory)
newfstatat(AT_FDCWD, "/bin/rm", {st_mode=3DS_IFREG|0755, st_size=3D47840, .=
..}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/rm", {st_mode=3DS_IFREG|0755, st_size=3D47840, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/rm", X_OK)    =3D 0
newfstatat(AT_FDCWD, "/bin/rm", {st_mode=3DS_IFREG|0755, st_size=3D47840, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/rm", R_OK)    =3D 0
newfstatat(AT_FDCWD, "/bin/rm", {st_mode=3DS_IFREG|0755, st_size=3D47840, .=
..}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/rm", {st_mode=3DS_IFREG|0755, st_size=3D47840, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/rm", X_OK)    =3D 0
newfstatat(AT_FDCWD, "/bin/rm", {st_mode=3DS_IFREG|0755, st_size=3D47840, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/rm", R_OK)    =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700445
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700445
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700445, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff920a8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
newfstatat(AT_FDCWD, ".", {st_mode=3DS_IFDIR|0777, st_size=3D60, ...}, 0) =
=3D 0
newfstatat(AT_FDCWD, "/usr/local/bin/mv", 0x3ffff92a40, 0) =3D -1 ENOENT (N=
o such file or directory)
newfstatat(AT_FDCWD, "/usr/bin/mv", 0x3ffff92a40, 0) =3D -1 ENOENT (No such=
 file or directory)
newfstatat(AT_FDCWD, "/bin/mv", {st_mode=3DS_IFREG|0755, st_size=3D81096, .=
..}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/mv", {st_mode=3DS_IFREG|0755, st_size=3D81096, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/mv", X_OK)    =3D 0
newfstatat(AT_FDCWD, "/bin/mv", {st_mode=3DS_IFREG|0755, st_size=3D81096, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/mv", R_OK)    =3D 0
newfstatat(AT_FDCWD, "/bin/mv", {st_mode=3DS_IFREG|0755, st_size=3D81096, .=
..}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/mv", {st_mode=3DS_IFREG|0755, st_size=3D81096, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/mv", X_OK)    =3D 0
newfstatat(AT_FDCWD, "/bin/mv", {st_mode=3DS_IFREG|0755, st_size=3D81096, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/mv", R_OK)    =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700453
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700453
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700453, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff92718, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
newfstatat(AT_FDCWD, ".", {st_mode=3DS_IFDIR|0777, st_size=3D60, ...}, 0) =
=3D 0
newfstatat(AT_FDCWD, "/usr/local/bin/grep", 0x3ffff92a60, 0) =3D -1 ENOENT =
(No such file or directory)
newfstatat(AT_FDCWD, "/usr/bin/grep", 0x3ffff92a60, 0) =3D -1 ENOENT (No su=
ch file or directory)
newfstatat(AT_FDCWD, "/bin/grep", {st_mode=3DS_IFREG|0755, st_size=3D150800=
, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/grep", {st_mode=3DS_IFREG|0755, st_size=3D150800=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/grep", X_OK)  =3D 0
newfstatat(AT_FDCWD, "/bin/grep", {st_mode=3DS_IFREG|0755, st_size=3D150800=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/grep", R_OK)  =3D 0
newfstatat(AT_FDCWD, "/bin/grep", {st_mode=3DS_IFREG|0755, st_size=3D150800=
, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/grep", {st_mode=3DS_IFREG|0755, st_size=3D150800=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/grep", X_OK)  =3D 0
newfstatat(AT_FDCWD, "/bin/grep", {st_mode=3DS_IFREG|0755, st_size=3D150800=
, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/grep", R_OK)  =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700459
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700459
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700459, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff92738, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700463
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, Checking for required user/group ids

'nobody' user id and group found.
'bin' user id and group found.
'daemon' user id and group found.
Users group found.
Sys group found.
Required users/groups exist.
[{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700463
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700463, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff92b08, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700513
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, If some fields are empty or look unusual you may have an old vers=
ion.
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
Mem:        8165700     3933552     2646980       76084     1585168     406=
9032
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
[{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700513
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700513, si=
_uid=3D0, si_status=3D0, si_utime=3D1, si_stime=3D3} ---
wait4(-1, 0x3ffff929d8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
brk(0x1c1000)                           =3D 0x1c1000
newfstatat(AT_FDCWD, ".", {st_mode=3DS_IFDIR|0777, st_size=3D80, ...}, 0) =
=3D 0
newfstatat(AT_FDCWD, "/usr/local/bin/dd", 0x3ffff926b0, 0) =3D -1 ENOENT (N=
o such file or directory)
newfstatat(AT_FDCWD, "/usr/bin/dd", 0x3ffff926b0, 0) =3D -1 ENOENT (No such=
 file or directory)
newfstatat(AT_FDCWD, "/bin/dd", {st_mode=3DS_IFREG|0755, st_size=3D56104, .=
..}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/dd", {st_mode=3DS_IFREG|0755, st_size=3D56104, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/dd", X_OK)    =3D 0
newfstatat(AT_FDCWD, "/bin/dd", {st_mode=3DS_IFREG|0755, st_size=3D56104, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/dd", R_OK)    =3D 0
newfstatat(AT_FDCWD, "/bin/dd", {st_mode=3DS_IFREG|0755, st_size=3D56104, .=
..}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/dd", {st_mode=3DS_IFREG|0755, st_size=3D56104, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/dd", X_OK)    =3D 0
newfstatat(AT_FDCWD, "/bin/dd", {st_mode=3DS_IFREG|0755, st_size=3D56104, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/dd", R_OK)    =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700693
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700693
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3700693, si=
_uid=3D0, si_status=3D0, si_utime=3D13, si_stime=3D218} ---
wait4(-1, 0x3ffff92388, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701344
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8) =3D=
 0
close(4)                                =3D 0
read(3, "/dev/loop0\n", 128)            =3D 11
read(3, "", 128)                        =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701344
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3701344, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff91b28, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
newfstatat(AT_FDCWD, ".", {st_mode=3DS_IFDIR|0777, st_size=3D100, ...}, 0) =
=3D 0
newfstatat(AT_FDCWD, "/usr/local/bin/losetup", 0x3ffff91f10, 0) =3D -1 ENOE=
NT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/bin/losetup", 0x3ffff91f10, 0) =3D -1 ENOENT (No=
 such file or directory)
newfstatat(AT_FDCWD, "/bin/losetup", 0x3ffff91f10, 0) =3D -1 ENOENT (No suc=
h file or directory)
newfstatat(AT_FDCWD, "/usr/local/sbin/losetup", 0x3ffff91f10, 0) =3D -1 ENO=
ENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/sbin/losetup", 0x3ffff91f10, 0) =3D -1 ENOENT (N=
o such file or directory)
newfstatat(AT_FDCWD, "/sbin/losetup", {st_mode=3DS_IFREG|0755, st_size=3D72=
856, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/sbin/losetup", {st_mode=3DS_IFREG|0755, st_size=3D72=
856, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/sbin/losetup", X_OK) =3D 0
newfstatat(AT_FDCWD, "/sbin/losetup", {st_mode=3DS_IFREG|0755, st_size=3D72=
856, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/sbin/losetup", R_OK) =3D 0
newfstatat(AT_FDCWD, "/sbin/losetup", {st_mode=3DS_IFREG|0755, st_size=3D72=
856, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/sbin/losetup", {st_mode=3DS_IFREG|0755, st_size=3D72=
856, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/sbin/losetup", X_OK) =3D 0
newfstatat(AT_FDCWD, "/sbin/losetup", {st_mode=3DS_IFREG|0755, st_size=3D72=
856, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/sbin/losetup", R_OK) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [INT CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [INT CHLD], NULL, 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701350
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701350
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3701350, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff91be8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
write(1, "no big block device was specifie"..., 50no big block device was s=
pecified on commandline.
) =3D 50
write(1, "Tests which require a big block "..., 53Tests which require a big=
 block device are disabled.
) =3D 53
write(1, "You can specify it with option -"..., 34You can specify it with o=
ption -z
) =3D 34
write(1, "COMMAND:    /opt/ltp/bin/ltp-pan"..., 282COMMAND:    /opt/ltp/bin=
/ltp-pan   -e -S   -a 3700274     -n 3700274 -p -f /tmp/ltp-s7eufFujpP/allt=
ests -l /opt/ltp/results/LTP_RUN_ON-2020_06_10-09h_50m_37s.log  -C /opt/ltp=
/output/LTP_RUN_ON-2020_06_10-09h_50m_37s.failed -T /opt/ltp/output/LTP_RUN=
_ON-2020_06_10-09h_50m_37s.tconf
) =3D 282
write(1, "INFO: Restricted to memcg_max_us"..., 45INFO: Restricted to memcg=
_max_usage_in_bytes
) =3D 45
write(1, "LOG File: ", 10LOG File: )              =3D 10
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701369
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(4)                                =3D 0
close(4)                                =3D -1 EBADF (Bad file descriptor)
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701371
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701369
wait4(-1, /opt/ltp/results/LTP_RUN_ON-2020_06_10-09h_50m_37s.log
[{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701371
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(3)                                =3D -1 EBADF (Bad file descriptor)
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3701369, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---

wait4(-1, 0x3ffff93ab8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
write(1, "FAILED COMMAND File: ", 21FAILED COMMAND File: )   =3D 21
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701376
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(4)                                =3D 0
close(4)                                =3D -1 EBADF (Bad file descriptor)
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701377
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701376
wait4(-1, /opt/ltp/output/LTP_RUN_ON-2020_06_10-09h_50m_37s.failed
[{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701377
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(3)                                =3D -1 EBADF (Bad file descriptor)
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3701376, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff93ea8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
write(1, "TCONF COMMAND File: ", 20TCONF COMMAND File: )    =3D 20
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701380
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(4)                                =3D 0
close(4)                                =3D -1 EBADF (Bad file descriptor)
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701382
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701380
wait4(-1, /opt/ltp/output/LTP_RUN_ON-2020_06_10-09h_50m_37s.tconf
[{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701382
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
close(3)                                =3D -1 EBADF (Bad file descriptor)
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3701380, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff94148, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
write(1, "Running tests.......\n", 21Running tests.......
)  =3D 21
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  =3D 0
pipe2([3, 4], 0)                        =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701384
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8) =3D=
 0
close(4)                                =3D 0
read(3, "Wed Jun 10 09:50:40 UTC 2020\n", 128) =3D 29
read(3, "", 128)                        =3D 0
close(3)                                =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701384
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3701384, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff93f68, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
newfstatat(AT_FDCWD, "/opt", {st_mode=3DS_IFDIR|0711, st_size=3D4096, ...},=
 0) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp", {st_mode=3DS_IFDIR|0755, st_size=3D4096, .=
..}, 0) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp/testcases", {st_mode=3DS_IFDIR|0755, st_size=
=3D4096, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp/testcases/bin", {st_mode=3DS_IFDIR|0755, st_=
size=3D135168, ...}, 0) =3D 0
chdir("/opt/ltp/testcases/bin")         =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [INT CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [INT CHLD], NULL, 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701389
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, <<<test_start>>>
tag=3Dmemcg_max_usage_in_bytes stime=3D1591782640
cmdline=3D"memcg_max_usage_in_bytes_test.sh"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
incrementing stop
memcg_max_usage_in_bytes_test 1 TINFO: Starting test 1
/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: Device or=
 resource busy
memcg_max_usage_in_bytes_test 1 TINFO: set /dev/memcg/memory.use_hierarchy =
to 0 failed
memcg_max_usage_in_bytes_test 1 TINFO: Running memcg_process --mmap-anon -s=
 4194304
memcg_max_usage_in_bytes_test 1 TINFO: Warming up pid: 3701452
memcg_max_usage_in_bytes_test 1 TINFO: Process is still here after warm up:=
 3701452
memcg_max_usage_in_bytes_test 1 TFAIL: memory.max_usage_in_bytes is 4325376=
, 4194304 expected
memcg_max_usage_in_bytes_test 2 TINFO: Starting test 2
/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: Device or=
 resource busy
memcg_max_usage_in_bytes_test 2 TINFO: set /dev/memcg/memory.use_hierarchy =
to 0 failed
memcg_max_usage_in_bytes_test 2 TINFO: Running memcg_process --mmap-anon -s=
 4194304
memcg_max_usage_in_bytes_test 2 TINFO: Warming up pid: 3701898
memcg_max_usage_in_bytes_test 2 TINFO: Process is still here after warm up:=
 3701898
memcg_max_usage_in_bytes_test 2 TFAIL: memory.memsw.max_usage_in_bytes is 4=
325376, 4194304 expected
memcg_max_usage_in_bytes_test 3 TINFO: Starting test 3
/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: Device or=
 resource busy
memcg_max_usage_in_bytes_test 3 TINFO: set /dev/memcg/memory.use_hierarchy =
to 0 failed
memcg_max_usage_in_bytes_test 3 TINFO: Running memcg_process --mmap-anon -s=
 4194304
memcg_max_usage_in_bytes_test 3 TINFO: Warming up pid: 3702345
memcg_max_usage_in_bytes_test 3 TINFO: Process is still here after warm up:=
 3702345
memcg_max_usage_in_bytes_test 3 TFAIL: memory.max_usage_in_bytes is 4325376=
, 4194304 expected
memcg_max_usage_in_bytes_test 4 TPASS: memory.max_usage_in_bytes is 0 as ex=
pected
memcg_max_usage_in_bytes_test 5 TINFO: Starting test 4
/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: Device or=
 resource busy
memcg_max_usage_in_bytes_test 5 TINFO: set /dev/memcg/memory.use_hierarchy =
to 0 failed
memcg_max_usage_in_bytes_test 5 TINFO: Running memcg_process --mmap-anon -s=
 4194304
memcg_max_usage_in_bytes_test 5 TINFO: Warming up pid: 3702766
memcg_max_usage_in_bytes_test 5 TINFO: Process is still here after warm up:=
 3702766
memcg_max_usage_in_bytes_test 5 TFAIL: memory.memsw.max_usage_in_bytes is 4=
325376, 4194304 expected
memcg_max_usage_in_bytes_test 6 TPASS: memory.memsw.max_usage_in_bytes is 0=
 as expected
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D5 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D28 cstime=3D51
<<<test_end>>>
[{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 1}], 0, NULL) =3D 3701389
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3701389, si=
_uid=3D0, si_status=3D1, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff94bd8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
write(1, "INFO: ltp-pan reported some test"..., 39INFO: ltp-pan reported so=
me tests FAIL
) =3D 39
newfstatat(AT_FDCWD, "/opt", {st_mode=3DS_IFDIR|0711, st_size=3D4096, ...},=
 0) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp", {st_mode=3DS_IFDIR|0755, st_size=3D4096, .=
..}, 0) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp/testcases", {st_mode=3DS_IFDIR|0755, st_size=
=3D4096, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp/testcases/bin", {st_mode=3DS_IFDIR|0755, st_=
size=3D135168, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/opt/ltp/testcases/bin", {st_mode=3DS_IFDIR|0755, st_=
size=3D135168, ...}, 0) =3D 0
chdir("/opt/ltp/testcases")             =3D 0
write(1, "LTP Version: 20200515-28-gb54247"..., 36LTP Version: 20200515-28-=
gb54247721
) =3D 36
newfstatat(AT_FDCWD, "/bin/cat", {st_mode=3DS_IFREG|0755, st_size=3D27224, =
...}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/cat", {st_mode=3DS_IFREG|0755, st_size=3D27224, =
...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/cat", X_OK)   =3D 0
newfstatat(AT_FDCWD, "/bin/cat", {st_mode=3DS_IFREG|0755, st_size=3D27224, =
...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/cat", R_OK)   =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3703202
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1,
       ###############################################################

            Done executing testcases.
            LTP Version:  20200515-28-gb54247721
       ###############################################################

[{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3703202
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3703202, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff95678, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  =3D 0
newfstatat(AT_FDCWD, "/sbin/losetup", {st_mode=3DS_IFREG|0755, st_size=3D72=
856, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/sbin/losetup", {st_mode=3DS_IFREG|0755, st_size=3D72=
856, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/sbin/losetup", X_OK) =3D 0
newfstatat(AT_FDCWD, "/sbin/losetup", {st_mode=3DS_IFREG|0755, st_size=3D72=
856, ...}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/sbin/losetup", R_OK) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3703205
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3703205
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3703205, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---
wait4(-1, 0x3ffff95a58, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
newfstatat(AT_FDCWD, "/bin/rm", {st_mode=3DS_IFREG|0755, st_size=3D47840, .=
..}, 0) =3D 0
newfstatat(AT_FDCWD, "/bin/rm", {st_mode=3DS_IFREG|0755, st_size=3D47840, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/rm", X_OK)    =3D 0
newfstatat(AT_FDCWD, "/bin/rm", {st_mode=3DS_IFREG|0755, st_size=3D47840, .=
..}, 0) =3D 0
geteuid()                               =3D 0
getegid()                               =3D 0
getuid()                                =3D 0
getgid()                                =3D 0
faccessat(AT_FDCWD, "/bin/rm", R_OK)    =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3703216
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3703216
rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, {s=
a_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypixel=
=3D0}) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D3703216, si=
_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D17} ---
wait4(-1, 0x3ffff95bc8, WNOHANG, NULL)  =3D -1 ECHILD (No child processes)
rt_sigreturn({mask=3D[]})                 =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
exit_group(1)                           =3D ?
+++ exited with 1 +++

can someone help me on this??

Thanks!

--_000_BMXPR01MB23446DABE616696D41B6CF4DEE830BMXPR01MB2344INDP_
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
&nbsp;Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am running ltp memory group tests but i found that all of follwing tests =
are getting failed&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">1</span><span style=3D"color: rgb(0, 0, 0); =
font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">)memc=
g_max_usage_in_bytes</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
2) memcg_stat&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;3)memcg_use_hierarchy&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">4)memcg_usage_in_bytes&nbsp;&nbsp;</span></d=
iv>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">i am attaching the output for&nbsp;<span sty=
le=3D"font-family: Calibri, Arial, Helvetica, sans-serif; background-color:=
 rgb(255, 255, 255); display: inline !important">memcg_max_usage_in_bytes
 with strace&nbsp;</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><span style=3D"font-family: Calibri, Arial, =
Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: inlin=
e !important"><br>
</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><span style=3D"font-family: Calibri, Arial, =
Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: inlin=
e !important"><br>
</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><span style=3D"font-family: Calibri, Arial, =
Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: inlin=
e !important"><span>root@exaleapsemi-r2:/opt/ltp#
 strace ./runltp -s memcg_max_usage_in_bytes<br>
</span>
<div>execve(&quot;./runltp&quot;, [&quot;./runltp&quot;, &quot;-s&quot;, &q=
uot;memcg_max_usage_in_bytes&quot;], 0x3fffec6ca0 /* 16 vars */) =3D 0<br>
</div>
<div>brk(NULL) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0xda000<br>
</div>
<div>uname({sysname=3D&quot;Linux&quot;, nodename=3D&quot;exaleapsemi-r2.00=
&quot;, ...}) =3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/etc/ld.so.preload&quot;, R_OK) =3D -1 ENOEN=
T (No such file or directory)<br>
</div>
<div>openat(AT_FDCWD, &quot;/etc/ld.so.cache&quot;, O_RDONLY|O_CLOEXEC) =3D=
 3<br>
</div>
<div>fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D70080, ...}) =3D 0<br>
</div>
<div>mmap(NULL, 70080, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x3fe4e55000<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>openat(AT_FDCWD, &quot;/lib/libtinfo.so.5&quot;, O_RDONLY|O_CLOEXEC) =
=3D 3<br>
</div>
<div>read(3, &quot;\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0000\317=
\0\0\0\0\0\0&quot;..., 832) =3D 832<br>
</div>
<div>fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D159728, ...}) =3D 0<br>
</div>
<div>mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, =
0) =3D 0x3fe4e53000<br>
</div>
<div>mmap(NULL, 163688, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, =
0) =3D 0x3fe4e2b000<br>
</div>
<div>mprotect(0x3fe4e4d000, 4096, PROT_NONE) =3D 0<br>
</div>
<div>mmap(0x3fe4e4e000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|=
MAP_DENYWRITE, 3, 0x22000) =3D 0x3fe4e4e000<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>openat(AT_FDCWD, &quot;/lib/libdl.so.2&quot;, O_RDONLY|O_CLOEXEC) =3D =
3<br>
</div>
<div>read(3, &quot;\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0\200\16=
\0\0\0\0\0\0&quot;..., 832) =3D 832<br>
</div>
<div>fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D10200, ...}) =3D 0<br>
</div>
<div>mmap(NULL, 12600, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0=
) =3D 0x3fe4e27000<br>
</div>
<div>mmap(0x3fe4e29000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|M=
AP_DENYWRITE, 3, 0x1000) =3D 0x3fe4e29000<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>openat(AT_FDCWD, &quot;/lib/libc.so.6&quot;, O_RDONLY|O_CLOEXEC) =3D 3=
<br>
</div>
<div>read(3, &quot;\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0d5\2\0\=
0\0\0\0&quot;..., 832) =3D 832<br>
</div>
<div>fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D1065488, ...}) =3D 0<br>
</div>
<div>mmap(NULL, 1076752, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,=
 0) =3D 0x3fe4d20000<br>
</div>
<div>mmap(0x3fe4e1e000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|=
MAP_DENYWRITE, 3, 0xfd000) =3D 0x3fe4e1e000<br>
</div>
<div>mmap(0x3fe4e24000, 11792, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|=
MAP_ANONYMOUS, -1, 0) =3D 0x3fe4e24000<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, =
0) =3D 0x3fe4d1e000<br>
</div>
<div>mprotect(0x3fe4e1e000, 12288, PROT_READ) =3D 0<br>
</div>
<div>mprotect(0x3fe4e29000, 4096, PROT_READ) =3D 0<br>
</div>
<div>mprotect(0x3fe4e4e000, 16384, PROT_READ) =3D 0<br>
</div>
<div>mprotect(0xc6000, 4096, PROT_READ) &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>mprotect(0x3fe4e81000, 4096, PROT_READ) =3D 0<br>
</div>
<div>munmap(0x3fe4e55000, 70080) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
=3D 0<br>
</div>
<div>openat(AT_FDCWD, &quot;/dev/tty&quot;, O_RDWR|O_NONBLOCK) =3D 3<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>brk(NULL) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0xda000<br>
</div>
<div>brk(0xfb000) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0xfb000<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>gettimeofday({tv_sec=3D1591782637, tv_usec=3D418138}, NULL) =3D 0<br>
</div>
<div>ioctl(-1, TIOCGPGRP, 0x3ffff9697c) &nbsp; &nbsp; &nbsp;=3D -1 EBADF (B=
ad file descriptor)<br>
</div>
<div>sysinfo({uptime=3D77613, loads=3D[8041888, 24363616, 33553888], totalr=
am=3D8361676800, freeram=3D2712469504, sharedram=3D77869056, bufferram=3D15=
8437376, totalswap=3D0, freeswap=3D0, procs=3D167, totalhigh=3D0, freehigh=
=3D0, mem_unit=3D1}) =3D 0<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8=
) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGQUIT, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGQUIT, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGTSTP, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGTSTP, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGTTIN, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGTTIN, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGTTOU, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGTTOU, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, NULL, [], 8) &nbsp;=3D 0<br>
</div>
<div>rt_sigaction(SIGQUIT, {sa_handler=3DSIG_IGN, sa_mask=3D[], sa_flags=3D=
0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>uname({sysname=3D&quot;Linux&quot;, nodename=3D&quot;exaleapsemi-r2.00=
&quot;, ...}) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp&quot;, {st_mode=3DS_IFDIR|0755, st=
_size=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;.&quot;, {st_mode=3DS_IFDIR|0755, st_size=
=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt&quot;, {st_mode=3DS_IFDIR|0711, st_siz=
e=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp&quot;, {st_mode=3DS_IFDIR|0755, st=
_size=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp/testcases&quot;, {st_mode=3DS_IFDI=
R|0755, st_size=3D4096, ...}, 0) =3D 0<br>
</div>
<div>getpid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 3700274<br>
</div>
<div>getppid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 3700270<br>
</div>
<div>gettimeofday({tv_sec=3D1591782637, tv_usec=3D435083}, NULL) =3D 0<br>
</div>
<div>getpid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 3700274<br>
</div>
<div>getpgid(0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 3700270<br>
</div>
<div>ioctl(2, TIOCGPGRP, [3700270]) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0=
<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8=
) =3D 0<br>
</div>
<div>prlimit64(0, RLIMIT_NPROC, NULL, {rlim_cur=3D63791, rlim_max=3D63791})=
 =3D 0<br>
</div>
<div>openat(AT_FDCWD, &quot;./runltp&quot;, O_RDONLY) &nbsp;=3D 3<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;./runltp&quot;, {st_mode=3DS_IFREG|0755, st=
_size=3D37752, ...}, 0) =3D 0<br>
</div>
<div>ioctl(3, TCGETS, 0x3ffff96928) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D -=
1 ENOTTY (Inappropriate ioctl for device)<br>
</div>
<div>lseek(3, 0, SEEK_CUR) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; =3D 0<br>
</div>
<div>read(3, &quot;#!/bin/sh\n######################&quot;..., 80) =3D 80<b=
r>
</div>
<div>lseek(3, 0, SEEK_SET) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; =3D 0<br>
</div>
<div>prlimit64(0, RLIMIT_NOFILE, NULL, {rlim_cur=3D1024, rlim_max=3D512*102=
4}) =3D 0<br>
</div>
<div>fcntl(255, F_GETFD) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; =3D -1 EBADF (Bad file descriptor)<br>
</div>
<div>dup3(3, 255, 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; =3D 255<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>fcntl(255, F_SETFD, FD_CLOEXEC) &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>fcntl(255, F_GETFL) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; =3D 0x8000 (flags O_RDONLY|O_LARGEFILE)<br>
</div>
<div>fstat(255, {st_mode=3DS_IFREG|0755, st_size=3D37752, ...}) =3D 0<br>
</div>
<div>lseek(255, 0, SEEK_CUR) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; =3D 0<br>
</div>
<div>read(255, &quot;#!/bin/sh\n######################&quot;..., 8192) =3D =
8192<br>
</div>
<div>read(255, &quot;RN &nbsp; &nbsp; &nbsp;Only run test cases whic&quot;.=
.., 8192) =3D 8192<br>
</div>
<div>read(255, &quot;K_TYPE=3D\&quot;$OPTARG\&quot;;;\n\n &nbsp; &nbsp; &nb=
sp; &nbsp;N) &nbsp;&quot;..., 8192) =3D 8192<br>
</div>
<div>brk(0x11c000) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x11c000<br>
</div>
<div>read(255, &quot;run\n &nbsp; &nbsp;# these tests. &nbsp;As a saf&quot;=
..., 8192) =3D 8192<br>
</div>
<div>read(255, &quot; &nbsp; fi\n &nbsp; &nbsp; &nbsp; &nbsp;if [ \&quot;$O=
UTPUTFILE_&quot;..., 8192) =3D 4984<br>
</div>
<div>brk(0x13d000) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x13d000<br>
</div>
<div>brk(0x15e000) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x15e000<br>
</div>
<div>brk(0x17f000) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x17f000<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, NULL, [], 8) &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, NULL, [], 8) &nbsp;=3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>lseek(255, -87, SEEK_CUR) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; =3D 37665<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700303<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8=
) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>read(3, &quot;runltp\n&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;=3D 7<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370030=
3, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], WNOHANG=
, NULL) =3D 3700303<br>
</div>
<div>wait4(-1, 0x3ffff95c08, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 7<br>
</div>
<div>read(3, &quot;&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>read(255, &quot;\nif [ \&quot;$LTP_SCRIPT\&quot; =3D \&quot;runltp\&qu=
ot; ]&quot;..., 8192) =3D 87<br>
</div>
<div>rt_sigaction(SIGHUP, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRA=
P ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flag=
s=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRA=
P ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flag=
s=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGILL, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRA=
P ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flag=
s=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGTRAP, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TR=
AP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_fla=
gs=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGABRT, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TR=
AP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_fla=
gs=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGFPE, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRA=
P ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flag=
s=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGBUS, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRA=
P ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flag=
s=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGSEGV, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TR=
AP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_fla=
gs=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGSYS, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRA=
P ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flag=
s=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGPIPE, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TR=
AP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_fla=
gs=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGALRM, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TR=
AP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_fla=
gs=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGTERM, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TR=
AP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_fla=
gs=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGXCPU, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TR=
AP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_fla=
gs=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGXFSZ, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TR=
AP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_fla=
gs=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGVTALRM, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL =
TRAP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_f=
lags=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGUSR1, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TR=
AP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_fla=
gs=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGUSR2, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TR=
AP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_fla=
gs=3D0}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700311<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8=
) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>read(3, &quot;.\n&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; =3D 2<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370031=
1, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], WNOHANG=
, NULL) =3D 3700311<br>
</div>
<div>wait4(-1, 0x3ffff94df8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 2<br>
</div>
<div>read(3, &quot;&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[HUP INT ILL TRAP ABRT BUS FPE USR1 SEG=
V USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt&quot;, {st_mode=3DS_IFDIR|0711, st_siz=
e=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp&quot;, {st_mode=3DS_IFDIR|0755, st=
_size=3D4096, ...}, 0) =3D 0<br>
</div>
<div>chdir(&quot;/opt/ltp&quot;) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp/testcases/bin&quot;, {st_mode=3DS_=
IFDIR|0755, st_size=3D135168, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp/bin/ltp-pan&quot;, {st_mode=3DS_IF=
REG|0775, st_size=3D132904, ...}, 0) =3D 0<br>
</div>
<div>brk(0x1a0000) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x1a0000<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700316<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8=
) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>read(3, &quot;2020_06_10-09h_50m_37s\n&quot;, 128) =3D 23<br>
</div>
<div>read(3, &quot;&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700316<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370031=
6, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff90758, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, NULL, [], 8) &nbsp;=3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700320<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8=
) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>read(3, &quot;20200515-28-gb54247721\n&quot;, 128) =3D 23<br>
</div>
<div>read(3, &quot;&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370032=
0, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], WNOHANG=
, NULL) =3D 3700320<br>
</div>
<div>wait4(-1, 0x3ffff909c8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700324<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8=
) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>read(3, &quot;2020_06_10-09h_50m_37s\n&quot;, 128) =3D 23<br>
</div>
<div>read(3, &quot;&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700324<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370032=
4, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff90668, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700326<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8=
) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>read(3, &quot;2020_06_10-09h_50m_37s\n&quot;, 128) =3D 23<br>
</div>
<div>read(3, &quot;&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370032=
6, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], WNOHANG=
, NULL) =3D 3700326<br>
</div>
<div>wait4(-1, 0x3ffff908e8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp/output&quot;, {st_mode=3DS_IFDIR|0=
755, st_size=3D253952, ...}, 0) =3D 0<br>
</div>
<div>fstat(1, {st_mode=3DS_IFCHR|0620, st_rdev=3Dmakedev(0x88, 0x2), ...}) =
=3D 0<br>
</div>
<div>write(1, &quot;INFO: creating /opt/ltp/results &quot;..., 42INFO: crea=
ting /opt/ltp/results directory<br>
</div>
<div>) =3D 42<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp/results&quot;, {st_mode=3DS_IFDIR|=
0755, st_size=3D114688, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;.&quot;, {st_mode=3DS_IFDIR|0755, st_size=
=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/local/bin/mkdir&quot;, 0x3ffff91a80, 0=
) =3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/bin/mkdir&quot;, 0x3ffff91a80, 0) =3D =
-1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mkdir&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D31376, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mkdir&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D31376, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/mkdir&quot;, X_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mkdir&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D31376, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/mkdir&quot;, R_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mkdir&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D31376, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mkdir&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D31376, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/mkdir&quot;, X_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mkdir&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D31376, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/mkdir&quot;, R_OK) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [INT CHLD], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [INT CHLD], NULL, 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700333<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700333<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/home/root/.terminfo&quot;, 0x18c6d0, 0) =
=3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/etc/terminfo&quot;, {st_mode=3DS_IFDIR|075=
5, st_size=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/share/terminfo&quot;, 0x18c750, 0) =3D=
 -1 ENOENT (No such file or directory)<br>
</div>
<div>gettimeofday({tv_sec=3D1591782637, tv_usec=3D579431}, NULL) =3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/etc/terminfo/x/xterm-256color&quot;, R_OK) =
=3D 0<br>
</div>
<div>openat(AT_FDCWD, &quot;/etc/terminfo/x/xterm-256color&quot;, O_RDONLY)=
 =3D 3<br>
</div>
<div>fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D3778, ...}) =3D 0<br>
</div>
<div>read(3, &quot;\32\1%\0&amp;\0\17\0\235\0010\6xterm-256color|xterm&quot=
;..., 4096) =3D 3778<br>
</div>
<div>read(3, &quot;&quot;, 4096) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>gettimeofday({tv_sec=3D1591782637, tv_usec=3D580910}, NULL) =3D 0<br>
</div>
<div>ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0<br>
</div>
<div>ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0<br>
</div>
<div>ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0<br>
</div>
<div>ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0<br>
</div>
<div>ioctl(1, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>ioctl(0, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370033=
3, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff91758, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700337<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8=
) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>read(3, &quot;/tmp/ltp-s7eufFujpP\n&quot;, 128) &nbsp; =3D 20<br>
</div>
<div>read(3, &quot;&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700337<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370033=
7, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff914b8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;.&quot;, {st_mode=3DS_IFDIR|0755, st_size=
=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/local/bin/chmod&quot;, 0x3ffff92110, 0=
) =3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/bin/chmod&quot;, 0x3ffff92110, 0) =3D =
-1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/chmod&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D43680, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/chmod&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D43680, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/chmod&quot;, X_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/chmod&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D43680, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/chmod&quot;, R_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/chmod&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D43680, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/chmod&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D43680, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/chmod&quot;, X_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/chmod&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D43680, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/chmod&quot;, R_OK) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [INT CHLD], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [INT CHLD], NULL, 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700342<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700342<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370034=
2, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff91de8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/tmp&quot;, {st_mode=3DS_IFDIR|S_ISVTX|0777=
, st_size=3D280, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/tmp/ltp-s7eufFujpP&quot;, {st_mode=3DS_IFD=
IR|0777, st_size=3D40, ...}, 0) =3D 0<br>
</div>
<div>chdir(&quot;/tmp/ltp-s7eufFujpP&quot;) &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;.&quot;, {st_mode=3DS_IFDIR|0777, st_size=
=3D40, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/local/bin/cat&quot;, 0x3ffff91e90, 0) =
=3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/bin/cat&quot;, 0x3ffff91e90, 0) =3D -1=
 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/cat&quot;, {st_mode=3DS_IFREG|0755, st=
_size=3D27224, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/cat&quot;, {st_mode=3DS_IFREG|0755, st=
_size=3D27224, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/cat&quot;, X_OK) &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/cat&quot;, {st_mode=3DS_IFREG|0755, st=
_size=3D27224, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/cat&quot;, R_OK) &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/cat&quot;, {st_mode=3DS_IFREG|0755, st=
_size=3D27224, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/cat&quot;, {st_mode=3DS_IFREG|0755, st=
_size=3D27224, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/cat&quot;, X_OK) &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/cat&quot;, {st_mode=3DS_IFREG|0755, st=
_size=3D27224, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/cat&quot;, R_OK) &nbsp; =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700347<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, INFO: no command files were provided. Executing following ru=
ntest scenario files:<br>
</div>
<div>syscalls fs fs_perms_simple fsx dio io mm ipc sched math nptl pty cont=
ainers fs_bind controllers filecaps cap_bounds fcntl-locktests connectors p=
ower_management_tests hugetlb commands hyperthreading can cpuhotplug net.ip=
v6_lib input cve crypto kernel_misc
 uevent <br>
</div>
<div><br>
</div>
<div>[{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700=
347<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370034=
7, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff91b68, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;.&quot;, {st_mode=3DS_IFDIR|0777, st_size=
=3D40, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/local/bin/touch&quot;, 0x3ffff92130, 0=
) =3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/bin/touch&quot;, 0x3ffff92130, 0) =3D =
-1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/touch&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D64216, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/touch&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D64216, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/touch&quot;, X_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/touch&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D64216, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/touch&quot;, R_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/touch&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D64216, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/touch&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D64216, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/touch&quot;, X_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/touch&quot;, {st_mode=3DS_IFREG|0755, =
st_size=3D64216, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/touch&quot;, R_OK) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700363<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700363<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370036=
3, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff91e08, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700367<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D -1 EBADF (Bad file de=
scriptor)<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700369<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700367<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700369<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D -1 EBADF (Bad file de=
scriptor)<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370036=
7, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff91f48, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;.&quot;, {st_mode=3DS_IFDIR|0777, st_size=
=3D80, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/local/bin/rm&quot;, 0x3ffff923d0, 0) =
=3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/bin/rm&quot;, 0x3ffff923d0, 0) =3D -1 =
ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/rm&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D47840, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/rm&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D47840, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/rm&quot;, X_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/rm&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D47840, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/rm&quot;, R_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/rm&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D47840, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/rm&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D47840, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/rm&quot;, X_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/rm&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D47840, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/rm&quot;, R_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700445<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700445<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370044=
5, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff920a8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;.&quot;, {st_mode=3DS_IFDIR|0777, st_size=
=3D60, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/local/bin/mv&quot;, 0x3ffff92a40, 0) =
=3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/bin/mv&quot;, 0x3ffff92a40, 0) =3D -1 =
ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mv&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D81096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mv&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D81096, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/mv&quot;, X_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mv&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D81096, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/mv&quot;, R_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mv&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D81096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mv&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D81096, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/mv&quot;, X_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/mv&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D81096, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/mv&quot;, R_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700453<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700453<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370045=
3, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff92718, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;.&quot;, {st_mode=3DS_IFDIR|0777, st_size=
=3D60, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/local/bin/grep&quot;, 0x3ffff92a60, 0)=
 =3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/bin/grep&quot;, 0x3ffff92a60, 0) =3D -=
1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/grep&quot;, {st_mode=3DS_IFREG|0755, s=
t_size=3D150800, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/grep&quot;, {st_mode=3DS_IFREG|0755, s=
t_size=3D150800, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/grep&quot;, X_OK) &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/grep&quot;, {st_mode=3DS_IFREG|0755, s=
t_size=3D150800, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/grep&quot;, R_OK) &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/grep&quot;, {st_mode=3DS_IFREG|0755, s=
t_size=3D150800, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/grep&quot;, {st_mode=3DS_IFREG|0755, s=
t_size=3D150800, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/grep&quot;, X_OK) &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/grep&quot;, {st_mode=3DS_IFREG|0755, s=
t_size=3D150800, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/grep&quot;, R_OK) &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700459<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700459<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370045=
9, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff92738, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700463<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, Checking for required user/group ids<br>
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
<div>[{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700=
463<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370046=
3, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff92b08, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700513<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, If some fields are empty or look unusual you may have an old=
 version.<br>
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
<div>Mem: &nbsp; &nbsp; &nbsp; &nbsp;8165700 &nbsp; &nbsp; 3933552 &nbsp; &=
nbsp; 2646980 &nbsp; &nbsp; &nbsp; 76084 &nbsp; &nbsp; 1585168 &nbsp; &nbsp=
; 4069032<br>
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
<div>[{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3700=
513<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370051=
3, si_uid=3D0, si_status=3D0, si_utime=3D1, si_stime=3D3} ---<br>
</div>
<div>wait4(-1, 0x3ffff929d8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>brk(0x1c1000) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x1c1000<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;.&quot;, {st_mode=3DS_IFDIR|0777, st_size=
=3D80, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/local/bin/dd&quot;, 0x3ffff926b0, 0) =
=3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/bin/dd&quot;, 0x3ffff926b0, 0) =3D -1 =
ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/dd&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D56104, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/dd&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D56104, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/dd&quot;, X_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/dd&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D56104, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/dd&quot;, R_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/dd&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D56104, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/dd&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D56104, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/dd&quot;, X_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/dd&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D56104, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/dd&quot;, R_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3700693<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3700693<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370069=
3, si_uid=3D0, si_status=3D0, si_utime=3D13, si_stime=3D218} ---<br>
</div>
<div>wait4(-1, 0x3ffff92388, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, NULL, [], 8) &nbsp;=3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701344<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8=
) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>read(3, &quot;/dev/loop0\n&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;=3D 11<br>
</div>
<div>read(3, &quot;&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3701344<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370134=
4, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff91b28, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;.&quot;, {st_mode=3DS_IFDIR|0777, st_size=
=3D100, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/local/bin/losetup&quot;, 0x3ffff91f10,=
 0) =3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/bin/losetup&quot;, 0x3ffff91f10, 0) =
=3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/losetup&quot;, 0x3ffff91f10, 0) =3D -1=
 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/local/sbin/losetup&quot;, 0x3ffff91f10=
, 0) =3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/usr/sbin/losetup&quot;, 0x3ffff91f10, 0) =
=3D -1 ENOENT (No such file or directory)<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/sbin/losetup&quot;, {st_mode=3DS_IFREG|075=
5, st_size=3D72856, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/sbin/losetup&quot;, {st_mode=3DS_IFREG|075=
5, st_size=3D72856, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/sbin/losetup&quot;, X_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/sbin/losetup&quot;, {st_mode=3DS_IFREG|075=
5, st_size=3D72856, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/sbin/losetup&quot;, R_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/sbin/losetup&quot;, {st_mode=3DS_IFREG|075=
5, st_size=3D72856, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/sbin/losetup&quot;, {st_mode=3DS_IFREG|075=
5, st_size=3D72856, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/sbin/losetup&quot;, X_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/sbin/losetup&quot;, {st_mode=3DS_IFREG|075=
5, st_size=3D72856, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/sbin/losetup&quot;, R_OK) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [INT CHLD], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [INT CHLD], NULL, 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701350<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3701350<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370135=
0, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff91be8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>write(1, &quot;no big block device was specifie&quot;..., 50no big blo=
ck device was specified on commandline.<br>
</div>
<div>) =3D 50<br>
</div>
<div>write(1, &quot;Tests which require a big block &quot;..., 53Tests whic=
h require a big block device are disabled.<br>
</div>
<div>) =3D 53<br>
</div>
<div>write(1, &quot;You can specify it with option -&quot;..., 34You can sp=
ecify it with option -z<br>
</div>
<div>) =3D 34<br>
</div>
<div>write(1, &quot;COMMAND: &nbsp; &nbsp;/opt/ltp/bin/ltp-pan&quot;..., 28=
2COMMAND: &nbsp; &nbsp;/opt/ltp/bin/ltp-pan &nbsp; -e -S &nbsp; -a 3700274 =
&nbsp; &nbsp; -n 3700274 -p -f /tmp/ltp-s7eufFujpP/alltests -l /opt/ltp/res=
ults/LTP_RUN_ON-2020_06_10-09h_50m_37s.log &nbsp;-C /opt/ltp/output/LTP_RUN=
_ON-2020_06_10-09h_50m_37s.failed
 -T /opt/ltp/output/LTP_RUN_ON-2020_06_10-09h_50m_37s.tconf<br>
</div>
<div>) =3D 282<br>
</div>
<div>write(1, &quot;INFO: Restricted to memcg_max_us&quot;..., 45INFO: Rest=
ricted to memcg_max_usage_in_bytes<br>
</div>
<div>) =3D 45<br>
</div>
<div>write(1, &quot;LOG File: &quot;, 10LOG File: ) &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;=3D 10<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701369<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D -1 EBADF (Bad file de=
scriptor)<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701371<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3701369<br>
</div>
<div>wait4(-1, /opt/ltp/results/LTP_RUN_ON-2020_06_10-09h_50m_37s.log<br>
</div>
<div>[{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701=
371<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D -1 EBADF (Bad file de=
scriptor)<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370136=
9, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div><br>
</div>
<div>wait4(-1, 0x3ffff93ab8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>write(1, &quot;FAILED COMMAND File: &quot;, 21FAILED COMMAND File: ) &=
nbsp; =3D 21<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701376<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D -1 EBADF (Bad file de=
scriptor)<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701377<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3701376<br>
</div>
<div>wait4(-1, /opt/ltp/output/LTP_RUN_ON-2020_06_10-09h_50m_37s.failed<br>
</div>
<div>[{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701=
377<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D -1 EBADF (Bad file de=
scriptor)<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370137=
6, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff93ea8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>write(1, &quot;TCONF COMMAND File: &quot;, 20TCONF COMMAND File: ) &nb=
sp; &nbsp;=3D 20<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701380<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D -1 EBADF (Bad file de=
scriptor)<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701382<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3701380<br>
</div>
<div>wait4(-1, /opt/ltp/output/LTP_RUN_ON-2020_06_10-09h_50m_37s.tconf<br>
</div>
<div>[{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3701=
382<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D -1 EBADF (Bad file de=
scriptor)<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370138=
0, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff94148, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>write(1, &quot;Running tests.......\n&quot;, 21Running tests.......<br=
>
</div>
<div>) &nbsp;=3D 21<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, NULL, [], 8) &nbsp;=3D 0<br>
</div>
<div>pipe2([3, 4], 0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701384<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3D0x4e622, sa_mask=3D[], sa_flags=3DSA_RESTART}, 8=
) =3D 0<br>
</div>
<div>close(4) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>read(3, &quot;Wed Jun 10 09:50:40 UTC 2020\n&quot;, 128) =3D 29<br>
</div>
<div>read(3, &quot;&quot;, 128) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3701384<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370138=
4, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff93f68, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt&quot;, {st_mode=3DS_IFDIR|0711, st_siz=
e=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp&quot;, {st_mode=3DS_IFDIR|0755, st=
_size=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp/testcases&quot;, {st_mode=3DS_IFDI=
R|0755, st_size=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp/testcases/bin&quot;, {st_mode=3DS_=
IFDIR|0755, st_size=3D135168, ...}, 0) =3D 0<br>
</div>
<div>chdir(&quot;/opt/ltp/testcases/bin&quot;) &nbsp; &nbsp; &nbsp; &nbsp; =
=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [INT CHLD], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [INT CHLD], NULL, 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3701389<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, &lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
</div>
<div>tag=3Dmemcg_max_usage_in_bytes stime=3D1591782640<br>
</div>
<div>cmdline=3D&quot;memcg_max_usage_in_bytes_test.sh&quot;<br>
</div>
<div>contacts=3D&quot;&quot;<br>
</div>
<div>analysis=3Dexit<br>
</div>
<div>&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
</div>
<div>incrementing stop<br>
</div>
<div>memcg_max_usage_in_bytes_test 1 TINFO: Starting test 1<br>
</div>
<div>/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: Devi=
ce or resource busy<br>
</div>
<div>memcg_max_usage_in_bytes_test 1 TINFO: set /dev/memcg/memory.use_hiera=
rchy to 0 failed<br>
</div>
<div>memcg_max_usage_in_bytes_test 1 TINFO: Running memcg_process --mmap-an=
on -s 4194304<br>
</div>
<div>memcg_max_usage_in_bytes_test 1 TINFO: Warming up pid: 3701452<br>
</div>
<div>memcg_max_usage_in_bytes_test 1 TINFO: Process is still here after war=
m up: 3701452<br>
</div>
<div>memcg_max_usage_in_bytes_test 1 TFAIL: memory.max_usage_in_bytes is 43=
25376, 4194304 expected<br>
</div>
<div>memcg_max_usage_in_bytes_test 2 TINFO: Starting test 2<br>
</div>
<div>/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: Devi=
ce or resource busy<br>
</div>
<div>memcg_max_usage_in_bytes_test 2 TINFO: set /dev/memcg/memory.use_hiera=
rchy to 0 failed<br>
</div>
<div>memcg_max_usage_in_bytes_test 2 TINFO: Running memcg_process --mmap-an=
on -s 4194304<br>
</div>
<div>memcg_max_usage_in_bytes_test 2 TINFO: Warming up pid: 3701898<br>
</div>
<div>memcg_max_usage_in_bytes_test 2 TINFO: Process is still here after war=
m up: 3701898<br>
</div>
<div>memcg_max_usage_in_bytes_test 2 TFAIL: memory.memsw.max_usage_in_bytes=
 is 4325376, 4194304 expected<br>
</div>
<div>memcg_max_usage_in_bytes_test 3 TINFO: Starting test 3<br>
</div>
<div>/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: Devi=
ce or resource busy<br>
</div>
<div>memcg_max_usage_in_bytes_test 3 TINFO: set /dev/memcg/memory.use_hiera=
rchy to 0 failed<br>
</div>
<div>memcg_max_usage_in_bytes_test 3 TINFO: Running memcg_process --mmap-an=
on -s 4194304<br>
</div>
<div>memcg_max_usage_in_bytes_test 3 TINFO: Warming up pid: 3702345<br>
</div>
<div>memcg_max_usage_in_bytes_test 3 TINFO: Process is still here after war=
m up: 3702345<br>
</div>
<div>memcg_max_usage_in_bytes_test 3 TFAIL: memory.max_usage_in_bytes is 43=
25376, 4194304 expected<br>
</div>
<div>memcg_max_usage_in_bytes_test 4 TPASS: memory.max_usage_in_bytes is 0 =
as expected<br>
</div>
<div>memcg_max_usage_in_bytes_test 5 TINFO: Starting test 4<br>
</div>
<div>/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: Devi=
ce or resource busy<br>
</div>
<div>memcg_max_usage_in_bytes_test 5 TINFO: set /dev/memcg/memory.use_hiera=
rchy to 0 failed<br>
</div>
<div>memcg_max_usage_in_bytes_test 5 TINFO: Running memcg_process --mmap-an=
on -s 4194304<br>
</div>
<div>memcg_max_usage_in_bytes_test 5 TINFO: Warming up pid: 3702766<br>
</div>
<div>memcg_max_usage_in_bytes_test 5 TINFO: Process is still here after war=
m up: 3702766<br>
</div>
<div>memcg_max_usage_in_bytes_test 5 TFAIL: memory.memsw.max_usage_in_bytes=
 is 4325376, 4194304 expected<br>
</div>
<div>memcg_max_usage_in_bytes_test 6 TPASS: memory.memsw.max_usage_in_bytes=
 is 0 as expected<br>
</div>
<div>&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
</div>
<div>initiation_status=3D&quot;ok&quot;<br>
</div>
<div>duration=3D5 termination_type=3Dexited termination_id=3D1 corefile=3Dn=
o<br>
</div>
<div>cutime=3D28 cstime=3D51<br>
</div>
<div>&lt;&lt;&lt;test_end&gt;&gt;&gt;<br>
</div>
<div>[{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 1}], 0, NULL) =3D 3701=
389<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370138=
9, si_uid=3D0, si_status=3D1, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff94bd8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>write(1, &quot;INFO: ltp-pan reported some test&quot;..., 39INFO: ltp-=
pan reported some tests FAIL<br>
</div>
<div>) =3D 39<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt&quot;, {st_mode=3DS_IFDIR|0711, st_siz=
e=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp&quot;, {st_mode=3DS_IFDIR|0755, st=
_size=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp/testcases&quot;, {st_mode=3DS_IFDI=
R|0755, st_size=3D4096, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp/testcases/bin&quot;, {st_mode=3DS_=
IFDIR|0755, st_size=3D135168, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/opt/ltp/testcases/bin&quot;, {st_mode=3DS_=
IFDIR|0755, st_size=3D135168, ...}, 0) =3D 0<br>
</div>
<div>chdir(&quot;/opt/ltp/testcases&quot;) &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; =3D 0<br>
</div>
<div>write(1, &quot;LTP Version: 20200515-28-gb54247&quot;..., 36LTP Versio=
n: 20200515-28-gb54247721<br>
</div>
<div>) =3D 36<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/cat&quot;, {st_mode=3DS_IFREG|0755, st=
_size=3D27224, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/cat&quot;, {st_mode=3DS_IFREG|0755, st=
_size=3D27224, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/cat&quot;, X_OK) &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/cat&quot;, {st_mode=3DS_IFREG|0755, st=
_size=3D27224, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/cat&quot;, R_OK) &nbsp; =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3703202<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, <br>
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
<div><br>
</div>
<div>[{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3703=
202<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370320=
2, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff95678, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, NULL, [], 8) &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/sbin/losetup&quot;, {st_mode=3DS_IFREG|075=
5, st_size=3D72856, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/sbin/losetup&quot;, {st_mode=3DS_IFREG|075=
5, st_size=3D72856, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/sbin/losetup&quot;, X_OK) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/sbin/losetup&quot;, {st_mode=3DS_IFREG|075=
5, st_size=3D72856, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/sbin/losetup&quot;, R_OK) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3703205<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3703205<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370320=
5, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>
</div>
<div>wait4(-1, 0x3ffff95a58, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/rm&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D47840, ...}, 0) =3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/rm&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D47840, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/rm&quot;, X_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>newfstatat(AT_FDCWD, &quot;/bin/rm&quot;, {st_mode=3DS_IFREG|0755, st_=
size=3D47840, ...}, 0) =3D 0<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getegid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>getuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>getgid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>faccessat(AT_FDCWD, &quot;/bin/rm&quot;, R_OK) &nbsp; &nbsp;=3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0<br>
</div>
<div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SET=
TID|SIGCHLD, child_tidptr=3D0x3fe4d1e0e0) =3D 3703216<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>wait4(-1, [{WIFEXITED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL=
) =3D 3703216<br>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x61d02, sa_mask=3D[], sa_flags=3D0=
}, {sa_handler=3D0x4c20a, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>ioctl(2, TIOCGWINSZ, {ws_row=3D53, ws_col=3D204, ws_xpixel=3D0, ws_ypi=
xel=3D0}) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D370321=
6, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D17} ---<br>
</div>
<div>wait4(-1, 0x3ffff95bc8, WNOHANG, NULL) &nbsp;=3D -1 ECHILD (No child p=
rocesses)<br>
</div>
<div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0<br>
</div>
<div>rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0<br>
</div>
<div>exit_group(1) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D ?<br>
</div>
<div>&#43;&#43;&#43; exited with 1 &#43;&#43;&#43;<br>
</div>
<span></span><br>
</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><span style=3D"font-family: Calibri, Arial, =
Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: inlin=
e !important">can someone help me on
 this??</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><span style=3D"font-family: Calibri, Arial, =
Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: inlin=
e !important"><br>
</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><span style=3D"font-family: Calibri, Arial, =
Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: inlin=
e !important">Thanks!</span></span></div>
</body>
</html>

--_000_BMXPR01MB23446DABE616696D41B6CF4DEE830BMXPR01MB2344INDP_--

--===============0749174477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0749174477==--
