Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E599722941A
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 10:55:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B29ED3C2889
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 10:55:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 46B033C265E
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 10:55:33 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4248A1000AF2
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 10:55:32 +0200 (CEST)
Received: from mail-qv1-f44.google.com ([209.85.219.44]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N4yNG-1kwQAZ2RIi-010sgA for <ltp@lists.linux.it>; Wed, 22 Jul 2020
 10:55:31 +0200
Received: by mail-qv1-f44.google.com with SMTP id t11so702566qvk.1
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 01:55:31 -0700 (PDT)
X-Gm-Message-State: AOAM531tronL/LLcwJQaUTLe+9se63Wa4xg4StKeFjJkL5yI/k60KmfW
 fzSjjb8oiXJzqpHJ/XnLpWRHUpAO15BIVQxfaZ0=
X-Google-Smtp-Source: ABdhPJz2CG97fM8LdsudY8wGM5BPLCychAwsj3wuHCiRR3jjOOOqtO5R0Nb6oNtKoi0uAlHHaYCrqBDaqZZMZF06Gbo=
X-Received: by 2002:ad4:4c09:: with SMTP id bz9mr28822296qvb.210.1595408130368; 
 Wed, 22 Jul 2020 01:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuj3bHUMz8XQztbmTgF0c5+rZ5-FkUjFyvEftej2jLT+Q@mail.gmail.com>
In-Reply-To: <CA+G9fYuj3bHUMz8XQztbmTgF0c5+rZ5-FkUjFyvEftej2jLT+Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Jul 2020 10:55:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3br1bDc8C6UjRWzdmwzVV26YYe3ixHV7LH5Z0-OiqPQQ@mail.gmail.com>
Message-ID: <CAK8P3a3br1bDc8C6UjRWzdmwzVV26YYe3ixHV7LH5Z0-OiqPQQ@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Provags-ID: V03:K1:Q+hFdII0OhCcz3nci4LW5oUGG5WD4c4yBnC+Xxzx9cEETPNEknU
 jk8whEqOTvqdTFNfAMGhtLjBoK0hdgx5d7i+tk6UXKHvCnlbFZ4YRSdie8PiiJKfKCUeqVT
 vagNuqqoXCZiSPucCQAR5z6YCGm6goPchTZqMjws1aKkH+z3pNdCwoHS3fDoIvAEO2A32tJ
 jnrV7/94ud+0Xfq9oJ/jg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LtEQGe8PHSk=:Zl2mXWOKx+GS2FJXs6Ao4m
 ivDpScIbxyMlIbp4ui8mIKgfu7uZkT3dxgccdXdI8r5bjj4XLFJfKFIfdVLXx5L9t6dhyv7nQ
 tNexz6CDps37MIps00WRMnuxKOx42PkoG2QYT/eNNkitQnUBZ8OGMS7bVIFfXiL4EZtOldK4q
 2mBPVS8ppEmAVcIvTk2T1Vnrcw3PVP5+EsmQeZrWkGoZl8FnUJWmB0l3GDEICItDYfdkMWwzw
 ZYTWzQniYphUHuMSCn2CsXxy+VVvsU4+mXQTepPzyNvcxf/KRBF3we154zhhgKyQqCUQUCLSb
 iVcvG0U8LxmEC2tSLfuEBBYfTVp4KXqCBQvgrFft4VhnUF4lBnxI9omPVg57wAF9M9MmRHY/V
 ZPKSFxyqH8hTJdmZ+JD5YEITukWs1wDRdQZC0melCK5tNzbcU0pSXMa7jx+bpH19yupwLEaNf
 TqB77Zz8hV8fnJcGQQ0fyuBYlGKEyB0Irw/dAC3613U1J6SsdQD87rW3lYkIF6sOaqO44tHud
 HmOwXP4RWH6eD4U4DjZBH5++BvE+IpocvJmi8BcbSt/KCvkZkR10heNnu99D64AF+MoF13MTM
 RX7juVM+oi+MDMd57TWGqKEZPWd+lWdDn1hzeElU+Ah/uJm0HhXXmdkcqHOB273TqNIdunMvm
 01233RUWBazNuxpwrL05Ay3L/fb5VEdOgtuckvWasEwq6owpvV7IP8jdG7QHcYpdQgJaNRlvo
 tJq+V8Wyhu06/0+lqAcUm8dMe/kDztmUJ7bhlyp5WKdFA6Kfi5ZF5MRA391ZsbnuB7DX2dm6u
 K4VPVc64FIECB15qdmlvP02x8ASYr2CiOenWzAMlos+hgFaqVrktZGRznkgClPbQtmzlWyBOC
 jw8MHFrqSpwaT52zbNfArHZJOz6AUymyBl0h2eaHgU/rWtNAPJPol/182bXFTOGerb3G8bqVv
 AB+KxlwaWzYwBV08XsVr5Mq8ogEBfbFitCXPYRKDJ6PuRmEmn3t2d
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] BUG at mm/vmalloc.c:3089! - invalid opcode: 0000 [#1] SMP
 KASAN PTI
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Uladzislau Rezki \(Sony\)" <urezki@gmail.com>,
 Shakeel Butt <shakeelb@google.com>, David Hildenbrand <david@redhat.com>,
 Yafang Shao <laoar.shao@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Matthew Wilcox <willy@infradead.org>,
 Joerg Roedel <jroedel@suse.de>, Dennis Zhou <dennis@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, Cgroups <cgroups@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>,
 Roman Gushchin <guro@fb.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Adding Roman Gushchin to Cc, he touched that code recently.

Naresh, if nobody has any immediate ideas, you could double-check by
reverting these commits:

e0b8d00b7561 mm: memcg/percpu: per-memcg percpu memory statistics
99411af13595 mm/percpu: fix 'defined but not used' warning
9398ce6306b6 mm-memcg-percpu-account-percpu-memory-to-memory-cgroups-fix-fix
54116d471779 mm-memcg-percpu-account-percpu-memory-to-memory-cgroups-fix
ec518e090843 mm: memcg/percpu: account percpu memory to memory cgroups
9bc897d18dc3 percpu: return number of released bytes from pcpu_free_area()

       Arnd

On Wed, Jul 22, 2020 at 10:12 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Kernel BUG at mm/vmalloc.c:3089! on x86_64 Kasan configured kernel reported
> this while testing LTP cgroup_fj_stress_memory_4_4_none test cases.
>
> Also found on arm64 and i386 devices and qemu.
>
> metadata:
>   git branch: master
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git commit: de2e69cfe54a8f2ed4b75f09d3110c514f45d38e
>   git describe: next-20200721
>   make_kernelversion: 5.8.0-rc6
>   kernel-config:
> https://builds.tuxbuild.com/zU-I3LEfC1AaKQ59Er60ZQ/kernel.config
>
> crash log,
> [ 1421.080221] ------------[ cut here ]------------
> [ 1421.084874] kernel BUG at mm/vmalloc.c:3089!
> [ 1421.090356] invalid opcode: 0000 [#1] SMP KASAN PTI
> [ 1421.096009] CPU: 1 PID: 19100 Comm: kworker/1:1 Not tainted
> 5.8.0-rc6-next-20200721 #1
> [ 1421.103933] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> 2.0b 07/27/2017
> [ 1421.111418] Workqueue: events pcpu_balance_workfn
> [ 1421.116138] RIP: 0010:free_vm_area+0x2d/0x30
> [ 1421.120413] Code: e5 41 54 49 89 fc 48 83 c7 08 e8 9e 5e 04 00 49
> 8b 7c 24 08 e8 74 f8 ff ff 49 39 c4 75 0c 4c 89 e7 e8 97 d2 03 00 41
> 5c 5d c3 <0f> 0b 90 48 b8 00 00 00 00 00 fc ff df 55 48 89 e5 41 56 49
> 89 fe
> [ 1421.139154] RSP: 0018:ffff88840142fc80 EFLAGS: 00010282
> [ 1421.144381] RAX: 0000000000000000 RBX: ffff88841b843738 RCX: ffffffff86ca1d78
> [ 1421.151515] RDX: dffffc0000000000 RSI: 0000000000000004 RDI: ffff8883bfacd630
> [ 1421.158647] RBP: ffff88840142fc88 R08: 0000000000000001 R09: ffffed1080285f7e
> [ 1421.165780] R10: 0000000000000003 R11: ffffed1080285f7d R12: ffff888409e89880
> [ 1421.172913] R13: ffff88841b843730 R14: 0000000000000080 R15: 0000000000000080
> [ 1421.180045] FS:  0000000000000000(0000) GS:ffff88841fa80000(0000)
> knlGS:0000000000000000
> [ 1421.188132] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1421.193876] CR2: 00007f1230b41080 CR3: 000000025d40e002 CR4: 00000000003706e0
> [ 1421.201008] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 1421.208132] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [ 1421.215255] Call Trace:
> [ 1421.217703]  pcpu_free_vm_areas+0x30/0x44
> [ 1421.221714]  pcpu_balance_workfn+0x7bd/0x8f0
> [ 1421.225987]  ? pcpu_create_chunk+0x2f0/0x2f0
> [ 1421.230261]  ? read_word_at_a_time+0x12/0x20
> [ 1421.234531]  ? strscpy+0xc1/0x190
> [ 1421.237842]  process_one_work+0x474/0x7b0
> [ 1421.241856]  worker_thread+0x7b/0x6a0
> [ 1421.245521]  ? wake_up_process+0x10/0x20
> [ 1421.249448]  ? process_one_work+0x7b0/0x7b0
> [ 1421.253635]  kthread+0x1aa/0x200
> [ 1421.256867]  ? kthread_create_on_node+0xd0/0xd0
> [ 1421.261400]  ret_from_fork+0x22/0x30
> [ 1421.264978] Modules linked in: x86_pkg_temp_thermal
> [ 1421.269869] ---[ end trace 6352cf97284f07da ]---
> [ 1421.274955] RIP: 0010:free_vm_area+0x2d/0x30
> [ 1421.281026] Code: e5 41 54 49 89 fc 48 83 c7 08 e8 9e 5e 04 00 49
> 8b 7c 24 08 e8 74 f8 ff ff 49 39 c4 75 0c 4c 89 e7 e8 97 d2 03 00 41
> 5c 5d c3 <0f> 0b 90 48 b8 00 00 00 00 00 fc ff df 55 48 89 e5 41 56 49
> 89 fe
> [ 1421.300553] RSP: 0018:ffff88840142fc80 EFLAGS: 00010282
> [ 1421.307051] RAX: 0000000000000000 RBX: ffff88841b843738 RCX: ffffffff86ca1d78
> [ 1421.314184] RDX: dffffc0000000000 RSI: 0000000000000004 RDI: ffff8883bfacd630
> [ 1421.321317] RBP: ffff88840142fc88 R08: 0000000000000001 R09: ffffed1080285f7e
> [ 1421.328477] R10: 0000000000000003 R11: ffffed1080285f7d R12: ffff888409e89880
> [ 1421.335639] R13: ffff88841b843730 R14: 0000000000000080 R15: 0000000000000080
> [ 1421.342777] FS:  0000000000000000(0000) GS:ffff88841fa80000(0000)
> knlGS:0000000000000000
> [ 1421.350870] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1421.356643] CR2: 00007f1230b41080 CR3: 000000025d40e002 CR4: 00000000003706e0
> [ 1421.363811] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 1421.370951] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>
> Full test log,
> https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200721/testrun/2972982/suite/linux-log-parser/test/check-kernel-bug-1594684/log
>
> --
> Linaro LKFT
> https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
