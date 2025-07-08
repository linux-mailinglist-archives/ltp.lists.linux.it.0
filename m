Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF1CAFCB1F
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jul 2025 14:58:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4ED873CA33B
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jul 2025 14:58:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5734A3CA1ED
 for <ltp@lists.linux.it>; Tue,  8 Jul 2025 14:58:36 +0200 (CEST)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 79CDE1400DB2
 for <ltp@lists.linux.it>; Tue,  8 Jul 2025 14:58:35 +0200 (CEST)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b31d489a76dso3550248a12.1
 for <ltp@lists.linux.it>; Tue, 08 Jul 2025 05:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751979513; x=1752584313; darn=lists.linux.it;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+X7a8SwyNPxgnTjPQjoQvFIKm71E0lpWMhaVdYWW8Ws=;
 b=wjhBIwjtJe+1/CpwygqD8qU8eJsSbLwe3SRztH+rgo59HGG4zv2UXijOjB95azVi0O
 knia8MThN294LO6hOsLRg0tp0yAG6o8IcshDvGCYAi6uUwWBcCmVxSaZcxj/JmLI9H9I
 o30ZtcxPAxLoAkm7Mfz3r0EjCuqUnYz0oNEWGKoB43IGWin1xrDc7ZgRAoP76UYJ7GOO
 ac7WFF5Nkb0o41JFKwzSFHmm44D4cReE2r8k5xhvcQLrnX8PrVOCa0/ZxRf6Fkv3Iur/
 PQKZzn+ArZAuxijvLHL571N+8Ejjnxph9q9j/9m2JNY9h/OX19uGeFPrningIHtE3iJO
 Q7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751979513; x=1752584313;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+X7a8SwyNPxgnTjPQjoQvFIKm71E0lpWMhaVdYWW8Ws=;
 b=kw/PR78hFrGAHKZzMoQ9zTM8gc6aXtbxhjtGl22RKBlyxJE6GWBYo+v4FZffqrli+5
 a8NU+MwXhZCjqQwt1pYkbUrdGnOTqEaBd7ZNIzmw9Yv7PKNe3HlZcTtnz89ptQD3W+sP
 DwohSyLHjrdpiYlj6alZNyjSnAVyrlzFswyvmFpqbLoJK/IP7VlsCLPL/9WxXVLSaUu4
 wJ4maW9qLIp4vD+Izto3LHXX/Dq2RuSUe4OB6+M0DDLJ+UbmvBf39oLNaH/2xCNjGFGk
 6xH//6Sqfyr7kwePGr5U9IDKyy+l+OGi19EBeCdSs3NeHu9seuPddRtSPQ77VHvpwqin
 oFRQ==
X-Gm-Message-State: AOJu0Ywjs/L5T1ADv1jUX2OucCRZTo7HeDcrR1c2Gu7UmMNfcLtVhi9j
 iajBjxcOBCryRJv6BcJS/13lGlLpzEG6PZIdXgKLbuNPHz+0ii3ctIxLrGcMeJDdVbgfObbnzvr
 KhLTydHVIoRA3TlsUCN7kHpbxonUkQl2DwV4A5NIzOCowuJGpTBymfCA=
X-Gm-Gg: ASbGncso6/cWwqYfh0qYbh470PduWJwHpUGrKBIm0CIz8FIgtSm+/2LuFb+ffQvUOKH
 zJnUqC1GBKBGh+Rui+0qdCjCKA9fJ2PeoGQaJNn6ux07sguGjKTpAXXUzfunf/OLzWs8rvfQfKa
 gFtm33pGvLE+Uh+HXQ1sifZXOvY3gwYIElUzCAMcL+1FgwKkGrecLxFXQhYe6CzG8XiubUFClGN
 g==
X-Google-Smtp-Source: AGHT+IEAroSV9QM2u8Khd5heAl2VGKIwbciV1NozFVDk7m9ivDnulTuum/WrPGnR1hmbsA4sVwMc5gI6C1gsYlXHc2E=
X-Received: by 2002:a17:90b:3c8f:b0:313:1a8c:c2d3 with SMTP id
 98e67ed59e1d1-31aadd8535fmr18954212a91.22.1751979513324; Tue, 08 Jul 2025
 05:58:33 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 8 Jul 2025 18:28:20 +0530
X-Gm-Features: Ac12FXwWrUCbiwerbOClJgpOYjoDYvos-PTDZgR-SJk-i4t_-gCTbszd43doxzs
Message-ID: <CA+G9fYvk9HHE5UJ7cdJHTcY6P5JKnp+_e+sdC5U-ZQFTP9_hqQ@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
 lkft-triage@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
 linux-block <linux-block@vger.kernel.org>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] LTP: syscalls: TWARN ioctl(/dev/loop0, LOOP_SET_STATUS,
 test_dev.img) failed EOPNOTSUPP (95)
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
Cc: Jens Axboe <axboe@kernel.dk>, rbm@suse.com, Arnd Bergmann <arnd@arndb.de>,
 willy@infradead.org, Ben Copeland <benjamin.copeland@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Regressions were observed while testing LTP syscalls cachestat01 and
