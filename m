Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7071DE4D6
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:51:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50B0D3C4CC3
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:51:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 75FF93C057F
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:51:45 +0200 (CEST)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 82D0A600B53
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:51:18 +0200 (CEST)
Received: by mail-pj1-x102f.google.com with SMTP id q24so4824908pjd.1
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yB5Su0ox8/w6VUQTqcbdw/Zn5koFsj6HFavBatwn8sA=;
 b=MPwcExWxqKQu060l+Z83PO6Vse+knAAIqoqO1UnY1eyuzOv1D+MJyTpH2H4Bh7sbR5
 OoSulI/NCwtLu0aAaWrXed09xRZ1lazTSGUBzRz3MiQ/9cM+7uZkj1pSGtrLXEOd3OJJ
 UUL7W5kdl5bVLSUYBO0Uj9SYHqliBKQv4julS2AwsvWE0Wr4kXTGSmNxnG1kDvyeYECy
 716+FgSBHgbcNxUUseSmZV4olQxnYxDDTAB78d30/jMEzun7vWQRm1CRmrAaBKJAcD3E
 +wFPWGFFG57WM04SAh9vL1HotL/uliq+ExsqKWCyrj9EEjADHAF03+llcYJHEl/ffWcu
 Fs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yB5Su0ox8/w6VUQTqcbdw/Zn5koFsj6HFavBatwn8sA=;
 b=AQz8L7Hpg8o8TrDJOlnK8U8uCMhYI+hQTMQfbEcEde4JIXL9MDbQ1irvwHIuNvpp5J
 S1BtNtqLBpXe2jLIxIqtjFvWnIMA34kavWZa4l1E/AMygdZKQC7T14OJn1pc+yqQI3eI
 k0Ko4UUExrqsdGwtN1Nuc1K45b77uTIrFu8pVr7Q4LB5A3baChsjn7sN9g14hQ9hM9uQ
 eCxpa3oAHA5ekkRCD/D67FIGrDyI4WmwEZqUSM4xQY4WntGl3zmasllEpIpk3FZLP4K2
 zESNSzXxBagsHjn2Ii9UBWbBHt+P52xZm7PbXIWAbOBRw9jRh0BRdYdwLJ4bB62Us/Xn
 RwPA==
X-Gm-Message-State: AOAM530iz+9R/G8VFafJwLKGVD9xB87YqKH9FnNrT34xIJn9uBF+pttH
 xaepZyt9xMVcRMWNQG6gQP/ePX8/Vt0=
X-Google-Smtp-Source: ABdhPJyDiYg1OYaeRNnLB+HbJcHpotDhjODqhwHNza8bE9Y2Y2MfRF6cGYbr6jlUXytoeWiGygUFoQ==
X-Received: by 2002:a17:902:7897:: with SMTP id
 q23mr14206427pll.269.1590144702702; 
 Fri, 22 May 2020 03:51:42 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id o9sm7014279pjp.4.2020.05.22.03.51.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:51:41 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 16:21:20 +0530
Message-Id: <cover.1590144577.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V4 00/17] Syscalls: Add support for time64 variants
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

This updates the pending syscall tests that lacked the time64 updates.

V4:
- Pass timer_t type to timer_gettime/settime syscalls instead of
  kernel_timer_t.
- Some part of timer_settime() patch was merged in timerfd_gettime()
  earlier by mistake, fixed that.

V3:
- Fix issues related to passing incorrect timespec type to syscalls.
- Take care of futex and semtimedop tests where the architecture
  provides the syscall number, but doesn't implement it.
- Other improvements and cleanups.

