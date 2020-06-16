Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2550C1FADC0
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:20:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9282C3C2D04
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:20:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E7DC03C2CF3
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:31 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7258E1022B1F
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:30 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id s135so8343452pgs.2
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v26IQzqq4YmmfVnRjQo0TrcvMSvYjf+pGq8BSI+15/0=;
 b=NeRz+0GFssGWNwIbpwlmsQZ9y9a8+k1yj9LmfuVEIOYEtl3nVpSRvoCECdGHtYEs1K
 HNGs+NwNLq52jjS8/etP523K4riDZleHyq6LI0ww3US8I0KMqd4BfoDHWJjWoscIx02a
 EnBFILnUx+vGU/OwjTk1h2ih6MlUJZcDwPRAJiRy4tbqWRM1Hz8wkGU2E5vVVd0+G1a/
 YSSCQAHNW7LQy+w0AJFmaW06txcU+KGcLGf9i/e1EIXUBXXI9ithSgZ8519NDj0Lnnce
 cwfn399PuiGUXP7EQpYyvxAQjaIwCSaDL4c2WeIaMLCu6CkS850F49gxFl0xpnbTC00Y
 I6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v26IQzqq4YmmfVnRjQo0TrcvMSvYjf+pGq8BSI+15/0=;
 b=Hjyp+wAWs8Gr2Dky9eGaIIbAo6J+13xzirzKoEPa1bU/ZAek81Hn7zDkUN6qYFGLC7
 7g12l4KtL5IJPB6Vz0+nAQ7lhPxD0+yG7qSwEZQ1lqRYd9+wkSaRRgFeLbKjV3iR5qrI
 cpQqq4QttzNeP6+OwZkGlyr7GH/+9k0RpKbJeLYh0LcSq7GOc6snRIENjWqAmFyDoFsx
 SQvORuZpZl6yH2dlRakmYX0eLYh29q4OCOeOMU8AXU7mzc2CvmBgh70bKdgTewKqvUIp
 5GKs0/K0Vyk/PFykOmx93g7pI0tra/U2xouAngA7BPB4tiVlsEhn+0Kntlwpq1MGwv3U
 2zXQ==
X-Gm-Message-State: AOAM532vZz53DmNGv96sWkz4wlupH7TQ0g+KsoZifjjpDmCsKb0RPMAI
 gz4GBoxN7LWCr6+GZQ1E2ah43aPLtpI=
X-Google-Smtp-Source: ABdhPJyurn05VuClfJ9lFov0er0ELb8ivbv4O+UQPZrk7F9gVRdbhhpkuebN65lP/26hHfyqp6eIfA==
X-Received: by 2002:a62:154f:: with SMTP id 76mr1479695pfv.322.1592302828728; 
 Tue, 16 Jun 2020 03:20:28 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id y69sm12159869pfg.207.2020.06.16.03.20.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 03:20:28 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 16 Jun 2020 15:50:18 +0530
Message-Id: <cover.1592302358.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 0/6] syscalls: Add tests to verify the _time_high
 fields
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

This patchset adds a new tests to three syscalls to verify that the
extended fields, _time_high, are cleared by the kernel. This was
suggested by Arnd.

V2:
- Separate out structure definitions to separate patches.
- Drop first two patches from V1 as they are already applied.
- Minor makefile fixes.

Viresh Kumar (6):
  include: Add declaration of struct semid64_ds
  syscalls: semctl: Add new test to verify the _time_high fields
  include: Add declaration of struct shmid64_ds
  syscalls: shmctl: Add new test to verify the _time_high fields
  include: Add declaration of struct msqid64_ds
  syscalls: msgctl: Add new test to verify the _time_high fields

 configure.ac                                  |   3 +
 include/lapi/msgbuf.h                         | 306 ++++++++++++++++++
 include/lapi/sembuf.h                         | 234 ++++++++++++++
 include/lapi/shmbuf.h                         | 273 ++++++++++++++++
 runtest/syscalls                              |   3 +
 runtest/syscalls-ipc                          |   3 +
 .../kernel/syscalls/ipc/msgctl/.gitignore     |   1 +
 .../kernel/syscalls/ipc/msgctl/msgctl05.c     |  48 +++
 .../kernel/syscalls/ipc/semctl/.gitignore     |   1 +
 testcases/kernel/syscalls/ipc/semctl/Makefile |   5 +-
 .../kernel/syscalls/ipc/semctl/semctl08.c     |  52 +++
 .../kernel/syscalls/ipc/shmctl/.gitignore     |   1 +
 testcases/kernel/syscalls/ipc/shmctl/Makefile |   5 +-
 .../kernel/syscalls/ipc/shmctl/shmctl06.c     |  51 +++
 14 files changed, 983 insertions(+), 3 deletions(-)
 create mode 100644 include/lapi/msgbuf.h
 create mode 100644 include/lapi/sembuf.h
 create mode 100644 include/lapi/shmbuf.h
 create mode 100644 testcases/kernel/syscalls/ipc/msgctl/msgctl05.c
 create mode 100644 testcases/kernel/syscalls/ipc/semctl/semctl08.c
 create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl06.c

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
