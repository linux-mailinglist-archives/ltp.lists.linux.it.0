Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68E3DA404
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 15:25:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DB6B3C642D
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 15:25:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D78733C632E
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 15:25:30 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4D15F600F9A
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 15:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627565128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7hQ1QV2eMeKW3NcY2kVFXxBANj7c6IiLLMvUgozQnI=;
 b=Y+hDw/QXJTxR78lsJ4r0z9pta9jvQMYB4K+hImQDVyBybWqaAK/bBiC7swnqRuQ/ajsDmZ
 +6kdnARd6BKlV3LbysMRMVX78wslVC1Hjs2GX19cUmATyZhleYyWIKYFVMyIG+xQ6EDnTe
 mAMsIjVrYwIpHOHLooYgmKgM/hqr/Is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-osebZjjxP4yQNuWF3iSHcQ-1; Thu, 29 Jul 2021 09:25:26 -0400
X-MC-Unique: osebZjjxP4yQNuWF3iSHcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9063190A7A2
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 13:25:25 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B91426E6F;
 Thu, 29 Jul 2021 13:25:22 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 29 Jul 2021 21:25:13 +0800
Message-Id: <20210729132514.1699551-2-liwang@redhat.com>
In-Reply-To: <20210729132514.1699551-1-liwang@redhat.com>
References: <20210729132514.1699551-1-liwang@redhat.com>
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
Subject: [LTP] [PATCH 2/3] libs: rename tst_numa_mode_name to
 tst_mempolicy_mode_name
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

To be precise describe the MPOL_* mempolicy mode and be consistent
with kernel's consuetude.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 include/tst_numa.h                                        | 2 +-
 libs/libltpnuma/tst_numa.c                                | 2 +-
 testcases/kernel/syscalls/mbind/mbind01.c                 | 6 +++---
 testcases/kernel/syscalls/mbind/mbind02.c                 | 6 +++---
 testcases/kernel/syscalls/mbind/mbind03.c                 | 4 ++--
 testcases/kernel/syscalls/mbind/mbind04.c                 | 4 ++--
 testcases/kernel/syscalls/set_mempolicy/set_mempolicy01.c | 4 ++--
 testcases/kernel/syscalls/set_mempolicy/set_mempolicy03.c | 4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/tst_numa.h b/include/tst_numa.h
index 846e093a9..3af311e5e 100644
--- a/include/tst_numa.h
+++ b/include/tst_numa.h
@@ -38,7 +38,7 @@ void tst_nodemap_print_counters(struct tst_nodemap *nodes);
  *
  * @mode Numa mempolicy mode.
  */
