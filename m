Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 012443E9032
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:11:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8C5A3C6FF2
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:11:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 75AF83C5D2C
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:11:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E97BA6008D5
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:11:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 294E5221B2;
 Wed, 11 Aug 2021 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628683890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SKRr5SGMz0hRCIyPZYlu2WvLOkyfXx2h5tmprVS2WT8=;
 b=qHbxfUw6+tK2EACgzgAXZOPetgiSVYX3wr/UZyOhid3zM4beKIVL6IQJYIBC2ntTaH5xpS
 0JQAkZMWzM1GD55tC6jcBdB+JSy1yQ1o+rqpfKvnT2+p23LneF+x972Rwmn1VlOuI0VWWQ
 Yr8h+x9F3hvEufPmUWxvc0Ft1uAncFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628683890;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SKRr5SGMz0hRCIyPZYlu2WvLOkyfXx2h5tmprVS2WT8=;
 b=C8PPPgraK8B6lYhn8zq2SoYr7547voDfb9vv+pXIWNY9z586HlqYD+cQjQ3bcA5UkePkz4
 +ZCaUWHX5s7kuHAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13FA913C20;
 Wed, 11 Aug 2021 12:11:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7E3/A3K+E2EkIAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 11 Aug 2021 12:11:30 +0000
Date: Wed, 11 Aug 2021 14:11:41 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YRO+fX/4VUxyCc9J@yuki>
References: <20210810151518.27618-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210810151518.27618-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] syscalls/chmod01: Convert to new API and
 add directory tests
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
Pushed with a minor changes, thanks.

full diff:

diff --git a/testcases/kernel/syscalls/chmod/chmod01.c b/testcases/kernel/syscalls/chmod/chmod01.c
index 4dd39efca..9f5ec4c67 100644
--- a/testcases/kernel/syscalls/chmod/chmod01.c
+++ b/testcases/kernel/syscalls/chmod/chmod01.c
@@ -1,22 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *   07/2001 Ported by Wayne Boyer
- *
+ * Copyright (c) International Business Machines  Corp., 2001
+ *  07/2001 Ported by Wayne Boyer
  */
 
 /*\
  * [Description]
  *
- * Test Description:
- *  Verify that, chmod(2) succeeds when used to change the mode permissions
- *  of a file or directory.
- *
- * Expected Result:
- *  chmod(2) should return 0 and the mode permissions set on file should match
- *  the specified mode.
- *
+ * Verify that chmod(2) succeeds when used to change the mode permissions
+ * of a file or directory.
  */
 
 #include "tst_test.h"
@@ -25,7 +17,7 @@
 #define TESTFILE	"testfile"
 #define TESTDIR		"testdir_1"
 
-static int modes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };
+static int modes[] = {0, 07, 070, 0700, 0777, 02777, 04777, 06777};
 
 static struct variant {
 	char *name;
@@ -43,24 +35,27 @@ static void verify_chmod(unsigned int n)
 	struct variant *tc = &variants[tst_variant];
 
 	TST_EXP_PASS(chmod(tc->name, mode), "chmod(%s, %04o)",
-	tc->name, mode);
+	             tc->name, mode);
+
 	if (!TST_PASS)
 		return;
 
 	SAFE_STAT(tc->name, &stat_buf);
 	stat_buf.st_mode &= ~tc->mode_mask;
 
-	if (stat_buf.st_mode == (unsigned int)mode)
+	if (stat_buf.st_mode == (unsigned int)mode) {
 		tst_res(TPASS, "stat(%s) mode=%04o",
 				tc->name, stat_buf.st_mode);
-	else
+	} else {
 		tst_res(TFAIL, "stat(%s) mode=%04o",
 				tc->name, stat_buf.st_mode);
+	}
 }
 
 static void setup(void)
 {
 	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+
 	if (tst_variant)
 		SAFE_MKDIR(variants[tst_variant].name, MODE);
 	else
@@ -74,4 +69,3 @@ static struct tst_test test = {
 	.test = verify_chmod,
 	.needs_tmpdir = 1,
 };
-

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
