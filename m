Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AA468D18D
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Feb 2023 09:39:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85F913CB166
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Feb 2023 09:39:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 224653CB111
 for <ltp@lists.linux.it>; Tue,  7 Feb 2023 09:39:40 +0100 (CET)
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 69C24600188
 for <ltp@lists.linux.it>; Tue,  7 Feb 2023 09:39:39 +0100 (CET)
Received: by mail-vs1-xe32.google.com with SMTP id z22so1528689vsq.11
 for <ltp@lists.linux.it>; Tue, 07 Feb 2023 00:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5+6qB4vlKVB5tLtNNBRw/IQ+8WVih8Pl31Jj1D+xa3Q=;
 b=S9kUObvgd9FZN/OazSAdZ8+r2xQT7tTuIX+3wXSCIxslvcvjkhzTwHNuzL7As6C957
 KnxA56ooN0HXwzZRqAu1o8G0hu7Uk/eX5kUfQWkwYHlI39PT1mA4nBYDcNo/JiOPH2DL
 LYNPLsK1H+v1AdZGT3lrXK9UV2GyI60pzN4SJp2z6/jEpjo2FctGlBv94Kp3PbKu446y
 UQXEeEL9HELjjoCTD2ws1bWMFEwjcAGOQf9Rp1utwuPR1qPEyHA0pow/5nzNE3Hxu75V
 kJmB790THEZYbSXMFX4yLcrB1pX9MeldngVUPmiULTTWfbCiNRTjEmjl//GpQZzm79ja
 a07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5+6qB4vlKVB5tLtNNBRw/IQ+8WVih8Pl31Jj1D+xa3Q=;
 b=ZxxyIIeiHvTFpiJU8l37yZLrq6YSIZHxEe5YV/0Zo7EUKg7ezePdmfKIP8w7CQerBQ
 lzXMw9YOsmt8wrrDdY75x7v0Jybyhb2+MHAjiRINlYTbrl/VOng4JPbajh+/SeLHu1Q7
 0iyMJSiRIEWocEO0FfkIDSWUy/Bu3nc4TVvr3+zagSI98MYn5c6ez3YLOJiLmgRZTpul
 lFbiVY1BLiK+rG8sY4Vnvob0AHAogbjy/AGcuVzXzLGQJVDe2C8bZL+2w3LiOrW9C2Fi
 MAZZcSBWg0HDuLu1iMXAuQluRTGTht2xiqRpOznSZKTnMa2wVVCIG8hHLj+yZ3hl+3dk
 7tDw==
X-Gm-Message-State: AO0yUKV29UMAPq+Co+GH35deu3zQi/H4mlX5JKII/ZRVmcbWhVDZjfbe
 Al2rYmoclSmam5FGb32+N3Gn5RLnIRdEjcCvDPimpw==
X-Google-Smtp-Source: AK7set8QNiwhOZR4JO/wj7gNPzUgw2f6N0NhhqQSYu2PMqQ694WKwQkbHH3t5+/F42OzNjs38vSo3X1nbLt67tocAgc=
X-Received: by 2002:a67:e186:0:b0:3f7:528b:d25f with SMTP id
 e6-20020a67e186000000b003f7528bd25fmr564683vsl.9.1675759178010; Tue, 07 Feb
 2023 00:39:38 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 7 Feb 2023 14:09:27 +0530
Message-ID: <CA+G9fYvAURcTwqyGwoTpxAOR0EDTbU6a71d5z74R4Wv-qT02OQ@mail.gmail.com>
To: open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 lkft-triage@lists.linaro.org, 
 linux-mm <linux-mm@kvack.org>, LTP List <ltp@lists.linux.it>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] LTP: preadv03: WARNING: CPU: 0 PID: 101250 at mm/gup.c:2121
 is_valid_gup_args (mm/gup.c:2121 (discriminator 1))
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
Cc: David Howells <dhowells@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Following test regressions noticed on Linux next-20230207.
LTP syscalls pwritev03 and preadv03 failed.
The tests use external mounted SSD drives for creating tmp files.

