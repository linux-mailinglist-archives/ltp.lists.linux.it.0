Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5FFA30803
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2025 11:09:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0A3B3C990A
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2025 11:09:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A0583C1876
 for <ltp@lists.linux.it>; Tue, 11 Feb 2025 11:09:02 +0100 (CET)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C7BCB103874E
 for <ltp@lists.linux.it>; Tue, 11 Feb 2025 11:08:59 +0100 (CET)
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-867032b0393so1294805241.2
 for <ltp@lists.linux.it>; Tue, 11 Feb 2025 02:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739268538; x=1739873338; darn=lists.linux.it;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xEn3cm/UNrP7SZZldloJXkuufWri2Kvjnrj9hrLDPQo=;
 b=L06SyTMrZF9WzouzDg+KrZwdrHYlLLummPYvsPqymvco0p6R4lGlIlsOmvfj1IMBRw
 c3fqpghz3ON251vjMoIO9sZVRKUneGNJzxps6YI0gcyV1B/XW5ALb8eLYIenM3W3Bw4d
 r6dIun2pmcP6SveT/uQZxUER9t+eAqEqz+QG1UkZ9Db34qBFQrAaWoLkg/s/MreoeQ8w
 +GMZbLlFmOD74SIqQVwlzEcGkjaqneUfb6RHTdURtp+8/FJvLzqc0YkkfCLUKyEVMcdj
 gGpd5T+oWTtrvOig2dxxX7YL5w4DuLQm644hzgOeTZeurQaApUkK9hzfC8oVaXvEcNIx
 kbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739268538; x=1739873338;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xEn3cm/UNrP7SZZldloJXkuufWri2Kvjnrj9hrLDPQo=;
 b=c/6fReuxMXIZRpcHLCPGc+C7Y6MrJ6vvXzM2hvQETA69K/BNd+WwzaG9rVzYQZvRMW
 S3ys/GILEkFiaVAxpX629pvgXZrm3KqcXrP+hEcSahAj1w969zE8Tm7sKHeRYfxAR2n4
 Hr/aMbdiIfUj752C28NUDegNNq+IWRlEuiX3//Johros9EMKcIeh63kXs/Z1JB7/uuJ9
 S62yBUjG21baPXYgXwyn8fpwta/vqg7XO0vZeQjLItZ6rCA1s6Wdrrkb5SCHz/W8E2Wr
 +CivOcJ5Hp/dgr2vwrW0L03pSyXYjxzOA3FnnGmm870pmt0KCVs3EqP/58T0l4aUPZzd
 yiWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnPlDU1gSWBSKtbi8TJMn9UdzQ3HEXHIXB2VD+ZeSxCM7DVgLtLAXtioUDixahegsMZI4=@lists.linux.it
X-Gm-Message-State: AOJu0Yyw5tO5AU+FcFJZVv2mwKXdz5ps+YO9Qu6nDgePaZTa5n3YYtMZ
 ENGzXi3zgTooXq7FT05gapzhZr5TAo/dZe+SO+NBUxxaHA+ppM8l6VzhUYN9gp4bO84JbBNpWbe
 v9pwTCowfnW3ULSsRYHn6VdJNAQHSH2c7/j1Dpw==
X-Gm-Gg: ASbGncvvPhQf3+/A+dDSD87XnseROMxpbNkP3rYVv5U/1Ve/RLwNYjpIMUJTdcvASsT
 cMoZrAr0731pfjr8xsjMTVQ4nhuNlPwnA9F3tjqJmQdRGyfQMgW3AS98N1y1efAwRbiddr3EMlf
 8Ex/chdfRHeCGfVnlYOYVfAi1ONi2AXg==
X-Google-Smtp-Source: AGHT+IHp1zdj8ZibeFlCfAdtduHOD6KnRYnX/ZueNTg9nfqkFNPLIXpI43V2qHdRl3eZSUUEm/vQoAR49cYDijtPvYw=
X-Received: by 2002:a05:6102:3e0b:b0:4af:ba51:a25f with SMTP id
 ada2fe7eead31-4ba85f1d603mr11334067137.20.1739268538258; Tue, 11 Feb 2025
 02:08:58 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYt5QwJ4_F8fJj7jx9_0Le9kOVSeG38ox9qnKqwsrDdvHQ@mail.gmail.com>
