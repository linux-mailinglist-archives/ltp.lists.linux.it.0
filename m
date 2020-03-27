Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 441F7196090
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 22:39:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFB063C333A
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 22:39:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D846E3C32DC
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 22:39:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5B58E1A00791
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 22:39:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4AD1FAC4A;
 Fri, 27 Mar 2020 21:39:30 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Mar 2020 22:39:19 +0100
Message-Id: <20200327213924.18816-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327213924.18816-1-pvorel@suse.cz>
References: <20200327213924.18816-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/6] lib: Implement .needs_cmds
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New commit.

 doc/test-writing-guidelines.txt | 15 +++++++++++++++
 include/tst_test.h              |  3 +++
 lib/tst_test.c                  | 11 +++++++++++
 3 files changed, 29 insertions(+)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 32c9e87df..f7206f1bf 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2023,6 +2023,21 @@ struct tst_test test = {
 };
 -------------------------------------------------------------------------------
 
+2.2.35 Checking for required binaries
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Required binaries can be checked with '.needs_cmds', which points to a 'NULL'
+terminated array of strings such as:
+
+[source,c]
+-------------------------------------------------------------------------------
+.needs_cmds = (const char *const []) {
+	"useradd",
+	"userdel",
+	NULL
+},
+-------------------------------------------------------------------------------
+
 2.3 Writing a testcase in shell
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/tst_test.h b/include/tst_test.h
index 84b6a940f..592097084 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -239,6 +239,9 @@ struct tst_test {
 	 * {NULL, NULL} terminated array of tags.
 	 */
 	const struct tst_tag *tags;
+
+	/* NULL terminated array of required binaries */
+	const char *const *needs_cmds;
 };
 
 /*
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 220d7fdfc..dae3fa1b5 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015-2016 Cyril Hrubis <chrubis@suse.cz>
  */
 
+#include <limits.h>
 #include <stdio.h>
 #include <stdarg.h>
 #include <unistd.h>
@@ -880,6 +881,16 @@ static void do_setup(int argc, char *argv[])
 	if (tst_test->min_kver)
 		check_kver();
 
+	if (tst_test->needs_cmds) {
+		const char *cmd;
+		char path[PATH_MAX];
+		int i;
+
+		for (i = 0; (cmd = tst_test->needs_cmds[i]); ++i)
+			if (tst_get_path(cmd, path, sizeof(path)))
+				tst_brk(TCONF, "Couldn't find '%s' in $PATH", cmd);
+	}
+
 	if (tst_test->needs_drivers) {
 		const char *name;
 		int i;
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
