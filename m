Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1ACA3E012
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2025 17:13:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 464FC3C7AD0
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2025 17:13:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5DF463C280D
 for <ltp@lists.linux.it>; Thu, 20 Feb 2025 17:13:40 +0100 (CET)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 786EB250282
 for <ltp@lists.linux.it>; Thu, 20 Feb 2025 17:13:39 +0100 (CET)
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-868f322b8dfso711346241.0
 for <ltp@lists.linux.it>; Thu, 20 Feb 2025 08:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740068018; x=1740672818; darn=lists.linux.it;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V879Iy5VcztBBIWmczzB/FWi9rCG1hoQENLoZiXnBvA=;
 b=KvtGcfUPmVtlyq9U8QHYOzGVsXNkc31qtNMPpDmCUMikKT1ZSG94fEXWSs065U7G1x
 BxZTU2MzNb43QlrVNGvg3L2lVAsgsSiD1Qzej2mEowL+SDGhbQUzhzzzvkUfF5NXG7PK
 KocLjIW/C/Sg/nXkg9vSbijS3oG603No0eYStGRmJK3thUj6fgpGXZ/AHQG7GGZOz7lx
 hV2TruxMnAcBaOWZinwAXd3U3kQm5GIcb2i9cgamJvMWe6RsQLfYhBxnvy3o6Lzlc9aY
 dbUuUHPfZbxVlHHL81BFh1quhokylFOiUJlWTR0twy+Q66xzuxUH4eEdGpPI+rFpjOFp
 qVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740068018; x=1740672818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V879Iy5VcztBBIWmczzB/FWi9rCG1hoQENLoZiXnBvA=;
 b=exGYmi6Kzs2hv2vbIl+Af8epdlOdbsgI5U/8vtDjl1VHTAHhTHSl0v0SymJbld0+Ao
 vQuSHopxcBdyEAk0bgBLuDM0FvoyZE/zU4q1tB12uqtCAMUA+mEqOooai1Mk1a2/zhzP
 EZqYShyxYT8Zlp4jZsIBQDPYs8rEuaZGQn20oKhdKW14l1ug5Paywp3YbUU9F4OvfX05
 QhUCPOjHOg+zGv1TnKf9B59a1iNw36/GoaTIxUIBF4Nh9NUmQLcJcxQI2DKdaziu9whN
 yDeORPRQSEYgVuiIMBZxzhBGQbobkwRO1GbgDQlgsfWLIjCai5Hf8Y1fHLrBYnThBRPW
 KZyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv7iG3aBQxBj5EWgWQzkSU2dZ2DTsLxK3Oosj5oAJ5ziYYjPJGeOr/BJEkOIlqfvV2C8w=@lists.linux.it
X-Gm-Message-State: AOJu0YzYJZTK5R3UQlTmSInBfzgicqbn4VfRdBWauf/8W9cEDjlpDjqI
 z3NK4FcFv3gn0tl3B/KSSApaoQMuOrrTAIIgPTc4QKz1xDHN9NFl7sKP/4MwbjYra3j/3z28zcf
 gBN1wDVyJrBPGesmCt/70SN4KiWYg178HaIvJDw==
X-Gm-Gg: ASbGncuiRZjJZOPkWVcPduiARJW49pClX8IEVhzkQTM6NDnn4Hn8fTnXULUFqT8Dm1u
 ESChOBDYwoKzEx40wHdPZY8Qu94IIrcd/rR+HkYr3b45vUI5uajm6uybcR33OZHt8yUYFfx7yhQ
 cuHJPp/CeXdNl1TRIrbkpefVUMth4xjg==
X-Google-Smtp-Source: AGHT+IFOiwZCl0rxvNfwH8m/y6qEhO2vlqH8zC1rbxAsDQ/BH7O5MpliguoeJImu0JZ1xu0+r0UbS2zjSMnKnLqd9RA=
X-Received: by 2002:a05:6122:17a7:b0:51e:ffd1:67f3 with SMTP id
 71dfb90a1353d-521dce38ba8mr2135245e0c.7.1740068018212; Thu, 20 Feb 2025
 08:13:38 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 20 Feb 2025 21:43:26 +0530
X-Gm-Features: AWEUYZkFcm73g8zLPsZavQg0Lht5rrlBSiureL7_1d0H-gYUnSDy_oWi453RMyo
Message-ID: <CA+G9fYuVngeOP_t063LbiJ+8yf-f+5tRt-A3-Hj=_X9XmZ108w@mail.gmail.com>
To: linux-block <linux-block@vger.kernel.org>,
 Cgroups <cgroups@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
 LTP List <ltp@lists.linux.it>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] next-20250218: arm64 LTP pids kernel panic
 loop_free_idle_workers
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
Cc: Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Regression on qemu-arm64 the kernel panic noticed while running the
LTP controllers pids.sh test cases on Linux next 20250218 and started
from the next-20250214

Test regression: arm64 LTP pids kernel panic loop_free_idle_workers

