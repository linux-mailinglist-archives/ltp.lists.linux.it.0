Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B541D72A8
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:15:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F311D3C4F0E
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:15:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2DCF03C0B8A
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:20 +0200 (CEST)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0E55C20110A
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:20 +0200 (CEST)
Received: by mail-pg1-x536.google.com with SMTP id u35so4465931pgk.6
 for <ltp@lists.linux.it>; Mon, 18 May 2020 01:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nP8IZJ+FoULASqNaKmN6t35AKog6k8c9FOCcoeUBB3o=;
 b=HRpb+6c7/8rYTGQ5Ms4JObPs65nXNBLCVtB77I4Zy3ReJ4W1L5apviLzQKZMvWsV8H
 NAigDLVMnloZuWIo4J7SA4mzWJ0VFmyLNDE/iSKIaONAw+HsuwEsqlDwbwnykdF5vIgQ
 r3tJaed9OHvWkzU2nTQfDA31uUX93IrtFhl5+d4CZS5tm/KrxwuMN5rURbta4drrjW3K
 U5ppgQQBuhgj6+2Mshsx6n4nTYgyidR+h51hqlp19Dzf/xXfn7NeUMHWSaRvSSYygw66
 YR8lDjSRdb4Moxh155Gvdu5zpOlGJ5bwrr4jFynbqGGKqx+1/yRM5kUlWww/SzcgbKNl
 xP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nP8IZJ+FoULASqNaKmN6t35AKog6k8c9FOCcoeUBB3o=;
 b=q6lvNzO139G+DicZx0im4wrRfFjSOAPqhRr+gFg7lDNq/vQwHWuz9et6rfH4x/r4lR
 gvFM+Y2IXHLmm6b5t3TL0kxcXmFWgHxiFIFT5hdD6VOpOqZ2+iCL3m8SdLn9khvEkpSD
 EDlATF9t5uJc7/ypOehbr+jQ0T6ShUygRIkl13YGRUP79umzobWqRAW+tmyadqn0C4Jv
 Q4yL/PQK2bqjPTdCyqCg2A+vKVOwv80PNOyxbtb0/Sg8PHIz660McvsTAOZdYOLu+DW3
 Y6Q/7FZEpaj14eqD5anKajznVJxoPy0H43rsWwIwMX5U9URq2g6ACwChbSYJXupQ2NaV
 GGzw==
X-Gm-Message-State: AOAM533aqNNqsTlulRFVXLYEn99FTRglNdXnTqwF8Zx08yrYSmb4sLoJ
 itwwElRYXgoe3z7ISwyH61FgXmLqO9Q=
X-Google-Smtp-Source: ABdhPJzXdu8hlhtD6jMzAPaPBl+6YQMbHRwcl6KEOSS4sVktgqKobbLGM9GVqpq0LVjsnhEoVV+/uQ==
X-Received: by 2002:a63:3449:: with SMTP id b70mr14481171pga.289.1589789718164; 
 Mon, 18 May 2020 01:15:18 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id u73sm8678234pfc.0.2020.05.18.01.15.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 01:15:17 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 18 May 2020 13:44:52 +0530
Message-Id: <cover.1589789487.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V3 00/17] Syscalls: Add support for time64 variants
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
 .../syscalls/timer_settime/timer_settime01.c  |  46 +-
 .../syscalls/timer_settime/timer_settime02.c  |  60 +-
 testcases/kernel/syscalls/timerfd/timerfd01.c |  53 +-
 testcases/kernel/syscalls/timerfd/timerfd04.c |  51 +-
 .../syscalls/timerfd/timerfd_gettime01.c      | 133 ++---
 .../syscalls/timerfd/timerfd_settime01.c      | 136 +++--
 .../syscalls/timerfd/timerfd_settime02.c      |  28 +-
 testcases/kernel/syscalls/utils/mq_timed.h    |  42 +-
 testcases/kernel/syscalls/utimensat/Makefile  |   4 -
 .../kernel/syscalls/utimensat/utimensat01.c   | 472 ++++++++--------
 .../syscalls/utimensat/utimensat_tests.sh     | 517 ------------------
 52 files changed, 2562 insertions(+), 2685 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/futex/futex_wait_bitset.h
 delete mode 100644 testcases/kernel/syscalls/futex/futex_wait_bitset02.c
 create mode 100644 testcases/kernel/syscalls/ipc/semop/semop.h
 delete mode 100755 testcases/kernel/syscalls/utimensat/utimensat_tests.sh

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
