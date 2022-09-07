Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5515B0203
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Sep 2022 12:41:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D65833CA96B
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Sep 2022 12:41:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AE4853C02C2
 for <ltp@lists.linux.it>; Wed,  7 Sep 2022 12:41:44 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 47AC1200C37
 for <ltp@lists.linux.it>; Wed,  7 Sep 2022 12:41:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FFC033CB2;
 Wed,  7 Sep 2022 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662547301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tNOSJsNtGE98PejowdyXh8zNF5Qm+MmISEIy/Ch4jPw=;
 b=kXDEPt5KLshb94+AdAwc88s43rmCJz+Dy8HTw4oGVvwWDyWXDCVHbOA3Pbv18+omKh0Xq4
 8ofY8k1U0hfjB9O7+E1uAM4ygcUC39rylEyWN9JmpA7GuELIenwmK2I5A6e1fb2/VqXxpB
 EGhM1mAfoQT9+KgKyjklO8NLsRRnbwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662547301;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tNOSJsNtGE98PejowdyXh8zNF5Qm+MmISEIy/Ch4jPw=;
 b=QMxBMZUlhRnIRiQqbDugOXzKvn1k6omeg9soHUS8RfmtrgfMJAWDX5wTpJzLzKy33kjeCi
 J+dwNiHHrYCDq+CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A00E13A66;
 Wed,  7 Sep 2022 10:41:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Deb6BGV1GGMiTwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 07 Sep 2022 10:41:41 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  7 Sep 2022 12:41:17 +0200
Message-Id: <20220907104117.23136-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] fanotify.h: Keep checkpatch.pl happy
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
Cc: Jan Kara <jack@suse.cz>, Matthew Bobrowski <repnop@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Fixed all relevant warnings. There are still some warnings, but these
are false positives (kernel specific, LTP should not check for them).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/fanotify/fanotify.h | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index ddd365cff..ff2b4a70a 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * Copyright (c) 2012-2020 Linux Test Project.  All Rights Reserved.
  * Author: Jan Kara, November 2013
@@ -86,7 +86,7 @@ static inline int safe_fanotify_mark(const char *file, const int lineno,
 #ifndef FAN_REPORT_TARGET_FID
 #define FAN_REPORT_TARGET_FID	0x00001000
 #define FAN_REPORT_DFID_NAME_TARGET (FAN_REPORT_DFID_NAME | \
-                                     FAN_REPORT_FID | FAN_REPORT_TARGET_FID)
+				     FAN_REPORT_FID | FAN_REPORT_TARGET_FID)
 #endif
 
 /* Non-uapi convenience macros */
@@ -187,12 +187,12 @@ static inline int safe_fanotify_mark(const char *file, const int lineno,
 
 struct fanotify_group_type {
 	unsigned int flag;
-	const char * name;
+	const char *name;
 };
 
 struct fanotify_mark_type {
 	unsigned int flag;
-	const char * name;
+	const char *name;
 };
 
 #ifndef __kernel_fsid_t
@@ -428,15 +428,13 @@ static inline void fanotify_init_flags_err_msg(const char *flags_str,
 #define FANOTIFY_INIT_FLAGS_ERR_MSG(flags, fail) \
 	fanotify_init_flags_err_msg(#flags, __FILE__, __LINE__, tst_res_, (fail))
 
-#define REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(flags, fname) do { \
+#define REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(flags, fname) \
 	fanotify_init_flags_err_msg(#flags, __FILE__, __LINE__, tst_brk_, \
-		fanotify_init_flags_supported_on_fs(flags, fname)); \
-	} while (0)
+		fanotify_init_flags_supported_on_fs(flags, fname))
 
-#define REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_BY_KERNEL(flags) do { \
+#define REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_BY_KERNEL(flags) \
 	fanotify_init_flags_err_msg(#flags, __FILE__, __LINE__, tst_brk_, \
-		fanotify_init_flags_supported_by_kernel(flags)); \
-	} while (0)
+		fanotify_init_flags_supported_by_kernel(flags))
 
 static inline int fanotify_mark_supported_by_kernel(uint64_t flag)
 {
@@ -459,10 +457,9 @@ static inline int fanotify_mark_supported_by_kernel(uint64_t flag)
 	return rval;
 }
 
-#define REQUIRE_MARK_TYPE_SUPPORTED_BY_KERNEL(mark_type) do { \
+#define REQUIRE_MARK_TYPE_SUPPORTED_BY_KERNEL(mark_type) \
 	fanotify_init_flags_err_msg(#mark_type, __FILE__, __LINE__, tst_brk_, \
-				    fanotify_mark_supported_by_kernel(mark_type)); \
-} while (0)
+				    fanotify_mark_supported_by_kernel(mark_type))
 
 #define REQUIRE_FANOTIFY_EVENTS_SUPPORTED_ON_FS(init_flags, mark_type, mask, fname) do { \
 	if (mark_type)							\
-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
