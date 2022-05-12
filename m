Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B37524D01
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 14:36:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7CF5C3CA9BE
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 14:36:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 771783C053F
 for <ltp@lists.linux.it>; Thu, 12 May 2022 14:36:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 96EAB680E5C
 for <ltp@lists.linux.it>; Thu, 12 May 2022 14:36:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CEFAE21C70;
 Thu, 12 May 2022 12:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652358962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9KOBKZ3zgAHOLWtkFgbFRr9L+oO0Gqkm6VmP4ZEskfw=;
 b=nUm7tHS7ie5RLlfFFsMlZzjjwM1LMjKlCxmXB1QBQ9+GAbJ8zeXKClxhtSDk2uP3A2YVne
 3+8LsUZfgtXRnAAKGtlUq+vo1UU2QHaPtitFm6CQPxx0K+NJZfU6prhoOJwD4/TuqPPQhE
 uEWacRxp7y4g7HkfxonORUKOQ9DHXrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652358962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9KOBKZ3zgAHOLWtkFgbFRr9L+oO0Gqkm6VmP4ZEskfw=;
 b=6MlxhtYHUgRxwqVX943lUfEM0lHzw8EGC+sT33stTETGyltAY2SHNgEN0QWqh7KDywhx6e
 tykg71CscbHoBCDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD62E13ABE;
 Thu, 12 May 2022 12:36:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lV/MLTL/fGIJGgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 12 May 2022 12:36:02 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 May 2022 14:37:47 +0200
Message-Id: <20220512123816.24399-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 00/29] Introduce runtime and conver tests
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
Cc: automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This patchset introduces a concept of runtime, which is described well
enough in the first patch of the series and converts all tests that were
previously using timeout API to runtime API.

The main change to the v1 of the patchset is that the runtime is now per
iteration, e.g. if we run the test for all_filesystem the runtime
applies to a single filesystem only. And at the same time the overall
test timeout is a sum of static timeout and runtime. The static part of
the timeout is meant to cover test teardown and any inaccuracy in the
test runtime accounting.

The patches that convert tests to runtime API fall into these classes:

- fzsync tests
- faster timeout tests
- I/O tests
- timer precision tests
- oom tests
- misc tests that run for some time (controlled by command line
  parameter)

fzsync tests
============

These tests previously defined their runtime based on scale factor that
used slice of the default timeout (300s) for the test runtime.

Now the runtime is explicitly encoded in the test, which I find much
more user friendly because it's clear how long will the test run.

faster timeout tests
====================

There were several tests that set low timeout becuase the test may lock
up. In these cases the timeout was simply removed because the default
value (30s) should be small enough.

I/O tests
=========

The aiodio tests were modified so that their runtime is capped to
30 minutes by default. That means that even on very slow machine they
finish in a reasonable time.

timer precision tests
=====================

These test simply set the test timeout to be 110% of the sum of the
sleep_time * samples. That is to accomodate for the context switches and
upkeeping between the calls in the timer library.


oom tests
=========

Here we just set the .max_iteration_runtime to TST_RUNTIME_UNLIMITED,
which has the very same effect as .timeout = -1 previously had.

misc test
=========

In this case the test code was simplified quite a lot since the runtime
is now passed in a unified way and parsed in the test library.

v3:
   - renamed max_iteration_runtime to just max_runtime
     and tst_set_runtime() to tst_set_max_runtime()
   - fixed newlib_tests and CI runtest.sh
   - merged the two patches for af_alg02
   - added and fixed documentation
   - fixed a few bugs in the tst_test.c
     (LTP_RUNTIME_MUL etc.)

