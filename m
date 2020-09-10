Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 26123263CD2
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 07:55:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB6EA3C5274
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 07:55:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 20D9C3C2629
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 07:55:09 +0200 (CEST)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390131.outbound.protection.outlook.com [40.107.139.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8FAF0140074B
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 07:55:07 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMqnYW7p27dbq7dhJoR08ezHZOsVJDbaOt2Ue1nTRGCe79kYL5wsHyH+P0YK2FfoXt98HYdUSkJuxorkb5IQlbWzNhUKAiOYU7Uz4MK5DOvEdsQHV7OA94VdDwqxBTTnNJob6bTY9QOrAk6cmJbaqQ0VAwIFHRaMjf7PYZkw9i1MfhNVMYC5CCm/I3rXbMiipfg8LAxj8Ydl7GTQ7AeXf28xMp2F05TWZDtGhDlVOH0sBv/XqjavcbNewnSmCjFpPbTnffAkbIQELBHwhiR0iXCrXOvAVVDAgstltRdNSr4bEZmqvotZMg1IfS+kOYaVP8hHpQdSNgQsxzcUTP6cfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=macj5guyIOD/fh0XVAveuW5/2kuO3pk2qMb+VFVq2w0=;
 b=Qi91z4YEvJ7krx8LxNHFeXh9N9DIQ4AXohjQL1uXXdior9cOuPWnW4TYwPr3G+WxAfzIsZqT0iCjznOTEWuoh0D5rhCObt6nP4OZ4Rcen+Bnq/oHRMJSBvVTpGGo1PJiQuT4wvf4Lo1luPtHtEx80eERk+ZB8wuyfVMtiz5FfIsSAaxg6lQh1BvLWz96NyWKSv9m+ZopSSLhUQ+lQbcYPGPIy8jyUxP3t44n+muX8tLWzsSzYSjNVWmlC4pwNRswnm2Ad7mHfV+K+dnGLJGkQt6NBtsTOy7Rjfwy/wnmNvraTBHo0Kb5A5Y6D5KlyDf3Az1BQWzIKIYnKS2ikZRvDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=macj5guyIOD/fh0XVAveuW5/2kuO3pk2qMb+VFVq2w0=;
 b=VsI8a3XJTi5d0DDujZvOg0sULztHK6+H8P879Jk01kWWFQmYgn2xS2oTwkoqGm20ZCe2At5mkZTYomVWjnug7EPhMc9hxuDQeJxYRkkBbRSl1zb3bLDJI61lGeSMVftFjrCumktEhscmCa8P/wvnpXrb6m6TXo+5JXtXKFo6YCI=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BMXPR01MB3015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 10 Sep
 2020 05:55:05 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a5b2:8c66:c439:2d46]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a5b2:8c66:c439:2d46%5]) with mapi id 15.20.3348.019; Thu, 10 Sep 2020
 05:55:05 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Thread-Topic: [LTP] Error with cpuset_inherit
Thread-Index: AQHWhoKZ2w8FT52Wy0GEKiPLdR/6Z6lf/02AgAAV4t6AARUMAIAAL6Nk
Date: Thu, 10 Sep 2020 05:55:05 +0000
Message-ID: <BMXPR01MB2344CBD58CD8BDB60301BF47EE270@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB234415DBFA9A047126CABB85EE260@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
 <1ca0f38c-59b5-4e9d-5090-8af0ee8a2c98@cn.fujitsu.com>
 <BMXPR01MB2344600330F2585F9F6609A6EE260@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>,
 <241fc12f-a7ad-7285-579d-07f2de4d7b73@cn.fujitsu.com>
