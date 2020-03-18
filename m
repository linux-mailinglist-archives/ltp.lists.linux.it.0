Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BADA189FC2
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 16:36:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 360BE3C0489
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 16:35:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 30D8F3C5531
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 16:34:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5C6F31A00E3E
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 16:34:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9CB21AE2C
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 15:34:14 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 18 Mar 2020 16:37:52 +0100
Message-Id: <20200318153801.3529-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/9] Add basic time namespace testcases
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

This is a set of test for the time namespaces that are going to be part
of 5.6 kernel.

v2:

* Added git has into sysinfo03, as requested by ritchie

* Included description for the timens01 test as requsted by ritchie

* Added SAFE_NETNS() which fixed compilation problems reported by pvorel
  as well

Cyril Hrubis (9):
  lapi/namespace_constants.h: Add CLONE_NEWTIME
  lapi: Add a configure check and fallback for setns
  safe_macros: Add SAFE_SETNS()
  include/tst_timer: Fix normalization
  syscalls/sysinfo03: Add time namespace test
  syscalls/clock_nanosleep03: Add test for time namespace
  syscalls/clock_gettime03: Add basic time namespace test
  containers/timens: Add basic error test
  syscalls/timerfd04: Add time namespace test

 configure.ac                                  |   1 +
 include/lapi/namespaces_constants.h           |   3 +
 include/lapi/setns.h                          |  20 ++++
 include/tst_safe_macros.h                     |   4 +
 include/tst_timer.h                           |  35 +++---
 lib/tst_safe_macros.c                         |  12 ++
 runtest/containers                            |   7 ++
 runtest/syscalls                              |   4 +
 testcases/kernel/containers/timens/.gitignore |   1 +
 testcases/kernel/containers/timens/Makefile   |   6 +
 testcases/kernel/containers/timens/timens01.c |  68 +++++++++++
 .../kernel/syscalls/clock_gettime/.gitignore  |   1 +
 .../syscalls/clock_gettime/clock_gettime03.c  | 112 ++++++++++++++++++
 .../syscalls/clock_nanosleep/.gitignore       |   1 +
 .../clock_nanosleep/clock_nanosleep03.c       |  71 +++++++++++
 testcases/kernel/syscalls/sysinfo/.gitignore  |   1 +
 testcases/kernel/syscalls/sysinfo/sysinfo03.c |  81 +++++++++++++
 testcases/kernel/syscalls/timerfd/.gitignore  |   1 +
 testcases/kernel/syscalls/timerfd/timerfd04.c |  98 +++++++++++++++
 19 files changed, 510 insertions(+), 17 deletions(-)
 create mode 100644 include/lapi/setns.h
 create mode 100644 testcases/kernel/containers/timens/.gitignore
 create mode 100644 testcases/kernel/containers/timens/Makefile
 create mode 100644 testcases/kernel/containers/timens/timens01.c
 create mode 100644 testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
 create mode 100644 testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
 create mode 100644 testcases/kernel/syscalls/sysinfo/sysinfo03.c
 create mode 100644 testcases/kernel/syscalls/timerfd/timerfd04.c

-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
