Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A75B58F1B
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Sep 2025 09:27:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92CAA3CDACF
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Sep 2025 09:27:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A4A3D3C073D
 for <ltp@lists.linux.it>; Tue, 16 Sep 2025 09:27:40 +0200 (CEST)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C2F9E600B4D
 for <ltp@lists.linux.it>; Tue, 16 Sep 2025 09:27:39 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-266fa7a0552so16636475ad.3
 for <ltp@lists.linux.it>; Tue, 16 Sep 2025 00:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758007658; x=1758612458; darn=lists.linux.it;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YdzUgBNm+Fykgerb+7FYicUv4mSP6WHZUtexZFjMOI8=;
 b=XbgM7i6JSR+dtvqFAEisCz6w/HpbI7bzMmk4n6o64yGx+zxzgTeYKjTstaoHQgxW2X
 OsrGvDaS2d9W2NesQqyBydo1TBnsDoJdhvX6V985ouyjdflKttSA9EDl3bqHjhMa1OSr
 FbbVB5ZOAIj4AN+mWj5hFstJ3sAm5dEVLFsyprmr7ypt8FKqUtyaRI3MF6Z2I0Kuy84j
 YN6RIlqAbNVgnnGmbMmA2aMbfzvwmIycRNLE6Mrd6k4mSk+elsrG4Jd0mwRLyXl/yH8O
 fhjfRPEPgvy5mbQpNlqevDZYLLLNIQx64lzj7vV0Wef9GBQaXtntISiBtRXjZMG36y9B
 JbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758007658; x=1758612458;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YdzUgBNm+Fykgerb+7FYicUv4mSP6WHZUtexZFjMOI8=;
 b=UsJqMIHRHwTG6QFuSYVW8JMbHFX8QfTqlGqPxZKCs1W9C4rSJGQDETHZe9Jy25M/mk
 ycPj2OQahwHqi33WbGJSdTmkslQvDsfG3PfVeyzcKrD8NepzRlxH8qSERAOqF8rLjU5n
 wPnNZfTjxW9idjti9+sUTZUXNcHB093VytXWNDiGeSc6u2NRACjNg2yq77RggLEmt8C2
 Bj7xd72vN/eXqmYlsrWawoEcX8hACH2tjjen6qS+Ts+cbzsi1LYUwMLOMAntkU5QKb89
 GH3QYdsPhtDnmJavJSjphTXwQJeUr+aoLew77jBGEBk2RnNgxeIsrdCAhEHDqH1YrWgq
 qQaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmuBTJN2q2Fkhadc0M5c0vPowb9qXPJXfM8LVUtggP2WV/Zg7GVZHnBMq+9lU1HDjRybA=@lists.linux.it
X-Gm-Message-State: AOJu0YyO0IOpbfyjh1gW8CF9hTSgr3AjB3Z/kWDG0qbj+d81e0MKNNxp
 qFo15Ra+DSQ4oi0V3N2kFeEkd6IcZGpoOBieoE6zOJw0/lpKeyO+0ZI7xlpkNGfCx95nbmHZyqv
 KK22foLdSgzizTyFmqL7L7UA9aY69pbl5fq1603YQJdtKUWJVRjR9Wi8=
X-Gm-Gg: ASbGncuXDJ82SSfJv7v4kz4weH1OIqxnkLsYb1Qcg9amQ0KtXEDUSOvscCHN3vzONTu
 cfQG9+MWmc/nnLk2QKAcNZsvLWtvaQZpcnVikCTH+y7dLxZp3jDQt6Qhm6rFF9E0xnqbOSLi5Ay
 bjltzokh8hAF1jSzgpV3EpMABxA7Sp9HsLHBUmTQygrhu2TGBp+35ussjvcFghNP6MMsUKR+cWR
 eaAm7D1NFjvuBXmek9isG9H2NrT0v22SBIrsTZcTvgh0zrFXraJLj8hFoswX2m/cr9kl1pN
X-Google-Smtp-Source: AGHT+IGaVagTx8hEuPpGoL7AEHAise+m6cLY73KC6Dl72g9vxKRp51S5NCherF7SA2OcxJNUcL1e+yLHf56LlaRQ9wY=
X-Received: by 2002:a17:902:d58a:b0:264:c48:9cae with SMTP id
 d9443c01a7336-2640c489f42mr117753185ad.38.1758007658046; Tue, 16 Sep 2025
 00:27:38 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 16 Sep 2025 12:57:26 +0530