In-Reply-To: <241fc12f-a7ad-7285-579d-07f2de4d7b73@cn.fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cn.fujitsu.com; dkim=none (message not signed)
 header.d=none;cn.fujitsu.com; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [49.35.7.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ace0d4b-aa47-459e-d634-08d8554e10db
x-ms-traffictypediagnostic: BMXPR01MB3015:
x-microsoft-antispam-prvs: <BMXPR01MB30155EA2EE875F772B0A81B4EE270@BMXPR01MB3015.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:605;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yi1A62unWx8LaOMf78Jboe3HNOS+ZpqoA9Te5HR2cZ/c9JD1P99wzm9Wv/HXmbBWhBN5mHLkiot0BR0z1dbNdLn9fDQUAGzxv61QaU0Fl30M5QKn5ZtBxxNjldlBYb1NRWALruw5ZWGjy/2VaEm1+2lz/GAyamm03o90u8cNyWtk4H707+8VCczIJL2RBe36BWR/ixV8As8wi9j0gFPrQnsi4ZZwqIBJipAimF4EJMSLvcveyG8mhb16Ds6PZUHqcK7Pys4+5KN5iYSXKfo7JVjW2sHrF1+f6xAusDn9S7AJagstf3SP5SVPNLE3bV6K
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39830400003)(346002)(396003)(376002)(26005)(33656002)(52536014)(6916009)(76116006)(5660300002)(83380400001)(19627235002)(71200400001)(86362001)(2906002)(9686003)(55016002)(186003)(478600001)(66556008)(53546011)(64756008)(66476007)(6506007)(66946007)(19627405001)(66446008)(4326008)(316002)(8676002)(7696005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: SOsUY6OZaa9DZMha9GyQx/+1S1hMDu+vJ2LOvpZoXoekzap5NaV7TNaWuQ3mISUF40cZI4h/KfD6LFCqzmss01Y19Bb2UaxNYcq34gFeeRxo1G0Xa+pxfj7I0jxwXFlijG7cM/2x719KX+FYWc0BA1S2tdeiykpmyGaNFsbMWIHbFoQa2WpyS3DC7ZI97FKTvjf8BdzCHNM+GljHe4K2/jguqcAY/oPhSmoIyS/AWJ9bAF3M96Ki5Efm7OfHdWxybQwpeGViH8tJ2hpz3ZvbzBfzoOx7TZKxemWxREQQO9KTrpZrYVOVKJHPGsrut7hNMwtfv24E3lnrl8IIaCmXGg33tndBRGdwBf6nLPKH5lP8RtJ8WVfawzQvQwHserCwA09K8L0xvAHqWHI0ZzDQ1iaA6ZdpLJb3i21Swvq7XmNyV2dw0gIOmNHSEgo+Gul9is0zEhuJONG8+3vzgJgAvhb2SnkR0hIqE6G9VKysgX1O9IoVPAN2I2lQpkOFvz0CszhWzv8xb8EU9uD68c4FNxGOcsC34lK9MaC3ljdLxb3Y/L86rAB5nVC2TAQ19VlqA2E5qYLBHJn0jbmH8DQct7xP+FA8EjmwAruFQ2HYiCBRGgTjTMd2MI9FKQwMyWF3OnvNbHqXRtszYqAILtqs8A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ace0d4b-aa47-459e-d634-08d8554e10db
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 05:55:05.1128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8lygh9bIeNWl9hotIVtmKt6bL1SDusT9yLkTHN9Aec7iPn8O0mI0Gs2mR7oTWF6QtllUlhwLpCE6VdNlVSOl+jvgLpm9sDTm//je+rYBtV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3015
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1702056920=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1702056920==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB2344CBD58CD8BDB60301BF47EE270BMXPR01MB2344INDP_"

--_000_BMXPR01MB2344CBD58CD8BDB60301BF47EE270BMXPR01MB2344INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yang,
It seems NUMA is not supported on my arch.
I have other question, I saw LTP is getting maintained on Master branch onl=
y but i am able to see there are some tags i want to know on what basis the=
se tags are getting updated ??



Thanks!
________________________________
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Sent: Thursday, September 10, 2020 8:09 AM
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] Error with cpuset_inherit

Hi Pankaj

grep it on kernel code as below:
[root@localhost linux]# grep -nsr has_normal_memory
drivers/base/node.c:971:        [N_NORMAL_MEMORY] =3D
_NODE_ATTR(has_normal_memory, N_NORMAL_MEMORY),
Documentation/ABI/stable/sysfs-devices-node:13:What:
/sys/devices/system/node/has_normal_memory
[root@localhost linux]#

vim driver/base/Makefile
obj-$(CONFIG_NUMA)      +=3D node.o

I guess your kernel doesn't enable CONFIG_NUMA.

