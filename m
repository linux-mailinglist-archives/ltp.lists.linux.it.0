Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB80C36D98C
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 16:27:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97A323C6298
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 16:27:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 599853C0EFF
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 16:27:34 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 909CD1401213
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 16:27:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1619620053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ndojlqqpSPUg7+lYg7FAetOF5N3f9fS+wojCjEL2AnU=;
 b=YaPiWCLxc8Xuj729o0y3SsNmZd8I5iKxUvWk3YBzxIq+Oql7ZWc9K0PCcKP0AmAyvtsIFe
 vW00W/w3i8UwV3npMrw+cRmoILr/XSvaGxN1ggRd29Vwstsapj/HoqgQ3NLot8UMuQEOYx
 4236cnKRvcFPz9jY7ZaVDd+oiY4r8Uc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7C58B1A6;
 Wed, 28 Apr 2021 14:27:32 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 28 Apr 2021 15:27:13 +0100
Message-Id: <20210428142719.8065-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/6] CGroup API rewrite
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
  and maybe cgroup_xattr

Richard Palethorpe (6):
  API: Add safe openat, printfat, readat and unlinkat
  Add new CGroups APIs
  Add new CGroups API library tests
  docs: Update CGroups API
  mem: Convert tests to new CGroups API
  madvise06: Convert to new CGroups API

 doc/test-writing-guidelines.txt               |  175 ++-
 include/tst_cgroup.h                          |  179 ++-
 include/tst_safe_file_at.h                    |   51 +
 include/tst_test.h                            |    1 -
 lib/newlib_tests/.gitignore                   |    3 +-
 lib/newlib_tests/test21.c                     |   66 -
 lib/newlib_tests/tst_cgroup01.c               |   51 +
 lib/newlib_tests/tst_cgroup02.c               |   90 ++
 lib/tst_cgroup.c                              | 1266 ++++++++++++-----
 lib/tst_safe_file_at.c                        |  170 +++
 testcases/kernel/mem/cpuset/cpuset01.c        |   34 +-
 testcases/kernel/mem/include/mem.h            |    2 +-
 testcases/kernel/mem/ksm/ksm02.c              |   13 +-
 testcases/kernel/mem/ksm/ksm03.c              |   12 +-
 testcases/kernel/mem/ksm/ksm04.c              |   17 +-
 testcases/kernel/mem/lib/mem.c                |   10 +-
 testcases/kernel/mem/oom/oom03.c              |   18 +-
 testcases/kernel/mem/oom/oom04.c              |   19 +-
 testcases/kernel/mem/oom/oom05.c              |   32 +-
 testcases/kernel/syscalls/madvise/madvise06.c |   82 +-
 20 files changed, 1753 insertions(+), 538 deletions(-)
 create mode 100644 include/tst_safe_file_at.h
 delete mode 100644 lib/newlib_tests/test21.c
 create mode 100644 lib/newlib_tests/tst_cgroup01.c
 create mode 100644 lib/newlib_tests/tst_cgroup02.c
 create mode 100644 lib/tst_safe_file_at.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
