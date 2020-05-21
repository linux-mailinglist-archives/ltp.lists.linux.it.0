Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F06041DCB51
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 12:48:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B37FF3C4D99
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 12:48:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 216573C4D37
 for <ltp@lists.linux.it>; Thu, 21 May 2020 12:47:55 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 500A71000D8A
 for <ltp@lists.linux.it>; Thu, 21 May 2020 12:47:47 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id t16so2681590plo.7
 for <ltp@lists.linux.it>; Thu, 21 May 2020 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RGd3VxylWWRs0gfIZj+w6CuzBTIlHWppNCVx8ejbTFo=;
 b=HhzM+oGIECt0016hUSV+E5i41KcLNLRuh7RViP9lDACjdCeSU+9VtHG/9XcrIX+ERn
 hLYHdYuRo35F1OxNRviDtJ5h5bZVkOjP/ibuVzrm2s8EGCnYAY7FyWs6xmWQ1hGvzipn
 737muaHZTW5mtx7Be0NqfIVIgm/UC7/v35WWLwlXscyi1CdMGYuYM5R8AkiJK1esqGh2
 UKgvijDj/1uTmc+yo6p6CguSe/6ROCF69tRCTqiZudPtP5HGpk0PP81dpVJE5pjfwcqI
 LXXbveRIl2ImDy6pmlBtzYDnTltkii/0C6yQeApFRpF9nwggN1oCsBJZ1LOqnwKq1vJi
 W3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RGd3VxylWWRs0gfIZj+w6CuzBTIlHWppNCVx8ejbTFo=;
 b=X2W5x/mwuGqjsHhgL9G57KBgVAgsDdlElo2qix7JIeuck2lpVDeKzHEdRsbCk/1OEt
 W0tZI1WbsdHA6xxq4TP4/SDrL6sgJ4PGWCMa7gyKQ7hdGYKgSB9j1xvdki/K9cKdgHJz
 JCHf3rM2Iidft3oHQ7S16CRh0nPnr3x4jCDtKXYsWpldoe+4HYTwZe/ODpWoqZTC+0Ds
 S56S008duY3AZzPSv0vQ3lwMouapwlPnsDJvo0niXfth8+n93YN6K9dksVRS0FDfGd6V
 VjH9MR0mVEzyJBgMZiiM6FkeecztWr8FJnESnTNcecRngQKn1MYeZQVspcFAhLEqvsVo
 nrgA==
X-Gm-Message-State: AOAM5317/Uky3om01H6+evOUAq/mDmLchlPCovKuCyVwxk8eXXRu9xB8
 PFS/qgM1ftAQ1nMlvCbUphZuNn9SQko=
X-Google-Smtp-Source: ABdhPJxMBtNnFKsKY3lKSHL/+rAqP7jetgBu1i3JFZk/4yrGgd8UWaU1il8n5K19uNFBAHnJ4A9tvw==
X-Received: by 2002:a17:902:76c6:: with SMTP id
 j6mr8377658plt.342.1590058064801; 
 Thu, 21 May 2020 03:47:44 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id z190sm4201001pfz.84.2020.05.21.03.47.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 03:47:43 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 21 May 2020 16:17:31 +0530
Message-Id: <cover.1590057824.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 0/5] syscalls: Add tests to verify the _time_high
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

This patchset adds a new test to three syscalls to verify that the
extended fields, _time_high, are cleared by the kernel. This was
suggested by Arnd.

I did run them, but on a 64 bit machine. Please see if you can check
that they work properly on 32 bit machines, where we really want to test
them. This is rebased over ltp master.

Cyril, This conflicts a bit with my other time64 syscall tests, I will
rebase one of these, after you apply any of these first :)