-const char *tst_numa_mode_name(int mode);
+const char *tst_mempolicy_mode_name(int mode);
 
 /**
  * Maps pages into memory, if path is NULL the mapping is anonymous otherwise is backed by the file.
diff --git a/libs/libltpnuma/tst_numa.c b/libs/libltpnuma/tst_numa.c
index d2241eeae..e3e80f229 100644
--- a/libs/libltpnuma/tst_numa.c
+++ b/libs/libltpnuma/tst_numa.c
@@ -46,7 +46,7 @@ void tst_nodemap_free(struct tst_nodemap *nodes)
 
 #ifdef HAVE_NUMA_V2
 
-const char *tst_numa_mode_name(int mode)
+const char *tst_mempolicy_mode_name(int mode)
 {
 	switch (mode) {
 	case MPOL_DEFAULT:
diff --git a/testcases/kernel/syscalls/mbind/mbind01.c b/testcases/kernel/syscalls/mbind/mbind01.c
index 5a2f37307..d2cf13c8f 100644
--- a/testcases/kernel/syscalls/mbind/mbind01.c
+++ b/testcases/kernel/syscalls/mbind/mbind01.c
@@ -127,7 +127,7 @@ static void check_policy_pref_no_target(int policy)
 	if (policy != MPOL_PREFERRED && policy != MPOL_LOCAL) {
 		tst_res(TFAIL, "Wrong policy: %s(%d), "
 			"expected MPOL_PREFERRED or MPOL_LOCAL",
-			tst_numa_mode_name(policy), policy);
+			tst_mempolicy_mode_name(policy), policy);
 	}
 }
 
@@ -202,8 +202,8 @@ static void do_test(unsigned int i)
 			tc->check_policy(policy);
 		else if (tc->policy != policy) {
 			tst_res(TFAIL, "Wrong policy: %s(%d), expected: %s(%d)",
-				tst_numa_mode_name(policy), policy,
-				tst_numa_mode_name(tc->policy), tc->policy);
+				tst_mempolicy_mode_name(policy), policy,
+				tst_mempolicy_mode_name(tc->policy), tc->policy);
 			fail = 1;
 		}
 		if (tc->exp_nodemask) {
diff --git a/testcases/kernel/syscalls/mbind/mbind02.c b/testcases/kernel/syscalls/mbind/mbind02.c
index 01b3b3c69..4b0851e57 100644
--- a/testcases/kernel/syscalls/mbind/mbind02.c
+++ b/testcases/kernel/syscalls/mbind/mbind02.c
@@ -74,18 +74,18 @@ static void verify_policy(int mode)
 	if (TST_RET != -1) {
 		tst_res(TFAIL,
 		        "mbind(%s, MPOL_MF_STRICT) node %u returned %li, expected -1",
-		        tst_numa_mode_name(mode), node, TST_RET);
+		        tst_mempolicy_mode_name(mode), node, TST_RET);
 		return;
 	}
 
 	if (TST_ERR == EIO) {
 		tst_res(TPASS | TTERRNO,
 		        "mbind(%s, MPOL_MF_STRICT) node %u",
-		        tst_numa_mode_name(mode), node);
+		        tst_mempolicy_mode_name(mode), node);
 	} else {
 		tst_res(TFAIL | TTERRNO,
 			"mbind(%s, MPOL_MF_STRICT) node %u expected EIO",
-		        tst_numa_mode_name(mode), node);
+		        tst_mempolicy_mode_name(mode), node);
 	}
 }
 
diff --git a/testcases/kernel/syscalls/mbind/mbind03.c b/testcases/kernel/syscalls/mbind/mbind03.c
index c0750c804..392f89787 100644
--- a/testcases/kernel/syscalls/mbind/mbind03.c
+++ b/testcases/kernel/syscalls/mbind/mbind03.c
@@ -68,11 +68,11 @@ static void verify_policy(int mode, unsigned flag)
 	if (TST_RET) {
 		tst_res(TFAIL | TTERRNO,
 		        "mbind(%s, %s) node %u",
-		        tst_numa_mode_name(mode), mbind_flag_name(flag), node);
+		        tst_mempolicy_mode_name(mode), mbind_flag_name(flag), node);
 		goto exit;
 	} else {
 		tst_res(TPASS, "mbind(%s, %s) node %u succeded",
-		        tst_numa_mode_name(mode), mbind_flag_name(flag), node);
+		        tst_mempolicy_mode_name(mode), mbind_flag_name(flag), node);
 	}
 
 	tst_nodemap_reset_counters(nodes);
diff --git a/testcases/kernel/syscalls/mbind/mbind04.c b/testcases/kernel/syscalls/mbind/mbind04.c
index ea9966622..e7603691a 100644
--- a/testcases/kernel/syscalls/mbind/mbind04.c
+++ b/testcases/kernel/syscalls/mbind/mbind04.c
@@ -61,12 +61,12 @@ static void verify_policy(unsigned int node, int mode, unsigned flag)
 	if (TST_RET) {
 		tst_res(TFAIL | TTERRNO,
 		        "mbind(%s, %s) node %u",
-		        tst_numa_mode_name(mode), mbind_flag_name(flag), node);
+		        tst_mempolicy_mode_name(mode), mbind_flag_name(flag), node);
 		return;
 	}
 
 	tst_res(TPASS, "mbind(%s, %s) node %u",
-	        tst_numa_mode_name(mode), mbind_flag_name(flag), node);
+	        tst_mempolicy_mode_name(mode), mbind_flag_name(flag), node);
 
 	const char *prefix = "child: ";
 
diff --git a/testcases/kernel/syscalls/set_mempolicy/set_mempolicy01.c b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy01.c
index 96a275411..3f36fbe62 100644
--- a/testcases/kernel/syscalls/set_mempolicy/set_mempolicy01.c
+++ b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy01.c
@@ -55,12 +55,12 @@ static void verify_mempolicy(unsigned int node, int mode)
 	if (TST_RET) {
 		tst_res(TFAIL | TTERRNO,
 		        "set_mempolicy(%s) node %u",
-		        tst_numa_mode_name(mode), node);
+		        tst_mempolicy_mode_name(mode), node);
 		return;
 	}
 
 	tst_res(TPASS, "set_mempolicy(%s) node %u",
-	        tst_numa_mode_name(mode), node);
+	        tst_mempolicy_mode_name(mode), node);
 
 	numa_free_nodemask(bm);
 
diff --git a/testcases/kernel/syscalls/set_mempolicy/set_mempolicy03.c b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy03.c
index 24775de10..2fb43e98d 100644
--- a/testcases/kernel/syscalls/set_mempolicy/set_mempolicy03.c
+++ b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy03.c
@@ -54,12 +54,12 @@ static void verify_mempolicy(unsigned int node, int mode)
 	if (TST_RET) {
 		tst_res(TFAIL | TTERRNO,
 		        "set_mempolicy(%s) node %u",
-		        tst_numa_mode_name(mode), node);
+		        tst_mempolicy_mode_name(mode), node);
 		return;
 	}
 
 	tst_res(TPASS, "set_mempolicy(%s) node %u",
-	        tst_numa_mode_name(mode), node);
+	        tst_mempolicy_mode_name(mode), node);
 
 	numa_free_nodemask(bm);
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
