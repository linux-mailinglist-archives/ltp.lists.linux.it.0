Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F146E1F3429
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 08:39:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AADA13C2E49
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 08:39:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 5B6743C2E3F
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 08:39:30 +0200 (CEST)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390120.outbound.protection.outlook.com [40.107.139.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B3960601650
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 08:39:28 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yrt7eJ3LN9GbXYVSmqakTvw01F6RAkGJLFS55vuR6NDHYci1O+suwRgWR+dBVmtJw6OkrCjLtK26PS/VWUajKEln8ecHP/qtSXepP734WWMGvf05uhexTLwLhYbLdVfMSqPHIIPvXjwC2D8VaqI7MaIKQaAamaWuiubsq7+Z5vVvzOik3M0bs5ZXAqluG9NnWy+GUVhUuiIttPe8JNLwRPKwtZ3jY3Xcl+YpayGtCusQ+rWVgADoSiFyGoA7fRBqV07MS6w+TwJZl1kIcoz7ptwbPMfjqTWyR/p47adWpDzBI2ckL+RPjvzJC+jOEJ3h2zmDSYtfCUa7P8qHDjS3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pElu3MyB/tMBLp94k28fOr8ehkRcjQe6IKSTAGGSeiU=;
 b=m7J7CeVzjQtsA71q19XJ78kS6rlUgVeqq2L7KbKIISSYkB2R/t7GC8uhXY8oPO10P34PXslYhxD4bMn9zL+LDg98RwTfDaqwp2Eo702RutJC0jo7ZFe/YIu6TGdyuvFC0GZsySbB+9lkDNogkGSyK41+nrpCMP7Qd6lHa1wWHUroCxsUCUhEpS4+39FEukfWSAa0fOD9REq/XJzZAIO0z86aPCiXodQEvGVspt7302GwHxGOsqa5QeIn/SGGYfAjdXasqlQt5+FKCUNc3w8eHcBKxCZOAfxzD3HWDdiOOnopJP8c07qstnKMQ0AxRaWLVTbHwUQlDKunl2XAnJ8U4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pElu3MyB/tMBLp94k28fOr8ehkRcjQe6IKSTAGGSeiU=;
 b=jYRs38Sh3OYfRa0hMG3uKKs2tylbJfXFIWt9muAajjUQZAC6Sil7rBNutrFyn9RaDGFUVF4YO3MP6TCuS6PfkqPHk1CAntUpMVihHquNF6vBJPaJl9n25KfbrGZFuN2xrgoPeTsPP5NbfdMaFGtjO1bFKOvCp66eaVNJWbGBvaE=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BMXPR01MB2135.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:34::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 06:39:24 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bc78:c2b:bbf1:704]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bc78:c2b:bbf1:704%2]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 06:39:24 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Jan Stancek <jstancek@redhat.com>
Thread-Topic: [LTP] sched_rr_get_interval01 , sched_rr_get_interval02 ,
 sched_rr_get_interval03 testcase failure
Thread-Index: AQHWPaRp6Cqd9U2uDkWBsGMqNoKOG6jPuRdnq9je5cLUJztFZQ==
Date: Tue, 9 Jun 2020 06:39:24 +0000
Message-ID: <BMXPR01MB23445D894481BDFED050AD27EE820@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB23442B106F1292542BA7F85CEE850@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
 <1210169239.15186381.1591627929151.JavaMail.zimbra@redhat.com>
 <BMXPR01MB2344728D919729E8F7F007EBEE820@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>,
 <1150717403.15265201.1591683953555.JavaMail.zimbra@redhat.com>