Viresh Kumar (5):
  syscalls:ipc: Move libraries to libs/ director
  include: Add declaration of struct ipc64_perm
  syscalls: semctl: Add new test to verify the _time_high fields
  syscalls: shmctl: Add new test to verify the _time_high fields
  syscalls: msgctl: Add new test to verify the _time_high fields

 configure.ac                                  |   4 +
 include/ipcbuf.h                              |  45 +++
 .../syscalls/ipc/lib => include}/ipcmsg.h     |   0
 .../syscalls/ipc/lib => include}/ipcsem.h     |   0
 .../syscalls/ipc/lib => include}/ipcshm.h     |   0
 .../syscalls/ipc/lib => include}/libmsgctl.h  |   0
 .../ipc/libnewipc => include}/libnewipc.h     |   2 +
 include/msgbuf.h                              | 306 ++++++++++++++++++
 include/sembuf.h                              | 234 ++++++++++++++
 include/shmbuf.h                              | 273 ++++++++++++++++
 .../ipc/lib => libs/libltpipc}/Makefile       |   5 +-
 .../ipc/lib => libs/libltpipc}/libipc.c       |   0
 .../ipc/lib => libs/libltpipc}/libmsgctl.c    |   0
 .../libnewipc => libs/libltpnewipc}/Makefile  |   5 +-
 .../libltpnewipc}/libnewipc.c                 |   0
 runtest/syscalls                              |   3 +
 runtest/syscalls-ipc                          |   3 +
 testcases/kernel/syscalls/ipc/Makefile        |  22 --
 testcases/kernel/syscalls/ipc/Makefile.inc    |  28 --
 testcases/kernel/syscalls/ipc/Makefile2.inc   |  22 --
 .../kernel/syscalls/ipc/msgctl/.gitignore     |   1 +
 testcases/kernel/syscalls/ipc/msgctl/Makefile |   5 +-
 testcases/kernel/syscalls/ipc/msgctl/msgctl05 | Bin 0 -> 498784 bytes
 .../kernel/syscalls/ipc/msgctl/msgctl05.c     |  48 +++
 testcases/kernel/syscalls/ipc/msgget/Makefile |   5 +-
 testcases/kernel/syscalls/ipc/msgrcv/Makefile |   5 +-
 .../kernel/syscalls/ipc/msgrcv/msgrcv01.c     |   2 +-
 .../kernel/syscalls/ipc/msgrcv/msgrcv02.c     |   2 +-
 .../kernel/syscalls/ipc/msgrcv/msgrcv03.c     |   2 +-
 .../kernel/syscalls/ipc/msgrcv/msgrcv04.c     |   2 +-
 .../kernel/syscalls/ipc/msgrcv/msgrcv05.c     |   2 +-
 .../kernel/syscalls/ipc/msgrcv/msgrcv06.c     |   2 +-
 testcases/kernel/syscalls/ipc/msgsnd/Makefile |   5 +-
 .../kernel/syscalls/ipc/msgstress/Makefile    |   8 +-
 .../syscalls/ipc/msgstress/msgstress01.c      |   2 +-
 .../syscalls/ipc/msgstress/msgstress02.c      |   2 +-
 .../syscalls/ipc/msgstress/msgstress03.c      |   2 +-
 .../syscalls/ipc/msgstress/msgstress04.c      |   2 +-
 .../kernel/syscalls/ipc/semctl/.gitignore     |   1 +
 testcases/kernel/syscalls/ipc/semctl/Makefile |   8 +-
 .../kernel/syscalls/ipc/semctl/semctl02.c     |   2 +-
 .../kernel/syscalls/ipc/semctl/semctl03.c     |   2 +-
 .../kernel/syscalls/ipc/semctl/semctl04.c     |   2 +-
 .../kernel/syscalls/ipc/semctl/semctl05.c     |   2 +-
 .../kernel/syscalls/ipc/semctl/semctl08.c     |  52 +++
 testcases/kernel/syscalls/ipc/semget/Makefile |   5 +-
 .../kernel/syscalls/ipc/semget/semget01.c     |   4 +-
 .../kernel/syscalls/ipc/semget/semget02.c     |   4 +-
 .../kernel/syscalls/ipc/semget/semget03.c     |   4 +-
 .../kernel/syscalls/ipc/semget/semget05.c     |   2 +-
 .../kernel/syscalls/ipc/semget/semget06.c     |   4 +-
 testcases/kernel/syscalls/ipc/semop/Makefile  |   5 +-
 testcases/kernel/syscalls/ipc/semop/semop03.c |   2 +-
 testcases/kernel/syscalls/ipc/semop/semop04.c |   2 +-
 testcases/kernel/syscalls/ipc/semop/semop05.c |   2 +-
 testcases/kernel/syscalls/ipc/shmat/Makefile  |   5 +-
 .../kernel/syscalls/ipc/shmctl/.gitignore     |   1 +
 testcases/kernel/syscalls/ipc/shmctl/Makefile |  10 +-
 .../kernel/syscalls/ipc/shmctl/shmctl02.c     |   2 +-
 .../kernel/syscalls/ipc/shmctl/shmctl03.c     |   2 +-
 .../kernel/syscalls/ipc/shmctl/shmctl04.c     |   2 +-
 .../kernel/syscalls/ipc/shmctl/shmctl06.c     |  51 +++
 testcases/kernel/syscalls/ipc/shmdt/Makefile  |   5 +-
 testcases/kernel/syscalls/ipc/shmdt/shmdt01.c |   2 +-
 testcases/kernel/syscalls/ipc/shmget/Makefile |   5 +-
 .../kernel/syscalls/ipc/shmget/shmget01.c     |   2 +-
 .../kernel/syscalls/ipc/shmget/shmget02.c     |   2 +-
 .../kernel/syscalls/ipc/shmget/shmget03.c     |   2 +-
 .../kernel/syscalls/ipc/shmget/shmget04.c     |   2 +-
 .../kernel/syscalls/ipc/shmget/shmget05.c     |   2 +-
 testcases/kernel/syscalls/kill/Makefile       |  19 +-
 testcases/kernel/syscalls/kill/kill07.c       |   2 +-
 testcases/kernel/syscalls/mremap/Makefile     |  19 +-
 73 files changed, 1124 insertions(+), 163 deletions(-)
 create mode 100644 include/ipcbuf.h
 rename {testcases/kernel/syscalls/ipc/lib => include}/ipcmsg.h (100%)
 rename {testcases/kernel/syscalls/ipc/lib => include}/ipcsem.h (100%)
 rename {testcases/kernel/syscalls/ipc/lib => include}/ipcshm.h (100%)
 rename {testcases/kernel/syscalls/ipc/lib => include}/libmsgctl.h (100%)
 rename {testcases/kernel/syscalls/ipc/libnewipc => include}/libnewipc.h (98%)
 create mode 100644 include/msgbuf.h
 create mode 100644 include/sembuf.h
 create mode 100644 include/shmbuf.h
 rename {testcases/kernel/syscalls/ipc/lib => libs/libltpipc}/Makefile (63%)
 rename {testcases/kernel/syscalls/ipc/lib => libs/libltpipc}/libipc.c (100%)
 rename {testcases/kernel/syscalls/ipc/lib => libs/libltpipc}/libmsgctl.c (100%)
 rename {testcases/kernel/syscalls/ipc/libnewipc => libs/libltpnewipc}/Makefile (63%)
 rename {testcases/kernel/syscalls/ipc/libnewipc => libs/libltpnewipc}/libnewipc.c (100%)
 delete mode 100644 testcases/kernel/syscalls/ipc/Makefile.inc
 delete mode 100644 testcases/kernel/syscalls/ipc/Makefile2.inc
 create mode 100755 testcases/kernel/syscalls/ipc/msgctl/msgctl05
 create mode 100644 testcases/kernel/syscalls/ipc/msgctl/msgctl05.c
 create mode 100644 testcases/kernel/syscalls/ipc/semctl/semctl08.c
 create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl06.c

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
