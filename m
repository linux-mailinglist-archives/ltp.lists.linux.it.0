Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CDE5EAFC8
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Sep 2022 20:26:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED3923CADF8
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Sep 2022 20:26:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E872F3CADE6
 for <ltp@lists.linux.it>; Mon, 26 Sep 2022 20:26:42 +0200 (CEST)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5FB39600693
 for <ltp@lists.linux.it>; Mon, 26 Sep 2022 20:26:41 +0200 (CEST)
Received: by mail-pj1-x1049.google.com with SMTP id
 g15-20020a17090a708f00b00203a68c9acaso3366092pjk.8
 for <ltp@lists.linux.it>; Mon, 26 Sep 2022 11:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date;
 bh=vSQcjeFyeDnowuIiYw5DNRoFYGg20ViWaFFm3vMrlq0=;
 b=UiWxJIdt8yAOIxD3Qme4Xu2xcyzFR/PfdyfmdWVLoXLiNKvliIsimCT1Q3+lL13XYf
 1vVSrjDAhnM1XmTB0/4vmBvKlgKoaZo6A+NUrygob0AP4nEnqKWS2HCjBfyPQJ3kaoWr
 VKDEKFhpJ7xtbBXQV5gboOWhLHxJww6IcCUs7oGT9eiSxveGUv1AXx5o8LpwKfRoeX7L
 pnjcoLSlOWb/1vRQGcdis2Jr15PcZsoGSMRaURNaVfSZMajnLF75jkUCY2xTdbCPTii/
 9cGCPAR+65EjlUamIlxCxCmM91VXIgrjFlo98YITK0g8qyjDRKpEEbXwxVu64aRxvIgw
 DXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=vSQcjeFyeDnowuIiYw5DNRoFYGg20ViWaFFm3vMrlq0=;
 b=pRdJKeu0WsoovQvKGIKM7S/FiQUngNUdt/COTe59XgeavUe7IJsr6EZfuaT9yB8HCE
 HVRK/bvc9FNtX/ExGxA4H6Ga3Pi7KKN1GsfBVaMErxfQTWJIbNz0vGpM7wpLThpnl3uL
 sPk9M/5bvPRgfB0p05Y4ofJjYvv30McDNqsjmApVwhEIZ4i9zgK5RUFiEwjhNJrpVip1
 dmw/uAYxTbtonxBehYHleKtnvuRwoEojYWBJbQ9K905VOomxZyt0oSZYETlhfc5iGdmN
 2hFD0DiwKhRQdaNKJ3ZlCZkmxX0mU1IYnR6NXpYJPyShJrnT/esvzvSvtdAoBlBQ4Y4m
 tgkA==
X-Gm-Message-State: ACrzQf1Fz4OjkMqZtAJ2VZXoozPJ0Bu31FhpIsotM7w0bn3JFbZ7MHvH
 GWkgbVuH1v0Rrt2BlFoHF+bvWKKDhxDNt6VrfVjzqUYO/R/R++J6HvLdn0ZLp34IFPimwiUQFRy
 gM1VW+CJG2pCUIUWAidCsAb1xR4ecNpBhBHgIvMo8CtKUTuWpzj/GtN27
X-Google-Smtp-Source: AMsMyM45AUUNMsoFXFcug/OFmnRvCGMh+adl82FB0U17hd0qF/Rrsystwu+h2OgTvU0b2JCCPkndnU377Ro=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:234a:b0:542:f9f2:72e5 with SMTP id
 j10-20020a056a00234a00b00542f9f272e5mr24811556pfj.34.1664216799705; Mon, 26
 Sep 2022 11:26:39 -0700 (PDT)
Date: Mon, 26 Sep 2022 18:26:22 +0000
In-Reply-To: <20220926182625.103275-1-edliaw@google.com>
Mime-Version: 1.0
References: <20220926182625.103275-1-edliaw@google.com>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220926182625.103275-2-edliaw@google.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/4] mmapstress01: refactor to tst_test framework
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 .../kernel/mem/mmapstress/mmapstress01.c      | 461 +++++++-----------
 1 file changed, 175 insertions(+), 286 deletions(-)

