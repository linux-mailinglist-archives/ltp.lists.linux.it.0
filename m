Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F6010CCDA
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 17:31:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29A303C2219
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 17:31:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 130323C1808
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 17:31:48 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 294D26015AD
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 17:31:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A2A3ACA3
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 16:31:47 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 28 Nov 2019 17:31:47 +0100
Message-Id: <20191128163147.4377-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] Unshare KSM pages before setting max_page_sharing
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

Setting max_page_sharing is possible only when there are no KSM shared pages
in the system. Otherwise writing to max_page_sharing SysFS file will fail
with EBUSY.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/mem/lib/mem.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/mem/lib/mem.c b/testcases/kernel/mem/lib/mem.c
index a0c1b9b00..456259792 100644
--- a/testcases/kernel/mem/lib/mem.c
+++ b/testcases/kernel/mem/lib/mem.c
@@ -482,8 +482,11 @@ void create_same_memory(int size, int num, int unit)
 	stop_ksm_children(child, num);
 
 	tst_res(TINFO, "KSM merging...");
-	if (access(PATH_KSM "max_page_sharing", F_OK) == 0)
+	if (access(PATH_KSM "max_page_sharing", F_OK) == 0) {
+		SAFE_FILE_PRINTF(PATH_KSM "run", "2");
 		SAFE_FILE_PRINTF(PATH_KSM "max_page_sharing", "%ld", size * pages * num);
+	}
+
 	SAFE_FILE_PRINTF(PATH_KSM "run", "1");
 	SAFE_FILE_PRINTF(PATH_KSM "pages_to_scan", "%ld", size * pages * num);
 	SAFE_FILE_PRINTF(PATH_KSM "sleep_millisecs", "0");
@@ -571,16 +574,16 @@ void test_ksm_merge_across_nodes(unsigned long nr_pages)
 	SAFE_FILE_PRINTF(PATH_KSM "sleep_millisecs", "0");
 	SAFE_FILE_PRINTF(PATH_KSM "pages_to_scan", "%ld",
 			 nr_pages * num_nodes);
-	if (access(PATH_KSM "max_page_sharing", F_OK) == 0)
-		SAFE_FILE_PRINTF(PATH_KSM "max_page_sharing",
-			"%ld", nr_pages * num_nodes);
 	/*
-	 * merge_across_nodes setting can be changed only when there
-	 * are no ksm shared pages in system, so set run 2 to unmerge
-	 * pages first, then to 1 after changing merge_across_nodes,
+	 * merge_across_nodes and max_page_sharing setting can be changed
+	 * only when there are no ksm shared pages in system, so set run 2
+	 * to unmerge pages first, then to 1 after changing merge_across_nodes,
 	 * to remerge according to the new setting.
 	 */
 	SAFE_FILE_PRINTF(PATH_KSM "run", "2");
+	if (access(PATH_KSM "max_page_sharing", F_OK) == 0)
+		SAFE_FILE_PRINTF(PATH_KSM "max_page_sharing",
+			"%ld", nr_pages * num_nodes);
 	tst_res(TINFO, "Start to test KSM with merge_across_nodes=1");
 	SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "1");
 	SAFE_FILE_PRINTF(PATH_KSM "run", "1");
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
