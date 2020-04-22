Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB231B36D9
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:37:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D67C83C299B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:37:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4A9943C2960
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:37:34 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E99991400B7F
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:37:33 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id e6so440228pjt.4
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 22:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oeGHlWwjWv1Jr1qzD9CB1Sc+ye7SQfx0tal7eviJaJw=;
 b=BjrYdUtCy7sFgW0sOayV+MGaKcScYKpUR6D9kWPT7oz7SGaxMPpm03GUCNI2T7bvTC
 aDJmuB+GZe4Qh1vySo8MvSCA3CCRy9DNjn03NhbJaOz96QkrJ3mV2aNdDm5ZlboM8oc+
 WBgCKGSERLv4vfXmFW77VTlyTpcFjrzfxuPwYud6mdqqDzy/YnuUoYEiajrU6zn+djae
 qK5rIlki1h8fLEYkD/vFzVWDgejmTKP79PJnRoUl1P8v9md6n6o865IyDNTwmvNgwSlH
 AO4tVPIescfD3WUulMs+CDTR3mgpb7VpJKws5ng9AxNVwu5XMrKc3edslOFbldJuQmNQ
 jmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oeGHlWwjWv1Jr1qzD9CB1Sc+ye7SQfx0tal7eviJaJw=;
 b=g7C+2UfYOb+5BqAmLPV1TtkZUhMcpR3M1hET6kbcLOZs9hdqBe/18sRA83IsDTyCsx
 9CeOkb5HjfW785J1cJQ5Dmj5XVX0h6R88SQ9F8uxYLHa3FdBmZNNbwLKMcK8kmFtoOGd
 cRviarvgQZMuYDpfalNqNtJH2+ISeg+y21lpLgKtp4Lfyw1ESJBb9To6sW0tNgozE53p
 Rl/2ZyzeqYgvnFW0QfvQlaiyRKSKXsyVUfGOuTZHn/bHPfICI/K8wkfZtRqqyyRwmQHx
 fMHZlgHBOA1jBixZqDuv0X5bZ1/93h9bt2WNtvynST+RM8B9KBjNSVmxt7UkQJUXg+gI
 KDxQ==
X-Gm-Message-State: AGi0PubAMQFoH6bBpfqNCXyMFstxkuNmPLWGSpYU6hnA6U5cwOSHr8jw
 1Fz1861sfzoab/qmWLmcFE4rRpwkriY=
X-Google-Smtp-Source: APiQypLntD2p5M5TW/Kx3qz5X1F/zdHEtbNA2zb+F8k0MsJLLPx0n2rBRsbFeP6x3VVb/Eieq9LLzg==
X-Received: by 2002:a17:902:7588:: with SMTP id
 j8mr10040359pll.98.1587533851838; 
 Tue, 21 Apr 2020 22:37:31 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id v32sm686111pgn.35.2020.04.21.22.37.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Apr 2020 22:37:30 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 11:07:21 +0530
Message-Id: <cover.1587533697.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V4 0/5] syscalls/clock_*(): Add support for time64
 variants
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

Hello,

Here is the fourth version of this series and here are the changes since
v3.

V3->V4:
- Dropped the first patch, it is already applied by Cyril.
- Update clock_gettime() patch (1/5), according to the changes Cyril
  made.
- Rest four patches (2-5/5) are posted for the first time here.

--
Viresh

Viresh Kumar (5):
  syscalls/clock_gettime: Add support for time64 tests
  syscalls/clock_settime: Add support for time64 tests
  syscalls/clock_getres: Add support for time64 tests
  syscalls/clock_nanosleep: Add support for time64 tests
  syscalls/clock_adjtime: Add support for time64 tests

 include/tst_timer.h                           | 122 +++++++++-
 runtest/syscalls                              |   2 +-
 .../syscalls/clock_adjtime/clock_adjtime.h    | 220 +++++++++++++++---
 .../syscalls/clock_adjtime/clock_adjtime01.c  | 124 ++++++----
 .../syscalls/clock_adjtime/clock_adjtime02.c  |  90 +++++--
 .../syscalls/clock_getres/clock_getres01.c    |  58 +++--
 .../syscalls/clock_gettime/clock_gettime01.c  | 116 +++++----
 .../syscalls/clock_gettime/clock_gettime02.c  |  72 +++---
 .../syscalls/clock_gettime/clock_gettime03.c  |  58 ++++-
 .../syscalls/clock_nanosleep/.gitignore       |   1 +
 .../clock_nanosleep/clock_nanosleep01.c       | 102 ++++++--
 .../clock_nanosleep/clock_nanosleep03.c       |  68 +++++-
 .../clock_nanosleep/clock_nanosleep04.c       |  90 +++++++
 .../syscalls/clock_nanosleep2/.gitignore      |   1 -
 .../kernel/syscalls/clock_nanosleep2/Makefile |  10 -
 .../clock_nanosleep2/clock_nanosleep2_01.c    |  45 ----
 .../syscalls/clock_settime/clock_settime01.c  |  87 +++++--
 .../syscalls/clock_settime/clock_settime02.c  |  95 +++++---
 18 files changed, 993 insertions(+), 368 deletions(-)
 create mode 100644 testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c
 delete mode 100644 testcases/kernel/syscalls/clock_nanosleep2/.gitignore
 delete mode 100644 testcases/kernel/syscalls/clock_nanosleep2/Makefile
 delete mode 100644 testcases/kernel/syscalls/clock_nanosleep2/clock_nanosleep2_01.c

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
