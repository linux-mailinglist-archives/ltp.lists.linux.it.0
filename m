Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C6F3CF809
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 12:40:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38E633C81A5
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 12:40:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DBC5A3C2090
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 12:39:43 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EA883140096C
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 12:39:42 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 53260202BE
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626777582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqvK/iTBLnXNAbY9Gbc5o/xaMAbL7b4P6T5ynWZFrY8=;
 b=CvbfdqMXO2mQ2L950+AHkv3kJIcUdla4OE0mChREiegBdyO1oPZZJSy/kjBIGqzczHoOvB
 vbknI5SIKcJ9IYPVrasEa5g4fEPwHSydy5tDPLAJ17zkeYXH2pTmChT2ZZahU7yajbSw6p
 PFKPhntBB5Gxz1gV6TW7ncCRgPO7Plw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626777582;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqvK/iTBLnXNAbY9Gbc5o/xaMAbL7b4P6T5ynWZFrY8=;
 b=nwW/Fg7M7Fc8XZOC8Ct/AB1gu/Wwybip5+83M/zqjPUzrV7uQazIeM12uh0W4H4RorPXhC
 syI9LwYuvOpflJDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4244E13B84
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:39:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ILFRD+6n9mAuOwAAGKfGzw
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:39:42 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 12:39:40 +0200
Message-Id: <20210720103941.9767-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210720103941.9767-1-mdoucha@suse.cz>
References: <20210720103941.9767-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] Replace existing lockdown checks with
 skip_in_lockdown
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 .../kernel/syscalls/delete_module/delete_module01.c    |  6 ++----
 .../kernel/syscalls/delete_module/delete_module03.c    |  6 ++----
 testcases/kernel/syscalls/ioperm/ioperm01.c            |  6 ++----
 testcases/kernel/syscalls/ioperm/ioperm02.c            |  6 ++----
 testcases/kernel/syscalls/iopl/iopl01.c                | 10 ++--------
 testcases/kernel/syscalls/iopl/iopl02.c                |  6 ++----
 6 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/testcases/kernel/syscalls/delete_module/delete_module01.c b/testcases/kernel/syscalls/delete_module/delete_module01.c
