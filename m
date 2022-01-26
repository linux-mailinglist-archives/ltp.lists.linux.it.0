Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C159349CFF1
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jan 2022 17:47:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51F5E3C972B
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jan 2022 17:47:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EAA683C93DA
 for <ltp@lists.linux.it>; Wed, 26 Jan 2022 17:47:09 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 61F0D2000D9
 for <ltp@lists.linux.it>; Wed, 26 Jan 2022 17:47:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4C16521116;
 Wed, 26 Jan 2022 16:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643215628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DOnOE2l/YBzQQ9/nQWo6CVh0K25jYP2ECnOTX316dKs=;
 b=H0oiVi3FgFzjT++Gqllks4ssH2mguwkmR/Aw8Nz95GfAdwWX8EWsbuRtGcBzApG6dtymYg
 o/3dBACmlOfkd9YUdbMm3cnP7aC5uyWzm6FCpPGWj7Ojxgzguju4xBNVblXwtTESQoe7bY
 YPET3XyBLIaOsZ7yXnb74Av7uGdatWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643215628;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DOnOE2l/YBzQQ9/nQWo6CVh0K25jYP2ECnOTX316dKs=;
 b=KmoLOwWQpyTTYnBSNdDdE+NIaGnjUWbUWVDGjNnwjNsOJ0eLVvM0grmTme7AHBAjODipfD
 ggXL1J+3jD2yD3BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BD4813E2B;
 Wed, 26 Jan 2022 16:47:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rlp9Awx78WE5SwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 26 Jan 2022 16:47:08 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 26 Jan 2022 17:47:03 +0100
Message-Id: <20220126164703.7177-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] Fix tst_mkfs_ doc
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/old/test.h | 3 ++-
 include/tst_mkfs.h | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/old/test.h b/include/old/test.h
index 2ae7dba71f..87287a8e7e 100644
--- a/include/old/test.h
+++ b/include/old/test.h
@@ -193,7 +193,8 @@ int self_exec(const char *argv0, const char *fmt, ...);
  * @dev: path to a device
  * @fs_type: filesystem type
  * @fs_opts: NULL or NULL terminated array of mkfs options
- * @extra_opt: extra mkfs option which is passed after the device name
+ * @extra_opts: NULL or NULL terminated array of extra mkfs options which is
+ * passed after the device name.
  */
 #define tst_mkfs(cleanup, dev, fs_type, fs_opts, extra_opts) \
 	tst_mkfs_(__FILE__, __LINE__, cleanup, dev, fs_type, \
diff --git a/include/tst_mkfs.h b/include/tst_mkfs.h
index b89bf812f6..c2d777facd 100644
--- a/include/tst_mkfs.h
+++ b/include/tst_mkfs.h
@@ -9,7 +9,8 @@
  * @dev: path to a device
  * @fs_type: filesystem type
  * @fs_opts: NULL or NULL terminated array of extra mkfs options
- * @extra_opts: NULL or NULL terminated array of extra mkfs options
+ * @extra_opts: NULL or NULL terminated array of extra mkfs options which is
+ * passed after the device name.
  */
 void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 	       const char *dev, const char *fs_type,
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
