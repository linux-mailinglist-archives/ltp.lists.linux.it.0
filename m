Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 364DC182FB8
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:01:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C34493C5E86
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:01:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EBBA93C5E76
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:20 +0100 (CET)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C4F71602079
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:19 +0100 (CET)
Received: by mail-pj1-x1041.google.com with SMTP id l36so2473972pjb.3
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wctsrBS3U2jHqK8H4V7EDIRaAf+OoucnL3dhvWg4qMI=;
 b=VJmqScncbAqb1DQe8WKurWoGTV+OByhDzKuvIrCI9p+TPIs3lfSVGeULdehqpNuThO
 ErmQ7/748wXB0JP/bgXP9XJN+vcboqiqL4yb1mB4TIH/TiDXNEPE7zSEIK2YLItGV9nk
 1z2VEUHbSNDpF7dESSgZkYTh4r6NxioCtvVyH/+AZ0vveHX6WaelVL+WiI2BLwAUJGmN
 l9tS89xOQCqSMhneV42zQ19fhUeu2ZWnDjicu8vyiLJBPP+zrcLnQn+2sfS6qfJ8AtuK
 5p1WWLPUtXBfGB9mGNlFLyTDnMngCX2HYr/Q8KAOYm8wsI90Ih9qrexzC49yb52arL5u
 p3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wctsrBS3U2jHqK8H4V7EDIRaAf+OoucnL3dhvWg4qMI=;
 b=apdBV9qIIrtPN6JZeljy0j1gNicHDrYknR0iWPgh+1Y1LJd6QsfiMDVqXqXdxhf+1M
 pV5GLQg4KG/+r7QlFVX3zCeVy/xgpThLeX5tcvYQPQ3GYqjQMiSHe96dsUIuvVKYMt5W
 EvfgSZRYB1D1zYZ/i7hGZOGaMlih1kqU2ajTj/PPvasz2s4aKN5oS/m4ZzJwgFD667/b
 vOoe7PE8HZa0eBbcgM8KGcDuZbwUBAaH0OzU8EDknHRBzhzwylN8lb/lOk8Z3IdTdkx9
 JSaeM+eZzHukZkH6EfOSx0T4AhKWyGzP8sGua6l2XLSdM0pHv7z7FzyhWENdKFtYFBw4
 SI+A==
X-Gm-Message-State: ANhLgQ3k3awM+JWB9Uqd8N32j26TcQOAmZuolo3wlK3+30s+foCjjCqU
 E92c1pVWHjbCJwN/WSJswDGcMVXTzqU=
X-Google-Smtp-Source: ADFU+vuvo7sn5Ks3rgr+ourjAvCMjxh8VtSUm0ZRQZdYuZbhqFYzeo+u/gfDuXhg4S3hTWjGaexgDg==
X-Received: by 2002:a17:902:8d89:: with SMTP id
 v9mr7810894plo.83.1584014477879; 
 Thu, 12 Mar 2020 05:01:17 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id a13sm22270609pfc.24.2020.03.12.05.01.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 05:01:16 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 17:31:00 +0530
Message-Id: <cover.1584014172.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V6 00/10] Add new LTP tests related to fsmount family
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Here is the sixth version of these patches.  This is tested on both ARM
and X86 platforms now and no more errors are seen with it.

V5->V6:
- A new implementation of tst_is_mounted() and a new helper
  tst_is_mounted_at_tmpdir().
- Add cleanup() callback in fsconfig01.c
- Call umount() only if tst_is_mounted_at_tmpdir() passes.
- Call close() in fsopen_supported_by_kernel().
- Use /dev/foo instead of /dev/sda1

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
  tst_device: Add tst_is_mounted() and tst_is_mounted_at_tmpdir()
    helpers
  lapi/fsmount.h: Add fsopen_supported_by_kernel()
  lapi/fsmount.h: Include "lapi/fcntl.h"
  syscalls/fsopen: New tests
  syscalls/fsconfig: New tests
  syscalls/fsmount: Improve fsmount01 test
  syscalls/fsmount: Add failure tests
  syscalls/move_mount: New tests
  syscalls/fspick: New tests
  syscalls/open_tree: New tests

 include/lapi/fsmount.h                        |  13 +-
 include/tst_device.h                          |   7 +
 lib/tst_device.c                              |  44 +++++++
 runtest/syscalls                              |  16 +++
 testcases/kernel/syscalls/fsconfig/.gitignore |   2 +
 testcases/kernel/syscalls/fsconfig/Makefile   |   6 +
 .../kernel/syscalls/fsconfig/fsconfig01.c     |  91 +++++++++++++
 .../kernel/syscalls/fsconfig/fsconfig02.c     |  99 ++++++++++++++
 testcases/kernel/syscalls/fsmount/.gitignore  |   1 +
 testcases/kernel/syscalls/fsmount/fsmount01.c | 121 +++++++++---------
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
 .../kernel/syscalls/open_tree/open_tree01.c   | 109 ++++++++++++++++
 .../kernel/syscalls/open_tree/open_tree02.c   | 105 +++++++++++++++
 28 files changed, 1155 insertions(+), 60 deletions(-)
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
