Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F313DA406
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 15:25:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EAEF3C8F80
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 15:25:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BCEEE3C6383
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 15:25:33 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2A7171A0144B
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 15:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627565131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fU0N+kgEVT1ljq+xi6RYa2c/R5pYue6ctM7GZoNTewQ=;
 b=VmYTS31901Cm6hLXhHAK8kJfByZGrPiNRkjONY8jCZctaehdclSMf0kXh1AUb8g6RCs6dr
 /8JBD9d2FO+W1R6BiSglU3UvUTpKRZvFiobTIDXQMKTXNJnRpApIRtPei/piyj4Lk4K/8L
 yabpcNJ9u/QjrTFk3OVvJseAS/iKGqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-y7TxjVGEPUm17lKL6dOing-1; Thu, 29 Jul 2021 09:25:30 -0400
X-MC-Unique: y7TxjVGEPUm17lKL6dOing-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3981D802929
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 13:25:29 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38E0C277BC;
 Thu, 29 Jul 2021 13:25:25 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 29 Jul 2021 21:25:14 +0800
Message-Id: <20210729132514.1699551-3-liwang@redhat.com>
In-Reply-To: <20210729132514.1699551-1-liwang@redhat.com>
References: <20210729132514.1699551-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] mbind01: add more tests for MPOL_LOCAL
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

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/mbind/mbind01.c | 25 ++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/mbind/mbind01.c b/testcases/kernel/syscalls/mbind/mbind01.c
index d2cf13c8f..b5c1e948d 100644
--- a/testcases/kernel/syscalls/mbind/mbind01.c
+++ b/testcases/kernel/syscalls/mbind/mbind01.c
@@ -34,7 +34,7 @@ static struct bitmask *nodemask, *getnodemask, *empty_nodemask;
 static void test_default(unsigned int i, char *p);
 static void test_none(unsigned int i, char *p);
 static void test_invalid_nodemask(unsigned int i, char *p);
-static void check_policy_pref_no_target(int);
+static void check_policy_pref_or_local(int);
 
 struct test_case {
 	int policy;
@@ -92,7 +92,7 @@ static struct test_case tcase[] = {
 		.ret = 0,
 		.err = 0,
 		.test = test_none,
-		.check_policy = check_policy_pref_no_target,
+		.check_policy = check_policy_pref_or_local,
 	},
 	{
 		POLICY_DESC(MPOL_PREFERRED),
@@ -101,6 +101,20 @@ static struct test_case tcase[] = {
 		.test = test_default,
 		.exp_nodemask = &nodemask,
 	},
+	{
+		POLICY_DESC(MPOL_LOCAL),
+		.ret = 0,
+		.err = 0,
+		.test = test_none,
+		.exp_nodemask = &empty_nodemask,
+		.check_policy = check_policy_pref_or_local,
+	},
+	{
+		POLICY_DESC_TEXT(MPOL_LOCAL, "target exists"),
+		.ret = -1,
+		.err = EINVAL,
+		.test = test_default,
+	},
 	{
 		POLICY_DESC(UNKNOWN_POLICY),
 		.ret = -1,
@@ -122,7 +136,7 @@ static struct test_case tcase[] = {
 	},
 };
 
-static void check_policy_pref_no_target(int policy)
+static void check_policy_pref_or_local(int policy)
 {
 	if (policy != MPOL_PREFERRED && policy != MPOL_LOCAL) {
 		tst_res(TFAIL, "Wrong policy: %s(%d), "
@@ -182,6 +196,11 @@ static void do_test(unsigned int i)
 
 	tst_res(TINFO, "case %s", tc->desc);
 
+	if ((tst_kvercmp(3, 8, 0)) < 0 && (tc->policy == MPOL_LOCAL)) {
+		tst_res(TCONF, "%s is not supported", tst_mempolicy_mode_name(tc->policy));
+		return;
+	}
+
 	setup_node();
 
 	p = SAFE_MMAP(NULL, MEM_LENGTH, PROT_READ | PROT_WRITE, MAP_PRIVATE |
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
