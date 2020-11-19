Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDAC2B9162
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 12:52:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6E0B3C5F72
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 12:52:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id F0AA83C2E8F
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 12:52:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 60AEB1400C51
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 12:52:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9B25ACB0
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:52:31 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 19 Nov 2020 12:52:28 +0100
Message-Id: <20201119115230.8829-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/3] Add tst_kconfig_get() helper function
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/tst_kconfig.h | 10 ++++++++++
 lib/tst_kconfig.c     | 21 +++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/tst_kconfig.h b/include/tst_kconfig.h
index 1bb21fea8..f56b12919 100644
--- a/include/tst_kconfig.h
+++ b/include/tst_kconfig.h
@@ -55,4 +55,14 @@ void tst_kconfig_read(struct tst_kconfig_var vars[], size_t vars_len);
  */
 void tst_kconfig_check(const char *const kconfigs[]);
 
+/**
+ * Checks kernel config for a single configuration option and returns its
+ * state if found. The possible return values are the same as for
+ * tst_kconfig_var.choice, with the same meaning. See tst_kconfig_read()
+ * description for details.
+ *
+ * @param confname The configuration option name to search for.
+ */
+char tst_kconfig_get(const char *confname);
+
 #endif	/* TST_KCONFIG_H__ */
diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
index 35f20e7a4..4d231175f 100644
--- a/lib/tst_kconfig.c
+++ b/lib/tst_kconfig.c
@@ -511,3 +511,24 @@ void tst_kconfig_check(const char *const kconfigs[])
 	if (abort_test)
 		tst_brk(TCONF, "Aborting due to unsuitable kernel config, see above!");
 }
+
+char tst_kconfig_get(const char *confname)
+{
+	struct tst_kconfig_var var;
+
+	var.id_len = strlen(confname);
+
+	if (var.id_len >= sizeof(var.id))
+		tst_brk(TBROK, "Kconfig var name \"%s\" too long", confname);
+
+	strcpy(var.id, confname);
+	var.choice = 0;
+	var.val = NULL;
+
+	tst_kconfig_read(&var, 1);
+
+	if (var.choice == 'v')
+		free(var.val);
+
+	return var.choice;
+}
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
