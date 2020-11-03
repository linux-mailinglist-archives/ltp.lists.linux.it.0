Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2652A4FC4
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:14:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09E463C5471
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:14:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A2B7A3C3047
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2C1711401428
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7DE8BAF34;
 Tue,  3 Nov 2020 19:13:40 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Nov 2020 20:13:21 +0100
Message-Id: <20201103191327.11081-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201103191327.11081-1-pvorel@suse.cz>
References: <20201103191327.11081-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 05/11] syscalls: Add a few documentation comments
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
Cc: Cyril Hrubis <metan@ucw.cz>, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cyril Hrubis <metan@ucw.cz>

So that it shows up in the resulting json file.

Signed-off-by: Cyril Hrubis <metan@ucw.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/abort/abort01.c   | 16 ++++++++++------
 testcases/kernel/syscalls/accept/accept01.c |  8 +++++---
 testcases/kernel/syscalls/accept/accept02.c |  7 +++++--
 testcases/kernel/syscalls/acct/acct01.c     |  5 +++++
 testcases/kernel/syscalls/acct/acct02.c     |  6 ++++--
 5 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/syscalls/abort/abort01.c b/testcases/kernel/syscalls/abort/abort01.c
index 9505a5eec..b93324b34 100644
--- a/testcases/kernel/syscalls/abort/abort01.c
+++ b/testcases/kernel/syscalls/abort/abort01.c
@@ -5,14 +5,18 @@
  *   01/02/2003	Port to LTP	avenkat@us.ibm.com
  *   11/11/2002: Ported to LTP Suite by Ananda
  *   06/30/2001	Port to Linux	nsharoff@us.ibm.com
- *
- * ALGORITHM
- *	Fork child.  Have child abort, check return status.
- *
- * RESTRICTIONS
- *      The ulimit for core file size must be greater than 0.
  */
 
+/*\
+ * [DESCRIPTION]
+ *  Checks that process which called abort() gets killed by SIGIOT and dumps core.
+ *
+ * [ALGORITHM]
+ *  - Fork child.
+ *  - Child calls abort.
+ *  - Parent checks return status.
+\*/
+
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <errno.h>
diff --git a/testcases/kernel/syscalls/accept/accept01.c b/testcases/kernel/syscalls/accept/accept01.c
index 4e30906f2..01d6db84c 100644
--- a/testcases/kernel/syscalls/accept/accept01.c
+++ b/testcases/kernel/syscalls/accept/accept01.c
@@ -3,11 +3,13 @@
 /*
  *   Copyright (c) International Business Machines  Corp., 2001
  *   07/2001 Ported by Wayne Boyer
- *
- *   Description:
- *     Verify that accept() returns the proper errno for various failure cases
  */
 
+/*\
+ * [DESCRIPTION]
+ * Verify that accept() returns the proper errno for various failure cases.
+\*/
+
 #include <stdio.h>
 #include <unistd.h>
 #include <errno.h>
diff --git a/testcases/kernel/syscalls/accept/accept02.c b/testcases/kernel/syscalls/accept/accept02.c
index 37ab8b64f..7fb6a494a 100644
--- a/testcases/kernel/syscalls/accept/accept02.c
+++ b/testcases/kernel/syscalls/accept/accept02.c
@@ -3,7 +3,10 @@
  * Copyright (c) 2019 SUSE LLC
  * Author: Christian Amann <camann@suse.com>
  */
-/* Test for CVE-2017-8890
+/*\
+ * [DESCRIPTION]
+ *
+ * Test for CVE-2017-8890
  *
  * In Kernels up to 4.10.15 missing commit 657831ff the multicast
  * group information of a socket gets copied over to a newly created
@@ -16,7 +19,7 @@
  *
  * For more information about this CVE see:
  * https://www.suse.com/security/cve/CVE-2017-8890/
- */
+\*/
 
 #include <errno.h>
 #include <sys/socket.h>
diff --git a/testcases/kernel/syscalls/acct/acct01.c b/testcases/kernel/syscalls/acct/acct01.c
index c161d2a2c..60e81bfad 100644
--- a/testcases/kernel/syscalls/acct/acct01.c
+++ b/testcases/kernel/syscalls/acct/acct01.c
@@ -7,6 +7,11 @@
 /* 12/03/2002	Port to LTP     robbiew@us.ibm.com */
 /* 06/30/2001	Port to Linux	nsharoff@us.ibm.com */
 
+/*\
+ * [DOCUMENTATION]
+ *  Verify that acct() returns proper errno on failure.
+\*/
+
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <errno.h>
diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
index 8ee1bfcf8..e718e7df4 100644
--- a/testcases/kernel/syscalls/acct/acct02.c
+++ b/testcases/kernel/syscalls/acct/acct02.c
@@ -3,7 +3,9 @@
  *  Copyright (c) SUSE LLC, 2019
  *  Author: Christian Amann <camann@suse.com>
  */
-/*
+/*\
+ * [DOCUMENTATION]
+ *
  * This tests if the kernel writes correct data to the
  * process accounting file.
  *
@@ -19,7 +21,7 @@
  *
  * This is also accidental regression test for:
  * 4d9570158b626 kernel/acct.c: fix the acct->needcheck check in check_free_space()
- */
+\*/
 
 #include <sys/stat.h>
 #include <errno.h>
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
