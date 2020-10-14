Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E428E729
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 21:19:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26E4F3C639B
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 21:19:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B6BC53C2494
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 19:50:55 +0200 (CEST)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0BD48600A19
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 19:50:55 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id n6so63734wrm.13
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 10:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4bZVeORziyw7RooKddq3ipG7cXsmevZRxltCru+HvDs=;
 b=K+YqjCja9z6UjmVmQ+sAooEMO8/s5dF/kYB2bF57KqdmtnjoPt72cvZEWShP7kLuNg
 YsuZVo6RfvKHQRLA9rP1cyydgCcsF8wZ5mwZCEibeuztnHzoVMjQwbQjuksZYQkcGUvV
 t6HoSprh4mOBACiZfnAPmmtKS3rMhF7jFSDY9W1qxB3+TJc+203RcHgCBQMPIe9kypX5
 2f8ihCEQYkYRYg2rZGPhO3c8ZdQjKVvCQMEZdPXNR20Uh04jBqSgx0coPtOGdcnaFMzM
 Z25FNRavG2km8mybh0DB1yViDFMPctXSipib6CTbWnPZNP6Hp5BgFp1wPO1wHGfGF5bv
 Smyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4bZVeORziyw7RooKddq3ipG7cXsmevZRxltCru+HvDs=;
 b=RdTrMf0iyg7GAnhDSebwX9nZeHS8rv4TTiatekhkj3sXr8b3woDGhMREWf0e4lWI8M
 DlpN2HXoVoAckggoCQWrUhhN2s1gqM9+uXc2Ro38ut+fiAbM84vImLeoih2tzL3GIfdB
 xcVq+XmBK3AdId5RjsBbhtM3Ce3xL/ny4qDOV/NcZ02tSqJETl47xQk25AmY7N24i/JY
 zwB65RMvchQi8XGAA3gvXi1umu7FZL4uWBd7O2BLM/F+2YNHCvZCMYM/Kn29BiH7wJmS
 oSml6Pmw/jjVpRih2gOqskmhlnmiXIR+rTjliXJ8+Q7EXIMxfmDRIMZpOSVODBqxwnoZ
 pbow==
X-Gm-Message-State: AOAM533CSA60Fq2BszAJ5lrSBxn5G2VScSONR1seEgLOu1hP/Zcmcdjq
 RFQRO2/hSY9V+XiPI5yRcak=
X-Google-Smtp-Source: ABdhPJye8amspAtwXAyFP8ZouCefB9/zSgE4s7zZWFAIFyy7Er+IgdYJFlOssZ8yufFj9vBQv3mS4g==
X-Received: by 2002:adf:e881:: with SMTP id d1mr20757wrm.395.1602697854563;
 Wed, 14 Oct 2020 10:50:54 -0700 (PDT)
Received: from alley (176-114-240-43.rychlydrat.cz. [176.114.240.43])
 by smtp.gmail.com with ESMTPSA id v6sm297930wmj.6.2020.10.14.10.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 10:50:54 -0700 (PDT)
From: Petr Mladek <mladek.petr@gmail.com>
X-Google-Original-From: Petr Mladek <pmladek@suse.com>
Date: Wed, 14 Oct 2020 19:50:51 +0200
To: John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20201014175051.GC13775@alley>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
 <20201014140514.GB17231@alley> <20201014151311.GB13775@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014151311.GB13775@alley>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 14 Oct 2020 21:19:31 +0200
Subject: [LTP] [PATCH] printk: ringbuffer: Wrong data pointer when appending
 small string
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
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

data_realloc() returns wrong data pointer when the block is wrapped and
the size is not increased. It might happen when pr_cont() wants to
add only few characters and there is already a space for them because
of alignment.

It might cause writing outsite the buffer. It has been detected by LTP
tests with KASAN enabled:

