Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63F7AAD52
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Sep 2023 11:01:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 227863CA3A6
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Sep 2023 11:01:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF9F33C9BF5
 for <ltp@lists.linux.it>; Wed, 20 Sep 2023 16:32:56 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 88812601490
 for <ltp@lists.linux.it>; Wed, 20 Sep 2023 16:32:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D61631FB;
 Wed, 20 Sep 2023 07:33:28 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.27.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89A723F5A1;
 Wed, 20 Sep 2023 07:32:49 -0700 (PDT)
Date: Wed, 20 Sep 2023 15:32:47 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <ZQsCj997AW8Tz27W@FVFF77S0Q05N.cambridge.arm.com>
References: <CA+G9fYtqLarsezP_-6iQqonh8M4Q6McUCEBM9gFv+GU-zZRHAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYtqLarsezP_-6iQqonh8M4Q6McUCEBM9gFv+GU-zZRHAQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 22 Sep 2023 11:01:30 +0200
Subject: Re: [LTP] arm64: Unable to handle kernel execute from
 non-executable memory at virtual address ffff8000834c13a0
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Ard Biesheuvel <ardb@kernel.org>, rcu <rcu@vger.kernel.org>,
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>,
 LTP List <ltp@lists.linux.it>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Naresh,

On Wed, Sep 20, 2023 at 11:29:12AM +0200, Naresh Kamboju wrote:
> [ my two cents ]
> While running LTP pty07 test cases on arm64 juno-r2 with Linux next-20230919
> the following kernel crash was noticed.
> 
> I have been noticing this issue intermittently on Juno-r2 for more than a month.
> Anyone have noticed this crash ?

How intermittent is this? 1/2, 1/10, 1/100, rarer still?

Are you running *just* the pty07 test, or are you running a whole LTP suite and
the issue first occurs around pty07?

Given you've been hitting this for a month, have you tried testing mainline? Do
you have a known-good kernel that we can start a bisect from?

Do you *only* see this on Juno-r2 and are you testing on other hardware?

> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> [    0.000000] Linux version 6.6.0-rc2-next-20230919 (tuxmake@tuxmake)
> (aarch64-linux-gnu-gcc (Debian 13.2.0-2) 13.2.0, GNU ld (GNU Binutils
> for Debian) 2.41) #1 SMP PREEMPT @1695107157
> [    0.000000] KASLR disabled due to lack of seed
> [    0.000000] Machine model: ARM Juno development board (r2)
> ...
> LTP running pty
> ...
> 
> pty07.c:92: TINFO: Saving active console 1
> ../../../include/tst_fuzzy_sync.h:640: TINFO: Stopped sampling at 552
> (out of 1024) samples, sampling time reached 50% of the total time
> limit
> ../../../include/tst_fuzzy_sync.h:307: TINFO: loop = 552, delay_bias = 0
> ../../../include/tst_fuzzy_sync.h:295: TINFO: start_a - start_b: { avg
> =   127ns, avg_dev =    84ns, dev_ratio = 0.66 }
> ../../../include/tst_fuzzy_sync.h:295: TINFO: end_a - start_a  : { avg
> = 17296156ns, avg_dev = 5155058ns, dev_ratio = 0.30 }
> ../../../include/tst_fuzzy_sync.h:295: TINFO: end_b - start_b  : { avg
> = 101202336ns, avg_dev = 6689286ns, dev_ratio = 0.07 }
> ../../../include/tst_fuzzy_sync.h:295: TINFO: end_a - end_b    : { avg
> = -83906064ns, avg_dev = 10230694ns, dev_ratio = 0.12 }
> ../../../include/tst_fuzzy_sync.h:295: TINFO: spins            : { avg
> = 2765565  , avg_dev = 339285  , dev_ratio = 0.12 }
> [  384.133538] Unable to handle kernel execute from non-executable
> memory at virtual address ffff8000834c13a0
> [  384.133559] Mem abort info:
> [  384.133568]   ESR = 0x000000008600000f
> [  384.133578]   EC = 0x21: IABT (current EL), IL = 32 bits
> [  384.133590]   SET = 0, FnV = 0
> [  384.133600]   EA = 0, S1PTW = 0
> [  384.133610]   FSC = 0x0f: level 3 permission fault
> [  384.133621] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000082375000
> [  384.133634] [ffff8000834c13a0] pgd=10000009fffff003,
> p4d=10000009fffff003, pud=10000009ffffe003, pmd=10000009ffff8003,
> pte=00780000836c1703
> [  384.133697] Internal error: Oops: 000000008600000f [#1] PREEMPT SMP
> [  384.133707] Modules linked in: tda998x onboard_usb_hub cec hdlcd
> crct10dif_ce drm_dma_helper drm_kms_helper fuse drm backlight dm_mod
> ip_tables x_tables
> [  384.133767] CPU: 3 PID: 589 Comm: (udev-worker) Not tainted
> 6.6.0-rc2-next-20230919 #1
> [  384.133779] Hardware name: ARM Juno development board (r2) (DT)
> [  384.133784] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  384.133796] pc : in_lookup_hashtable+0x178/0x2000

