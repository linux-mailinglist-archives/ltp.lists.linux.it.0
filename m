Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 533735F492B
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Oct 2022 20:21:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8938A3CADF6
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Oct 2022 20:21:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 509DA3CA7E7
 for <ltp@lists.linux.it>; Tue,  4 Oct 2022 20:21:19 +0200 (CEST)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E75F3100061E
 for <ltp@lists.linux.it>; Tue,  4 Oct 2022 20:21:17 +0200 (CEST)
Received: by mail-pg1-x549.google.com with SMTP id
 x23-20020a634857000000b0043c700f6441so9360515pgk.21
 for <ltp@lists.linux.it>; Tue, 04 Oct 2022 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date;
 bh=C8cDnASKRJ672FF3lOKNTiiJ4uZDcLifNtvhc+f4O4M=;
 b=LhaYAhiXe1GT2C+rCUw52gFMNHW0sdE+W2W6B0ttedfOjWBJffUnqJiBnJDnmxFPdI
 8R+qm50J2FIPIaYwpa26wJ7ewP1MA2ksgcvCDYkjfg/WjCsa/T0+drOTRPz7+Qf3DGFp
 c/BBZ2RscV+MAU/W24N7F6uNSNmDIiv6R6mQ0S+YjWIKj4vRPk8wUyqgg7nZUQWLqsaf
 oub2mVXgsOr1/oT+NkTs+a8Jw9ILkyq/xzzK3HJIMuCKeWNgliU/Ui4Ykp4A5kea9Blr
 x0ZgXf2MX4VvGcttXQJDYFDu3qK+e/2xWzI2mPLCBmIE2Lm40tBDfn2T9+w4zJ1NGGry
 DljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=C8cDnASKRJ672FF3lOKNTiiJ4uZDcLifNtvhc+f4O4M=;
 b=eG0RZmaMMmb/SjM9XzQUmpT+6PvCRZDUiR4JMkRsoZDHxmvmjW0CU6d/bcEgr25V8D
 NoFnDd9nxgR4lNCrPsyWP7Gkke3CMmuwa8mSnCU+9tajffUSblPOei/uMWhCirTX74j2
 LKSA4+fSiwOchzZxphh95jzyIORKtI1GGkzqvzkmtqR4VBK+s8YLHDjAdcyTo/8hpOo1
 m9MvGGhGVW09rcbS8QhiuOJUwZM/OhkmCq9N1qBPoxZQ4YPWJp3OuGypAtHursVpeaMw
 MniNCUQHUWthrEVviDONW90tIV/mirs9tK/nof5iIBE95QtJVFaBow3OedyhebaJDKXM
 9oQA==
X-Gm-Message-State: ACrzQf0KhD3XHU6xlptEBnZbA6c/JEejYAHAtrDENQ8frPqkleqftq2B
 SoGt/rUXGc+nIvP0q6aHgQHU9+fChUm3GZZPaybu+ZMTsuk0KOU9sKnjZ2+JI/H6OXaoNDnY7HH
 uGqHMBRy5wOFizlA812Gnt/GwsyCZSzRSx/Gm8RruT05/N7d6UJAyiIsp
X-Google-Smtp-Source: AMsMyM5L+DfL3Y+uXCiAVpA7iStjrNWkT8U+aqL7Sf2/ZtzTOaISHxSgwipI4z5F6TCyfmuC0+eQhKBAoqM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:db0a:b0:178:2636:b6de with SMTP id
 m10-20020a170902db0a00b001782636b6demr28527960plx.58.1664907676117; Tue, 04
 Oct 2022 11:21:16 -0700 (PDT)
Date: Tue,  4 Oct 2022 18:20:32 +0000
In-Reply-To: <20221004182040.1859774-1-edliaw@google.com>
Mime-Version: 1.0
References: <20221004182040.1859774-1-edliaw@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221004182040.1859774-2-edliaw@google.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/9] mmapstress01: refactor to tst_test framework
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
 .../kernel/mem/mmapstress/mmapstress01.c      | 485 +++++++-----------
 1 file changed, 187 insertions(+), 298 deletions(-)

diff --git a/testcases/kernel/mem/mmapstress/mmapstress01.c b/testcases/kernel/mem/mmapstress/mmapstress01.c
index f425c223d..41f94a52a 100644
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
+
+static pid_t *pidarray = NULL;
+static int wait_stat;
+static int check_for_sanity;
+static unsigned char *buf = NULL;
 
