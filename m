Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D771DE02A
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:54:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A8D13C4CC4
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:54:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7DA273C2313
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:20 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 935AB1000CA3
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:19 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id p30so4567252pgl.11
 for <ltp@lists.linux.it>; Thu, 21 May 2020 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C9WdV4NM5sfJHvdsg3lTEl/KpuK3tjIe4YK9ECWr8C0=;
 b=elZTI1lLTPiT6C5t0BWgU/rwk8GplEny6eY8g3qHTSxFeaQjaxvZdCVgktu9DzxsvB
 bQ0kHbikZxcR1znGfAEeoANU9L33UrVK8a3bqi+KDyjur8Yy06psqgm3xh4/GriCt4lg
 k+REE7C9R+ioM8cKjSRpc/94MmqofcMKRcsVKpBLfMq+E+TST0Ksk86XL24j9j9zU/Du
 Ie28gixsCyDdQXcvxGSKfp+d7cnW4b6k+BNK5cPYwPhd+s1CziMw7QfLgjhYB50uxawJ
 Vbo+3bZ9T/tSTN0/Z0taB4bB0r0V0xsCt6easKPGq77U4G2Zs/Up2XKGm/B/3X4omln4
 JrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C9WdV4NM5sfJHvdsg3lTEl/KpuK3tjIe4YK9ECWr8C0=;
 b=sZgtqIuSVUFzUaA07R0j5docrFs4EuDyf+1m0KRY40qeon7HNHpDgMUL0Mc1nbqLXi
 vyBgChwVEmuxEdubvLht++cmA2KF95WiXp8M7LIwrL8B7xAqg2CwNtlKyy/9VclPIDUg
 NzrSk6CC1gmHtKWeoI302QS0+65kFXVMAOt5KhmCyUjz+mhm7a0fuzwm+Kq7HjA1DziD
 rgyrqMmUu9Ed8UhFHMxvBRhEOwCei86SJ76wrOdN6i+HkUNOUk3PeZJ5nz+2fMYpeFOc
 5WOPVKmlmTYyWLN1Gv1ziBKJ0YgnE40AUHZKZS0ob9vQuxOAMJGqacqNv4hmu0O0/BET
 4R4Q==
X-Gm-Message-State: AOAM532XWhC99nIWusgbsx6TDQISiRihDlC+915+CRIdV8wI6MU1w1Qf
 nr0J8CPF/UY0fzdqvpIdNI0OExlw7ow=
X-Google-Smtp-Source: ABdhPJxYeNniwEhJr72h5I9M9za8J/OH+FSF4BUOwVTwWZ5i2nDfMlH+5dROel0Vtbls+7dacNFUNw==
X-Received: by 2002:a62:5ec7:: with SMTP id s190mr2460480pfb.130.1590130457477; 
 Thu, 21 May 2020 23:54:17 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id d8sm5459702pgb.42.2020.05.21.23.54.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 23:54:15 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 12:24:06 +0530
Message-Id: <cover.1590130423.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 0/6] syscalls: Remove incorrect usage of libc
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
to the non-time64 syscalls called via tst_syscall() as the kernel
expects the old structures in there and the libc structure definition
may change in the future.

V2:
- Use .restore_wallclock flag and remove unnecessary restoration code.
- Update tst_clock_*() syscall's implementation instead of its users.

Viresh Kumar (6):
  tst_safe_clocks: Remove safe_clock_adjtime()
  syscalls: settimeofday01: Set .restore_wallclock flag
  syscalls: settimeofday02: Remove time restoration code
  syscalls: settimeofday: Use gettimeofday()
  syscalls: Don't pass struct timespec to tst_syscall()
  syscalls: Don't pass struct timeval to tst_syscall()

 include/tst_safe_clocks.h                     | 18 ------
 include/tst_timer.h                           |  6 ++
 lib/tst_clocks.c                              | 59 ++++++++++++++++++-
 .../syscalls/clock_adjtime/clock_adjtime.h    |  5 --
 .../syscalls/gettimeofday/gettimeofday02.c    |  3 +-
 .../syscalls/settimeofday/settimeofday01.c    | 21 +------
 .../syscalls/settimeofday/settimeofday02.c    | 21 -------
 testcases/kernel/syscalls/stime/stime_var.h   |  3 +-
 8 files changed, 69 insertions(+), 67 deletions(-)

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
