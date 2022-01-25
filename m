Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E72B549B688
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 15:41:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E2603C93FE
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 15:41:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8CC293C92D0
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 15:40:50 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 17A8D1000DD7
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 15:40:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B79F6218EA;
 Tue, 25 Jan 2022 14:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643121649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WaTBQD/rRfYopy8L8HtEV/vNl09utsFh0ID6otKRkiU=;
 b=lsCSJXnuCwl/72DX9gf0W8+U/ofPm6cfvUcsnIAc47PBPtgHaOWsLUpyo85R2V/WbMgo/R
 cE3gOUkzw1t4sNoMH/VJJvLZTPQm6ppPIurvgMllNWA39D9Oyt2tdFIHec9gpO7RI7soWI
 IKXP7MY5WAeM5YJ1FRlT8mXN5tkfJfc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643121649;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WaTBQD/rRfYopy8L8HtEV/vNl09utsFh0ID6otKRkiU=;
 b=hf90eR+ea9qB4ZUHygsJH9qQn3Vh2L7uFk9194FZbcsY6b4epv0++KzU82Zji6P7LzN3bV
 AtqrMqanrOvvf0Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D35213E03;
 Tue, 25 Jan 2022 14:40:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aFqzIPEL8GGFdAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 25 Jan 2022 14:40:49 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 Jan 2022 15:40:42 +0100
Message-Id: <20220125144043.31798-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144043.31798-1-pvorel@suse.cz>
References: <20220125144043.31798-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/4] sched_get_priority_min01: Add missing policies
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

+ improve doc wording and update copyright.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v2

 .../sched_get_priority_min01.c                      | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_get_priority_min/sched_get_priority_min01.c b/testcases/kernel/syscalls/sched_get_priority_min/sched_get_priority_min01.c
index cebd08d3f9..e7ab761249 100644
--- a/testcases/kernel/syscalls/sched_get_priority_min/sched_get_priority_min01.c
+++ b/testcases/kernel/syscalls/sched_get_priority_min/sched_get_priority_min01.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
  * Copyright (c) 2021 sujiaxun <sujiaxun@uniontech.com>
+ * Copyright (c) Linux Test Project, 2009-2022
  */
 
 /*\
@@ -9,11 +10,12 @@
  *
  * Basic test for the sched_get_priority_min(2) system call.
  *
- * Obtain different minimum priority scheduling strategies and
+ * Obtain different minimum priority for different schedulling policies and
  * compare them with the expected value.
  */
 
-#include <errno.h>
+#define _GNU_SOURCE
+
 #include <sched.h>
 #include "tst_test.h"
 #include "lapi/syscalls.h"
@@ -25,9 +27,12 @@ static struct test_case {
 	int policy;
 	int retval;
 } tcases[] = {
-	{POLICY_DESC(SCHED_OTHER), 0},
+	{POLICY_DESC(SCHED_BATCH), 0},
+	{POLICY_DESC(SCHED_DEADLINE), 0},
 	{POLICY_DESC(SCHED_FIFO), 1},
-	{POLICY_DESC(SCHED_RR), 1}
+	{POLICY_DESC(SCHED_IDLE), 0},
+	{POLICY_DESC(SCHED_OTHER), 0},
+	{POLICY_DESC(SCHED_RR), 1},
 };
 
 static void run_test(unsigned int nr)
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
