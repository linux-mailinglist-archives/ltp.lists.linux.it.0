Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C89FC197C24
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:43:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 836823C3146
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:43:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5B8C83C312D
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:43:45 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F31011A00F76
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:43:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 47B20ACC2;
 Mon, 30 Mar 2020 12:43:44 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 30 Mar 2020 14:43:33 +0200
Message-Id: <20200330124338.6764-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/5] C API: .needs_cmds and SAFE_CMD()
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

just in case due massive rename I'm posting the changes.

Kind regards,
Petr

Petr Vorel (5):
  lib: Rename tst_run_cmd*() to tst_cmd*()
  lib/tst_cmd_*(): Turn int pass_exit_val into enum
  lib/tst_cmd_*(): Search for program in $PATH
  lib: Implement SAFE_CMD() macro (new API only)
  Use SAFE_CMD()

 doc/test-writing-guidelines.txt               | 20 +++---
 include/tst_cmd.h                             | 61 +++++++++++--------
 include/tst_safe_macros.h                     | 17 ++++++
 lib/{tst_run_cmd.c => tst_cmd.c}              | 32 ++++++----
 lib/tst_kernel.c                              |  3 +-
 lib/tst_mkfs.c                                |  2 +-
 lib/tst_module.c                              |  5 +-
 lib/tst_virt.c                                |  2 +-
 testcases/cve/stack_clash.c                   |  2 +-
 testcases/kernel/input/input_helper.c         |  4 +-
 testcases/kernel/syscalls/acct/acct02.c       |  2 +-
 testcases/kernel/syscalls/add_key/add_key05.c | 16 ++---
 .../copy_file_range/copy_file_range02.c       |  2 +-
 .../kernel/syscalls/quotactl/quotactl01.c     | 11 +---
 .../kernel/syscalls/quotactl/quotactl06.c     |  9 +--
 .../syscalls/setpriority/setpriority01.c      |  4 +-
 testcases/kernel/syscalls/swapon/libswapon.c  |  2 +-
 testcases/network/netstress/netstress.c       |  2 +-
 .../network/nfs/nfs_stress/nfs05_make_tree.c  |  6 +-
 tools/apicmds/ltpapicmd.c                     |  2 +-
 20 files changed, 111 insertions(+), 93 deletions(-)
 rename lib/{tst_run_cmd.c => tst_cmd.c} (86%)

-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
