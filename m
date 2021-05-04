Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1435372B38
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 15:41:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 421E83C58AF
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 15:41:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E63CB3C57E0
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:41:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3E2031000479
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:41:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620135694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9OF5Czuje9XRZO48Qm2hTnEQ1HYss8za03ZbsfqhUzM=;
 b=rwLqs+50e+RSCZwu4VuxIAmmBLJ45tblr6xE6Ovbrx7qHANlAJYsBtu/LPpOOOuCMGpmLj
 zKP2X6AlubsElfoVCShJxhy2r3Q/STtTP/z9rlCqkO67jkPVytLNRPWViVE4D1ONp5eoiZ
 RryE9rVISalYhh5m3pSIm7u2LJ7VRik=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 865FDB2A5;
 Tue,  4 May 2021 13:41:34 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 14:40:53 +0100
Message-Id: <20210504134100.20666-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v6 0/7] CGroup API rewrite
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

This is a complete rewrite of the CGroups API. To understand why this
is so complicated, please see the commments in tst_cgroup.h and
tst_cgroup.c.

V6:

* Make cgroup_dir_mk return void as its return value is never used.

* Constify tst_safe_file_at, remove TEST macro and remove nested
  ternary expression from safe_unlinkat.

* Make fd_path, cgroup_roots and cgroup_dir_mk static.

* Add nonnull and warn_unused_return attributes.

* fix ksm02 to get the drain group. Note that nonnull prevents this
  mistake at compile time.

* Just use strcpy cgroup_cgroup_init

* Fix madvise06 doc comment

* Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

V5:

* Change group_name to a dynamic buffer and use NAME_MAX for file name
  buffer sizes.

* Compare whole string in file_find and brk if name is not in
  recognised format.

* Fix bug introduced in V4 by mixing up cgroup.subtree_control and
  cgroup.clone_children.

* Add note to for_each_dir.

* Add check for the number of conversions in cgroup_scanf. This
  requires count_scanf_conversions to become public.

* Constify

* Add license and stdio.h to tst_safe_file_at.c

V4:

* Move openat based helpers to tst_safe_file_at.h.

* Switch to userland naming of controllers (ctrl for short) instead of
  kernel's css (CGroup subsystem).

* Use more descriptive names such as dir_fd and tst_cgroup_group. Note
  that we discussed calling it tst_cgroup_node. However in the end I
  thought this was too generic and instead went with repetition.

* Split cgroup_item into cgroup_file and cgroup_ctrl. Also make the
  lookup tree definition more verbose to avoid the missing field
  warnings and setting the ctrl index at runtime.

* make enum tst_cgroup_ctrl private; use controller name in
  tst_cgroup_require.

* make struct tst_cgroup_dir private.

* Eliminate use of cgroup_get_ctrl and pass the ctrl struct around
  instead of the indx.

* Deleted test21 as it is superseded by tst_cgroup02.c.

* Remove container_of macro as it is no longer used by this patch set.

* Fix tst_cgroup_{scan,require,mount} in unlikely case it is run
  inside cleanup or some other context where tst_brk may return.

* Fix potential null-ptr-deref in cgroup_file_alias.

* Include sys/types.h in header due to use of (s)size_t.

V3:

* Replaced the object API with a string based lookup.

* Replaced tst_cgroup_css struct and name mapping functions with an
  item info tree.

* Merged the header files again as there is no longer much seperation
  between the core and item parts of the library.

* Rename some variables and functions to make them more consistent.

V2:

* Created an object (Item) API which looks a bit like the unified V2
  hierarchy. The implementation is quite verbose, but not complicated
  IMO.

* Add the ability to extend the LTP CGroup hierarchy with child
  groups. We already have a reproducer that requires such a hierarchy,
  but I have not had chance to turn it into a test case yet.

* Add documentation for the new API in test-writing-guidelines.txt.

* Convert madvise06 to the CGroups API

* Better error reporting for the *at functions. Add tst_decode_fd
  which tries to print the path an FD was opened with.

TODO/NOTES:

* There are other tests which mount CGroups in an ad-hoc way and need
  to be converted to the new API. This at least includes memcg_test_3
  and maybe cgroup_xattr.

Richard Palethorpe (7):
  API: Add safe openat, printfat, readat and unlinkat
  API: Make tst_count_scanf_conversions public
  Add new CGroups APIs
  Add new CGroups API library tests
  docs: Update CGroups API
  mem: Convert tests to new CGroups API
  madvise06: Convert to new CGroups API

 doc/test-writing-guidelines.txt               |  175 ++-
 include/safe_file_ops_fn.h                    |   10 +
 include/tst_cgroup.h                          |  190 ++-
 include/tst_safe_file_at.h                    |   61 +
 include/tst_test.h                            |    1 -
 lib/newlib_tests/.gitignore                   |    3 +-
 lib/newlib_tests/test21.c                     |   66 -
 lib/newlib_tests/tst_cgroup01.c               |   51 +
 lib/newlib_tests/tst_cgroup02.c               |   90 ++
 lib/safe_file_ops.c                           |   16 +-
 lib/tst_cgroup.c                              | 1304 +++++++++++++----
 lib/tst_safe_file_at.c                        |  197 +++
 testcases/kernel/mem/cpuset/cpuset01.c        |   34 +-
 testcases/kernel/mem/include/mem.h            |    2 +-
 testcases/kernel/mem/ksm/ksm02.c              |   14 +-
 testcases/kernel/mem/ksm/ksm03.c              |   12 +-
 testcases/kernel/mem/ksm/ksm04.c              |   17 +-
 testcases/kernel/mem/lib/mem.c                |   10 +-
 testcases/kernel/mem/oom/oom03.c              |   18 +-
 testcases/kernel/mem/oom/oom04.c              |   19 +-
 testcases/kernel/mem/oom/oom05.c              |   32 +-
 testcases/kernel/syscalls/madvise/madvise06.c |  129 +-
 22 files changed, 1879 insertions(+), 572 deletions(-)
 create mode 100644 include/tst_safe_file_at.h
 delete mode 100644 lib/newlib_tests/test21.c
 create mode 100644 lib/newlib_tests/tst_cgroup01.c
 create mode 100644 lib/newlib_tests/tst_cgroup02.c
 create mode 100644 lib/tst_safe_file_at.c

-- 
2.31.1



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
