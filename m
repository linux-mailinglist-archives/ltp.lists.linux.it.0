Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F35FBF597
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 17:13:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2762B3C230A
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 17:13:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B72003C22CE
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 17:13:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 610F01401822
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 17:13:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 838BDB005
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 15:13:31 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 26 Sep 2019 17:13:28 +0200
Message-Id: <20190926151331.25070-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926151331.25070-1-mdoucha@suse.cz>
References: <20190926151331.25070-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] Update syscalls/bind02 to new API
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/bind/bind02.c | 154 +++++++-----------------
 1 file changed, 42 insertions(+), 112 deletions(-)

diff --git a/testcases/kernel/syscalls/bind/bind02.c b/testcases/kernel/syscalls/bind/bind02.c
index 90b0e9d8e..532831265 100644
--- a/testcases/kernel/syscalls/bind/bind02.c
+++ b/testcases/kernel/syscalls/bind/bind02.c
@@ -1,146 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
  *   Copyright (c) International Business Machines  Corp., 2004
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ *      07/2004 Written by Dan Jones
+ *      07/2004 Ported to LTP format by Robbie Williamson
+ *   Copyright (c) 2019 Martin Doucha <mdoucha@suse.cz>
  */
 
 /*
- * Test Name: bind02
- *
  * Test Description:
- *  Make sure bind() gives EACCESS error for (non-root) users.
- *
- * Usage:  <for command-line>
- *  bind01 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
- *      07/2004 Written by Dan Jones
- *      07/2004 Ported to LTP format by Robbie Williamson
- *
- * RESTRICTIONS:
- *  None.
- *
+ *  Make sure bind() of privileged port gives EACCESS error for non-root users.
  */
 
-#include <stdio.h>
-#include <stdlib.h>
+#include <string.h>
 #include <unistd.h>
-#include <errno.h>
-#include <fcntl.h>
 #include <pwd.h>
 #include <grp.h>
 
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/un.h>
-
 #include <netinet/in.h>
 
-#include "test.h"
-
-char *TCID = "bind02";
-int testno;
-int TST_TOTAL = 1;
-
-/* This port needs to be a Privledged port */
-#define TCP_PRIVLEGED_COM_PORT 463
-
-struct passwd *pw;
-struct group *gr;
+#include "tst_test.h"
 
-uid_t uid;
-gid_t gid;
+/* This port needs to be a privileged port */
+#define TCP_PRIVILEGED_PORT 463
+#define TEST_USERNAME "nobody"
 
-int rc;
-
-void try_bind(void)
+void run(void)
 {
 	struct sockaddr_in servaddr;
-	int sockfd, r_value;
-
-	// Set effective user/group
-	if ((rc = setegid(gid)) == -1) {
-		tst_brkm(TBROK | TERRNO, 0, "setegid(%u) failed", gid);
-	}
-	if ((rc = seteuid(uid)) == -1) {
-		tst_brkm(TBROK | TERRNO, 0, "seteuid(%u) failed", uid);
-	}
-
-	if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
-		tst_brkm(TBROK | TERRNO, 0, "socket() failed");
-	}
+	int sockfd;
 
+	sockfd = SAFE_SOCKET(AF_INET, SOCK_STREAM, 0);
 	memset(&servaddr, 0, sizeof(servaddr));
 	servaddr.sin_family = AF_INET;
-	servaddr.sin_port = htons(TCP_PRIVLEGED_COM_PORT);
+	servaddr.sin_port = htons(TCP_PRIVILEGED_PORT);
 	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
-	r_value = bind(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr));
-	if (r_value) {
-		if (errno == EACCES) {
-			tst_resm(TPASS, "correct error");
-		} else {
-			tst_resm(TFAIL, "incorrect error, %d", r_value);
-		}
-	} else {
-		tst_resm(TFAIL, "user was able to bind successfully");
-	}
-
+	TEST(bind(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr)));
 	close(sockfd);
 
-	// Set effective user/group
-	if ((rc = setegid(0)) == -1) {
-		tst_brkm(TBROK | TERRNO, 0, "setegid(0) reset failed");
-	}
-	if ((rc = seteuid(uid)) == -1) {
-		/* XXX: is this seteuid() correct !?  it isnt a reset if we
-		 *      made the same exact call above ...
-		 */
-		tst_brkm(TBROK | TERRNO, 0, "seteuid(%u) reset failed", uid);
+	if (!TST_RET) {
+		tst_res(TFAIL, "bind() succeeded unexpectedly");
+	} else if (TST_ERR == EACCES) {
+		tst_res(TPASS, "bind() failed as expected");
+	} else {
+		tst_res(TFAIL | TERRNO, "Unexpected error");
 	}
-
 }
 
-int main(int argc, char *argv[])
+void setup(void)
 {
-	char *username = "nobody";
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	tst_require_root();
+	struct passwd *pw;
+	struct group *gr;
 
-	if ((pw = getpwnam(username)) == NULL) {
-		tst_brkm(TBROK, 0, "Username - %s - not found", username);
-	}
-
-	if ((gr = getgrgid(pw->pw_gid)) == NULL) {
-		tst_brkm(TBROK | TERRNO, 0, "getgrgid(%u) failed", pw->pw_gid);
-	}
-
-	uid = pw->pw_uid;
-	gid = gr->gr_gid;
+	pw = SAFE_GETPWNAM(TEST_USERNAME);
+	gr = SAFE_GETGRGID(pw->pw_gid);
 
-	tst_resm(TINFO, "Socket will try to be bind by user: %s, group: %s",
-		 pw->pw_name, gr->gr_name);
+	tst_res(TINFO, "Switching credentials to user: %s, group: %s",
+		pw->pw_name, gr->gr_name);
+	SAFE_SETEGID(gr->gr_gid);
+	SAFE_SETEUID(pw->pw_uid);
+}
 
-	try_bind();
-	tst_exit();
+void cleanup(void)
+{
+	SAFE_SETEGID(0);
+	SAFE_SETEUID(0);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_root = 1,
+	.setup = setup,
+	.cleanup = cleanup
+};
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
