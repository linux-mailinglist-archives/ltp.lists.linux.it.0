Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E370026C1BD
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:38:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A39B73C4EAC
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:38:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 474AB3C2ADA
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:10 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C7CAE1A00FD9
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:09 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id mm21so1368752pjb.4
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N60d3CdYKSa1AB/vnxSJBjJ2gcSUvfceeBtBkIwnCIY=;
 b=k8AVrb+KueE4memaeq+bUVcEGjMQiddO7Rg6yiX2QuhsNU/byfhS+UvUor/2jxvUIS
 eIlNjQ8vAF3iKcnDs8UoY7VbMV+z46QSC6fGJjOkBiZtSn2V1Ms+woLvRAACsMR9lccS
 PjxWcUrA7olb6Rp0wU9jlDioCXpTVn2PSR/77Z9xfYHZSwjRIVf7noQ5W+Wwo830EZqA
 ZjiQtwZ0AgrVKQjc8AXG8jDIzp86EgKIi+JKIC5GZeMbC9FZ6Bwtazx1pbmAop2mjTZq
 TwG27fXA9akNSNoN0F3Wf7L6QzGYAjITQ2SJb2r0uftEWbOm6xAsZZsybbu/6hHkwst/
 tExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N60d3CdYKSa1AB/vnxSJBjJ2gcSUvfceeBtBkIwnCIY=;
 b=XAej0ItsfLdKkDSijLpcltGoE2O+o8CNNdFe2/DUoE6gwFMu2Lyjur+NuNvz7zrqTV
 FL84yKdC0VRb+ND/X10ev9shuRLjOmmhDZuxC2J+Gp2YU6N7EV83kDwl3fSRf5zfJTFo
 ps7fcI8ZHjLPFdpoRF2ZP95ySkYXYIPNpmRj4WLITqfMmq+1LF6P8cLz3BZpYi3tC69w
 h4KRBEdNTgwqBQR62Z5y+E5k/jDjzSQ5VCcbMGccLf4mu5nMUUb2kWDxof3WC9MArBME
 mRl6cVHeCZIzMTX4tQjBSAJ1GwJQFR3mhd77KoeUhicHo5FPTBPEMUTbl+F8WeHu++EI
 Dgaw==
X-Gm-Message-State: AOAM5317ev4yLr2p5Mmib7MP4ifr3hedgPur7as6rzpN3lxxQ7BZW5MD
 pgB3TjKyFXyBfYfkZwooBIPoFaZfBfhc+g==
X-Google-Smtp-Source: ABdhPJxUKfNN19t0KSIPJN2EIINriDrLZT1JlOzqzp2/WkQ8612c+pT884QmriNFewXmRImP90uYAA==
X-Received: by 2002:a17:90a:b88c:: with SMTP id
 o12mr3324763pjr.43.1600252687945; 
 Wed, 16 Sep 2020 03:38:07 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id x3sm16932724pfo.95.2020.09.16.03.38.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:38:07 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:45 +0530
Message-Id: <cover.1600252542.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2 00/17] syscalls: Use common variants structure
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

As you suggested earlier, here is an attempt to use a common structure
prototype at most of the places.

futex, clock_adjtime() and clock_getres() tests are left with their own
implementations due to compatibility issues.

V2:
- Remove local copy of poll.h as it was making the build fail with this
  patchset for some of the syscalls (mq_timedsend/receive).
- Use poll.h instead of sys/poll.h
- Use libaio stuff from within macros in the 2st patch.
- Only first two patches are updated, rest are all the same.

--
viresh

