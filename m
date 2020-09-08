Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E05260AB9
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:19:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B75F13C2DE5
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:19:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1C3F73C180A
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:19:43 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 83646201012
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:19:42 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id u13so9333960pgh.1
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mrYFXJu7NFcgxJmqE1us1TnvLJ3ZDLG+0mvzDBf9kdk=;
 b=OSOpnbLA4q3Lx1Y2kugDShEAZXME1MkMqXp5CV39/1AZpaGJSdmtelgEKXOyMKmc85
 ulctD72wwtA91qdVDv3hhAKuFOg8fgdYLyJdBn6pVAiqE8i9BIrcX05lfJ8cx4DXOz4K
 GXcyFP5d3LM8BhMv6ZPaP0JwYtD1L8jKxIRZSWULdAvfoj6gr/3HGbRKwyOl1oBI1RF9
 aMS8mUkRInntK3Ndywt49R24sFC4paZJWP3H4llK6uL2uhpArDxrhRjvP7i3dqIRbBt7
 mVyS/EV4QBDMS8JvwcUTL+t4lL2Joq+WBvy8aZihZg4x2hNc3QJ6Fo4tGSrvF0uWMdWS
 kLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mrYFXJu7NFcgxJmqE1us1TnvLJ3ZDLG+0mvzDBf9kdk=;
 b=WJqNwxaENr4IKqmAMKcT7uOGBDrb36vSXTDqlCpl+/STtoZKWksKFMjUSRDj07ydFr
 PcWLxZ6Sv3sNDstWWg7NRgfiSuq0Qi1JYWBcc1qujBqwPFP6UYc+9t8DW3qc+RM4dxl+
 3QKE+oThWIxbr8o/C9+p+3HSIr8fVWlmyE3ko52JTK/azohj+hXEewCeTMyPSWn3F+7m
 7ETpjyb4FpQ3bXJtn+CWcaLZEoxDUBr7+uSW+h28iM2TKAjlFxCGIV4fwv5Awrqsr4FD
 fImhFCtlMQcpuz6YRJanr/aBaBmIQeFbOQLsar5yncwMjQOHA405jhOeCZ4vZ8hAEZGe
 GODg==
X-Gm-Message-State: AOAM532L7/dRRJK+ecgJALZjajBKBoyKZ9zgUcMPUSTXukDQ+IkVetAB
 t7JX27tSsmxl8DeWDaeyqZ87XPKG9+l/XQ==
X-Google-Smtp-Source: ABdhPJyks9qcTtbVeUTAYwuYQ7ZyHtAnxMlH9HexrzV+J9vwPTmIKkQR7rWnNdleGwGquVJqkukwsg==
X-Received: by 2002:aa7:8b02:: with SMTP id f2mr21935849pfd.59.1599545980302; 
 Mon, 07 Sep 2020 23:19:40 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 131sm15008947pgh.67.2020.09.07.23.19.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:19:39 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:13 +0530
Message-Id: <cover.1599545766.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 00/16] syscalls: Use common variants structure
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

--
viresh

Viresh Kumar (16):
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

 include/time64_variants.h                     | 56 +++++++++++++++++++
 .../syscalls/clock_gettime/clock_gettime01.c  | 19 +++----
 .../syscalls/clock_gettime/clock_gettime02.c  | 17 +++---
 .../syscalls/clock_gettime/clock_gettime03.c  | 27 ++++-----
 .../syscalls/clock_gettime/clock_gettime04.c  | 29 +++++-----
 .../clock_nanosleep/clock_nanosleep01.c       | 21 +++----
 .../clock_nanosleep/clock_nanosleep03.c       | 26 ++++-----
 .../clock_nanosleep/clock_nanosleep04.c       | 22 +++-----
 .../syscalls/clock_settime/clock_settime01.c  | 26 ++++-----
 .../syscalls/clock_settime/clock_settime02.c  | 20 +++----
 .../syscalls/clock_settime/clock_settime03.c  | 22 +++-----
 .../syscalls/futex/futex_cmp_requeue01.c      | 12 ++--
 .../syscalls/futex/futex_cmp_requeue02.c      |  9 +--
 .../kernel/syscalls/futex/futex_wait01.c      | 10 +---
 .../kernel/syscalls/futex/futex_wait02.c      | 11 ++--
 .../kernel/syscalls/futex/futex_wait03.c      | 11 ++--
 .../kernel/syscalls/futex/futex_wait04.c      | 10 +---
 .../syscalls/futex/futex_wait_bitset01.c      | 11 +---
 .../kernel/syscalls/futex/futex_wake01.c      |  9 +--
 .../kernel/syscalls/futex/futex_wake02.c      | 11 ++--
 .../kernel/syscalls/futex/futex_wake03.c      | 13 ++---
 .../kernel/syscalls/futex/futex_wake04.c      | 14 ++---
 testcases/kernel/syscalls/futex/futextest.h   |  7 +++
 .../syscalls/io_pgetevents/io_pgetevents01.c  | 16 ++----
 .../syscalls/io_pgetevents/io_pgetevents02.c  | 18 +++---
 testcases/kernel/syscalls/ipc/semop/semop.h   | 18 +++---
 testcases/kernel/syscalls/ipc/semop/semop01.c |  6 +-
 testcases/kernel/syscalls/ipc/semop/semop02.c |  6 +-
 testcases/kernel/syscalls/ipc/semop/semop03.c |  6 +-
 .../mq_timedreceive/mq_timedreceive01.c       | 14 ++---
 .../syscalls/mq_timedsend/mq_timedsend01.c    | 16 +++---
 testcases/kernel/syscalls/ppoll/ppoll01.c     | 21 +++----
 .../rt_sigtimedwait/rt_sigtimedwait01.c       | 15 ++---
 .../sched_rr_get_interval01.c                 | 21 +++----
 .../sched_rr_get_interval02.c                 | 21 +++----
 .../sched_rr_get_interval03.c                 | 21 +++----
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 24 +++-----
 .../syscalls/timer_gettime/timer_gettime01.c  | 21 +++----
 .../syscalls/timer_settime/timer_settime01.c  | 25 ++++-----
 .../syscalls/timer_settime/timer_settime02.c  | 18 +++---
 testcases/kernel/syscalls/timerfd/timerfd01.c | 27 ++++-----
 testcases/kernel/syscalls/timerfd/timerfd04.c | 20 +++----
 .../syscalls/timerfd/timerfd_gettime01.c      |  8 +--
 .../syscalls/timerfd/timerfd_settime01.c      | 17 +++---
 .../syscalls/timerfd/timerfd_settime02.c      | 15 ++---
 testcases/kernel/syscalls/utils/mq_timed.h    | 18 ++----
 .../kernel/syscalls/utimensat/utimensat01.c   | 18 +++---
 47 files changed, 367 insertions(+), 456 deletions(-)
 create mode 100644 include/time64_variants.h

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
