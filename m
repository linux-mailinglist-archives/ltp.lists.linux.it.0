Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD728A803E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Apr 2024 12:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1713348028; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=Vjz3G2qYUK/dthWCkf0rwY9zn5oxidPKWYIuqTQKY2Q=;
 b=BEjwxGg6IvR7rUsOvISXGOrYeQtr+4tDa1Wb48728JXz0Tj8AhViGKJbgpce/wHTl8mOY
 j/glqLM0EDLIaqciwMfTXNV3HsC340ZfzBfqGCT4+rESRds6mBynOq6Iwco8euD+roAZOLY
 PbBDKjEj31fwU/V7lHIap2zSmOFDXGk=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E32E3CFB85
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Apr 2024 12:00:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1177A3CFB97
 for <ltp@lists.linux.it>; Wed, 17 Apr 2024 12:00:24 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=207.54.90.49;
 helo=esa3.hc1455-7.c3s2.iphmx.com; envelope-from=xuyang2018.jy@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com
 [207.54.90.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4D3C62095E1
 for <ltp@lists.linux.it>; Wed, 17 Apr 2024 12:00:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1713348024; x=1744884024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OIc1TPaKeq7QspWnZc7DvTLGNAJpt/pVK0jBxCZZzLo=;
 b=FzYRH91g1QfKZEN8BQh9KKL1vluX1peyhACWWpRoKS27lrIgrONDgZiC
 f6dpTHFLG8DDfgbhWsVUSLxq5wltflykX7q5H8UwzEkNP5Ea8W8GIRDLP
 8ugxvtrLbodhuj8CUwhoegf90xFGSh8K65iwwk3g4D+s+JbPW1V3J9k5s
 7vvl+gGXvmdVMb5qyQIzzq6O2JY6/Ha8I7dhBHXVWHeKErmdgqBU6P15V
 gn6THBV8fNPVfwwS+klspiecCwhwZAWEsnXN8cy4+bCjPzY+HDlNodBKA
 KMzv6R0TLio2TVHCXpZYUTPckvdJ7EywBCRMh/gy0DkD4VcMInqAfDRhl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155841793"
X-IronPort-AV: E=Sophos;i="6.07,208,1708354800"; d="scan'208";a="155841793"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
 by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 19:00:21 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 15B79E0803
 for <ltp@lists.linux.it>; Wed, 17 Apr 2024 19:00:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com
 [192.51.206.21])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E0D222D81
 for <ltp@lists.linux.it>; Wed, 17 Apr 2024 19:00:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D11272008FF92
 for <ltp@lists.linux.it>; Wed, 17 Apr 2024 19:00:16 +0900 (JST)
Received: from rhel93GA.g08.fujitsu.local (unknown [10.167.221.71])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id 692CB1A000A;
 Wed, 17 Apr 2024 18:00:16 +0800 (CST)
To: ltp@lists.linux.it
Date: Wed, 17 Apr 2024 05:26:05 -0400
Message-Id: <20240417092605.23645-1-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.006
X-TMASE-Result: 10--21.599100-10.000000
X-TMASE-MatchedRID: ViBM8e+kg1tSuJfEWZSQfKzGfgakLdjaTJDl9FKHbrk6FHRWx2FGsI3c
 eRXYSJoDIvrftAIhWmJ8eC2pVr1wb6/Elphzpf1LGYJhRh6ssesfimmlcABuNyfJTn+dmnFQGmV
 udEhnpoTXFQkvS/0vibjp8M1JUHNNXhvAA0pOb6LkKCFOKwAEzF7OZ6hrwwnzRaSpfGgYItc7ET
 vuQ225CeK7iWl7pVxurWabj9w4QrbOLLwxlMO5Pb9A3Bl1/DcV+VJ6lZyB0s/PhbT/QiIN5YY+d
 4I4WCpEGPUqcyv3m0IhRIvYJaL9ihccs8336rx5hdD+G7U5X/SOVGny5q72hrq7tRXXP55Go8WM
 kQWv6iXBcIE78YqRWo6HM5rqDwqtlExlQIQeRG0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3] unlinkat: Add negative tests for unlinkat
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
From: Yang Xu via ltp <ltp@lists.linux.it>
Reply-To: Yang Xu <xuyang2018.jy@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add negative cases for unlink(), including following errnos:
EACCES, EFAULT, EISDIR, ENAMETOOLONG ENOENT, ENOTDIR, EPERM, EROFS, EBADF,
EINVAL

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/unlinkat/.gitignore |   1 +
 .../kernel/syscalls/unlinkat/unlinkat02.c     | 234 ++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 testcases/kernel/syscalls/unlinkat/unlinkat02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 000c9e536..3521047f4 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1655,6 +1655,7 @@ unlink09 unlink09
 
 #unlinkat test cases
 unlinkat01 unlinkat01
