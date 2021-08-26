Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2E23F864C
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 13:22:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE8823C2F29
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 13:22:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 044273C2304
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 13:22:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6C7171400767
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 13:22:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 98E91222CC
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629976933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EtXmMpKipmtFJiBKknuU00/DZMhCjJcfzleUyDFi1eA=;
 b=MgMgoJ7YKVR1CRgJIHAXcm8Up1b4SzgkrWr8uGRvEFKiHc1xDWDPMyS3c+zNgpWSfg7hUB
 kKAWDduNtFtV7LIDknTE3Oe6gvPnvuf69HIQ6VK8mLTTrD/IIc557mM/kAp+eYtgTStWrZ
 UF5F76e2dnt/1hxotgrGgjscBApvZJc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629976933;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EtXmMpKipmtFJiBKknuU00/DZMhCjJcfzleUyDFi1eA=;
 b=aiK2cqZDm2QoalUx6NkqhmzxWT8RepHNQZY2E6HJRu50wB1j5n2SSrtKIdBJd5pzS18o6p
 ItJdVNY3iP9gcJCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86885133A4
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:22:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b0q5H2V5J2FEPgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:22:13 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 26 Aug 2021 13:22:09 +0200
Message-Id: <20210826112212.26394-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] Add tst_get_free_gid() helper function to LTP
 library
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

Changes since v1: New patch

The man page does not say anything about how setgroups() interacts with
setuid()/setgid() so I've decided to use any unassigned gid for the non-member
setgid subtests.

 include/tst_uid.h | 18 ++++++++++++++++++
 lib/tst_uid.c     | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 include/tst_uid.h
 create mode 100644 lib/tst_uid.c

diff --git a/include/tst_uid.h b/include/tst_uid.h
new file mode 100644
index 000000000..7135a9cad
--- /dev/null
+++ b/include/tst_uid.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) 2021 Linux Test Project
+ */
+
+#ifndef TST_UID_H_
+#define TST_UID_H_
+
+#include <sys/types.h>
+
+/*
+ * Find unassigned gid. The skip argument can be used to ignore e.g. the main
+ * group of a specific user in case it's not listed in the group file. If you
+ * do not need to skip any specific gid, simply set it to 0.
+ */
+gid_t tst_get_free_gid_(const char *file, const int lineno, gid_t skip);
+#define tst_get_free_gid(skip) tst_get_free_gid_(__FILE__, __LINE__, (skip))
+
+#endif /* TST_UID_H_ */
diff --git a/lib/tst_uid.c b/lib/tst_uid.c
new file mode 100644
index 000000000..a73cafa46
--- /dev/null
+++ b/lib/tst_uid.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Linux Test Project
+ */
+
+#include <sys/types.h>
+#include <grp.h>
+#include <errno.h>
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+#include "tst_uid.h"
+
+#define MAX_GID 32767
+
+gid_t tst_get_free_gid_(const char *file, const int lineno, gid_t skip)
+{
+	gid_t ret;
+
+	errno = 0;
+
+	for (ret = 0; ret < MAX_GID; ret++) {
+		if (ret == skip || getgrgid(ret))
+			continue;
+
+		if (errno == 0 || errno == ENOENT || errno == ESRCH)
+			return ret;
+
+		tst_brk_(file, lineno, TBROK|TERRNO, "Group ID lookup failed");
+		return (gid_t)-1;
+	}
+
+	tst_brk_(file, lineno, TBROK, "No free group ID found");
+	return (gid_t)-1;
+}
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
