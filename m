Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB1D17A253
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 10:38:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CB7F3C64F1
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 10:38:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B0AA03C64D8
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 10:38:38 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E79621402C51
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 10:38:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EBC28B145;
 Thu,  5 Mar 2020 09:38:34 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id CAF521E0D46; Thu,  5 Mar 2020 10:38:32 +0100 (CET)
Date: Thu, 5 Mar 2020 10:38:32 +0100
From: Jan Kara <jack@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200305093832.GG21048@quack2.suse.cz>
References: <CA+G9fYs==eMEmY_OpdhyCHO_1Z5f_M8CAQQTh-AOf5xAvBHKAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYs==eMEmY_OpdhyCHO_1Z5f_M8CAQQTh-AOf5xAvBHKAQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] fs/buffer.c: WARNING: alloc_page_buffers while mke2fs
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
Cc: ak@linux.intel.com, Jan Kara <jack@suse.cz>, jlayton@redhat.com,
 lkft-triage@lists.linaro.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, tim.c.chen@linux.intel.com,
 LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>,
 willy@infradead.org, Michal Hocko <mhocko@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue 03-03-20 14:15:24, Naresh Kamboju wrote:
> [Sorry for the spam]
> 
> Linux-next 5.6.0-rc3-next-20200302 running on arm64 juno-r2 device while
> running LTP syscalls chown tests.
> 
> Suspecting commits are (did not do git bisect),
> b1473d5f3d0 fs/buffer.c: dump more info for __getblk_gfp() stall problem
> b10a7ae6565 fs/buffer.c: add debug print for __getblk_gfp() stall problem