This indicates that the faulting address ffff8000834c13a0 is
in_lookup_hashtable+0x178/0x2000, which would been we've somehow marked the
kernel text as non-executable, which we never do intentionally.

I suspect that implies memory corruption. Have you tried running this with
KASAN enabled?

> [  384.133818] lr : rcu_core (arch/arm64/include/asm/preempt.h:13
> (discriminator 1) kernel/rcu/tree.c:2146 (discriminator 1)
> kernel/rcu/tree.c:2403 (discriminator 1))
> [  384.133832] sp : ffff800083533e60
> [  384.133836] x29: ffff800083533e60 x28: ffff0008008a6180 x27: 000000000000000a
> [  384.133854] x26: 0000000000000000 x25: 0000000000000000 x24: ffff800083533f10
> [  384.133871] x23: ffff800082404008 x22: ffff800082ebea80 x21: ffff800082f55940
> [  384.133889] x20: ffff00097ed75440 x19: 0000000000000001 x18: 0000000000000000
> [  384.133905] x17: ffff8008fc95c000 x16: ffff800083530000 x15: 00003d0900000000
> [  384.133922] x14: 0000000000030d40 x13: 0000000000000000 x12: 003d090000000000
> [  384.133939] x11: 0000000000000000 x10: 0000000000000008 x9 : ffff80008015b05c
> [  384.133955] x8 : ffff800083533da8 x7 : 0000000000000000 x6 : 0000000000000100
> [  384.133971] x5 : ffff800082ebf000 x4 : ffff800082ebf2e8 x3 : 0000000000000000
> [  384.133987] x2 : ffff000825bf8618 x1 : ffff8000834c13a0 x0 : ffff00082b6d7170
> [  384.134005] Call trace:
> [  384.134009] in_lookup_hashtable+0x178/0x2000
> [  384.134022] rcu_core_si (kernel/rcu/tree.c:2421)
> [  384.134035] __do_softirq (arch/arm64/include/asm/jump_label.h:21
> include/linux/jump_label.h:207 include/trace/events/irq.h:142
> kernel/softirq.c:554)
> [  384.134046] ____do_softirq (arch/arm64/kernel/irq.c:81)
> [  384.134058] call_on_irq_stack (arch/arm64/kernel/entry.S:888)
> [  384.134070] do_softirq_own_stack (arch/arm64/kernel/irq.c:86)
> [  384.134082] irq_exit_rcu (arch/arm64/include/asm/percpu.h:44
> kernel/softirq.c:612 kernel/softirq.c:634 kernel/softirq.c:644)
> [  384.134094] el0_interrupt (arch/arm64/include/asm/daifflags.h:28
> arch/arm64/kernel/entry-common.c:133
> arch/arm64/kernel/entry-common.c:144
> arch/arm64/kernel/entry-common.c:763)
> [  384.134110] __el0_irq_handler_common (arch/arm64/kernel/entry-common.c:769)
> [  384.134124] el0t_64_irq_handler (arch/arm64/kernel/entry-common.c:774)
> [  384.134137] el0t_64_irq (arch/arm64/kernel/entry.S:592)
> [ 384.134153] Code: 00000000 00000000 00000000 00000000 (2b6d7170)
> All code
> ========
> ...
>   10: 70 71                jo     0x83
>   12: 6d                    insl   (%dx),%es:(%rdi)
>   13: 2b                    .byte 0x2b
> 
> Code starting with the faulting instruction
> ===========================================
>    0: 70 71                jo     0x73
>    2: 6d                    insl   (%dx),%es:(%rdi)
>    3: 2b                    .byte 0x2b

As a general thing, can you *please* fix this code dump to decode arm64 as
arm64?

Given the instructions before this are all UDF #0, I suspect the page table
entry has been corrupted and this is pointing at entirely the wrong page.

Thanks,
Mark.

> [  384.134161] ---[ end trace 0000000000000000 ]---
> [  384.134168] Kernel panic - not syncing: Oops: Fatal exception in interrupt
> [  384.134173] SMP: stopping secondary CPUs
> [  384.134184] Kernel Offset: disabled
> [  384.134187] CPU features: 0x8000020c,3c020000,0000421b
> [  384.134194] Memory Limit: none
> 
> Links:
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230919/testrun/20054202/suite/log-parser-test/tests/
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230919/testrun/20054202/suite/log-parser-test/test/check-kernel-oops/log
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2VbZdpWwncUx8oSxsSXCWV3N5DH/
>  - https://lkft.validation.linaro.org/scheduler/job/6666807#L2461
> 
> --
> Linaro LKFT
> https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