> Hi,
> Can you suggest what all configs are needed for this testcase??
> ------------------------------------------------------------------------
> *From:* Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> *Sent:* Wednesday, September 9, 2020 2:19 PM
> *To:* Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>;
> ltp@lists.linux.it <ltp@lists.linux.it>
> *Subject:* Re: [LTP] Error with cpuset_inherit
> Hi Pankaj
>
> :
>> Hi,
>> i am running cpuset_inherit from LTP version:20200515-267-g9677c5573 on
>> custom kernel 5.5.6 but i am getting following failure with the
>> mentioned testcase
>>
>> earlycon=3Dsbi earlycon=3Dsbi root=3D/dev/mmcblk0p3 rootwait console=3Dt=
tySIF0
>> console=3Dtty0
>>
>> Gnu C                  gcc (GCC) 8.3.0
>> Clang
>> Gnu make               4.2.1
>> util-linux             2.34
>> mount                  linux 2.34 (libmount 2.34.0: btrfs, namespaces,
>> assert, debug)
>> modutils               26
>> e2fsprogs              1.45.4
>> Linux C Library        > libc.2.30
>> Dynamic linker (ldd)   2.30
>> Linux C++ Library      6.0.25
>> Procps                 3.3.15
>> iproute2               iproute2-ss190924
>> iputils                'V'
>> Kbd                    2.2.0
>> Sh-utils               8.31
>> Modules Loaded         veth ofpart cmdlinepart spi_nor
>>
>> free reports:
>>                total        used        free      shared  buff/cache
>> available
>> Mem:        8167360       63568     7098176       17980     1005616
>> 7994892
>> Swap:             0           0           0
>>
>> cpuinfo:
>> Architecture:        riscv64
>> Byte Order:          Little Endian
>> CPU(s):              4
>> On-line CPU(s) list: 0-3
>> Thread(s) per core:  4
>> Core(s) per socket:  1
>> Socket(s):           1
>> L1d cache:           32 KiB
>> L1i cache:           32 KiB
>> L2 cache:            2 MiB
>>
>> AppArmor disabled
>>
>> SELinux mode: unknown
>> no big block device was specified on commandline.
>> Tests which require a big block device are disabled.
>> You can specify it with option -z
>> COMMAND:    /opt/ltp/bin/ltp-pan   -e -S   -a 10318     -n 10318 -p -f
>> /tmp/ltp-NOCHmuGYM1/alltests -l
>> /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_36s.log  -C
>> /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.failed -T
>> /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.tconf
>> INFO: Restricted to cpuset_inherit
>> LOG File: /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_36s.log
>> FAILED COMMAND File:
>> /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.failed
>> TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.tc=
onf
>> Running tests.......
>> <<<test_start>>>
>> tag=3Dcpuset_inherit stime=3D1599563376
>> cmdline=3D"cpuset_inherit_testset.sh"
>> contacts=3D""
>> analysis=3Dexit
>> <<<test_output>>>
>> cat: /sys/devices/system/node/has_normal_memory: No such file or directo=
ry
> You should investigate why your system doesn't have this file because we
> use this file value to compare in test case.
>
> I guess you may miss some kernel config.
>
>
>> cpuset_inherit 1 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 3 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 5 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 7 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 9 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 11 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 13 TPASS: mems: Inherited information is right!
>> cpuset_inherit 15 TPASS: mems: Inherited information is right!
>> cpuset_inherit 17 TPASS: mems: Inherited information is right!
>> cpuset_inherit 19 TPASS: mems: Inherited information is right!
>> cpuset_inherit 21 TPASS: mems: Inherited information is right!
>> *cpuset_inherit 23 TFAIL: mems: Test result - 0 Expected string - ""*
>> cpuset_inherit 25 TPASS: cpu_exclusive: Inherited information is right!
>> cpuset_inherit 27 TPASS: cpu_exclusive: Inherited information is right!
>> cpuset_inherit 29 TPASS: mem_exclusive: Inherited information is right!
>> cpuset_inherit 31 TPASS: mem_exclusive: Inherited information is right!
>> cpuset_inherit 33 TPASS: mem_hardwall: Inherited information is right!
>> cpuset_inherit 35 TPASS: mem_hardwall: Inherited information is right!
>> cpuset_inherit 37 TPASS: memory_migrate: Inherited information is right!
>> cpuset_inherit 39 TPASS: memory_migrate: Inherited information is right!
>> cpuset_inherit 41 TPASS: memory_spread_page: Inherited information is ri=
ght!
>> cpuset_inherit 43 TPASS: memory_spread_page: Inherited information is ri=
ght!
>> cpuset_inherit 45 TPASS: memory_spread_slab: Inherited information is ri=
ght!
>> cpuset_inherit 47 TPASS: memory_spread_slab: Inherited information is ri=
ght!
>> cpuset_inherit 49 TPASS: sched_load_balance: Inherited information is ri=
ght!
>> cpuset_inherit 51 TPASS: sched_load_balance: Inherited information is ri=
ght!
>> cpuset_inherit 53 TPASS: sched_relax_domain_level: Inherited information
>> is right!
>> cpuset_inherit 55 TPASS: sched_relax_domain_level: Inherited information
>> is right!
>> cpuset_inherit 57 TPASS: sched_relax_domain_level: Inherited information
>> is right!
>> cpuset_inherit 59 TPASS: sched_relax_domain_level: Inherited information
>> is right!
>> cpuset_inherit 61 TPASS: sched_relax_domain_level: Inherited information
>> is right!
>> cpuset_inherit 63 TPASS: sched_relax_domain_level: Inherited information
>> is right!
>> cpuset_inherit 65 TPASS: sched_relax_domain_level: Inherited information
>> is right!
>> incrementing stop
>> <<<execution_status>>>
>> initiation_status=3D"ok"
>> duration=3D3 termination_type=3Dexited termination_id=3D1 corefile=3Dno
>> cutime=3D131 cstime=3D194
>> <<<test_end>>>
>> INFO: ltp-pan reported some tests FAIL
>> LTP Version: 20200515-267-g9677c5573
>>
>>         ###############################################################
>>
>>              Done executing testcases.
>>              LTP Version:  20200515-267-g9677c5573
>>         ###############################################################
>>
>> Can someone help me why this test is getting failed and how i can
>> resolve it??
>>
>> Thanks!
>>
>>
>>
>>
>
>
> [EXT]


