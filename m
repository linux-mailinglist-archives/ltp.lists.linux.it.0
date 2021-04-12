Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A535C942
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 16:55:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC4183C75F6
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 16:55:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 725E13C74C3
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 16:55:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DADEA600A42
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 16:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618239330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=I0NbRVaj7LJ5BI4VX/EKlATjqRiXlMebTl4BBbQ300o=;
 b=HImz+KFDpXNHDtb/xHNcZE/73CiErycGYShsof6B+6xKLSnLpoXCaraQHCWIMbb4bozk5q
 uD8MytrqWxPlONhQzayFz/T26cTme3JCphfnoMBstCywVRCVLQOZwlHBP8pLy5FYvwb+Kx
 VTQrvwkE7Q6YS45L/MvyOnvr4vKtCrs=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15572B15F;
 Mon, 12 Apr 2021 14:55:30 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 12 Apr 2021 15:54:59 +0100
Message-Id: <20210412145506.26894-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/7] CGroup API rewrite
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

This is a complete rewrite of the CGroups API. It has big changes even
compared to V2 of the patchset. To understand why this is so
complicated, please see the commments in tst_cgroup.h and
tst_cgroup.c.

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
  API: Add macro for the container_of trick
  Add new CGroups APIs
  Add new CGroups API library tests
  docs: Update CGroups API
  mem: Convert tests to new CGroups API
  madvise06: Convert to new CGroups API

 doc/test-writing-guidelines.txt               |  175 ++-
 include/tst_cgroup.h                          |  194 ++-
 include/tst_common.h                          |    5 +
 include/tst_safe_file_ops.h                   |   39 +
 include/tst_test.h                            |    1 -
 lib/Makefile                                  |    2 +
 lib/newlib_tests/.gitignore                   |    2 +
 lib/newlib_tests/test21.c                     |   45 +-
 lib/newlib_tests/tst_cgroup01.c               |   51 +
 lib/newlib_tests/tst_cgroup02.c               |   90 ++
 lib/tst_cgroup.c                              | 1205 ++++++++++++-----
 lib/tst_safe_file_ops.c                       |  171 +++
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
 22 files changed, 1720 insertions(+), 499 deletions(-)
 create mode 100644 lib/newlib_tests/tst_cgroup01.c
 create mode 100644 lib/newlib_tests/tst_cgroup02.c
 create mode 100644 lib/tst_safe_file_ops.c

-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
