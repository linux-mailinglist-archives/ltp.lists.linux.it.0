Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF14A3DA405
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 15:25:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2D193C644A
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 15:25:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 283CA3C632E
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 15:25:30 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 44A35600F97
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 15:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627565127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KSMOxSdKTji3E3RcS25DQ2TSYozy6eO0eD88YW3NiQ8=;
 b=CsqP6cAPTHj3XOzs3jux+ms0loCAs/e+Vy5Nb66eVZV4cBoy7lIrtGPIunt3ZRxLkZ3vbM
 WqvZ6aKK3KOvuTv7YsPnlrJHLSxa07ZXtokChTFjugn9xhCyKNcjZIIuRiPOafyn9MI95d
 MsK4MyaMjexuceR9Mwou7DrUNppCUs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-RSdUxVLAO8SbCXDAw11mvg-1; Thu, 29 Jul 2021 09:25:23 -0400
X-MC-Unique: RSdUxVLAO8SbCXDAw11mvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB6E8100CF6F
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 13:25:21 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02E9E26E6F;
 Thu, 29 Jul 2021 13:25:15 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 29 Jul 2021 21:25:12 +0800
Message-Id: <20210729132514.1699551-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] mbind01: make use of tst_numa_mode_name
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

Add MPOL_LOCAL and adjust some mempolicy mode modes order.
To prettify the error log of mbind01.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 libs/libltpnuma/tst_numa.c                |  7 +++++--
 testcases/kernel/syscalls/mbind/mbind01.c | 10 ++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/libs/libltpnuma/tst_numa.c b/libs/libltpnuma/tst_numa.c
index 56c8640ff..d2241eeae 100644
--- a/libs/libltpnuma/tst_numa.c
+++ b/libs/libltpnuma/tst_numa.c
@@ -16,6 +16,7 @@
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
 #include "tst_numa.h"
+#include "lapi/numaif.h"
 
 void tst_nodemap_print_counters(struct tst_nodemap *nodes)
 {
@@ -50,12 +51,14 @@ const char *tst_numa_mode_name(int mode)
 	switch (mode) {
 	case MPOL_DEFAULT:
 		return "MPOL_DEFAULT";
-	case MPOL_BIND:
-		return "MPOL_BIND";
 	case MPOL_PREFERRED:
 		return "MPOL_PREFERRED";
+	case MPOL_BIND:
+		return "MPOL_BIND";
 	case MPOL_INTERLEAVE:
 		return "MPOL_INTERLEAVE";
+	case MPOL_LOCAL:
+		return "MPOL_LOCAL";
 	default:
 		return "???";
 	}
diff --git a/testcases/kernel/syscalls/mbind/mbind01.c b/testcases/kernel/syscalls/mbind/mbind01.c
index de46c9381..5a2f37307 100644
--- a/testcases/kernel/syscalls/mbind/mbind01.c
+++ b/testcases/kernel/syscalls/mbind/mbind01.c
@@ -17,6 +17,7 @@
 #include "config.h"
 #include "numa_helper.h"
 #include "tst_test.h"
+#include "tst_numa.h"
 #include "lapi/numaif.h"
 
 #ifdef HAVE_NUMA_V2
@@ -124,9 +125,9 @@ static struct test_case tcase[] = {
 static void check_policy_pref_no_target(int policy)
 {
 	if (policy != MPOL_PREFERRED && policy != MPOL_LOCAL) {
-		tst_res(TFAIL, "Wrong policy: %d, "
+		tst_res(TFAIL, "Wrong policy: %s(%d), "
 			"expected MPOL_PREFERRED or MPOL_LOCAL",
-			policy);
+			tst_numa_mode_name(policy), policy);
 	}
 }
 
@@ -200,8 +201,9 @@ static void do_test(unsigned int i)
 		if (tc->check_policy)
 			tc->check_policy(policy);
 		else if (tc->policy != policy) {
-			tst_res(TFAIL, "Wrong policy: %d, expected: %d",
-				policy, tc->policy);
+			tst_res(TFAIL, "Wrong policy: %s(%d), expected: %s(%d)",
+				tst_numa_mode_name(policy), policy,
+				tst_numa_mode_name(tc->policy), tc->policy);
 			fail = 1;
 		}
 		if (tc->exp_nodemask) {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
