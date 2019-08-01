Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1197B7D886
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 11:26:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9317D3C200F
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 11:26:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5D1DD3C1DF6
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 11:26:35 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7D3DE6021A6
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 11:26:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DB4EAFD2
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 09:26:32 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  1 Aug 2019 11:26:09 +0200
Message-Id: <20190801092616.30553-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190801092616.30553-1-chrubis@suse.cz>
References: <20190801092616.30553-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 2/9] lib: Add a canary for guarded buffers
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/newlib_tests/test_guarded_buf.c | 12 ++++++++--
 lib/tst_buffers.c                   | 36 +++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/lib/newlib_tests/test_guarded_buf.c b/lib/newlib_tests/test_guarded_buf.c
index 2951dce23..e41d3fa99 100644
--- a/lib/newlib_tests/test_guarded_buf.c
+++ b/lib/newlib_tests/test_guarded_buf.c
@@ -21,9 +21,17 @@ static char *buf3;
 
 static void do_test(unsigned int n)
 {
-	int pid = SAFE_FORK();
+	int pid;
 	int status;
 
+	if (n == 6) {
+		buf1[-1] = 0;
+		buf3[-1] = 0;
+		tst_res(TPASS, "Buffers dirtied!");
+		return;
+	}
+
+	pid = SAFE_FORK();
 	if (!pid) {
 		switch (n) {
 		case 0:
@@ -69,7 +77,7 @@ static void do_test(unsigned int n)
 static struct tst_test test = {
 	.forks_child = 1,
 	.test = do_test,
-	.tcnt = 6,
+	.tcnt = 7,
 	.bufs = (struct tst_buffers []) {
 		{&buf1, .size = BUF1_LEN},
 		{&buf2, .size = BUF2_LEN},
diff --git a/lib/tst_buffers.c b/lib/tst_buffers.c
index c4b2859d1..bc0cb50d8 100644
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
+				"pid %i: buffer modified before address %p %zu",
+				(char*)map->addr + map->buf_shift, i);
+		}
+	}
+}
+
 void *tst_alloc(size_t size)
 {
 	size_t page_size = getpagesize();
@@ -34,9 +61,13 @@ void *tst_alloc(size_t size)
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
@@ -97,6 +128,7 @@ void tst_free_all(void)
 	while (i) {
 		struct map *j = i;
 		tst_res(TINFO, "Freeing %p %zu", i->addr, i->size);
+		check_canary(i);
 		SAFE_MUNMAP(i->addr, i->size);
 		i = i->next;
 		free(j);
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
