Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 531368A154
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:40:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E4A43C1D30
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:40:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 5F3E93C07A5
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:44 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8C4E4140013E
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0FCA7ACEC
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 14:39:44 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 12 Aug 2019 16:39:32 +0200
Message-Id: <20190812143941.8119-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812143941.8119-1-chrubis@suse.cz>
References: <20190812143941.8119-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 02/11] lib: Add a canary for guarded buffers
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

In a case that the buffer size is not a multiple of a page size there is
unused space before the start of the buffer. Let's fill that with
center mirrored random bytes and check that the buffer wasn't modified
before we unmap it.

The tst_free_all() function is also set to be executed atexit() in the
safe_fork() function for all child processes, which guaratees that
canaries are checked in child processes as well.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/newlib_tests/test_guarded_buf.c | 18 +++++++++++++--
 lib/tst_buffers.c                   | 36 +++++++++++++++++++++++++++--
 lib/tst_test.c                      |  3 +++
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/lib/newlib_tests/test_guarded_buf.c b/lib/newlib_tests/test_guarded_buf.c
index 2951dce23..506802114 100644
--- a/lib/newlib_tests/test_guarded_buf.c
+++ b/lib/newlib_tests/test_guarded_buf.c
@@ -21,9 +21,16 @@ static char *buf3;
 
 static void do_test(unsigned int n)
 {
-	int pid = SAFE_FORK();
+	int pid;
 	int status;
 
+	if (n == 6) {
+		buf1[-1] = 0;
+		buf3[-1] = 0;
+		tst_res(TPASS, "Buffers dirtied!");
+	}
+
+	pid = SAFE_FORK();
 	if (!pid) {
 		switch (n) {
 		case 0:
@@ -44,6 +51,10 @@ static void do_test(unsigned int n)
 		case 5:
 			buf3[BUF3_LEN] = 0;
 		break;
+		case 6:
+			buf1[-2] = 0;
+			buf3[-2] = 0;
+		break;
 		}
 
 		exit(0);
@@ -51,6 +62,9 @@ static void do_test(unsigned int n)
 
 	SAFE_WAITPID(pid, &status, 0);
 
+	if (n == 6)
+		return;
+
 	if (n < 3) {
 		if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
 			tst_res(TPASS, "Exitted normally");
@@ -69,7 +83,7 @@ static void do_test(unsigned int n)
 static struct tst_test test = {
 	.forks_child = 1,
 	.test = do_test,
-	.tcnt = 6,
+	.tcnt = 7,
 	.bufs = (struct tst_buffers []) {
 		{&buf1, .size = BUF1_LEN},
 		{&buf2, .size = BUF2_LEN},
diff --git a/lib/tst_buffers.c b/lib/tst_buffers.c
index 4f3bbe68e..b8b597a12 100644
--- a/lib/tst_buffers.c
+++ b/lib/tst_buffers.c
@@ -11,11 +11,38 @@
 struct map {
 	void *addr;
 	size_t size;
+	size_t buf_shift;
 	struct map *next;
 };
 
 static struct map *maps;
 
+static void setup_canary(struct map *map)
+{
+	size_t i;
+	char *buf = map->addr;
+
+	for (i = 0; i < map->buf_shift/2; i++) {
+		char c = random();
+		buf[map->buf_shift - i - 1] = c;
+		buf[i] = c;
+	}
+}
+
+static void check_canary(struct map *map)
+{
+	size_t i;
+	char *buf = map->addr;
+
+	for (i = 0; i < map->buf_shift/2; i++) {
+		if (buf[map->buf_shift - i - 1] != buf[i]) {
+			tst_res(TWARN,
+				"pid %i: buffer modified address %p[%zi]",
+				getpid(), (char*)map->addr + map->buf_shift, -i-1);
+		}
+	}
+}
+
 void *tst_alloc(size_t size)
 {
 	size_t page_size = getpagesize();
@@ -40,9 +67,13 @@ void *tst_alloc(size_t size)
 	maps = map;
 
 	if (size % page_size)
-		ret += page_size - (size % page_size);
+		map->buf_shift = page_size - (size % page_size);
+	else
+		map->buf_shift = 0;
+
+	setup_canary(map);
 
-	return ret;
+	return ret + map->buf_shift;
 }
 
 static int count_iovec(int *sizes)
@@ -102,6 +133,7 @@ void tst_free_all(void)
 
 	while (i) {
 		struct map *j = i;
+		check_canary(i);
 		SAFE_MUNMAP(i->addr, i->size);
 		i = i->next;
 		free(j);
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 8dc71dbb3..39f261472 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -390,6 +390,9 @@ pid_t safe_fork(const char *filename, unsigned int lineno)
 	if (pid < 0)
 		tst_brk_(filename, lineno, TBROK | TERRNO, "fork() failed");
 
+	if (!pid)
+		atexit(tst_free_all);
+
 	return pid;
 }
 
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
