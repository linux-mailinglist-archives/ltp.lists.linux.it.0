Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0228DF57
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 12:49:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E96BD3C3284
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 12:49:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 82A783C2494
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 12:49:32 +0200 (CEST)
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 97D171400544
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 12:49:31 +0200 (CEST)
Received: by mail-io1-xd42.google.com with SMTP id k25so4388435ioh.7
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 03:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=HgHUYfl/RqdxqpyW+AYcy5yFjZFOcQH7eO1Foilj7+M=;
 b=haUlUbdFu1nX6ivBcGnXd/sIrfe2L1qsMdVWShpufVqQ7p0owplfL1Z4v0KQPG/Xjj
 diCS/zQrPg/IYK8pftdkIKiG5kxSati1CEPX0Kw62Dsjh5pQKfz2xZjzGNteU6vLXX0T
 IWL1Ro/r26qkZxVYM0fCAy2LIzBgPQqNJ1siPtdSUkiwLUVcRVfuRn5tQDa4mr+FHYaT
 GBWXd/qOx2OkpyjdaqnRTTmS6DnQlcmzIen8DllsRNOO6d/okNB9NncyQP9PQ/N1H7cy
 7ZqgoXmhVmF1MWKZvpbMX+S/imATcAifojuGbYmTGjsEGn8Vmv+6JVe5wCD+KKmBdurU
 heqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=HgHUYfl/RqdxqpyW+AYcy5yFjZFOcQH7eO1Foilj7+M=;
 b=A2P3binztjWl0cQdhTMwYHv1R5vY9tDXArwIzfE1HRk5VE0sBQqTsmOXt48Kj7iFsY
 S3xG0ZlIRE5mQvYbRpxsCcQ1VNH8thFXPgGpDGFP6ZXwgCgqwvGEdkjdaB6EpkLkoCzA
 BiTYo4lvtfsUxT1R9K9exRndb7uhqUePiAq3BmTkBQZZ2UZskL5lsRbMDs8EGhvsWcdA
 mhc8VXLho7Z1YFwKcSa910uyqXEPovK6n3HQuC8gWQjXtCe2UyDRMXWOcYF4hfgW0/FS
 JTQ9zI6+/mQv5t+jyD9QD3aG8NVRx13uKzOWONJAbSd8B7dHj3zKFQXRYJFXTinYwecd
 gX3Q==
X-Gm-Message-State: AOAM532N+TbT/WXSS02eS+tB4B0M3y14O4+f4oCvgfiG7N6iPBa0g13y
 ItyhDDFyoVchgLmRx81js2eZD7/bOTdDsZrrDIvyxA==
X-Google-Smtp-Source: ABdhPJxrp5zVb72tEMqowWicQw1OH+2Aa2RXOawH6E7+WcmWA+b7TR1yip3sSjUy6V20MblnkIzEHslZQ53oqAm9cys=
X-Received: by 2002:a02:c785:: with SMTP id n5mr2574048jao.128.1602672570049; 
 Wed, 14 Oct 2020 03:49:30 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 14 Oct 2020 16:19:18 +0530
Message-ID: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, 
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
 LTP List <ltp@lists.linux.it>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] BUG: KASAN: global-out-of-bounds in vprintk_store on x86_64
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
 John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Steven Rostedt <rostedt@goodmis.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

While testing LTP controllers testing on x86_64 KASAN enabled linux
next 20201013 tag
kernel this kernel BUG noticed. The oom-killer log also noticed while
running tests.

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git commit: f2fb1afc57304f9dd68c20a08270e287470af2eb
  git describe: next-20201013
  make_kernelversion: 5.9.0
  kernel-config:
https://builds.tuxbuild.com/TXP6cqokP8BCYJrv7zf6kw/kernel.config


steps to reproduce:
-------------------------
# cd /opt/ltp
# ./runltp  -f controllers

Crash log:
--------------
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
(memcg_test_1) total-vm:4124kB, anon-rss:72kB, file-rss:0kB,
shmem-rss:0kB, UID:0 pgtables:48kB oom_score_adj:0
[  221.922509] memcg_test_1 invoked oom-killer:
gfp_mask=0xcc0(GFP_KERNEL), order=0, oom_score_adj=0
[  222.885676] CPU: 2 PID: 11283 Comm: memcg_test_1 Tainted: G    B
         5.9.0-next-20201013 #1
[  222.885678] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.0b 07/27/2017
[  222.885679] Call Trace:
[  222.885683]  dump_stack+0xa4/0xd9
[  222.885686]  dump_header+0x8f/0x3bf
[  222.885689]  oom_kill_process.cold+0xb/0x10
[  222.885692]  out_of_memory+0x1e9/0x860
[  222.885697]  ? oom_killer_disable+0x210/0x210
[  222.923728]  mem_cgroup_out_of_memory+0x198/0x1c0
[  222.923731]  ? mem_cgroup_count_precharge_pte_range+0x250/0x250


Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

full test details and log link,
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201013/testrun/3302398/suite/linux-log-parser/tests/

-- 
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
