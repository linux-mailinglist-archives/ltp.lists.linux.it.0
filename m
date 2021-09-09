Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA8A405A6F
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 17:52:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEDC93C92DE
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 17:52:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 245213C8D83
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 17:51:29 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D772A1400514
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 17:51:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B4969201E8
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631202687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqT2Gq8iTLmmkEY35bXUUl9fRQdDOEd+R7YX93xfpBM=;
 b=RnEYKsn7EVdlPYJ7nDVlgFFuObTec8F9PlvE2A2n4b1X/himaLK5nGyOkVcxg36uotNMLh
 L3hLm2QGPZwhAQBi0R2P9zZOTC/OxwPvAJURyxKP3OSmqoHG+c8xQl1oeGvBIrkPyZUPfL
 LwGoxwPihb3IkjK3GIt52ctQmiivrcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631202687;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqT2Gq8iTLmmkEY35bXUUl9fRQdDOEd+R7YX93xfpBM=;
 b=7+uOvc4pHlVAsDccc5ZjCnos71mAajij7ab4KOobi9zEbQD4LdoidBhXd3e0wYXI0b/1H5
 AuCruj6PDEWlSkAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A221E13CC8
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 15:51:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sKGWJn8tOmFZXwAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 09 Sep 2021 15:51:27 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  9 Sep 2021 17:51:21 +0200
Message-Id: <20210909155126.2720-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210909155126.2720-1-mdoucha@suse.cz>
References: <20210909155126.2720-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/8] Add tst_check_resuid() and tst_check_resgid()
 helper functions
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

---
 include/tst_uid.h | 13 ++++++++++++
 lib/tst_uid.c     | 50 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/tst_uid.h b/include/tst_uid.h
index b653d0a1e..e604effce 100644
--- a/include/tst_uid.h
+++ b/include/tst_uid.h
@@ -24,4 +24,17 @@ gid_t tst_get_free_gid_(const char *file, const int lineno, gid_t skip);
 void tst_get_uids(uid_t *buf, unsigned int start, unsigned int size);
 void tst_get_gids(gid_t *buf, unsigned int start, unsigned int size);
 
+/*
+ * Helper functions for checking current proces UIDs/GIDs.
+ */
+int tst_check_resuid_(const char *file, const int lineno, const char *callstr,
+	uid_t exp_ruid, uid_t exp_euid, uid_t exp_suid);
+#define tst_check_resuid(cstr, ruid, euid, suid) \
+	tst_check_resuid_(__FILE__, __LINE__, (cstr), (ruid), (euid), (suid))
+
+int tst_check_resgid_(const char *file, const int lineno, const char *callstr,
+	gid_t exp_rgid, gid_t exp_egid, gid_t exp_sgid);
+#define tst_check_resgid(cstr, rgid, egid, sgid) \
+	tst_check_resgid_(__FILE__, __LINE__, (cstr), (rgid), (egid), (sgid))
+
 #endif /* TST_UID_H_ */
diff --git a/lib/tst_uid.c b/lib/tst_uid.c
index 08855ba46..af4ef8cf7 100644
--- a/lib/tst_uid.c
+++ b/lib/tst_uid.c
@@ -68,3 +68,53 @@ void tst_get_gids(gid_t *buf, unsigned int start, unsigned int count)
 			buf[i++] = id;
 	}
 }
+
+int tst_check_resuid_(const char *file, const int lineno, const char *callstr,
+	uid_t exp_ruid, uid_t exp_euid, uid_t exp_suid)
+{
+	uid_t ruid, euid, suid;
+
+	SAFE_GETRESUID(&ruid, &euid, &suid);
+
+	if (ruid == exp_ruid && euid == exp_euid && suid == exp_suid)
+		return 1;
+
+	if (callstr) {
+		tst_res_(file, lineno, TFAIL, "Unexpected process UID after %s",
+			callstr);
+	} else {
+		tst_res_(file, lineno, TFAIL, "Unexpected process UID");
+	}
+
+	tst_res_(file, lineno, TINFO, "Got: ruid = %d, euid = %d, suid = %d",
+		(int)ruid, (int)euid, (int)suid);
+	tst_res_(file, lineno, TINFO,
+		"Expected: ruid = %d, euid = %d, suid = %d",
+		(int)exp_ruid, (int)exp_euid, (int)exp_suid);
+	return 0;
+}
+
+int tst_check_resgid_(const char *file, const int lineno, const char *callstr,
+	gid_t exp_rgid, gid_t exp_egid, gid_t exp_sgid)
+{
+	gid_t rgid, egid, sgid;
+
+	SAFE_GETRESGID(&rgid, &egid, &sgid);
+
+	if (rgid == exp_rgid && egid == exp_egid && sgid == exp_sgid)
+		return 1;
+
+	if (callstr) {
+		tst_res_(file, lineno, TFAIL, "Unexpected process GID after %s",
+			callstr);
+	} else {
+		tst_res_(file, lineno, TFAIL, "Unexpected process GID");
+	}
+
+	tst_res_(file, lineno, TINFO, "Got: rgid = %d, egid = %d, sgid = %d",
+		(int)rgid, (int)egid, (int)sgid);
+	tst_res_(file, lineno, TINFO,
+		"Expected: rgid = %d, egid = %d, sgid = %d",
+		(int)exp_rgid, (int)exp_egid, (int)exp_sgid);
+	return 0;
+}
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
