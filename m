Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E738262CDA
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 12:09:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5ED03C2C98
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 12:09:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 444FA3C26BC
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 12:09:06 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380099.outbound.protection.outlook.com [40.107.138.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EB503600A4C
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 12:09:04 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlzU+AmjGdq+0BBaEuzKO7vwEDx82i9M/SvFx7iGg1BSrg7xnytVbvZ2VOxxbBJn1kKx44e7DhGhpvkaYbOh4uIeMyheKVe4AAnMRdSUhYR0rmTV+JGH4cFKfzv4xlfR8JluuCOt7YdHu1oD49coPJfrQrrXhXPomdPyNtJBBedxu2S1WtJQ9H3SNPGeugxf6LMEWm+24XCxqfTny0wcj1P2UG6iTEqjK8nHrvPNR856T2CifZyqlViIqFVSFzHdD9WgwAKp6di5pOmRIdyKydozUWUmL30N4JXedo9EUxBg1qTjroWDdjfEME6JZBB5yKf2FBaLXKmmr9LSffenmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lNKPl1ej9Wm+/cCIEvtgLALAV4uxxpkS7w3aPz2Oog=;
 b=EQp3xbj6KPfdr39hJYholpzrCAsMHiRdZSO4wN7vtVda0pv/G0NW4/383SuOIZ3nnvgwfeM+Su2QPRrHnyk5/jTKnrFYLL/PXM2wHvKPlIdKh8KtiGV9PHKXswwfOzk1ztx1M1Mko5wClERjyp66CXL3GH5soBizXZ2Wzjaxpm+XORTOjz70ztSqryf/HCJOn9pSmLEWcaFS/v43MycNaMqJfwVmo9g3GcVW2xHsC3a2Qeu2lhUeTrxKF8DrqCRjfs0gzDQBaClNZMmMpgfhK+tXfbDZnTz08rvyLhvKCDd7QaCoJwlH3QzGaKmKdVKCeulYaRi+1pa1PgdQ/53K/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lNKPl1ej9Wm+/cCIEvtgLALAV4uxxpkS7w3aPz2Oog=;
 b=yhzbNoytFoBmSoKNfvb6lawEsNm3+liAW60b5SCZKYde8SKXDWpTk22I97Jb55+vyv1u4W0igOkd+xyYV7TuqUL8wNQTYyjmaI0OF9iX0ln5VCVYHR0AgjPCxR3GoAVIGDO20ZpUnSrDxyObvNoBHTX8w15Xq7rpWiJlao5Pp+I=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BM1PR01MB2436.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:52::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Wed, 9 Sep
 2020 10:09:01 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a5b2:8c66:c439:2d46]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a5b2:8c66:c439:2d46%5]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 10:09:01 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Thread-Topic: [LTP] Error with cpuset_inherit
Thread-Index: AQHWhoKZ2w8FT52Wy0GEKiPLdR/6Z6lf/02AgAAV4t4=
Date: Wed, 9 Sep 2020 10:09:01 +0000
Message-ID: <BMXPR01MB2344600330F2585F9F6609A6EE260@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB234415DBFA9A047126CABB85EE260@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>,
 <1ca0f38c-59b5-4e9d-5090-8af0ee8a2c98@cn.fujitsu.com>
In-Reply-To: <1ca0f38c-59b5-4e9d-5090-8af0ee8a2c98@cn.fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cn.fujitsu.com; dkim=none (message not signed)
 header.d=none;cn.fujitsu.com; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [49.35.34.237]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 903c521e-fc73-42ee-652c-08d854a86037