-unsigned int initrand(void);
-void finish(int sig);
-void child_mapper(char *file, unsigned procno, unsigned nprocs);
-int fileokay(char *file, uchar_t * expbuf);
-int finished = 0;
-int leavefile = 0;
 
-int debug = 0;
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
@@ -206,46 +190,39 @@ int main(int argc, char *argv[])
 #else /* LARGE_FILE */
 			sparseoffset = atoi(optarg);
 #endif /* LARGE_FILE */
-			if (sparseoffset % pagesize != 0) {
-				fprintf(stderr,
-					"sparseoffset must be pagesize multiple\n");
-				anyfail();
-			}
+			if (sparseoffset % pagesize != 0)
+				tst_brk(TBROK,
+				        "sparseoffset must be pagesize multiple");
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
+		        TEST_FILE, filesize, pattern);
 #else /* LARGE_FILE */
-		(void)printf("creating file <%s> with %ld bytes, pattern %d\n",
-			     filename, filesize, pattern);
+		tst_res(TINFO, "creating file <%s> with %ld bytes, pattern %d",
+		        TEST_FILE, filesize, pattern);
 #endif /* LARGE_FILE */
 		if (alarmtime)
-			(void)printf("running for %f minutes\n",
-				     alarmtime / 60);
+			tst_res(TINFO, "running for %f minutes",
+			        alarmtime / 60);
 		else
-			(void)printf("running with no time limit\n");
+			tst_res(TINFO, "running with no time limit");
 	}
 
+	tst_reinit();
+
 	/*
 	 *  Plan for death by signal.  User may have specified
 	 *  a time limit, in which set an alarm and catch SIGALRM.
@@ -253,44 +230,32 @@ int main(int argc, char *argv[])
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
@@ -302,25 +267,23 @@ int main(int argc, char *argv[])
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
-			if (c == -1) {
-				perror("write error");
-			} else {
-				(void)fprintf(stderr, "write: wrote %d of %d "
-					      "bytes\n", c, write_cnt);
-			}
+			if (c == -1)
+				tst_res(TINFO, "write error");
+			else
+				tst_res(TINFO, "write: wrote %d of %d bytes",
+				        c, write_cnt);
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
@@ -355,10 +318,8 @@ int main(int argc, char *argv[])
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
@@ -366,44 +327,36 @@ int main(int argc, char *argv[])
 			 *  appropriate procno.
 			 */
 			if (!WIFEXITED(wait_stat)
-			    || WEXITSTATUS(wait_stat) != 0) {
-				(void)fprintf(stderr, "child exit with err "
-					      "<x%x>\n", wait_stat);
-				goto cleanup;
-			}
+			    || WEXITSTATUS(wait_stat) != 0)
+				tst_brk(TFAIL, "child exit with err <x%x>",
+				        wait_stat);
 			for (i = 0; i < nprocs; i++)
 				if (pid == pidarray[i])
 					break;
-			if (i == nprocs) {
-				(void)fprintf(stderr, "unknown child pid %d, "
-					      "<x%x>\n", pid, wait_stat);
-				goto cleanup;
-			}
+			if (i == nprocs)
+				tst_brk(TFAIL, "unknown child pid %d, <x%x>",
+				        pid, wait_stat);
 
 			if ((pid = fork()) == -1) {
-				perror("fork error");
 				pidarray[i] = 0;
-				goto cleanup;
+				tst_brk(TFAIL, "fork error");
 			} else if (pid == 0) {	/* child */
-				child_mapper(filename, i, nprocs);
+				child_mapper(TEST_FILE, i, nprocs);
 				exit(0);
-			} else
+			} else {
 				pidarray[i] = pid;
+			}
 		} else {
 			/*
 			 *  wait returned an error.  If EINTR, then
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
@@ -411,40 +364,34 @@ int main(int argc, char *argv[])
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
-	} else
-		(void)printf("  leaving file <%s>\n", filename);
-
-	(void)time(&t);
-	//(void)printf("%s: Finished %s", argv[0], ctime(&t)); LTP Port
-	ok_exit();
-	tst_exit();
+	} else {
+		tst_res(TINFO, "  leaving file <%s>", TEST_FILE);
+	}
 }
 
 /*
@@ -454,7 +401,7 @@ cleanup:
  *  determined based on nprocs & procno).  After a specific number of
  *  iterations, it exits.
  */
-void child_mapper(char *file, unsigned procno, unsigned nprocs)
+void child_mapper(char *file, unsigned int procno, unsigned int nprocs)
 {
 #ifdef LARGE_FILE
 	struct stat64 statbuf;
@@ -470,38 +417,32 @@ void child_mapper(char *file, unsigned procno, unsigned nprocs)
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
@@ -514,29 +455,18 @@ void child_mapper(char *file, unsigned procno, unsigned nprocs)
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
-			     procno, getpid(), seed, filesize, (long)mapsize,
-			     offset / pagesize, nloops);
-#endif /* LARGE_FILE */
-	}
+	if (debug)
+		tst_res(TINFO, "child %d (pid %d): seed %d, fsize %lld, mapsize %ld, off %lld, loop %d",
+		        procno, getpid(), seed, filesize, (long)mapsize,
+		        offset / pagesize, nloops);
 #ifdef LARGE_FILE
 	if ((maddr = mmap64(0, mapsize, PROT_READ | PROT_WRITE, MAP_SHARED,
-			    fd, offset)) == (caddr_t) - 1) {
+	                    fd, (off64_t)offset)) == (caddr_t) - 1)
 #else /* LARGE_FILE */
 	if ((maddr = mmap(0, mapsize, PROT_READ | PROT_WRITE, MAP_SHARED,
-			  fd, offset)) == (caddr_t) - 1) {
+	                  fd, (off_t)offset)) == (caddr_t) - 1)
 #endif /* LARGE_FILE */
