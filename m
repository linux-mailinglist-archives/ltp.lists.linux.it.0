Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0451D32E7BE
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 13:15:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A60E33C5643
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 13:15:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0C65C3C562B
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 13:14:58 +0100 (CET)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380127.outbound.protection.outlook.com [40.107.138.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 185351A006E9
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 13:14:57 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdiZY+T+oidiHG5PVR5P4t9b1Z29F4wtvnl+JaC8YlyIDak/a6nfemr39w1HffHUi6+4Oehh7s9NFmE4otntmLXRv8p5Gsol1tA9JcIJlSx2JZjSkYUEaTtwE/mtDH6LOkT5TewUUpm8ZaVKfEvyMa6LViIYjRtngrTvWv1qeNW62ontRZh8uLuPAP0MAtx6dydjgfWx2UzQ8t8ywlukaSL0zpyyaJnRB8RTTj6BQqcvifSvCBTkUwtp6puCTypC9VUVgWv4qGfYO+CVhZcOhe5A0U2SUIZD0HiWfJ7UXK3UAW5tPB0pPm6sm2t1dsY6h39VrpuU9iBE81jEYM5e1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+D21kh7dKqVhA1Baz8VC+Lj3wqkM1joKqmTIhbrITY=;
 b=CwxGTdwO3P/lN/+b1clE++3CAKWQHpuluZTIfm6eLMQYSHdkp3onKoBAqhI46yKODwXnO7tdl8ab47iCJFzmNbjGuP2CtbwyVgYsmJ+lKJWgdkNHrQUi1aKDmIGSIadQ+Ma+5YAVZWD2TW9ZQvDEka7jxlWnSP4EJdIRHQEDQcvJiFkJZXLLc2meR5793MwGzf15wnYyrYwVLUm28/zPyf+co8SPyydKulyz+EdYPO/fr/OfPtfhJd+LxNbI793P5oq/pKykEURMZNVcvlEIiwSBBf/g3UtHH8AMyKHL6feHk3xD5LvA5KCzWgyEb4TcXGjx2cuzuRY0XbL6vGyspw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+D21kh7dKqVhA1Baz8VC+Lj3wqkM1joKqmTIhbrITY=;
 b=yiW5wR87gFheWvq6EGdhHTxR/EBWdW8MqtliAysV0kzWEsKVinVXPUFcmL0UwjWOpwCVACFC3hQpipMSTYk/BJwL+GHi3ju/zl+CEsq5idabvFGj9Qgf1pXqT5rYQEGDSZn2W8p2r10dUuY+YqcZkCW6xOV1tHDa3eDkFxC09S8=
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2f::22)
 by BM1PR0101MB1460.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 12:14:51 +0000
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7069:eebb:c39d:f1e1]) by BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7069:eebb:c39d:f1e1%5]) with mapi id 15.20.3890.032; Fri, 5 Mar 2021
 12:14:51 +0000