Regressions found on arm64 juno-r2 and x86:
  - ltp-syscalls/pwritev03
  - ltp-syscalls/preadv03
  - ltp-syscalls/pwritev03_64
  - ltp-syscalls/preadv03_64

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Crash log:
[  627.667111] loop0: detected capacity change from 0 to 524288
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:1524: TINFO: Timeout per run is 0h 05m 00s
tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
tst_supported_fs_types.c:51: TINF[  627.733224] /dev/zero: Can't open blockdev
O: mkfs.ext2 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
tst_supported_fs_types.c:51: TINF[  627.767886] /dev/zero: Can't open blockdev
O: mkfs.ext3 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:115: TINFO: Filesystem xfs is not supported
tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:47: TINFO: mkfs.btrfs does not exist
tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
tst_supported_fs_types.c:47: TINFO: mkfs.vfat does not exist
tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:115: TINFO: Filesystem ntfs is not supported
tst_supported_fs_types.c:156: TINFO: Skipping tmpfs as requested by the test
tst_test.c:1597: TINFO: Testing on ext2
tst_test.c:1062: TINFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.46.5 (30-Dec-2021)
[  628.174542] ext2 filesystem being mounted at
/scratch/ltp-VAWW7MRdVP/pre9CETnZ/mntpoint supports timestamps until
2038 (0x7fffffff)
preadv03.c:102: TINFO: Using block size 512
preadv03.c:87: TPASS: preadv(O_DIRECT) read 512 bytes successfully
with content 'a' expectedly
preadv03.c:87: TPASS: preadv(O_DIRECT) read 512 bytes successfully
with content 'a' expectedly
preadv03.c:87: TPASS: preadv(O_DIRECT) read 512 bytes successfully
with content 'b' expectedly
tst_test.c:1597: TINFO: Testing on ext3
tst_test.c:1062: TINFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
mke2fs 1.46.5 (30-Dec-2021)
[  628.475714] EXT4-fs (loop0): mounting ext3 file system using the
ext4 subsystem
[  628.494219] EXT4-fs (loop0): mounted filesystem
9bb01ff0-cd35-41e2-8e7a-fc68c05ab15e with ordered data mode. Quota
mode: none.
preadv03.c:102: TINFO: Using block size 512
[  628.513685] ------------[ cut here ]------------
[  628.518327] WARNING: CPU: 0 PID: 101250 at mm/gup.c:2121
is_valid_gup_args+0x98/0xe8
[  628.526105] Modules linked in: tun overlay btrfs blake2b_generic
libcrc32c xor xor_neon raid6_pq zstd_compress bluetooth cfg80211
rfkill tda998x hdlcd cec drm_dma_helper onboard_usb_hub drm_kms_helper
crct10dif_ce fuse drm
[  628.545975] CPU: 0 PID: 101250 Comm: preadv03 Not tainted
6.2.0-rc7-next-20230207 #1
[  628.553737] Hardware name: ARM Juno development board (r2) (DT)
[  628.559667] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  628.566646] pc : is_valid_gup_args+0x98/0xe8
[  628.570927] lr : pin_user_pages_fast+0x44/0x88
[  628.575382] sp : ffff80000bea38f0
[  628.578700] x29: ffff80000bea38f0 x28: ffff80000bea3b78 x27: ffff80000bea3a40
[  628.585864] x26: 0000000000000001 x25: 00000000ffffffff x24: 0000000000000004
[  628.593025] x23: 0000000000000c00 x22: ffff80000bea3a38 x21: 0000000000000001
[  628.600187] x20: 000000003ae0b000 x19: ffff000840c3db98 x18: 0000000000000000
[  628.607348] x17: 0000000000000104 x16: 0000000000000103 x15: 0000000000000000
[  628.614509] x14: 0000000000000000 x13: f9fdffffffffffff x12: ffff00082225eff8
[  628.621671] x11: 0000000000000800 x10: ffff00082aa45000 x9 : ffff8000082fa6bc
[  628.628832] x8 : ffff80000bea38d8 x7 : 0000000000000000 x6 : 00000000004c2800
[  628.635993] x5 : 0000000000040000 x4 : 0000000000040000 x3 : ffff80000bea392c
[  628.643155] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000840c3db98
[  628.650317] Call trace:
[  628.652764]  is_valid_gup_args+0x98/0xe8
[  628.656696]  iov_iter_extract_pages+0xd4/0x648
[  628.661152]  bio_iov_iter_get_pages+0xb0/0x470
[  628.665612]  iomap_dio_bio_iter+0x240/0x498
[  628.669808]  __iomap_dio_rw+0x438/0x768
[  628.673654]  iomap_dio_rw+0x18/0x58
[  628.677152]  ext4_file_write_iter+0x3ec/0x7e0
[  628.681526]  vfs_write+0x2b4/0x358
[  628.684936]  ksys_write+0x70/0x108
[  628.688345]  __arm64_sys_write+0x24/0x38
[  628.692277]  invoke_syscall+0x50/0x128
[  628.696040]  el0_svc_common.constprop.0+0x104/0x130
[  628.700934]  do_el0_svc+0x44/0xb8
[  628.704260]  el0_svc+0x30/0x98
[  628.707326]  el0t_64_sync_handler+0xbc/0x138
[  628.711608]  el0t_64_sync+0x190/0x198
[  628.715281] ---[ end trace 0000000000000000 ]---
preadv03.c:111: TBROK: write(3,0x3ae0bc00,512) failed: EINVAL (22)
[  628.727712] EXT4-fs (loop0): unmounting filesystem
9bb01ff0-cd35-41e2-8e7a-fc68c05ab15e.

Summary:
passed   3
failed   0
broken   1

