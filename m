Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE922EDCA
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 15:46:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 022223C26C2
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 15:46:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 149F73C232B
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 15:46:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 855DD1000D27
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 15:46:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21DD6AF57;
 Mon, 27 Jul 2020 13:46:36 +0000 (UTC)
Date: Mon, 27 Jul 2020 15:46:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200727134647.GC7863@yuki.lan>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <c0ffc2cd5a39add866a0d64607ed4801efe344ee.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0ffc2cd5a39add866a0d64607ed4801efe344ee.1593152309.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 15/19] syscalls/semop: Migrate to new test
 framework
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  testcases/kernel/syscalls/ipc/semop/Makefile  |   4 +-
>  testcases/kernel/syscalls/ipc/semop/semop01.c | 140 ++++----
>  testcases/kernel/syscalls/ipc/semop/semop02.c | 145 +++------
>  testcases/kernel/syscalls/ipc/semop/semop03.c | 150 +++------
>  testcases/kernel/syscalls/ipc/semop/semop04.c | 165 ++++------
>  testcases/kernel/syscalls/ipc/semop/semop05.c | 303 ++++++++----------

Looking at the code, is there a real reson to keep the EFBIG tests in a
separate test? Why can't we just add these to the array in semop02? I
guess that we can merge semop04 to the semop02 as well.

Also if nothing else the support for uClinux has to be removed from
semop04. We have stopped supporting it a few years ago and any test
converted to the new library must remove it.

And lastly but not least, the tests should be a cleaned up a bit more,
there is still plenty of useless comments kept in the source. E.g. we do
have:

        /* Get an new IPC resource key. */
        semkey2 = GETIPCKEY();

How is that comment helping? It's stating the obvious. So can we please
get rid of these?

As well as the useless parts in the top level comment? For that part I
would do:

diff --git a/testcases/kernel/syscalls/ipc/semop/semop01.c b/testcases/kernel/syscalls/ipc/semop/semop01.c
index bcb45fa69..cbcbcea91 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop01.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop01.c
@@ -1,41 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* Copyright (c) International Business Machines  Corp., 2001 */
-
-/*
- * NAME
- *     semop01.c
- *
- * DESCRIPTION
- *     semop01 - test that semop() basic functionality is correct
- *
- * ALGORITHM
- *     create a semaphore set and initialize some values
- *     loop if that option was specified
- *     call semop() to set values for the primitive semaphores
- *     check the return code
- *       if failure, issue a FAIL message.
- *     otherwise,
- *       if doing functionality testing
- *             get the semaphore values and compare with expected values
- *             if correct,
- *                     issue a PASS message
- *             otherwise
- *                     issue a FAIL message
- *       else issue a PASS message
- *     call cleanup
- *
- * HISTORY
+/* Copyright (c) International Business Machines  Corp., 2001
  *     03/2001  - Written by Wayne Boyer
  *     17/01/02 - Modified. Manoj Iyer, IBM Austin. TX. manjo@austin.ibm.com
- *                4th argument to semctl() system call was modified according
- *                to man pages.
- *                In my opinion The test should not even have compiled but
- *                it was working due to some mysterious reason.
- *
- * RESTRICTIONS
- *     none
  */
-
+/*
+ * Test that semop() basic functionality is correct
+ */



-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