X-Gm-Features: AS18NWAma5_BQDQUJLHrWh8m4zqOKBnCdl8KRwcCODUf5Yb_JGvr-6H4NUsMNP4
Message-ID: <CA+G9fYuFdesVkgGOow7+uQpw-QA6hdqBBUye8CKMxGAiwHagOA@mail.gmail.com>
To: linux-block <linux-block@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
 LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
 lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] next-20250915: LTP chdir01 df01_sh stat04 tst_device.c:97:
 TBROK: Could not stat loop device 0
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Arnd Bergmann <arnd@arndb.de>, Anuj Gupta <anuj20.g@samsung.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Ben Copeland <benjamin.copeland@linaro.org>,
 Kanchan Joshi <joshi.k@samsung.com>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The following LTP chdir01 df01_sh and stat04 tests failed on the rock-pi-4b
qemu-arm64 on the Linux next-20250915 tag build.

First seen on next-20250915
Good: next-20250912
Bad: next-20250915

Regression Analysis:
- New regression? yes
- Reproducibility? yes

* rk3399-rock-pi-4b, ltp-smoke
* qemu-arm64, ltp-smoke
* qemu-arm64-compat, ltp-smoke
 - chdir01
  - df01_sh
  - stat04

Test regression: next-20250915: LTP chdir01 df01_sh stat04
tst_device.c:97: TBROK: Could not stat loop device 0

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log
<8>[   53.655971] <LAVA_SIGNAL_STARTTC chdir01>
tst_buffers.c:57: TINFO: Test is using guarded buffers
tst_tmpdir.c:316: TINFO: Using /tmp/LTP_chdm4pHJb as tmpdir (tmpfs filesystem)
tst_device.c:98: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:1953: TINFO: LTP version: 20250530
tst_test.c:1956: TINFO: Tested kernel: 6.17.0-rc6-next-20250915 #1 SMP
PREEMPT @1757983656 aarch64
tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
tst_kconfig.c:676: TINFO: CONFIG_TRACE_IRQFLAGS kernel option detected
which might slow the execution
tst_test.c:1774: TINFO: Overall timeout per run is 0h 28m 48s
tst_supported_fs_types.c:97: TINFO: Kernel supports ext2
tst_supported_fs_types.c:62: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:97: TINFO: Kernel supports ext3
tst_supported_fs_types.c:62: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:97: TINFO: Kernel supports ext4
tst_supported_fs_types.c:62: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:128: TINFO: Filesystem xfs is not supported
tst_supported_fs_types.c:97: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:62: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:105: TINFO: Skipping bcachefs because of FUSE blacklist
tst_supported_fs_types.c:97: TINFO: Kernel supports vfat
tst_supported_fs_types.c:62: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:128: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:132: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:62: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:97: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:49: TINFO: mkfs is not needed for tmpfs
tst_test.c:1888: TINFO: === Testing on ext2 ===
tst_device.c:391: TWARN: Failed to clear 512k block on /dev/loop0
tst_test.c:1217: TBROK: tst_clear_device() failed
Summary:
passed   0
failed   0
broken   1
skipped  0
warnings 1
tst_device.c:283: TWARN: open(/dev/loop0) failed: ENOENT (2)
<8>[   53.679564] <LAVA_SIGNAL_ENDTC chdir01>
<8>[   53.708246] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=chdir01 RESULT=fail>

<8>[   53.933883] <LAVA_SIGNAL_STARTTC stat04>
tst_buffers.c:57: TINFO: Test is using guarded buffers
tst_tmpdir.c:316: TINFO: Using /tmp/LTP_staPDxElt as tmpdir (tmpfs filesystem)
tst_device.c:97: TBROK: Could not stat loop device 0
Summary:
passed   0
failed   0
broken   1
skipped  0
warnings 0
<8>[   53.947889] <LAVA_SIGNAL_ENDTC stat04>
<8>[   53.974024] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=stat04 RESULT=fail>

<8>[   54.048075] <LAVA_SIGNAL_STARTTC df01_sh>
df01 1 TINFO: Running: df01.sh
df01 1 TINFO: Tested kernel: Linux
runner-j2nyww-sk-project-40964107-concurrent-0
6.17.0-rc6-next-20250915 #1 SMP PREEMPT @1757983656 aarch64 GNU/Linux
df01 1 TINFO: Using /tmp/LTP_df01.7pcwUXe1CN as tmpdir (tmpfs filesystem)
tst_device.c:97: TBROK: Could not stat loop device 0
df01 1 TBROK: Failed to acquire device
Summary:
passed   0
failed   0
broken   1
skipped  0
warnings 0
<8>[   54.060936] <LAVA_SIGNAL_ENDTC df01_sh>
<8>[   54.087630] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=df01_sh RESULT=fail>

## Source
* Kernel version: 6.17.0-rc6
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc6-next-20250915
* Git commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
* Architectures: arm64
* Toolchains: gcc-13 and gcc-8
* Kconfigs: lkftconfigs

## Build
* Test log: https://qa-reports.linaro.org/api/testruns/29896973/log_file/
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250915/ltp-smoke/stat04/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/32l4Vv9hKep2EcmS18u3NBtmoAm
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/config

--
Linaro LKFT

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