Cyril Hrubis (29):
  Introduce a concept of max runtime
  mtest06/mmap1: Convert to runtime
  mtest06/mmap3: Convert to runtime
  mtest01/mtest01: Convert to runtime
  cve/cve-2015-3290: Convert to runtime
  crypto/af_alg02: Convert to runtime.
  crypto/pcrypt_aead01: Convert to runtime
  syscalls/clock_gettime01: Remove useless timeout
  syscalls/fanotify22: Remove useless timeout
  syscalls/gettimeofday02: Convert to runtime.
  syscalls/inotify06: Convert to runtime.
  syscalls/inotify01: Remove now useless timeout
  syscalls/perf_event_open03: Convert to runtime
  syscalls/readv01: Remove now useless timeout
  syscalls/tgkill03: Remove now unused timeout
  syscalls/setsockopt09: Remove now useless timeout
  syscalls/userfaultfd01: Remove now useless timeout
  syscalls/move_pages12: Convert to runtime
  syscalls/rt_sigqueueinfo01: Remove now useless timeout
  mem/mallocstress: Convert to runtime
  mem/{oom,min_free_kbytes}: Convert to runtime
  fuzzy_sync: Convert to runtime
  ltp-aiodio/dio_sparse,aiodio_sparse: Convert to runtime.
  ltp-aiodio/read_checkzero: Remove
  ltp-aiodio/dio_{truncate,append}: Convert to runtime
  ltp-aiodio/dio_read: Convert to runtime
  timer_test: Convert to runtime
  ltp-aiodio/aiodio_append: Convert to runtime
  tst_test: Remove timeout stubs

 doc/c-test-api.txt                            |  42 +++--
 doc/user-guide.txt                            |  30 +++-
 include/tst_fuzzy_sync.h                      |  19 +--
 include/tst_test.h                            |  31 +++-
 lib/newlib_tests/.gitignore                   |   5 +-
 lib/newlib_tests/runtest.sh                   |   2 +-
 lib/newlib_tests/test10.c                     |  22 ---
 lib/newlib_tests/test12.c                     |  21 ---
 lib/newlib_tests/test13.c                     |   1 -
 lib/newlib_tests/test18.c                     |  22 ---
 lib/newlib_tests/test_children_cleanup.c      |   1 -
 lib/newlib_tests/test_runtime01.c             |  30 ++++
 lib/newlib_tests/test_runtime02.c             |  28 ++++
 lib/newlib_tests/tst_fuzzy_sync01.c           |   1 +
 lib/newlib_tests/tst_fuzzy_sync02.c           |   1 +
 lib/newlib_tests/tst_fuzzy_sync03.c           |   1 +
 lib/tst_test.c                                | 143 +++++++++++++-----
 lib/tst_timer_test.c                          |  12 +-
 runtest/ltp-aiodio.part4                      |   2 -
 testcases/cve/cve-2015-3290.c                 |   8 +-
 testcases/kernel/crypto/af_alg02.c            |   4 +-
 testcases/kernel/crypto/af_alg07.c            |   1 +
 testcases/kernel/crypto/pcrypt_aead01.c       |   3 +-
 testcases/kernel/io/ltp-aiodio/.gitignore     |   1 -
 .../kernel/io/ltp-aiodio/aiodio_append.c      |  25 ++-
 .../kernel/io/ltp-aiodio/aiodio_sparse.c      |  26 +++-
 testcases/kernel/io/ltp-aiodio/common.h       |  12 +-
 testcases/kernel/io/ltp-aiodio/dio_append.c   |   4 +
 testcases/kernel/io/ltp-aiodio/dio_read.c     |   9 ++
 testcases/kernel/io/ltp-aiodio/dio_sparse.c   |   6 +-
 testcases/kernel/io/ltp-aiodio/dio_truncate.c |   6 +
 .../kernel/io/ltp-aiodio/read_checkzero.c     |  84 ----------
 testcases/kernel/mem/mtest01/mtest01.c        |  14 +-
 testcases/kernel/mem/mtest06/mmap1.c          |  24 +--
 testcases/kernel/mem/mtest06/mmap3.c          |  12 +-
 testcases/kernel/mem/mtest07/mallocstress.c   |  11 +-
 testcases/kernel/mem/oom/oom01.c              |   2 +-
 testcases/kernel/mem/oom/oom02.c              |   2 +-
 testcases/kernel/mem/oom/oom03.c              |   2 +-
 testcases/kernel/mem/oom/oom04.c              |   2 +-
 testcases/kernel/mem/oom/oom05.c              |   2 +-
 testcases/kernel/mem/thp/thp04.c              |   1 +
 .../kernel/mem/tunable/min_free_kbytes.c      |   2 +-
 testcases/kernel/pty/pty03.c                  |   2 +-
 testcases/kernel/pty/pty05.c                  |   1 +
 testcases/kernel/pty/pty06.c                  |   1 +
 testcases/kernel/pty/pty07.c                  |   1 +
 testcases/kernel/sound/snd_seq01.c            |   2 +-
 testcases/kernel/sound/snd_timer01.c          |   1 +
 testcases/kernel/syscalls/bind/bind06.c       |   2 +-
 .../syscalls/clock_gettime/clock_gettime01.c  |   1 -
 .../kernel/syscalls/fanotify/fanotify22.c     |   1 -
 .../syscalls/gettimeofday/gettimeofday02.c    |  15 +-
 testcases/kernel/syscalls/inotify/inotify06.c |   7 +-
 testcases/kernel/syscalls/inotify/inotify09.c |   1 +
 testcases/kernel/syscalls/inotify/inotify11.c |   1 -
 .../kernel/syscalls/ipc/shmctl/shmctl05.c     |   2 +-
 .../kernel/syscalls/move_pages/move_pages12.c |   4 +-
 .../perf_event_open/perf_event_open03.c       |  15 +-
 testcases/kernel/syscalls/readv/readv01.c     |   1 -
 .../rt_sigqueueinfo/rt_sigqueueinfo01.c       |   1 -
 testcases/kernel/syscalls/sendmsg/sendmsg03.c |   1 +
 .../kernel/syscalls/setsockopt/setsockopt06.c |   2 +-
 .../kernel/syscalls/setsockopt/setsockopt07.c |   1 +
 .../kernel/syscalls/setsockopt/setsockopt09.c |   1 -
 testcases/kernel/syscalls/tgkill/tgkill03.c   |   1 -
 .../syscalls/timerfd/timerfd_settime02.c      |   1 +
 .../syscalls/userfaultfd/userfaultfd01.c      |   1 -
 testcases/kernel/syscalls/writev/writev03.c   |   2 +-
 69 files changed, 419 insertions(+), 327 deletions(-)
 delete mode 100644 lib/newlib_tests/test10.c
 delete mode 100644 lib/newlib_tests/test12.c
 delete mode 100644 lib/newlib_tests/test18.c
 create mode 100644 lib/newlib_tests/test_runtime01.c
 create mode 100644 lib/newlib_tests/test_runtime02.c
 delete mode 100644 testcases/kernel/io/ltp-aiodio/read_checkzero.c

-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