[  221.921944] oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=c,mems_allowed=0,oom_memcg=/0,task_memcg=in
[  221.922108] ==================================================================
[  221.922111] BUG: KASAN: global-out-of-bounds in vprintk_store+0x362/0x3d0
[  221.922112] Write of size 2 at addr ffffffffba51dbcd by task
memcg_test_1/11282
[  221.922113]
[  221.922114] CPU: 1 PID: 11282 Comm: memcg_test_1 Not tainted
5.9.0-next-20201013 #1
[  221.922116] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.0b 07/27/2017
[  221.922116] Call Trace:
[  221.922117]  dump_stack+0xa4/0xd9
[  221.922118]  print_address_description.constprop.0+0x21/0x210
[  221.922119]  ? _raw_write_lock_bh+0xe0/0xe0
[  221.922120]  ? vprintk_store+0x362/0x3d0
[  221.922121]  kasan_report.cold+0x37/0x7c
[  221.922122]  ? vprintk_store+0x362/0x3d0
[  221.922123]  check_memory_region+0x18c/0x1f0
[  221.922124]  memcpy+0x3c/0x60
[  221.922125]  vprintk_store+0x362/0x3d0
[  221.922125]  ? __ia32_sys_syslog+0x50/0x50
[  221.922126]  ? _raw_spin_lock_irqsave+0x9b/0x100
[  221.922127]  ? _raw_spin_lock_irq+0xf0/0xf0
[  221.922128]  ? __kasan_check_write+0x14/0x20
[  221.922129]  vprintk_emit+0x8d/0x1f0
[  221.922130]  vprintk_default+0x1d/0x20
[  221.922131]  vprintk_func+0x5a/0x100
[  221.922132]  printk+0xb2/0xe3
[  221.922133]  ? swsusp_write.cold+0x189/0x189
[  221.922134]  ? kernfs_vfs_xattr_set+0x60/0x60
[  221.922134]  ? _raw_write_lock_bh+0xe0/0xe0
[  221.922135]  ? trace_hardirqs_on+0x38/0x100
[  221.922136]  pr_cont_kernfs_path.cold+0x49/0x4b
[  221.922137]  mem_cgroup_print_oom_context.cold+0x74/0xc3
[  221.922138]  dump_header+0x340/0x3bf
[  221.922139]  oom_kill_process.cold+0xb/0x10
[  221.922140]  out_of_memory+0x1e9/0x860
[  221.922141]  ? oom_killer_disable+0x210/0x210
[  221.922142]  mem_cgroup_out_of_memory+0x198/0x1c0
[  221.922143]  ? mem_cgroup_count_precharge_pte_range+0x250/0x250
[  221.922144]  try_charge+0xa9b/0xc50
[  221.922145]  ? arch_stack_walk+0x9e/0xf0
[  221.922146]  ? memory_high_write+0x230/0x230
[  221.922146]  ? avc_has_extended_perms+0x830/0x830
[  221.922147]  ? stack_trace_save+0x94/0xc0
[  221.922148]  ? stack_trace_consume_entry+0x90/0x90
[  221.922149]  __memcg_kmem_charge+0x73/0x120
[  221.922150]  ? cred_has_capability+0x10f/0x200
[  221.922151]  ? mem_cgroup_can_attach+0x260/0x260
[  221.922152]  ? selinux_sb_eat_lsm_opts+0x2f0/0x2f0
[  221.922153]  ? obj_cgroup_charge+0x16b/0x220
[  221.922154]  ? kmem_cache_alloc+0x78/0x4c0
[  221.922155]  obj_cgroup_charge+0x122/0x220
[  221.922156]  ? vm_area_alloc+0x20/0x90
[  221.922156]  kmem_cache_alloc+0x78/0x4c0
[  221.922157]  vm_area_alloc+0x20/0x90
[  221.922158]  mmap_region+0x3ed/0x9a0
[  221.922159]  ? cap_mmap_addr+0x1d/0x80
[  221.922160]  do_mmap+0x3ee/0x720
[  221.922161]  vm_mmap_pgoff+0x16a/0x1c0
[  221.922162]  ? randomize_stack_top+0x90/0x90
[  221.922163]  ? copy_page_range+0x1980/0x1980
[  221.922163]  ksys_mmap_pgoff+0xab/0x350
[  221.922164]  ? find_mergeable_anon_vma+0x110/0x110
[  221.922165]  ? __audit_syscall_entry+0x1a6/0x1e0
[  221.922166]  __x64_sys_mmap+0x8d/0xb0
[  221.922167]  do_syscall_64+0x38/0x50
[  221.922168]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  221.922169] RIP: 0033:0x7fe8f5e75103
[  221.922172] Code: 54 41 89 d4 55 48 89 fd 53 4c 89 cb 48 85 ff 74
56 49 89 d9 45 89 f8 45 89 f2 44 89 e2 4c 89 ee 48 89 ef b8 09 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 7d 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66
2e 0f
[  221.922173] RSP: 002b:00007ffd38c90198 EFLAGS: 00000246 ORIG_RAX:
0000000000000009
[  221.922175] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fe8f5e75103
[  221.922176] RDX: 0000000000000003 RSI: 0000000000001000 RDI: 0000000000000000
[  221.922178] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  221.922179] R10: 0000000000002022 R11: 0000000000000246 R12: 0000000000000003
[  221.922180] R13: 0000000000001000 R14: 0000000000002022 R15: 0000000000000000
[  221.922181]
[  213O[  221.922182] The buggy address belongs to the variable:
[  221.922183]  clear_seq+0x2d/0x40
[  221.922183]
[  221.922184] Memory state around the buggy address:
[  221.922185]  ffffffffba51da80: 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
[  221.922187]  ffffffffba51db00: 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
[  221.922188] >ffffffffba51db80: f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
00 f9 f9 f9
[  221.922189]                                               ^
[  221.922190]  ffffffffba51dc00: f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
00 f9 f9 f9
[  221.922191]  ffffffffba51dc80: f9 f9 f9 f9 01 f9 f9 f9 f9 f9 f9 f9
00 f9 f9 f9
[  221.922193] ==================================================================
[  221.922194] Disabling lock debugging due to kernel taint
[  221.922196] ,task=memcg_test_1,pid=11280,uid=0
[  221.922205] Memory cgroup out of memory: Killed process 11280

Link: https://lore.kernel.org/r/CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com
Fixes: 4cfc7258f876a7feba673ac ("printk: ringbuffer: add finalization/extension support")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk_ringbuffer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 2493348a1631..24a960a89aa8 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -1125,7 +1125,10 @@ static char *data_realloc(struct printk_ringbuffer *rb,
 
 	/* If the data block does not increase, there is nothing to do. */
 	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
-		blk = to_block(data_ring, blk_lpos->begin);
+		if (wrapped)
+			blk = to_block(data_ring, 0);
+		else
+			blk = to_block(data_ring, blk_lpos->begin);
 		return &blk->data[0];
 	}
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