In-Reply-To: <1150717403.15265201.1591683953555.JavaMail.zimbra@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none; redhat.com; dmarc=none action=none header.from=exaleapsemi.com; 
x-originating-ip: [2405:204:92a0:2461:8832:6667:b5a6:6775]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dda19cc4-d646-4c5c-70a5-08d80c3fd9b8
x-ms-traffictypediagnostic: BMXPR01MB2135:
x-microsoft-antispam-prvs: <BMXPR01MB213539A11B2E8C018683DF11EE820@BMXPR01MB2135.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:336;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EI5DyLbNMQpreuuLajrwojd0rmQDG/ZY3618cyJKIy4SqFAg9pihzPFISCJ/Rkiy6CK99RBziLRcWo9yxztEcLIw1cdIEPIIduZVa+42RE8p7zXWNu9tfq2WG5iqyg35N4Kzz2LYK8T5XteKzGssf3qI0Be3ZrilEoF/kC6/mEAnvnQcYpaeAx2DR0W5JOujtugVaGZ6EMYTm1IDRwWVOjhWxsEcunefN81J5LBgN3RBi2kp4OoD6/XjNLtFLeep29CZEfu8XHK4+68al9usPT96vXfVt3mjgleBjpRxqGeaEeLPfDKeTq2Kzn4PexKNrpTJSnmy/3N1hFHICU2EtQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39830400003)(346002)(366004)(396003)(136003)(376002)(33656002)(71200400001)(76116006)(19627405001)(86362001)(508600001)(83380400001)(66446008)(66476007)(8676002)(2906002)(66946007)(64756008)(66556008)(316002)(52536014)(55016002)(7696005)(6506007)(186003)(53546011)(4326008)(6916009)(5660300002)(9686003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: DUq/QX8aD83D9ZQjfB8mJ3n/qxH8dkF4Sbke0u0dWvxeFR7SQ/hVucuRJLOQ1aGnSqDlkrnKyjBJtByAQe7SeWYu6fB0AOcD3n6IyjC/5eW+uAV1NBjSpZXnO9L0TVg1TIns06hIfR/p5KGIIK9srKw8eJjnvxd+fUljEFbRfTQ4OJNexui8i0PVtbFnhUlOEU0UovBjBfkFo17AP6A6Kjx6z1/AoXmWbq+UgoCeqAjzCQpbstjQUrqVQVvcjOlGL8BQnq60pAKsLuIl6nJBpcImP2At+oVS7L/tcDKistZji+GxSJI6RQTXfni4AH3CuMmK8ncnEtZiH1XdpLTJ00bQhQraYeEeY1G3jDSznHr8YstajFn7QeElCdNEg5yMkzOSMpqRBuD6pv7WnZqvAms2REM1nBKLdrPnIg91xkrgFpnm6yFkHrOYMkIFvA8oGdzoT3BCS2fVJkyYLWPYA4y2WuMrVGNlpWSJnvFhaZWPl5a0l++20z6qdPsjcxA7uJPWMk/7v7y0Y68G9yGlZ4HGnGCqkiwOsV7ae20+rro1D0z/1vmYyUJdhAC3A5Ye
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda19cc4-d646-4c5c-70a5-08d80c3fd9b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 06:39:24.7361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M43zU5SPWZymZlXPMV6OOAMoZxiHGW5wdsr8P8I8DQGCJIPkoN+U7hRbQDF4jb5KlW0l1JO37Wh9qQHOmMckUSUFgwCImmUKsvHxbm9Hs3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2135
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] sched_rr_get_interval01 , sched_rr_get_interval02 ,
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
Content-Type: multipart/mixed; boundary="===============2048195516=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2048195516==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB23445D894481BDFED050AD27EE820BMXPR01MB2344INDP_"

--_000_BMXPR01MB23445D894481BDFED050AD27EE820BMXPR01MB2344INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

1)root@exaleapsemi-r2:/opt/ltp# strace ./testcases/bin/sched_setparam02

