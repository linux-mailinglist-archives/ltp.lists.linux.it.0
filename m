Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DC7341DA2
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 14:04:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 675BC3C5FBD
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 14:04:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 70D7F3C5FB1
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 14:04:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D0A6A1A00CDB
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 14:04:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF86AAC17;
 Fri, 19 Mar 2021 13:04:09 +0000 (UTC)
Date: Fri, 19 Mar 2021 14:04:07 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YFShR2Qd7Ubve1wi@pevik>
References: <20210318131134.3562203-1-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318131134.3562203-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/8] fanotify tests for v5.13
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> Hi Petr,

> Following tests were used for development of the two features
> queued for v5.13 (in linux-next):
> - Performance improvements for events merge [1]
> - Unprivileged fanotify listener [2]

As these are features not fixes, I suppose nothing from these already merged 2
patchsets in next tree can be added with struct tst_tag to document it.
I wonder if any of these are could be at least noted in the tests / commit
messages.

> All test cases of fanotify05 pass on upstream, but their runtime
> on linux-next is reduced by more than half.

> Only the first test case of fanotify17 pass on upstream.
> The rest of the test cases as well as fanotify18 and fanotify19
> tests exit with TCONF on upstream. They all pass on linux-next.

Thanks! LGTM, thanks for testing them on both mainline and next tree.

To whole patchset:
Reviewed-by: Petr Vorel <pvorel@suse.cz>

I'll apply it with following tiny fixes to fix compilation on very old kernels
(2.6.x) and to use our documentation format [3] [4].
(+ later I'll fix documentation format for the rest of the tests)

Kind regards,
Petr

> Thanks,
> Amir.

> [1] https://lore.kernel.org/linux-fsdevel/20210304104826.3993892-1-amir73il@gmail.com/
> [2] https://lore.kernel.org/linux-fsdevel/20210304112921.3996419-1-amir73il@gmail.com/

[3] https://github.com/linux-test-project/ltp/releases/download/20210121/metadata.20210121.pdf
[4] https://github.com/linux-test-project/ltp/releases/download/20210121/metadata.20210121.html

diff --git testcases/kernel/syscalls/fanotify/fanotify17.c testcases/kernel/syscalls/fanotify/fanotify17.c
index ee242a441..98355a7b4 100644
--- testcases/kernel/syscalls/fanotify/fanotify17.c
+++ testcases/kernel/syscalls/fanotify/fanotify17.c
@@ -7,13 +7,15 @@
  * Forked from getxattr05.c by Amir Goldstein <amir73il@gmail.com>
  */
 
-/*
- * DESCRIPTION
- *     Check that fanotify groups and marks limits are enforced correctly.
- *     If user ns is supported, verify that global limit and per user ns
- *     limits are both enforced.
- *     Otherwise, we only check that global groups limit is enforced.
+/*\
+ * [Description]
+ *
+ * Check that fanotify groups and marks limits are enforced correctly.
+ * If user ns is supported, verify that global limit and per user ns
+ * limits are both enforced.
+ * Otherwise, we only check that global groups limit is enforced.
  */
+
 #define _GNU_SOURCE
 #include "config.h"
 #include <errno.h>
diff --git testcases/kernel/syscalls/fanotify/fanotify18.c testcases/kernel/syscalls/fanotify/fanotify18.c
index 1acd23ce2..318245efc 100644
--- testcases/kernel/syscalls/fanotify/fanotify18.c
+++ testcases/kernel/syscalls/fanotify/fanotify18.c
@@ -3,13 +3,17 @@
  * Copyright (c) 2018 Matthew Bobrowski. All Rights Reserved.
  *
  * Started by Matthew Bobrowski <mbobrowski@mbobrowski.org>
+ */
+
+/*\
+ * [Description]
  *
- * DESCRIPTION
- *	This set of tests is to ensure that the unprivileged listener feature of
- *	fanotify is functioning as expected. The objective this test case file
- *	is to validate whether any forbidden flags that are passed by an
- *	unprivileged user return the correct error result.
+ * This set of tests is to ensure that the unprivileged listener feature of
+ * fanotify is functioning as expected. The objective this test case file
+ * is to validate whether any forbidden flags that are passed by an
+ * unprivileged user return the correct error result.
  */
+
 #define _GNU_SOURCE
 #include "config.h"
 
@@ -17,10 +21,9 @@
 #include <stdio.h>
 #include <errno.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
-#if defined(HAVE_SYS_FANOTIFY_H)
-#include <sys/fanotify.h>
+#ifdef HAVE_SYS_FANOTIFY_H
+#include "fanotify.h"
 
 /*
  * This is a set of intialization flags that are not permitted to be used by an
@@ -194,5 +197,5 @@ static struct tst_test test = {
 };
 
 #else
-	TST_TEST_CONF("System does not have required fanotify support");
+	TST_TEST_TCONF("system doesn't have required fanotify support");
 #endif
diff --git testcases/kernel/syscalls/fanotify/fanotify19.c testcases/kernel/syscalls/fanotify/fanotify19.c
index 83a9aaa98..92ed45e49 100644
--- testcases/kernel/syscalls/fanotify/fanotify19.c
+++ testcases/kernel/syscalls/fanotify/fanotify19.c
@@ -3,14 +3,18 @@
  * Copyright (c) 2018 Matthew Bobrowski. All Rights Reserved.
  *
  * Started by Matthew Bobrowski <mbobrowski@mbobrowski.org>
+ */
+
+/*\
+ * [Description]
  *
- * DESCRIPTION
- *	This set of tests is to ensure that the unprivileged listener feature of
- *	fanotify is functioning as expected. The objective of this test file is
- *	to generate a sequence of events and ensure that the returned events
- *	contain the limited values that an unprivileged listener is expected
- *	to receive.
+ * This set of tests is to ensure that the unprivileged listener feature of
+ * fanotify is functioning as expected. The objective of this test file is
+ * to generate a sequence of events and ensure that the returned events
+ * contain the limited values that an unprivileged listener is expected
+ * to receive.
  */
+
 #define _GNU_SOURCE
 #include "config.h"
 
@@ -21,10 +25,9 @@
 #include <sys/wait.h>
 
 #include "tst_test.h"
-#include "fanotify.h"
 
-#if defined(HAVE_SYS_FANOTIFY_H)
-#include <sys/fanotify.h>
+#ifdef HAVE_SYS_FANOTIFY_H
+#include "fanotify.h"
 
 #define EVENT_MAX 1024
 #define EVENT_SIZE (sizeof (struct fanotify_event_metadata))
@@ -249,5 +252,5 @@ static struct tst_test test = {
 };
 
 #else
-	TST_TEST_CONF("System does not have required fanotify support");
+	TST_TEST_TCONF("system doesn't have required fanotify support");
 #endif

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
