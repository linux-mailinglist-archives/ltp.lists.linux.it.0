Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF72B43EA
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 13:44:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F47B3C4F59
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 13:44:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4AA603C4F47
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 13:44:25 +0100 (CET)
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4FD9F1A0079A
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 13:44:24 +0100 (CET)
Received: from mail-notes.avm.de (mail-notes.avm.de [172.16.0.1])
 by mail.avm.de (Postfix) with ESMTP
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 13:43:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1605530633; bh=jnxegFTxvXg28djvWj+zFmP+fLaOQWHJbVihMqA1iGo=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=jGR8WCtVuovqwtjZU5stMQV/4cKCiRKnKUNXX9bQtWEeRLYzY4pLUMPSr81uL4O0/
 aiL9m+mUicDQMsmYD/pkyUv2gJP5HW9j6nhNqbxaExlAqBqaScJ7jS0g/2Unzk/78i
 CSh/CiuKEj9S49574OeC36/OwLw5g0KbbK/O8OWI=
MIME-Version: 1.0
X-Disclaimed: 1
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: 
References: 
To: ltp@lists.linux.it
Date: Mon, 16 Nov 2020 13:43:53 +0100
Message-ID: <OFFFCF0315.CB01D2B7-ONC125861F.003C7A03-C1258622.0045EF86@avm.de>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP1 July 20, 2020
X-MIMETrack: Serialize by http on ANIS1/AVM(Release 11.0.1FP1|July 20, 2020) at
 16.11.2020 13:43:53, Serialize complete at 16.11.2020 13:43:53,
 Serialize by Router on ANIS1/AVM(Release 11.0.1FP1|July 20, 2020) at
 16.11.2020 13:43:53
X-purgate-ID: 149429::1605530633-000005C2-1C8C32B7/0/0
X-purgate-type: clean
X-purgate-size: 11565
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/getdents: don't mix libc and kernel types
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
From: Johannes Nixdorf via ltp <ltp@lists.linux.it>
Reply-To: j.nixdorf@avm.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Before this commit the tests called libc's getdents(64) with the kernel
types struct linux_dirent(64) as arguments, mixing libc functions and
kernel types.

This breaks on musl libc, as it provides getdents and struct dirent as
an alias to getdents64 and struct dirent64.

To not lose coverage we now test both supported configurations: the
syscall with the kernel types and the libc wrappers with the libc types.

Signed-off-by: Johannes Nixdorf <j.nixdorf@avm.de>
---
 runtest/syscalls                              |  6 ++
 testcases/kernel/syscalls/getdents/getdents.h | 34 +++++---
 .../kernel/syscalls/getdents/getdents01.c     | 74 +++++++++++++----
 .../kernel/syscalls/getdents/getdents02.c     | 79 +++++++++++++------
 travis/alpine.sh                              |  2 -
 5 files changed, 143 insertions(+), 52 deletions(-)

diff --git a/runtest/syscalls b/runtest/syscalls
index 0443f9f3d..97aec0a37 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -413,6 +413,12 @@ getdents02 getdents02
 getdents01_64 getdents01 -l
 getdents02_64 getdents02 -l
 
+getdents01_libc getdents01 -c
+getdents02_libc getdents02 -c
+
+getdents01_libc_64 getdents01 -cl
+getdents02_libc_64 getdents02 -cl
+
 getdomainname01 getdomainname01
 
 getdtablesize01 getdtablesize01
diff --git a/testcases/kernel/syscalls/getdents/getdents.h b/testcases/kernel/syscalls/getdents/getdents.h
index a20b1811a..19e2cd23f 100644
--- a/testcases/kernel/syscalls/getdents/getdents.h
+++ b/testcases/kernel/syscalls/getdents/getdents.h
@@ -24,6 +24,11 @@
 #include "test.h"
 #include "lapi/syscalls.h"
 #include "config.h"
+
+#if HAVE_GETDENTS || HAVE_GETDENTS64
+#include <unistd.h>
+#endif
+
 /*
  * See fs/compat.c struct compat_linux_dirent
  */
