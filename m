Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 120081A9C3D
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:28:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 978B03C2B46
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:28:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B71CF3C2B05
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 53C1C20111C
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 00993AC5B;
 Wed, 15 Apr 2020 11:26:41 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Apr 2020 13:26:27 +0200
Message-Id: <20200415112635.14144-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415112635.14144-1-pvorel@suse.cz>
References: <20200415112635.14144-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/9] Remove use of TCID in new API tests
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

This is a preparation for build with -fno-common

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v2.
Sorry for quashing it in a single commit.

 testcases/kernel/mem/tunable/overcommit_memory.c        | 4 ++--
 testcases/kernel/security/integrity/ima/src/ima_mmap.c  | 3 ++-
 testcases/kernel/syscalls/memfd_create/memfd_create01.c | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/mem/tunable/overcommit_memory.c b/testcases/kernel/mem/tunable/overcommit_memory.c
index 345764dfe..f77939908 100644
--- a/testcases/kernel/mem/tunable/overcommit_memory.c
+++ b/testcases/kernel/mem/tunable/overcommit_memory.c
@@ -1,4 +1,5 @@
 /*
+ * Copyright (c) Linux Test Project, 2012-2020
  * Copyright (C) 2012-2017  Red Hat, Inc.
  *
  * This program is free software;  you can redistribute it and/or modify
@@ -101,8 +102,7 @@ static void setup(void)
 
 	if (access(PATH_SYSVM "overcommit_memory", F_OK) == -1 ||
 	    access(PATH_SYSVM "overcommit_ratio", F_OK) == -1)
-		tst_brk(TCONF, "The system "
-			 "can't support to test %s", TCID);
+		tst_brk(TCONF, "system doesn't support overcommit_memory");
 
 	if (R_opt)
 		overcommit_ratio = SAFE_STRTOL(R_opt, 0, LONG_MAX);
diff --git a/testcases/kernel/security/integrity/ima/src/ima_mmap.c b/testcases/kernel/security/integrity/ima/src/ima_mmap.c
index 0875aaeaf..c831be829 100644
--- a/testcases/kernel/security/integrity/ima/src/ima_mmap.c
+++ b/testcases/kernel/security/integrity/ima/src/ima_mmap.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) Linux Test Project, 2010-2020
  * Copyright (c) International Business Machines Corp., 2009
  *
  * Authors:
@@ -33,7 +34,7 @@ static void cleanup(void)
 static void run(void)
 {
 	if (!filename)
-		tst_brk(TBROK, "Usage: %s -f filename", TCID);
+		tst_brk(TBROK, "missing filename (-f filename)");
 
 	fd = SAFE_OPEN(filename, O_CREAT | O_RDWR, S_IRWXU);
 
diff --git a/testcases/kernel/syscalls/memfd_create/memfd_create01.c b/testcases/kernel/syscalls/memfd_create/memfd_create01.c
index fdd37f64b..e0db69dff 100644
--- a/testcases/kernel/syscalls/memfd_create/memfd_create01.c
+++ b/testcases/kernel/syscalls/memfd_create/memfd_create01.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) Linux Test Project, 2017-2020
  * Copyright (C) 2017  Red Hat, Inc.
  */
 
@@ -241,7 +242,7 @@ static void verify_memfd_create(unsigned int n)
 
 	tst_res(TINFO, "%s", tc->desc);
 
-	fd = CHECK_MFD_NEW(TCID, MFD_DEF_SIZE, tc->flags);
+	fd = CHECK_MFD_NEW("ltp_memfd_create01", MFD_DEF_SIZE, tc->flags);
 
 	tc->func(fd);
 
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
