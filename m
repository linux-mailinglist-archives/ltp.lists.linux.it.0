Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C3E3839EE
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:31:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F3343C5747
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:31:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A0D2F3C19F0
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2E0A8140076E
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621269039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/v6wV4KvMHnI7BClH6svDXuC/0kOASHvues2JmygMW8=;
 b=mKOw0uo5O1JRUEOIlLnDzyBsctaD2UrDUsQDRHBnuZgXRFwFmu8Xf9VZIGVsKhzeS8+HhW
 mg4lLNINTHuhTxsHC+sizGgjD5Ced/dGRvJ7ndVobvrJJNPzd/GoRpALT2XEh6UEBb/1Hu
 S4OuKDzgApDwKGpEgK9UMuIWnQCrX44=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BECB1B268;
 Mon, 17 May 2021 16:30:39 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 17 May 2021 17:30:27 +0100
Message-Id: <20210517163029.22974-5-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517163029.22974-1-rpalethorpe@suse.com>
References: <20210517163029.22974-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 4/6] API: add tst_ to mount_overlay
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/safe_file_ops_fn.h  | 3 +--
 include/tst_safe_file_ops.h | 4 ++--
 lib/tst_fs_setup.c          | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/safe_file_ops_fn.h b/include/safe_file_ops_fn.h
index 620e12e9a..e1ace0ae2 100644
--- a/include/safe_file_ops_fn.h
+++ b/include/safe_file_ops_fn.h
@@ -87,7 +87,6 @@ int safe_touch(const char *file, const int lineno,
 		mode_t mode, const struct timespec times[2]);
 
 /* helper functions to setup overlayfs mountpoint */
-void create_overlay_dirs(void);
-int mount_overlay(const char *file, const int lineno, int skip);
+int tst_mount_overlay(const char *file, const int lineno, int skip);
 
 #endif /* SAFE_FILE_OPS_FN */
diff --git a/include/tst_safe_file_ops.h b/include/tst_safe_file_ops.h
index 7457edd61..6b078b16c 100644
--- a/include/tst_safe_file_ops.h
+++ b/include/tst_safe_file_ops.h
@@ -52,9 +52,9 @@
 			(pathname), (mode), (times))
 
 #define SAFE_MOUNT_OVERLAY() \
-	((void) mount_overlay(__FILE__, __LINE__, 1))
+	((void) tst_mount_overlay(__FILE__, __LINE__, 1))
 
 #define TST_MOUNT_OVERLAY() \
-	(mount_overlay(__FILE__, __LINE__, 0) == 0)
+	(tst_mount_overlay(__FILE__, __LINE__, 0) == 0)
 
 #endif /* TST_SAFE_FILE_OPS */
diff --git a/lib/tst_fs_setup.c b/lib/tst_fs_setup.c
index b20fd06f2..8b0a343b7 100644
--- a/lib/tst_fs_setup.c
+++ b/lib/tst_fs_setup.c
@@ -24,7 +24,7 @@ static void create_overlay_dirs(void)
 	closedir(dir);
 }
 
-int mount_overlay(const char *file, const int lineno, int skip)
+int tst_mount_overlay(const char *file, const int lineno, int skip)
 {
 	int ret;
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
