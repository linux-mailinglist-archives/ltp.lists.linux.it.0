Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ED32CA9ED
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 18:42:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E0693C596E
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 18:42:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A88A93C2BEE
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 18:42:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1E15F10009F0
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 18:42:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A42AFAD0B;
 Tue,  1 Dec 2020 17:42:21 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  1 Dec 2020 18:42:07 +0100
Message-Id: <20201201174214.24625-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201174214.24625-1-pvorel@suse.cz>
References: <20201201174214.24625-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v5 03/10] fanotify: Add helper for event support check
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

i.e. FAN_OPEN_EXEC and FAN_OPEN_EXEC_PERM
and use it in relevant tests setup().

The purpose is to reduce checks (cleanup).

Due this change test with FAN_OPEN_EXEC_PERM in fanotify03.c no longer
needs to be a first test.

Also rename variable s/support_exec_events/exec_events_unsupported/
for readability.

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Originally part of "[v4,2/6] fanotify: Handle supported features checks in setup()"
(but fixed name - drop "exec").

 testcases/kernel/syscalls/fanotify/fanotify.h | 22 ++++++++
 .../kernel/syscalls/fanotify/fanotify03.c     | 34 ++++--------
 .../kernel/syscalls/fanotify/fanotify10.c     | 15 +++---
 .../kernel/syscalls/fanotify/fanotify12.c     | 53 +++++++++----------
 4 files changed, 63 insertions(+), 61 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 687089ace..8c677643f 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -60,6 +60,7 @@ int safe_fanotify_init(const char *file, const int lineno,
 
 	return rval;
 }
+
 #define SAFE_FANOTIFY_INIT(fan, mode)  \
 	safe_fanotify_init(__FILE__, __LINE__, (fan), (mode))
 
@@ -261,4 +262,25 @@ static inline void require_fanotify_access_permissions_supported_by_kernel(void)
 	SAFE_CLOSE(fd);
 }
 
+static inline int fanotify_events_supported_by_kernel(uint64_t mask)
+{
+	int fd;
+	int rval = 0;
+
+	fd = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
+
+	if (fanotify_mark(fd, FAN_MARK_ADD, mask, AT_FDCWD, ".") < 0) {
+		if (errno == EINVAL) {
+			rval = -1;
+		} else {
+			tst_brk(TBROK | TERRNO,
+				"fanotify_mark (%d, FAN_MARK_ADD, ..., AT_FDCWD, \".\") failed", fd);
+		}
+	}
+
+	SAFE_CLOSE(fd);
+
+	return rval;
+}
+
 #endif /* __FANOTIFY_H__ */
diff --git a/testcases/kernel/syscalls/fanotify/fanotify03.c b/testcases/kernel/syscalls/fanotify/fanotify03.c
index cd5576f3a..75e5b852d 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify03.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify03.c
@@ -48,18 +48,13 @@ static volatile int fd_notify;
 static pid_t child_pid;
 
 static char event_buf[EVENT_BUF_LEN];
-static int support_exec_events;
+static int exec_events_unsupported;
 
 struct event {
 	unsigned long long mask;
 	unsigned int response;
 };
 
-/*
- * Ensure to keep the first FAN_OPEN_EXEC_PERM test case before the first
- * MARK_TYPE(FILESYSTEM) in order to allow for correct detection between
- * exec events not supported and filesystem marks not supported.
- */
 static struct tcase {
 	const char *tname;
 	struct fanotify_mark_type mark;
@@ -212,28 +207,23 @@ static int setup_mark(unsigned int n)
 	char *const files[] = {fname, FILE_EXEC_PATH};
 
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
+
+	if (exec_events_unsupported && tc->mask & FAN_OPEN_EXEC_PERM) {
+		tst_res(TCONF, "FAN_OPEN_EXEC_PERM not supported in kernel?");
+		return -1;
+	}
+
 	fd_notify = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
 
 	for (; i < ARRAY_SIZE(files); i++) {
 		if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
 				  tc->mask, AT_FDCWD, files[i]) < 0) {
 			if (errno == EINVAL &&
-				(tc->mask & FAN_OPEN_EXEC_PERM &&
-				 !support_exec_events)) {
-				tst_res(TCONF,
-					"FAN_OPEN_EXEC_PERM not supported in "
-					"kernel?");
-				return -1;
-			} else if (errno == EINVAL &&
 					mark->flag == FAN_MARK_FILESYSTEM) {
 				tst_res(TCONF,
 					"FAN_MARK_FILESYSTEM not supported in "
 					"kernel?");
 				return -1;
-			} else if (errno == EINVAL) {
-				tst_brk(TCONF | TERRNO,
-					"CONFIG_FANOTIFY_ACCESS_PERMISSIONS "
-					"not configured in kernel?");
 			} else {
 				tst_brk(TBROK | TERRNO,
 					"fanotify_mark(%d, FAN_MARK_ADD | %s, "
@@ -241,14 +231,6 @@ static int setup_mark(unsigned int n)
 					"AT_FDCWD, %s) failed.",
 					fd_notify, mark->name, fname);
 			}
-		} else {
-			/*
-			 * To distinguish between perm not supported, exec
-			 * events not supported and filesystem mark not
-			 * supported.
-			 */
-			if (tc->mask & FAN_OPEN_EXEC_PERM)
-				support_exec_events = 1;
 		}
 	}
 
@@ -349,6 +331,8 @@ static void setup(void)
 {
 	require_fanotify_access_permissions_supported_by_kernel();
 
+	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC_PERM);
+
 	sprintf(fname, MOUNT_PATH"/fname_%d", getpid());
 	SAFE_FILE_PRINTF(fname, "1");
 
diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index 90cf5cb5f..73702285c 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -64,6 +64,7 @@ static unsigned int fanotify_class[] = {
 static int fd_notify[NUM_CLASSES][GROUPS_PER_PRIO];
 
 static char event_buf[EVENT_BUF_LEN];
+static int exec_events_unsupported;
 
 #define MOUNT_PATH "fs_mnt"
 #define MNT2_PATH "mntpoint"
@@ -323,13 +324,6 @@ static int create_fanotify_groups(unsigned int n)
 					    AT_FDCWD, tc->mark_path);
 			if (ret < 0) {
 				if (errno == EINVAL &&
-				    tc->expected_mask_without_ignore &
-				    FAN_OPEN_EXEC) {
-					tst_res(TCONF,
-						"FAN_OPEN_EXEC not supported "
-						"by kernel?");
-					return -1;
-				} else if (errno == EINVAL &&
 					tc->mark_type == FANOTIFY_FILESYSTEM) {
 					tst_res(TCONF,
 						"FAN_MARK_FILESYSTEM not "
@@ -451,6 +445,11 @@ static void test_fanotify(unsigned int n)
 
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
 
+	if (exec_events_unsupported && tc->expected_mask_with_ignore & FAN_OPEN_EXEC) {
+		tst_res(TCONF, "FAN_OPEN_EXEC not supported in kernel?");
+		return;
+	}
+
 	if (tc->ignored_onchild && tst_kvercmp(5, 9, 0) < 0) {
 		tst_res(TCONF, "ignored mask in combination with flag FAN_EVENT_ON_CHILD"
 				" has undefined behavior on kernel < 5.9");
@@ -535,6 +534,8 @@ cleanup:
 
 static void setup(void)
 {
+	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC);
+
 	/* Create another bind mount at another path for generating events */
 	SAFE_MKDIR(MNT2_PATH, 0755);
 	SAFE_MOUNT(MOUNT_PATH, MNT2_PATH, "none", MS_BIND, NULL);
diff --git a/testcases/kernel/syscalls/fanotify/fanotify12.c b/testcases/kernel/syscalls/fanotify/fanotify12.c
index fea7cb607..0d049fc6b 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify12.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify12.c
@@ -39,6 +39,7 @@ static char fname[BUF_SIZE];
 static volatile int fd_notify;
 static volatile int complete;
 static char event_buf[EVENT_BUF_LEN];
+static int exec_events_unsupported;
 
 static struct test_case_t {
 	const char *tname;
@@ -135,26 +136,26 @@ static int setup_mark(unsigned int n)
 	const char *const files[] = {fname, TEST_APP};
 
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
+
+	if (exec_events_unsupported && ((tc->mask & FAN_OPEN_EXEC) ||
+					tc->ignore_mask & FAN_OPEN_EXEC)) {
+		tst_res(TCONF, "FAN_OPEN_EXEC not supported in kernel?");
+		return -1;
+	}
+
 	fd_notify = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF, O_RDONLY);
 
 	for (; i < ARRAY_SIZE(files); i++) {
 		/* Setup normal mark on object */
 		if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
 					tc->mask, AT_FDCWD, files[i]) < 0) {
-			if (errno == EINVAL && tc->mask & FAN_OPEN_EXEC) {
-				tst_res(TCONF,
-					"FAN_OPEN_EXEC not supported in "
-					"kernel?");
-				return -1;
-			}else {
-				tst_brk(TBROK | TERRNO,
-					"fanotify_mark(%d, FAN_MARK_ADD | %s, "
-					"%llx, AT_FDCWD, %s) failed",
-					fd_notify,
-					mark->name,
-					tc->mask,
-					files[i]);
-			}
+			tst_brk(TBROK | TERRNO,
+				"fanotify_mark(%d, FAN_MARK_ADD | %s, "
+				"%llx, AT_FDCWD, %s) failed",
+				fd_notify,
+				mark->name,
+				tc->mask,
+				files[i]);
 		}
 
 		/* Setup ignore mark on object */
@@ -163,21 +164,13 @@ static int setup_mark(unsigned int n)
 						| FAN_MARK_IGNORED_MASK,
 						tc->ignore_mask, AT_FDCWD,
 						files[i]) < 0) {
-				if (errno == EINVAL &&
-					tc->ignore_mask & FAN_OPEN_EXEC) {
-					tst_res(TCONF,
-						"FAN_OPEN_EXEC not supported "
-						"in kernel?");
-					return -1;
-				} else {
-					tst_brk(TBROK | TERRNO,
-						"fanotify_mark (%d, "
-						"FAN_MARK_ADD | %s "
-						"| FAN_MARK_IGNORED_MASK, "
-						"%llx, AT_FDCWD, %s) failed",
-						fd_notify, mark->name,
-						tc->ignore_mask, files[i]);
-				}
+				tst_brk(TBROK | TERRNO,
+					"fanotify_mark (%d, "
+					"FAN_MARK_ADD | %s "
+					"| FAN_MARK_IGNORED_MASK, "
+					"%llx, AT_FDCWD, %s) failed",
+					fd_notify, mark->name,
+					tc->ignore_mask, files[i]);
 			}
 		}
 	}
@@ -244,6 +237,8 @@ cleanup:
 
 static void do_setup(void)
 {
+	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC);
+
 	sprintf(fname, "fname_%d", getpid());
 	SAFE_FILE_PRINTF(fname, "1");
 }
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