x-ms-traffictypediagnostic: BM1PR01MB2436:
x-microsoft-antispam-prvs: <BM1PR01MB2436529A72AD26D71F4641EDEE260@BM1PR01MB2436.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ra4mWxBHU6mgnm1z/WplrB31gDImksUS3q/ekCo6QqmES+SkS8jogibTuNyuuBIE1s0BeMmZUgwHbh0TdcfVhna+4p4mu1a5L/pSbNZqqq4+U7TrW7bcXYSoIoIRFnrIoV/sUJW9idiv9sqHtUIAG/Cqc0/dGrNAfisYFAle3hf/JrPgpe/2mWFrh0SfuLGXTzW1Lcr3PSjwjldlNxIZvBJckCeAqd3Tls9jDLL2YVxxB67v4wTfYcO2pwhF7Pr7APO9r7j7u8k5FXzaNSAT+Mx7xrL36EHEvPfCunjDwysSyPGLyx97FsIubYID7CJnPuLZDpG+G3VkYdiCJiURSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(39830400003)(396003)(376002)(366004)(346002)(136003)(5660300002)(66446008)(8936002)(19627405001)(66946007)(33656002)(71200400001)(186003)(9686003)(4326008)(76116006)(86362001)(7696005)(52536014)(26005)(66476007)(6916009)(64756008)(55016002)(66556008)(478600001)(2906002)(8676002)(19627235002)(53546011)(316002)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Fwe73KBU0biagAryD/2Zb7DajLGotEqQ0GJMNCjRXpFzTw27+S3BG76QefnXJlo56EgC07VxibbhGgY8r2DpXxAGOyzQv1jiwvxpTBlF+4mp3u8WRPXo8ML3XUD6ZNg9r/9cprS56BOYyOU6qVitUr5CGxWMxNQ2eBwIxkEHdK/lcLM8Nuoqn5OxZ1H+G2168DD/g/12MwHAk6K2tQ1DsklSifOqhk26vSyFtuL0WK90oF3rEo1Vk+KQvFWP5eGIgB7mOAcFa7YIpunsD8go9htJBcY2bFvYfkPVCbpZQv1D0NqsvEv4UYaTsOtNjdvw1eQGuCf0CdqZOJZsls3ZpvR/o0oUeqbdGf6nPT9hdPR0YysTCvsM5GundjZ4yOnkqg8t36FNfwndHPLspVaDPXTENOni18Ey9/zlJydL3chcthZwj79ez33v9+0Eq8zBqjKCIQOzR42jyCBz0y60Z4c3D0NoLWbnfI9zyDUrnPUEcQUgyx1HQGhv+xcZAM7vRYC+362JnLKI30KRBeKLzT3ILKT3G4YTdowTYufQpdUvltBpk8Nhc2Ps1Vbkhagub3apHf3UnhQfEmtZIRDcBPiZOLn+0eoO+re5hJcJj06nqktzQ23uhkmwz0yMPFPC+uSabuuYAuN5QqdO2C1pmg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 903c521e-fc73-42ee-652c-08d854a86037
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 10:09:01.7787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pW704JzNq7/OmRrsVa/vlNWYbEPiMQ2T6J3ykJVhI4MMT2ecrIrKEHYKZJX8thc28fpdo+U8KaIh4cCW7vgHHhUPxy2zWJHJMfjpQLYnjRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2436
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Error with cpuset_inherit
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
Content-Type: multipart/mixed; boundary="===============1525377192=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1525377192==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB2344600330F2585F9F6609A6EE260BMXPR01MB2344INDP_"

--_000_BMXPR01MB2344600330F2585F9F6609A6EE260BMXPR01MB2344INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Can you suggest what all configs are needed for this testcase??
________________________________
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Sent: Wednesday, September 9, 2020 2:19 PM
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>; ltp@lists.linux.it <=
ltp@lists.linux.it>
Subject: Re: [LTP] Error with cpuset_inherit

Hi Pankaj

:
> Hi,
> i am running cpuset_inherit from LTP version:20200515-267-g9677c5573 on
> custom kernel 5.5.6 but i am getting following failure with the
> mentioned testcase
>
> earlycon=3Dsbi earlycon=3Dsbi root=3D/dev/mmcblk0p3 rootwait console=3Dtt=
ySIF0
> console=3Dtty0
>
> Gnu C                  gcc (GCC) 8.3.0
> Clang
> Gnu make               4.2.1
> util-linux             2.34
> mount                  linux 2.34 (libmount 2.34.0: btrfs, namespaces,
> assert, debug)
> modutils               26
> e2fsprogs              1.45.4
> Linux C Library        > libc.2.30
> Dynamic linker (ldd)   2.30
> Linux C++ Library      6.0.25
> Procps                 3.3.15
> iproute2               iproute2-ss190924
> iputils                'V'
> Kbd                    2.2.0
> Sh-utils               8.31
> Modules Loaded         veth ofpart cmdlinepart spi_nor
>
> free reports:
>                total        used        free      shared  buff/cache
> available
> Mem:        8167360       63568     7098176       17980     1005616
> 7994892
> Swap:             0           0           0
>
> cpuinfo:
> Architecture:        riscv64
> Byte Order:          Little Endian
> CPU(s):              4
> On-line CPU(s) list: 0-3
> Thread(s) per core:  4
> Core(s) per socket:  1
> Socket(s):           1
> L1d cache:           32 KiB
> L1i cache:           32 KiB
> L2 cache:            2 MiB
>
> AppArmor disabled
>
> SELinux mode: unknown
> no big block device was specified on commandline.
> Tests which require a big block device are disabled.
> You can specify it with option -z
> COMMAND:    /opt/ltp/bin/ltp-pan   -e -S   -a 10318     -n 10318 -p -f
> /tmp/ltp-NOCHmuGYM1/alltests -l
> /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_36s.log  -C
> /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.failed -T
> /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.tconf
> INFO: Restricted to cpuset_inherit
> LOG File: /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_36s.log
> FAILED COMMAND File:
> /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.failed
> TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.tco=
nf
> Running tests.......
> <<<test_start>>>
> tag=3Dcpuset_inherit stime=3D1599563376
> cmdline=3D"cpuset_inherit_testset.sh"
> contacts=3D""
> analysis=3Dexit
> <<<test_output>>>
> cat: /sys/devices/system/node/has_normal_memory: No such file or director=
y
You should investigate why your system doesn't have this file because we
use this file value to compare in test case.

