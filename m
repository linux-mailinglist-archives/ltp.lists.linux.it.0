Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1483E15BC
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 15:32:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DAFE3C7DBF
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 15:32:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B411F3C79C4
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 15:32:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DE0416007A2
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 15:32:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 35CA9223C3
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628170333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H/wtUHXkuAivdGSmwcPIusxcGECE8KEOxKSEHZVPjKU=;
 b=m7mqeOdOvBAmY3g3I82bsrFWqQI6Vl18mcVUJZ/2n3RvmcfmESvvrtwH9GAwszHk+yeXOX
 WclzVHfI+zzYDNZ8VyWRSOACUJfhbDzVNNHoiBR6aaV2wboYjCW+iILXzLsNb6ZyhRIT1V
 WqHPERmimYiYA9QjtdlkzaUpKuAmvJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628170333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H/wtUHXkuAivdGSmwcPIusxcGECE8KEOxKSEHZVPjKU=;
 b=vhoKtoWQy6aoyPs25gq0VnmbNDmPiulIOTfEoNgOoRTxTOJHMOfj1yMxGhPe/bwFgnZhBU
 X4ys3J1PL8nvgYBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2171713D4B
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 13:32:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NWwpB13oC2FbVAAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 05 Aug 2021 13:32:13 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Aug 2021 15:32:22 +0200
Message-Id: <20210805133222.10589-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] lib/tst_test: Fix 'discards const' warning
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 8a6a112ef..1bdea769a 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -882,7 +882,7 @@ static void prepare_and_mount_dev_fs(const char *mntpoint)
 	}
 }
 
-static char *limit_tmpfs_mount_size(const char *mnt_data,
+static const char *limit_tmpfs_mount_size(const char *mnt_data,
 		char *buf, size_t buf_size, const char *fs_type)
 {
 	if (strcmp(fs_type, "tmpfs"))
@@ -908,7 +908,8 @@ static const char *get_device_name(const char *fs_type)
 
 static void prepare_device(void)
 {
-	char *mnt_data, buf[1024];
+	const char *mnt_data;
+	char buf[1024];
 
 	if (tst_test->format_device) {
 		SAFE_MKFS(tdev.dev, tdev.fs_type, tst_test->dev_fs_opts,
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