Viresh Kumar (17):
  syscalls/timer_gettime: Add support for time64 tests
  syscalls/timer_settime: Add support for time64 tests
  syscalls/timerfd: Add support for time64 tests
  syscalls/sched_rr_get_interval: Add support for time64 tests
  syscalls/futex: Merge futex_wait_bitset tests
  syscalls/futex: Add support for time64 tests
  syscalls/io_pgetevents: Add support for time64 tests
  syscalls/sigwaitinfo: Migrate to new test framework
  syscalls/rt_sigtimedwait: Add support for time64 tests
  syscalls/mq_timed{send|receive}: Add support for time64 tests
  syscalls/recvmmsg: Add support for time64 tests
  syscalls/ppoll: Add support for time64 tests
  syscalls/select6: Add support for time64 tests
  syscalls/semop: Migrate to new test framework
  syscalls/semtimedop: Add support for semtimedop and its time64 version
  syscalls/utimensat: Migrate to new test framework
  syscalls/utimensat: Add support for time64 tests

 include/lapi/io_pgetevents.h                  |  15 +-
 include/tst_timer.h                           | 196 +++++++
 runtest/syscalls                              |   3 +-
 testcases/kernel/syscalls/futex/.gitignore    |   1 -
 testcases/kernel/syscalls/futex/Makefile      |   1 -
 .../syscalls/futex/futex_cmp_requeue01.c      |  34 +-
 .../syscalls/futex/futex_cmp_requeue02.c      |  24 +-
 testcases/kernel/syscalls/futex/futex_utils.h |  52 +-
 .../kernel/syscalls/futex/futex_wait01.c      |  79 +--
 .../kernel/syscalls/futex/futex_wait02.c      | 102 ++--
 .../kernel/syscalls/futex/futex_wait03.c      |  87 ++-
 .../kernel/syscalls/futex/futex_wait04.c      |  81 +--
 .../kernel/syscalls/futex/futex_wait05.c      |   2 +-
 .../kernel/syscalls/futex/futex_wait_bitset.h |  75 ---
 .../syscalls/futex/futex_wait_bitset01.c      | 101 +++-
 .../syscalls/futex/futex_wait_bitset02.c      |  18 -
 .../kernel/syscalls/futex/futex_wake01.c      |  67 ++-
 .../kernel/syscalls/futex/futex_wake02.c      |  95 ++--
 .../kernel/syscalls/futex/futex_wake03.c      | 109 ++--
 .../kernel/syscalls/futex/futex_wake04.c      | 146 +++--
 testcases/kernel/syscalls/futex/futextest.h   | 122 +++--
 .../syscalls/io_pgetevents/io_pgetevents01.c  |  33 +-
 .../syscalls/io_pgetevents/io_pgetevents02.c  |  51 +-
 testcases/kernel/syscalls/ipc/semop/Makefile  |   2 +-
 testcases/kernel/syscalls/ipc/semop/semop.h   |  55 ++
 testcases/kernel/syscalls/ipc/semop/semop01.c | 148 +++--
 testcases/kernel/syscalls/ipc/semop/semop02.c | 156 +++---
 testcases/kernel/syscalls/ipc/semop/semop03.c | 162 +++---
 testcases/kernel/syscalls/ipc/semop/semop04.c | 177 +++---
 testcases/kernel/syscalls/ipc/semop/semop05.c | 313 +++++------
 .../mq_timedreceive/mq_timedreceive01.c       |  92 +++-
 .../syscalls/mq_timedsend/mq_timedsend01.c    |  96 ++--
 testcases/kernel/syscalls/ppoll/ppoll01.c     |  71 ++-
 .../sched_rr_get_interval01.c                 | 116 ++--
 .../sched_rr_get_interval02.c                 | 122 ++---
 .../sched_rr_get_interval03.c                 | 146 +++--
 testcases/kernel/syscalls/select/select_var.h |  25 +-
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     |  40 +-
 .../kernel/syscalls/sendmmsg/sendmmsg_var.h   |  55 +-
 .../syscalls/sigwaitinfo/sigwaitinfo01.c      | 311 ++++++-----
 .../syscalls/timer_gettime/timer_gettime01.c  | 124 ++---
 .../syscalls/timer_settime/timer_settime01.c  |  48 +-
 .../syscalls/timer_settime/timer_settime02.c  |  66 ++-
 testcases/kernel/syscalls/timerfd/timerfd01.c |  53 +-
 testcases/kernel/syscalls/timerfd/timerfd04.c |  51 +-
 .../syscalls/timerfd/timerfd_gettime01.c      | 133 ++---
 .../syscalls/timerfd/timerfd_settime01.c      | 136 +++--
 .../syscalls/timerfd/timerfd_settime02.c      |  28 +-
 testcases/kernel/syscalls/utils/mq_timed.h    |  42 +-
 testcases/kernel/syscalls/utimensat/Makefile  |   4 -
 .../kernel/syscalls/utimensat/utimensat01.c   | 472 ++++++++--------
 .../syscalls/utimensat/utimensat_tests.sh     | 517 ------------------
 52 files changed, 2566 insertions(+), 2689 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/futex/futex_wait_bitset.h
 delete mode 100644 testcases/kernel/syscalls/futex/futex_wait_bitset02.c
 create mode 100644 testcases/kernel/syscalls/ipc/semop/semop.h
 delete mode 100755 testcases/kernel/syscalls/utimensat/utimensat_tests.sh

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