I guess you may miss some kernel config.


> cpuset_inherit 1 TPASS: cpus: Inherited information is right!
> cpuset_inherit 3 TPASS: cpus: Inherited information is right!
> cpuset_inherit 5 TPASS: cpus: Inherited information is right!
> cpuset_inherit 7 TPASS: cpus: Inherited information is right!
> cpuset_inherit 9 TPASS: cpus: Inherited information is right!
> cpuset_inherit 11 TPASS: cpus: Inherited information is right!
> cpuset_inherit 13 TPASS: mems: Inherited information is right!
> cpuset_inherit 15 TPASS: mems: Inherited information is right!
> cpuset_inherit 17 TPASS: mems: Inherited information is right!
> cpuset_inherit 19 TPASS: mems: Inherited information is right!
> cpuset_inherit 21 TPASS: mems: Inherited information is right!
> *cpuset_inherit 23 TFAIL: mems: Test result - 0 Expected string - ""*
> cpuset_inherit 25 TPASS: cpu_exclusive: Inherited information is right!
> cpuset_inherit 27 TPASS: cpu_exclusive: Inherited information is right!
> cpuset_inherit 29 TPASS: mem_exclusive: Inherited information is right!
> cpuset_inherit 31 TPASS: mem_exclusive: Inherited information is right!
> cpuset_inherit 33 TPASS: mem_hardwall: Inherited information is right!
> cpuset_inherit 35 TPASS: mem_hardwall: Inherited information is right!
> cpuset_inherit 37 TPASS: memory_migrate: Inherited information is right!
> cpuset_inherit 39 TPASS: memory_migrate: Inherited information is right!
> cpuset_inherit 41 TPASS: memory_spread_page: Inherited information is rig=
ht!
> cpuset_inherit 43 TPASS: memory_spread_page: Inherited information is rig=
ht!
> cpuset_inherit 45 TPASS: memory_spread_slab: Inherited information is rig=
ht!
> cpuset_inherit 47 TPASS: memory_spread_slab: Inherited information is rig=
ht!
> cpuset_inherit 49 TPASS: sched_load_balance: Inherited information is rig=
ht!
> cpuset_inherit 51 TPASS: sched_load_balance: Inherited information is rig=
ht!
> cpuset_inherit 53 TPASS: sched_relax_domain_level: Inherited information
> is right!
> cpuset_inherit 55 TPASS: sched_relax_domain_level: Inherited information
> is right!
> cpuset_inherit 57 TPASS: sched_relax_domain_level: Inherited information
> is right!
> cpuset_inherit 59 TPASS: sched_relax_domain_level: Inherited information
> is right!
> cpuset_inherit 61 TPASS: sched_relax_domain_level: Inherited information
> is right!
> cpuset_inherit 63 TPASS: sched_relax_domain_level: Inherited information
> is right!
> cpuset_inherit 65 TPASS: sched_relax_domain_level: Inherited information
> is right!
> incrementing stop
> <<<execution_status>>>
> initiation_status=3D"ok"
> duration=3D3 termination_type=3Dexited termination_id=3D1 corefile=3Dno
> cutime=3D131 cstime=3D194
> <<<test_end>>>
> INFO: ltp-pan reported some tests FAIL
> LTP Version: 20200515-267-g9677c5573
>
>         ###############################################################
>
>              Done executing testcases.
>              LTP Version:  20200515-267-g9677c5573
>         ###############################################################
>
> Can someone help me why this test is getting failed and how i can
> resolve it??
>
> Thanks!
>
>
>
>


[EXT]

