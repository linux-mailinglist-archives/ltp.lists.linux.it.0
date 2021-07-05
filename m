Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B323BBD8F
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jul 2021 15:38:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EE933C8A1F
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jul 2021 15:38:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 563103C2AA0
 for <ltp@lists.linux.it>; Mon,  5 Jul 2021 15:38:05 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6C20A100040B
 for <ltp@lists.linux.it>; Mon,  5 Jul 2021 15:38:04 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 6A4C69F752;
 Mon,  5 Jul 2021 13:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1625492282; bh=y+UeCOiH9V6026tNvEognHhhsfSFJxmrDruHP5EJveE=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=gzvp5otfZGapuUrC/NlanGKRFqTmuCdF4hhmWXvCn9cteTKnEk7dQm/yE7zXz+kYJ
 8TYC8+jaaHOZh8y5+FYoik0hP829eCQfaKZc2pthR2btEXrbQfRt44p4alTKqNSGP3
 FSntQgNU75W+C2JPqzHETDnyPuGP8IlhYzh6NeY0=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Mon,  5 Jul 2021 15:37:48 +0200
Message-Id: <20210705133748.654630-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] shell: Drop empty line at SOF
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../conformance/interfaces/pthread_attr_getinheritsched/2-1.sh   | 1 -
 .../conformance/interfaces/pthread_attr_getschedparam/2-1.sh     | 1 -
 .../conformance/interfaces/pthread_attr_getschedpolicy/1-1.sh    | 1 -
 .../conformance/interfaces/pthread_attr_getschedpolicy/3-1.sh    | 1 -
 .../conformance/interfaces/pthread_attr_getscope/2-1.sh          | 1 -
 .../conformance/interfaces/pthread_attr_getstack/2-1.sh          | 1 -
 .../conformance/interfaces/pthread_attr_getstacksize/2-1.sh      | 1 -
 .../conformance/interfaces/pthread_attr_setinheritsched/3-1.sh   | 1 -
 .../conformance/interfaces/pthread_attr_setschedparam/2-1.sh     | 1 -
 .../conformance/interfaces/pthread_attr_setschedpolicy/3-1.sh    | 1 -
 .../conformance/interfaces/pthread_attr_setscope/3-1.sh          | 1 -
 .../conformance/interfaces/pthread_attr_setstack/3-1.sh          | 1 -
 .../conformance/interfaces/pthread_attr_setstack/5-1.sh          | 1 -
 .../conformance/interfaces/pthread_attr_setstacksize/3-1.sh      | 1 -
 .../conformance/interfaces/pthread_getcpuclockid/2-1.sh          | 1 -
 15 files changed, 15 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched/2-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched/2-1.sh
index aefe843c9..1ab1bb016 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched/2-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched/2-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam/2-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam/2-1.sh
index 51416dc4c..1d17d7352 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam/2-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam/2-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, QUALCOMM Inc. All rights reserved.
 # Created by:  abisain REMOVE-THIS AT qualcomm DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/1-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/1-1.sh
index 84caa057a..b0ec24239 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/1-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/1-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/3-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/3-1.sh
index 8b313fc7b..48a16e266 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/3-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/3-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope/2-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope/2-1.sh
index d7ab68259..71eca6279 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope/2-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope/2-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack/2-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack/2-1.sh
index 0ce6a3443..6dd4aa620 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack/2-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack/2-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize/2-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize/2-1.sh
index 0ce6a3443..6dd4aa620 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize/2-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize/2-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/3-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/3-1.sh
index 9b4452d81..98f53eb19 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/3-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/3-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/2-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/2-1.sh
index 18612c808..ff1d1622f 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/2-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/2-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, QUALCOMM Inc. All rights reserved.
 # Created by:  abisain REMOVE-THIS AT qualcomm DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy/3-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy/3-1.sh
index c8d977f0b..8b181888b 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy/3-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy/3-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope/3-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope/3-1.sh
index 174ddadc9..02ab551b5 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope/3-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope/3-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack/3-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack/3-1.sh
index 871def244..c076f468f 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack/3-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack/3-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack/5-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack/5-1.sh
index 871def244..c076f468f 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack/5-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack/5-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize/3-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize/3-1.sh
index 871def244..c076f468f 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize/3-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize/3-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/2-1.sh b/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/2-1.sh
index a3cf4dc76..d27e0ab32 100755
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/2-1.sh
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/2-1.sh
@@ -1,4 +1,3 @@
-
 #!/bin/sh
 # Copyright (c) 2004, Intel Corporation. All rights reserved.
 # Created by:  crystal.xiong REMOVE-THIS AT intel DOT com
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
