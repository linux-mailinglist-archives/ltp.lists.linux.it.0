Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EA43BE521
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 11:07:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC7BA3C798B
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 11:07:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 602743C2B15
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 11:07:41 +0200 (CEST)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AF3F5600945
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 11:07:37 +0200 (CEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209087996"
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="209087996"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 02:07:29 -0700
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="486741150"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.11])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 02:07:25 -0700
Date: Wed, 7 Jul 2021 17:07:22 +0800
From: kernel test robot <rong.a.chen@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Message-ID: <20210707090722.GH2022171@shao2-debian>
References: <20210706085652.GF2022171@shao2-debian>
 <CAKfTPtBnEmMFwCWD3sGP=vrbG8tkLncKbjStYLN+od3z0K=RrA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKfTPtBnEmMFwCWD3sGP=vrbG8tkLncKbjStYLN+od3z0K=RrA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [sched/fair] 1c35b07e6d:
 RIP:native_queued_spin_lock_slowpath
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Odin Ugedal <odin@uged.al>,
 kbuild test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Aubrey Li <aubrey.li@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, ltp@lists.linux.it, Chen Yu <yu.c.chen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Jul 06, 2021 at 11:08:54AM +0200, Vincent Guittot wrote:
> Hi Rong
> 
> On Tue, 6 Jul 2021 at 10:56, kernel test robot <rong.a.chen@intel.com> wrote:
> >
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: 1c35b07e6d3986474e5635be566e7bc79d97c64d ("sched/fair: Ensure _sum and _avg values stay consistent")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> I don't think this commit is the real culprit as it mainly replaces a
> sub by a mul whereas the dmesg mentioned spinlock deadlock . Have you
> bisect the problem down to this commit or you faced the problem while
> testing latest master branch ?

Hi Vincent,

It's bisected by 0day-CI, I tried to run more times and found the issue is not
first introduced by this commit, but boot always failed with this commit.

adf3c31e18b765ea 1c35b07e6d3986474e5635be566
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          7:15         -47%            :12    last_state.booting
          2:15          67%          12:12    dmesg.Kernel_panic-not_syncing:Hard_LOCKUP                                                                                    
           :15           7%           1:12    dmesg.RIP:cpuidle_enter_state
          2:15          67%          12:12    dmesg.RIP:native_queued_spin_lock_slowpath                                                                                    
           :15           7%           1:12    dmesg.RIP:sd_init_command[sd_mod]
          1:15          -7%            :12    dmesg.RIP:update_blocked_averages
          1:15          -7%            :12    dmesg.WARNING:at_kernel/sched/fair.c:#update_blocked_averages                                                                 
          3:15          60%          12:12    dmesg.boot_failures

Best Regards,
Rong Chen

