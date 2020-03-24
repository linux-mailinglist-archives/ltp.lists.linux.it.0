Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2F11911B4
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 14:47:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 982723C4D30
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 14:47:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AB9193C0430
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 14:36:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E4CBF200FCB
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 14:36:14 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D1CCAC6C
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 13:36:14 +0000 (UTC)
Date: Tue, 24 Mar 2020 14:38:39 +0100
From: Jozef Pupava <jpupava@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200324143839.3647c485@daedruan>
Organization: SUSE
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 24 Mar 2020 14:46:58 +0100
Subject: [LTP] [PATCH 2/2] Avoid zero or negative int results in calculations
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

Define BUF_SIZE smaller than BLOCKSIZE for possitive offset result

Acked-by: Martin Doucha <mdoucha@suse.cz>
Signed-off-by: Jozef Pupava <jpupava@suse.com>
---
 testcases/kernel/syscalls/fsync/fsync02.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/fsync/fsync02.c b/testcases/kernel/syscalls/fsync/fsync02.c
index 9506b4868..42a45d0c5 100644
--- a/testcases/kernel/syscalls/fsync/fsync02.c
+++ b/testcases/kernel/syscalls/fsync/fsync02.c
@@ -22,9 +22,10 @@
 #define BLOCKSIZE 8192
 #define MAXBLKS 262144
 #define TIME_LIMIT 120
+#define BUF_SIZE 2048
 
 char tempfile[40] = "";
-char pbuf[BUFSIZ];
+char pbuf[BUF_SIZE];
 int fd;
 off_t max_blks = MAXBLKS;
 
@@ -47,7 +48,7 @@ static void setup(void) {
 
 #ifdef LARGEFILE
 	SAFE_FCNTL(fd, F_SETFL, O_LARGEFILE);
-	SAFE_WRITE(1, fd, pbuf, BUFSIZ);
+	SAFE_WRITE(1, fd, pbuf, BUF_SIZE);
 #endif
 }
 
@@ -60,17 +61,15 @@ static void run(void) {
 	double time_delta;
 	long int random_number;
 
-	while (max_block <= data_blocks) {
-		random_number = rand();
-		max_block = random_number % max_blks;
-		data_blocks = random_number % 1000 + 1;
-	}
+	random_number = rand();
+	max_block = random_number % max_blks + 1;
+	data_blocks = random_number % max_block;
 
 	for (i = 1; i <= data_blocks; i++) {
 		offset = i * ((BLOCKSIZE * max_block) / data_blocks);
-		offset -= BUFSIZ;
+		offset -= BUF_SIZE;
 		SAFE_LSEEK(fd, offset, SEEK_SET);
-		SAFE_WRITE(1, fd, pbuf, BUFSIZ);
+		SAFE_WRITE(1, fd, pbuf, BUF_SIZE);
 	}
 	time_start = time(0);
 
-- 
2.16.4

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