[EXT]

--_000_BMXPR01MB2344CBD58CD8BDB60301BF47EE270BMXPR01MB2344INDP_
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
Hi Yang,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
It seems NUMA is not supported on my arch.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have other question, I saw LTP is getting maintained on Master branch onl=
y but i am able to see there are some tags i want to know on what basis the=
se tags are getting updated ??&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yang Xu &lt;xuyang201=
8.jy@cn.fujitsu.com&gt;<br>
<b>Sent:</b> Thursday, September 10, 2020 8:09 AM<br>
<b>To:</b> Pankaj Vinadrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] Error with cpuset_inherit</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Pankaj<br>
<br>
grep it on kernel code as below:<br>
[root@localhost linux]# grep -nsr has_normal_memory<br>
drivers/base/node.c:971:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [N_NORMA=
L_MEMORY] =3D<br>
_NODE_ATTR(has_normal_memory, N_NORMAL_MEMORY),<br>
Documentation/ABI/stable/sysfs-devices-node:13:What:<br>
/sys/devices/system/node/has_normal_memory<br>
[root@localhost linux]#<br>
<br>
vim driver/base/Makefile<br>
obj-$(CONFIG_NUMA)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D node.o<br>
<br>
I guess your kernel doesn't enable CONFIG_NUMA.<br>
<br>
&gt; Hi,<br>
&gt; Can you suggest what all configs are needed for this testcase??<br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt; *From:* Yang Xu &lt;xuyang2018.jy@cn.fujitsu.com&gt;<br>
&gt; *Sent:* Wednesday, September 9, 2020 2:19 PM<br>
&gt; *To:* Pankaj Vinadrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;;<br>
&gt; ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
&gt; *Subject:* Re: [LTP] Error with cpuset_inherit<br>
&gt; Hi Pankaj<br>
&gt;<br>
&gt; :<br>
&gt;&gt; Hi,<br>
&gt;&gt; i am running cpuset_inherit from LTP version:20200515-267-g9677c55=
73 on<br>
&gt;&gt; custom kernel 5.5.6 but i am getting following failure with the<br=
>
&gt;&gt; mentioned testcase<br>
&gt;&gt;<br>
&gt;&gt; earlycon=3Dsbi earlycon=3Dsbi root=3D/dev/mmcblk0p3 rootwait conso=
le=3DttySIF0<br>
&gt;&gt; console=3Dtty0<br>
&gt;&gt;<br>
&gt;&gt; Gnu C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gcc (GCC) 8.3.0<br>
&gt;&gt; Clang<br>
&gt;&gt; Gnu make&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 4.2.1<br>
&gt;&gt; util-linux&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; 2.34<br>
&gt;&gt; mount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux 2.34 (libmount 2.34.0: btrf=
s, namespaces,<br>
&gt;&gt; assert, debug)<br>
&gt;&gt; modutils&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 26<br>
&gt;&gt; e2fsprogs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 1.45.4<br>
&gt;&gt; Linux C Library&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; lib=
c.2.30<br>
&gt;&gt; Dynamic linker (ldd)&nbsp;&nbsp; 2.30<br>
&gt;&gt; Linux C++ Library&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.0.25<br>
&gt;&gt; Procps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.3.15<br>
&gt;&gt; iproute2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; iproute2-ss190924<br>
&gt;&gt; iputils&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'V'<br>
&gt;&gt; Kbd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.2.0<br>
&gt;&gt; Sh-utils&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 8.31<br>
&gt;&gt; Modules Loaded&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vet=
h ofpart cmdlinepart spi_nor<br>
&gt;&gt;<br>
&gt;&gt; free reports:<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use=
d&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; shared&nbsp; buff/cache<br>
&gt;&gt; available<br>
&gt;&gt; Mem:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8167360&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 63568&nbsp;&nbsp;&nbsp;&nbsp; 7098176&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 17980&nbsp;&nbsp;&nbsp;&nbsp; 1005616<br>
&gt;&gt; 7994892<br>
&gt;&gt; Swap:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&gt;&gt;<br>
&gt;&gt; cpuinfo:<br>
&gt;&gt; Architecture:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; riscv64<br=
>
&gt;&gt; Byte Order:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Little Endian<br>
&gt;&gt; CPU(s):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 4<br>
&gt;&gt; On-line CPU(s) list: 0-3<br>
&gt;&gt; Thread(s) per core:&nbsp; 4<br>
&gt;&gt; Core(s) per socket:&nbsp; 1<br>
&gt;&gt; Socket(s):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 1<br>
&gt;&gt; L1d cache:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 32 KiB<br>
&gt;&gt; L1i cache:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 32 KiB<br>
&gt;&gt; L2 cache:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 2 MiB<br>
&gt;&gt;<br>
&gt;&gt; AppArmor disabled<br>
&gt;&gt;<br>
&gt;&gt; SELinux mode: unknown<br>
&gt;&gt; no big block device was specified on commandline.<br>
&gt;&gt; Tests which require a big block device are disabled.<br>
&gt;&gt; You can specify it with option -z<br>
&gt;&gt; COMMAND:&nbsp;&nbsp;&nbsp; /opt/ltp/bin/ltp-pan&nbsp;&nbsp; -e -S&=
nbsp;&nbsp; -a 10318&nbsp;&nbsp;&nbsp;&nbsp; -n 10318 -p -f<br>
&gt;&gt; /tmp/ltp-NOCHmuGYM1/alltests -l<br>
&gt;&gt; /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_36s.log&nbsp; -C<br=
>
&gt;&gt; /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.failed -T<br>
&gt;&gt; /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.tconf<br>
&gt;&gt; INFO: Restricted to cpuset_inherit<br>
&gt;&gt; LOG File: /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_36s.log<b=
r>
&gt;&gt; FAILED COMMAND File:<br>
&gt;&gt; /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_36s.failed<br>
&gt;&gt; TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-2020_09_08-11h_09m_=
36s.tconf<br>
&gt;&gt; Running tests.......<br>
&gt;&gt; &lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
&gt;&gt; tag=3Dcpuset_inherit stime=3D1599563376<br>
&gt;&gt; cmdline=3D&quot;cpuset_inherit_testset.sh&quot;<br>
&gt;&gt; contacts=3D&quot;&quot;<br>
&gt;&gt; analysis=3Dexit<br>
&gt;&gt; &lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
&gt;&gt; cat: /sys/devices/system/node/has_normal_memory: No such file or d=
irectory<br>
&gt; You should investigate why your system doesn't have this file because =
we<br>
&gt; use this file value to compare in test case.<br>
&gt;<br>
&gt; I guess you may miss some kernel config.<br>
&gt;<br>
&gt;<br>
&gt;&gt; cpuset_inherit 1 TPASS: cpus: Inherited information is right!<br>
&gt;&gt; cpuset_inherit 3 TPASS: cpus: Inherited information is right!<br>
&gt;&gt; cpuset_inherit 5 TPASS: cpus: Inherited information is right!<br>
&gt;&gt; cpuset_inherit 7 TPASS: cpus: Inherited information is right!<br>
&gt;&gt; cpuset_inherit 9 TPASS: cpus: Inherited information is right!<br>
&gt;&gt; cpuset_inherit 11 TPASS: cpus: Inherited information is right!<br>
&gt;&gt; cpuset_inherit 13 TPASS: mems: Inherited information is right!<br>
&gt;&gt; cpuset_inherit 15 TPASS: mems: Inherited information is right!<br>
&gt;&gt; cpuset_inherit 17 TPASS: mems: Inherited information is right!<br>
&gt;&gt; cpuset_inherit 19 TPASS: mems: Inherited information is right!<br>
&gt;&gt; cpuset_inherit 21 TPASS: mems: Inherited information is right!<br>
&gt;&gt; *cpuset_inherit 23 TFAIL: mems: Test result - 0 Expected string - =
&quot;&quot;*<br>
&gt;&gt; cpuset_inherit 25 TPASS: cpu_exclusive: Inherited information is r=
ight!<br>
&gt;&gt; cpuset_inherit 27 TPASS: cpu_exclusive: Inherited information is r=
ight!<br>
&gt;&gt; cpuset_inherit 29 TPASS: mem_exclusive: Inherited information is r=
ight!<br>
&gt;&gt; cpuset_inherit 31 TPASS: mem_exclusive: Inherited information is r=
ight!<br>
&gt;&gt; cpuset_inherit 33 TPASS: mem_hardwall: Inherited information is ri=
ght!<br>
&gt;&gt; cpuset_inherit 35 TPASS: mem_hardwall: Inherited information is ri=
ght!<br>
&gt;&gt; cpuset_inherit 37 TPASS: memory_migrate: Inherited information is =
right!<br>
&gt;&gt; cpuset_inherit 39 TPASS: memory_migrate: Inherited information is =
right!<br>
&gt;&gt; cpuset_inherit 41 TPASS: memory_spread_page: Inherited information=
 is right!<br>