execve("./testcases/bin/sched_setparam02", ["./testcases/bin/sched_setparam=
02"], 0x3fffa4bcb0 /* 16 vars */) =3D 0
brk(NULL)                               =3D 0x2e000
uname({sysname=3D"Linux", nodename=3D"exaleapsemi-r2.00", ...}) =3D 0
faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) =3D -1 ENOENT (No such file=
 or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 3
fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D70080, ...}) =3D 0
mmap(NULL, 70080, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x3fe2e3b000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0d5\2\0\0\0\0\0"..=
., 832) =3D 832
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D1065488, ...}) =3D 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x3fe2e39000
mmap(NULL, 1076752, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0x3fe2d32000
mmap(0x3fe2e30000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_D=
ENYWRITE, 3, 0xfd000) =3D 0x3fe2e30000
mmap(0x3fe2e36000, 11792, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_A=
NONYMOUS, -1, 0) =3D 0x3fe2e36000
close(3)                                =3D 0
mprotect(0x3fe2e30000, 12288, PROT_READ) =3D 0
mprotect(0x27000, 4096, PROT_READ)      =3D 0
mprotect(0x3fe2e67000, 4096, PROT_READ) =3D 0
munmap(0x3fe2e3b000, 70080)             =3D 0
brk(NULL)                               =3D 0x2e000
brk(0x4f000)                            =3D 0x4f000
geteuid()                               =3D 0
rt_sigaction(SIGHUP, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RES=
TART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGINT, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RES=
TART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGQUIT, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGILL, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RES=
TART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTRAP, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGABRT, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGBUS, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RES=
TART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGFPE, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RES=
TART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGUSR1, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGSEGV, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGUSR2, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGPIPE, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGALRM, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTERM, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGSTKFLT, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_=
RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGCHLD, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTSTP, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTTIN, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGTTOU, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGURG, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RES=
TART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGXCPU, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGXFSZ, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGVTALRM, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_=
RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGPROF, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RE=
START}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGWINCH, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_R=
ESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGIO, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_REST=
ART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGPWR, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RES=
TART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGSYS, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_RES=
TART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
rt_sigaction(SIGRT_16, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA_R=
ESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
sched_setscheduler(0, SCHED_FIFO, [1])  =3D -1 EPERM (Operation not permitt=
ed)
ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
fstat(1, {st_mode=3DS_IFCHR|0620, st_rdev=3Dmakedev(0x88, 0x2), ...}) =3D 0
write(1, "sched_setparam02    1  \33[1;31mTB"..., 97sched_setparam02    1  =
TBROK  :  sched_setparam02.c:118: sched_setscheduler()  failed
) =3D 97
write(1, "sched_setparam02    2  \33[1;31mTB"..., 91sched_setparam02    2  =
TBROK  :  sched_setparam02.c:118: Remaining cases broken
) =3D 91
exit_group(2)                           =3D ?
+++ exited with 2 +++

2)
root@exaleapsemi-r2:/opt/ltp# pu_mnt=3D$(mount | grep "type cgroup (.*cpu[,=
)]" | awk '{print $3}')
root@exaleapsemi-r2:/opt/ltp# cpu_mnt=3D$(mount | grep "type cgroup (.*cpu[=
,)]" | awk '{print $3}')
root@exaleapsemi-r2:/opt/ltp# p=3D$(cat /proc/self/cgroup | grep ":cpu[:,]"=
 | sed "s/.*://")
root@exaleapsemi-r2:/opt/ltp# cat $cpu_mnt/$p/cpu.rt_runtime_us
cat: //system.slice/system-sshd.slice/cpu.rt_runtime_us: No such file or di=
rectory

it didnt gave any info about cpu.rt_runtime_us??

Thanks!


________________________________
From: Jan Stancek <jstancek@redhat.com>
Sent: Tuesday, June 9, 2020 11:55 AM
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] sched_rr_get_interval01 , sched_rr_get_interval02 , sche=
d_rr_get_interval03 testcase failure



----- Original Message -----
> Hi Jan Stancek,
> Thanks for your response.All of the following test are failing w.r.t sche=
d
>
> 1) sched_setparam02
> 2) sched_setparam03
> 3) sched_getscheduler01

That suggests it could be cpu.rt_runtime_us =3D=3D 0, since all tests are
trying to use realtime scheduler.

>
> root@exaleapsemi-r2:/opt/ltp# strace ./runltp -s sched_setparam02

Above doesn't help much, since you are not tracing child processes.

1. Can you run this instead:
 /opt/ltp# strace ./testcases/bin/sched_setparam02

