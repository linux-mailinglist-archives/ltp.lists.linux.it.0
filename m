Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB947171003
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:14:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDF8B3C25C1
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:14:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 64D483C2019
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:14:47 +0100 (CET)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 66F36140199B
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:14:46 +0100 (CET)
Received: by mail-pf1-x441.google.com with SMTP id 15so566884pfo.9
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 21:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S29VKm1Yr+CWCfnVv0ZSSNM/rPY9xf3JDb2x3R3xolk=;
 b=yS4zwQWarTE3Kyew/rSdN5fux8Lc/VphJWby7WSBvt9/4dw0KTszfDOGFXnnDTlgn5
 zia2jJK63hQzscm/e71NBIvQbOGdOw3HlDSet/C2KDIX4x7Z8beRY5TgtiDvlgGAJa1q
 btagHYPm2qvXOlE60t8qZC142elRjwPynx4dr9Vtgo3QjgFWJM2sB7uVcGVDvlL5vyzi
 FHDJ13kd1MGDnRSXWoVIcwTYt4hCY32Fi7erapDEOkR5oTTC89C6I6L8MuqzuyG9hSUJ
 9kaGYM8i7rVBUtcqqOFNgXLN8+ELyNLet7Oou+A7O+SW62ix9JcSjltJ8B/tNx6lw64k
 7C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S29VKm1Yr+CWCfnVv0ZSSNM/rPY9xf3JDb2x3R3xolk=;
 b=ciMUpm4Cmo2eJ4NB2EnaiHs2u11kvHvN1GcusCusWytLJjDOcm4GBR+wCnxZ8bRL2f
 RshIk7vojsWZdx5tl5hY4FuwC9LirUpfx3biLzgZ/IwdARJFxirFe8TLdrV4KcxpI+Lh
 ttbtNloGSCgVDBXrioAyIywTPC9J9hzXhZ3Z6IMGBu9QcNsmde9DIZHDwWTaz/gXFcsz
 8V7nbWi1bzvtarIIam3E7vUKzlXmQK4+A4CYok4nZ1aMWVWdjtlzQQ6O+oWVcCf0d8hd
 yaHqjwazIS4onfZRVllf/heuBl/K+AUxn3LoJXTOkonWrjoZ0xe1g/LOR5zVP/hf3oO6
 IKDA==
X-Gm-Message-State: APjAAAXm0VRLnBEf7d5AWIdnIX/EXocHWp1kAbGL8d0JVw/CVQ9Di5ZK
 kVucK3ctFxy2WEtyKebreFaBPcPs9Uc=
X-Google-Smtp-Source: APXvYqxukuwr1zpOpvj4kaKAu4kN5EymwrDnJgQQ+rVqkvcPHpf9OZOUzJk7pYC51Tjk6nOBcdBdow==
X-Received: by 2002:a63:594a:: with SMTP id j10mr2378436pgm.227.1582780484453; 
 Wed, 26 Feb 2020 21:14:44 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id a17sm4477860pjv.6.2020.02.26.21.14.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 21:14:43 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 10:44:28 +0530
Message-Id: <cover.1582779464.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V5 00/10] Add new LTP tests related to fsmount family
 of syscalls
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Here is the fifth version of my work rebased over the latest changes pushed
around fsmount work by Zorro. This is tested on both ARM and X86 platforms now
and no more errors are seen with it.

V4->V5:
- s/TBROK/TFAIL/ in run(int n) callbacks.
- Many conversions like TEST(fd = fsopen());
- A new implementation of tst_is_mounted().
- fspick.h created to take care of duplicate code.
- tmp directory not removed from code as that will be auto done anyway.
- Other minor improvements.

V3->V4:
- Only the first patch was resent after fixing git log and minor code
  modifications.

V2->V3:
- Fix errors with xfs.
- Add macros to define test names.
- Continue with multiple iteration tests on failures, instead of
  returning early.
- Set value of is_mounted in open_tree patch.
- Rename tst_ismount() and make it return 1 on success.
- Fix various formatting issues.
- Add all reviewed/ack tags.

V1->V2:
- Lots of changes, really :)
- Rebased over Zorro's work with fsmount.
- The success tests are modified to test all possible flags, attributes
  as well.
- Create tst_ismount() and fsopen_supported_by_kernel() helpers.
- Verify if mount is successful or not using tst_ismount().
- Remove min_kver and instead check if older kernels have patches
  backported or not.