+unlinkat02 unlinkat02
 
 unshare01 unshare01
 unshare02 unshare02
diff --git a/testcases/kernel/syscalls/unlinkat/.gitignore b/testcases/kernel/syscalls/unlinkat/.gitignore
index 76ed551f2..450063051 100644
--- a/testcases/kernel/syscalls/unlinkat/.gitignore
+++ b/testcases/kernel/syscalls/unlinkat/.gitignore
@@ -1 +1,2 @@
 /unlinkat01
+/unlinkat02
diff --git a/testcases/kernel/syscalls/unlinkat/unlinkat02.c b/testcases/kernel/syscalls/unlinkat/unlinkat02.c
new file mode 100644
index 000000000..1256bbc57
--- /dev/null
+++ b/testcases/kernel/syscalls/unlinkat/unlinkat02.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2024 FUJITSU LIMITED. All Rights Reserved.
+ * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that unlinkat(2) fails with
+ *
+ * - EACCES when write access to the directory containing pathname not allowed
+ * - EACCES when one of directories in pathname did not allow search permission
+ * - EFAULT when pathname points outside acessible address space
+ * - EISDIR when pathname refers to a directory
+ * - ENAMETOOLONG when pathname is too long
+ * - ENOENT when a component of the pathname does not exist
+ * - ENOENT when pathname is empty
+ * - ENOTDIR when a component of pathname used as dicrectory is not a directory
+ * - EPERM when file to be unlinked is marked immutable
+ * - EPERM when file to be unlinked is marked append-only
+ * - EROFS when pathname refers to a file on a read-only filesystem
+ * - EBADF when pathname is relative but dirfd is neither AT_FDCWD nor valid
+ * - EINVAL when an invalid flag is specified
+ * - ENOTDIR when pathname is relative and dirfd refers to a file
+ */
+
+#define _GNU_SOURCE
+
+#include <fcntl.h>
+#include <pwd.h>
+#include <sys/ioctl.h>
+#include "tst_test.h"
+#include "lapi/fs.h"
+
+#define DIR_EACCES_NOWRITE "nowrite"
+#define DIR_EACCES_NOSEARCH "nosearch"
+#define TEST_EACCES "test_eacces"
+#define DIR_NORMAL "normal"
+#define TEST_NORMAL "test_normal"
+#define TEST_EFAULT "test_efault"
+#define DIR_EISDIR "isdir"
+#define TEST_ENOENT_NOTEXIST "test_enoent_notexist"
+#define TEST_ENOENT_FILE "test_enoent_file"
+#define TEST_ENOTDIR "enotdir/file"
+#define DIR_ENOTDIR "enotdir"
+#define TEST_EPERM_IMMUTABLE "test_eperm_immutable"
+#define TEST_EPERM_APPEND_ONLY "test_eperm_append_only"
+#define DIR_EROFS "erofs"
+#define TEST_EROFS "test_erofs"
+#define DIR_EBADF "ebadf"
+#define TEST_EBADF "test_ebadf"
+#define DIR_ENOTDIR2 "enotdir2"
+#define TEST_ENOTDIR2 "test_enotdir2"
+
+static struct passwd *pw;
+static char longfilename[PATH_MAX + 1];
+static int fd_immutable;
+static int fd_append_only;
+
+static struct test_case_t {
+	char *dirname;
+	char *filename;
+	int *fd;
+	int ioctl_flag;
+	int flags;
+	int user;
+	int expected_errno;
+	char *desc;
+} tcases[] = {
+	{DIR_EACCES_NOWRITE, TEST_EACCES, NULL, 0, 0, 1, EACCES,
+		"unlinkat() in directory with no write access"},
+	{DIR_EACCES_NOSEARCH, TEST_EACCES, NULL, 0, 0, 1, EACCES,
+		"unlinkat() in directory with no search access"},
+	{DIR_NORMAL, NULL, NULL, 0, 0, 0, EFAULT,
+		"unlinkat() access pathname outside address space"},
+	{DIR_NORMAL, DIR_EISDIR, NULL, 0, 0, 0, EISDIR,
+		"unlinkat() pathname is a directory"},
+	{DIR_NORMAL, longfilename, NULL, 0, 0, 0, ENAMETOOLONG,
+		"unlinkat() pathname is too long"},
+	{DIR_NORMAL, TEST_ENOENT_NOTEXIST, NULL, 0, 0, 0, ENOENT,
+		"unlinkat() pathname does not exist"},
+	{DIR_NORMAL, "", NULL, 0, 0, 0, ENOENT,
+		"unlinkat() pathname is a empty"},
+	{DIR_NORMAL, TEST_ENOTDIR, NULL, 0, 0, 0, ENOTDIR,
+		"unlinkat() component of pathname used as directory "
+		"is not directory"},
+	{DIR_NORMAL, TEST_EPERM_IMMUTABLE, &fd_immutable, FS_IMMUTABLE_FL,
+		0, 0, EPERM,
+		"unlinkat() pathname is immutable"},
+	{DIR_NORMAL, TEST_EPERM_APPEND_ONLY, &fd_append_only, FS_APPEND_FL,
+		0, 0, EPERM,
+		"unlinkat() pathname is append-only"},
+	{DIR_EROFS, TEST_EROFS, NULL, 0, 0, 0, EROFS,
+		"unlinkat() pathname in read-only filesystem"},
+	{DIR_EBADF, TEST_EBADF, NULL, 0, 0, 0, EBADF,
+		"unlinkat() dirfd is not valid"},
+	{DIR_NORMAL, TEST_NORMAL, NULL, 0, -1, 0, EINVAL,
+		"unlinkat() flag is not valid"},
+	{DIR_ENOTDIR2, TEST_ENOTDIR2, NULL, 0, 0, 0, ENOTDIR,
+		"unlinkat() dirfd is not a directory"},
+};
+
+static void setup(void)
+{
+	int attr;
+
+	pw = SAFE_GETPWNAM("nobody");
+
+	SAFE_MKDIR(DIR_EACCES_NOWRITE, 0777);
+	SAFE_TOUCH(DIR_EACCES_NOWRITE "/" TEST_EACCES, 0777, NULL);
+	SAFE_CHMOD(DIR_EACCES_NOWRITE, 0555);
+
+	SAFE_MKDIR(DIR_EACCES_NOSEARCH, 0777);
+	SAFE_TOUCH(DIR_EACCES_NOSEARCH "/" TEST_EACCES, 0777, NULL);
+	SAFE_CHMOD(DIR_EACCES_NOSEARCH, 0666);
+
+	SAFE_MKDIR(DIR_NORMAL, 0777);
+	SAFE_TOUCH(DIR_NORMAL "/" TEST_NORMAL, 0777, NULL);
+	SAFE_TOUCH(DIR_NORMAL "/" TEST_EFAULT, 0777, NULL);
+
+	SAFE_MKDIR(DIR_NORMAL "/" DIR_EISDIR, 0777);
+
+	memset(longfilename, '1', PATH_MAX + 1);
+
+	SAFE_TOUCH(DIR_NORMAL "/" DIR_ENOTDIR, 0777, NULL);
+
+	fd_immutable = SAFE_OPEN(DIR_NORMAL "/" TEST_EPERM_IMMUTABLE,
+			O_CREAT, 0777);
+	SAFE_IOCTL(fd_immutable, FS_IOC_GETFLAGS, &attr);
+	attr |= FS_IMMUTABLE_FL;
+	SAFE_IOCTL(fd_immutable, FS_IOC_SETFLAGS, &attr);
+	SAFE_CLOSE(fd_immutable);
+
+	fd_append_only = SAFE_OPEN(DIR_NORMAL "/" TEST_EPERM_APPEND_ONLY,
+			O_CREAT, 0777);
+	SAFE_IOCTL(fd_append_only, FS_IOC_GETFLAGS, &attr);
+	attr |= FS_APPEND_FL;
+	SAFE_IOCTL(fd_append_only, FS_IOC_SETFLAGS, &attr);
+	SAFE_CLOSE(fd_append_only);
+
+	SAFE_TOUCH(DIR_ENOTDIR2, 0777, NULL);
+}
+
+static void cleanup(void)
+{
+	int attr;
+
+	fd_immutable = SAFE_OPEN(DIR_NORMAL "/" TEST_EPERM_IMMUTABLE,
+			O_RDONLY, 0777);
+	SAFE_IOCTL(fd_immutable, FS_IOC_GETFLAGS, &attr);
+	attr &= ~FS_IMMUTABLE_FL;
+	SAFE_IOCTL(fd_immutable, FS_IOC_SETFLAGS, &attr);
+	SAFE_CLOSE(fd_immutable);
+
+	fd_append_only = SAFE_OPEN(DIR_NORMAL "/" TEST_EPERM_APPEND_ONLY,
+			O_RDONLY, 0777);
+	SAFE_IOCTL(fd_append_only, FS_IOC_GETFLAGS, &attr);
+	attr &= ~FS_APPEND_FL;
+	SAFE_IOCTL(fd_append_only, FS_IOC_SETFLAGS, &attr);
+	SAFE_CLOSE(fd_append_only);
+}
+
+static void do_unlinkat(struct test_case_t *tc)
+{
+	int attr;
+	char fullpath[PATH_MAX];
+	int dirfd = open(tc->dirname, O_DIRECTORY);
+
+	if (dirfd < 0) {
+		if (tc->expected_errno != EBADF) {
+			/* Special situation: dirfd refers to a file */
+			if (errno == ENOTDIR)
+				dirfd = SAFE_OPEN(tc->dirname, O_APPEND);
+			else {
+				tst_res(TFAIL | TERRNO, "Cannot open dirfd");
+				return;
+			}
+		}
+	}
+
+	TST_EXP_FAIL(unlinkat(dirfd, tc->filename, tc->flags),
+		tc->expected_errno,
+		"%s", tc->desc);
+
+	/* If unlinkat() succeeded unexpectedly, test file should be restored */
+	if (!TST_RET) {
+		snprintf(fullpath, sizeof(fullpath), "%s/%s", tc->dirname,
+			tc->filename);
+		if (tc->fd) {
+			*(tc->fd) = SAFE_OPEN(fullpath, O_CREAT, 0600);
+			if (tc->ioctl_flag) {
+				SAFE_IOCTL(*(tc->fd), FS_IOC_GETFLAGS, &attr);
+				attr |= tc->ioctl_flag;
+				SAFE_IOCTL(*(tc->fd), FS_IOC_SETFLAGS, &attr);
+			}
+			SAFE_CLOSE(*(tc->fd));
+		} else {
+			SAFE_TOUCH(fullpath, 0777, 0);
+		}
+	}
+
+	if (dirfd > 0)
+		SAFE_CLOSE(dirfd);
+}
+
+static void verify_unlinkat(unsigned int i)
+{
+	struct test_case_t *tc = &tcases[i];
+	pid_t pid;
+
+	if (tc->user) {
+		pid = SAFE_FORK();
+		if (!pid) {
+			SAFE_SETUID(pw->pw_uid);
+			do_unlinkat(tc);
+			exit(0);
+		}
+		SAFE_WAITPID(pid, NULL, 0);
+	} else {
+		do_unlinkat(tc);
+	}
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.cleanup = cleanup,
+	.test = verify_unlinkat,
+	.needs_rofs = 1,
+	.mntpoint = DIR_EROFS,
+	.needs_root = 1,
+	.forks_child = 1,
+};
-- 
2.39.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