-		perror("mmap error");
-		anyfail();
-	}
+		tst_brk(TFAIL, "mmap error");
 
 	(void)close(fd);
 
@@ -554,15 +484,11 @@ void child_mapper(char *file, unsigned procno, unsigned nprocs)
 
 		for (i = procno; i < validsize; i += nprocs) {
 			if (*((unsigned char *)(paddr + i))
-			    != ((procno + pattern) & 0xff)) {
-				(void)fprintf(stderr, "child %d: invalid data "
-					      "<x%x>", procno,
-					      *((unsigned char *)(paddr + i)));
-				(void)fprintf(stderr, " at pg %d off %d, exp "
-					      "<x%x>\n", randpage, i,
-					      (procno + pattern) & 0xff);
-				anyfail();
-			}
+			    != ((procno + pattern) & 0xff))
+				tst_brk(TFAIL, "child %d: invalid data <x%x>\n"
+				        " at pg %d off %d, exp <x%x>", procno,
+				        *((unsigned char *)(paddr + i)),
+				        randpage, i, (procno + pattern) & 0xff);
 
 			/*
 			 *  Now write it.
@@ -577,22 +503,18 @@ void child_mapper(char *file, unsigned procno, unsigned nprocs)
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
+		          MS_SYNC) == -1)
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
@@ -600,50 +522,36 @@ int fileokay(char *file, uchar_t * expbuf)
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
@@ -651,20 +559,14 @@ int fileokay(char *file, uchar_t * expbuf)
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
-					      (i * pagesize) + cnt,
-					      (long)mapsize);
+				tst_res(TINFO, "read %d of %ld bytes",
+				        (i * pagesize) + cnt, (long)mapsize);
 				close(fd);
 				return 0;
 			}
@@ -672,19 +574,16 @@ int fileokay(char *file, uchar_t * expbuf)
 		/*
 		 *  Compare read bytes of data.
 		 */
-		for (j = 0; j < cnt; j++) {
+		for (j = 0; j < (unsigned int)cnt; j++) {
 			if (expbuf[j] != readbuf[j]) {
-				(void)fprintf(stderr,
-					      "read bad data: exp %c got %c)",
-					      expbuf[j], readbuf[j]);
+				tst_res(TINFO, "read bad data: exp %c got %c)",
+				        expbuf[j], readbuf[j]);
 #ifdef LARGE_FILE
-				(void)fprintf(stderr, ", pg %d off %d, "
-					      "(fsize %Ld)\n", i, j,
-					      statbuf.st_size);
+				tst_res(TINFO, ", pg %d off %d, "
+				        "(fsize %Ld)", i, j, statbuf.st_size);
 #else /* LARGE_FILE */
-				(void)fprintf(stderr, ", pg %d off %d, "
-					      "(fsize %ld)\n", i, j,
-					      statbuf.st_size);
+				tst_res(TINFO, ", pg %d off %d, "
+				        "(fsize %ld)", i, j, statbuf.st_size);
 #endif /* LARGE_FILE */
 				close(fd);
 				return 0;
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
2.38.0.rc1.362.ged0d419d3c-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
