Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5DC6B7936
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Mar 2023 14:41:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 265BD3CAE69
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Mar 2023 14:41:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F04E33C01AA
 for <ltp@lists.linux.it>; Mon, 13 Mar 2023 14:41:53 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 74BA6140075B
 for <ltp@lists.linux.it>; Mon, 13 Mar 2023 14:41:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 64C231FE07;
 Mon, 13 Mar 2023 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1678714912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uL0zP8PTvDh92v5NNRtObg7HknED9XUWBU9VfJBeMSU=;
 b=ASatHfzkdob/LBB30hwYK0cZICRGfnWznIw0L3fNkBkhWKVl0gZJwf8gt8Hc7gvtvCkcHY
 g8MTnrO/TuVNbPCB8dCpHtg2ea3ViZX6IrcDoVtWAuYsR+0jk9WASaqIzyiVbviTaKhKuw
 TtbUgxMrOQCJZp0BeVxFhtgDow55eGk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4FBE513517;
 Mon, 13 Mar 2023 13:41:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k74iBB8oD2SzMAAAMHmgww
 (envelope-from <wegao@suse.com>); Mon, 13 Mar 2023 13:41:51 +0000
To: ltp@lists.linux.it
Date: Mon, 13 Mar 2023 09:41:33 -0400
Message-Id: <20230313134133.8396-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230312004420.16457-1-wegao@suse.com>
References: <20230312004420.16457-1-wegao@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4] madvise11.c:Check loadable module before rmmod
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Following fail msg will popup if we try to rmmod buildin module:
rmmod: ERROR: Module hwpoison_inject is builtin

So need add extra check.

Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/syscalls/madvise/madvise11.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/madvise/madvise11.c b/testcases/kernel/syscalls/madvise/madvise11.c
index 7e291d571..7c0bef157 100644
--- a/testcases/kernel/syscalls/madvise/madvise11.c
+++ b/testcases/kernel/syscalls/madvise/madvise11.c
@@ -300,12 +300,12 @@ static int open_unpoison_pfn(void)
 	struct mntent *mnt;
 	FILE *mntf;
 
-	if (!find_in_file("/proc/modules", HW_MODULE))
-		hwpoison_probe = 1;
-
 	/* probe hwpoison only if it isn't already there */
-	if (hwpoison_probe)
+	if (!find_in_file("/proc/modules", HW_MODULE)) {
 		SAFE_CMD(cmd_modprobe, NULL, NULL);
+		if (find_in_file("/proc/modules", HW_MODULE))
+			hwpoison_probe = 1;
+	}
 
 	/* debugfs mount point */
 	mntf = setmntent("/etc/mtab", "r");
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
