Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1A025FC80
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 17:01:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17FA33C2D7D
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 17:01:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1FC773C1CB6
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 17:01:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3DCDF200B69
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 17:01:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54F44B6D0
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 15:01:28 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  7 Sep 2020 17:01:47 +0200
Message-Id: <20200907150157.23886-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 00/10] Rewrite shmctl() testcases
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This patchset mostly rewrites old shmctl testcases from scratch and also
increases the coverage at least threefold.

There are still missing pieces though, there are no test that would
check that shm_atime and shm_dtime are valid as well as shm_lpid as well
as the coverage of ipc_perm is still lacking and should be added later
on.

Changes in v2:

* Redesing shmctl04, the check for max_idx was bogus before

* Fixed shmctl07 to re-read the IPC_STAT and corrected the check

* Fixed shmctl08 ctime check to make sure the field gets updated

* Added fallback for SHM_STAT_ANY

+ Many smaller fixes mostly pointed out by Martin

Cyril Hrubis (10):
  syscalls/ipc: shmctl02: Convert to the new library
  syscalls/ipc: shmctl03: Remove.
  lapi/shm.h: Add SHM_STAT_ANY
  syscalls/ipc: shmctl04: Rewrite from scratch.
  syscalls/ipc: shmctl05 remove lib dependency
  lib/tst_assert: Add TST_ASSERT_ULONG()
  syscalls/ipc: Add shmctl() IPC_INFO test
  syscalls/ipc: Add shmctl07 test
  syscalls/ipc: Add shmctl IPC_SET test
  syscalls/ipc: Rewrite shmctl01

 include/lapi/shm.h                            |  13 +
 include/tst_assert.h                          |   9 +
 lib/tst_assert.c                              |  14 +
 runtest/syscalls                              |   2 +
 runtest/syscalls-ipc                          |   2 +
 .../kernel/syscalls/ipc/shmctl/.gitignore     |   2 +
 testcases/kernel/syscalls/ipc/shmctl/Makefile |   3 +-
 .../kernel/syscalls/ipc/shmctl/shmctl01.c     | 586 ++++++------------
 .../kernel/syscalls/ipc/shmctl/shmctl02.c     | 263 +++-----
 .../kernel/syscalls/ipc/shmctl/shmctl03.c     | 216 +------
 .../kernel/syscalls/ipc/shmctl/shmctl04.c     | 203 +++---
 .../kernel/syscalls/ipc/shmctl/shmctl07.c     |  68 ++
 .../kernel/syscalls/ipc/shmctl/shmctl08.c     | 103 +++
 13 files changed, 625 insertions(+), 859 deletions(-)
 create mode 100644 include/lapi/shm.h
 create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
 create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl08.c

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
