Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4672240AD
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 18:35:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 575E93C292A
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 18:35:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 556E23C4E91
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 18:34:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0F734200B15
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 18:34:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32716ACF3
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 16:34:41 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 17 Jul 2020 18:34:49 +0200
Message-Id: <20200717163453.9587-6-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200717163453.9587-1-chrubis@suse.cz>
References: <20200717163453.9587-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 5/9] lib/tst_assert: Add TST_ASSERT_ULONG()
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_assert.h |  9 +++++++++
 lib/tst_assert.c     | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/tst_assert.h b/include/tst_assert.h
index 9969a8169..dcb62dfea 100644
--- a/include/tst_assert.h
+++ b/include/tst_assert.h
@@ -21,6 +21,15 @@ void tst_assert_int(const char *file, const int lineno,
 #define TST_ASSERT_FILE_INT(path, prefix, val) \
 	tst_assert_file_int(__FILE__, __LINE__, path, prefix, val)
 
+/*
+ * Same as tst_assert_int() but for unsigned long.
+ */
+void tst_assert_ulong(const char *file, const int lineno,
+                      const char *path, unsigned long val);
+
+#define TST_ASSERT_ULONG(path, val) \
+	tst_assert_ulong(__FILE__, __LINE__, path, val)
+
 /*
  * Asserts that integer value stored in the prefix field of file pointed by path
  * equals to the value passed to this function. This is mostly useful for
diff --git a/lib/tst_assert.c b/lib/tst_assert.c
index c7908f64f..9b8ebc167 100644
--- a/lib/tst_assert.c
+++ b/lib/tst_assert.c
@@ -23,6 +23,20 @@ void tst_assert_int(const char *file, const int lineno, const char *path, int va
 	tst_res_(file, lineno, TFAIL, "%s != %d got %d", path, val, sys_val);
 }
 
+void tst_assert_ulong(const char *file, const int lineno, const char *path, unsigned long val)
+{
+	unsigned long sys_val;
+
+	safe_file_scanf(file, lineno, NULL, path, "%lu", &sys_val);
+
+	if (val == sys_val) {
+		tst_res_(file, lineno, TPASS, "%s = %lu", path, val);
+		return;
+	}
+
+	tst_res_(file, lineno, TFAIL, "%s != %lu got %lu", path, val, sys_val);
+}
+
 void tst_assert_file_int(const char *file, const int lineno, const char *path, const char *prefix, int val)
 {
 	int sys_val;
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