From: "Pankaj  Vinodrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: kdump failing
Thread-Index: AQHXEbhPQc1KeDW30E+E+PdN7vwpUw==
Date: Fri, 5 Mar 2021 12:14:51 +0000
Message-ID: <BMXPR01MB2870FFDC3E54FA0F9350C5D6EE969@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 068569e2-2b45-4bf9-b1b8-08d8dfd0472f
x-ms-traffictypediagnostic: BM1PR0101MB1460:
x-microsoft-antispam-prvs: <BM1PR0101MB1460264ECE55424A9FD6437DEE969@BM1PR0101MB1460.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EFn4LF0U3FbRCH6IY5RK30XEqAVqgNO7UuAxXqvzytdmaEc264QNRZsTiAhvzh7LvUZvVHXpenMK5+aNXWkZEhzYG7NJvZ7i3rydFf2XAkQFfUIBMQu4EPQx2SPEJ4FrggWpbmUUP0CZNHMRBr/RasA1B8LCQTjmzDYGzCfAkZb1mJjWzQv6OwFwMkAUqrzbBTeoKcxVYLs++lRQ3u/Jwx/XEfCNnU8zrFxx36+iyl0tCwxYSkwwjcJetrCklwJoFyScJZk5yAqpM98oszfPX3i7GTOsjR1N0vzbawkQzHX7W4SWcL0SvodUYSxnI2ZHVKmJYfBybZy9rOCfZruE5jZJhbDizFDo/ribpwBRwYwBZMqdLPWOX9HTBy9Ch2XcMDz/7rqcKI1Dfp1H2i9iZ5weO6QHSjvce3sehmjtSbrn4rL5OoO3QcX6raQZwyrAc1Gx1+A4yzWk5ZvQiVTZ4/Gdi8zmzBe93zLZFmi0Lc3hKV/SBacI/qsz4X+QBYf48uPT2nqd8TdWp2+ihf1Whw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(39830400003)(136003)(366004)(26005)(66446008)(66556008)(5660300002)(64756008)(66476007)(83380400001)(66946007)(7696005)(6506007)(76116006)(8936002)(3480700007)(86362001)(55236004)(91956017)(8676002)(316002)(19627405001)(6916009)(71200400001)(52536014)(7116003)(478600001)(9686003)(186003)(2906002)(33656002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?kmz0T8BSvpBDYtKod38UZYbI0+JXIxOHDXUkwCIRYW8pdgxMkanQwc/7?=
 =?Windows-1252?Q?slDnAn1QzreEQGGspFWc+Ebs8LJ0k2wcU9zyfD/YzVl5hbKLdeunNUUO?=
 =?Windows-1252?Q?kynPs8MYPGvjOV8DpVI8t9Fst5XjFJLBRxbFLjQnAlTaoIOz30bfLbRH?=
 =?Windows-1252?Q?jyTX4J6uI6f6D4k0w9tISw6b7bBBg6Lo3mYOFzMnLeG8rEoZsOgXiap4?=
 =?Windows-1252?Q?vTNEQ61sehd1UCTPcSlklvau2vdopNTKzbE9NXp/NIUPAjZ3WSruV55p?=
 =?Windows-1252?Q?ohiS3jUpmyiKFpsjrNaxDPbwwvo3hmsjbOMfDWyRKzZIlkuGRJfpxFwV?=
 =?Windows-1252?Q?2dicwM5vim6e2YkWv5El6iIAFu+3uTZVJN5c/nGJp76O0h+4WuPIFSIK?=
 =?Windows-1252?Q?2fpIV6Yht3+Q1oQt8kSawsBJdM6wkvVVpVBTdWAMQdEQh+dksKhFICdQ?=
 =?Windows-1252?Q?Z4TvbrLmBI6yVAV9WVz7snO2nzjnV0HRcvjr+AnNQOrbmMhXSDeiFIrD?=
 =?Windows-1252?Q?OF1D3Ytp6cukbXcBEx5ceTQqZOff0cPabVEUMSSZ6aD0MSUPpvvaNInM?=
 =?Windows-1252?Q?3xyuTPsNHiPwb7PBxiXutUMIL8I83oy3r+IrdusWhgzBrDw+OhOWgc6N?=
 =?Windows-1252?Q?AOjpymSl2osu/iRwOP0F0iCZSpfC2jQjPFG3Q9poPG/zTy+6AR78L+kc?=
 =?Windows-1252?Q?qOSZyNSbKPiHtRuVmGcEXGPgM5R3iQicWcY7lj+Mp9VrJNX7kGHE4K9L?=
 =?Windows-1252?Q?5Edm/0OMvLfhgOAAApuVKLYNLLW6Hmovgq2Q9HK6hd4stgaQdXx0G1cK?=
 =?Windows-1252?Q?zJFcQMS9LdGS2IL3n/sPoTjzXrstCdxAwDMa8FuE0EBSasegjVk6LRgM?=
 =?Windows-1252?Q?wBN3YvYFB+6Exf3wmA3KgLDpyx7cbPr5oQDumtjFzWYPKL4jyU2X1Zuu?=
 =?Windows-1252?Q?MntY7G5l73+jj/plNP5gmYWilLgp8jgm/CgPUdV0x4GCu+3fMGNw6etf?=
 =?Windows-1252?Q?lvdgsO+9x9xce5oxUhCNK8PvIhJoYQws+v8sZDMloDtdwP0ofhNyVPLt?=
 =?Windows-1252?Q?wyrNPGzUdco7Vaha08XIm2PzZtf16yUEw8+JrJKgB4qJL3DDUcURvMcz?=
 =?Windows-1252?Q?rhSPXwB8VUAQjWzxYO8A6IMvPYyAxRdDTFZZbCFo3pKt7HxPOrcInR2s?=
 =?Windows-1252?Q?BLyT9oyI4L+bRvshnYAWs92xJRXkRGWMGxnMbmJ0/oMM3qhbmEJOUAhU?=
 =?Windows-1252?Q?9FKsxnmt3u0O706fR9VuHYumc4dXDU6EE56pO4LMGXEgfUHjSOGsOYjg?=
 =?Windows-1252?Q?TT4CDzW43EhkJWYZNggPTopWslJYwyOGYpwT4n3sA8DZEtyNGX3qliuO?=
 =?Windows-1252?Q?CPlTjQzKvCzHCRyUJ3kWx17bZye8E2Heffk=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 068569e2-2b45-4bf9-b1b8-08d8dfd0472f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 12:14:51.2485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iJ6STOGM8q5u6vL4Hx4oXoWhYjBvLEngTulwFeBpbrbaZvCW4JQQw+O4oRXwu8sdSA0XJ3HlTeDXrYUdOx6eBPnSzGnFA+gzRoHLuQgQjEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1460
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] kdump failing
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
Content-Type: multipart/mixed; boundary="===============0492955134=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0492955134==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB2870FFDC3E54FA0F9350C5D6EE969BMXPR01MB2870INDP_"

