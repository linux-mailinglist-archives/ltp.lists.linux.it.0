Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 619A83F4CFE
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 17:05:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF1173C9E9A
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 17:05:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CCE8C3C335B
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 17:05:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 11A2D1000B26
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 17:05:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AB3A721FD3
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629731115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/RZMwhRKnOKFM3Ni2zK88nBr5J1FEVtS2JxU5+epFo=;
 b=pr//fSbJ47StCCyx5Edj7eXnQLpsZcsNuK87CZvD9oTx4vzzaldKXqQ5b7xwGSdW4OU4oM
 7F92nZ3Gkt3nMW1Qz+owcvYBBOHDaesM5fwzlOoT3bZMrzHMjUn1DTd4BqcqnpqAmtlqR8
 BvhGGnPcGKrpzV/Y8Cm3Fjp2MZw+sno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629731115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/RZMwhRKnOKFM3Ni2zK88nBr5J1FEVtS2JxU5+epFo=;
 b=WBtMEOrr/8MaYQ5sbY2b6eNNzA3pCjT6Zd4mUQyUqBnGhEkSvzzedBQ4jM8rE3EhGi/Kxo
 adD2jIl0nJ2BzgBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92A3213BE0
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tCa+ISu5I2G7QgAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:15 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 23 Aug 2021 17:05:20 +0200
Message-Id: <20210823150520.25614-4-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823150520.25614-1-chrubis@suse.cz>
References: <20210823150520.25614-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] tst_test_macros: Add test_macros05 tests
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

That tests the two corner cases with default message and macro
stringification.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/newlib_tests/.gitignore      |  1 +
 lib/newlib_tests/test_macros05.c | 46 ++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 lib/newlib_tests/test_macros05.c

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index 807e510ee..a0bad78c1 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -41,6 +41,7 @@ test_macros01
 test_macros02
 test_macros03
 test_macros04
+test_macros05
 tst_fuzzy_sync01
 tst_fuzzy_sync02
 tst_fuzzy_sync03
diff --git a/lib/newlib_tests/test_macros05.c b/lib/newlib_tests/test_macros05.c
new file mode 100644
index 000000000..a164f23ac
--- /dev/null
+++ b/lib/newlib_tests/test_macros05.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*
+ * Tests various corner conditions:
+ *
+ * - default message, i.e. first argument stringification
+ * - macro indirection, i.e. we have to stringify early
+ *
+ * The output should include the MACRO_FAIL() as the either fail of pass
+ * message. If it's missing or if it has been replaced by the function name
+ * there is a bug in the TST_EXP_*() macro.
+ */
+
+#include "tst_test.h"
+
+static int fail_fn_should_not_be_seen_in_output(void)
+{
+	errno = EINVAL;
+	return -1;
+}
+
+#define MACRO_FAIL() fail_fn_should_not_be_seen_in_output()
+
+static void do_test(void)
+{
+	TST_EXP_FAIL(MACRO_FAIL(), EINVAL);
+	TST_EXP_FAIL2(MACRO_FAIL(), EINVAL);
+
+	TST_EXP_PASS(MACRO_FAIL());
+	TST_EXP_PASS_SILENT(MACRO_FAIL());
+
+	TST_EXP_PID(MACRO_FAIL());
+	TST_EXP_PID_SILENT(MACRO_FAIL());
+
+	TST_EXP_FD(MACRO_FAIL());
+	TST_EXP_FD_SILENT(MACRO_FAIL());
+
+	TST_EXP_POSITIVE(MACRO_FAIL());
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
