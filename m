Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B0632A400
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 16:27:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B30C3C56EA
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 16:27:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id CF71E3C56D3
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 16:27:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4F3B21A03FFE
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 16:27:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614698874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9ZMkQUv+8gQ+zsuPOEgH12XOk41XxsstUHBXYCITSXI=;
 b=Q4iSAWv4jWM+lzgfTTRGYmkyv7RT00d8QCrg3h7PFvHw+dpEotEfwJNw8km+QQzLvYAxab
 DS/YzBeaXe7I6Gb1b+NeKsloV7GyZL+2incFEZB4dZc/KkG0Ec/uY469DIBi7qkYGnH4B2
 5aVFIRGF3IiIPai/XuHiWiB0rAHjxrE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8432AAC54;
 Tue,  2 Mar 2021 15:27:54 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  2 Mar 2021 15:25:03 +0000
Message-Id: <20210302152510.15116-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 0/7] CGroup API rewrite
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
compared to V1 of the patchset. To understand why this is so
complicated, please see the commments in tst_cgroup.h and
tst_cgroup.c.

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

* Some objects are allocated in guarded buffers, some with malloc,
  others are static. This is partially because some of the struct
  types are static. It might be better to expose them all to the test
  executable so it can allocate them statitically or use guarded
  buffers for everything.

* ksm02 segfaults, although this does not appear to be caused by the
  CGroup API.

* cpuset01 triggers an ASAN splat, which again does not appear to be
  caused by the new API.

* There are probably other tests like madvise06 which mount CGroups in
  an ad-hoc way and need to be converted to the new API.

Richard Palethorpe (7):
  API: Add safe openat, printfat, readat and unlinkat
  API: Add macro for the container_of trick
  Add new CGroups Core and Item APIs
  Add new CGroups API library tests
  docs: Update CGroups API
  mem: Convert tests to new CGroups API
  madvise06: Convert to new CGroups API

 doc/test-writing-guidelines.txt               |  165 ++-
 include/tst_cgroup.h                          |  124 +-
 include/tst_cgroup_core.h                     |   58 +
 include/tst_cgroup_item.h                     |  139 ++
 include/tst_common.h                          |    5 +
 include/tst_safe_file_ops.h                   |   39 +
 include/tst_test.h                            |    1 -
 lib/newlib_tests/.gitignore                   |    2 +
 lib/newlib_tests/test21.c                     |   43 +-
 lib/newlib_tests/tst_cgroup01.c               |   51 +
 lib/newlib_tests/tst_cgroup02.c               |   87 ++
 lib/tst_cgroup.c                              | 1258 ++++++++++++-----
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
 testcases/kernel/syscalls/madvise/madvise06.c |   83 +-
 23 files changed, 1878 insertions(+), 505 deletions(-)
 create mode 100644 include/tst_cgroup_core.h
 create mode 100644 include/tst_cgroup_item.h
 create mode 100644 lib/newlib_tests/tst_cgroup01.c
 create mode 100644 lib/newlib_tests/tst_cgroup02.c
 create mode 100644 lib/tst_safe_file_ops.c

-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
