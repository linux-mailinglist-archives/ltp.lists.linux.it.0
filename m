Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F76AE9FBE
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Jun 2025 16:02:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B26723C2E57
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Jun 2025 16:02:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 118A13C1D56
 for <ltp@lists.linux.it>; Thu, 26 Jun 2025 15:52:57 +0200 (CEST)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 690C0688404
 for <ltp@lists.linux.it>; Thu, 26 Jun 2025 15:52:53 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bSg9t21WzzYQvLr
 for <ltp@lists.linux.it>; Thu, 26 Jun 2025 21:52:50 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 2E8C21A1732
 for <ltp@lists.linux.it>; Thu, 26 Jun 2025 21:52:49 +0800 (CST)
Received: from [10.174.179.80] (unknown [10.174.179.80])
 by APP4 (Coremail) with SMTP id gCh0CgBHq1+rUF1oDavjQg--.29464S3;
 Thu, 26 Jun 2025 21:52:45 +0800 (CST)
Message-ID: <2dbc199b-ef22-4c22-9dbd-5e5876e9f9b4@huaweicloud.com>
Date: Thu, 26 Jun 2025 21:52:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>,
 LTP List <ltp@lists.linux.it>
References: <CA+G9fYsyYQ3ZL4xaSg1-Tt5Evto7Zd+hgNWZEa9cQLbahA1+xg@mail.gmail.com>
Content-Language: en-US
From: Zhang Yi <yi.zhang@huaweicloud.com>
In-Reply-To: <CA+G9fYsyYQ3ZL4xaSg1-Tt5Evto7Zd+hgNWZEa9cQLbahA1+xg@mail.gmail.com>
X-CM-TRANSID: gCh0CgBHq1+rUF1oDavjQg--.29464S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr15Kr43tr4xAFWrXr1DWrg_yoW7Kw4xpF
 yaqFn8KrW8Zry8JFWkZ3WIvryUtr4qyFyxJrnFqr1rG3W2vF18JF1Ig34rtr9rX34Uu34I
 vr4qk34kKr10y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
 6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
 14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
 ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
 0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1
 7KsUUUUUU==
X-CM-SenderInfo: d1lo6xhdqjqx5xdzvxpfor3voofrz/
X-Spam-Status: No, score=0.0 required=7.0 tests=DMARC_MISSING,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 26 Jun 2025 16:02:42 +0200
Subject: Re: [LTP] next-20250626: WARNING fs jbd2 transaction.c
 start_this_handle with ARM64_64K_PAGES
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
Cc: Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi, Naresh!

On 2025/6/26 20:31, Naresh Kamboju wrote:
> Regressions noticed on arm64 devices while running LTP syscalls mmap16
> test case on the Linux next-20250616..next-20250626 with the extra build
> config fragment CONFIG_ARM64_64K_PAGES=y the kernel warning noticed.
> 
> Not reproducible with 4K page size.
> 
> Test environments:
> - Dragonboard-410c
> - Juno-r2
> - rk3399-rock-pi-4b
> - qemu-arm64
> 
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
> 
> Test regression: next-20250626 LTP mmap16 WARNING fs jbd2
> transaction.c start_this_handle
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Thank you for the report. The block size for this test is 1 KB, so I
suspect this is the issue with insufficient journal credits that we
are going to resolve.

https://lore.kernel.org/linux-ext4/20250611111625.1668035-1-yi.zhang@huaweicloud.com/

Thanks,
Yi.

