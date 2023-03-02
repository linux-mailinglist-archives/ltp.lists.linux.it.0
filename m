Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A336A7925
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Mar 2023 02:45:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BED13CDD71
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Mar 2023 02:45:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4D73F3CBAF0
 for <ltp@lists.linux.it>; Thu,  2 Mar 2023 02:45:34 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 44D821000DF3
 for <ltp@lists.linux.it>; Thu,  2 Mar 2023 02:45:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D750F1FE5E;
 Thu,  2 Mar 2023 01:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1677721531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LJozvUC644rfRPme6pOeSD92fTBB0gsMvsB7H3HrCw=;
 b=VF758w8nzf8IpBb+h8ErnamE+uPjDKnjtegAoNeE9aCLAKWSptSmYvaM6PFsqzgxNgZ3PO
 44gvKE2i2mxQMfnuX0gN/sWhnfZqzErHbMerPHJoET/9FamWzpgvlJ/ue13t2I6WHi4n5K
 3JGittRCMXEA/t0omOZDL2KHSPZGy0A=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C6EFE13A63;
 Thu,  2 Mar 2023 01:45:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PXe2J7r//2P2dgAAMHmgww
 (envelope-from <wegao@suse.com>); Thu, 02 Mar 2023 01:45:30 +0000
To: ltp@lists.linux.it
Date: Wed,  1 Mar 2023 20:45:19 -0500
Message-Id: <20230302014519.31512-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230228032745.16595-1-wegao@suse.com>
References: <20230228032745.16595-1-wegao@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v7] fsconfig03: SKIP check return value for old kernel
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
Cc: kernel-qa@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Wei Gao <wegao@suse.com>
---
 .../kernel/syscalls/fsconfig/fsconfig03.c     | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig03.c b/testcases/kernel/syscalls/fsconfig/fsconfig03.c
index 7ee37f4ae..9adf06207 100644
--- a/testcases/kernel/syscalls/fsconfig/fsconfig03.c
+++ b/testcases/kernel/syscalls/fsconfig/fsconfig03.c
@@ -41,15 +41,20 @@ static void run(void)
 	if (pagesize == -1)
 		tst_brk(TBROK, "sysconf(_SC_PAGESIZE) failed");
 
-	for (size_t i = 0; i < 5000; i++) {
-		/* use same logic in kernel legacy_parse_param function */
-		const size_t len = i * (strlen(val) + 2) + (strlen(val) + 1) + 2;
+	if ((tst_kvercmp(5, 17, 1)) >= 0) {
+		for (size_t i = 0; i < 5000; i++) {
+			/* use same logic in kernel legacy_parse_param function */
+			const size_t len = i * (strlen(val) + 2) + (strlen(val) + 1) + 2;
 
-		if (!strcmp(tst_device->fs_type, "btrfs") && len <= (size_t)pagesize)
-			TST_EXP_PASS_SILENT(fsconfig(fd, FSCONFIG_SET_STRING, "\x00", val, 0));
-		else
-			TST_EXP_FAIL_SILENT(fsconfig(fd, FSCONFIG_SET_STRING, "\x00", val, 0),
-					    EINVAL);
+			if (!strcmp(tst_device->fs_type, "btrfs") && len <= (size_t)pagesize)
+				TST_EXP_PASS_SILENT(fsconfig(fd, FSCONFIG_SET_STRING, "\x00", val, 0));
+			else
+				TST_EXP_FAIL_SILENT(fsconfig(fd, FSCONFIG_SET_STRING, "\x00", val, 0),
+						EINVAL);
+		}
+	} else {
+		for (size_t i = 0; i < 5000; i++)
+			fsconfig(fd, FSCONFIG_SET_STRING, "\x00", val, 0);
 	}
 
 	if (fd != -1)
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