diff --git a/testcases/kernel/mem/mmapstress/mmapstress01.c b/testcases/kernel/mem/mmapstress/mmapstress01.c
index f425c223d..23e4f5bc8 100644
--- a/testcases/kernel/mem/mmapstress/mmapstress01.c
+++ b/testcases/kernel/mem/mmapstress/mmapstress01.c
@@ -20,32 +20,6 @@
  *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */
 
-#define _GNU_SOURCE 1
-#include <stdio.h>
-#include <fcntl.h>
-#include <signal.h>
-#include <sys/mman.h>
-#include <sys/wait.h>
-#include <sys/stat.h>
-#include <unistd.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <sys/types.h>
-#include <limits.h>
-/*****  LTP Port        *****/
-#include "test.h"
-#define FAILED 0
-#define PASSED 1
-
-int local_flag = PASSED;
-char *TCID = "mmapstress01";	//tmnoextend
-FILE *temp;
-int TST_TOTAL = 1;
-
-int anyfail();
-void ok_exit();
-/*****  **      **      *****/
-
 /*
  *  This test stresses mmaps, without dealing with fragments or anything!
  *  It forks a specified number of children,
@@ -77,8 +51,8 @@ void ok_exit();
  *			  filesize.  Useful for testing large files.
  *			  (default is 0).
  *	-r		- randomize number of pages map children check.
- *			  (random % MAXLOOPS).  If not specified, each
- *			  child checks MAXLOOPS pages.
+ *			  (random % MAXLOOPS).  0 will run forever until SIGINT
+ *			  is received.
  *	-o		- randomize offset of file to map. (default is 0)
  *	-m		- do random msync/fsyncs as well
  *	-l		- if set, the output file is not removed on
@@ -88,8 +62,24 @@ void ok_exit();
  *  Compile with -DLARGE_FILE to enable file sizes > 2 GB.
  */
 
+#define _GNU_SOURCE 1
+#include <stdio.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <sys/mman.h>
+#include <sys/wait.h>
+#include <sys/stat.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <sys/types.h>
+#include <limits.h>
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+
 #define MAXLOOPS	500	/* max pages for map children to write */
 #define	FILESIZE	4096	/* initial filesize set up by parent */
+#define TEST_FILE	"mmapstress01.out"
 
 #ifdef roundup
 #undef roundup
@@ -100,36 +90,42 @@ extern time_t time(time_t *);
 extern char *ctime(const time_t *);
 extern void *malloc(size_t);
 extern long lrand48(void);
-extern void srand(unsigned);
+extern void srand(unsigned int);
 extern void srand48(long);
 extern int rand(void);
 extern int atoi(const char *);
 
-char *usage =
+static char *usage =
     "-p nprocs [-t minutes -f filesize -S sparseoffset -r -o -m -l -d]";
 
-typedef unsigned char uchar_t;
-#define SIZE_MAX UINT_MAX
+static unsigned int initrand(void);
+static void finish(int sig);
+static void child_mapper(char *file, unsigned int procno, unsigned int nprocs);
+static int fileokay(char *file, unsigned char *expbuf);
+static int finished = 0;
+static int leavefile = 0;
+
+static float alarmtime = 0;
+static unsigned int nprocs = 0;
 
-unsigned int initrand(void);
-void finish(int sig);
-void child_mapper(char *file, unsigned procno, unsigned nprocs);
-int fileokay(char *file, uchar_t * expbuf);
-int finished = 0;
-int leavefile = 0;
+static pid_t *pidarray = NULL;
+static int wait_stat;
+static int check_for_sanity;
+static unsigned char *buf = NULL;
 
-int debug = 0;
+
+static int debug = 0;
 #ifdef LARGE_FILE
-off64_t filesize = FILESIZE;
-off64_t sparseoffset = 0;
+static off64_t filesize = FILESIZE;
+static off64_t sparseoffset = 0;
 #else /* LARGE_FILE */
-off_t filesize = FILESIZE;
-off_t sparseoffset = 0;
+static off_t filesize = FILESIZE;
+static off_t sparseoffset = 0;
 #endif /* LARGE_FILE */
