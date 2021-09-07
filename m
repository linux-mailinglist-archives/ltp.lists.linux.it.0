Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAADD4027C8
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Sep 2021 13:32:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 018C53C2968
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Sep 2021 13:32:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EDDC23C05A0
 for <ltp@lists.linux.it>; Tue,  7 Sep 2021 13:32:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 46ED71A010EA
 for <ltp@lists.linux.it>; Tue,  7 Sep 2021 13:32:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7EC9C220E1
 for <ltp@lists.linux.it>; Tue,  7 Sep 2021 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631014343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4xPlvPv9KjSKx80/s4u9adzU/wvnrSJ1krZVNjz2SaM=;
 b=F3q8xEk3qPJ0vlqpY3cJKqd0VNb0YJAqpymM54rki6OBPaWGKez8vD1Sl3HMOlWsfzJ8FQ
 lwK7qKoNvDfBzrC1VBx36SiAT19gnpMa55ufr6MySk03F1gsJXEtuPxXih808MNRPQz7aN
 13vepKnSstnHyam17lanHpx0eRoFeaI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631014343;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4xPlvPv9KjSKx80/s4u9adzU/wvnrSJ1krZVNjz2SaM=;
 b=bnSO+/dntfSFPqMY9LEmlRR2hc359GYdof5tOehzGpE+uYqBGQO5vbEeG3Jecq8l2iQ5S/
 x8xJiEohWcIYiFBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C91913C59
 for <ltp@lists.linux.it>; Tue,  7 Sep 2021 11:32:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zjhPGcdNN2EyBQAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 07 Sep 2021 11:32:23 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  7 Sep 2021 13:32:18 +0200
Message-Id: <20210907113222.5156-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/5] Add user/group ID lookup helper functions
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

Changes since v1:
- Remove SAFE_GETPWENT() and SAFE_GETGRENT()
- Generate linear sequence of IDs in tst_get_uid/gid() without checking
  whether the UID/GID exists
- Add support for extending partially filled UID/GID buffer in
  tst_get_uid/gid()

 include/tst_uid.h |  9 +++++++++
 lib/tst_uid.c     | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/tst_uid.h b/include/tst_uid.h
index 7135a9cad..b653d0a1e 100644
--- a/include/tst_uid.h
+++ b/include/tst_uid.h
@@ -15,4 +15,13 @@
 gid_t tst_get_free_gid_(const char *file, const int lineno, gid_t skip);
 #define tst_get_free_gid(skip) tst_get_free_gid_(__FILE__, __LINE__, (skip))
 
+/*
+ * Get a specific number of unique existing non-root user or group IDs.
+ * The "start" parameter is the number of buffer entries that are already
+ * filled and will not be modified. The function will fill the remaining
+ * (size-start) entries with unique UID/GID values.
+ */
+void tst_get_uids(uid_t *buf, unsigned int start, unsigned int size);
+void tst_get_gids(gid_t *buf, unsigned int start, unsigned int size);
+
 #endif /* TST_UID_H_ */
diff --git a/lib/tst_uid.c b/lib/tst_uid.c
index dd719d312..08855ba46 100644
--- a/lib/tst_uid.c
+++ b/lib/tst_uid.c
@@ -36,3 +36,35 @@ gid_t tst_get_free_gid_(const char *file, const int lineno, gid_t skip)
 	tst_brk_(file, lineno, TBROK, "No free group ID found");
 	return (gid_t)-1;
 }
+
+void tst_get_uids(uid_t *buf, unsigned int start, unsigned int count)
+{
+	unsigned int i, j;
+	uid_t id;
+
+	for (i = start, id = 1; i < count; id++) {
+		for (j = 0; j < start; j++) {
+			if (buf[j] == id)
+				break;
+		}
+
+		if (j >= start)
+			buf[i++] = id;
+	}
+}
+
+void tst_get_gids(gid_t *buf, unsigned int start, unsigned int count)
+{
+	unsigned int i, j;
+	gid_t id;
+
+	for (i = start, id = 1; i < count; id++) {
+		for (j = 0; j < start; j++) {
+			if (buf[j] == id)
+				break;
+		}
+
+		if (j >= start)
+			buf[i++] = id;
+	}
+}
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
