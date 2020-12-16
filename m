Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C442DBE22
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:02:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1C603C57ED
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:02:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EF4763C2800
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:01:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 83D0B6002B6
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:01:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1608112916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iwvhpE5C3i5+EiBCC0ZOAjANaih06jtACYRNHklCHuU=;
 b=gM8O+XeDyUNSd+lffhIPFqnEYHA8dXDqqvfasnAqZ6KtJfuoAWwuQFmFcmn2m37+A6nBEW
 yk7EhpOdj4IcDVUIYs/novSSbBSFFHFR5qz29lwNGhIJT3+KXvRFhhUwzq/mtJeIK/kldq
 wfWKWMaLRON88cmDyQxZKaTnNMwg44o=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97DE3AE91;
 Wed, 16 Dec 2020 10:01:56 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 10:01:16 +0000
Message-Id: <20201216100121.16683-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/5] CGroups
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

This is a request for comment on a new CGroups API. I have tried to
keep the existing API functions, but there are many changes in the
implementation. Please see the commit message to "CGroup API rewrite"
in this series.

A previous failed attempt to correct some problems and discussion is
here: http://lists.linux.it/pipermail/ltp/2020-November/019586.html
This is a much bigger change than I would like, but CGroups make it
very difficult to do anything simply.

I have done a direct conversion of the test cases to the new API, but
I am not sure that it makes sense to call tst_cgroup_move_current
within the run method of a test because after the first iteration it
will be a NOP. There is also the issue that on the unified hierarchy
when calling

tst_cgroup_move_current(TST_CGROUP_MEMORY);
... testing ...
tst_cgroup_move_current(TST_CGROUP_CPUSET);

the second call is a NOP as there is only one CGroup, but when the
hierarchies are mounted seperately on V1 the current process will not
be added to cpuset CGroup until the second call. We probably do not
want different behaviour between commonly used hierarchies.

In a lot of cases, the test probably only requires the process to be
moved into a CGroup during setup, but this requires an investigation
of each test. Some tests scan for NUMA information and use this in the
CGroup config which complicates matters. However it seems unlikely to
me that the available NUMA nodes will change between test iterations
unless we are testing hotplugging or failover.

For tests which are actually testing CGroups themselves, most of the
API is too high-level. Please see the kernel self tests for what may
be required for those kinds of tests.

This is not meant for full review and has not been tested on older
setups yet.

Richard Palethorpe (5):
  safe_file_ops: Introduce openat and printfat API
  CGroup API rewrite
  CGroup API tests
  CGroup test guidelines
  cgroups: convert tests to use API rewrite

 doc/test-writing-guidelines.txt        |  18 +-
 include/tst_cgroup.h                   | 103 ++-
 include/tst_safe_file_ops.h            |  38 +
 lib/newlib_tests/.gitignore            |   1 +
 lib/newlib_tests/test21.c              |  30 +-
 lib/newlib_tests/tst_cgroup.c          |  61 ++
 lib/tst_cgroup.c                       | 960 ++++++++++++++++---------
 lib/tst_safe_file_ops.c                | 126 ++++
 testcases/kernel/mem/cpuset/cpuset01.c |  18 +-
 testcases/kernel/mem/include/mem.h     |   2 +-
 testcases/kernel/mem/ksm/ksm02.c       |   8 +-
 testcases/kernel/mem/ksm/ksm03.c       |   8 +-
 testcases/kernel/mem/ksm/ksm04.c       |  15 +-
 testcases/kernel/mem/lib/mem.c         |   8 +-
 testcases/kernel/mem/oom/oom03.c       |  12 +-
 testcases/kernel/mem/oom/oom04.c       |  10 +-
 testcases/kernel/mem/oom/oom05.c       |  23 +-
 17 files changed, 996 insertions(+), 445 deletions(-)
 create mode 100644 lib/newlib_tests/tst_cgroup.c
 create mode 100644 lib/tst_safe_file_ops.c

-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
