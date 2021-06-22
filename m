Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 463913B02DC
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:36:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 114673C7022
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:36:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 63E413C6FFF
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E7A5910007C1
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:40 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 667B81FD45;
 Tue, 22 Jun 2021 11:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624361740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kb/nSrccuT/WrceNfDVM0TM5qXJvJtUvuqMdxYV5WQo=;
 b=rByLg1FDBXwGtPN+DN3gZoiEKoLcdWe312lAL7QWVgqvBoZsRiKcu5DLvVIPGat7QZNdfi
 sPtVvOpTVJIh3CKtKBVMITPCsgLiE3UHTs8GwpAqV0hWbrXUFKrnOJ/U8iUmhyWDAZNCj8
 gqqkDcCx+4JV0yYBjA333jGvb9EwSJU=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 37E95A3B84;
 Tue, 22 Jun 2021 11:35:40 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 12:35:08 +0100
Message-Id: <20210622113514.22284-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622113514.22284-1-rpalethorpe@suse.com>
References: <20210622113514.22284-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/8] ftest: Fix uninitialized var error
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Mark misc_intvl as const which allows the compiler to eliminate some
confusing branches. This is a minimal change to fix the error.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/fs/ftest/ftest01.c | 3 +--
 testcases/kernel/fs/ftest/ftest05.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/fs/ftest/ftest01.c b/testcases/kernel/fs/ftest/ftest01.c
index afad18095..31203d689 100644
--- a/testcases/kernel/fs/ftest/ftest01.c
+++ b/testcases/kernel/fs/ftest/ftest01.c
@@ -83,7 +83,7 @@ static void term(int sig);
 static int csize;		/* chunk size */
 static int iterations;		/* # total iterations */
 static int max_size;		/* max file size */
-static int misc_intvl;		/* for doing misc things; 0 ==> no */
+static const int misc_intvl = 10;		/* for doing misc things; 0 ==> no */
 static int nchild;		/* how many children */
 static int fd;			/* file descriptor used by child */
 static int parent_pid;
@@ -139,7 +139,6 @@ static void setup(void)
 	nchild = 5;
 	csize = K_2;		/* should run with 1, 2, and 4 K sizes */
 	max_size = K_1 * K_1;
-	misc_intvl = 10;
 
 	if (sigset(SIGTERM, term) == SIG_ERR) {
 		tst_brkm(TBROK | TERRNO, NULL, "sigset failed");
diff --git a/testcases/kernel/fs/ftest/ftest05.c b/testcases/kernel/fs/ftest/ftest05.c
index 0bd32e4f6..8d8e6d497 100644
--- a/testcases/kernel/fs/ftest/ftest05.c
+++ b/testcases/kernel/fs/ftest/ftest05.c
@@ -87,7 +87,7 @@ static void cleanup(void);
 static int csize;		/* chunk size */
 static int iterations;		/* # total iterations */
 static off64_t max_size;	/* max file size */
-static int misc_intvl;		/* for doing misc things; 0 ==> no */
+static const int misc_intvl = 10;		/* for doing misc things; 0 ==> no */
 static int nchild;		/* how many children */
 static int fd;			/* file descriptor used by child */
 static int parent_pid;
@@ -147,7 +147,6 @@ static void setup(void)
 	nchild = 5;
 	csize = K_2;		/* should run with 1, 2, and 4 K sizes */
 	max_size = K_1 * K_1;
-	misc_intvl = 10;
 
 	if (sigset(SIGTERM, term) == SIG_ERR) {
 		tst_brkm(TBROK | TERRNO, NULL,
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
