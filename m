Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C7C3FB6D9
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 15:17:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A570C3C2BA8
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 15:17:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B9DB13C2AD2
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 15:17:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CB2846002E3
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 15:17:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 07A4C200A0
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630329451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TtnwMkrlh8HhJK1nxdnShdF+jg4MKV0Fwb1fY+4GEvA=;
 b=nniRq9nSkVFcBldx1HFLW7Ahe8WO41FTFzdjFhX/PfAkx/sqmkNSqyL0BVHh6wkYpLjR19
 Va6LARwahpBG0gQVsXrEhDXkJttd+C+kbiJ5NqAp1acaUiI7BFJTmweRX88OmDRKrS6q3/
 PF4+pa0CfHXVR2PWDV3KdU8sByQz26o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630329451;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TtnwMkrlh8HhJK1nxdnShdF+jg4MKV0Fwb1fY+4GEvA=;
 b=XkmlwvAFwxhRQmeQhsTXjqk+3wA87m7nDEnLBdzQjN9uKrJkg4u4wS/R0SZgWSRhjPEtio
 k5Dmo6i6xqAI+KBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8BE813A98
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:17:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xRenN2raLGGCIAAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:17:30 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 30 Aug 2021 15:17:29 +0200
Message-Id: <20210830131730.31935-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Add verbose setup to creat08, creat09 and open10
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

These tests are sensitive to proper UID/GID configuration so print
the detected values for debugging purposes in case of test failure.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 lib/tst_uid.c                             | 5 ++++-
 testcases/kernel/syscalls/creat/creat08.c | 2 ++
 testcases/kernel/syscalls/creat/creat09.c | 2 ++
 testcases/kernel/syscalls/open/open10.c   | 2 ++
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/lib/tst_uid.c b/lib/tst_uid.c
index a73cafa46..2163b1494 100644
--- a/lib/tst_uid.c
+++ b/lib/tst_uid.c
@@ -23,8 +23,11 @@ gid_t tst_get_free_gid_(const char *file, const int lineno, gid_t skip)
 		if (ret == skip || getgrgid(ret))
 			continue;
 
-		if (errno == 0 || errno == ENOENT || errno == ESRCH)
+		if (errno == 0 || errno == ENOENT || errno == ESRCH) {
+			tst_res_(file, lineno, TINFO | TERRNO,
+				"Found unused GID %d", (int)ret);
 			return ret;
+		}
 
 		tst_brk_(file, lineno, TBROK|TERRNO, "Group ID lookup failed");
 		return (gid_t)-1;
diff --git a/testcases/kernel/syscalls/creat/creat08.c b/testcases/kernel/syscalls/creat/creat08.c
index 4392f198a..91581dbf8 100644
--- a/testcases/kernel/syscalls/creat/creat08.c
+++ b/testcases/kernel/syscalls/creat/creat08.c
@@ -41,6 +41,8 @@ static void setup(void)
 	orig_uid = getuid();
 	nobody_uid = ltpuser->pw_uid;
 	nobody_gid = ltpuser->pw_gid;
+	tst_res(TINFO, "User nobody: uid = %d, gid = %d", (int)nobody_uid,
+		(int)nobody_gid);
 	free_gid = tst_get_free_gid(nobody_gid);
 	tmpdir = tst_get_tmpdir();
 }
diff --git a/testcases/kernel/syscalls/creat/creat09.c b/testcases/kernel/syscalls/creat/creat09.c
index 1de16d636..53ab202c1 100644
--- a/testcases/kernel/syscalls/creat/creat09.c
+++ b/testcases/kernel/syscalls/creat/creat09.c
@@ -41,6 +41,8 @@ static void setup(void)
 	struct stat buf;
 	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
 
+	tst_res(TINFO, "User nobody: uid = %d, gid = %d", (int)ltpuser->pw_uid,
+		(int)ltpuser->pw_gid);
 	free_gid = tst_get_free_gid(ltpuser->pw_gid);
 
 	/* Create directories and set permissions */
diff --git a/testcases/kernel/syscalls/open/open10.c b/testcases/kernel/syscalls/open/open10.c
index e3804c74f..d2d3729d2 100644
--- a/testcases/kernel/syscalls/open/open10.c
+++ b/testcases/kernel/syscalls/open/open10.c
@@ -39,6 +39,8 @@ static void setup(void)
 	orig_uid = getuid();
 	nobody_uid = ltpuser->pw_uid;
 	nobody_gid = ltpuser->pw_gid;
+	tst_res(TINFO, "User nobody: uid = %d, gid = %d", (int)nobody_uid,
+		(int)nobody_gid);
 	free_gid = tst_get_free_gid(nobody_gid);
 	tmpdir = tst_get_tmpdir();
 }
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
