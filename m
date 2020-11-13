Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 896C42B1BAA
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:13:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E44F3C4FBC
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:13:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4C1953C2F1A
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id ACAD81A00987
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1E76ABD1
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 13:13:39 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 14:14:18 +0100
Message-Id: <20201113131428.13199-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 00/10] Introduce TEST_MACROS
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

This is a RFC for a TEST_MACROS() implementation.

These macros are intended to simplify and unify syscall unit tests.

This patchset converts a few testcases to use TEST_MACROS it's
intenteded to serve as an example since there is a lot of testcases that
could use them as well.

Also the documentation for these macros is ommited at this point, I will
add it in a case that we agree to include them in the test library.

Cyril Hrubis (10):
  lib: Introduce more TEST_* macros
  syscalls/uname: Make use of TEST_MACROS
  syscalls/accept: Make use of TEST_MACROS
  syscalls/access: Make use of TEST_MACROS
  syscalls/bind: Make use of TEST_MACROS
  syscalls/brk01: Make use of TEST_MACROS
  syscalls/cacheflush: Make use of TEST_MACROS
  syscalls/capget: Make use of TEST_MACROS
  syscalls/capset: Make use of TEST_MACROS
  syscalls/open: Make use of TEST_MACROS

 include/tst_test.h                            |  28 +---
 include/tst_test_macros.h                     | 131 ++++++++++++++++++
 lib/newlib_tests/.gitignore                   |   3 +
 lib/newlib_tests/test_macros01.c              |  40 ++++++
 lib/newlib_tests/test_macros02.c              |  42 ++++++
 lib/newlib_tests/test_macros03.c              |  40 ++++++
 lib/tst_test.c                                |   1 +
 testcases/kernel/syscalls/accept/accept01.c   |  17 +--
 testcases/kernel/syscalls/access/access01.c   |  43 +-----
 testcases/kernel/syscalls/access/access02.c   |   8 +-
 testcases/kernel/syscalls/access/access03.c   |  28 +---
 testcases/kernel/syscalls/bind/bind01.c       |  12 +-
 testcases/kernel/syscalls/bind/bind02.c       |  11 +-
 testcases/kernel/syscalls/bind/bind03.c       |  26 +---
 testcases/kernel/syscalls/bind/bind04.c       |   5 +-
 testcases/kernel/syscalls/bind/bind05.c       |   5 +-
 testcases/kernel/syscalls/brk/brk01.c         |   9 +-
 .../kernel/syscalls/cacheflush/cacheflush01.c |   8 +-
 testcases/kernel/syscalls/capget/capget01.c   |  17 +--
 testcases/kernel/syscalls/capget/capget02.c   |  26 ++--
 testcases/kernel/syscalls/capset/capset01.c   |  14 +-
 testcases/kernel/syscalls/capset/capset02.c   |  28 ++--
 testcases/kernel/syscalls/capset/capset03.c   |  10 +-
 testcases/kernel/syscalls/capset/capset04.c   |  13 +-
 testcases/kernel/syscalls/open/open01.c       |  11 +-
 testcases/kernel/syscalls/open/open02.c       |  25 +---
 testcases/kernel/syscalls/open/open11.c       |  22 ++-
 testcases/kernel/syscalls/uname/uname01.c     |  13 +-
 testcases/kernel/syscalls/uname/uname02.c     |  17 +--
 29 files changed, 348 insertions(+), 305 deletions(-)
 create mode 100644 include/tst_test_macros.h
 create mode 100644 lib/newlib_tests/test_macros01.c
 create mode 100644 lib/newlib_tests/test_macros02.c
 create mode 100644 lib/newlib_tests/test_macros03.c

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
