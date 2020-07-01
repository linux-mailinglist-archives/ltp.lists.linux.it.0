Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF70F2116AB
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 01:31:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C7E33C56A9
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 01:31:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 16B123C29E5
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 01:31:42 +0200 (CEST)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 00DB1200CE7
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 01:31:42 +0200 (CEST)
Received: by mail-ed1-x543.google.com with SMTP id g20so21423387edm.4
 for <ltp@lists.linux.it>; Wed, 01 Jul 2020 16:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+sYN3yCDL5OosbxQ7xaElD+BUL2wBF5Z7fVqblRq9Jo=;
 b=WU+D6QnTcAYaTEbgnrCXOjMwgbopRXXX8iDbwjY6w0FFN21QsRkc/VXmFq++h2lvwb
 YQKe7uu64ERFfkuHx83unSgxVHEeEDoA7GNxV67A5DFj+6lAlPWlSYGrPNvhmJdtDg/d
 RzGZgkr6DRFzhQBq+Bg6Pl1H3K/IXhRA49Ra4egiyjXW2Qo8Ryq28M8YmLRqANhOSwjM
 9ej04QXGsByB1rx6LSEd1zjHxmN02Lg3lOjeBd8GxnYMfCFgPsAOGXpVNp6FsszT0kxC
 jfanhOCOpfumHqGuFXsFa5Jw6L8sOPn0UQyvIJNMMAH5TROCgFgvTIex0tYn/aJDOi68
 Zh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+sYN3yCDL5OosbxQ7xaElD+BUL2wBF5Z7fVqblRq9Jo=;
 b=ZO++TTTrkXOo/BpQp4/m6cyo5z20rcdSTPXOe7ltMX7U6XbP96gXAIfs0DUcwoTMff
 EiGghiTYe7OBkk2fSYEAX0gHonZ586XLOZ+ku1t4D6xFkzGxCCo8TvBMO+r2Xdp1SfWd
 Ejq1zGaRSxDxOtPIsKzICHi3slHklpVKuA6IzF7iR1KhxDzWiYHZW/KlqSXWzQMXrSpQ
 mv37PLQL+kQZNW7JV0iDwQePq2BESqAocwqGTbkHgDDnuTIf9Pt9MGL2c4+PpPUuqpqq
 vZAEr+3h/TS5BKACpd6iAEsgN2BzpB0tlRoDB721O1/MXrqPetLMLVtcb8eNJKHpfL6h
 3bew==
X-Gm-Message-State: AOAM5330v41NjHwGJCnc8uIlOUEodrIq4NvMXOYZ/p5PMF2vg/Kc/PE3
 iIYn4C4fLwj3aIi3H6on5IMUoVpHmSA=
X-Google-Smtp-Source: ABdhPJy689R+PzqDDYANeUNmvbLCg7jB5CBL+79321FPNyNP/w/1m/Z+m0oSBVk2b12LGgzJ1E7V4g==
X-Received: by 2002:a05:6402:888:: with SMTP id
 e8mr32816043edy.210.1593646301267; 
 Wed, 01 Jul 2020 16:31:41 -0700 (PDT)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id m14sm5341828ejx.80.2020.07.01.16.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 16:31:40 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Thu,  2 Jul 2020 01:31:33 +0200
Message-Id: <20200701233133.122801-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] numa01.sh: Handle computation error
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

when numastat -p did not give a value, the resulting bc calculation was
empty string instead of 0, thus shell -eq comparison lacked the first
operator:

Mem_curr=$(echo "$(extract_numastat_p $pid $node) * $MB" |bc)
if [ $(echo "$Mem_curr < $MB" |bc ) -eq 1 ]; then

