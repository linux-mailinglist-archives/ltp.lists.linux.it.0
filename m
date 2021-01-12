Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C62F2BFE
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 10:58:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B969C3C5DD2
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 10:58:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0A8583C26DD
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 10:58:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C114A200B05
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 10:58:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F89AAB92
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 09:58:00 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 12 Jan 2021 10:57:57 +0100
Message-Id: <20210112095759.11910-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v6 1/3] Add tst_kconfig_get() helper function
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

Changes since v3:
- new patch

Changes since v4:
- moved tst_kconfig_get() declaration to tst_private.h

 include/tst_private.h |  8 ++++++++
 lib/tst_kconfig.c     | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/tst_private.h b/include/tst_private.h
index e30d34740..fe0955f3b 100644
--- a/include/tst_private.h
+++ b/include/tst_private.h
@@ -29,4 +29,12 @@ void tst_print_svar_change(const char *name, const char *val);
 
 int tst_get_prefix(const char *ip_str, int is_ipv6);
 
+/*
+ * Checks kernel config for a single configuration option and returns its
+ * state if found. The possible return values are the same as for
+ * tst_kconfig_var.choice, with the same meaning. See tst_kconfig_read()
+ * description in tst_kconfig.h.
+ */
+char tst_kconfig_get(const char *confname);
+
 #endif
diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
index 734039e37..2b1087a8d 100644
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