Started noticing from next-20250214.
Good: next-20250213
Bad: next-20250213..next-20250218

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Boot log:
---------
[    0.000000] Linux version 6.14.0-rc2-next-20250214
(tuxmake@tuxmake) (aarch64-linux-gnu-gcc (Debian 13.3.0-12) 13.3.0,
GNU ld (GNU Binutils for Debian) 2.43.90.20250127) #1 SMP PREEMPT
@1739528119
<trim>
command: pids.sh 6 50 0
<12>[  221.776255] /usr/local/bin/kirk[262]: starting test pids_6_50
(pids.sh 6 50 0)
pids 1 TINFO: Running: pids.sh 6 50 0
pids 1 TINFO: Tested kernel: Linux
runner-ykxhnyexq-project-40964107-concurrent-0
6.14.0-rc2-next-20250214 #1 SMP PREEMPT @1739528119 aarch64 GNU/Linux
pids 1 TINFO: ceiling LTP_TIMEOUT_MUL to 11
pids 1 TINFO: timeout per run is 0h 55m 0s
pids 1 TINFO: test starts with cgroup version 2
pids 1 TINFO: Running testcase 6 with 50 processes
pids 1 TINFO: set a limit that is smaller than current number of pids
<1>[  224.406844] Unable to handle kernel paging request at virtual
address dead000000000108
<1>[  224.407052] Mem abort info:
<1>[  224.407100]   ESR = 0x0000000096000044
<1>[  224.407219]   EC = 0x25: DABT (current EL), IL = 32 bits
<1>[  224.407315]   SET = 0, FnV = 0
<1>[  224.407400]   EA = 0, S1PTW = 0
<1>[  224.407459]   FSC = 0x04: level 0 translation fault
<1>[  224.407536] Data abort info:
<1>[  224.407577]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
<1>[  224.407621]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
<1>[  224.407697]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
<1>[  224.407809] [dead000000000108] address between user and kernel
address ranges
<0>[  224.408307] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
<4>[  224.416979] Modules linked in: btrfs blake2b_generic xor
xor_neon raid6_pq zstd_compress sm3_ce sm3 sha3_ce sha512_ce
sha512_arm64 fuse drm backlight ip_tables x_tables
<4>[  224.421352] CPU: 0 UID: 0 PID: 3368 Comm: pids_task2 Not tainted
6.14.0-rc2-next-20250214 #1
<4>[  224.422657] Hardware name: linux,dummy-virt (DT)
<4>[  224.423946] pstate: 224020c9 (nzCv daIF +PAN -UAO +TCO -DIT
-SSBS BTYPE=--)
<4>[ 224.424677] pc : loop_free_idle_workers (include/linux/list.h:195
include/linux/list.h:218 include/linux/list.h:229
drivers/block/loop.c:917)
<4>[ 224.426548] lr : loop_free_idle_workers (drivers/block/loop.c:911
(discriminator 2))
<4>[  224.427338] sp : ffff800080003d50
<4>[  224.427910] x29: ffff800080003d50 x28: fff238a88301c500 x27:
fff238a883084c00
<4>[  224.429587] x26: ffffa298bac57000 x25: ffffffffffffc568 x24:
dead000000000122
<4>[  224.430697] x23: fff238a880370ac8 x22: dead000000000100 x21:
0000000000000000
<4>[  224.432004] x20: fff238a880370ab8 x19: dead0000000000b8 x18:
ffff800083d9bb90
<4>[  224.432538] x17: fff296100496b000 x16: ffff800080000000 x15:
0000ffff8d0a9fff
<4>[  224.433866] x14: 0000000000000000 x13: 1ffe47151065cc61 x12:
fff238a8832e630c
<4>[  224.434769] x11: 003a9cb01550c679 x10: fff238a8bf4b7f70 x9 :
ffffa298b8fc3cd0
<4>[  224.436209] x8 : ffff800080003c28 x7 : 0000000000000101 x6 :
ffff800080003ce0
<4>[  224.437070] x5 : fff238a880eba680 x4 : dead000000000100 x3 :
dead000000000122
<4>[  224.438027] x2 : 0000000000000000 x1 : 00000000ffff50fc x0 :
00000000ffff7b68
<4>[  224.439174] Call trace:
<4>[ 224.439882] loop_free_idle_workers (include/linux/list.h:195
include/linux/list.h:218 include/linux/list.h:229
drivers/block/loop.c:917) (P)
<4>[ 224.440765] loop_free_idle_workers_timer (drivers/block/loop.c:932)
<4>[ 224.441223] call_timer_fn (arch/arm64/include/asm/jump_label.h:36
include/trace/events/timer.h:127 kernel/time/timer.c:1790)
<4>[ 224.441822] __run_timers (kernel/time/timer.c:1841
kernel/time/timer.c:2414)
<4>[ 224.442389] run_timer_base (kernel/time/timer.c:2427
kernel/time/timer.c:2418 kernel/time/timer.c:2435)
<4>[ 224.442855] run_timer_softirq
(arch/arm64/include/asm/jump_label.h:36 kernel/time/timer.c:342
kernel/time/timer.c:2448)
<4>[ 224.443547] handle_softirqs
(arch/arm64/include/asm/jump_label.h:36 include/trace/events/irq.h:142
kernel/softirq.c:562)
<4>[ 224.444121] __do_softirq (kernel/softirq.c:596)
<4>[ 224.444755] ____do_softirq (arch/arm64/kernel/irq.c:82)
<4>[ 224.445204] call_on_irq_stack (arch/arm64/kernel/entry.S:897)
<4>[ 224.445670] do_softirq_own_stack (arch/arm64/kernel/irq.c:87)
<4>[ 224.445964] __irq_exit_rcu (kernel/softirq.c:442 kernel/softirq.c:662)
<4>[ 224.446295] irq_exit_rcu (kernel/softirq.c:680)
<4>[ 224.446808] el1_interrupt (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/entry-common.c:280
arch/arm64/kernel/entry-common.c:563
arch/arm64/kernel/entry-common.c:575)
<4>[ 224.447585] el1h_64_irq_handler (arch/arm64/kernel/entry-common.c:581)
<4>[ 224.448079] el1h_64_irq (arch/arm64/kernel/entry.S:596)
<4>[ 224.448796] try_charge_memcg (mm/memcontrol.c:1803
mm/memcontrol.c:2222) (P)
<4>[ 224.449589] charge_memcg (mm/memcontrol.c:4541)
<4>[ 224.450399] __mem_cgroup_charge (include/linux/cgroup_refcnt.h:78
mm/memcontrol.c:4558)
<4>[ 224.451234] __handle_mm_fault (mm/memory.c:1059 (discriminator 1)
mm/memory.c:5462 (discriminator 1) mm/memory.c:5574 (discriminator 1)
mm/memory.c:4091 (discriminator 1) mm/memory.c:5935 (discriminator 1)
mm/memory.c:6078 (discriminator 1))
<4>[ 224.451763] handle_mm_fault (mm/memory.c:6247)
<4>[ 224.452307] do_page_fault (arch/arm64/mm/fault.c:647)
<4>[ 224.452881] do_translation_fault (arch/arm64/mm/fault.c:787)
<4>[ 224.453358] do_mem_abort (arch/arm64/mm/fault.c:919 (discriminator 1))
<4>[ 224.453890] el0_da (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:165 (discriminator 1)
arch/arm64/kernel/entry-common.c:178 (discriminator 1)
arch/arm64/kernel/entry-common.c:605 (discriminator 1))
<4>[ 224.454329] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:766)
<4>[ 224.454897] el0t_64_sync (arch/arm64/kernel/entry.S:600)
<0>[ 224.455654] Code: 8b190000 eb01001f 54000684 a9448f84 (f9000483)
All code
========
   0: 8b190000 add x0, x0, x25
   4: eb01001f cmp x0, x1
   8: 54000684 b.mi 0xd8  // b.first
   c: a9448f84 ldp x4, x3, [x28, #72]
  10:* f9000483 str x3, [x4, #8] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f9000483 str x3, [x4, #8]
<4>[  224.456945] ---[ end trace 0000000000000000 ]---
<0>[  224.458162] Kernel panic - not syncing: Oops: Fatal exception in interrupt
<2>[  224.459437] SMP: stopping secondary CPUs
<0>[  224.460808] Kernel Offset: 0x229838400000 from 0xffff800080000000
<0>[  224.461525] PHYS_OFFSET: 0xfffdc75880000000
<0>[  224.462166] CPU features: 0x000,000000d0,60bef2f8,cb7e7f3f
<0>[  224.463148] Memory Limit: none
<0>[  224.463861] ---[ end Kernel panic - not syncing: Oops: Fatal
exception in interrupt ]---

## Source
* Kernel version: 6.14.0-rc2-next-20250214
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
* Git describe: next-20250214
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250214/

## Build
* Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250214/testrun/27292264/suite/log-parser-test/test/panic-multiline-kernel-panic-not-syncing-oops-fatal-exception-in-interrupt-89d94046139a63ab8ef657ef456dab84b63ef36eb42dc7c556dfa0f7a59423da/log
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250214/testrun/27292264/suite/log-parser-test/test/panic-multiline-kernel-panic-not-syncing-oops-fatal-exception-in-interrupt-89d94046139a63ab8ef657ef456dab84b63ef36eb42dc7c556dfa0f7a59423da/history/
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250214/testrun/27292264/suite/log-parser-test/test/panic-multiline-kernel-panic-not-syncing-oops-fatal-exception-in-interrupt-89d94046139a63ab8ef657ef456dab84b63ef36eb42dc7c556dfa0f7a59423da/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2t1m4RtgCbRZ2vhQrdEIwwj3DIY/config
* Architecures: arm64
* Toolchain version: gcc-13

--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