(standard_in) 1: syntax error
(standard_in) 1: syntax error
/root/ltp-install/testcases/bin/numa01.sh: line 93: [: -eq: unary operator expected

Also fix style (use local and lowercase local function variables).

Fixes: 702

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

Simple fix for https://github.com/linux-test-project/ltp/issues/702,
I guess there should be more checks. Not tested.
BTW I thought numa01.sh was intended to be replaced with C (@Cyril: am I
correct?), thus I didn't bother to split syntax fix into 2 commits.


Kind regards,
Petr

 testcases/kernel/numa/numa01.sh | 95 ++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 44 deletions(-)

diff --git a/testcases/kernel/numa/numa01.sh b/testcases/kernel/numa/numa01.sh
index 1d626327d..a217db033 100755
--- a/testcases/kernel/numa/numa01.sh
+++ b/testcases/kernel/numa/numa01.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) International Business Machines Corp., 2007
-# Copyright (c) Linux Test Project, 2016
+# Copyright (c) Linux Test Project, 2016-2020
 # Author: Sivakumar Chinnaiah <Sivakumar.C@in.ibm.com>
 #
 # Test Basic functionality of numactl command.
@@ -12,9 +12,9 @@
 # Test #5: Verifies localalloc
 # Test #6: Verifies memhog
 # Test #7: Verifies numa_node_size api
-# Test #8:Verifies Migratepages
-# Test #9:Verifies hugepage alloacted on specified node
-# Test #10:Verifies THP memory allocated on preferred node
+# Test #8: Verifies Migratepages
+# Test #9: Verifies hugepage alloacted on specified node
+# Test #10: Verifies THP memory allocated on preferred node
 
 TST_CNT=10
 TST_SETUP=setup
@@ -25,15 +25,24 @@ TST_NEEDS_CMDS="awk bc numactl numastat"
 
 . tst_test.sh
 
-# Extracts the value of given numa node from the `numastat -p` output.
-# $1 - Pid number.
-# $2 - Node number.
-extract_numastat_p()
+# Convert the value of given numa node from the `numastat -p` output,
+# multiply by size.
+# $1 - Pid number
+# $2 - Node number
+# $3 - Size for multiplication (e.g. 1024, $MB)
+get_mem_cur()
 {
 	local pid=$1
 	local node=$(($2 + 2))
+	local size=$3
+	local numstat=$(numastat -p $pid |awk '/^Total/ {print $'$node'}')
 
-	echo $(numastat -p $pid |awk '/^Total/ {print $'$node'}')
+	if [ -z "$numstat" ]; then
+		echo 0
+		return
+	fi
+
+	echo $(echo "$numstat * $size" | bc)
 }
 
 check_for_support_numa()
