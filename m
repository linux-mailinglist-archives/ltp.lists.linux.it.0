Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9658B50FFB5
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Apr 2022 15:55:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EA903CA26E
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Apr 2022 15:55:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A47403C9D7D
 for <ltp@lists.linux.it>; Tue, 26 Apr 2022 15:55:44 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E59C8600546
 for <ltp@lists.linux.it>; Tue, 26 Apr 2022 15:55:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 13AAD1F388;
 Tue, 26 Apr 2022 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650981343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oQ4sdAlQdZ0+w49FVPIZYdqEd07yoq9W0cuAJjEVrVo=;
 b=FMkqgS7hqbRVFI8Z/776U4D2oGvEkl1BgJ0FqTa+QgAsGiBXj1UVbHXZlE84J1MlsPL3dn
 5I+DxjWIo19qp0bwjnnVlEi1wMYAs768Ak9FZ7Rvdl7d7iQsG18znfIeefaEJP8ZLcttf0
 hif3k3PR7RC3onv2GmmXcVnJ8Dsh85o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650981343;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oQ4sdAlQdZ0+w49FVPIZYdqEd07yoq9W0cuAJjEVrVo=;
 b=6Zpp/ndyJ63W7wjf3b3ISnsZHUmLfy2uK0wQycpL3vjdBQCY7G2r0QcygPZC0e+K1L7hUo
 g74e6JNLnHP0q9Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC19B13223;
 Tue, 26 Apr 2022 13:55:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 79vfN975Z2IqPAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 26 Apr 2022 13:55:42 +0000
Date: Tue, 26 Apr 2022 15:57:57 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <Ymf6ZT3a0wxMQrQo@yuki>
References: <20220426084755.23174-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220426084755.23174-1-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Rewrite userns06.c using new LTP API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with minor changes, thanks.

- removed some useless comments
- fixed the type for resource files
- changed the TBROK to TCONF in the helper when libcap is missing

diff --git a/testcases/kernel/containers/userns/userns06.c b/testcases/kernel/containers/userns/userns06.c
index 100ad8274..002c72907 100644
--- a/testcases/kernel/containers/userns/userns06.c
+++ b/testcases/kernel/containers/userns/userns06.c
@@ -29,9 +29,6 @@
 #define CHILD2UID 200
 #define CHILD2GID 200
 
-/*
- * child_fn1() - Inside a new user namespace
- */
 static int child_fn1(void)
 {
 	char *const args[] = { TEST_APP, "privileged", NULL };
@@ -39,9 +36,6 @@ static int child_fn1(void)
 
 	TST_CHECKPOINT_WAIT(0);
 
-	/* execv will replace the main function and it will end this child
-	 * accordingly.
-	 */
 	ret = execv(args[0], args);
 	if (ret == -1)
 		tst_brk(TBROK | TERRNO, "execv: unexpected error");
@@ -49,9 +43,6 @@ static int child_fn1(void)
 	return 0;
 }
 
-/*
- * child_fn2() - Inside a new user namespace
- */
 static int child_fn2(void)
 {
 	int uid, gid, ret;
@@ -69,9 +60,6 @@ static int child_fn2(void)
 
 	tst_res(TPASS, "expected uid and gid");
 
-	/* execv will replace the main function and it will end this child
-	 * accordingly.
-	 */
 	ret = execv(args[0], args);
 	if (ret == -1)
 		tst_brk(TBROK | TERRNO, "execv: unexpected error");
@@ -133,7 +121,7 @@ static struct tst_test test = {
 	.test_all = run,
 	.needs_root = 1,
 	.needs_checkpoints = 1,
-	.resource_files = (char *const []) {
+	.resource_files = (const char *[]) {
 		TEST_APP,
 		NULL,
 	},
diff --git a/testcases/kernel/containers/userns/userns06_capcheck.c b/testcases/kernel/containers/userns/userns06_capcheck.c
index 589e8bb94..bae4e4e33 100644
--- a/testcases/kernel/containers/userns/userns06_capcheck.c
+++ b/testcases/kernel/containers/userns/userns06_capcheck.c
@@ -60,6 +60,6 @@ int main(void)
 {
 	tst_reinit();
 
-	tst_brk(TBROK, "System is missing libcap");
+	tst_brk(TCONF, "System is missing libcap");
 }

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