--_000_BMXPR01MB2344600330F2585F9F6609A6EE260BMXPR01MB2344INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Can you suggest what all configs are needed for this testcase??</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yang Xu &lt;xuyang201=
8.jy@cn.fujitsu.com&gt;<br>
<b>Sent:</b> Wednesday, September 9, 2020 2:19 PM<br>
<b>To:</b> Pankaj Vinadrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;; ltp@lis=
ts.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] Error with cpuset_inherit</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Pankaj<br>
<br>
:<br>
&gt; Hi,<br>
&gt; i am running cpuset_inherit from LTP version:20200515-267-g9677c5573 o=
n<br>
&gt; custom kernel 5.5.6 but i am getting following failure with the<br>
&gt; mentioned testcase<br>
&gt;<br>
&gt; earlycon=3Dsbi earlycon=3Dsbi root=3D/dev/mmcblk0p3 rootwait console=
=3DttySIF0<br>
&gt; console=3Dtty0<br>
&gt;<br>
&gt; Gnu C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gcc (GCC) 8.3.0<br>
&gt; Clang<br>
&gt; Gnu make&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 4.2.1<br>
&gt; util-linux&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 2.34<br>
&gt; mount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux 2.34 (libmount 2.34.0: btrfs, n=
amespaces,<br>
&gt; assert, debug)<br>
&gt; modutils&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 26<br>
&gt; e2fsprogs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 1.45.4<br>
&gt; Linux C Library&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; libc.2.=
30<br>
&gt; Dynamic linker (ldd)&nbsp;&nbsp; 2.30<br>
&gt; Linux C++ Library&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.0.25<br>
&gt; Procps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.3.15<br>
&gt; iproute2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; iproute2-ss190924<br>
&gt; iputils&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 'V'<br>
&gt; Kbd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.2.0<br>
&gt; Sh-utils&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 8.31<br>
&gt; Modules Loaded&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; veth of=
part cmdlinepart spi_nor<br>
&gt;<br>
&gt; free reports:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; used&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
shared&nbsp; buff/cache<br>
&gt; available<br>
&gt; Mem:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8167360&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 63568&nbsp;&nbsp;&nbsp;&nbsp; 7098176&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 17980&nbsp;&nbsp;&nbsp;&nbsp; 1005616<br>
&gt; 7994892<br>
&gt; Swap:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&gt;<br>
&gt; cpuinfo:<br>
&gt; Architecture:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; riscv64<br>
&gt; Byte Order:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Litt=
le Endian<br>
&gt; CPU(s):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 4<br>
&gt; On-line CPU(s) list: 0-3<br>
&gt; Thread(s) per core:&nbsp; 4<br>
&gt; Core(s) per socket:&nbsp; 1<br>
&gt; Socket(s):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 1<br>
&gt; L1d cache:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 32 KiB<br>
&gt; L1i cache:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 32 KiB<br>
&gt; L2 cache:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 2 MiB<br>
&gt;<br>
&gt; AppArmor disabled<br>
&gt;<br>
&gt; SELinux mode: unknown<br>
&gt; no big block device was specified on commandline.<br>
&gt; Tests which require a big block device are disabled.<br>
&gt; You can specify it with option -z<br>
&gt; COMMAND:&nbsp;&nbsp;&nbsp; /opt/ltp/bin/ltp-pan&nbsp;&nbsp; -e -S&nbsp=
;&nbsp; -a 10318&nbsp;&nbsp;&nbsp;&nbsp; -n 10318 -p -f<br>
&gt; /tmp/ltp-NOCHmuGYM1/alltests -l<br>
&gt; /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_36s.log&nbsp; -C<br>
&gt; /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.failed -T<br>
&gt; /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.tconf<br>
&gt; INFO: Restricted to cpuset_inherit<br>
&gt; LOG File: /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_36s.log<br>
&gt; FAILED COMMAND File:<br>
&gt; /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.failed<br>
&gt; TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.=
tconf<br>
&gt; Running tests.......<br>
&gt; &lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
&gt; tag=3Dcpuset_inherit stime=3D1599563376<br>
&gt; cmdline=3D&quot;cpuset_inherit_testset.sh&quot;<br>
&gt; contacts=3D&quot;&quot;<br>
&gt; analysis=3Dexit<br>
&gt; &lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
&gt; cat: /sys/devices/system/node/has_normal_memory: No such file or direc=
tory<br>
You should investigate why your system doesn't have this file because we<br=
>
use this file value to compare in test case.<br>
<br>
I guess you may miss some kernel config.<br>
<br>
<br>
&gt; cpuset_inherit 1 TPASS: cpus: Inherited information is right!<br>
&gt; cpuset_inherit 3 TPASS: cpus: Inherited information is right!<br>
&gt; cpuset_inherit 5 TPASS: cpus: Inherited information is right!<br>
&gt; cpuset_inherit 7 TPASS: cpus: Inherited information is right!<br>
&gt; cpuset_inherit 9 TPASS: cpus: Inherited information is right!<br>
&gt; cpuset_inherit 11 TPASS: cpus: Inherited information is right!<br>
&gt; cpuset_inherit 13 TPASS: mems: Inherited information is right!<br>
&gt; cpuset_inherit 15 TPASS: mems: Inherited information is right!<br>
&gt; cpuset_inherit 17 TPASS: mems: Inherited information is right!<br>
&gt; cpuset_inherit 19 TPASS: mems: Inherited information is right!<br>
&gt; cpuset_inherit 21 TPASS: mems: Inherited information is right!<br>
&gt; *cpuset_inherit 23 TFAIL: mems: Test result - 0 Expected string - &quo=
t;&quot;*<br>
&gt; cpuset_inherit 25 TPASS: cpu_exclusive: Inherited information is right=
!<br>
&gt; cpuset_inherit 27 TPASS: cpu_exclusive: Inherited information is right=
!<br>
&gt; cpuset_inherit 29 TPASS: mem_exclusive: Inherited information is right=
!<br>
&gt; cpuset_inherit 31 TPASS: mem_exclusive: Inherited information is right=
!<br>
&gt; cpuset_inherit 33 TPASS: mem_hardwall: Inherited information is right!=
<br>
&gt; cpuset_inherit 35 TPASS: mem_hardwall: Inherited information is right!=
<br>
&gt; cpuset_inherit 37 TPASS: memory_migrate: Inherited information is righ=
t!<br>
&gt; cpuset_inherit 39 TPASS: memory_migrate: Inherited information is righ=
t!<br>
&gt; cpuset_inherit 41 TPASS: memory_spread_page: Inherited information is =
right!<br>
&gt; cpuset_inherit 43 TPASS: memory_spread_page: Inherited information is =
right!<br>
&gt; cpuset_inherit 45 TPASS: memory_spread_slab: Inherited information is =
right!<br>
&gt; cpuset_inherit 47 TPASS: memory_spread_slab: Inherited information is =
right!<br>
&gt; cpuset_inherit 49 TPASS: sched_load_balance: Inherited information is =
right!<br>
&gt; cpuset_inherit 51 TPASS: sched_load_balance: Inherited information is =
right!<br>
&gt; cpuset_inherit 53 TPASS: sched_relax_domain_level: Inherited informati=
on<br>
&gt; is right!<br>
&gt; cpuset_inherit 55 TPASS: sched_relax_domain_level: Inherited informati=
on<br>
&gt; is right!<br>
&gt; cpuset_inherit 57 TPASS: sched_relax_domain_level: Inherited informati=
on<br>
&gt; is right!<br>
&gt; cpuset_inherit 59 TPASS: sched_relax_domain_level: Inherited informati=
on<br>
&gt; is right!<br>
&gt; cpuset_inherit 61 TPASS: sched_relax_domain_level: Inherited informati=
on<br>
&gt; is right!<br>
&gt; cpuset_inherit 63 TPASS: sched_relax_domain_level: Inherited informati=
on<br>
&gt; is right!<br>
&gt; cpuset_inherit 65 TPASS: sched_relax_domain_level: Inherited informati=
on<br>
&gt; is right!<br>
&gt; incrementing stop<br>
&gt; &lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
&gt; initiation_status=3D&quot;ok&quot;<br>
&gt; duration=3D3 termination_type=3Dexited termination_id=3D1 corefile=3Dn=
o<br>
&gt; cutime=3D131 cstime=3D194<br>
&gt; &lt;&lt;&lt;test_end&gt;&gt;&gt;<br>
&gt; INFO: ltp-pan reported some tests FAIL<br>
&gt; LTP Version: 20200515-267-g9677c5573<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ######################=
#########################################<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; Done executing testcases.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; LTP Version:&nbsp; 20200515-267-g9677c5573<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ######################=
#########################################<br>
&gt;<br>
&gt; Can someone help me why this test is getting failed and how i can<br>
&gt; resolve it??<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
<br>
[EXT]<br>
</div>
</span></font></div>
</body>
</html>

--_000_BMXPR01MB2344600330F2585F9F6609A6EE260BMXPR01MB2344INDP_--

--===============1525377192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1525377192==--
