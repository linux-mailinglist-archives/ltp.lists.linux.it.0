Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9881617A6B1
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:49:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FC043C655A
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:49:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id DAFFE3C6547
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:48:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7BB171039C16
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:48:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BEB03B018
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 13:48:35 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Mar 2020 14:48:26 +0100
Message-Id: <20200305134834.16736-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 0/8] Add basic time namespace testcases
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

Cyril Hrubis (8):
  lapi/namespace_constants.h: Add CLONE_NEWTIME
  lapi: Add a configure check and fallback for setns
  include/tst_timer: Fix normalization
  syscalls/sysinfo03: Add time namespace test
  syscalls/clock_nanosleep03: Add test for time namespace
  syscalls/clock_gettime03: Add basic time namespace test
  containers/timens: Add basic error test
  syscalls/timerfd04: Add time namespace test

 configure.ac                                  |   1 +
 include/lapi/namespaces_constants.h           |   3 +
 include/lapi/setns.h                          |  20 ++++
 include/tst_timer.h                           |  35 +++---
 runtest/containers                            |   7 ++
 runtest/syscalls                              |   4 +
 testcases/kernel/containers/timens/.gitignore |   1 +
 testcases/kernel/containers/timens/Makefile   |   6 +
 testcases/kernel/containers/timens/timens01.c |  75 ++++++++++++
 .../kernel/syscalls/clock_gettime/.gitignore  |   1 +
 .../syscalls/clock_gettime/clock_gettime03.c  | 113 ++++++++++++++++++
 .../syscalls/clock_nanosleep/.gitignore       |   1 +
 .../clock_nanosleep/clock_nanosleep03.c       |  71 +++++++++++
 testcases/kernel/syscalls/sysinfo/.gitignore  |   1 +
 testcases/kernel/syscalls/sysinfo/sysinfo03.c |  78 ++++++++++++
 testcases/kernel/syscalls/timerfd/.gitignore  |   1 +
 testcases/kernel/syscalls/timerfd/timerfd04.c |  95 +++++++++++++++
 17 files changed, 496 insertions(+), 17 deletions(-)
 create mode 100644 include/lapi/setns.h
 create mode 100644 testcases/kernel/containers/timens/.gitignore
 create mode 100644 testcases/kernel/containers/timens/Makefile
 create mode 100644 testcases/kernel/containers/timens/timens01.c
 create mode 100644 testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
 create mode 100644 testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
 create mode 100644 testcases/kernel/syscalls/sysinfo/sysinfo03.c
 create mode 100644 testcases/kernel/syscalls/timerfd/timerfd04.c

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
