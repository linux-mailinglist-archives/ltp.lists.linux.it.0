Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D211415C7E
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 13:05:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 403073CA1D5
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 13:05:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BA9933C85FC
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 13:04:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 949321A0172F
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 13:04:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9DA422350
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632395094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Q+5biW7oQGkOxknDp0FGotUB/iKW+3zUM5nQjXFXHFQ=;
 b=b2xEtPtevD4pbdVP92ZmejoeBwZuintaYKFeEwWcke8Mi83y0kVcc69OcOi45wrEFVesAf
 jd0pomFCVoPsJCeIwVwAL1g3+5ZRvI76w5egVkScoV7Iz2ye8cq8SyF6hNjNqHIIprNlOf
 /IjRyncHn9XVyVPFePf48lWPH0cNz5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632395094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Q+5biW7oQGkOxknDp0FGotUB/iKW+3zUM5nQjXFXHFQ=;
 b=qsBP43PwwTOeVCuYkaNxgjpnNPFdbHtZGYTbc6FoKRRLaD4430bKMMbfmlRV6fM0rw3hpo
 7BgEtz21Ns2wSGBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97F3613DCD
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 11:04:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3F4VJFZfTGHDdQAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 11:04:54 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 23 Sep 2021 13:04:53 +0200
Message-Id: <20210923110453.14038-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/shmget02: Handle missing hugepage support in
 HW
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

When hugepage support is enabled in kernel but hardware support is missing,
the last two test cases in shmget02 will fail because kernel will return
ENOENT. Check hardware support and update expected errnos accordingly.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 .../kernel/syscalls/ipc/shmget/shmget02.c     | 33 +++++++++++++------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
index effd33799..165a34456 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
@@ -63,15 +63,27 @@ static struct tcase {
 	{&shmkey1, SHM_SIZE, IPC_CREAT | SHM_HUGETLB, 0, 0, ENOMEM}
 };
 
-static int hugetlbfs_supported(void)
+static int get_hugetlb_exp_error(void)
 {
+	long tmp;
 	struct tst_kconfig_var kconfig = {
 		.id = CONFIG_HUGETLBFS,
 		.id_len = sizeof(CONFIG_HUGETLBFS)-1,
 	};
 
 	tst_kconfig_read(&kconfig, 1);
-	return kconfig.choice == 'y';
+
+	if (kconfig.choice != 'y') {
+		tst_res(TINFO, "SHM_HUGETLB not supported by kernel");
+		return EINVAL;
+	}
+
+	if (FILE_LINES_SCANF("/proc/meminfo", "Hugepagesize: %ld", &tmp)) {
+		tst_res(TINFO, "Huge pages not supported by hardware");
+		return ENOENT;
+	}
+
+	return 0;
 }
 
 static void do_test(unsigned int n)
@@ -102,22 +114,23 @@ static void do_test(unsigned int n)
 static void setup(void)
 {
 	struct rlimit rl = { 0, 0 };
+	int hugetlb_errno;
+	unsigned int i;
+
 	shmkey = GETIPCKEY();
 	shmkey1 = GETIPCKEY();
 
 	SAFE_SETRLIMIT(RLIMIT_MEMLOCK, &rl);
 	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL);
 	pw = SAFE_GETPWNAM("nobody");
+	hugetlb_errno = get_hugetlb_exp_error();
 
-	if (!hugetlbfs_supported()) {
-		unsigned int i;
-
-		tst_res(TINFO, "SHM_HUGETLB not supported by kernel");
+	if (!hugetlb_errno)
+		return;
 
-		for (i = 0; i < ARRAY_SIZE(tcases); i++) {
-			if (tcases[i].flags & SHM_HUGETLB)
-				tcases[i].exp_err = EINVAL;
-		}
+	for (i = 0; i < ARRAY_SIZE(tcases); i++) {
+		if (tcases[i].flags & SHM_HUGETLB)
+			tcases[i].exp_err = hugetlb_errno;
 	}
 }
 
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