Viresh Kumar (17):
  syscalls: utils: Remove local copy of poll.h definitions
  syscalls: Add common time64 variants structure
  syscalls: clock_gettime: Reuse struct time64_variants
  syscalls: clock_nanosleep: Reuse struct time64_variants
  syscalls: clock_settime: Reuse struct time64_variants
  syscalls: io_pgetevents: Reuse struct time64_variants
  syscalls: semop: Reuse struct time64_variants
  syscalls: mq_timed: Reuse struct time64_variants
  syscalls: ppoll: Reuse struct time64_variants
  syscalls: rt_sigtimedwait: Reuse struct time64_variants
  syscalls: sched_rr_get_interval: Reuse struct time64_variants
  syscalls: sendmmsg: Reuse struct time64_variants
  syscalls: timer_settime: Reuse struct time64_variants
  syscalls: timer_gettime: Reuse struct time64_variants
  syscalls: timerfd: Reuse struct time64_variants
  syscalls: utimensat: Reuse struct time64_variants
  futex: Move variants struct definition to common header

 include/time64_variants.h                     | 65 +++++++++++++++++++
 .../syscalls/clock_gettime/clock_gettime01.c  | 19 +++---
 .../syscalls/clock_gettime/clock_gettime02.c  | 17 ++---
 .../syscalls/clock_gettime/clock_gettime03.c  | 27 ++++----
 .../syscalls/clock_gettime/clock_gettime04.c  | 29 ++++-----
 .../clock_nanosleep/clock_nanosleep01.c       | 21 +++---
 .../clock_nanosleep/clock_nanosleep03.c       | 26 ++++----
 .../clock_nanosleep/clock_nanosleep04.c       | 22 +++----
 .../syscalls/clock_settime/clock_settime01.c  | 26 ++++----
 .../syscalls/clock_settime/clock_settime02.c  | 20 +++---
 .../syscalls/clock_settime/clock_settime03.c  | 22 +++----
 .../syscalls/futex/futex_cmp_requeue01.c      | 12 ++--
 .../syscalls/futex/futex_cmp_requeue02.c      |  9 +--
 .../kernel/syscalls/futex/futex_wait01.c      | 10 +--
 .../kernel/syscalls/futex/futex_wait02.c      | 11 ++--
 .../kernel/syscalls/futex/futex_wait03.c      | 11 ++--
 .../kernel/syscalls/futex/futex_wait04.c      | 10 +--
 .../syscalls/futex/futex_wait_bitset01.c      | 11 +---
 .../kernel/syscalls/futex/futex_wake01.c      |  9 +--
 .../kernel/syscalls/futex/futex_wake02.c      | 11 ++--
 .../kernel/syscalls/futex/futex_wake03.c      | 13 ++--
 .../kernel/syscalls/futex/futex_wake04.c      | 14 ++--
 testcases/kernel/syscalls/futex/futextest.h   |  7 ++
 .../syscalls/io_pgetevents/io_pgetevents01.c  | 16 ++---
 .../syscalls/io_pgetevents/io_pgetevents02.c  | 18 ++---
 testcases/kernel/syscalls/ipc/semop/semop.h   | 18 ++---
 testcases/kernel/syscalls/ipc/semop/semop01.c |  6 +-
 testcases/kernel/syscalls/ipc/semop/semop02.c |  6 +-
 testcases/kernel/syscalls/ipc/semop/semop03.c |  6 +-
 .../mq_timedreceive/mq_timedreceive01.c       | 14 ++--
 .../syscalls/mq_timedsend/mq_timedsend01.c    | 16 ++---
 testcases/kernel/syscalls/ppoll/ppoll01.c     | 21 +++---
 .../rt_sigtimedwait/rt_sigtimedwait01.c       | 15 ++---
 .../sched_rr_get_interval01.c                 | 21 +++---
 .../sched_rr_get_interval02.c                 | 21 +++---
 .../sched_rr_get_interval03.c                 | 21 +++---
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 24 +++----
 .../syscalls/timer_gettime/timer_gettime01.c  | 21 +++---
 .../syscalls/timer_settime/timer_settime01.c  | 25 +++----
 .../syscalls/timer_settime/timer_settime02.c  | 18 ++---
 testcases/kernel/syscalls/timerfd/timerfd01.c | 27 ++++----
 testcases/kernel/syscalls/timerfd/timerfd04.c | 20 +++---
 .../syscalls/timerfd/timerfd_gettime01.c      |  8 +--
 .../syscalls/timerfd/timerfd_settime01.c      | 17 ++---
 .../syscalls/timerfd/timerfd_settime02.c      | 15 ++---
 testcases/kernel/syscalls/utils/mq_timed.h    | 18 ++---
 testcases/kernel/syscalls/utils/poll.h        | 27 --------
 .../kernel/syscalls/utimensat/utimensat01.c   | 18 ++---
 48 files changed, 376 insertions(+), 483 deletions(-)
 create mode 100644 include/time64_variants.h
 delete mode 100644 testcases/kernel/syscalls/utils/poll.h

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