> 
> >
> >
> > in testcase: ltp
> > version: ltp-x86_64-14c1f76-1_20210703
> > with following parameters:
> >
> >         disk: 1HDD
> >         fs: ext4
> >         test: dio-01
> >         ucode: 0xe2
> >
> > test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
> > test-url: http://linux-test-project.github.io/
> >
> >
> > on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with 28G memory
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> >
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <rong.a.chen@intel.com>
> >
> >
> > [  160.446205]
> > [  160.451594] <<<test_output>>>
> > [  160.451595]
> > [  178.116525] ------------[ cut here ]------------
> > [  203.592757] NMI watchdog: Watchdog detected hard LOCKUP on cpu 3
> > [  203.592758] Modules linked in: dm_mod btrfs blake2b_generic xor zstd_compress raid6_pq libcrc32c ipmi_devintf ipmi_msghandler sd_mod t10_pi sg intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp i915 kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel mei_wdt intel_gtt drm_kms_helper ahci rapl syscopyarea libahci sysfillrect intel_cstate sysimgblt mei_me fb_sys_fops wmi_bmof drm intel_uncore libata mei joydev intel_pch_thermal wmi video intel_pmc_core acpi_pad ip_tables
> > [  203.592770] CPU: 3 PID: 3103 Comm: diotest6 Tainted: G          I       5.13.0-rc6-00076-g1c35b07e6d39 #1
> > [  203.592770] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.2.8 01/26/2016
> > [  203.592771] RIP: 0010:native_queued_spin_lock_slowpath (kbuild/src/consumer/kernel/locking/qspinlock.c:382 kbuild/src/consumer/kernel/locking/qspinlock.c:315)
> > [ 203.592771] Code: 6c f0 0f ba 2f 08 0f 92 c0 0f b6 c0 c1 e0 08 89 c2 8b 07 30 e4 09 d0 a9 00 01 ff ff 75 46 85 c0 74 0e 8b 07 84 c0 74 08 f3 90 <8b> 07 84 c0 75 f8 b8 01 00 00 00 66 89 07 c3 8b 37 b8 00 02 00 00
> > All code
> > ========
> >    0:   6c                      insb   (%dx),%es:(%rdi)
> >    1:   f0 0f ba 2f 08          lock btsl $0x8,(%rdi)
> >    6:   0f 92 c0                setb   %al
> >    9:   0f b6 c0                movzbl %al,%eax
> >    c:   c1 e0 08                shl    $0x8,%eax
> >    f:   89 c2                   mov    %eax,%edx
> >   11:   8b 07                   mov    (%rdi),%eax
> >   13:   30 e4                   xor    %ah,%ah
> >   15:   09 d0                   or     %edx,%eax
> >   17:   a9 00 01 ff ff          test   $0xffff0100,%eax
> >   1c:   75 46                   jne    0x64
> >   1e:   85 c0                   test   %eax,%eax
> >   20:   74 0e                   je     0x30
> >   22:   8b 07                   mov    (%rdi),%eax
> >   24:   84 c0                   test   %al,%al
> >   26:   74 08                   je     0x30
> >   28:   f3 90                   pause
> >   2a:*  8b 07                   mov    (%rdi),%eax              <-- trapping instruction
> >   2c:   84 c0                   test   %al,%al
> >   2e:   75 f8                   jne    0x28
> >   30:   b8 01 00 00 00          mov    $0x1,%eax
> >   35:   66 89 07                mov    %ax,(%rdi)
> >   38:   c3                      retq
> >   39:   8b 37                   mov    (%rdi),%esi
> >   3b:   b8 00 02 00 00          mov    $0x200,%eax
> >
> > Code starting with the faulting instruction
> > ===========================================
> >    0:   8b 07                   mov    (%rdi),%eax
> >    2:   84 c0                   test   %al,%al
> >    4:   75 f8                   jne    0xfffffffffffffffe
> >    6:   b8 01 00 00 00          mov    $0x1,%eax
> >    b:   66 89 07                mov    %ax,(%rdi)
> >    e:   c3                      retq
> >    f:   8b 37                   mov    (%rdi),%esi
> >   11:   b8 00 02 00 00          mov    $0x200,%eax
> > [  203.592772] RSP: 0018:ffffc90001f032d8 EFLAGS: 00000002
> > [  203.592773] RAX: 0000000000000101 RBX: ffff88810d4a0000 RCX: ffff888759cc0000
> > [  203.592773] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888759ceba80
> > [  203.592774] RBP: ffffc90001f032e8 R08: ffff888759ceb420 R09: ffff888759ceb420
> > [  203.592774] R10: ffff88810cc01500 R11: 0000000000000000 R12: ffff888759ceba80
> > [  203.592774] R13: 0000000000000000 R14: 0000000000000087 R15: ffff88810d4a0c8c
> > [  203.592775] FS:  00007fc252ae2740(0000) GS:ffff888759cc0000(0000) knlGS:0000000000000000
> > [  203.592775] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  203.592776] CR2: 00007fa0a4d577f8 CR3: 000000074d22a005 CR4: 00000000003706e0
> > [  203.592776] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [  203.592776] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [  203.592777] Call Trace:
> > [  203.592777] _raw_spin_lock (kbuild/src/consumer/arch/x86/include/asm/paravirt.h:585 kbuild/src/consumer/arch/x86/include/asm/qspinlock.h:51 kbuild/src/consumer/include/asm-generic/qspinlock.h:85 kbuild/src/consumer/include/linux/spinlock.h:183 kbuild/src/consumer/include/linux/spinlock_api_smp.h:143 kbuild/src/consumer/kernel/locking/spinlock.c:151)
> > [  203.592777] raw_spin_rq_lock_nested (kbuild/src/consumer/arch/x86/include/asm/preempt.h:85 kbuild/src/consumer/kernel/sched/core.c:462)
> > [  203.592778] try_to_wake_up (kbuild/src/consumer/kernel/sched/sched.h:1536 kbuild/src/consumer/kernel/sched/sched.h:1611 kbuild/src/consumer/kernel/sched/core.c:3555 kbuild/src/consumer/kernel/sched/core.c:3835)
> > [  203.592778] __queue_work (kbuild/src/consumer/arch/x86/include/asm/paravirt.h:590 kbuild/src/consumer/arch/x86/include/asm/qspinlock.h:56 kbuild/src/consumer/include/linux/spinlock.h:212 kbuild/src/consumer/include/linux/spinlock_api_smp.h:151 kbuild/src/consumer/kernel/workqueue.c:1501)
> > [  203.592778] queue_work_on (kbuild/src/consumer/kernel/workqueue.c:1526)
> >
> >
> > To reproduce:
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp install                job.yaml  # job file is attached in this email
> >         bin/lkp split-job --compatible job.yaml  # generate the yaml file for lkp run
> >         bin/lkp run                    generated-yaml-file
> >
> >
> >
> > ---
> > 0DAY/LKP+ Test Infrastructure                   Open Source Technology Center
> > https://lists.01.org/hyperkitty/list/lkp@lists.01.org       Intel Corporation
> >
> > Thanks,
> > Rong Chen
> >

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