@@ -34,16 +39,19 @@ struct linux_dirent {
 	char            d_name[];
 };
 
-#if HAVE_GETDENTS
-#include <unistd.h>
-#else
 static inline int
-getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int size)
+linux_getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int size)
 {
 	return ltp_syscall(__NR_getdents, fd, dirp, size);
 }
 
-#endif /* HAVE_GETDENTS */
+#if HAVE_GETDENTS
+#define libc_getdents(fd, dirp, size) getdents(fd, dirp, size)
+#define libc_dirent dirent
+#else
+#define libc_getdents(fd, dirp, size) (-1)
+#define libc_dirent linux_dirent
+#endif
 
 struct linux_dirent64 {
 	uint64_t	d_ino;
@@ -53,14 +61,18 @@ struct linux_dirent64 {
 	char		d_name[];
 };
 
-#if HAVE_GETDENTS64
-#include <dirent.h>
-#include <unistd.h>
-#else
 static inline int
-getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned int size)
+linux_getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned int size)
 {
 	return ltp_syscall(__NR_getdents64, fd, dirp64, size);
 }
-#endif /* HAVE_GETDENTS64 */
+
+#if HAVE_GETDENTS64
+#define libc_getdents64(fd, dirp, size) getdents64(fd, dirp, size)
+#define libc_dirent64 dirent64
+#else
+#define libc_getdents64(fd, dirp, size) (-1)
+#define libc_dirent64 linux_dirent64
+#endif
+
 #endif /* GETDENTS_H */
diff --git a/testcases/kernel/syscalls/getdents/getdents01.c b/testcases/kernel/syscalls/getdents/getdents01.c
index eca572d42..0dfc81150 100644
--- a/testcases/kernel/syscalls/getdents/getdents01.c
+++ b/testcases/kernel/syscalls/getdents/getdents01.c
@@ -41,10 +41,12 @@ char *TCID = "getdents01";
 int TST_TOTAL = 1;
 
 static int longsyscall;
+static int libccall;
 
 static option_t options[] = {
 		/* -l long option. Tests getdents64 */
 		{"l", &longsyscall, NULL},
+		{"c", &libccall, NULL},
 		{NULL, NULL, NULL}
 };
 
