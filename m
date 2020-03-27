Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD4719608F
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 22:39:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9E993C32D4
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 22:39:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D07EA3C32D4
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 22:39:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 580B31A0071C
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 22:39:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4AC3DABAE;
 Fri, 27 Mar 2020 21:39:30 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Mar 2020 22:39:18 +0100
Message-Id: <20200327213924.18816-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/6] C API: .needs_cmds and SAFE_RUN_CMD()
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

Hi,

I implemented .needs_cmds + SAFE_RUN_CMD().

I also checked for command in path in tst_run_cmd_fds_() as suggested by
Cyril + added possibility to TCONF when program not found. This leaded
to more verbose changes. + There is a double check (first in
.needs_cmds, then in SAFE_RUN_CMD()), maybe that's not needed.

Also this change is not used in copy_file_range02.c, because it does not
require these commands. Is it worth to reduce code it'd be good to separate
file into two, put common functions in header and tests with
fd_immutable and fd_swapfile into new test?

Petr Vorel (6):
  lib: Implement .needs_cmds
  Use .needs_cmds
  lib/tst_run_cmd_*(): Turn int pass_exit_val into enum
  lib/tst_run_cmd_*(): Search for program in $PATH
  lib: Implement SAFE_RUN_CMD() macro (new API only)
  Use SAFE_RUN_CMD()

 doc/test-writing-guidelines.txt               | 29 +++++++++++---
 include/tst_cmd.h                             | 39 +++++++++++--------
 include/tst_safe_macros.h                     | 20 ++++++++++
 include/tst_test.h                            |  3 ++
 lib/tst_kernel.c                              |  3 +-
 lib/tst_mkfs.c                                |  3 +-
 lib/tst_module.c                              |  3 +-
 lib/tst_run_cmd.c                             | 28 ++++++++-----
 lib/tst_test.c                                | 11 ++++++
 testcases/kernel/input/input_helper.c         |  4 +-
 testcases/kernel/syscalls/acct/acct02.c       |  2 +-
 testcases/kernel/syscalls/add_key/add_key05.c | 24 +++++-------
 .../copy_file_range/copy_file_range02.c       |  2 +-
 .../kernel/syscalls/quotactl/quotactl01.c     | 18 +++------
 .../kernel/syscalls/quotactl/quotactl06.c     | 16 +++-----
 .../syscalls/setpriority/setpriority01.c      |  5 ++-
 testcases/network/netstress/netstress.c       |  2 +-
 17 files changed, 134 insertions(+), 78 deletions(-)

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
