Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B145BB0E1
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Sep 2022 18:07:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A54D3CAC7A
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Sep 2022 18:07:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 700FF3CA7AF
 for <ltp@lists.linux.it>; Fri, 16 Sep 2022 18:07:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BAE5810000C0
 for <ltp@lists.linux.it>; Fri, 16 Sep 2022 18:07:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B5CE421C48
 for <ltp@lists.linux.it>; Fri, 16 Sep 2022 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663344447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YkUDw+CFuSih8D3lqvgjxCa/RttlGCkpocrJz7xOsow=;
 b=DeFBLYkyvTvwMb8tCkX4N7mxhymXOnI8WoJOGFgdpKpCN397TLEcqA5VW3RmURt/6u927g
 o/nCqTHZlxq+9d5Qmc49ZbvO5maE7CdGqU3yyXtiqcI37WA0l70Ft94JA5aIEJB+NlZQf8
 UZPcbkkfmYsqLJYKLRlNp8ra+tXoEvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663344447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YkUDw+CFuSih8D3lqvgjxCa/RttlGCkpocrJz7xOsow=;
 b=FhkNjmym+1FUj4XEmM1EOw10wlXcrhzHL/ICM/iJf/xjCx729LYCPbNnQJD0T59eM/p1QF
 qfH9Q+cfjeM4jUAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9EE5F1346B
 for <ltp@lists.linux.it>; Fri, 16 Sep 2022 16:07:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ukzCJT+fJGNGfQAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 16 Sep 2022 16:07:27 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 16 Sep 2022 18:07:24 +0200
Message-Id: <20220916160726.12797-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] request_key03: Refactor child process code
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

Split off child process code into separate functions.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

This is the final patchset of my max_runtime fixes. I've tried to keep
functional changes to a minimum. We can redesign the child processes
to run for a fixed period of time later.

I've also tested the patchset on a vulnerable kernel and it successfully
triggers the kernel bug.

 .../syscalls/request_key/request_key03.c      | 101 ++++++++++--------
 1 file changed, 58 insertions(+), 43 deletions(-)

diff --git a/testcases/kernel/syscalls/request_key/request_key03.c b/testcases/kernel/syscalls/request_key/request_key03.c
index 3f0c093f3..2780532f3 100644
--- a/testcases/kernel/syscalls/request_key/request_key03.c
+++ b/testcases/kernel/syscalls/request_key/request_key03.c
@@ -39,10 +39,65 @@
 
 static char *opt_bug;
 
+static void run_child_add(const char *type, const char *payload, int effort)
+{
+	int i;
+
+	/*
+	 * Depending on the state of the key, add_key() should either succeed or
+	 * fail with one of several errors:
+	 *
+	 * (1) key didn't exist at all: either add_key() should succeed (if the
+	 *     payload is valid), or it should fail with EINVAL (if the payload
+	 *     is invalid; this is needed for the "encrypted" and "trusted" key
+	 *     types because they have a quirk where the payload syntax differs
+	 *     for creating new keys vs. updating existing keys)
+	 *
+	 * (2) key was negative: add_key() should succeed
+	 *
+	 * (3) key was uninstantiated: add_key() should wait for the key to be
+	 *     negated, then fail with ENOKEY
+	 *
+	 * For now we also accept EDQUOT because the kernel frees up the keys
+	 * quota asynchronously after keys are unlinked.  So it may be hit.
+	 */
+	for (i = 0; i < 100 * effort; i++) {
+		usleep(rand() % 1024);
+		TEST(add_key(type, "desc", payload, strlen(payload),
+			KEY_SPEC_SESSION_KEYRING));
+		if (TST_RET < 0 && TST_ERR != EINVAL && TST_ERR != ENOKEY &&
+			TST_ERR != EDQUOT) {
+			tst_brk(TBROK | TTERRNO,
+				"unexpected error adding key of type '%s'",
+				type);
+		}
+
+		TEST(keyctl(KEYCTL_CLEAR, KEY_SPEC_SESSION_KEYRING));
+
+		if (TST_RET < 0)
+			tst_brk(TBROK | TTERRNO, "unable to clear keyring");
+	}
+}
+
+static void run_child_request(const char *type, int effort)
+{
+	int i;
+
+	for (i = 0; i < 5000 * effort; i++) {
+		TEST(request_key(type, "desc", "callout_info",
+			KEY_SPEC_SESSION_KEYRING));
+		if (TST_RET < 0 && TST_ERR != ENOKEY && TST_ERR != ENOENT &&
+			TST_ERR != EDQUOT) {
+			tst_brk(TBROK | TTERRNO,
+				"unexpected error requesting key of type '%s'",
+				type);
+		}
+	}
+}
+
 static void test_with_key_type(const char *type, const char *payload,
 			       int effort)
 {
-	int i;
 	int status;
 	pid_t add_key_pid;
 	pid_t request_key_pid;
@@ -68,56 +123,16 @@ static void test_with_key_type(const char *type, const char *payload,
 	/*
 	 * Fork a subprocess which repeatedly tries to "add" a key of the given
 	 * type.  This actually will try to update the key if it already exists.
-	 * Depending on the state of the key, add_key() should either succeed or
-	 * fail with one of several errors:
-	 *
-	 * (1) key didn't exist at all: either add_key() should succeed (if the
-	 *     payload is valid), or it should fail with EINVAL (if the payload
-	 *     is invalid; this is needed for the "encrypted" and "trusted" key
-	 *     types because they have a quirk where the payload syntax differs
-	 *     for creating new keys vs. updating existing keys)
-	 *
-	 * (2) key was negative: add_key() should succeed
-	 *
-	 * (3) key was uninstantiated: add_key() should wait for the key to be
-	 *     negated, then fail with ENOKEY
-	 *
-	 * For now we also accept EDQUOT because the kernel frees up the keys
-	 * quota asynchronously after keys are unlinked.  So it may be hit.
 	 */
 	add_key_pid = SAFE_FORK();
 	if (add_key_pid == 0) {
-		for (i = 0; i < 100 * effort; i++) {
-			usleep(rand() % 1024);
-			TEST(add_key(type, "desc", payload, strlen(payload),
-				     KEY_SPEC_SESSION_KEYRING));
-			if (TST_RET < 0 && TST_ERR != EINVAL &&
-			    TST_ERR != ENOKEY && TST_ERR != EDQUOT) {
-				tst_brk(TBROK | TTERRNO,
-					"unexpected error adding key of type '%s'",
-					type);
-			}
-			TEST(keyctl(KEYCTL_CLEAR, KEY_SPEC_SESSION_KEYRING));
-			if (TST_RET < 0) {
-				tst_brk(TBROK | TTERRNO,
-					"unable to clear keyring");
-			}
-		}
+		run_child_add(type, payload, effort);
 		exit(0);
 	}
 
 	request_key_pid = SAFE_FORK();
 	if (request_key_pid == 0) {
-		for (i = 0; i < 5000 * effort; i++) {
-			TEST(request_key(type, "desc", "callout_info",
-					 KEY_SPEC_SESSION_KEYRING));
-			if (TST_RET < 0 && TST_ERR != ENOKEY &&
-			    TST_ERR != ENOENT && TST_ERR != EDQUOT) {
-				tst_brk(TBROK | TTERRNO,
-					"unexpected error requesting key of type '%s'",
-					type);
-			}
-		}
+		run_child_request(type, effort);
 		exit(0);
 	}
 
-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