@@ -72,7 +81,7 @@ setup()
 # Verification of memory allocated on a node
 test1()
 {
-	Mem_curr=0
+	local mem_curr
 
 	for node in $nodes_list; do
 		numactl --cpunodebind=$node --membind=$node support_numa alloc_1MB &
@@ -80,8 +89,8 @@ test1()
 
 		TST_RETRY_FUNC "check_for_support_numa $pid" 0
 
-		Mem_curr=$(echo "$(extract_numastat_p $pid $node) * $MB" |bc)
-		if [ $(echo "$Mem_curr < $MB" | bc) -eq 1 ]; then
+		mem_curr=$(get_mem_cur $pid $node $MB)
+		if [ $(echo "$mem_curr < $MB" | bc) -eq 1 ]; then
 			tst_res TFAIL \
 				"NUMA memory allocated in node$node is less than expected"
 			kill -CONT $pid >/dev/null 2>&1
@@ -97,16 +106,16 @@ test1()
 # Verification of memory allocated on preferred node
 test2()
 {
-	Mem_curr=0
+	local mem_curr
+	local cnt=1
 
-	COUNTER=1
 	for node in $nodes_list; do
 
-		if [ $COUNTER -eq $total_nodes ]; then   #wrap up for last node
+		if [ $cnt -eq $total_nodes ]; then   #wrap up for last node
 			Preferred_node=$(echo $nodes_list | cut -d ' ' -f 1)
 		else
 			# always next node is preferred node
-			Preferred_node=$(echo $nodes_list | cut -d ' ' -f $((COUNTER+1)))
+			Preferred_node=$(echo $nodes_list | cut -d ' ' -f $((cnt+1)))
 		fi
 
 		numactl --cpunodebind=$node --preferred=$Preferred_node support_numa alloc_1MB &
@@ -114,15 +123,15 @@ test2()
 
 		TST_RETRY_FUNC "check_for_support_numa $pid" 0
 
-		Mem_curr=$(echo "$(extract_numastat_p $pid $Preferred_node) * $MB" |bc)
-		if [ $(echo "$Mem_curr < $MB" |bc ) -eq 1 ]; then
+		mem_curr=$(get_mem_cur $pid $Preferred_node $MB)
+		if [ $(echo "$mem_curr < $MB" |bc ) -eq 1 ]; then
 			tst_res TFAIL \
 				"NUMA memory allocated in node$Preferred_node is less than expected"
 			kill -CONT $pid >/dev/null 2>&1
 			return
 		fi
 
-		COUNTER=$((COUNTER+1))
+		cnt=$((cnt+1))
 		kill -CONT $pid >/dev/null 2>&1
 	done
 
@@ -132,7 +141,7 @@ test2()
 # Verification of memory interleaved on all nodes
 test3()
 {
-	Mem_curr=0
+	local mem_curr
 	# Memory will be allocated using round robin on nodes.
 	Exp_incr=$(echo "$MB / $total_nodes" |bc)
 
@@ -142,9 +151,9 @@ test3()
 	TST_RETRY_FUNC "check_for_support_numa $pid" 0
 
 	for node in $nodes_list; do
-		Mem_curr=$(echo "$(extract_numastat_p $pid $node) * $MB" |bc)
+		mem_curr=$(get_mem_cur $pid $node $MB)
 
-		if [ $(echo "$Mem_curr < $Exp_incr" |bc ) -eq 1 ]; then
+		if [ $(echo "$mem_curr < $Exp_incr" |bc ) -eq 1 ]; then
 			tst_res TFAIL \
 				"NUMA interleave memory allocated in node$node is less than expected"
 			kill -CONT $pid >/dev/null 2>&1
@@ -191,7 +200,7 @@ test4()
 # Verification of local node allocation
 test5()
 {
-	Mem_curr=0
+	local mem_curr
 
 	for node in $nodes_list; do
 		numactl --cpunodebind=$node --localalloc support_numa alloc_1MB &
@@ -199,8 +208,8 @@ test5()
 
 		TST_RETRY_FUNC "check_for_support_numa $pid" 0
 
-		Mem_curr=$(echo "$(extract_numastat_p $pid $node) * $MB" |bc)
-		if [ $(echo "$Mem_curr < $MB" |bc ) -eq 1 ]; then
+		mem_curr=$(get_mem_cur $pid $node $MB)
+		if [ $(echo "$mem_curr < $MB" |bc ) -eq 1 ]; then
 			tst_res TFAIL \
 				"NUMA localnode memory allocated in node$node is less than expected"
 			kill -CONT $pid >/dev/null 2>&1
@@ -221,7 +230,7 @@ check_ltp_numa_test8_log()
 # Verification of memhog with interleave policy
 test6()
 {
-	Mem_curr=0
+	local mem_curr
 	# Memory will be allocated using round robin on nodes.
 	Exp_incr=$(echo "$MB / $total_nodes" |bc)
 
@@ -231,9 +240,9 @@ test6()
 	TST_RETRY_FUNC "check_ltp_numa_test8_log" 0
 
 	for node in $nodes_list; do
-		Mem_curr=$(echo "$(extract_numastat_p $pid $node) * $MB" |bc)
+		mem_curr=$(get_mem_cur $pid $node $MB)
 
-		if [ $(echo "$Mem_curr < $Exp_incr" |bc ) -eq 1 ]; then
+		if [ $(echo "$mem_curr < $Exp_incr" |bc ) -eq 1 ]; then
 			tst_res TFAIL \
 				"NUMA interleave memhog in node$node is less than expected"
 			kill -KILL $pid >/dev/null 2>&1
@@ -283,15 +292,14 @@ test7()
 # Verification of migratepages
 test8()
 {
-	Mem_curr=0
-	COUNTER=1
+	local mem_curr
+	local cnt=1
 
 	for node in $nodes_list; do
-
-		if [ $COUNTER -eq $total_nodes ]; then
+		if [ $cnt -eq $total_nodes ]; then
 			Preferred_node=$(echo $nodes_list | cut -d ' ' -f 1)
 		else
-			Preferred_node=$(echo $nodes_list | cut -d ' ' -f $((COUNTER+1)))
+			Preferred_node=$(echo $nodes_list | cut -d ' ' -f $((cnt+1)))
 		fi
 
 		numactl --preferred=$node support_numa alloc_1MB &
@@ -301,15 +309,15 @@ test8()
 
 		migratepages $pid $node $Preferred_node
 
-		Mem_curr=$(echo "$(extract_numastat_p $pid $Preferred_node) * $MB" |bc)
-		if [ $(echo "$Mem_curr < $MB" |bc ) -eq 1 ]; then
+		mem_curr=$(get_mem_cur $pid $Preferred_node $MB)
+		if [ $(echo "$mem_curr < $MB" |bc ) -eq 1 ]; then
 			tst_res TFAIL \
 				"NUMA migratepages is not working fine"
 			kill -CONT $pid >/dev/null 2>&1
 			return
 		fi
 
-		COUNTER=$((COUNTER+1))
+		cnt=$((cnt+1))
 		kill -CONT $pid >/dev/null 2>&1
 	done
 
@@ -363,21 +371,20 @@ test9()
 # Verification of THP memory allocated on preferred node
 test10()
 {
-	Mem_curr=0
+	local mem_curr
+	local cnt=1
 
 	if ! grep -q '\[always\]' /sys/kernel/mm/transparent_hugepage/enabled; then
 		tst_res TCONF "THP is not supported/enabled"
 		return
 	fi
 
-	COUNTER=1
 	for node in $nodes_list; do
-
-		if [ $COUNTER -eq $total_nodes ]; then   #wrap up for last node
+		if [ $cnt -eq $total_nodes ]; then   #wrap up for last node
 			Preferred_node=$(echo $nodes_list | cut -d ' ' -f 1)
 		else
 			# always next node is preferred node
-			Preferred_node=$(echo $nodes_list | cut -d ' ' -f $((COUNTER+1)))
+			Preferred_node=$(echo $nodes_list | cut -d ' ' -f $((cnt+1)))
 		fi
 
 		numactl --cpunodebind=$node --preferred=$Preferred_node support_numa alloc_2HPSZ_THP &
@@ -385,15 +392,15 @@ test10()
 
 		TST_RETRY_FUNC "check_for_support_numa $pid" 0
 
-		Mem_curr=$(echo "$(extract_numastat_p $pid $Preferred_node) * 1024" |bc)
-		if [ $(echo "$Mem_curr < $HPAGE_SIZE * 2" |bc ) -eq 1 ]; then
+		mem_curr=$(get_mem_cur $pid $Preferred_node 1024)
+		if [ $(echo "$mem_curr < $HPAGE_SIZE * 2" |bc ) -eq 1 ]; then
 			tst_res TFAIL \
 				"NUMA memory allocated in node$Preferred_node is less than expected"
 			kill -CONT $pid >/dev/null 2>&1
 			return
 		fi
 
-		COUNTER=$((COUNTER+1))
+		cnt=$((cnt+1))
 		kill -CONT $pid >/dev/null 2>&1
 	done
 
-- 
2.27.0.rc0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
