Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B51D9280
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:51:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 046093C4E78
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:51:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id AB3B53C2238
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:18 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E8F8B200DB1
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:17 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id x13so6198711pfn.11
 for <ltp@lists.linux.it>; Tue, 19 May 2020 01:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t6UuprNjS2rcuOp+eX48aQCuVh2n/4vJBb9Q+1hA2F4=;
 b=bVvb0hgLS9HLHAWXM2cNcJyC2ytslaRQt+3WHd2vRlB6uNUBIYPPZmus+jI7/BWQG7
 vGQ83wBmuqr+8m/TbkmplRaz/dJuIZAHlhQ2Sn3ShTvPZGrbunxWjLEWEx3EEgCjyTyz
 pSGm7cikN3uZQDNK50MLP9mdfevLhs5Kg2HHMggJDKqNdZP6HyNnZE/oD9cGuHpZJ9hm
 aQAW3z3vzuPDMXqQn4fvAVLVULhPv7mat8tEQO+l2BjPjjybcl8JMZJPp17PMMEm2bOH
 kmpyGV8hNIPCYd6GYzl4YgecGq25M535yLOnd8UgJKB86+zCaT3g2PeD64A6kmDLeNZI
 WKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t6UuprNjS2rcuOp+eX48aQCuVh2n/4vJBb9Q+1hA2F4=;
 b=DDLx+2//kATuYjy0GzoTYJ2EvSU5f+FZefhOdDVCl/DzpyPM59V8Uxp3D7mxUFqTMb
 5z0bjHnRH0KpDWaEyTWOw19fddXFHf7TcDen7a7jEqf/Q+Atci8y4QcpqJW7nEo90pb2
 TRC3nMsG7rjwdl+G99h8vLORxAe5NmjmoyCxOrq0L2Vvcd2YsiBAnyImc9/mSYGTYquG
 lAhotPrcan11XM35upLIbiBtzBivUZDy8sg4WjpH9bk0pVMKwGyO5MR9X5vShDa6av5p
 5PS5T0lIcJvlL6DKb4rYG2scKvFEspbxaM1d/A/uWB6SPFKUIUCDMs56Nhs2uJWLB35D
 gnkQ==
X-Gm-Message-State: AOAM530n+f6xn79bbijZOyHyDN5eKaWKDPkxhtf7Wow5EAiSeVYbz0Yf
 osezTnsw40xqAzlvDFV2kFPKh+PjA0E=
X-Google-Smtp-Source: ABdhPJwGU3Nh//AnGN1GAYMCMy3rnr+fQ2gT9q/SRKoSgNdlbzdq11M/dp8iVpytP7u9/5ZzroXVzQ==
X-Received: by 2002:a63:514:: with SMTP id 20mr18589341pgf.150.1589878276047; 
 Tue, 19 May 2020 01:51:16 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id e12sm9609472pgi.40.2020.05.19.01.51.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 01:51:15 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 19 May 2020 14:21:07 +0530
Message-Id: <cover.1589877853.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/5] syscalls: Remove incorrect usage of libc
 structures
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

It is incorrect to use the libc structures (timespec, timeval, timex),
to the non-timex64 syscalls called via tst_syscall() as the kernel
expects the old structures in there and the libc structure definition
may change in the future.

Arnd: It was getting difficult to search for such instances and so I
searched it with following strings (search for files that use these
structures, as well as tst_syscall()) to catch the abuse, hope it covers
all cases.

git grep "struct timeval" `git grep -l tst_syscall`
git grep "struct timespec" `git grep -l tst_syscall`
git grep "struct timex" `git grep -l tst_syscall`

Viresh Kumar (5):
  tst_safe_clocks: Remove safe_clock_adjtime()
  syscalls: settimeofday: Use gettimeofday()
  syscalls: Don't use tst_syscall() unnecessarily
  syscalls: Don't pass struct timespec to tst_syscall()
  syscalls: Don't pass struct timeval to tst_syscall()

 include/tst_clocks.h                          |  8 ++++---
 include/tst_safe_clocks.h                     | 18 ---------------
 include/tst_timer.h                           |  6 +++++
 lib/parse_opts.c                              |  3 +--
 lib/tst_clocks.c                              |  6 ++---
 lib/tst_test.c                                | 16 ++++++-------
 lib/tst_timer.c                               | 23 ++++++++++++-------
 lib/tst_timer_test.c                          |  2 +-
 lib/tst_wallclock.c                           | 17 +++++++-------
 testcases/cve/cve-2016-7117.c                 |  2 +-
 .../syscalls/clock_adjtime/clock_adjtime.h    |  5 ----
 .../syscalls/gettimeofday/gettimeofday02.c    |  3 ++-
 .../syscalls/settimeofday/settimeofday01.c    |  6 ++---
 .../syscalls/settimeofday/settimeofday02.c    |  2 +-
 testcases/kernel/syscalls/stime/stime_var.h   |  3 ++-
 15 files changed, 57 insertions(+), 63 deletions(-)

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
