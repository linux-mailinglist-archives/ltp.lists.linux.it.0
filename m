Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 782808A151
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:39:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1AD33C1812
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:39:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E07B33C0752
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 93589600A6A
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18505ACEC
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 14:39:42 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 12 Aug 2019 16:39:30 +0200
Message-Id: <20190812143941.8119-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 00/11] Introduce guarded buffers
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

Changes since v1:

* Removed debugging "freeing buffer %p" output and
  added a message that is printed first time tst_alloc() is called.

* Added the missing getpid() to the warning message
  from check_canary()

* Added call to atexit(tst_free_all) in the safe_fork()
  - now we check the canary in child processes as well

* Added documentation into the test-writing-guidelines.txt

* Separated the accept02.c changes from the patch that adds
  the guarded buffers library

Cyril Hrubis (11):
  lib: Add support for guarded buffers
  lib: Add a canary for guarded buffers
  doc: Add guarded buffers documentation
  syscalls/accept02: Make use of guarded buffers.
  syscalls/preadv01: Make use of guarded buffers.
  syscalls/accept4_01: Make use of guarded buffers.
  syscalls/add_key04: Make use of guarded buffers.
  syscalls/adjtimex: Make use of guarded buffers.
  syscalls/clock_getres01: Make use of guarded buffers.
  syscalls/clock_settime01: Make use of guarded buffers.
  syscalls/sendmmsg01: Make use of guarded buffers.

 doc/test-writing-guidelines.txt               |  68 +++++++++
 include/tst_buffers.h                         |  63 ++++++++
 include/tst_test.h                            |   6 +
 lib/newlib_tests/.gitignore                   |   1 +
 lib/newlib_tests/test_guarded_buf.c           |  92 +++++++++++
 lib/tst_buffers.c                             | 143 ++++++++++++++++++
 lib/tst_test.c                                |   8 +
 testcases/kernel/syscalls/accept/accept02.c   |  41 ++---
 .../kernel/syscalls/accept4/accept4_01.c      |  24 +--
 testcases/kernel/syscalls/add_key/add_key04.c |  13 +-
 .../kernel/syscalls/adjtimex/adjtimex01.c     |  23 +--
 .../kernel/syscalls/adjtimex/adjtimex02.c     |  39 ++---
 .../syscalls/clock_getres/clock_getres01.c    |  12 +-
 .../syscalls/clock_settime/clock_settime01.c  |  29 ++--
 testcases/kernel/syscalls/preadv/preadv01.c   |  10 +-
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     |  68 ++++-----
 16 files changed, 528 insertions(+), 112 deletions(-)
 create mode 100644 include/tst_buffers.h
 create mode 100644 lib/newlib_tests/test_guarded_buf.c
 create mode 100644 lib/tst_buffers.c

-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
