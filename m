Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B8F146E32
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 17:20:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2CDE3C251B
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 17:20:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A20D53C250C
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 17:20:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9B1CA600950
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 17:20:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6E589ACC6
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 16:20:20 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 23 Jan 2020 17:20:19 +0100
Message-Id: <20200123162019.18958-4-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123162019.18958-1-mdoucha@suse.cz>
References: <20200123162019.18958-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/3] Purge temp directory after each run of
 fallocate05
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

The fallocate05 test fills the test device so iterating the test requires
purging the temp directory after each run.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/fallocate/fallocate05.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/fallocate/fallocate05.c b/testcases/kernel/syscalls/fallocate/fallocate05.c
index 00a1d3864..550d10258 100644
--- a/testcases/kernel/syscalls/fallocate/fallocate05.c
+++ b/testcases/kernel/syscalls/fallocate/fallocate05.c
@@ -30,13 +30,13 @@
 #define DEALLOCATE_BLOCKS 4
 #define TESTED_FLAGS "fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)"
 
-static int fd;
 static char *buf;
 static blksize_t blocksize;
 static long bufsize;
 
 static void setup(void)
 {
+	int fd;
 	struct stat statbuf;
 
 	fd = SAFE_OPEN(MNTPOINT "/test_file", O_WRONLY | O_CREAT);
@@ -49,12 +49,15 @@ static void setup(void)
 	blocksize = statbuf.st_blksize;
 	bufsize = FALLOCATE_BLOCKS * blocksize;
 	buf = SAFE_MALLOC(bufsize);
+	SAFE_CLOSE(fd);
 }
 
 static void run(void)
 {
+	int fd;
 	long extsize, tmp;
 
+	fd = SAFE_OPEN(MNTPOINT "/test_file", O_WRONLY | O_CREAT | O_TRUNC);
 	TEST(fallocate(fd, 0, 0, bufsize));
 
 	if (TST_RET) {
@@ -131,14 +134,12 @@ static void run(void)
 	else
 		tst_res(TPASS, "write()");
 
-	/* TODO: wipe the test device here to allow looping with -i/-I */
+	SAFE_CLOSE(fd);
+	tst_purge_dir(MNTPOINT);
 }
 
 static void cleanup(void)
 {
-	if (fd > 0)
-		SAFE_CLOSE(fd);
-
 	free(buf);
 }
 
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
