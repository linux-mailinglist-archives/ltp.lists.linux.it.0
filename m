Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 75617589BA1
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Aug 2022 14:22:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 389033C9428
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Aug 2022 14:22:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 933FE3C885D
 for <ltp@lists.linux.it>; Thu,  4 Aug 2022 14:21:55 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DA73D600634
 for <ltp@lists.linux.it>; Thu,  4 Aug 2022 14:21:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E76BA33F39;
 Thu,  4 Aug 2022 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659615594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6wTkL4sVOgFonza2ilqiafwUZP2ShFRVfW6fSFyrWIA=;
 b=ieFcMMWfeqCLJ5k6wz3WF1DB72WLVmo4KFWGdjsA8vnbU1aU+NdiefWD2OIw5kIHUWaaw1
 I2dTjAfkwJKPKkMq2UOn7RlgWIOdGSkUeLfC67GBN1IUVlJKmgaIt9sWSXMZgIN8BC+gvY
 hOUcGn9Xvbv43aT5b3a8wJHqX7IPD40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659615594;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6wTkL4sVOgFonza2ilqiafwUZP2ShFRVfW6fSFyrWIA=;
 b=WYNKf+Imx0d7VIH5X3sfhsJsBEk+Lj0IZs95Tq4qltu00gTHxWH/ZTPXRlAO3gZxqAnYdy
 fZBsYkAH3R8f1VCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11C9A13A94;
 Thu,  4 Aug 2022 12:19:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SOJ/AGq562L2PQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 04 Aug 2022 12:19:54 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  4 Aug 2022 14:19:42 +0200
Message-Id: <20220804121946.19564-7-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804121946.19564-1-pvorel@suse.cz>
References: <20220804121946.19564-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 06/10] tst_supported_fs: Support skip list when
 query single fs
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
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v3

 include/tst_fs.h                 | 10 ++++++++++
 lib/tst_supported_fs_types.c     | 18 ++++++++++++++++++
 testcases/lib/tst_supported_fs.c |  2 +-
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/include/tst_fs.h b/include/tst_fs.h
index 8159b99eb..2fe97f174 100644
--- a/include/tst_fs.h
+++ b/include/tst_fs.h
@@ -182,6 +182,16 @@ enum tst_fs_impl {
  */
 enum tst_fs_impl tst_fs_is_supported(const char *fs_type);
 
+/*
+ * Check filesystem support (@see tst_fs_is_supported()), but consider also
+ * filesystems to skip.
+ *
+ * @fs_type A filesystem name to check the support for.
+ * @skiplist A NULL terminated array of filesystems to skip.
+ */
+enum tst_fs_impl tst_fs_is_supported_skiplist(const char *fs_type, const char
+					      *const *skiplist);
+
 /*
  * Returns NULL-terminated array of kernel-supported filesystems.
  *
diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
index 9726d193a..8c9379c1b 100644
--- a/lib/tst_supported_fs_types.c
+++ b/lib/tst_supported_fs_types.c
@@ -134,6 +134,24 @@ enum tst_fs_impl tst_fs_is_supported(const char *fs_type)
 	return TST_FS_UNSUPPORTED;
 }
 
+enum tst_fs_impl tst_fs_is_supported_skiplist(const char *fs_type, const char
+					      *const *skiplist)
+{
+	int ret;
+
+	ret = tst_fs_is_supported(fs_type);
+
+	if (!ret)
+		return ret;
+
+	if (tst_fs_in_skiplist(fs_type, skiplist)) {
+		tst_brk(TCONF, "%s is not supported by the test",
+			fs_type);
+	}
+
+	return ret;
+}
+
 const char **tst_get_supported_fs_types(const char *const *skiplist)
 {
 	unsigned int i, j = 0;
diff --git a/testcases/lib/tst_supported_fs.c b/testcases/lib/tst_supported_fs.c
index 87be2b759..75945c809 100644
--- a/testcases/lib/tst_supported_fs.c
+++ b/testcases/lib/tst_supported_fs.c
@@ -70,7 +70,7 @@ int main(int argc, char *argv[])
 	}
 
 	if (optind < argc)
-		return !tst_fs_is_supported(argv[optind]);
+		return !tst_fs_is_supported_skiplist(argv[optind], (const char * const*)skiplist);
 
 	filesystems = tst_get_supported_fs_types((const char * const*)skiplist);
 	for (i = 0; filesystems[i]; i++)
-- 
2.37.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
