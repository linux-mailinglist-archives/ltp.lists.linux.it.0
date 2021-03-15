Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE9533B334
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 14:04:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 170AE3C4BEB
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 14:04:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 003743C2DCF
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 14:04:02 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 62B02600085
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 14:04:02 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.4.45])
 by mail.jv-coder.de (Postfix) with ESMTPSA id AFC7E9F9A5;
 Mon, 15 Mar 2021 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1615813440; bh=qkb4bvkyVaTe82WhpzNi/r8lpQUcUT6sCr7Y88gHRp0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=TIA4/Pig91u9rodyIhEtYTx3G+M1TNR3lQdKzRdvAt+d8ctfx6OCC6XteLR/nPvgY
 lPd0tufXRMeZCFtPWS5CojgJhdm4J2dalegrGf/+4dbV9HoXgxEYSwm+LhJlZRze6B
 W5OPlQmwSXR0V7EDmEvsQKb5n61o8g4rCKGZ1jSQ=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Mon, 15 Mar 2021 14:03:49 +0100
Message-Id: <20210315130349.1155389-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] crypto_user02: Find a valid template
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

The test requires a crypto template, that is not in use by someone else,
otherwise deleting it is not possible.
This adds a list of templates, that are tested in order, until one is found,
that can be used for the test, otherwise TCONF is returned.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/kernel/crypto/crypto_user02.c | 65 ++++++++++++++++++-------
 1 file changed, 47 insertions(+), 18 deletions(-)

diff --git a/testcases/kernel/crypto/crypto_user02.c b/testcases/kernel/crypto/crypto_user02.c
index 384e344f2..23dff5b5f 100644
--- a/testcases/kernel/crypto/crypto_user02.c
+++ b/testcases/kernel/crypto/crypto_user02.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright 2019 Google LLC
+ * Copyright (c) 2019 Google LLC
+ * Copyright (c) 2021 Joerg Vehlow <joerg.vehlow@aox-tech.de>
  */
 
 /*
@@ -26,37 +27,65 @@
 #include "tst_crypto.h"
 #include "tst_timer.h"
 
+/*
+ * List of possible templates to use try (not exhaustive).
+ * The template has to be valid (i.e. the drivers must exists
+ * and be a valid combination) and it has to be deleteable.
+ * To be deletable it cannot be used by someone else.
+ * The first algorithm, that fullfils the criteria is used for the test.
+ */
+static const char* TEMPLATE_CANDIDATES[] = {
+	"hmac(sha1-generic)",
+	"hmac(sha224-generic)",
+	"hmac(sha256-generic)",
+	"hmac(sha384-generic)",
+	"hmac(md5-generic)"
+};
+
+static const char* template = NULL;
 static struct tst_crypto_session ses = TST_CRYPTO_SESSION_INIT;
 
+
 static void setup(void)
 {
+	int rc;
+	unsigned i;
+	struct crypto_user_alg alg, alg_out;
 	tst_crypto_open(&ses);
+
+	/* find an algorithm, that is not in use */
+	for (i = 0; i < ARRAY_SIZE(TEMPLATE_CANDIDATES); ++i) {
+		memset(&alg, 0, sizeof(alg));
+		strcpy(alg.cru_driver_name, TEMPLATE_CANDIDATES[i]);
+
+		/* try to add it, to see if it is valid */
+		rc = tst_crypto_add_alg(&ses, &alg);
+		if (rc != 0)
+			continue;
+
+		/* it also has to be deletable */
+		rc = tst_crypto_del_alg(&ses, &alg);
+		if (rc == 0) {
+			template = TEMPLATE_CANDIDATES[i];
+			break;
+		}
+	}
+	if (!template) {
+		tst_brk(TCONF, "No viable template found");
+	}
 }
 
 static void run(void)
 {
-	struct crypto_user_alg alg = {
-		/*
-		 * Any algorithm instantiated from a template can do here, but
-		 * choose something that's commonly available.
-		 */
-		.cru_driver_name = "hmac(sha256-generic)",
-	};
+	struct crypto_user_alg alg = {};
 	pid_t pid;
 	int status;
 
-	/* Check whether the algorithm is supported before continuing. */
-	TEST(tst_crypto_add_alg(&ses, &alg));
-	if (TST_RET != 0 && TST_RET != -EEXIST) {
-		if (TST_RET == -ENOENT)
-			tst_brk(TCONF, "%s not supported", alg.cru_driver_name);
-
-		tst_brk(TBROK | TRERRNO,
-			"unexpected error checking for algorithm support");
-	}
+	strcpy(alg.cru_driver_name, template);
 
 	tst_res(TINFO,
-		"Starting crypto_user larval deletion test.  May crash buggy kernels.");
+		"Starting crypto_user larval deletion test using template %s. May crash buggy kernels.",
+		template);
 
 	tst_timer_start(CLOCK_MONOTONIC);
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