The decode stacktrace on arm64:
---------------------------
[  628.518327] WARNING: CPU: 0 PID: 101250 at mm/gup.c:2121
is_valid_gup_args (mm/gup.c:2121 (discriminator 1))
[  628.526105] Modules linked in: tun overlay btrfs blake2b_generic
libcrc32c xor xor_neon raid6_pq zstd_compress bluetooth cfg80211
rfkill tda998x hdlcd cec drm_dma_helper onboard_usb_hub drm_kms_helper
crct10dif_ce fuse drm
[  628.545975] CPU: 0 PID: 101250 Comm: preadv03 Not tainted
6.2.0-rc7-next-20230207 #1
[  628.553737] Hardware name: ARM Juno development board (r2) (DT)
[  628.559667] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  628.566646] pc : is_valid_gup_args (mm/gup.c:2121 (discriminator 1))
[  628.570927] lr : pin_user_pages_fast (mm/gup.c:3089)
[  628.575382] sp : ffff80000bea38f0
[  628.578700] x29: ffff80000bea38f0 x28: ffff80000bea3b78 x27: ffff80000bea3a40
[  628.585864] x26: 0000000000000001 x25: 00000000ffffffff x24: 0000000000000004
[  628.593025] x23: 0000000000000c00 x22: ffff80000bea3a38 x21: 0000000000000001
[  628.600187] x20: 000000003ae0b000 x19: ffff000840c3db98 x18: 0000000000000000
[  628.607348] x17: 0000000000000104 x16: 0000000000000103 x15: 0000000000000000
[  628.614509] x14: 0000000000000000 x13: f9fdffffffffffff x12: ffff00082225eff8
[  628.621671] x11: 0000000000000800 x10: ffff00082aa45000 x9 : ffff8000082fa6bc
[  628.628832] x8 : ffff80000bea38d8 x7 : 0000000000000000 x6 : 00000000004c2800
[  628.635993] x5 : 0000000000040000 x4 : 0000000000040000 x3 : ffff80000bea392c
[  628.643155] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000840c3db98
[  628.650317] Call trace:
[  628.652764] is_valid_gup_args (mm/gup.c:2121 (discriminator 1))
[  628.656696] iov_iter_extract_pages (lib/iov_iter.c:2161 lib/iov_iter.c:2229)
[  628.661152] bio_iov_iter_get_pages (block/bio.c:1267
block/bio.c:1340 block/bio.c:1327)
[  628.665612] iomap_dio_bio_iter (fs/iomap/direct-io.c:323)
[  628.669808] __iomap_dio_rw (fs/iomap/direct-io.c:436
fs/iomap/direct-io.c:594)
[  628.673654] iomap_dio_rw (include/linux/err.h:41 fs/iomap/direct-io.c:684)
[  628.677152] ext4_file_write_iter (fs/ext4/file.c:591 fs/ext4/file.c:698)
[  628.681526] vfs_write (include/linux/fs.h:1851 fs/read_write.c:491
fs/read_write.c:584)
[  628.684936] ksys_write (fs/read_write.c:637)
[  628.688345] __arm64_sys_write (fs/read_write.c:646)
[  628.692277] invoke_syscall (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/syscall.c:57)
[  628.696040] el0_svc_common.constprop.0 (arch/arm64/kernel/syscall.c:149)
[  628.700934] do_el0_svc (arch/arm64/kernel/syscall.c:194)
[  628.704260] el0_svc (arch/arm64/include/asm/daifflags.h:28
arch/arm64/kernel/entry-common.c:133
arch/arm64/kernel/entry-common.c:142
arch/arm64/kernel/entry-common.c:638)
[  628.707326] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:656)
[  628.711608] el0t_64_sync (arch/arm64/kernel/entry.S:591)
[  628.715281] ---[ end trace 0000000000000000 ]---


code snippet:
vim mm/gup.c +2121
--

/*
 * Check that the given flags are valid for the exported gup/pup interface, and
 * update them with the required flags that the caller must have set.
 */
static bool is_valid_gup_args(struct page **pages, struct vm_area_struct **vmas,
      int *locked, unsigned int *gup_flags_p,
      unsigned int to_set)
{
unsigned int gup_flags = *gup_flags_p;

/*
* These flags not allowed to be specified externally to the gup
* interfaces:
* - FOLL_PIN/FOLL_TRIED/FOLL_FAST_ONLY are internal only
* - FOLL_REMOTE is internal only and used on follow_page()
* - FOLL_UNLOCKABLE is internal only and used if locked is !NULL
*/
if (WARN_ON_ONCE(gup_flags & (FOLL_PIN | FOLL_TRIED | FOLL_UNLOCKABLE |
      FOLL_REMOTE | FOLL_FAST_ONLY)))
return false;

gup_flags |= to_set;
if (locked) {
/* At the external interface locked must be set */
if (WARN_ON_ONCE(*locked != 1))
return false;

gup_flags |= FOLL_UNLOCKABLE;
}

--

Following config diff found.
 + CONFIG_COMPAT_WARN_32BIT_FILESYSTEM_ACCESS=y

Build details link,
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230207/testrun/14613395/suite/ltp-syscalls/test/preadv03/history/
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230207/testrun/14611722/suite/ltp-syscalls/test/preadv03/details/


metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 49a8133221c71b935f36a7c340c0271c2a9ee2db
  git_describe: next-20230207
  kernel_version: 6.2.0-rc7
  kernel-config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2LOjOyThMioNMuCfF8eJHA6kTyh/config
  artifact-location:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2LOjOyThMioNMuCfF8eJHA6kTyh/
  toolchain: gcc-11


--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
