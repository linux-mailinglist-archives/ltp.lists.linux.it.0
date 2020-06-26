Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA67D20AC3B
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:22:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 678083C2B5D
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:22:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E28C73C176D
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:22:39 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9B4E860067B
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:22:38 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id f6so509284pjq.5
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 23:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XA0P+v9tbv9AIWVrJbOmy97v0nj4wY9QBMxKoHFIcU0=;
 b=rCXfC+Jv0oonxNN3tJutzPF2YrA/Yx1uTVvmGhTbnO6lisaY3vqMQVL7SC4m8ugBap
 YLK+qE2UEo8CqY7CrgkXfaFAiPviH/j9codWiNB7GJkT+rfPm5x+9DZae1ZwaaEgnRYm
 FK0eMh8BcA2ObT4/1wb2Cr6yoIlsnvmd9UZfkktATYbJrxDy6OCHxjAIwH7Xqv73fljq
 TCGsrUm3A56I074sw7Yrzp2WCcWjsb/1SAIsHIXqEIMc9SREsWw4DFOfJT7FxsO7ebJk
 qs90TQSyXx1oSB8IF+Aq8uGCgQ25DDHIVi4c4fWf2G7sZmxrYMnU8kwJgZO1kMG+ors2
 ROZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XA0P+v9tbv9AIWVrJbOmy97v0nj4wY9QBMxKoHFIcU0=;
 b=joVeox/ZiDJ7qWAM21Ew38/ZKgVczqX/1OSbl/IwJPPL0F+vtyR6eRZWnEFXKjzYdm
 HONOjLBP8xtR38qXl6GAF4QoeyrosOF8o+rJnwu7WbrgOmrrnvRABrv6fYJo6pubnE1C
 9V6aIf13qXUrTaQokxZobvMQ/d0ofW9B8TWc10iORNQesE7uSvI/cm0TiSNE+R01pDgv
 w1mL++Fm2KlF1StKbDM6md1dDdGkfWPrIySbZzdsBFWKyGHZhLRIWcO0x3lqx6+XnPWe
 nZtIuBZgh0OeP7VftkdzdRI+FV/mS3v50+yEb4tL6bj88LFHHEdOM8s07IGgPweJFwei
 ZPPw==
X-Gm-Message-State: AOAM531l4I+rxspXXxF2N9oIyaJSGS9W2RN/njdDhMuiTWjxOzXe2i8x
 kgVgi2RpbF0MzKk6kcCqRvy5uiMcCWM=
X-Google-Smtp-Source: ABdhPJxbZtJAyac/YbmG3kQ/9odbLoeZ1ycaazih2Kt3kjJ/gO38lrFJN9dha/J1mov5VLGXOLx55Q==
X-Received: by 2002:a17:90a:30c2:: with SMTP id
 h60mr1707850pjb.23.1593152556765; 
 Thu, 25 Jun 2020 23:22:36 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id z144sm26585975pfc.195.2020.06.25.23.22.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 23:22:35 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 11:52:13 +0530
Message-Id: <cover.1593152309.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V7 00/19] Syscalls: Add support for time64 variants
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

V7:
- Move all tst_timer.h changes to a single patch.
- Provide more generic helpers for itimerspec and update the patches
  accordingly.
- Also include the y2038 patch in the series as that depends on the
  first patch here.

V6: Drop the binary files included by mistake.
V5: Use __kernel_old_itimerspec instead of __kernel_itimerspec.
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

Viresh Kumar (19):
  tst_timer: Add new definitions
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
  syscalls: clock_settime: Add test around y2038 vulnerability

 include/lapi/io_pgetevents.h                  |  15 +-
 include/tst_timer.h                           | 326 ++++++++++-
 runtest/syscalls                              |   4 +-
 .../kernel/syscalls/clock_settime/.gitignore  |   1 +
 .../syscalls/clock_settime/clock_settime03.c  | 119 ++++
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
 .../kernel/syscalls/futex/futex_wake04.c      | 145 +++--
 testcases/kernel/syscalls/futex/futextest.h   | 122 +++--
 .../syscalls/io_pgetevents/io_pgetevents01.c  |  33 +-
 .../syscalls/io_pgetevents/io_pgetevents02.c  |  51 +-
 testcases/kernel/syscalls/ipc/semop/Makefile  |   4 +-
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
 .../syscalls/timer_gettime/timer_gettime01.c  | 135 +++--
 .../syscalls/timer_settime/timer_settime01.c  |  51 +-
 .../syscalls/timer_settime/timer_settime02.c  |  69 ++-
 testcases/kernel/syscalls/timerfd/timerfd01.c |  56 +-
 testcases/kernel/syscalls/timerfd/timerfd04.c |  54 +-
 .../syscalls/timerfd/timerfd_gettime01.c      | 133 ++---
 .../syscalls/timerfd/timerfd_settime01.c      | 136 +++--
 .../syscalls/timerfd/timerfd_settime02.c      |  28 +-
 testcases/kernel/syscalls/utils/mq_timed.h    |  42 +-
 testcases/kernel/syscalls/utimensat/Makefile  |   4 -
 .../kernel/syscalls/utimensat/utimensat01.c   | 472 ++++++++--------
 .../syscalls/utimensat/utimensat_tests.sh     | 517 ------------------
 54 files changed, 2819 insertions(+), 2711 deletions(-)
 create mode 100644 testcases/kernel/syscalls/clock_settime/clock_settime03.c
 delete mode 100644 testcases/kernel/syscalls/futex/futex_wait_bitset.h
 delete mode 100644 testcases/kernel/syscalls/futex/futex_wait_bitset02.c
 create mode 100644 testcases/kernel/syscalls/ipc/semop/semop.h
 delete mode 100755 testcases/kernel/syscalls/utimensat/utimensat_tests.sh

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