In-Reply-To: <CA+G9fYt5QwJ4_F8fJj7jx9_0Le9kOVSeG38ox9qnKqwsrDdvHQ@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 11 Feb 2025 15:38:46 +0530
X-Gm-Features: AWEUYZlxubnV84-s1VVkx9iBxiTYmg01jsC7etcGK75gbLsVTjiAfHyBl1JrU90
Message-ID: <CA+G9fYtf=NaCuLrs2BtfXRQvxDap214i4bJSC+mEqTWPV7676Q@mail.gmail.com>
To: open list <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
 Linux PM <linux-pm@vger.kernel.org>, rcu <rcu@vger.kernel.org>, 
 LTP List <ltp@lists.linux.it>, Linux Regressions <regressions@lists.linux.dev>,
 lkft-triage@lists.linaro.org
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] next-20250210: WARNING: at include/linux/rwsem.h:85
 madvise_unlock
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
Cc: SeongJae Park <sj@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 11 Feb 2025 at 14:53, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regressions on arm64 Juno-r2 device while running LTP syscalls tests
> madvise01 warnings on the Linux next-20250210 tag.
>
> First seen on next-20250210
> Good: next-20250207
> Bad: next-20250210
>
> This regression is reproducible with CONFIG_ARM64_64K_PAGES=y
>
> Test regression: LTP madvise01 WARNING include/linux/rwsem.h madvise_unlock
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Test log
> command: madvise01
> [ 1190.422933] /usr/local/bin/kirk[359]: starting test madvise01 (madvise01)
> tst_tmpdir.c:316: TINFO: Using /tmp/LTP_madSbRtkW as tmpdir (tmpfs filesystem)
> tst_test.c:1860: TINFO: LTP version: 20240930
> [ 1190.607278] Injecting memory failure for pfn 0x8e13f at process
> virtual address 0xffff8c8c0000
> tst_test.c:1864: TINFO:[
> ** replaying previous printk message **
> [ 1190.618980] Memory failure: 0x8e13f: recovery action for clean LRU
> page: Recovered
> [ 1190.619013] ------------[ cut here ]------------
> [ 1190.619016] WARNING: CPU: 2 PID: 137820 at include/linux/rwsem.h:85
> madvise_unlock (include/linux/rwsem.h:85 (discriminator 1)
> include/linux/rwsem.h:205 (discriminator 1)
> include/linux/mmap_lock.h:70 (discriminator 1)
> include/linux/mmap_lock.h:169 (discriminator 1)
> include/linux/mmap_lock.h:176 (discriminator 1) mm/madvise.c:1599
> (discriminator 1))
> Tested kernel: 6.14.0-rc2-next-20[ 1190.646322] Modules linked in: tun
> overlay btrfs blake2b_generic xor xor_neon raid6_pq zstd_compress
> panfrost hdlcd tda998x onboard_usb_dev drm_shmem_helper drm_client_lib
> cec gpu_sched drm_dma_helper drm_kms_helper fuse drm backlight
> ip_tables x_tables
> 250210 #1 SMP PREEMPT @1739162484[ 1190.671777] CPU: 2 UID: 0 PID:
> 137820 Comm: madvise01 Not tainted 6.14.0-rc2-next-20250210 #1
> [ 1190.683191] Hardware name: ARM Juno development board (r2) (DT)
> aarch64
> tst_test.c:1703: TINFO:[ 1192.996920] pstate: a0000005 (NzCv daif -PAN
> -UAO -TCO -DIT -SSBS BTYPE=--)
> Timeout per run is 0h 05m 24s
> [ 1193.006802] pc : madvise_unlock (include/linux/rwsem.h:85
> (discriminator 1) include/linux/rwsem.h:205 (discriminator 1)
> include/linux/mmap_lock.h:70 (discriminator 1)
> include/linux/mmap_lock.h:169 (discriminator 1)
> include/linux/mmap_lock.h:176 (discriminator 1) mm/madvise.c:1599
> (discriminator 1))
> [ 1211.692758] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [ 1211.692776] rcu: 1-...0: (0 ticks this GP)
> idle=f3a4/1/0x4000000000000000 softirq=946757/946757 fqs=2625
> [ 1211.692794] rcu: 2-...0: (1 GPs behind)
> idle=2fac/1/0x4000000000000002 softirq=357256/357257 fqs=2625
> [ 1211.692809] rcu: (detected by 4, t=5252 jiffies, g=196909, q=138 ncpus=6)
> [ 1211.692821] Sending NMI from CPU 4 to CPUs 1:
> [ 1221.694021] Sending NMI from CPU 4 to CPUs 2:
> [ 1231.695220] rcu: rcu_preempt kthread timer wakeup didn't happen for
> 5001 jiffies! g196909 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
> [ 1231.695231] rcu: Possible timer handling issue on cpu=4 timer-softirq=26922
> [ 1231.695238] rcu: rcu_preempt kthread starved for 5002 jiffies!
> g196909 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=4
> [ 1231.695251] rcu: Unless rcu_preempt kthread gets sufficient CPU
> time, OOM is now expected behavior.
> [ 1231.695257] rcu: RCU grace-period kthread stack dump:
> [ 1231.695262] task:rcu_preempt     state:I stack:0     pid:18
> tgid:18    ppid:2      task_flags:0x208040 flags:0x00000008
> [ 1231.695280] Call trace:
> [ 1231.695286] __switch_to (arch/arm64/kernel/process.c:704) (T)
> [ 1231.695306] __schedule (kernel/sched/core.c:5381 kernel/sched/core.c:6765)
> [ 1231.695318] schedule (kernel/sched/core.c:6843 kernel/sched/core.c:6857)
> [ 1231.695330] schedule_timeout (include/linux/timer.h:185
> kernel/time/sleep_timeout.c:100)
> [ 1231.695347] rcu_gp_fqs_loop (kernel/rcu/tree.c:2024 (discriminator 15))
> [ 1231.695365] rcu_gp_kthread (kernel/rcu/tree.c:2229 (discriminator 2))
> [ 1231.695380] kthread (kernel/kthread.c:464)
> [ 1231.695395] ret_from_fork (arch/arm64/kernel/entry.S:863)
> [ 1231.695410] rcu: Stack dump where RCU GP kthread last ran:
> [ 1231.695417] CPU: 4 UID: 0 PID: 0 Comm: swapper/4 Not tainted
> 6.14.0-rc2-next-20250210 #1
> [ 1231.695428] Hardware name: ARM Juno development board (r2) (DT)
> [ 1231.695434] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 1231.695445] pc : cpuidle_enter_state (drivers/cpuidle/cpuidle.c:292)
> [ 1231.695467] lr : cpuidle_enter_state
> (arch/arm64/include/asm/irqflags.h:26
> arch/arm64/include/asm/irqflags.h:48 drivers/cpuidle/cpuidle.c:290)
> [ 1231.695481] sp : ffff80008378fd90
> [ 1231.695486] x29: ffff80008378fd90 x28: 0000000000000000 x27: 0000000000000000
> [ 1231.695503] x26: 0000000000000000 x25: 0000000000000001 x24: 0000011a1e4785a4
> [ 1231.695519] x23: 0000000000000001 x22: ffff00080314a080 x21: 0000011a1e83fe44
> [ 1231.695536] x20: 0000000000000001 x19: ffff00097d625778 x18: ffff8000a0c2fc10
> [ 1231.695552] x17: 000000040044ffff x16: 00500072f5507510 x15: 0000000000000000
> [ 1231.695568] x14: ffff0008007bc800 x13: ffff8008fad70000 x12: 0000000034d4d91d
> [ 1231.695585] x11: 0000000000000000 x10: 0000000000001000 x9 : ffff8000815901a4
> [ 1231.695601] x8 : ffff80008378fc98 x7 : 0000000000000001 x6 : ffff8000829f9000
> [ 1231.695617] x5 : ffff0008007bc800 x4 : ffff8000829f95e0 x3 : 0000000000000000
> [ 1231.695633] x2 : 0000000000000000 x1 : 0000000100000001 x0 : 0000000100000001
> [ 1231.695649] Call trace:
> [ 1231.695653] cpuidle_enter_state (drivers/cpuidle/cpuidle.c:292) (P)
> [ 1231.695671] cpuidle_enter (drivers/cpuidle/cpuidle.c:391 (discriminator 2))
> [ 1231.695692] do_idle (kernel/sched/idle.c:155
> kernel/sched/idle.c:230 kernel/sched/idle.c:325)
> [ 1231.695716] cpu_startup_entry (kernel/sched/idle.c:423 (discriminator 1))
> [ 1231.695732] secondary_start_kernel
> (arch/arm64/include/asm/atomic_ll_sc.h:95 (discriminator 2)
> arch/arm64/include/asm/atomic.h:28 (discriminator 2)
> include/linux/atomic/atomic-arch-fallback.h:546 (discriminator 2)
> include/linux/atomic/atomic-arch-fallback.h:994 (discriminator 2)
> include/linux/atomic/atomic-instrumented.h:436 (discriminator 2)
> include/linux/sched/mm.h:37 (discriminator 2)
> arch/arm64/kernel/smp.c:214 (discriminator 2))
> [ 1231.695749] __secondary_switched (arch/arm64/kernel/head.S:421)
> madvise01.c:68: TINFO: Mounting [ 1231.961851] lr : do_madvise
> (mm/madvise.c:1748)
> [ 1242.412862] sp : ffff8000a188fdc0
> tmp_madvise to /tmp/LTP_madSbRtkW/tmp_madvise fstyp=tmpfs flags=0[
> 1242.416214] x29: ffff8000a188fdc0 x28: ffff000813417c00 x27:
> 0000000000000000
>
> madvise01.c:113: TPASS: madvise[ 1294.712666] rcu: INFO: rcu_preempt
> detected stalls on CPUs/tasks:
> [ 1294.712685] rcu: 2-...0: (1 GPs behind)
> idle=2fac/1/0x4000000000000002 softirq=357256/357257 fqs=7636
> [ 1294.712704] rcu: (detected by 4, t=26007 jiffies, g=196909, q=184 ncpus=6)
> [ 1294.712716] Sending NMI from CPU 4 to CPUs 2:
> [ 1304.713915] rcu: rcu_preempt kthread timer wakeup didn't happen for
> 8168 jiffies! g196909 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
> [ 1304.713927] rcu: Possible timer handling issue on cpu=3 timer-softirq=35895
> [ 1304.713933] rcu: rcu_preempt kthread starved for 8169 jiffies!
> g196909 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=3
> [ 1304.713945] rcu: Unless rcu_preempt kthread gets sufficient CPU
> time, OOM is now expected behavior.
> [ 1304.713951] rcu: RCU grace-period kthread stack dump:
> [ 1304.713955] task:rcu_preempt     state:I stack:0     pid:18
> tgid:18    ppid:2      task_flags:0x208040 flags:0x00000008
> [ 1304.713974] Call trace:
> [ 1304.713979] __switch_to (arch/arm64/kernel/process.c:704) (T)
> [ 1304.714000] __schedule (kernel/sched/core.c:5381 kernel/sched/core.c:6765)
> [ 1304.714013] schedule (kernel/sched/core.c:6843 kernel/sched/core.c:6857)
> [ 1304.714024] schedule_timeout (include/linux/timer.h:185
> kernel/time/sleep_timeout.c:100)
> [ 1304.714042] rcu_gp_fqs_loop (kernel/rcu/tree.c:2024 (discriminator 15))
> [ 1304.714061] rcu_gp_kthread (kernel/rcu/tree.c:2229 (discriminator 2))
> [ 1304.714076] kthread (kernel/kthread.c:464)
> [ 1304.714090] ret_from_fork (arch/arm64/kernel/entry.S:863)
> [ 1304.714105] rcu: Stack dump where RCU GP kthread last ran:
> [ 1304.714109] Sending NMI from CPU 4 to CPUs 3:
> [ 1304.714119] NMI backtrace for cpu 3
> [ 1304.714130] CPU: 3 UID: 0 PID: 205 Comm: systemd-udevd Not tainted
> 6.14.0-rc2-next-20250210 #1
> [ 1304.714143] Hardware name: ARM Juno development board (r2) (DT)
> [ 1304.714148] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 1304.714158] pc : queued_spin_lock_slowpath
> (kernel/locking/qspinlock.c:380 (discriminator 5))
> [ 1304.714176] lr : _raw_spin_lock_bh (kernel/locking/spinlock.c:179)
> [ 1304.714189] sp : ffff800085e6f310
> [ 1304.714193] x29: ffff800085e6f310 x28: ffff000808761c00 x27: ffff00080295b500
> [ 1304.714210] x26: ffff00081e724e00 x25: 0000000000000000 x24: 0000000000008080
> [ 1304.714224] x23: 0000000000000000 x22: 0000000074000080 x21: 0000000000000078
> [ 1304.714239] x20: ffff000802bb0a30 x19: ffff000802bb0a30 x18: 0000000000000000
> [ 1304.714254] x17: 0000000000000000 x16: 0000000000000000 x15: 0000aaaabea75a70
> [ 1304.714268] x14: 0000000000000000 x13: 2dcd92d500000000 x12: 40982a24d45a0569
> [ 1304.714283] x11: 3cc1638a3642b30d x10: d5e7818600000000 x9 : ffff80008159decc
> [ 1304.714298] x8 : ffff800085e6f278 x7 : 0000000000000000 x6 : 0000000000000201
> [ 1304.714312] x5 : ffff8000829f9000 x4 : ffff8000829f95e0 x3 : 0000000000000001
> [ 1304.714326] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000001
> [ 1304.714339] Call trace:
> [ 1304.714343] queued_spin_lock_slowpath
> (kernel/locking/qspinlock.c:380 (discriminator 5)) (P)
> [ 1304.714360] _raw_spin_lock_bh (kernel/locking/spinlock.c:179)
> [ 1304.714374] lock_sock_nested (net/core/sock.c:3649 (discriminator 1))
> [ 1304.714388] tcp_sock_set_cork (net/ipv4/tcp.c:3547 net/ipv4/tcp.c:3560)
> [ 1304.714405] xs_tcp_send_request (net/sunrpc/xprtsock.c:1124)
> [ 1304.714418] xprt_transmit (net/sunrpc/xprt.c:1578 net/sunrpc/xprt.c:1634)
> [ 1304.714434] call_transmit (net/sunrpc/clnt.c:2283 net/sunrpc/clnt.c:2265)
> [ 1304.714447] __rpc_execute
> (include/asm-generic/bitops/generic-non-atomic.h:128
> net/sunrpc/sched.c:954)
> [ 1304.714463] rpc_execute (include/linux/sched/mm.h:339
> (discriminator 1) include/linux/sched/mm.h:399 (discriminator 1)
> net/sunrpc/sched.c:1026 (discriminator 1))
> [ 1304.714476] rpc_run_task (net/sunrpc/clnt.c:1250)
> [ 1304.714488] rpc_call_sync (net/sunrpc/clnt.c:1278 (discriminator 1))
> [ 1304.714501] nfs3_rpc_wrapper (fs/nfs/nfs3proc.c:36)
> [ 1304.714516] nfs3_proc_getattr (fs/nfs/nfs3proc.c:123)
> [ 1304.714528] __nfs_revalidate_inode (fs/nfs/inode.c:1311 (discriminator 2))
> [ 1304.714546] nfs_access_get_cached (fs/nfs/dir.c:3058 (discriminator
> 1) fs/nfs/dir.c:3118 (discriminator 1))
> [ 1304.714561] nfs_do_access (fs/nfs/dir.c:3246)
> [ 1304.714574] nfs_permission (fs/nfs/dir.c:3360)
> [ 1304.714588] inode_permission (fs/namei.c:588 fs/namei.c:562)
> [ 1304.714606] link_path_walk.part.0.constprop.0 (fs/namei.c:1831
> fs/namei.c:2422)
> [ 1304.714624] path_lookupat (fs/namei.c:2607 fs/namei.c:2630)
> [ 1304.714639] filename_lookup (fs/namei.c:2660)
> [ 1304.714654] kern_path (fs/namei.c:2768)
> [ 1304.714669] unix_find_other (net/unix/af_unix.c:1153 net/unix/af_unix.c:1182)
> [ 1304.714681] unix_dgram_sendmsg (net/unix/af_unix.c:2038)
> [ 1304.714692] ____sys_sendmsg (net/socket.c:718 (discriminator 1)
> net/socket.c:733 (discriminator 1) net/socket.c:2573 (discriminator
> 1))
> [ 1304.714710] ___sys_sendmsg (net/socket.c:2627)
> [ 1304.714725] __sys_sendmsg (net/socket.c:2659 (discriminator 1))
> [ 1304.714740] __arm64_sys_sendmsg (net/socket.c:2662)
> [ 1304.714755] invoke_syscall.constprop.0
> (arch/arm64/include/asm/syscall.h:61 arch/arm64/kernel/syscall.c:54)
> [ 1304.714772] do_el0_svc (arch/arm64/kernel/syscall.c:139
> arch/arm64/kernel/syscall.c:151)
> [ 1304.714787] el0_svc (arch/arm64/include/asm/irqflags.h:82
> (discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
> 1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
> arch/arm64/kernel/entry-common.c:165 (discriminator 1)
> arch/arm64/kernel/entry-common.c:178 (discriminator 1)
> arch/arm64/kernel/entry-common.c:745 (discriminator 1))
> [ 1304.714806] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:763)
> [ 1304.714821] el0t_64_sync (arch/arm64/kernel/entry.S:600)
> test for MADV_NORMAL PASSED
>
> ## Source
> * kernel version: 6.14.0-rc2-next-20250210
> * git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> * git sha: df5d6180169ae06a2eac57e33b077ad6f6252440
> * git describe: next-20250210
> * project details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250210/
> * architecture: arm64
> * device: Juno-r2
> * toolchain: gcc-13
> * config : CONFIG_ARM64_64K_PAGES=y (gcc-13-lkftconfig-64k_page_size)
> * build config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2spp0dMfaQHNeHr0jT9DgXiO1Px/config
> * build: https://storage.tuxsuite.com/public/linaro/lkft/builds/2spp0dMfaQHNeHr0jT9DgXiO1Px/

Re posting links due format issue,

## Boot log
* Juno-r2 log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250210/testrun/27251102/suite/log-parser-test/test/warning-warning-cpu-pid-at-includelinuxrwsemh-madvise_unlock/log
* Juno-r2 details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250210/testrun/27251102/suite/log-parser-test/test/warning-warning-cpu-pid-at-includelinuxrwsemh-madvise_unlock/
* Juno-r2 history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250210/testrun/27251102/suite/log-parser-test/test/warning-warning-cpu-pid-at-includelinuxrwsemh-madvise_unlock/history/
* Juno-r2 lava log 1:
https://lkft.validation.linaro.org/scheduler/job/8117395#L43180
* Juno-r2 lava log 2: https://lkft.validation.linaro.org/scheduler/job/8118169
* Juno-r2 lava log 3: https://lkft.validation.linaro.org/scheduler/job/8118170

 >
> --
> Linaro LKFT
> https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