-unsigned randloops = 0;
-unsigned dosync = 0;
-unsigned do_offset = 0;
-unsigned pattern = 0;
+static unsigned int randloops = 0;
+static unsigned int dosync = 0;
+static unsigned int do_offset = 0;
+static unsigned int pattern = 0;
 
 int main(int argc, char *argv[])
 {
@@ -137,32 +133,23 @@ int main(int argc, char *argv[])
 	int fd;
 	int c;
 	extern char *optarg;
-	unsigned nprocs = 0;
-	unsigned procno;
-	pid_t *pidarray = NULL;
+	unsigned int procno;
 	pid_t pid;
-	uchar_t *buf = NULL;
 	unsigned int seed;
 	int pagesize = sysconf(_SC_PAGE_SIZE);
-	float alarmtime = 0;
 	struct sigaction sa;
-	unsigned i;
+	unsigned int i;
 	int write_cnt;
-	uchar_t data;
-	int no_prob = 0;
-	int wait_stat;
-	time_t t;
+	unsigned char data;
 #ifdef LARGE_FILE
 	off64_t bytes_left;
 #else /* LARGE_FILE */
 	off_t bytes_left;
 #endif /* LARGE_FILE */
-	const char *filename = "mmapstress01.out";
 
 	progname = *argv;
-	tst_tmpdir();
 	if (argc < 2) {
-		tst_brkm(TBROK, NULL, "usage: %s %s", progname, usage);
+		tst_brk(TBROK, "usage: %s %s", progname, usage);
 	}
 
 	while ((c = getopt(argc, argv, "S:omdlrf:p:t:")) != -1) {
@@ -185,11 +172,8 @@ int main(int argc, char *argv[])
 #else /* LARGE_FILE */
 			filesize = atoi(optarg);
 #endif /* LARGE_FILE */
-			if (filesize < 0) {
-				(void)fprintf(stderr, "error: negative "
-					      "filesize\n");
-				anyfail();
-			}
+			if (filesize < 0)
+				tst_brk(TBROK, "error: negative filesize");
 			break;
 		case 'r':
 			randloops = 1;
@@ -206,46 +190,38 @@ int main(int argc, char *argv[])
 #else /* LARGE_FILE */
 			sparseoffset = atoi(optarg);
 #endif /* LARGE_FILE */
-			if (sparseoffset % pagesize != 0) {
-				fprintf(stderr,
-					"sparseoffset must be pagesize multiple\n");
-				anyfail();
-			}
+			if (sparseoffset % pagesize != 0)
+				tst_brk(TBROK, "sparseoffset must be pagesize multiple");
 			break;
 		default:
-			(void)fprintf(stderr, "usage: %s %s\n", progname,
-				      usage);
-			tst_exit();
+			tst_brk(TBROK, "usage: %s %s", progname, usage);
 		}
 	}
 
 	/* nprocs is >= 0 since it's unsigned */