> 
> ## Test log
> <6>[   89.498969] loop0: detected capacity change from 0 to 614400
> <3>[   89.609561] operation not supported error, dev loop0, sector
> 20352 op 0x9:(WRITE_ZEROES) flags 0x20000800 phys_seg 0 prio class 0
> <6>[   89.707795] EXT4-fs (loop0): mounted filesystem
> 6786a191-5e0d-472b-8bce-4714e1a4fb44 r/w with ordered data mode. Quota
> mode: none.
> <3>[   90.023985] JBD2: kworker/u8:2 wants too many credits
> credits:416 rsv_credits:21 max:334
> <4>[   90.024973] ------------[ cut here ]------------
> <4>[ 90.025062] WARNING: fs/jbd2/transaction.c:334 at
> start_this_handle+0x4c0/0x4e0, CPU#0: 2/42
> <4>[   90.026661] Modules linked in: btrfs blake2b_generic xor
> xor_neon raid6_pq zstd_compress sm3_ce sha3_ce fuse drm backlight
> ip_tables x_tables
> <4>[   90.027952] CPU: 0 UID: 0 PID: 42 Comm: kworker/u8:2 Not tainted
> 6.16.0-rc3-next-20250626 #1 PREEMPT
> <4>[   90.029043] Hardware name: linux,dummy-virt (DT)
> <4>[   90.029524] Workqueue: writeback wb_workfn (flush-7:0)
> <4>[   90.030050] pstate: 63402009 (nZCv daif +PAN -UAO +TCO +DIT
> -SSBS BTYPE=--)
> <4>[ 90.030311] pc : start_this_handle (fs/jbd2/transaction.c:334
> (discriminator 1))
> <4>[ 90.030481] lr : start_this_handle (fs/jbd2/transaction.c:334
> (discriminator 1))
> <4>[   90.030656] sp : ffffc000805cb650
> <4>[   90.030785] x29: ffffc000805cb690 x28: fff00000dd1f5000 x27:
> ffffde2ec0272000
> <4>[   90.031097] x26: 00000000000001a0 x25: 0000000000000015 x24:
> 0000000000000002
> <4>[   90.031360] x23: 0000000000000015 x22: 0000000000000c40 x21:
> 0000000000000008
> <4>[   90.031618] x20: fff00000c231da78 x19: fff00000c231da78 x18:
> 0000000000000000
> <4>[   90.031875] x17: 0000000000000000 x16: 0000000000000000 x15:
> 0000000000000000
> <4>[   90.032859] x14: 0000000000000000 x13: 00000000ffffffff x12:
> 0000000000000000
> <4>[   90.033225] x11: 0000000000000000 x10: ffffde2ebfba8bd0 x9 :
> ffffde2ebd34e944
> <4>[   90.033607] x8 : ffffc000805cb278 x7 : 0000000000000000 x6 :
> 0000000000000001
> <4>[   90.033971] x5 : ffffde2ebfb29000 x4 : ffffde2ebfb293d0 x3 :
> 0000000000000000
> <4>[   90.034294] x2 : 0000000000000000 x1 : fff00000c04dc080 x0 :
> 000000000000004c
> <4>[   90.034772] Call trace:
> <4>[ 90.035068] start_this_handle (fs/jbd2/transaction.c:334
> (discriminator 1)) (P)
> <4>[ 90.035366] jbd2__journal_start (fs/jbd2/transaction.c:501)
> <4>[ 90.035586] __ext4_journal_start_sb (fs/ext4/ext4_jbd2.c:117)
> <4>[ 90.035807] ext4_do_writepages (fs/ext4/ext4_jbd2.h:242
> fs/ext4/inode.c:2846)
> <4>[ 90.036004] ext4_writepages (fs/ext4/inode.c:2953)
> <4>[ 90.036233] do_writepages (mm/page-writeback.c:2636)
> <4>[ 90.036406] __writeback_single_inode (fs/fs-writeback.c:1680)
> <4>[ 90.036616] writeback_sb_inodes (fs/fs-writeback.c:1978)
> <4>[ 90.036891] wb_writeback (fs/fs-writeback.c:2156)
> <4>[ 90.037122] wb_workfn (fs/fs-writeback.c:2303 (discriminator 1)
> fs/fs-writeback.c:2343 (discriminator 1))
> <4>[ 90.037318] process_one_work (kernel/workqueue.c:3244)
> <4>[ 90.037517] worker_thread (kernel/workqueue.c:3316 (discriminator
> 2) kernel/workqueue.c:3403 (discriminator 2))
> <4>[ 90.037752] kthread (kernel/kthread.c:463)
> <4>[ 90.037903] ret_from_fork (arch/arm64/kernel/entry.S:863)
> <4>[   90.038217] ---[ end trace 0000000000000000 ]---
> <2>[   90.039950] EXT4-fs (loop0): ext4_do_writepages: jbd2_start:
> 9223372036854775807 pages, ino 14; err -28
> <3>[   90.040291] JBD2: kworker/u8:2 wants too many credits
> credits:416 rsv_credits:21 max:334
> <4>[   90.040374] ------------[ cut here ]------------
> <4>[ 90.040386] WARNING: fs/jbd2/transaction.c:334 at
> start_this_handle+0x4c0/0x4e0, CPU#1: 2/42
> 
> 
> ## Source
> * Kernel version: 6.16.0-rc3-next-20250626
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: ecb259c4f70dd5c83907809f45bf4dc6869961d7
> * Git describe: 6.16.0-rc3-next-20250626
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250626/
> * Architectures: arm64
> * Toolchains: gcc-13
> * Kconfigs: gcc-13-lkftconfig-64k_page_size
> 
> ## Build arm64
> * Test log: https://qa-reports.linaro.org/api/testruns/28894530/log_file/
> * Test LAVA log 1:
> https://lkft.validation.linaro.org/scheduler/job/8331353#L6841
> * Test LAVA log 2:
> https://lkft.validation.linaro.org/scheduler/job/8331352#L8854
> * Test details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250626/log-parser-test/exception-warning-fsjbd2transaction-at-start_this_handle/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2z2V7LhiJecGzINkU7ObVQTwoR1/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2z2V7LhiJecGzINkU7ObVQTwoR1/config
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
