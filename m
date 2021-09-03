Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA57400294
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B7F63C9571
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A8DA83C2836
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8D37E200072
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B5F52272C
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630684130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M09ad+WAj4Gas/6XUdSUQhXecAyoA5Dndhq7o1oEUi8=;
 b=zgaOvNJizSJ7P+fMmPGSClYh4fSOdu7Wio0rILEJd89M5atPU38s35W8Ozw9a2hjfUoFhX
 eP7azByULUNktn00COXsfkwDW0JM+AmAfoQ7mwXBttWxgxM4kMvR2o0CSDq5rJqbqbTg//
 iiaOCWnMLypkZ+fzmiQCsmy+o7dwk3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630684130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M09ad+WAj4Gas/6XUdSUQhXecAyoA5Dndhq7o1oEUi8=;
 b=6vrUR0DDmNPAEsgHNfK+r2IKYOdgELZ++eWbpyl3JCB2AhseXp4nIg9+MXt6AIkI/imZiy
 5/I6UKpCh0mdvmBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF7AB13B86
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GGiMOeFDMmHpXgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 15:48:49 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  3 Sep 2021 17:48:44 +0200
Message-Id: <20210903154848.18705-4-mdoucha@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903154848.18705-1-mdoucha@suse.cz>
References: <20210903154848.18705-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/7] Add user/group ID lookup helper functions
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
 include/tst_safe_macros.h |   6 +++
 include/tst_uid.h         |  17 +++++++
 lib/tst_uid.c             | 100 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 6fd618597..0238a5de7 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -625,4 +625,10 @@ int safe_sysinfo(const char *file, const int lineno, struct sysinfo *info);
 #define SAFE_SYSINFO(info) \
 	safe_sysinfo(__FILE__, __LINE__, (info))
 
+struct passwd *safe_getpwent(const char *file, const int lineno);
+#define SAFE_GETPWENT() safe_getpwent(__FILE__, __LINE__)
+
+struct group *safe_getgrent(const char *file, const int lineno);
+#define SAFE_GETGRENT() safe_getgrent(__FILE__, __LINE__)
+
 #endif /* SAFE_MACROS_H__ */
diff --git a/include/tst_uid.h b/include/tst_uid.h
index 7135a9cad..a3bacf64a 100644
--- a/include/tst_uid.h
+++ b/include/tst_uid.h
@@ -15,4 +15,21 @@
 gid_t tst_get_free_gid_(const char *file, const int lineno, gid_t skip);
 #define tst_get_free_gid(skip) tst_get_free_gid_(__FILE__, __LINE__, (skip))
 
+/*
+ * Get a specific number of unique existing non-root user or group IDs.
+ * Multiple calls will return additional results, if any. Both functions call
+ * SAFE_GETPWENT() and SAFE_GETGRENT() respectively.
+ * Call endpwent()/endgrent() after the last use of these functions.
+ * Call setpwent()/setgrent() to read user/group IDs from the beginning again.
+ */
+int tst_get_uids_(const char *file, const int lineno, unsigned int count,
+	uid_t *buf);
+#define tst_get_uids(count, buf) \
+	tst_get_uids_(__FILE__, __LINE__, (count), (buf))
+
+int tst_get_gids_(const char *file, const int lineno, unsigned int count,
+	gid_t *buf);
+#define tst_get_gids(count, buf) \
+	tst_get_gids_(__FILE__, __LINE__, (count), (buf))
+
 #endif /* TST_UID_H_ */
diff --git a/lib/tst_uid.c b/lib/tst_uid.c
index dd719d312..915a5bc34 100644
--- a/lib/tst_uid.c
+++ b/lib/tst_uid.c
@@ -3,8 +3,10 @@
  * Copyright (c) 2021 Linux Test Project
  */
 
+#define _XOPEN_SOURCE 500
 #include <sys/types.h>
 #include <grp.h>
+#include <pwd.h>
 #include <errno.h>
 
 #define TST_NO_DEFAULT_MAIN
@@ -36,3 +38,101 @@ gid_t tst_get_free_gid_(const char *file, const int lineno, gid_t skip)
 	tst_brk_(file, lineno, TBROK, "No free group ID found");
 	return (gid_t)-1;
 }
+
+struct passwd *safe_getpwent(const char *file, const int lineno)
+{
+	struct passwd *ret;
+
+	errno = 0;
+	ret = getpwent();
+
+	if (!ret) {
+		if (errno) {
+			tst_brk_(file, lineno, TBROK | TERRNO,
+				"getpwent() failed");
+		} else {
+			tst_brk_(file, lineno, TBROK,
+				"getpwent() failed: end of file");
+		}
+	}
+
+	return ret;
+}
+
+struct group *safe_getgrent(const char *file, const int lineno)
+{
+	struct group *ret;
+
+	errno = 0;
+	ret = getgrent();
+
+	if (!ret) {
+		if (errno) {
+			tst_brk_(file, lineno, TBROK | TERRNO,
+				"getgrent() failed");
+		} else {
+			tst_brk_(file, lineno, TBROK,
+				"getgrent() failed: end of file");
+		}
+	}
+
+	return ret;
+}
+
+int tst_get_uids_(const char *file, const int lineno, unsigned int count,
+	uid_t *buf)
+{
+	struct passwd *pw;
+	unsigned int i, j;
+
+	for (i = 0; i < count;) {
+		pw = safe_getpwent(file, lineno);
+
+		if (!pw)
+			return -1;
+
+		if (!pw->pw_uid)
+			continue;
+
+		for (j = 0; j < i; j++) {
+			if (buf[j] == pw->pw_uid)
+				break;
+		}
+
+		if (j < i)
+			continue;
+
+		buf[i++] = pw->pw_uid;
+	}
+
+	return 0;
+}
+
+int tst_get_gids_(const char *file, const int lineno, unsigned int count,
+	gid_t *buf)
+{
+	struct group *gr;
+	unsigned int i, j;
+
+	for (i = 0; i < count;) {
+		gr = safe_getgrent(file, lineno);
+
+		if (!gr)
+			return -1;
+
+		if (!gr->gr_gid)
+			continue;
+
+		for (j = 0; j < i; j++) {
+			if (buf[j] == gr->gr_gid)
+				break;
+		}
+
+		if (j < i)
+			continue;
+
+		buf[i++] = gr->gr_gid;
+	}
+
+	return 0;
+}
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
