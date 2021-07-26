Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB13D59D1
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 14:53:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 078853C8155
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 14:53:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 807613C56B7
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 14:53:20 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 697E660073E
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 14:53:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627303997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ovOXBv/JXREsb7W7ZtgoGafaDRGOm9PXl3GDv9nmAVk=;
 b=hJ3fvBXN8qrlaML98rpfN6prcrvtJJD8Ru5vt/KKMOx3q037L9Up0YgmKasmoqB+cjHBqj
 umcBfHA47K1agVZGrANVRV3Dmts9viQVIbkQLagHtLDIE2waD8Jb46JtnybbSHXOA2AozZ
 EL9Y/ebqDybIJqm72LfetULuxqWohMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-ucdivuzKNZyH6uiIZmiQfQ-1; Mon, 26 Jul 2021 08:53:15 -0400
X-MC-Unique: ucdivuzKNZyH6uiIZmiQfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A58F9107ACF5
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 12:53:14 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04BCF10016F8
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 12:53:13 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 26 Jul 2021 14:53:05 +0200
Message-Id: <3d693985aafc13fba1cd7c4fa807bbbddd015c7b.1627303875.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] mbind01: accept MPOL_LOCAL when passing empty set for
 MPOL_PREFERRED
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

When empty set is passed to MPOL_PREFERRED, memory is allocated
on the node of the CPU that triggered the allocation.

After kernel commit:
  7858d7bca7fb ("mm/mempolicy: don't handle MPOL_LOCAL like a fake MPOL_PREFERRED policy")
kernel returns stored policy as MPOL_LOCAL.

Per mhocko@suse.com in https://lists.linux.it/pipermail/ltp/2021-June/023037.html
  Strictly speaking this is breaking user interface but I am wondering
  whether this really matter or is completely unexpected ... I would
  be inclined to keep this inconsistency and see whether anybody
  actually complains and have a relevant use for this behavior.

Modify the test to accept either MPOL_PREFERRED or MPOL_LOCAL.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 include/lapi/numaif.h                     | 13 +++++++++++++
 testcases/kernel/syscalls/mbind/mbind01.c | 18 +++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 include/lapi/numaif.h

diff --git a/include/lapi/numaif.h b/include/lapi/numaif.h
new file mode 100644
index 000000000000..32dfb565223e
--- /dev/null
+++ b/include/lapi/numaif.h
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Linux Test Project
+ */
+
+#ifndef NUMAIF_H__
+#define NUMAIF_H__
+
+#ifndef MPOL_LOCAL
+# define MPOL_LOCAL	4
+#endif
+
+#endif /* NUMAIF_H__ */
diff --git a/testcases/kernel/syscalls/mbind/mbind01.c b/testcases/kernel/syscalls/mbind/mbind01.c
index bc713d78b5c8..0f9f7d3e62b7 100644
--- a/testcases/kernel/syscalls/mbind/mbind01.c
+++ b/testcases/kernel/syscalls/mbind/mbind01.c
@@ -17,6 +17,7 @@
 #include "config.h"
 #include "numa_helper.h"
 #include "tst_test.h"
+#include "lapi/numaif.h"
 
 #ifdef HAVE_NUMA_V2
 
@@ -32,6 +33,7 @@ static struct bitmask *nodemask, *getnodemask, *empty_nodemask;
 static void test_default(unsigned int i, char *p);
 static void test_none(unsigned int i, char *p);
 static void test_invalid_nodemask(unsigned int i, char *p);
+static void check_policy_pref_no_target(int);
 
 struct test_case {
 	int policy;
@@ -39,6 +41,7 @@ struct test_case {
 	unsigned flags;
 	int ret;
 	int err;
+	void (*check_policy)(int);
 	void (*test)(unsigned int, char *);
 	struct bitmask **exp_nodemask;
 };
@@ -88,6 +91,7 @@ static struct test_case tcase[] = {
 		.ret = 0,
 		.err = 0,
 		.test = test_none,
+		.check_policy = check_policy_pref_no_target,
 	},
 	{
 		POLICY_DESC(MPOL_PREFERRED),
@@ -117,6 +121,15 @@ static struct test_case tcase[] = {
 	},
 };
 
+static void check_policy_pref_no_target(int policy)
+{
+	if (policy != MPOL_PREFERRED && policy != MPOL_LOCAL) {
+		tst_res(TFAIL, "Wrong policy: %d, "
+			"expected MPOL_PREFERRED or MPOL_LOCAL",
+			policy);
+	}
+}
+
 static void test_default(unsigned int i, char *p)
 {
 	struct test_case *tc = &tcase[i];
@@ -183,7 +196,10 @@ static void do_test(unsigned int i)
 			tst_res(TFAIL | TTERRNO, "get_mempolicy failed");
 			return;
 		}
-		if (tc->policy != policy) {
+
+		if (tc->check_policy)
+			tc->check_policy(policy);
+		else if (tc->policy != policy) {
 			tst_res(TFAIL, "Wrong policy: %d, expected: %d",
 				tc->policy, policy);
 			fail = 1;
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
