Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47802263AA8
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 04:39:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1666D3C2CAD
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 04:39:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CAB423C21AE
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 04:39:44 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id CD4BB600A59
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 04:39:43 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,411,1592841600"; d="scan'208";a="99077412"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Sep 2020 10:39:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6D7A348990E7;
 Thu, 10 Sep 2020 10:39:40 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 10 Sep 2020 10:39:39 +0800
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
References: <BMXPR01MB234415DBFA9A047126CABB85EE260@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
 <1ca0f38c-59b5-4e9d-5090-8af0ee8a2c98@cn.fujitsu.com>
 <BMXPR01MB2344600330F2585F9F6609A6EE260@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <241fc12f-a7ad-7285-579d-07f2de4d7b73@cn.fujitsu.com>
Date: Thu, 10 Sep 2020 10:39:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BMXPR01MB2344600330F2585F9F6609A6EE260@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6D7A348990E7.ADDBF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-3.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Pankaj

grep it on kernel code as below:
[root@localhost linux]# grep -nsr has_normal_memory
drivers/base/node.c:971:        [N_NORMAL_MEMORY] =3D =

_NODE_ATTR(has_normal_memory, N_NORMAL_MEMORY),
Documentation/ABI/stable/sysfs-devices-node:13:What: =

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
> *To:* Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>; =

> ltp@lists.linux.it <ltp@lists.linux.it>
> *Subject:* Re: [LTP] Error with cpuset_inherit
> Hi Pankaj
> =

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
>> Gnu C=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gcc (GCC) 8.3.0
>> Clang
>> Gnu make=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4.2.1
>> util-linux=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2.34
>> mount=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 linux 2.34 (lib=
mount 2.34.0: btrfs, namespaces,
>> assert, debug)
>> modutils=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 26
>> e2fsprogs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1.45.4
>> Linux C Library=A0=A0=A0=A0=A0=A0=A0 > libc.2.30
>> Dynamic linker (ldd)=A0=A0 2.30
>> Linux C++ Library=A0=A0=A0=A0=A0 6.0.25
>> Procps=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3.3.15
>> iproute2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 iproute2-ss190924
>> iputils=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 'V'
>> Kbd=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2.2.0
>> Sh-utils=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8.31
>> Modules Loaded=A0=A0=A0=A0=A0=A0=A0=A0 veth ofpart cmdlinepart spi_nor
>>
>> free reports:
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 total=A0=A0=A0=A0=A0=A0=A0 =
used=A0=A0=A0=A0=A0=A0=A0 free=A0=A0=A0=A0=A0 shared=A0 buff/cache
>> available
>> Mem:=A0=A0=A0=A0=A0=A0=A0 8167360=A0=A0=A0=A0=A0=A0 63568=A0=A0=A0=A0 70=
98176=A0=A0=A0=A0=A0=A0 17980=A0=A0=A0=A0 1005616
>> 7994892
>> Swap:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0
>>
>> cpuinfo:
>> Architecture:=A0=A0=A0=A0=A0=A0=A0 riscv64
>> Byte Order:=A0=A0=A0=A0=A0=A0=A0=A0=A0 Little Endian
>> CPU(s):=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4
>> On-line CPU(s) list: 0-3
>> Thread(s) per core:=A0 4
>> Core(s) per socket:=A0 1
>> Socket(s):=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1
>> L1d cache:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 32 KiB
>> L1i cache:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 32 KiB
>> L2 cache:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2 MiB
>>
>> AppArmor disabled
>>
>> SELinux mode: unknown
>> no big block device was specified on commandline.
>> Tests which require a big block device are disabled.
>> You can specify it with option -z
>> COMMAND:=A0=A0=A0 /opt/ltp/bin/ltp-pan=A0=A0 -e -S=A0=A0 -a 10318=A0=A0=
=A0=A0 -n 10318 -p -f
>> /tmp/ltp-NOCHmuGYM1/alltests -l
>> /opt/ltp/results/LTP_RUN_ON-2020_09_08-11h_09m_36s.log=A0 -C
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
> =

> I guess you may miss some kernel config.
> =

> =

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
>>=A0=A0=A0=A0=A0=A0=A0=A0 ################################################=
###############
>>
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Done executing testcases.
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LTP Version:=A0 20200515-267-g967=
7c5573
>>=A0=A0=A0=A0=A0=A0=A0=A0 ################################################=
###############
>>
>> Can someone help me why this test is getting failed and how i can
>> resolve it??
>>
>> Thanks!
>>
>>
>>
>>
> =

> =

> [EXT]



-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