index cec20c19c..c4f6978c1 100644
--- a/testcases/kernel/syscalls/delete_module/delete_module01.c
+++ b/testcases/kernel/syscalls/delete_module/delete_module01.c
@@ -25,10 +25,6 @@ static int module_loaded;
 
 static void do_delete_module(void)
 {
-	/* lockdown requires signed modules */
-	if (tst_lockdown_enabled())
-		tst_brk(TCONF, "Kernel is locked down, skip this test");
-
 	if (module_loaded == 0) {
 		tst_module_load(MODULE_NAME_KO, NULL);
 		module_loaded = 1;
@@ -53,6 +49,8 @@ static void cleanup(void)
 
 static struct tst_test test = {
 	.needs_root = 1,
+	/* lockdown requires signed modules */
+	.skip_in_lockdown = 1,
 	.cleanup = cleanup,
 	.test_all = do_delete_module,
 };
diff --git a/testcases/kernel/syscalls/delete_module/delete_module03.c b/testcases/kernel/syscalls/delete_module/delete_module03.c
index 56cef459f..863d36188 100644
--- a/testcases/kernel/syscalls/delete_module/delete_module03.c
+++ b/testcases/kernel/syscalls/delete_module/delete_module03.c
@@ -50,10 +50,6 @@ static void do_delete_module(void)
 
 static void setup(void)
 {
-	/* lockdown requires signed modules */
-	if (tst_lockdown_enabled())
-		tst_brk(TCONF, "Kernel is locked down, skip this test");
-
 	/* Load first kernel module */
 	tst_module_load(DUMMY_MOD_KO, NULL);
 	dummy_mod_loaded = 1;
@@ -76,6 +72,8 @@ static void cleanup(void)
 
 static struct tst_test test = {
 	.needs_root = 1,
+	/* lockdown requires signed modules */
+	.skip_in_lockdown = 1,
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_all = do_delete_module,
diff --git a/testcases/kernel/syscalls/ioperm/ioperm01.c b/testcases/kernel/syscalls/ioperm/ioperm01.c
index 6c50a0b75..8f2cc684d 100644
--- a/testcases/kernel/syscalls/ioperm/ioperm01.c
+++ b/testcases/kernel/syscalls/ioperm/ioperm01.c
@@ -42,10 +42,6 @@ static void verify_ioperm(void)
 
 static void setup(void)
 {
-	/* ioperm() is restricted under kernel lockdown. */
-	if (tst_lockdown_enabled())
-		tst_brk(TCONF, "Kernel is locked down, skip this test");
-
 	/*
 	 * The value of IO_BITMAP_BITS (include/asm-i386/processor.h) changed
 	 * from kernel 2.6.8 to permit 16-bits ioperm
@@ -70,6 +66,8 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test_all = verify_ioperm,
 	.needs_root = 1,
+	/* ioperm() is restricted under kernel lockdown. */
+	.skip_in_lockdown = 1,
 	.setup = setup,
 	.cleanup = cleanup,
 };
diff --git a/testcases/kernel/syscalls/ioperm/ioperm02.c b/testcases/kernel/syscalls/ioperm/ioperm02.c
index 80dcb992e..33c501904 100644
--- a/testcases/kernel/syscalls/ioperm/ioperm02.c
+++ b/testcases/kernel/syscalls/ioperm/ioperm02.c
@@ -45,10 +45,6 @@ static struct tcase_t {
 
 static void setup(void)
 {
-	/* ioperm() is restricted under kernel lockdown. */
-	if (tst_lockdown_enabled())
-		tst_brk(TCONF, "Kernel is locked down, skip this test");
-
 	/*
 	 * The value of IO_BITMAP_BITS (include/asm-i386/processor.h) changed
 	 * from kernel 2.6.8 to permit 16-bits (65536) ioperm
@@ -92,6 +88,8 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_ioperm,
 	.needs_root = 1,
+	/* ioperm() is restricted under kernel lockdown. */
+	.skip_in_lockdown = 1,
 	.setup = setup,
 	.cleanup = cleanup,
 };
diff --git a/testcases/kernel/syscalls/iopl/iopl01.c b/testcases/kernel/syscalls/iopl/iopl01.c
index dcf2cc406..70e2a7ff1 100644
--- a/testcases/kernel/syscalls/iopl/iopl01.c
+++ b/testcases/kernel/syscalls/iopl/iopl01.c
@@ -42,13 +42,6 @@ static void verify_iopl(void)
 	}
 }
 
-static void setup(void)
-{
-	/* iopl() is restricted under kernel lockdown. */
-	if (tst_lockdown_enabled())
-		tst_brk(TCONF, "Kernel is locked down, skip this test");
-}
-
 static void cleanup(void)
 {
 	/*
@@ -61,7 +54,8 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test_all = verify_iopl,
 	.needs_root = 1,
-	.setup = setup,
+	/* iopl() is restricted under kernel lockdown. */
+	.skip_in_lockdown = 1,
 	.cleanup = cleanup,
 };
 
diff --git a/testcases/kernel/syscalls/iopl/iopl02.c b/testcases/kernel/syscalls/iopl/iopl02.c
index a6135ddf3..7301442f9 100644
--- a/testcases/kernel/syscalls/iopl/iopl02.c
+++ b/testcases/kernel/syscalls/iopl/iopl02.c
@@ -53,10 +53,6 @@ static void setup(void)
 {
 	struct passwd *pw;
 
-	/* iopl() is restricted under kernel lockdown. */
-	if (tst_lockdown_enabled())
-		tst_brk(TCONF, "Kernel is locked down, skip this test");
-
 	pw = SAFE_GETPWNAM("nobody");
 	SAFE_SETEUID(pw->pw_uid);
 }
@@ -70,6 +66,8 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_iopl,
 	.needs_root = 1,
+	/* iopl() is restricted under kernel lockdown. */
+	.skip_in_lockdown = 1,
 	.setup = setup,
 	.cleanup = cleanup,
 };
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
