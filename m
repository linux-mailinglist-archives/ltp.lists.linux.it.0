Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 620FA23458B
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 14:15:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F392A3C4BAE
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 14:15:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C9D693C13DC
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 14:14:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B11B7600967
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 14:14:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60C43ACE3
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 12:15:00 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 31 Jul 2020 14:15:05 +0200
Message-Id: <20200731121508.12805-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] Build system fixes
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

This patchset does

* Introduce LTPLDLIBS to solve linker dependencies once for all

* Cleans up the output from make a bit, this could be even more fine
  tuned if we agree on this part

Cyril Hrubis (3):
  build system: Add explicit make rules
  testcases: Make use of LTPLDLIBS
  build system: Silence the output a bit more

 include/mk/env_post.mk                        |  2 ++
 include/mk/generic_trunk_target.inc           | 14 +++++++++
 include/mk/lib.mk                             |  2 +-
 include/mk/rules.mk                           | 29 +++++++++++++++++++
 include/mk/testcases.mk                       |  5 ++++
 .../kernel/syscalls/clock_gettime/Makefile    |  2 +-
 testcases/kernel/syscalls/ipc/msgctl/Makefile |  2 +-
 testcases/kernel/syscalls/ipc/msgget/Makefile |  2 +-
 testcases/kernel/syscalls/ipc/msgrcv/Makefile |  2 +-
 testcases/kernel/syscalls/ipc/msgsnd/Makefile |  2 +-
 .../kernel/syscalls/ipc/msgstress/Makefile    |  2 +-
 testcases/kernel/syscalls/ipc/semctl/Makefile |  4 +--
 testcases/kernel/syscalls/ipc/semget/Makefile |  2 +-
 testcases/kernel/syscalls/ipc/semop/Makefile  |  2 +-
 testcases/kernel/syscalls/ipc/shmat/Makefile  |  2 +-
 testcases/kernel/syscalls/ipc/shmctl/Makefile |  4 +--
 testcases/kernel/syscalls/ipc/shmdt/Makefile  |  2 +-
 testcases/kernel/syscalls/ipc/shmget/Makefile |  2 +-
 testcases/kernel/syscalls/kill/Makefile       |  4 +--
 testcases/kernel/syscalls/mbind/Makefile      |  6 ++--
 testcases/kernel/syscalls/mremap/Makefile     |  2 +-
 .../kernel/syscalls/rt_sigtimedwait/Makefile  |  2 +-
 .../kernel/syscalls/set_mempolicy/Makefile    |  3 +-
 .../kernel/syscalls/sigtimedwait/Makefile     |  2 +-
 testcases/kernel/syscalls/sigwait/Makefile    |  2 +-
 .../kernel/syscalls/sigwaitinfo/Makefile      |  2 +-
 26 files changed, 79 insertions(+), 26 deletions(-)
 create mode 100644 include/mk/rules.mk

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