&gt;&gt; cpuset_inherit 43 TPASS: memory_spread_page: Inherited information=
 is right!<br>
&gt;&gt; cpuset_inherit 45 TPASS: memory_spread_slab: Inherited information=
 is right!<br>
&gt;&gt; cpuset_inherit 47 TPASS: memory_spread_slab: Inherited information=
 is right!<br>
&gt;&gt; cpuset_inherit 49 TPASS: sched_load_balance: Inherited information=
 is right!<br>
&gt;&gt; cpuset_inherit 51 TPASS: sched_load_balance: Inherited information=
 is right!<br>
&gt;&gt; cpuset_inherit 53 TPASS: sched_relax_domain_level: Inherited infor=
mation<br>
&gt;&gt; is right!<br>
&gt;&gt; cpuset_inherit 55 TPASS: sched_relax_domain_level: Inherited infor=
mation<br>
&gt;&gt; is right!<br>
&gt;&gt; cpuset_inherit 57 TPASS: sched_relax_domain_level: Inherited infor=
mation<br>
&gt;&gt; is right!<br>
&gt;&gt; cpuset_inherit 59 TPASS: sched_relax_domain_level: Inherited infor=
mation<br>
&gt;&gt; is right!<br>
&gt;&gt; cpuset_inherit 61 TPASS: sched_relax_domain_level: Inherited infor=
mation<br>
&gt;&gt; is right!<br>
&gt;&gt; cpuset_inherit 63 TPASS: sched_relax_domain_level: Inherited infor=
mation<br>
&gt;&gt; is right!<br>
&gt;&gt; cpuset_inherit 65 TPASS: sched_relax_domain_level: Inherited infor=
mation<br>
&gt;&gt; is right!<br>
&gt;&gt; incrementing stop<br>
&gt;&gt; &lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
&gt;&gt; initiation_status=3D&quot;ok&quot;<br>
&gt;&gt; duration=3D3 termination_type=3Dexited termination_id=3D1 corefile=
=3Dno<br>
&gt;&gt; cutime=3D131 cstime=3D194<br>
&gt;&gt; &lt;&lt;&lt;test_end&gt;&gt;&gt;<br>
&gt;&gt; INFO: ltp-pan reported some tests FAIL<br>
&gt;&gt; LTP Version: 20200515-267-g9677c5573<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ##################=
#############################################<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; Done executing testcases.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; LTP Version:&nbsp; 20200515-267-g9677c5573<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ##################=
#############################################<br>
&gt;&gt;<br>
&gt;&gt; Can someone help me why this test is getting failed and how i can<=
br>
&gt;&gt; resolve it??<br>
&gt;&gt;<br>
&gt;&gt; Thanks!<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; [EXT]<br>
<br>
<br>
[EXT]<br>
</div>
</span></font></div>
</body>
</html>

--_000_BMXPR01MB2344CBD58CD8BDB60301BF47EE270BMXPR01MB2344INDP_--

--===============1702056920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1702056920==--
