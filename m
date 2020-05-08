Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F38821CA200
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:24:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7E143C7193
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:24:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B1A263C6C45
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:11 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 93377601BE5
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:10 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id r14so296502pfg.2
 for <ltp@lists.linux.it>; Thu, 07 May 2020 21:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RZo27O9ogEQkBHyF6v70s6WKndKb6iQVGeoRRJy/AsQ=;
 b=pb+cUJKKUTQYZD+29Q027++e7e6/8HOza9g7+dwdmNmEIm+u+P1zjoXToJFWplvQH8
 QdJA1SEXnMBsrNMTL2qjNAm6QUxSRHxsadkkddIWjtXSia+OqqxN5vSoMZltaLTbPAMF
 Z4c4fVJDUBafjjjjnqMCeZ3LAUCoK0CIc3IWn93T0mXo0Gv4BnrxCwM4QWgJt0jAeU/Y
 p9bcoIPqoOG4yliDOociHs2Vi4cuh6muPGiZ31d0zKuTHCLGx3m12Ytpap1mkY6znATq
 Sbc4LMiNcZxuZD1rhMOZRIihhCkrq5JNyIYBwv4BjnY9eskeA4YeggKMvGQXB1ZNHm4t
 78Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RZo27O9ogEQkBHyF6v70s6WKndKb6iQVGeoRRJy/AsQ=;
 b=InYg2vwm3zG98Xz7NAe18Yu2UcP/ku8nixUEA6tOxSBmufXBAeSY0D9ZTkwLmWQPiY
 zswZwozpSUH1TV+JVxYSmstjqdorPU/1kRVYGVY/LVcJdvObmDJ2UjwF8kQC0RZ5rg1f
 bAtrR4M+qEpQNd75K0PcHuOF3pJnGEPekXPym8n/TtijMhONT3kUB4fhn+RlvVjCa9Q+
 jdqJawwtq3MR3vY/Zl8o+2wRSND2d2TbpJzcFRScIn+FvYPdqUp8u3aUfrBcVTs8jMGD
 WYIqhkjftZo0pPylZzZRpr+2yfes8gL8eaa/zyybCMgn6MndPGWx/ts/Dmdcd3HjFRxd
 h26w==
X-Gm-Message-State: AGi0PuaB5rMx6Zcl69lNWFMlS0i5Ipl4sKe07KAcGRqTvvnhseL9y5xt
 XyXNw0SP77TMS5ecw5/oHRdH1vYopww=
X-Google-Smtp-Source: APiQypL/YsQGaPmRpc/FG20v0sClMu/AgPXzQihB5uaEKG++xz5il1EumHzNcLsCPZCkXHbyRGu34g==
X-Received: by 2002:a62:6443:: with SMTP id y64mr863320pfb.100.1588911846997; 
 Thu, 07 May 2020 21:24:06 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id c2sm340543pfp.118.2020.05.07.21.24.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:24:06 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri,  8 May 2020 09:53:45 +0530
Message-Id: <cover.1588911607.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V2 00/17] Syscalls: Add support for time64 variants
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

Hi Cyril/Petr,

This replaces all my pending patches that I have sent earlier and not
applied yet. I am sending them all together (along with few new patches)
to avoid any rebase conflicts as reported by Petr.

I have also fixed the GPL licensing thing that Petr asked for at several
files in this V2. Otherwise no difference in the patches.

With this I have completed the time64 support for all the syscalls
tests.

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
 include/tst_timer.h                           | 191 +++++++
 runtest/syscalls                              |   1 -
 testcases/kernel/syscalls/futex/.gitignore    |   1 -
 testcases/kernel/syscalls/futex/Makefile      |   1 -
 .../syscalls/futex/futex_cmp_requeue01.c      |  35 +-
 .../syscalls/futex/futex_cmp_requeue02.c      |  25 +-
 testcases/kernel/syscalls/futex/futex_utils.h |  52 +-
 .../kernel/syscalls/futex/futex_wait01.c      |  83 +--
 .../kernel/syscalls/futex/futex_wait02.c      | 104 ++--
 .../kernel/syscalls/futex/futex_wait03.c      |  91 +--
 .../kernel/syscalls/futex/futex_wait04.c      |  85 +--
 .../kernel/syscalls/futex/futex_wait05.c      |   2 +-
 .../kernel/syscalls/futex/futex_wait_bitset.h |  75 ---
 .../syscalls/futex/futex_wait_bitset01.c      | 103 +++-
 .../syscalls/futex/futex_wait_bitset02.c      |  18 -
 .../kernel/syscalls/futex/futex_wake01.c      |  71 ++-
 .../kernel/syscalls/futex/futex_wake02.c      |  99 ++--
 .../kernel/syscalls/futex/futex_wake03.c      | 111 ++--
 .../kernel/syscalls/futex/futex_wake04.c      | 150 ++---
 testcases/kernel/syscalls/futex/futextest.h   | 111 ++--
 .../syscalls/io_pgetevents/io_pgetevents01.c  |  41 +-
 .../syscalls/io_pgetevents/io_pgetevents02.c  |  59 +-
 testcases/kernel/syscalls/ipc/semop/Makefile  |   2 +-
 testcases/kernel/syscalls/ipc/semop/semop.h   |  52 ++
 testcases/kernel/syscalls/ipc/semop/semop01.c | 145 +++--
 testcases/kernel/syscalls/ipc/semop/semop02.c | 153 +++---
 testcases/kernel/syscalls/ipc/semop/semop03.c | 160 ++----
 testcases/kernel/syscalls/ipc/semop/semop04.c | 173 +++---
 testcases/kernel/syscalls/ipc/semop/semop05.c | 309 +++++------
 .../mq_timedreceive/mq_timedreceive01.c       |  97 +++-
 .../syscalls/mq_timedsend/mq_timedsend01.c    | 101 ++--
 testcases/kernel/syscalls/ppoll/ppoll01.c     |  76 ++-
 .../sched_rr_get_interval01.c                 | 131 ++---
 .../sched_rr_get_interval02.c                 | 137 ++---
 .../sched_rr_get_interval03.c                 | 151 +++--
 testcases/kernel/syscalls/select/select_var.h |  27 +-
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     |  45 +-
 .../kernel/syscalls/sendmmsg/sendmmsg_var.h   |  55 +-
 .../syscalls/sigwaitinfo/sigwaitinfo01.c      | 317 ++++++-----
 .../syscalls/timer_gettime/timer_gettime01.c  | 135 ++---
 .../syscalls/timer_settime/timer_settime01.c  |  51 +-
 .../syscalls/timer_settime/timer_settime02.c  |  65 ++-
 testcases/kernel/syscalls/timerfd/timerfd01.c |  58 +-
 testcases/kernel/syscalls/timerfd/timerfd04.c |  56 +-
 .../syscalls/timerfd/timerfd_gettime01.c      | 138 +++--
 .../syscalls/timerfd/timerfd_settime01.c      | 139 +++--
 .../syscalls/timerfd/timerfd_settime02.c      |  33 +-
 testcases/kernel/syscalls/utils/mq_timed.h    |  42 +-
 .../kernel/syscalls/utimensat/utimensat01.c   | 469 ++++++++--------
 .../syscalls/utimensat/utimensat_tests.sh     | 517 ------------------
 51 files changed, 2657 insertions(+), 2701 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/futex/futex_wait_bitset.h
 delete mode 100644 testcases/kernel/syscalls/futex/futex_wait_bitset02.c
 create mode 100644 testcases/kernel/syscalls/ipc/semop/semop.h
 delete mode 100755 testcases/kernel/syscalls/utimensat/utimensat_tests.sh

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