other related tests on the next-20250702 Linux kernel across several devices.

The issue appears to be related to the inability to configure /dev/loop0
via the LOOP_SET_STATUS ioctl, which returned EOPNOTSUPP
(Operation not supported). This results in a TBROK condition,
causing the test to fail.

Test environments:
- arm64
- qemu-x86_64
- qemu-riscv

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Regressions started from next-20250702 ( next-20250708)
Good: next-20250701
Bad: next-20250702

Test regression: Linux next-20250702 TWARN ioctl(/dev/loop0,
LOOP_SET_STATUS, test_dev.img) failed EOPNOTSUPP (95) TBROK Failed to
acquire device

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log
tst_buffers.c:57: TINFO: Test is using guarded buffers
tst_tmpdir.c:316: TINFO: Using /tmp/LTP_cacQ9AfS0 as tmpdir (tmpfs filesystem)
tst_device.c:98: TINFO: Found free device 0 '/dev/loop0'
tst_device.c:190: TWARN: ioctl(/dev/loop0, LOOP_SET_STATUS,
test_dev.img) failed: EOPNOTSUPP (95)
tst_device.c:362: TBROK: Failed to acquire device


## Source
* Kernel version: 6.16.0-rc4-next-20250702
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 50c8770a42faf8b1c7abe93e7c114337f580a97d
* Git describe: next-20250702
* Project: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250704/testrun/29017637
* Architectures: arm64, x86_64, riscv64.
* Toolchains: gcc-13 and clang-20
* Kconfigs: defconfig+ltp

## Build
* Test log: https://qa-reports.linaro.org/api/testruns/28986655/log_file/
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250702/ltp-syscalls/cachestat01/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250704/testrun/29017637/suite/ltp-syscalls/test/cachestat01/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2zJjY2EmRMul6P0UgjdOm4Ssiqh/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2zJjY2EmRMul6P0UgjdOm4Ssiqh/config

## List of tests
  - cachestat01
  - cachestat04
  - chdir01
  - chmod09
  - close_range01
  - copy_file_range01
  - copy_file_range02
  - creat09
  - fallocate04
  - fallocate05
  - fallocate06
  - fanotify01
  - fanotify05
  - fanotify06
  - fanotify10
  - fanotify13
  - fanotify14
  - fanotify15
  - fanotify16
  - fanotify17
  - fanotify18
  - fanotify19
  - fanotify20
  - fanotify21
  - fanotify22
  - fanotify23
  - fchmodat2_01
  - fdatasync03
  - fgetxattr01
  - fremovexattr01
  - fremovexattr02
  - fsetxattr01
  - fsmount01
  - fsmount02
  - fsopen01
  - fsopen02
  - fspick01
  - fspick02
  - fsskipig01
  - fsskipig02
  - fsskipig03
  - fstatfs01
  - fstatfs01_64
  - fsync01
  - fsync04
  - getdents01
  - getdents02
  - getxattr02
  - getxattr03
  - inotify03
  - ioctl04
  - ioctl05
  - ioctl06
  - ioctl_ficlone02
  - ioctl_fiemap01
  - ioctl_loop01
  - lchown03
  - linkat02
  - listmount01
  - listmount02
  - lremovexattr01
  - lstat03
  - lstat03_64
  - mkdir09
  - mknodat02
  - mmap16
  - mount01
  - mount02
  - mount03
  - mount04
  - mount05
  - mount06
  - mount07
  - mount_setattr01
  - move_mount01
  - move_mount02
  - msync04
  - open_tree01
  - open_tree02
  - prctl06
  - preadv03
  - preadv03_64
  - preadv203
  - preadv203_64
  - pwritev03
  - pwritev03_64
  - quotactl01
  - quotactl04
  - quotactl06
  - quotactl08
  - quotactl09
  - readahead02
  - readdir01
  - rename01
  - rename03
  - rename04
  - rename05
  - rename06
  - rename07
  - rename08
  - rename10
  - rename11
  - rename12
  - rename13
  - rename15
  - renameat01
  - setxattr01
  - stat04
  - stat04_64
  - statfs01
  - statfs01_64
  - statmount01
  - statmount02
  - statmount04
  - statmount05
  - statmount06
  - statmount07
  - statvfs01
  - statx06
  - statx08
  - statx10
  - statx11
  - statx12
  - sync01
  - syncfs01
  - umount01
  - umount02
  - umount03
  - umount2_01
  - umount2_02
  - unlink09
  - utime01
  - utime02
  - utime03
  - utime04
  - utime05
  - utimensat01
  - writev03

--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