These are almost certainly unrelated. If I'm looking right, the warning is
coming from memalloc_use_memcg() called from alloc_page_buffers()
complaining that memcg to charge is already set. But I don't see how that
would be possible (at least with today's linux-next). Can you reproduce the
problem with today's linux-next?

								Honza
> 
> steps to reproduce:
> -------------------
>   - Boot kernel Linux-next 5.6.0-rc3-next-20200302 on arm64 device
>   - cd /opt/ltp
>   - ./runltp -s chown -I 10 -d /scratch -p -q
> 
> * /scratch is a mounted hard drive for LTP test files.
> 
> chown03_16    2  TCONF  :
> /usr/src/debug/ltp/20190930-r0/git/testcases/kernel/syscalls/chown/../utils/compat_16.h:168:
> Remaining cases not appropriate for configuration
> mke2fs 1.43.8 (1-Jan-2018)
> [   97.998689] ------------[ cut here ]------------
> [   98.003346] WARNING: CPU: 2 PID: 340 at
> include/linux/sched/mm.h:323 alloc_page_buffers+0x210/0x288
> [   98.012409] Modules linked in: rfkill tda998x cec drm_kms_helper
> drm crct10dif_ce fuse
> [   98.020369] CPU: 2 PID: 340 Comm: kworker/u12:6 Not tainted
> 5.6.0-rc3-next-20200302 #1
> [   98.028302] Hardware name: ARM Juno development board (r2) (DT)
> [   98.034242] Workqueue: loop0 loop_workfn
> [   98.038176] pstate: 60000005 (nZCv daif -PAN -UAO)
> [   98.042980] pc : alloc_page_buffers+0x210/0x288
> [   98.047522] lr : alloc_page_buffers+0x50/0x288
> [   98.051972] sp : ffff000904a76c00
> [   98.055291] x29: ffff000904a76c00 x28: ffff000900126000
> [   98.060617] x27: ffff0008e0ad0888 x26: ffffffe001ff3908
> [   98.065941] x25: 0000000000408c40 x24: ffffffe001ff3900
> [   98.071265] x23: 0000000000000401 x22: ffff0008e0ad0780
> [   98.076589] x21: 0000000000001000 x20: 0000000000000000
> [   98.081913] x19: ffff0009022fd980 x18: 0000000000000000
> [   98.087236] x17: 0000000000000000 x16: 0000000000000000
> [   98.092559] x15: 0000000000000000 x14: ffffa00010468954
> [   98.097883] x13: ffffa00010259490 x12: ffff9ffc003fe727
> [   98.103207] x11: 1ffffffc003fe726 x10: ffff9ffc003fe726
> [   98.108531] x9 : dfffa00000000000 x8 : 0000000000000001
> [   98.113855] x7 : ffffffe001ff3937 x6 : ffffffe001ff3934
> [   98.119179] x5 : 00006003ffc018da x4 : 000000000000002d
> [   98.124503] x3 : dfffa00000000000 x2 : 0000000000000007
> [   98.129826] x1 : ffff0009022fe300 x0 : ffff000900126000
> [   98.135150] Call trace:
> [   98.137605]  alloc_page_buffers+0x210/0x288
> [   98.141799]  __getblk_gfp+0x1d4/0x400
> [   98.145475]  ext4_read_block_bitmap_nowait+0x148/0xbc8
> [   98.150628]  ext4_mb_init_cache+0x25c/0x9b0
> [   98.154821]  ext4_mb_init_group+0x270/0x390
> [   98.159014]  ext4_mb_good_group+0x264/0x270
> [   98.163208]  ext4_mb_regular_allocator+0x480/0x798
> [   98.168011]  ext4_mb_new_blocks+0x958/0x10f8
> [   98.172294]  ext4_ext_map_blocks+0xec8/0x1618
> [   98.176660]  ext4_map_blocks+0x1b8/0x8a0
> [   98.180592]  ext4_writepages+0x830/0xf10
> [   98.184523]  do_writepages+0xb4/0x198
> [   98.188195]  __filemap_fdatawrite_range+0x170/0x1c8
> [   98.193086]  filemap_write_and_wait_range+0x40/0xb0
> [   98.197974]  ext4_punch_hole+0x4a4/0x660
> [   98.201907]  ext4_fallocate+0x294/0x1190
> [   98.205839]  loop_process_work+0x690/0x1100
> [   98.210032]  loop_workfn+0x2c/0x110
> [   98.213529]  process_one_work+0x3e0/0x648
> [   98.217546]  worker_thread+0x70/0x670
> [   98.221217]  kthread+0x1b8/0x1c0
> [   98.224452]  ret_from_fork+0x10/0x18
> [   98.228033] ---[ end trace 75d39f61d945043e ]---
> chown04     0  TINFO  :  Using test device LTP_DEV='/dev/loop0'
> chown04     0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts=''
> chown04     1  TPASS  :  chown failed: TEST_ERRNO=EPERM(1): Operation
> not permitted
> chown04     2  TPASS  :  chown failed: TEST_ERRNO=EACCES(13): Permission denied
> chown04     3  TPASS  :  chown failed: TEST_ERRNO=EFAULT(14): Bad address
> chown04     4  TPASS  :  chown failed: TEST_ERRNO=ENAMETOOLONG(36):
> File name too long
> chown04     5  TPASS  :  chown failed: TEST_ERRNO=ENOENT(2): No such
> file or directory
> chown04     6  TPASS  :  chown failed: TEST_ERRNO=ENOTDIR(20): Not a directory
> chown04     7  TPASS  :  chown failed: TEST_ERRNO=ELOOP(40): Too many
> levels of symbolic links
> chown04     8  TPASS  :  chown failed: TEST_ERRNO=EROFS(30): Read-only
> file system
> mke2fs 1.43.8 (1-Jan-2018)
> chown04_16    0  TINFO  :  Using test device LTP_DEV='/dev/loop0'
> chown04_16    0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts=''
> chown04_16    1  TCONF  :
> /usr/src/debug/ltp/20190930-r0/git/testcases/kernel/syscalls/chown/../utils/compat_16.h:168:
> 16-bit version of chown() is not supported on your platform
> chown04_16    2  TCONF  :
> /usr/src/debug/ltp/20190930-r0/git/testcases/kernel/syscalls/chown/../utils/compat_16.h:168:
> Remaining cases not appropriate for configuration
> 
> Ref:
> https://lkft.validation.linaro.org/scheduler/job/1262252#L2152
> https://lkft.validation.linaro.org/scheduler/job/1262374#L1313
> https://lkft.validation.linaro.org/scheduler/job/1262121#L2153
> https://lkft.validation.linaro.org/scheduler/job/1262105#L2116
> 
> -- 
> Linaro LKFT
> https://lkft.linaro.org
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
