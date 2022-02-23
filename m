Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A554C16E2
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Feb 2022 16:33:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69CA13C984E
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Feb 2022 16:33:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0C3213C97E3
 for <ltp@lists.linux.it>; Wed, 23 Feb 2022 16:32:58 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 57C1660233B
 for <ltp@lists.linux.it>; Wed, 23 Feb 2022 16:32:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04722212BE;
 Wed, 23 Feb 2022 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645630378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=naCIqwEGKuKi1e9YaE4P0t448RSSA25dv2Cr0zZPYAc=;
 b=0cl9iRQHi0u0nLvggDzTsyoxAzlL8pWGZmJ2lF+Uq0hgfpmHgBk4KAUeibbxwuznHZkfBg
 G5N4IKKt/Ju/7ikzylKvwKQkydOvICRCoS0MuYkfyPTMHmk/OroaFiApgWQTQSIX/dkDXx
 Gg7D2xOI1nXSgQo2whUo/hOKszsT58U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645630378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=naCIqwEGKuKi1e9YaE4P0t448RSSA25dv2Cr0zZPYAc=;
 b=UQdbwP34nWrsg2E+iM87vTcRmBsN7eg4wFlqs5SvqO/u8NTaqmHV5dKrFZWAITC2r5Kj44
 Jfl+HbAvSPHop/DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B373113D88;
 Wed, 23 Feb 2022 15:32:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kJBfKqlTFmKZawAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 23 Feb 2022 15:32:57 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 23 Feb 2022 16:32:43 +0100
Message-Id: <20220223153243.317-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223153243.317-1-pvorel@suse.cz>
References: <20220223153243.317-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] quotactl09: Use do_mount()
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

to change:
quotactl08.c:160: TBROK: mount(/dev/loop0, mntpoint, ext4, 0, (nil)) failed: ESRCH (3)

to TCONF if FS quota is not supported (the same fix as 4aab31e4c7).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/quotactl/quotactl09.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl09.c b/testcases/kernel/syscalls/quotactl/quotactl09.c
index 8b959909ca..57030f7d2e 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl09.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl09.c
@@ -32,7 +32,7 @@
 #define OPTION_INVALID 999
 
 static int32_t fmt_id = QFMT_VFS_V1;
-static int test_id;
+static int test_id, mount_flag;
 static int getnextquota_nsup, socket_fd = -1;
 
 static struct if_nextdqblk res_ndq;
@@ -144,6 +144,12 @@ static void setup(void)
 {
 	unsigned int i;
 
+	if (!tst_variant)
+		SAFE_MKDIR(MNTPOINT, 0777);
+
+	do_mount(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, NULL);
+	mount_flag = 1;
+
 	quotactl_info();
 
 	socket_fd = SAFE_SOCKET(PF_INET, SOCK_STREAM, 0);
@@ -163,8 +169,12 @@ static void cleanup(void)
 {
 	if (fd > -1)
 		SAFE_CLOSE(fd);
+
 	if (socket_fd > -1)
 		SAFE_CLOSE(socket_fd);
+
+	if (mount_flag && tst_umount(MNTPOINT))
+		tst_res(TWARN | TERRNO, "umount(%s)", MNTPOINT);
 }
 
 static struct tst_test test = {
@@ -178,8 +188,8 @@ static struct tst_test test = {
 	.test = verify_quotactl,
 	.dev_fs_opts = (const char *const[]){"-O quota", NULL},
 	.dev_fs_type = "ext4",
-	.mntpoint = MNTPOINT,
-	.mount_device = 1,
+	//.mntpoint = MNTPOINT,
+	.format_device = 1,
 	.needs_root = 1,
 	.test_variants = QUOTACTL_SYSCALL_VARIANTS,
 	.needs_cmds = (const char *[]) {
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