@@ -84,20 +86,34 @@ int main(int ac, char **av)
 {
 	int lc;
 	int rval, fd;
-	struct linux_dirent64 *dirp64;
-	struct linux_dirent *dirp;
+	struct linux_dirent64 *linux_dirp64;
+	struct linux_dirent *linux_dirp;
+	struct libc_dirent64 *libc_dirp64;
+	struct libc_dirent *libc_dirp;
 	void *buf;
 
 	tst_parse_opts(ac, av, options, &help);
 
+#if !HAVE_GETDENTS
+	if (libccall && !longsyscall)
+		tst_brkm(TCONF, NULL, "Unsupported libc function: getdents");
+#endif
+
+#if !HAVE_GETDENTS64
+	if (libccall && longsyscall)
+		tst_brkm(TCONF, NULL, "Unsupported libc function: getdents64");
+#endif
+
 	/* The buffer is allocated to make sure it's suitably aligned */
 	buf = malloc(BUFSIZE);
 
 	if (buf == NULL)
 		tst_brkm(TBROK, NULL, "malloc failed");
 
-	dirp64 = buf;
-	dirp = buf;
+	linux_dirp64 = buf;
+	linux_dirp = buf;
+	libc_dirp64 = buf;
+	libc_dirp = buf;
 
 	setup();
 
@@ -109,10 +125,17 @@ int main(int ac, char **av)
 		if ((fd = open(".", O_RDONLY)) == -1)
 			tst_brkm(TBROK, cleanup, "open of directory failed");
 
-		if (longsyscall)
-			rval = getdents64(fd, dirp64, BUFSIZE);
-		else
-			rval = getdents(fd, dirp, BUFSIZE);
+		if (libccall) {
+			if (longsyscall)
+				rval = libc_getdents64(fd, libc_dirp64, BUFSIZE);
+			else
+				rval = libc_getdents(fd, libc_dirp, BUFSIZE);
+		} else {
+			if (longsyscall)
+				rval = linux_getdents64(fd, linux_dirp64, BUFSIZE);
+			else
+				rval = linux_getdents(fd, linux_dirp, BUFSIZE);
+		}
 
 		if (rval < 0) {
 			if (errno == ENOSYS)
@@ -134,12 +157,22 @@ int main(int ac, char **av)
 		do {
 			size_t d_reclen;
 
-			if (longsyscall) {
-				d_reclen = dirp64->d_reclen;
-				d_name = dirp64->d_name;
+			if (libccall) {
+				if (longsyscall) {
+					d_reclen = libc_dirp64->d_reclen;
+					d_name = libc_dirp64->d_name;
+				} else {
+					d_reclen = libc_dirp->d_reclen;
+					d_name = libc_dirp->d_name;
+				}
 			} else {
-				d_reclen = dirp->d_reclen;
-				d_name = dirp->d_name;
+				if (longsyscall) {
+					d_reclen = linux_dirp64->d_reclen;
+					d_name = linux_dirp64->d_name;
+				} else {
+					d_reclen = linux_dirp->d_reclen;
+					d_name = linux_dirp->d_name;
+				}
 			}
 
 			set_flag(d_name);
@@ -148,10 +181,17 @@ int main(int ac, char **av)
 			
 			rval -= d_reclen;
 			
-			if (longsyscall)
-				dirp64 = (void*)dirp64 + d_reclen;
-			else
-				dirp = (void*)dirp + d_reclen;
+			if (libccall) {
+				if (longsyscall)
+					libc_dirp64 = (void *)libc_dirp64 + d_reclen;
+				else
+					libc_dirp = (void *)libc_dirp + d_reclen;
+			} else {
+				if (longsyscall)
+					linux_dirp64 = (void *)linux_dirp64 + d_reclen;
+				else
+					linux_dirp = (void *)linux_dirp + d_reclen;
+			}
 
 		} while (rval > 0);
 
diff --git a/testcases/kernel/syscalls/getdents/getdents02.c b/testcases/kernel/syscalls/getdents/getdents02.c
index 4cf54aea3..71ea6a362 100644
--- a/testcases/kernel/syscalls/getdents/getdents02.c
+++ b/testcases/kernel/syscalls/getdents/getdents02.c
@@ -65,16 +65,19 @@ static void (*testfunc[])(void) = { test_ebadf, test_einval,
 int TST_TOTAL = ARRAY_SIZE(testfunc);
 
 static int longsyscall;
+static int libccall;
 
 option_t options[] = {
 		/* -l long option. Tests getdents64 */
 		{"l", &longsyscall, NULL},
+		{"c", &libccall, NULL},
 		{NULL, NULL, NULL}
 };
 
 static void help(void)
 {
 	printf("  -l      Test the getdents64 system call\n");
+	printf("  -c      Test the libc wrappers around the getdents(64) system call\n");
 }
 
 int main(int ac, char **av)
@@ -83,6 +86,16 @@ int main(int ac, char **av)
 
 	tst_parse_opts(ac, av, options, &help);
 
+#if !HAVE_GETDENTS
+	if (libccall && !longsyscall)
+		tst_brkm(TCONF, NULL, "Unsupported libc function: getdents");
+#endif
+
+#if !HAVE_GETDENTS64
+	if (libccall && longsyscall)
+		tst_brkm(TCONF, NULL, "Unsupported libc function: getdents64");
+#endif
+
 	setup();
 
 	for (lc = 0; TEST_LOOPING(lc); lc++) {
@@ -120,16 +133,51 @@ static void print_test_result(int err, int exp_errno)
 	}
 }
 
+static int test_getdents(int fd, void *dirp, size_t len, int stack)
+{
+	struct linux_dirent64 linux_dirp64;
+	struct linux_dirent linux_dirp;
+	struct libc_dirent64 libc_dirp64;
+	struct libc_dirent libc_dirp;
+
+	if (stack) {
+		if (libccall) {
+			if (longsyscall) {
+				dirp = &libc_dirp64;
+				len = sizeof(libc_dirp64);
+			} else {
+				dirp = &libc_dirp;
+				len = sizeof(libc_dirp);
+			}
+		} else {
+			if (longsyscall) {
+				dirp = &linux_dirp64;
+				len = sizeof(linux_dirp64);
+			} else {
+				dirp = &linux_dirp;
+				len = sizeof(linux_dirp);
+			}
+		}
+	}
+
+	if (libccall) {
+		if (longsyscall)
+			return libc_getdents64(fd, dirp, len);
+		else
+			return libc_getdents(fd, dirp, len);
+	} else {
+		if (longsyscall)
+			return linux_getdents64(fd, dirp, len);
+		else
+			return linux_getdents(fd, dirp, len);
+	}
+}
+
 static void test_ebadf(void)
 {
 	int fd = -5;
-	struct linux_dirent64 dirp64;
-	struct linux_dirent dirp;
 
-	if (longsyscall)
-		getdents64(fd, &dirp64, sizeof(dirp64));
-	else
-		getdents(fd, &dirp, sizeof(dirp));
+	test_getdents(fd, NULL, 0, 1);
 
 	print_test_result(errno, EBADF);
 }
@@ -142,10 +190,7 @@ static void test_einval(void)
 	fd = SAFE_OPEN(cleanup, ".", O_RDONLY);
 
 	/* Pass one byte long buffer. The result should be EINVAL */
-	if (longsyscall)
-		getdents64(fd, (void *)buf, sizeof(buf));
-	else
-		getdents(fd, (void *)buf, sizeof(buf));
+	test_getdents(fd, (void *)buf, sizeof(buf), 0);
 
 	print_test_result(errno, EINVAL);
 
@@ -155,15 +200,10 @@ static void test_einval(void)
 static void test_enotdir(void)
 {
 	int fd;
-	struct linux_dirent64 dir64;
-	struct linux_dirent dir;
 
 	fd = SAFE_OPEN(cleanup, "test", O_CREAT | O_RDWR, 0644);
 
-	if (longsyscall)
-		getdents64(fd, &dir64, sizeof(dir64));
-	else
-		getdents(fd, &dir, sizeof(dir));
+	test_getdents(fd, NULL, 0, 1);
 
 	print_test_result(errno, ENOTDIR);
 
@@ -173,18 +213,13 @@ static void test_enotdir(void)
 static void test_enoent(void)
 {
 	int fd;
-	struct linux_dirent64 dir64;
-	struct linux_dirent dir;
 
 	SAFE_MKDIR(cleanup, TEST_DIR, DIR_MODE);
 
 	fd = SAFE_OPEN(cleanup, TEST_DIR, O_DIRECTORY);
 	SAFE_RMDIR(cleanup, TEST_DIR);
 
-	if (longsyscall)
-		getdents64(fd, &dir64, sizeof(dir64));
-	else
-		getdents(fd, &dir, sizeof(dir));
+	test_getdents(fd, NULL, 0, 1);
 
 	print_test_result(errno, ENOENT);
 
diff --git a/travis/alpine.sh b/travis/alpine.sh
index 61ef144a8..ffd5a8ebc 100755
--- a/travis/alpine.sh
+++ b/travis/alpine.sh
@@ -33,8 +33,6 @@ rm -rfv \
 	testcases/kernel/syscalls/confstr/confstr01.c \
 	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
 	testcases/kernel/syscalls/getcontext/getcontext01.c \
-	testcases/kernel/syscalls/getdents/getdents01.c \
-	testcases/kernel/syscalls/getdents/getdents02.c \
 	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
 	testcases/kernel/syscalls/timer_create/timer_create01.c \
 	testcases/kernel/syscalls/timer_create/timer_create03.c \
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
