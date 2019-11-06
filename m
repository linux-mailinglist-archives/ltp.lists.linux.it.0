Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D05F1072
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 08:36:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEB063C23CB
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 08:36:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 970F73C13DC
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 08:36:32 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C1B89602294
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 08:36:31 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.1.176])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 5CA0E9F747;
 Wed,  6 Nov 2019 07:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1573025790; bh=o417cNjaKdB1Zs057HZ14F2oAHIzEp+ef/iibUcNytQ=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=VD3kTOA6dF5ctGc2PJbhdidhLTErKW8JlEIQ6h+kZ9fojFf0UfMJ66vp+AuvesR3U
 BuO0vToJnNPGCHPhEP3HJlh37xd+qo2Yhr8vtCk9Hno07by0WtyzkL4gn2wakYZHOw
 xWZXpnRTwNwi1xEDKVOnvDMBjpDji8d/uBzXuse8=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Wed,  6 Nov 2019 08:36:21 +0100
Message-Id: <20191106073621.58738-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] memcg_lib/memcg_process: Better synchronization of
 signal USR1
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

memcg_process is triggered by memcg_lib to do allocations and
deallocations. These work was done in the signal handler.
In some cases it could happen, that memcg_lib send multiple
signals (e.g. in function warmup). This lead to signals getting
lost and failed tests.

The patch moves the allocation and deallocation to the main
function, triggered by a flag set by the signal handler.
Additionally TST_CHECKPOINT_WAKE/TST_CHECKPOINT_WAIT is
used to make memcg_lib wait until memcg_process is done
allocating/deallocating.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../controllers/memcg/functional/memcg_lib.sh |  1 +
 .../memcg/functional/memcg_process.c          | 44 +++++++++++--------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
index aadaae4d2..7440e1eee 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -124,6 +124,7 @@ signal_memcg_process()
 	local usage_start=$(cat ${path}memory.usage_in_bytes)
 
 	kill -s USR1 $pid 2> /dev/null
+	TST_CHECKPOINT_WAIT 1
 
 	if [ -z "$size" ]; then
 		return
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_process.c b/testcases/kernel/controllers/memcg/functional/memcg_process.c
index 0e671f566..8e846879d 100644
--- a/testcases/kernel/controllers/memcg/functional/memcg_process.c
+++ b/testcases/kernel/controllers/memcg/functional/memcg_process.c
@@ -24,7 +24,8 @@
 static int fd;
 
 static volatile int flag_exit;
-static volatile int flag_allocated;
+static volatile int flag_do_work;
+static int flag_allocated;
 
 static int opt_mmap_anon;
 static int opt_mmap_file;
@@ -257,22 +258,7 @@ static void sigint_handler(int __attribute__ ((unused)) signo)
  */
 static void sigusr_handler(int __attribute__ ((unused)) signo)
 {
-	if (opt_mmap_anon)
-		mmap_anon();
-
-	if (opt_mmap_file)
-		mmap_file();
-
-	if (opt_mmap_lock1)
-		mmap_lock1();
-
-	if (opt_mmap_lock2)
-		mmap_lock2();
-
-	if (opt_shm)
-		shm();
-
-	flag_allocated = !flag_allocated;
+	flag_do_work++;
 }
 
 int main(int argc, char *argv[])
@@ -302,8 +288,30 @@ int main(int argc, char *argv[])
 
 	TST_CHECKPOINT_WAKE(0);
 
-	while (!flag_exit)
+	while (!flag_exit) {
+		if (flag_do_work) {
+			flag_do_work--;
+			if (opt_mmap_anon)
+				mmap_anon();
+
+			if (opt_mmap_file)
+				mmap_file();
+
+			if (opt_mmap_lock1)
+				mmap_lock1();
+
+			if (opt_mmap_lock2)
+				mmap_lock2();
+
+			if (opt_shm)
+				shm();
+
+			flag_allocated = !flag_allocated;
+
+			TST_CHECKPOINT_WAKE(1);
+		}
 		sleep(1);
+	}
 
 	close(fd);
 
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
