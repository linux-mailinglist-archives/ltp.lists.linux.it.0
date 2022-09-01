Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 503EF5A8E48
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Sep 2022 08:33:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45C8A3CA877
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Sep 2022 08:33:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 76ABE3C0EBB
 for <ltp@lists.linux.it>; Thu,  1 Sep 2022 08:33:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5D4711000AE8
 for <ltp@lists.linux.it>; Thu,  1 Sep 2022 08:32:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1F47A22252;
 Thu,  1 Sep 2022 06:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662013978;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aNdNBR7qqMegH1w1KZZdKEOVKVkIhCEfu7VPkB9TWrs=;
 b=q1pN91lvkK6cio8FIUK7IRu00iaM22JUxZSrNCXWCU2U5tw4cIAWLH7wTBtneKdZ6UCWMm
 INOYmfMwCwjpXwaMfq4/A3LQ8zFm5wFbtfDfLtg4eb2i1KZxGMajuybHnuaqCPwmtZYMFz
 xPNEzUTEyew7uCZ3rm5/sgUCPFLcZLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662013978;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aNdNBR7qqMegH1w1KZZdKEOVKVkIhCEfu7VPkB9TWrs=;
 b=vh6vbKi0liDwXk+BztBpjJ2ysZTNPbQkhQlBrVdrHCZxO8nEbyoMkxrkgbnP5cwJ2Bhid0
 BlIjozK+22Ba+GCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6FE713316;
 Thu,  1 Sep 2022 06:32:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0LSyNhlSEGNJIAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 01 Sep 2022 06:32:57 +0000
Date: Thu, 1 Sep 2022 08:32:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <YxBSF1ZgU5wSlpi+@pevik>
References: <20220714060722.18894-1-akumar@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220714060722.18894-1-akumar@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open04.c: convert to new LTP API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Avinesh,

I suggest to merge with these fixes:

* added free (if needed - that was in the original source)
* fixed cleanup (don't run SAFE_CLOSE() if previous SAFE_OPEN() or SAFE_MALLOC()
  failed)
* use TST_EXP_FAIL() - the same result as TST_EXP_FAIL2() with shorter code
* allocate memory needed (it's actually -2)
* #define FNAME "open04"

If it's ok, I'll merge it.

Kind regards,
Petr

diff --git testcases/kernel/syscalls/open/open04.c testcases/kernel/syscalls/open/open04.c
index e7cb533fe..16477e459 100644
--- testcases/kernel/syscalls/open/open04.c
+++ testcases/kernel/syscalls/open/open04.c
@@ -1,19 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *   Copyright (c) International Business Machines  Corp., 2001
- *   Copyright (c) 2022 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
+ * Copyright (c) International Business Machines  Corp., 2001
+ * Copyright (c) 2022 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
  */
 
 /*\
  * [Description]
  *
- * Verify that open(2) fails with EMFILE when
- * per-process limit on the number of open file descriptors has been reached.
+ * Verify that open(2) fails with EMFILE when per-process limit on the number
+ * of open file descriptors has been reached.
  */
 
 #include <stdio.h>
+#include <stdlib.h>
 #include "tst_test.h"
 
+#define FNAME "open04"
+
 static int fds_limit, first, i;
 static int *fds;
 static char fname[20];
@@ -23,13 +26,13 @@ static void setup(void)
 	int fd;
 
 	fds_limit = getdtablesize();
-	first = SAFE_OPEN("open04", O_RDWR | O_CREAT, 0777);
+	first = SAFE_OPEN(FNAME, O_RDWR | O_CREAT, 0777);
 
-	fds = SAFE_MALLOC(sizeof(int) * (fds_limit - first));
+	fds = SAFE_MALLOC(sizeof(int) * (fds_limit - first - 2));
 	fds[0] = first;
 
 	for (i = first + 1; i < fds_limit; i++) {
-		sprintf(fname, "open04.%d", i);
+		sprintf(fname, FNAME ".%d", i);
 		fd = SAFE_OPEN(fname, O_RDWR | O_CREAT, 0777);
 		fds[i - first] = fd;
 	}
@@ -37,16 +40,20 @@ static void setup(void)
 
 static void run(void)
 {
-	sprintf(fname, "open04.%d", fds_limit);
-	TST_EXP_FAIL2(open(fname, O_RDWR | O_CREAT, 0777),
-				EMFILE,
-				"open(%s, O_RDWR | O_CREAT, 0777)", fname);
+	sprintf(fname, FNAME ".%d", fds_limit);
+	TST_EXP_FAIL(open(fname, O_RDWR | O_CREAT, 0777), EMFILE);
 }
 
 static void cleanup(void)
 {
+	if (!first || !fds)
+		return;
+
 	for (i = first; i < fds_limit; i++)
 		SAFE_CLOSE(fds[i - first]);
+
+	if (fds)
+		free(fds);
 }
 
 static struct tst_test test = {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