--_000_BMXPR01MB2870FFDC3E54FA0F9350C5D6EE969BMXPR01MB2870INDP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,
i am trying to run kdump test but i am getting following error.Can you sugg=
est what will be the reason for failure ??

root@test:/home/test/ltp/testcases/kdump# make
chmod a+x runkdump.sh lib/*.sh
./runkdump.sh
+ conf=3D./runkdump.conf
+ lib=3Dlib
+ log=3Dlog
+ . ./runkdump.conf
+ ITERATION=3D1
+ CRASH=3D0
+ REBOOT=3D0
+ uname -r
+ VMLINUX=3D/usr/lib/debug/lib/modules/5.3.0-28-generic/vmlinux
+ COREDIR=3D/var/crash
+ FILTER=3D0
+ MAKE_OPTIONS=3D
+ LINK_DELAY=3D
+ CRASHER=3DACS ACP ACB ACE ACL
+ BASIC_LKDTM=3DKPIDB KPIEB KPTEE KPBL
+ EXTRA_LKDTM=3D
KPIDE KPIDL KPIDP KPIDO
KPIEE KPIEL KPIEP KPIEO
KPTEB KPTEL KPTEP KPTEO
KPBB KPBE KPBP KPBO
KPMSB KPMSE KPMSL KPMSP KPMSO
KPTB KPTE KPTL KPTP KPTO
KPSB KPSE KPSL KPSP KPSO
KPIB KPIE KPIL KPIP KPIO

+ EXTRA_DUMP=3DKLEXT KLLBL KLUID KLRAW KNSCP KNNFS KDENB
+ EXT3_PART=3D
+ EXT3_LABEL=3D
+ EXT3_UID=3D
+ RAW_PART=3D
+ SCP_PATH=3D
+ SCP_PASS=3D
+ NFS_PATH=3D
+ [ -z 1 ]
+ [ -z 0 ]
+ [ -z /var/crash ]
+ cd lib
+ [ 1 -ge 1 ]
+ [ -z 0 ]
+ [ 0 -eq 0 ]
+ echo Setup test environment.
Setup test environment.
+ SetupCrontab
+ echo Setup crontab.
Setup crontab.
+ set +e
+ crontab -r
no crontab for root
+ set -e
+ pwd
+ date +%F-%T
+ cat
+ crontab kdump.cron
+ echo Enable cron daemon by default.
Enable cron daemon by default.
+ [ -f /etc/init.d/crond ]
+ cron=3Dcron
+ [ -x /sbin/chkconfig ]
+ [ -x /sbin/update-rc.d ]
+ ./setup.sh .././runkdump.conf
+ conf=3D.././runkdump.conf
+ uname -m
+ arch=3Dx86_64
+ uname -r
+ kver=3D5.3.0-28-generic
+ . .././runkdump.conf
+ ITERATION=3D1
+ CRASH=3D0
+ REBOOT=3D0
+ uname -r
+ VMLINUX=3D/usr/lib/debug/lib/modules/5.3.0-28-generic/vmlinux
+ COREDIR=3D/var/crash
+ FILTER=3D0
+ MAKE_OPTIONS=3D
+ LINK_DELAY=3D
+ CRASHER=3DACS ACP ACB ACE ACL
+ BASIC_LKDTM=3DKPIDB KPIEB KPTEE KPBL
+ EXTRA_LKDTM=3D
KPIDE KPIDL KPIDP KPIDO
KPIEE KPIEL KPIEP KPIEO
KPTEB KPTEL KPTEP KPTEO
KPBB KPBE KPBP KPBO
KPMSB KPMSE KPMSL KPMSP KPMSO
KPTB KPTE KPTL KPTP KPTO
KPSB KPSE KPSL KPSP KPSO
KPIB KPIE KPIL KPIP KPIO

+ EXTRA_DUMP=3DKLEXT KLLBL KLUID KLRAW KNSCP KNNFS KDENB
+ EXT3_PART=3D
+ EXT3_LABEL=3D
+ EXT3_UID=3D
+ RAW_PART=3D
+ SCP_PATH=3D
+ SCP_PASS=3D
+ NFS_PATH=3D
+ echo Verify Kernel version >=3D 2.6.16.
Verify Kernel version >=3D 2.6.16.
+ kx=3D5
+ tmp=3D3.0-28-generic
+ ky=3D3
+ tmp=3D0-28-generic
+ tmp=3D0-28-generic
+ kz=3D0
+ [ 5 -lt 2 ]
+ [ 5 -eq 2 ]
+ [  ]
+ echo Verify user is root.
Verify user is root.
+ id -u
+ [ 0 !=3D 0 ]
+ echo Verify prerequisite.
Verify prerequisite.
+ [ ! -x /sbin/kexec ]
+ [ ! -d /lib/modules/5.3.0-28-generic/build ]
+ [ 0 ]
+ [ 0 -eq 1 ]
+ [  ]
+ echo Compile Kernel modules.
Compile Kernel modules.
+ make clean
make[1]: Entering directory '/home/test/ltp/testcases/kdump/lib'
make -C crasher clean
make[2]: Entering directory '/home/test/ltp/testcases/kdump/lib/crasher'
make -C /lib/modules/5.3.0-28-generic/build M=3D/home/test/ltp/testcases/kd=
ump/lib/crasher clean
make[3]: Entering directory '/usr/src/linux-headers-5.3.0-28-generic'
make[3]: Leaving directory '/usr/src/linux-headers-5.3.0-28-generic'
rm -f Module.symvers
make[2]: Leaving directory '/home/test/ltp/testcases/kdump/lib/crasher'
make -C lkdtm clean
make[2]: Entering directory '/home/test/ltp/testcases/kdump/lib/lkdtm'
make -C /lib/modules/5.3.0-28-generic/build M=3D/home/test/ltp/testcases/kd=
ump/lib/lkdtm clean
make[3]: Entering directory '/usr/src/linux-headers-5.3.0-28-generic'
make[3]: Leaving directory '/usr/src/linux-headers-5.3.0-28-generic'
rm -f Module.symvers
make[2]: Leaving directory '/home/test/ltp/testcases/kdump/lib/lkdtm'
make[1]: Leaving directory '/home/test/ltp/testcases/kdump/lib'
+ make -C kprobes
+ make
make[1]: Entering directory '/home/test/ltp/testcases/kdump/lib'
make -C crasher
make[2]: Entering directory '/home/test/ltp/testcases/kdump/lib/crasher'
make -C /lib/modules/5.3.0-28-generic/build M=3D/home/test/ltp/testcases/kd=
ump/lib/crasher modules
make[3]: Entering directory '/usr/src/linux-headers-5.3.0-28-generic'
  CC [M]  /home/test/ltp/testcases/kdump/lib/crasher/crasher.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /home/test/ltp/testcases/kdump/lib/crasher/crasher.mod.o
  LD [M]  /home/test/ltp/testcases/kdump/lib/crasher/crasher.ko
make[3]: Leaving directory '/usr/src/linux-headers-5.3.0-28-generic'
make[2]: Leaving directory '/home/test/ltp/testcases/kdump/lib/crasher'
make -C lkdtm
make[2]: Entering directory '/home/test/ltp/testcases/kdump/lib/lkdtm'
make -C /lib/modules/5.3.0-28-generic/build M=3D/home/test/ltp/testcases/kd=
ump/lib/lkdtm modules
make[3]: Entering directory '/usr/src/linux-headers-5.3.0-28-generic'
  CC [M]  /home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.o
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In function =91jp_do_irq=
=92:
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:139:2: error: implicit dec=
laration of function =91jprobe_return=92; did you mean =91probe_irq_on=92? =
[-Werror=3Dimplicit-function-declaration]
  jprobe_return();
  ^~~~~~~~~~~~~
  probe_irq_on
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In function =91lkdtm_look=
up_name=92:
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:295:10: error: invalid use=
 of undefined type =91struct jprobe=92
   *(lkdtm.kp.addr) =3D addr;
          ^
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:296:8: error: invalid use =
of undefined type =91struct jprobe=92
   lkdtm.entry =3D JPROBE_ENTRY(entry);
        ^
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:296:17: error: implicit de=
claration of function =91JPROBE_ENTRY=92; did you mean =91KPROBE_REENTER=92=
? [-Werror=3Dimplicit-function-declaration]
   lkdtm.entry =3D JPROBE_ENTRY(entry);
                 ^~~~~~~~~~~~
                 KPROBE_REENTER
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In function =91lkdtm_modu=
le_init=92:
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:468:13: error: implicit de=
claration of function =91register_jprobe=92; did you mean =91register_kprob=
e=92? [-Werror=3Dimplicit-function-declaration]
  if ((ret =3D register_jprobe(&lkdtm)) < 0) {
             ^~~~~~~~~~~~~~~
             register_kprobe
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In function =91lkdtm_modu=
le_exit=92:
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:480:2: error: implicit dec=
laration of function =91unregister_jprobe=92; did you mean =91unregister_kp=
robe=92? [-Werror=3Dimplicit-function-declaration]
  unregister_jprobe(&lkdtm);
  ^~~~~~~~~~~~~~~~~
  unregister_kprobe
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: At top level:
/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:110:22: error: storage siz=
e of =91lkdtm=92 isn=92t known
 static struct jprobe lkdtm;
                      ^~~~~
cc1: some warnings being treated as errors
scripts/Makefile.build:288: recipe for target '/home/test/ltp/testcases/kdu=
mp/lib/lkdtm/lkdtm.o' failed
make[4]: *** [/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.o] Error 1
Makefile:1655: recipe for target '_module_/home/test/ltp/testcases/kdump/li=
b/lkdtm' failed
make[3]: *** [_module_/home/test/ltp/testcases/kdump/lib/lkdtm] Error 2
make[3]: Leaving directory '/usr/src/linux-headers-5.3.0-28-generic'
Makefile:11: recipe for target 'default' failed
make[2]: *** [default] Error 2
make[2]: Leaving directory '/home/test/ltp/testcases/kdump/lib/lkdtm'
Makefile:2: recipe for target 'default' failed
make[1]: *** [default] Error 2
make[1]: Leaving directory '/home/test/ltp/testcases/kdump/lib'
Makefile:2: recipe for target 'all' failed
make: *** [all] Error 2


Thanks


--_000_BMXPR01MB2870FFDC3E54FA0F9350C5D6EE969BMXPR01MB2870INDP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
i am trying to run kdump test but i am getting following error.Can you sugg=
est what will be the reason for failure ??<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
root@test:/home/test/ltp/testcases/kdump# make</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div>chmod a+x runkdump.sh lib/*.sh</div>
<div>./runkdump.sh</div>
<div>+ conf=3D./runkdump.conf</div>
<div>+ lib=3Dlib</div>
<div>+ log=3Dlog</div>
<div>+ . ./runkdump.conf</div>
<div>+ ITERATION=3D1</div>
<div>+ CRASH=3D0</div>
<div>+ REBOOT=3D0</div>
<div>+ uname -r</div>
<div>+ VMLINUX=3D/usr/lib/debug/lib/modules/5.3.0-28-generic/vmlinux</div>
<div>+ COREDIR=3D/var/crash</div>
<div>+ FILTER=3D0</div>
<div>+ MAKE_OPTIONS=3D</div>
<div>+ LINK_DELAY=3D</div>
<div>+ CRASHER=3DACS ACP ACB ACE ACL</div>
<div>+ BASIC_LKDTM=3DKPIDB KPIEB KPTEE KPBL</div>
<div>+ EXTRA_LKDTM=3D</div>
<div>KPIDE KPIDL KPIDP KPIDO</div>
<div>KPIEE KPIEL KPIEP KPIEO</div>
<div>KPTEB KPTEL KPTEP KPTEO</div>
<div>KPBB KPBE KPBP KPBO</div>
<div>KPMSB KPMSE KPMSL KPMSP KPMSO</div>
<div>KPTB KPTE KPTL KPTP KPTO</div>
<div>KPSB KPSE KPSL KPSP KPSO</div>
<div>KPIB KPIE KPIL KPIP KPIO</div>
<div><br>
</div>
<div>+ EXTRA_DUMP=3DKLEXT KLLBL KLUID KLRAW KNSCP KNNFS KDENB</div>
<div>+ EXT3_PART=3D</div>
<div>+ EXT3_LABEL=3D</div>
<div>+ EXT3_UID=3D</div>
<div>+ RAW_PART=3D</div>
<div>+ SCP_PATH=3D</div>
<div>+ SCP_PASS=3D</div>
<div>+ NFS_PATH=3D</div>
<div>+ [ -z 1 ]</div>
<div>+ [ -z 0 ]</div>
<div>+ [ -z /var/crash ]</div>
<div>+ cd lib</div>
<div>+ [ 1 -ge 1 ]</div>
<div>+ [ -z 0 ]</div>
<div>+ [ 0 -eq 0 ]</div>
<div>+ echo Setup test environment.</div>
<div>Setup test environment.</div>
<div>+ SetupCrontab</div>
<div>+ echo Setup crontab.</div>
<div>Setup crontab.</div>
<div>+ set +e</div>
<div>+ crontab -r</div>
<div>no crontab for root</div>
<div>+ set -e</div>
<div>+ pwd</div>
<div>+ date +%F-%T</div>
<div>+ cat</div>
<div>+ crontab kdump.cron</div>
<div>+ echo Enable cron daemon by default.</div>
<div>Enable cron daemon by default.</div>
<div>+ [ -f /etc/init.d/crond ]</div>
<div>+ cron=3Dcron</div>
<div>+ [ -x /sbin/chkconfig ]</div>
<div>+ [ -x /sbin/update-rc.d ]</div>
<div>+ ./setup.sh .././runkdump.conf</div>
<div>+ conf=3D.././runkdump.conf</div>
<div>+ uname -m</div>
<div>+ arch=3Dx86_64</div>
<div>+ uname -r</div>
<div>+ kver=3D5.3.0-28-generic</div>
<div>+ . .././runkdump.conf</div>
<div>+ ITERATION=3D1</div>
<div>+ CRASH=3D0</div>
<div>+ REBOOT=3D0</div>
<div>+ uname -r</div>
<div>+ VMLINUX=3D/usr/lib/debug/lib/modules/5.3.0-28-generic/vmlinux</div>
<div>+ COREDIR=3D/var/crash</div>
<div>+ FILTER=3D0</div>
<div>+ MAKE_OPTIONS=3D</div>
<div>+ LINK_DELAY=3D</div>
<div>+ CRASHER=3DACS ACP ACB ACE ACL</div>
<div>+ BASIC_LKDTM=3DKPIDB KPIEB KPTEE KPBL</div>
<div>+ EXTRA_LKDTM=3D</div>
<div>KPIDE KPIDL KPIDP KPIDO</div>
<div>KPIEE KPIEL KPIEP KPIEO</div>
<div>KPTEB KPTEL KPTEP KPTEO</div>
<div>KPBB KPBE KPBP KPBO</div>
<div>KPMSB KPMSE KPMSL KPMSP KPMSO</div>
<div>KPTB KPTE KPTL KPTP KPTO</div>
<div>KPSB KPSE KPSL KPSP KPSO</div>
<div>KPIB KPIE KPIL KPIP KPIO</div>
<div><br>
</div>
<div>+ EXTRA_DUMP=3DKLEXT KLLBL KLUID KLRAW KNSCP KNNFS KDENB</div>
<div>+ EXT3_PART=3D</div>
<div>+ EXT3_LABEL=3D</div>
<div>+ EXT3_UID=3D</div>
<div>+ RAW_PART=3D</div>
<div>+ SCP_PATH=3D</div>
<div>+ SCP_PASS=3D</div>
<div>+ NFS_PATH=3D</div>
<div>+ echo Verify Kernel version &gt;=3D 2.6.16.</div>
<div>Verify Kernel version &gt;=3D 2.6.16.</div>
<div>+ kx=3D5</div>
<div>+ tmp=3D3.0-28-generic</div>
<div>+ ky=3D3</div>
<div>+ tmp=3D0-28-generic</div>
<div>+ tmp=3D0-28-generic</div>
<div>+ kz=3D0</div>
<div>+ [ 5 -lt 2 ]</div>
<div>+ [ 5 -eq 2 ]</div>
<div>+ [ &nbsp;]</div>
<div>+ echo Verify user is root.</div>
<div>Verify user is root.</div>
<div>+ id -u</div>
<div>+ [ 0 !=3D 0 ]</div>
<div>+ echo Verify prerequisite.</div>
<div>Verify prerequisite.</div>
<div>+ [ ! -x /sbin/kexec ]</div>
<div>+ [ ! -d /lib/modules/5.3.0-28-generic/build ]</div>
<div>+ [ 0 ]</div>
<div>+ [ 0 -eq 1 ]</div>
<div>+ [ &nbsp;]</div>
<div>+ echo Compile Kernel modules.</div>
<div>Compile Kernel modules.</div>
<div>+ make clean</div>
<div>make[1]: Entering directory '/home/test/ltp/testcases/kdump/lib'</div>
<div>make -C crasher clean</div>
<div>make[2]: Entering directory '/home/test/ltp/testcases/kdump/lib/crashe=
r'</div>
<div>make -C /lib/modules/5.3.0-28-generic/build M=3D/home/test/ltp/testcas=
es/kdump/lib/crasher clean</div>
<div>make[3]: Entering directory '/usr/src/linux-headers-5.3.0-28-generic'<=
/div>
<div>make[3]: Leaving directory '/usr/src/linux-headers-5.3.0-28-generic'</=
div>
<div>rm -f Module.symvers</div>
<div>make[2]: Leaving directory '/home/test/ltp/testcases/kdump/lib/crasher=
'</div>
<div>make -C lkdtm clean</div>
<div>make[2]: Entering directory '/home/test/ltp/testcases/kdump/lib/lkdtm'=
</div>
<div>make -C /lib/modules/5.3.0-28-generic/build M=3D/home/test/ltp/testcas=
es/kdump/lib/lkdtm clean</div>
<div>make[3]: Entering directory '/usr/src/linux-headers-5.3.0-28-generic'<=
/div>
<div>make[3]: Leaving directory '/usr/src/linux-headers-5.3.0-28-generic'</=
div>
<div>rm -f Module.symvers</div>
<div>make[2]: Leaving directory '/home/test/ltp/testcases/kdump/lib/lkdtm'<=
/div>
<div>make[1]: Leaving directory '/home/test/ltp/testcases/kdump/lib'</div>
<div>+ make -C kprobes</div>
<div>+ make</div>
<div>make[1]: Entering directory '/home/test/ltp/testcases/kdump/lib'</div>
<div>make -C crasher</div>
<div>make[2]: Entering directory '/home/test/ltp/testcases/kdump/lib/crashe=
r'</div>
<div>make -C /lib/modules/5.3.0-28-generic/build M=3D/home/test/ltp/testcas=
es/kdump/lib/crasher modules</div>
<div>make[3]: Entering directory '/usr/src/linux-headers-5.3.0-28-generic'<=
/div>
<div>&nbsp; CC [M] &nbsp;/home/test/ltp/testcases/kdump/lib/crasher/crasher=
.o</div>
<div>&nbsp; Building modules, stage 2.</div>
<div>&nbsp; MODPOST 1 modules</div>
<div>&nbsp; CC &nbsp; &nbsp; &nbsp;/home/test/ltp/testcases/kdump/lib/crash=
er/crasher.mod.o</div>
<div>&nbsp; LD [M] &nbsp;/home/test/ltp/testcases/kdump/lib/crasher/crasher=
.ko</div>
<div>make[3]: Leaving directory '/usr/src/linux-headers-5.3.0-28-generic'</=
div>
<div>make[2]: Leaving directory '/home/test/ltp/testcases/kdump/lib/crasher=
'</div>
<div>make -C lkdtm</div>
<div>make[2]: Entering directory '/home/test/ltp/testcases/kdump/lib/lkdtm'=
</div>
<div>make -C /lib/modules/5.3.0-28-generic/build M=3D/home/test/ltp/testcas=
es/kdump/lib/lkdtm modules</div>
<div>make[3]: Entering directory '/usr/src/linux-headers-5.3.0-28-generic'<=
/div>
<div>&nbsp; CC [M] &nbsp;/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.o</=
div>
<div>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In function =91jp_do=
_irq=92:</div>
<div>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:139:2: error: implici=
t declaration of function =91jprobe_return=92; did you mean =91probe_irq_on=
=92? [-Werror=3Dimplicit-function-declaration]</div>
<div>&nbsp; jprobe_return();</div>
<div>&nbsp; ^~~~~~~~~~~~~</div>
<div>&nbsp; probe_irq_on</div>
<div><b>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In function =91lk=
dtm_lookup_name=92:</b></div>
<div><b>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:295:10: error: inv=
alid use of undefined type =91struct jprobe=92</b></div>
<div><b>&nbsp; &nbsp;*(lkdtm.kp.addr) =3D addr;</b></div>
<div><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^</b></div>
<div><b>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:296:8: error: inva=
lid use of undefined type =91struct jprobe=92</b></div>
<div><b>&nbsp; &nbsp;lkdtm.entry =3D JPROBE_ENTRY(entry);</b></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; ^</div>
<div>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:296:17: error: implic=
it declaration of function =91JPROBE_ENTRY=92; did you mean =91KPROBE_REENT=
ER=92? [-Werror=3Dimplicit-function-declaration]</div>
<div>&nbsp; &nbsp;lkdtm.entry =3D JPROBE_ENTRY(entry);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~=
~~~~</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;KPROBE_R=
EENTER</div>
<div><b>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In function =91lk=
dtm_module_init=92:</b></div>
<div><b>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:468:13: error: imp=
licit declaration of function =91register_jprobe=92; did you mean =91regist=
er_kprobe=92? [-Werror=3Dimplicit-function-declaration]</b></div>
<div><b>&nbsp; if ((ret =3D register_jprobe(&amp;lkdtm)) &lt; 0) {</b></div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~~~~~~~~</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <b>&nbsp;register_kprobe</b>=
</div>
<div><b>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In function =91lk=
dtm_module_exit=92:</b></div>
<div><b>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:480:2: error: impl=
icit declaration of function =91unregister_jprobe=92; did you mean =91unreg=
ister_kprobe=92? [-Werror=3Dimplicit-function-declaration]</b></div>
<div><b>&nbsp; unregister_jprobe(&amp;lkdtm);</b></div>
<div><b>&nbsp; ^~~~~~~~~~~~~~~~~</b></div>
<div><b>&nbsp; unregister_kprobe</b></div>
<div><b>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: At top level:</b>=
</div>
<div><b>/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:110:22: error: sto=
rage size of =91lkdtm=92 isn=92t known</b></div>
<div><b>&nbsp;static struct jprobe lkdtm;</b></div>
<div><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; ^~~~~</b></div>
<div><b>cc1: some warnings being treated as errors</b></div>
<div><b>scripts/Makefile.build:288: recipe for target '/home/test/ltp/testc=
ases/kdump/lib/lkdtm/lkdtm.o' failed</b></div>
<div><b>make[4]: *** [/home/test/ltp/testcases/kdump/lib/lkdtm/lkdtm.o] Err=
or 1</b></div>
<div><b>Makefile:1655: recipe for target '_module_/home/test/ltp/testcases/=
kdump/lib/lkdtm' failed</b></div>
<div><b>make[3]: *** [_module_/home/test/ltp/testcases/kdump/lib/lkdtm] Err=
or 2</b></div>
<div><b>make[3]: Leaving directory '/usr/src/linux-headers-5.3.0-28-generic=
'</b></div>
<div><b>Makefile:11: recipe for target 'default' failed</b></div>
<div><b>make[2]: *** [default] Error 2</b></div>
<div><b>make[2]: Leaving directory '/home/test/ltp/testcases/kdump/lib/lkdt=
m'</b></div>
<div><b>Makefile:2: recipe for target 'default' failed</b></div>
<div><b>make[1]: *** [default] Error 2</b></div>
<div><b>make[1]: Leaving directory '/home/test/ltp/testcases/kdump/lib'</b>=
</div>
<div><b>Makefile:2: recipe for target 'all' failed</b></div>
<div><b>make: *** [all] Error 2</b></div>
<div><b><br>
</b></div>
<div><br>
</div>
<div>Thanks<b><br>
</b></div>
<br>
</div>
</body>
</html>

--_000_BMXPR01MB2870FFDC3E54FA0F9350C5D6EE969BMXPR01MB2870INDP_--

--===============0492955134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0492955134==--
