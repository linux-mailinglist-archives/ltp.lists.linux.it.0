Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AE0197C25
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:44:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28F293C316D
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:44:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A5B493C312D
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:43:45 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 08B9D6005D7
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:43:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BB18FAE1C;
 Mon, 30 Mar 2020 12:43:44 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 30 Mar 2020 14:43:36 +0200
Message-Id: <20200330124338.6764-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330124338.6764-1-pvorel@suse.cz>
References: <20200330124338.6764-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/5] lib/tst_cmd_*(): Search for program in $PATH
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

before calling execvp(). This is slightly safer than checking errno ENOENT.
TST_CMD_TCONF_ON_MISSING flag cause TCONF when program not found.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Li Wang <liwang@redhat.com>
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/test-writing-guidelines.txt |  3 ++-
 include/tst_cmd.h               |  3 +++
 lib/tst_cmd.c                   | 16 ++++++++++++----
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index e48168dfb..7069d3c8f 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1274,7 +1274,8 @@ which is followed by optional arguments.
 
 'TST_CMD_PASS_RETVAL' enum 'tst_cmd_flags' makes 'tst_cmd()'
 return the program exit code to the caller, otherwise 'tst_cmd()' exit the
-tests on failure.
+tests on failure. 'TST_CMD_TCONF_ON_MISSING' check for program in '$PATH' and exit
+with 'TCONF' if not found.
 
 In case that 'execvp()' has failed and the enum 'TST_CMD_PASS_RETVAL' flag was set, the
 return value is '255' if 'execvp()' failed with 'ENOENT' and '254' otherwise.
diff --git a/include/tst_cmd.h b/include/tst_cmd.h
index bba530e50..1f39f690f 100644
--- a/include/tst_cmd.h
+++ b/include/tst_cmd.h
@@ -11,6 +11,9 @@ enum tst_cmd_flags {
 	 * program exit code is not zero.
 	 */
 	TST_CMD_PASS_RETVAL = 1,
+
+	/* exit with TCONF if program is not in path */
+	TST_CMD_TCONF_ON_MISSING = 2,
 };
 
 /*
diff --git a/lib/tst_cmd.c b/lib/tst_cmd.c
index 012c2a32b..ba79806ce 100644
--- a/lib/tst_cmd.c
+++ b/lib/tst_cmd.c
@@ -56,6 +56,17 @@ int tst_cmd_fds_(void (cleanup_fn)(void),
 	 */
 	void *old_handler = signal(SIGCHLD, SIG_DFL);
 
+	const char *cmd;
+	char path[PATH_MAX];
+
+	if (tst_get_path(argv[0], path, sizeof(path))) {
+		if (flags & TST_CMD_TCONF_ON_MISSING)
+			tst_brkm(TCONF, "Couldn't find '%s' in $PATH at %s:%d", argv[0],
+				 __FILE__, __LINE__);
+		else
+			_exit(255);
+	}
+
 	pid_t pid = vfork();
 	if (pid == -1) {
 		tst_brkm(TBROK | TERRNO, cleanup_fn, "vfork failed at %s:%d",
@@ -74,10 +85,7 @@ int tst_cmd_fds_(void (cleanup_fn)(void),
 			dup2(stderr_fd, STDERR_FILENO);
 		}
 
-		if (execvp(argv[0], (char *const *)argv)) {
-			if (errno == ENOENT)
-				_exit(255);
-		}
+		execvp(argv[0], (char *const *)argv);
 		_exit(254);
 	}
 
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
