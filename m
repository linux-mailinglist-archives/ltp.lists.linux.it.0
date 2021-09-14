Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6674640B26C
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 17:02:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7D523C9243
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 17:02:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB2733C1D8B
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 17:02:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AFE2D1A00FB8
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 17:02:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A9A141FDFE
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631631719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fcxa6xkok6yCmf6dlR8kLdNjXBbO+JyMy+kQ6NqJZHc=;
 b=NEVZql4IsAyoi26kbM2YJhbMH9ZJqOFyOL6JaugZ3/Fc7O2h/NkJjhu9EKGl5lSanfO4O6
 83eks2guv/ZT+2f6TUj3/jj0LhcZPJrcpJUfIbzB7Shm4R2GP4as3yBK6DU+76t+Rv58IU
 N8P55OINbmLTevmGrne/JkdPWkuEoag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631631719;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fcxa6xkok6yCmf6dlR8kLdNjXBbO+JyMy+kQ6NqJZHc=;
 b=iyRKkVTp4oLCOU7qWpOjIAB1Kyav1ZzlmY5Xs/GTP8S6VrFAL+38R9ygPUJ/SrLy9wq/VS
 gVtqe3n1CneKmkDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 938E213C15
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 15:01:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XiAHI2e5QGFBCAAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 15:01:59 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 14 Sep 2021 17:02:20 +0200
Message-Id: <20210914150220.2467-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] lib: tst_virt: Add option to override virt detection
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

There seems to be cases where systemd-detect-virt does not detect
virtualization correctly. To work around this bugs this commit adds a
a support for LTP_VIRT_OVERRIDE environment variable that if set is used
instead of the output from the systemd-detect-virt command.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_virt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/lib/tst_virt.c b/lib/tst_virt.c
index d23d7f564..0fda20a17 100644
--- a/lib/tst_virt.c
+++ b/lib/tst_virt.c
@@ -100,8 +100,18 @@ static int is_ibmz(int virt_type)
 static int try_systemd_detect_virt(void)
 {
 	FILE *f;
-	char virt_type[64];
+	char virt_buf[64];
 	int ret;
+	char *virt_type = getenv("LTP_VIRT_OVERRIDE");
+
+	if (virt_type) {
+		if (!strcmp("", virt_type))
+			return 0;
+
+		goto cmp;
+	}
+
+	virt_type = virt_buf;
 
 	/* See tst_cmd.c */
 	void *old_handler = signal(SIGCHLD, SIG_DFL);
@@ -129,6 +139,7 @@ static int try_systemd_detect_virt(void)
 	if (ret)
 		return 0;
 
+cmp:
 	if (!strncmp("kvm", virt_type, 3))
 		return VIRT_KVM;
 
-- 
2.26.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
