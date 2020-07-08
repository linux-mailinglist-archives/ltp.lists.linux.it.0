Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CE0217F91
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 08:29:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE3743C29B6
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 08:29:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1DF433C2991
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 08:29:35 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 5252A1000CDF
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 08:29:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594189772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/xDRUg5ctZj73mwYOTF6TpFLXSCMYscPUwoFVOvycMQ=;
 b=A8YbHNfMeNMijrLvnRc42WZtgs7gxurTnEDCaMh7rw6WjTdQDIbHXzi6rI3QT/uhUJJ/zt
 WrcOUXEhiZChE0dRzJzKne4rtqqCdvziGDxpQreEfleYpp7hA9RIWgwSCT6ns+6t3LJcV9
 2PX3qs7s9cs79HmbPZGxpK0CPvd2UiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-PrzQH5odOYaSzfJsyPLXMA-1; Wed, 08 Jul 2020 02:29:29 -0400
X-MC-Unique: PrzQH5odOYaSzfJsyPLXMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58B21107ACCD;
 Wed,  8 Jul 2020 06:29:28 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FCBF5D9C9;
 Wed,  8 Jul 2020 06:29:26 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed,  8 Jul 2020 14:29:25 +0800
Message-Id: <20200708062925.32521-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] kernel/numa01.sh: : Remove test8
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

This test is duplicated with syscalls/migrate_pages/*.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/numa/README    | 23 +++++------------
 testcases/kernel/numa/numa01.sh | 46 ++++-----------------------------
 2 files changed, 11 insertions(+), 58 deletions(-)

diff --git a/testcases/kernel/numa/README b/testcases/kernel/numa/README
index 846d36dcd..4dd8564be 100644
--- a/testcases/kernel/numa/README
+++ b/testcases/kernel/numa/README
@@ -26,38 +26,27 @@ Verifies the preferred node memory policy which will allocate memory from the no
 testcase will use the support_numa process for the verfication.
 
 TestCase3:
-Verifies the preferred node memory policy which will allocate shared memory from the node we specify. This
-testcase will use the support_numa process for the verfication.
-
-TestCase4:
 Verifies the memory interleaving policy which will distribute the memory evenly among all nodes. This
 testcase will use the support_numa process for the verfication.
 
-TestCase5:
-Verifies the memory interleaving policy which will distribute the memory evenly among all nodes. This
-testcase will use the support_numa process for the verfication.
-
-TestCase6:
+TestCase4:
 Verifies the physical cpu affinity which runs the process support_numa on the specified physical cpu number.
 
-TestCase7:
+TestCase5:
 Verifies the local allocation policy which always allocates memory from the local node. This testcase
 will use the support_numa process for the verfication.
 
-TestCase8:
+TestCase6:
 Verifies the memory interleaving policy which will distribute the memory evenly among all nodes. This
 testcase will use memhog for the verfication.
 
-TestCase9:
+TestCase7:
 Verifies the numa_node_size api with hardware checking.
 
-TestCase10:
-Verifieds the NUMA migratepages policy.
-
-TestCase11:
+TestCase8:
 Verifies the hugepage memory allocated from the node we specify.
 
-TestCase12:
+TestCase9:
 Verifies the preferred node policy with THP memory allocating from the node we specify.
 
 Pre-requisites
diff --git a/testcases/kernel/numa/numa01.sh b/testcases/kernel/numa/numa01.sh
index 0521794e9..803545f13 100755
--- a/testcases/kernel/numa/numa01.sh
+++ b/testcases/kernel/numa/numa01.sh
@@ -12,11 +12,10 @@
 # Test #5: Verifies localalloc
 # Test #6: Verifies memhog
 # Test #7: Verifies numa_node_size api
-# Test #8: Verifies Migratepages
-# Test #9: Verifies hugepage alloacted on specified node
-# Test #10: Verifies THP memory allocated on preferred node
+# Test #8: Verifies hugepage alloacted on specified node
+# Test #9: Verifies THP memory allocated on preferred node
 
-TST_CNT=10
+TST_CNT=9
 TST_SETUP=setup
 TST_TESTFUNC=test
 TST_NEEDS_TMPDIR=1
@@ -300,43 +299,8 @@ test7()
 	fi
 }
 
-# Verification of migratepages
-test8()
-{
-	local mem_curr
-	local cnt=1
-
-	for node in $nodes_list; do
-		if [ $cnt -eq $total_nodes ]; then
-			Preferred_node=$(echo $nodes_list | cut -d ' ' -f 1)
-		else
-			Preferred_node=$(echo $nodes_list | cut -d ' ' -f $((cnt+1)))
-		fi
-
-		numactl --preferred=$node support_numa alloc_1MB &
-		pid=$!
-
-		TST_RETRY_FUNC "check_for_support_numa $pid" 0
-
-		migratepages $pid $node $Preferred_node
-
-		mem_curr=$(get_mem_cur $pid $Preferred_node $MB)
-		if [ $(echo "$mem_curr < $MB" |bc ) -eq 1 ]; then
-			tst_res TFAIL \
-				"NUMA migratepages is not working fine"
-			kill -CONT $pid >/dev/null 2>&1
-			return
-		fi
-
-		cnt=$((cnt+1))
-		kill -CONT $pid >/dev/null 2>&1
-	done
-
-	tst_res TPASS "NUMA MIGRATEPAGES policy"
-}
-
 # Verification of hugepage memory allocated on a node
-test9()
+test8()
 {
 	Mem_huge=0
 	Sys_node=/sys/devices/system/node
@@ -381,7 +345,7 @@ test9()
 }
 
 # Verification of THP memory allocated on preferred node
-test10()
+test9()
 {
 	local mem_curr
 	local cnt=1
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