- Test on multiple filesystems.
- Better handling of failures during setup/run callbacks.
- One of the patches around fsmount.h is already merged, dropped it now.
- Other minor cleanups.

Viresh Kumar (10):
  tst_device: Add tst_is_mounted() helper
  lapi/fsmount.h: Add fsopen_supported_by_kernel()
  lapi/fsmount.h: Include "lapi/fcntl.h"
  syscalls/fsopen: New tests
  syscalls/fsconfig: New tests
  syscalls/fsmount: Improve fsmount01 test
  syscalls/fsmount: Add failure tests
  syscalls/move_mount: New tests
  syscalls/fspick: New tests
  syscalls/open_tree: New tests

 include/lapi/fsmount.h                        |  11 +-
 include/tst_device.h                          |   6 +
 lib/tst_device.c                              |  14 ++
 runtest/syscalls                              |  16 +++
 testcases/kernel/syscalls/fsconfig/.gitignore |   2 +
 testcases/kernel/syscalls/fsconfig/Makefile   |   6 +
 .../kernel/syscalls/fsconfig/fsconfig01.c     | 101 ++++++++++++++
 .../kernel/syscalls/fsconfig/fsconfig02.c     |  99 ++++++++++++++
 testcases/kernel/syscalls/fsmount/.gitignore  |   1 +
 testcases/kernel/syscalls/fsmount/fsmount01.c | 123 +++++++++---------
 testcases/kernel/syscalls/fsmount/fsmount02.c |  80 ++++++++++++
 testcases/kernel/syscalls/fsopen/.gitignore   |   2 +
 testcases/kernel/syscalls/fsopen/Makefile     |   6 +
 testcases/kernel/syscalls/fsopen/fsopen01.c   |  80 ++++++++++++
 testcases/kernel/syscalls/fsopen/fsopen02.c   |  58 +++++++++
 testcases/kernel/syscalls/fspick/.gitignore   |   2 +
 testcases/kernel/syscalls/fspick/Makefile     |   6 +
 testcases/kernel/syscalls/fspick/fspick.h     |  60 +++++++++
 testcases/kernel/syscalls/fspick/fspick01.c   |  62 +++++++++
 testcases/kernel/syscalls/fspick/fspick02.c   |  54 ++++++++
 .../kernel/syscalls/move_mount/.gitignore     |   2 +
 testcases/kernel/syscalls/move_mount/Makefile |   6 +
 .../kernel/syscalls/move_mount/move_mount01.c |  83 ++++++++++++
 .../kernel/syscalls/move_mount/move_mount02.c |  92 +++++++++++++
 .../kernel/syscalls/open_tree/.gitignore      |   2 +
 testcases/kernel/syscalls/open_tree/Makefile  |   6 +
 .../kernel/syscalls/open_tree/open_tree01.c   | 108 +++++++++++++++
 .../kernel/syscalls/open_tree/open_tree02.c   | 105 +++++++++++++++
 28 files changed, 1132 insertions(+), 61 deletions(-)
 create mode 100644 testcases/kernel/syscalls/fsconfig/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsconfig/Makefile
 create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig01.c
 create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig02.c
 create mode 100644 testcases/kernel/syscalls/fsmount/fsmount02.c
 create mode 100644 testcases/kernel/syscalls/fsopen/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsopen/Makefile
 create mode 100644 testcases/kernel/syscalls/fsopen/fsopen01.c
 create mode 100644 testcases/kernel/syscalls/fsopen/fsopen02.c
 create mode 100644 testcases/kernel/syscalls/fspick/.gitignore
 create mode 100644 testcases/kernel/syscalls/fspick/Makefile
 create mode 100644 testcases/kernel/syscalls/fspick/fspick.h
 create mode 100644 testcases/kernel/syscalls/fspick/fspick01.c
 create mode 100644 testcases/kernel/syscalls/fspick/fspick02.c
 create mode 100644 testcases/kernel/syscalls/move_mount/.gitignore
 create mode 100644 testcases/kernel/syscalls/move_mount/Makefile
 create mode 100644 testcases/kernel/syscalls/move_mount/move_mount01.c
 create mode 100644 testcases/kernel/syscalls/move_mount/move_mount02.c
 create mode 100644 testcases/kernel/syscalls/open_tree/.gitignore
 create mode 100644 testcases/kernel/syscalls/open_tree/Makefile
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree01.c
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree02.c

-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