-	if (nprocs > 255) {
-		(void)fprintf(stderr, "invalid nprocs %d - (range 0-255)\n",
-			      nprocs);
-		anyfail();
-	}
-
-	(void)time(&t);
+	if (nprocs > 255)
+		tst_brk(TBROK, "invalid nprocs %d - (range 0-255)", nprocs);
 
 	seed = initrand();
 	pattern = seed & 0xff;
 
 	if (debug) {
 #ifdef LARGE_FILE
-		(void)printf("creating file <%s> with %Ld bytes, pattern %d\n",
-			     filename, filesize, pattern);
+		tst_res(TINFO, "creating file <%s> with %Ld bytes, pattern %d",
+			     TEST_FILE, filesize, pattern);
 #else /* LARGE_FILE */
-		(void)printf("creating file <%s> with %ld bytes, pattern %d\n",
-			     filename, filesize, pattern);
+		tst_res(TINFO, "creating file <%s> with %ld bytes, pattern %d",
+			     TEST_FILE, filesize, pattern);
 #endif /* LARGE_FILE */
 		if (alarmtime)
-			(void)printf("running for %f minutes\n",
+			tst_res(TINFO, "running for %f minutes",
 				     alarmtime / 60);
 		else
-			(void)printf("running with no time limit\n");
+			tst_res(TINFO, "running with no time limit");
 	}
 
+	tst_reinit();
+
 	/*
 	 *  Plan for death by signal.  User may have specified
 	 *  a time limit, in which set an alarm and catch SIGALRM.
@@ -253,44 +229,32 @@ int main(int argc, char *argv[])
 	 */
 	sa.sa_handler = finish;
 	sa.sa_flags = 0;
-	if (sigemptyset(&sa.sa_mask)) {
-		perror("sigemptyset error");
-		goto cleanup;
-	}
+	if (sigemptyset(&sa.sa_mask))
+		tst_brk(TFAIL, "sigemptyset error");
 
-	if (sigaction(SIGINT, &sa, 0) == -1) {
-		perror("sigaction error SIGINT");
-		goto cleanup;
-	}
-	if (sigaction(SIGQUIT, &sa, 0) == -1) {
-		perror("sigaction error SIGQUIT");
-		goto cleanup;
-	}
-	if (sigaction(SIGTERM, &sa, 0) == -1) {
-		perror("sigaction error SIGTERM");
-		goto cleanup;
-	}
+	if (sigaction(SIGINT, &sa, 0) == -1)
+		tst_brk(TFAIL, "sigaction error SIGINT");
+	if (sigaction(SIGQUIT, &sa, 0) == -1)
+		tst_brk(TFAIL, "sigaction error SIGQUIT");
+	if (sigaction(SIGTERM, &sa, 0) == -1)
+		tst_brk(TFAIL, "sigaction error SIGTERM");
 
 	if (alarmtime) {
-		if (sigaction(SIGALRM, &sa, 0) == -1) {
-			perror("sigaction error");
-			goto cleanup;
-		}
+		if (sigaction(SIGALRM, &sa, 0) == -1)
+			tst_brk(TFAIL, "sigaction error");
 		(void)alarm(alarmtime);
 	}
 #ifdef LARGE_FILE
-	if ((fd = open64(filename, O_CREAT | O_TRUNC | O_RDWR, 0664)) == -1) {
+	if ((fd = open64(TEST_FILE, O_CREAT | O_TRUNC | O_RDWR, 0664)) == -1) {
 #else /* LARGE_FILE */
-	if ((fd = open(filename, O_CREAT | O_TRUNC | O_RDWR, 0664)) == -1) {
+	if ((fd = open(TEST_FILE, O_CREAT | O_TRUNC | O_RDWR, 0664)) == -1) {
 #endif /* LARGE_FILE */
-		perror("open error");
-		anyfail();
+		tst_brk(TFAIL, "open error");
 	}
 
 	if ((buf = malloc(pagesize)) == NULL
 	    || (pidarray = malloc(nprocs * sizeof(pid_t))) == NULL) {
-		perror("malloc error");
-		anyfail();
+		tst_brk(TFAIL, "malloc error");
 	}
 
 	for (i = 0; i < nprocs; i++)
@@ -302,25 +266,24 @@ int main(int argc, char *argv[])
 			data = 0;
 	}
 #ifdef LARGE_FILE
-	if (lseek64(fd, sparseoffset, SEEK_SET) < 0) {
+	if (lseek64(fd, (off64_t)sparseoffset, SEEK_SET) < 0) {
 #else /* LARGE_FILE */
-	if (lseek(fd, sparseoffset, SEEK_SET) < 0) {
+	if (lseek(fd, (off_t)sparseoffset, SEEK_SET) < 0) {
 #endif /* LARGE_FILE */
-		perror("lseek");
-		anyfail();
+		tst_brk(TFAIL, "lseek");
 	}
 	for (bytes_left = filesize; bytes_left; bytes_left -= c) {
 		write_cnt = MIN(pagesize, (int)bytes_left);
 		if ((c = write(fd, buf, write_cnt)) != write_cnt) {
 			if (c == -1) {
-				perror("write error");
+				tst_res(TFAIL, "write error");
 			} else {
-				(void)fprintf(stderr, "write: wrote %d of %d "
-					      "bytes\n", c, write_cnt);
+				tst_res(TINFO, "write: wrote %d of %d "
+					      "bytes", c, write_cnt);
 			}
 			(void)close(fd);
-			(void)unlink(filename);
-			anyfail();
+			(void)unlink(TEST_FILE);
+			tst_brk(TFAIL, "write error");
 		}
 	}
 
@@ -333,11 +296,11 @@ int main(int argc, char *argv[])
 		switch (pid = fork()) {
 
 		case -1:
-			perror("fork error");
-			goto cleanup;
+			tst_brk(TFAIL, "fork error");
+			break;
 
 		case 0:
-			child_mapper(filename, procno, nprocs);
+			child_mapper(TEST_FILE, procno, nprocs);
 			exit(0);
 
 		default:
@@ -355,37 +318,27 @@ int main(int argc, char *argv[])
 		 *  Block signals while processing child exit.
 		 */
 
-		if (sighold(SIGALRM) || sighold(SIGINT)) {
-			perror("sighold error");
-			goto cleanup;
-		}
+		if (sighold(SIGALRM) || sighold(SIGINT))
+			tst_brk(TFAIL, "sighold error");
 
 		if (pid != -1) {
 			/*
 			 *  Check exit status, then refork with the
 			 *  appropriate procno.
 			 */
-			if (!WIFEXITED(wait_stat)
-			    || WEXITSTATUS(wait_stat) != 0) {
-				(void)fprintf(stderr, "child exit with err "
-					      "<x%x>\n", wait_stat);
-				goto cleanup;
-			}
+			if (!WIFEXITED(wait_stat) || WEXITSTATUS(wait_stat) != 0)
+				tst_brk(TFAIL, "child exit with err <x%x>", wait_stat);
 			for (i = 0; i < nprocs; i++)
 				if (pid == pidarray[i])
 					break;
-			if (i == nprocs) {
-				(void)fprintf(stderr, "unknown child pid %d, "
-					      "<x%x>\n", pid, wait_stat);
-				goto cleanup;
-			}
+			if (i == nprocs)
+				tst_brk(TFAIL, "unknown child pid %d, <x%x>", pid, wait_stat);
 
 			if ((pid = fork()) == -1) {
-				perror("fork error");
 				pidarray[i] = 0;
-				goto cleanup;
+				tst_brk(TFAIL, "fork error");
 			} else if (pid == 0) {	/* child */
-				child_mapper(filename, i, nprocs);
+				child_mapper(TEST_FILE, i, nprocs);
 				exit(0);
 			} else
 				pidarray[i] = pid;
@@ -395,15 +348,11 @@ int main(int argc, char *argv[])
 			 *  normal finish, else it's an unexpected
 			 *  error...
 			 */
-			if (errno != EINTR || !finished) {
-				perror("unexpected wait error");
-				goto cleanup;
-			}
-		}
-		if (sigrelse(SIGALRM) || sigrelse(SIGINT)) {
-			perror("sigrelse error");
-			goto cleanup;
+			if (errno != EINTR || !finished)
+				tst_brk(TFAIL, "unexpected wait error");
 		}
+		if (sigrelse(SIGALRM) || sigrelse(SIGINT))
+			tst_brk(TFAIL, "sigrelse error");
 	}
 
 	/*
@@ -411,40 +360,33 @@ int main(int argc, char *argv[])
 	 *  the children and done!.
 	 */
 
-	if (sighold(SIGALRM)) {
-		perror("sighold error");
-		goto cleanup;
-	}
+	if (sighold(SIGALRM))
+		tst_brk(TFAIL, "sighold error");
 	(void)alarm(0);
-	no_prob = 1;
+	check_for_sanity = 1;
+	tst_res(TPASS, "finished, cleaning up");
+}
 
-cleanup:
-	for (i = 0; i < nprocs; i++)
+static void cleanup(void)
+{
+	for (int i = 0; i < nprocs; i++)
 		(void)kill(pidarray[i], SIGKILL);
 
 	while (wait(&wait_stat) != -1 || errno != ECHILD)
 		continue;
 
-	if (no_prob) {		/* only check file if no errors */
-		if (!fileokay(filename, buf)) {
-			(void)fprintf(stderr, "file data incorrect!\n");
-			(void)printf("  leaving file <%s>\n", filename);
-			/***** LTP Port *****/
-			local_flag = FAILED;
-			anyfail();
-			/*****	**	*****/
+	if (check_for_sanity) {		/* only check file if no errors */
+		if (!fileokay(TEST_FILE, buf)) {
+			tst_res(TINFO, "  leaving file <%s>", TEST_FILE);
+			tst_brk(TFAIL, "file data incorrect");
 		} else {
-			(void)printf("file data okay\n");
+			tst_res(TINFO, "file data okay");
 			if (!leavefile)
-				(void)unlink(filename);
+				(void)unlink(TEST_FILE);
+			tst_res(TPASS, "test passed");
 		}
 	} else
-		(void)printf("  leaving file <%s>\n", filename);
-
-	(void)time(&t);
-	//(void)printf("%s: Finished %s", argv[0], ctime(&t)); LTP Port
-	ok_exit();
-	tst_exit();
+		tst_res(TINFO, "  leaving file <%s>", TEST_FILE);
 }
 
 /*
@@ -454,7 +396,7 @@ cleanup:
  *  determined based on nprocs & procno).  After a specific number of
  *  iterations, it exits.
  */
-void child_mapper(char *file, unsigned procno, unsigned nprocs)
+void child_mapper(char *file, unsigned int procno, unsigned int nprocs)
 {
 #ifdef LARGE_FILE
 	struct stat64 statbuf;
@@ -470,38 +412,32 @@ void child_mapper(char *file, unsigned procno, unsigned nprocs)
 	char *maddr = NULL, *paddr;
 	int fd;
 	size_t pagesize = sysconf(_SC_PAGE_SIZE);
-	unsigned randpage;
+	unsigned int randpage;
 	unsigned int seed;
-	unsigned loopcnt;
-	unsigned nloops;
-	unsigned mappages;
-	unsigned i;
+	unsigned int loopcnt;
+	unsigned int nloops;
+	unsigned int mappages;
+	unsigned int i;
 
 	seed = initrand();	/* initialize random seed */
 
 #ifdef LARGE_FILE
-	if (stat64(file, &statbuf) == -1) {
+	if (stat64(file, &statbuf) == -1)
 #else /* LARGE_FILE */
-	if (stat(file, &statbuf) == -1) {
+	if (stat(file, &statbuf) == -1)
 #endif /* LARGE_FILE */
-		perror("stat error");
-		anyfail();
-	}
+		tst_brk(TFAIL, "stat error");
 	filesize = statbuf.st_size;
 
 #ifdef LARGE_FILE
-	if ((fd = open64(file, O_RDWR)) == -1) {
+	if ((fd = open64(file, O_RDWR)) == -1)
 #else /* LARGE_FILE */
-	if ((fd = open(file, O_RDWR)) == -1) {
+	if ((fd = open(file, O_RDWR)) == -1)
 #endif /* LARGE_FILE */
-		perror("open error");
-		anyfail();
-	}
+		tst_brk(TFAIL, "open error");
 
-	if (statbuf.st_size - sparseoffset > SIZE_MAX) {
-		fprintf(stderr, "size_t overflow when setting up map\n");
-		anyfail();
-	}
+	if (statbuf.st_size - sparseoffset > UINT_MAX)
+		tst_brk(TFAIL, "size_t overflow when setting up map");
 	mapsize = (size_t) (statbuf.st_size - sparseoffset);
 	mappages = roundup(mapsize, pagesize) / pagesize;
 	offset = sparseoffset;
@@ -514,29 +450,19 @@ void child_mapper(char *file, unsigned procno, unsigned nprocs)
 	}
 	nloops = (randloops) ? (lrand48() % MAXLOOPS) : MAXLOOPS;
 
-	if (debug) {
-#ifdef LARGE_FILE
-		(void)printf("child %d (pid %ld): seed %d, fsize %Ld, "
-			     "mapsize %d, off %Ld, loop %d\n",
-			     procno, getpid(), seed, filesize, mapsize,
-			     offset / pagesize, nloops);
-#else /* LARGE_FILE */
-		(void)printf("child %d (pid %d): seed %d, fsize %ld, "
-			     "mapsize %ld, off %ld, loop %d\n",
+	if (debug)
+		tst_res(TINFO, "child %d (pid %d): seed %d, fsize %lld, "
+			     "mapsize %ld, off %lld, loop %d",
 			     procno, getpid(), seed, filesize, (long)mapsize,
 			     offset / pagesize, nloops);
-#endif /* LARGE_FILE */
-	}
 #ifdef LARGE_FILE
 	if ((maddr = mmap64(0, mapsize, PROT_READ | PROT_WRITE, MAP_SHARED,
-			    fd, offset)) == (caddr_t) - 1) {
+			    fd, (off64_t)offset)) == (caddr_t) - 1)
 #else /* LARGE_FILE */
 	if ((maddr = mmap(0, mapsize, PROT_READ | PROT_WRITE, MAP_SHARED,
-			  fd, offset)) == (caddr_t) - 1) {
+			  fd, (off_t)offset)) == (caddr_t) - 1)
 #endif /* LARGE_FILE */
-		perror("mmap error");
-		anyfail();
-	}
+		tst_brk(TFAIL, "mmap error");
 
 	(void)close(fd);
 
@@ -554,15 +480,11 @@ void child_mapper(char *file, unsigned procno, unsigned nprocs)
 
 		for (i = procno; i < validsize; i += nprocs) {
 			if (*((unsigned char *)(paddr + i))
-			    != ((procno + pattern) & 0xff)) {
-				(void)fprintf(stderr, "child %d: invalid data "
-					      "<x%x>", procno,
-					      *((unsigned char *)(paddr + i)));
-				(void)fprintf(stderr, " at pg %d off %d, exp "
-					      "<x%x>\n", randpage, i,
+			    != ((procno + pattern) & 0xff))
+				tst_brk(TFAIL, "child %d: invalid data <x%x>\n"
+								" at pg %d off %d, exp <x%x>", procno,
+					      *((unsigned char *)(paddr + i)), randpage, i,
 					      (procno + pattern) & 0xff);
-				anyfail();
-			}
 
 			/*
 			 *  Now write it.
@@ -577,22 +499,18 @@ void child_mapper(char *file, unsigned procno, unsigned nprocs)
 		randpage = lrand48() % mappages;
 		paddr = maddr + (randpage * pagesize);	/* page address */
 		if (msync(paddr, (mappages - randpage) * pagesize,
-			  MS_SYNC) == -1) {
-			anyfail();
-		}
-	}
-	if (munmap(maddr, mapsize) == -1) {
-		perror("munmap failed");
-		local_flag = FAILED;
-		anyfail();
+			  MS_SYNC) == -1)
+			tst_brk(TFAIL, "msync failed");
 	}
+	if (munmap(maddr, mapsize) == -1)
+		tst_brk(TFAIL, "munmap failed");
 	exit(0);
 }
 
 /*
  *  Make sure file has all the correct data.
  */
-int fileokay(char *file, uchar_t * expbuf)
+int fileokay(char *file, unsigned char *expbuf)
 {
 #ifdef LARGE_FILE
 	struct stat64 statbuf;
@@ -600,50 +518,36 @@ int fileokay(char *file, uchar_t * expbuf)
 	struct stat statbuf;
 #endif /* LARGE_FILE */
 	size_t mapsize;
-	unsigned mappages;
-	unsigned pagesize = sysconf(_SC_PAGE_SIZE);
-	uchar_t readbuf[pagesize];
+	unsigned int mappages;
+	unsigned int pagesize = sysconf(_SC_PAGE_SIZE);
+	unsigned char readbuf[pagesize];
 	int fd;
 	int cnt;
-	unsigned i, j;
+	unsigned int i, j;
 
 #ifdef LARGE_FILE
-	if ((fd = open64(file, O_RDONLY)) == -1) {
+	if ((fd = open64(file, O_RDONLY)) == -1)
 #else /* LARGE_FILE */
-	if ((fd = open(file, O_RDONLY)) == -1) {
+	if ((fd = open(file, O_RDONLY)) == -1)
 #endif /* LARGE_FILE */
-		perror("open error");
-		/***** LTP Port *****/
-		local_flag = FAILED;
-		anyfail();
-		/*****	**	*****/
-		return 0;
-	}
+		tst_brk(TFAIL, "open error");
+
 #ifdef LARGE_FILE
-	if (fstat64(fd, &statbuf) == -1) {
+	if (fstat64(fd, &statbuf) == -1)
 #else /* LARGE_FILE */
-	if (fstat(fd, &statbuf) == -1) {
+	if (fstat(fd, &statbuf) == -1)
 #endif /* LARGE_FILE */
-		perror("stat error");
-		/***** LTP Port *****/
-		local_flag = FAILED;
-		anyfail();
-		/*****	**	*****/
-		return 0;
-	}
+		tst_brk(TFAIL, "stat error");
+
 #ifdef LARGE_FILE
-	if (lseek64(fd, sparseoffset, SEEK_SET) < 0) {
+	if (lseek64(fd, sparseoffset, SEEK_SET) < 0)
 #else /* LARGE_FILE */
-	if (lseek(fd, sparseoffset, SEEK_SET) < 0) {
+	if (lseek(fd, sparseoffset, SEEK_SET) < 0)
 #endif /* LARGE_FILE */
-		perror("lseek");
-		anyfail();
-	}
+		tst_brk(TFAIL, "lseek");
 
-	if (statbuf.st_size - sparseoffset > SIZE_MAX) {
-		fprintf(stderr, "size_t overflow when setting up map\n");
-		anyfail();
-	}
+	if (statbuf.st_size - sparseoffset > UINT_MAX)
+		tst_brk(TFAIL, "size_t overflow when setting up map");
 	mapsize = (size_t) (statbuf.st_size - sparseoffset);
 
 	mappages = roundup(mapsize, pagesize) / pagesize;
@@ -651,18 +555,13 @@ int fileokay(char *file, uchar_t * expbuf)
 	for (i = 0; i < mappages; i++) {
 		cnt = read(fd, readbuf, pagesize);
 		if (cnt == -1) {
-			perror("read error");
-			/***** LTP Port *****/
-			local_flag = FAILED;
-			anyfail();
-			/*****	**	*****/
-			return 0;
-		} else if (cnt != pagesize) {
+			tst_brk(TFAIL, "read error");
+		} else if ((unsigned int)cnt != pagesize) {
 			/*
 			 *  Okay if at last page in file...
 			 */
 			if ((i * pagesize) + cnt != mapsize) {
-				(void)fprintf(stderr, "read %d of %ld bytes\n",
+				tst_res(TINFO, "read %d of %ld bytes",
 					      (i * pagesize) + cnt,
 					      (long)mapsize);
 				close(fd);
@@ -672,18 +571,18 @@ int fileokay(char *file, uchar_t * expbuf)
 		/*
 		 *  Compare read bytes of data.
 		 */
-		for (j = 0; j < cnt; j++) {
+		for (j = 0; j < (unsigned int)cnt; j++) {
 			if (expbuf[j] != readbuf[j]) {
-				(void)fprintf(stderr,
+				tst_res(TINFO,
 					      "read bad data: exp %c got %c)",
 					      expbuf[j], readbuf[j]);
 #ifdef LARGE_FILE
-				(void)fprintf(stderr, ", pg %d off %d, "
-					      "(fsize %Ld)\n", i, j,
+				tst_res(TINFO, ", pg %d off %d, "
+					      "(fsize %Ld)", i, j,
 					      statbuf.st_size);
 #else /* LARGE_FILE */
-				(void)fprintf(stderr, ", pg %d off %d, "
-					      "(fsize %ld)\n", i, j,
+				tst_res(TINFO, ", pg %d off %d, "
+					      "(fsize %ld)", i, j,
 					      statbuf.st_size);
 #endif /* LARGE_FILE */
 				close(fd);
@@ -696,7 +595,7 @@ int fileokay(char *file, uchar_t * expbuf)
 	return 1;
 }
 
- /*ARGSUSED*/ void finish(int sig)
+void finish(int sig LTP_ATTRIBUTE_UNUSED)
 {
 	finished++;
 	return;
@@ -722,17 +621,7 @@ unsigned int initrand(void)
 	return (seed);
 }
 
-/*****  LTP Port        *****/
-void ok_exit(void)
-{
-	tst_resm(TPASS, "Test passed");
-	tst_rmdir();
-	tst_exit();
-}
-
-int anyfail(void)
-{
-	tst_brkm(TFAIL, tst_rmdir, "Test failed");
-}
-
-/*****  **      **      *****/
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.cleanup = cleanup,
+};
-- 
2.37.3.998.g577e59143f-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
