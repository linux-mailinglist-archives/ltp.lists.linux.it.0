Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 482B72992D8
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:48:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DAAAD3C2639
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:48:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 592873C1C9E
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A3D7B600A72
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0C55AD0B
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:48:04 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Oct 2020 17:47:37 +0100
Message-Id: <20201026164756.30556-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 00/19] Unify error handling in LTP library
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

LTP helper functions, mainly safe syscalls, often report two different source
code locations in error messages and sometimes handle syscall return values
incorrectly. This patchset unifies source code location formatting to only
show the calling line in the test program and fixes invalid return value
handling. Safe syscalls now make pedantic distinction between common errors
and invalid return values where applicable.

Some safe syscalls returned no value so they were not usable in test cleanup.
This is also fixed along with potential control flow issues when tst_brk()
does not immediately terminate the program.

Martin Doucha (19):
  Unify error handling in lib/tst_safe_macros.c
  Unify error handling in lib/tst_safe_sysv_ipc.c
  Unify error handling in lib/tst_safe_timerfd.c
  Unify error handling in lib/safe_file_ops.c
  Unify error handling in lib/safe_macros.c
  Unify error handling in lib/safe_net.c
  Unify error handling in lib/safe_stdio.c
  Unify error handling in lib/tst_mkfs.c
  Unify error handling in lib/tst_checkpoint.c
  Unify error handling in lib/tst_net.c
  Unify error handling in lib/tst_fs_setup.c
  Unify error handling in include/tst_safe_clocks.h
  Move executable code out of tst_safe_macros.h
  Unify error handling in moved functions
  Unify error handling in include/tst_safe_macros.h
  Unify error handling in include/tst_safe_posix_ipc.h
  Unify error handling in include/tst_safe_prw.h
  Unify error handling in lib/tst_resource.c
  Unify error handling in include/lapi/safe_rt_signal.h

 include/lapi/safe_rt_signal.h |  25 +-
 include/safe_file_ops_fn.h    |   8 +-
 include/tst_safe_clocks.h     |  48 ++-
 include/tst_safe_macros.h     | 130 ++++----
 include/tst_safe_posix_ipc.h  |   6 +-
 include/tst_safe_prw.h        |  16 +-
 lib/safe_file_ops.c           | 207 +++++++-----
 lib/safe_macros.c             | 602 ++++++++++++++++++++++------------
 lib/safe_net.c                | 262 +++++++++------
 lib/safe_stdio.c              |  34 +-
 lib/tst_checkpoint.c          |  23 +-
 lib/tst_fs_setup.c            |   8 +-
 lib/tst_mkfs.c                |  36 +-
 lib/tst_net.c                 |   9 +-
 lib/tst_resource.c            |   9 +-
 lib/tst_safe_macros.c         | 201 ++++++++++--
 lib/tst_safe_sysv_ipc.c       |  79 +++--
 lib/tst_safe_timerfd.c        |  32 +-
 18 files changed, 1100 insertions(+), 635 deletions(-)

-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
