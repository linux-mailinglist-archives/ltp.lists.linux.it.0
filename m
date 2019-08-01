Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A03567D887
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 11:26:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 283AD3C2035
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 11:26:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5F00E3C1DFC
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 11:26:35 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7CB4560213C
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 11:26:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DC39AFD4
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 09:26:32 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  1 Aug 2019 11:26:07 +0200
Message-Id: <20190801092616.30553-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/9] Introduce guarded buffers
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

This is initial attempt to implement:

https://github.com/linux-test-project/ltp/issues/531

The idea of guarded buffers is that with these buffers undefined
behavior and possibly silent memory corruptions are turned into
segfaults which is much easier to spot and debug.

The first two commits introduce API for allocating guarded buffers with
poisoned PROT_NONE page right after the buffer and canary before the
buffer. Tests using these buffers will catch any access after the buffer
and writes before the buffer.

The next few patches make use of the buffers in a few tests mostly to
show the intended usage in real testcases. Applying these buffers to the
rest of the testcases would need much more effort though.

Cyril Hrubis (9):
  lib: Add support for guarded buffers
  lib: Add a canary for guarded buffers
  syscalls/preadv01: Make use of guarded buffers.
  syscalls/accept4_01: Make use of guarded buffers.
  syscalls/add_key04: Make use of guarded buffers.
  syscalls/adjtimex: Make use of guarded buffers.
  syscalls/clock_getres01: Make use of guarded buffers.
  syscalls/clock_settime01: Make use of guarded buffers.
  syscalls/sendmmsg01: Make use of guarded buffers.

 include/tst_buffers.h                         |  63 ++++++++
 include/tst_test.h                            |   6 +
 lib/newlib_tests/.gitignore                   |   1 +
 lib/newlib_tests/test_guarded_buf.c           |  86 +++++++++++
 lib/tst_buffers.c                             | 138 ++++++++++++++++++
 lib/tst_test.c                                |   5 +
 testcases/kernel/syscalls/accept/accept02.c   |  41 +++---
 .../kernel/syscalls/accept4/accept4_01.c      |  24 +--
 testcases/kernel/syscalls/add_key/add_key04.c |  13 +-
 .../kernel/syscalls/adjtimex/adjtimex01.c     |  23 +--
 .../kernel/syscalls/adjtimex/adjtimex02.c     |  39 ++---
 .../syscalls/clock_getres/clock_getres01.c    |  12 +-
 .../syscalls/clock_settime/clock_settime01.c  |  29 ++--
 testcases/kernel/syscalls/preadv/preadv01.c   |  10 +-
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     |  68 +++++----
 15 files changed, 446 insertions(+), 112 deletions(-)
 create mode 100644 include/tst_buffers.h
 create mode 100644 lib/newlib_tests/test_guarded_buf.c
 create mode 100644 lib/tst_buffers.c

-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