2. Can you check what is the cpu.rt_runtime_us for pid that runs the test?

# cpu_mnt=3D$(mount | grep "type cgroup (.*cpu[,)]" | awk '{print $3}')
# p=3D$(cat /proc/self/cgroup | grep ":cpu[:,]" | sed "s/.*://")
# cat $cpu_mnt/$p/cpu.rt_runtime_us

[EXT]

--_000_BMXPR01MB23445D894481BDFED050AD27EE820BMXPR01MB2344INDP_
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
1)<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgr=
ound-color: rgb(255, 255, 255); display: inline !important">root@exaleapsem=
i-r2:/opt/ltp# strace ./testcases/bin/sched_setparam02</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div>execve(&quot;./testcases/bin/sched_setparam02&quot;, [&quot;./testcase=
s/bin/sched_setparam02&quot;], 0x3fffa4bcb0 /* 16 vars */) =3D 0<br>
</div>
<div>brk(NULL) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x2e000<br>
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
<div>mmap(NULL, 70080, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x3fe2e3b000<br>
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
<div>mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, =
0) =3D 0x3fe2e39000<br>
</div>
<div>mmap(NULL, 1076752, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,=
 0) =3D 0x3fe2d32000<br>
</div>
<div>mmap(0x3fe2e30000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|=
MAP_DENYWRITE, 3, 0xfd000) =3D 0x3fe2e30000<br>
</div>
<div>mmap(0x3fe2e36000, 11792, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|=
MAP_ANONYMOUS, -1, 0) =3D 0x3fe2e36000<br>
</div>
<div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>mprotect(0x3fe2e30000, 12288, PROT_READ) =3D 0<br>
</div>
<div>mprotect(0x27000, 4096, PROT_READ) &nbsp; &nbsp; &nbsp;=3D 0<br>
</div>
<div>mprotect(0x3fe2e67000, 4096, PROT_READ) =3D 0<br>
</div>
<div>munmap(0x3fe2e3b000, 70080) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
=3D 0<br>
</div>
<div>brk(NULL) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x2e000<br>
</div>
<div>brk(0x4f000) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0x4f000<br>
</div>
<div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br>
</div>
<div>rt_sigaction(SIGHUP, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DS=
A_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br=
>
</div>
<div>rt_sigaction(SIGINT, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DS=
A_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br=
>
</div>
<div>rt_sigaction(SIGQUIT, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGILL, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DS=
A_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br=
>
</div>
<div>rt_sigaction(SIGTRAP, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGABRT, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGBUS, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DS=
A_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br=
>
</div>
<div>rt_sigaction(SIGFPE, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DS=
A_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br=
>
</div>
<div>rt_sigaction(SIGUSR1, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGSEGV, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGUSR2, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGPIPE, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGALRM, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGTERM, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGSTKFLT, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=
=3DSA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D =
0<br>
</div>
<div>rt_sigaction(SIGCHLD, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGTSTP, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGTTIN, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGTTOU, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGURG, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DS=
A_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br=
>
</div>
<div>rt_sigaction(SIGXCPU, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGXFSZ, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGVTALRM, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=
=3DSA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D =
0<br>
</div>
<div>rt_sigaction(SIGPROF, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r>
</div>
<div>rt_sigaction(SIGWINCH, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=
=3DSA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D =
0<br>
</div>
<div>rt_sigaction(SIGIO, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DSA=
_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>
</div>
<div>rt_sigaction(SIGPWR, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DS=
A_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br=
>
</div>
<div>rt_sigaction(SIGSYS, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flags=3DS=
A_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br=
>
</div>
<div><b>rt_sigaction(SIGRT_16, {sa_handler=3D0x196ac, sa_mask=3D[], sa_flag=
s=3DSA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D=
 0<br>
</b></div>
<div><b>sched_setscheduler(0, SCHED_FIFO, [1]) &nbsp;=3D -1 EPERM (Operatio=
n not permitted)<br>
</b></div>
<div><b>ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0<br>
</b></div>
<div><b>fstat(1, {st_mode=3DS_IFCHR|0620, st_rdev=3Dmakedev(0x88, 0x2), ...=
}) =3D 0<br>
</b></div>
<div><b>write(1, &quot;sched_setparam02 &nbsp; &nbsp;1 &nbsp;\33[1;31mTB&qu=
ot;..., 97sched_setparam02 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;sched_s=
etparam02.c:118: sched_setscheduler() &nbsp;failed<br>
</b></div>
<div><b>) =3D 97<br>
</b></div>
<div><b>write(1, &quot;sched_setparam02 &nbsp; &nbsp;2 &nbsp;\33[1;31mTB&qu=
ot;..., 91sched_setparam02 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;sched_s=
etparam02.c:118: Remaining cases broken<br>
</b></div>
<div><b>) =3D 91<br>
</b></div>
<div><b>exit_group(2) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D ?<br>
</b></div>
<div><b>&#43;&#43;&#43; exited with 2 &#43;&#43;&#43;</b><br>
</div>
<span></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
2)&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>root@exaleapsemi-r2:/opt/ltp# pu_mnt=3D$(mount | grep &quot;type cgro=
up (.*cpu[,)]&quot; | awk '{print $3}')<br>
</span>
<div>root@exaleapsemi-r2:/opt/ltp# cpu_mnt=3D$(mount | grep &quot;type cgro=
up (.*cpu[,)]&quot; | awk '{print $3}')<br>
</div>
<div>root@exaleapsemi-r2:/opt/ltp# p=3D$(cat /proc/self/cgroup | grep &quot=
;:cpu[:,]&quot; | sed &quot;s/.*://&quot;)<br>
</div>
<div>root@exaleapsemi-r2:/opt/ltp# cat $cpu_mnt/$p/cpu.rt_runtime_us<br>
</div>
<div>cat: //system.slice/system-sshd.slice/cpu.rt_runtime_us: No such file =
or directory<br>
</div>
<span></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
it didnt gave any info about&nbsp;<span style=3D"font-family: Calibri, Aria=
l, Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: in=
line !important">cpu.rt_runtime_us??</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important">Thanks!</span></d=
iv>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Jan Stancek &lt;jstan=
cek@redhat.com&gt;<br>
<b>Sent:</b> Tuesday, June 9, 2020 11:55 AM<br>
<b>To:</b> Pankaj Vinadrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Cc:</b> LTP List &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] sched_rr_get_interval01 , sched_rr_get_interval02=
 , sched_rr_get_interval03 testcase failure</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText"><br>
<br>
----- Original Message -----<br>
&gt; Hi Jan Stancek,<br>
&gt; Thanks for your response.All of the following test are failing w.r.t s=
ched<br>
&gt;<br>
&gt; 1) sched_setparam02<br>
&gt; 2) sched_setparam03<br>
&gt; 3) sched_getscheduler01<br>
<br>
That suggests it could be cpu.rt_runtime_us =3D=3D 0, since all tests are<b=
r>
trying to use realtime scheduler.<br>
<br>
&gt;<br>
&gt; root@exaleapsemi-r2:/opt/ltp# strace ./runltp -s sched_setparam02<br>
<br>
Above doesn't help much, since you are not tracing child processes.<br>
<br>
1. Can you run this instead:<br>
&nbsp;/opt/ltp# strace ./testcases/bin/sched_setparam02<br>
<br>
2. Can you check what is the cpu.rt_runtime_us for pid that runs the test?<=
br>
<br>
# cpu_mnt=3D$(mount | grep &quot;type cgroup (.*cpu[,)]&quot; | awk '{print=
 $3}')<br>
# p=3D$(cat /proc/self/cgroup | grep &quot;:cpu[:,]&quot; | sed &quot;s/.*:=
//&quot;)<br>
# cat $cpu_mnt/$p/cpu.rt_runtime_us<br>
<br>
[EXT]<br>
</div>
</span></font></div>
</body>
</html>

--_000_BMXPR01MB23445D894481BDFED050AD27EE820BMXPR01MB2344INDP_--

--===============2048195516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2048195516==--
