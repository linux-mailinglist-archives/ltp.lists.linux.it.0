Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EBA3839F0
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:31:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B75C03C3130
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:31:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A71623C2F3E
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8A93C2009B8
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621269038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SG1vAc72yMa/lSpG3Tz+Om+pcoIod1B6x3kdwHbAOpc=;
 b=X86v+Ylxi9SbB3LV2r7YuiiZfYSvQpcTtCqbHxdADtPUbWjb0pkiTxdLG5O+NLraZgDON/
 neCQSiRyecc7W3PzHi0X+b6DCdUaE4yhgjGxi+XI+7a89AKbG85XT+2XP9t0sKoe0CeY1g
 cPmmPwFxFDaq7k5FnmhT3wFxs616bM0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8DDFB265;
 Mon, 17 May 2021 16:30:38 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 17 May 2021 17:30:23 +0100
Message-Id: <20210517163029.22974-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/6] Check exported library symbols and cleanup
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Forgetting to add static to a global variable is a common mistake. So
far we have relied on manual review to spot it. This is a waste of
time for both the test author and reviewer.

Generally speaking all API functions have tst_ or safe_ prepended. It
is simple to check that exported symbols match this naming. Although I
expect the script I have created will break building on some distros.

The patchset also includes a bunch of fixes for some symbols. I have
tried to fix stuff in the new API and ignored issues only in the old
one.

I created another script to look for unused functions. However this
relies on GNU Global. Also I'm not sure what to do with the
results. FYI the unused commands are listed below:

ltpdev_ioctl_cmds_s	testcases/kernel/fs/scsi/ltpfs/Ltpfs.h	62
ltpdev_ioctl_cmds_t	testcases/kernel/fs/scsi/ltpfs/Ltpfs.h	66
tst_its_set_interval_from_ts	include/tst_timer.h	747
tst_ms_to_timeval	include/tst_timer.h	43
tst_numa_types	include/tst_numa.h	93
tst_timer_tcase	lib/tst_timer_test.c	390
tst_timespec_add_us	include/tst_timer.h	820
tst_timespec_diff_us	include/tst_timer.h	941
tst_timespec_from_ms	include/tst_timer.h	717
tst_timespec_sub_us	include/tst_timer.h	847
tst_timeval_diff_ms	include/tst_timer.h	92
tst_timeval_diff_us	include/tst_timer.h	86
tst_ts_abs_diff_ms	include/tst_timer.h	1001

I have removed some from the list which actually seem to be an issue
with the script or I have already submitted a patch to remove.

Richard Palethorpe (6):
  API: Make some internal symbols static
  API: Add tst_ to create_sig_proc
  API: Add tst_ to file_* functions
  API: add tst_ to mount_overlay
  API: Add tst_ to hugepage opt vars
  API: Check exported symbols

 doc/test-writing-guidelines.txt               |  2 +-
 include/old/old_safe_file_ops.h               | 14 ++--
 include/old/test.h                            |  1 -
 include/safe_file_ops_fn.h                    | 25 ++++----
 include/tst_hugepage.h                        |  4 +-
 include/tst_safe_file_ops.h                   | 24 +++----
 include/tst_sig_proc.h                        |  2 +-
 lib/Makefile                                  | 12 ++++
 lib/newlib_tests/tst_safe_fileops.c           |  4 +-
 lib/safe_file_ops.c                           | 10 +--
 lib/tst_assert.c                              |  4 +-
 lib/tst_clocks.c                              |  2 +-
 lib/tst_device.c                              |  2 +-
 lib/tst_fs_link_count.c                       |  2 +-
 lib/tst_fs_setup.c                            |  4 +-
 lib/tst_hugepage.c                            |  8 +--
 lib/tst_res.c                                 |  2 +-
 lib/tst_sig_proc.c                            |  2 +-
 lib/tst_status.c                              |  6 +-
 lib/tst_sys_conf.c                            |  2 +-
 lib/tst_test.c                                |  2 +-
 lib/tst_timer_test.c                          |  2 +-
 libs/libltpsigwait/sigwait.c                  | 18 +++---
 scripts/check_export_syms.sh                  | 64 +++++++++++++++++++
 testcases/cve/meltdown.c                      |  2 +-
 .../device-drivers/cpufreq/cpufreq_boost.c    |  4 +-
 .../kernel/mem/hugetlb/hugemmap/hugemmap01.c  | 14 ++--
 .../kernel/mem/hugetlb/hugemmap/hugemmap02.c  | 14 ++--
 .../kernel/mem/hugetlb/hugemmap/hugemmap04.c  | 14 ++--
 .../mem/hugetlb/hugeshmat/hugeshmat01.c       |  2 +-
 .../mem/hugetlb/hugeshmat/hugeshmat02.c       |  2 +-
 .../mem/hugetlb/hugeshmat/hugeshmat03.c       |  2 +-
 .../mem/hugetlb/hugeshmctl/hugeshmctl01.c     |  2 +-
 .../mem/hugetlb/hugeshmctl/hugeshmctl02.c     |  2 +-
 .../mem/hugetlb/hugeshmctl/hugeshmctl03.c     |  2 +-
 .../mem/hugetlb/hugeshmdt/hugeshmdt01.c       |  2 +-
 .../mem/hugetlb/hugeshmget/hugeshmget01.c     |  2 +-
 .../mem/hugetlb/hugeshmget/hugeshmget02.c     |  2 +-
 .../mem/hugetlb/hugeshmget/hugeshmget03.c     |  4 +-
 .../mem/hugetlb/hugeshmget/hugeshmget05.c     |  2 +-
 testcases/kernel/mem/ksm/ksm01.c              |  4 +-
 testcases/kernel/mem/ksm/ksm02.c              |  4 +-
 testcases/kernel/mem/ksm/ksm03.c              |  4 +-
 testcases/kernel/mem/ksm/ksm04.c              |  4 +-
 testcases/kernel/mem/ksm/ksm05.c              |  2 +-
 testcases/kernel/mem/ksm/ksm06.c              |  8 +--
 testcases/kernel/mem/swapping/swapping01.c    |  2 +-
 .../clock_nanosleep/clock_nanosleep01.c       |  2 +-
 testcases/kernel/syscalls/fcntl/fcntl33.c     |  2 +-
 testcases/kernel/syscalls/fork/fork13.c       |  2 +-
 .../syscalls/migrate_pages/migrate_pages02.c  |  2 +-
 testcases/kernel/syscalls/ppoll/ppoll01.c     |  4 +-
 testcases/kernel/syscalls/prctl/prctl06.c     |  2 +-
 .../kernel/syscalls/readahead/readahead02.c   |  2 +-
 testcases/kernel/syscalls/utils/mq_timed.h    |  2 +-
 testcases/kernel/tracing/pt_test/pt_test.c    |  4 +-
 .../network/can/filter-tests/can_common.h     |  2 +-
 testcases/network/packet/fanout01.c           |  6 +-
 58 files changed, 211 insertions(+), 137 deletions(-)
 create mode 100755 scripts/check_export_syms.sh

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
