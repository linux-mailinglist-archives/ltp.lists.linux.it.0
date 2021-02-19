Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B0E31FB2E
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 15:47:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 853C53C65CE
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 15:47:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 6DD443C65AD
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 15:47:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7AB9E1401236
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 15:47:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9DE6ACBF;
 Fri, 19 Feb 2021 14:47:09 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 19 Feb 2021 15:47:03 +0100
Message-Id: <20210219144704.20433-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210219144704.20433-1-pvorel@suse.cz>
References: <20210219144704.20433-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] libclone: Move test.h include to C file
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

so that libclone.h can be used in new API tests.

This requires to include test.sh earlier in mqns_helper.h.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/containers/libclone/libclone.c | 1 +
 testcases/kernel/containers/libclone/libclone.h | 1 -
 testcases/kernel/containers/mqns/mqns_helper.h  | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/containers/libclone/libclone.c b/testcases/kernel/containers/libclone/libclone.c
index 239674ff8..8ffde0ffc 100644
--- a/testcases/kernel/containers/libclone/libclone.c
+++ b/testcases/kernel/containers/libclone/libclone.c
@@ -15,6 +15,7 @@
 *
 ***************************************************************************/
 #include "libclone.h"
+#include "test.h"
 
 int do_clone_tests(unsigned long clone_flags,
 		   int (*fn1) (void *arg), void *arg1,
diff --git a/testcases/kernel/containers/libclone/libclone.h b/testcases/kernel/containers/libclone/libclone.h
index b8740f1bc..354555a26 100644
--- a/testcases/kernel/containers/libclone/libclone.h
+++ b/testcases/kernel/containers/libclone/libclone.h
@@ -27,7 +27,6 @@
 #include <sys/syscall.h>
 #include <signal.h>
 #include "lapi/syscalls.h"
-#include "test.h"
 #include "lapi/namespaces_constants.h"
 
 #define T_UNSHARE 0
diff --git a/testcases/kernel/containers/mqns/mqns_helper.h b/testcases/kernel/containers/mqns/mqns_helper.h
index 605378d48..463330ce6 100644
--- a/testcases/kernel/containers/mqns/mqns_helper.h
+++ b/testcases/kernel/containers/mqns/mqns_helper.h
@@ -21,9 +21,9 @@
 #include <sys/types.h>
 #include <mqueue.h>
 #include "../libclone/libclone.h"
+#include "test.h"
 #include "lapi/syscalls.h"
 #include "safe_macros.h"
-#include "test.h"
 
 static int dummy_child(void *v)
 {
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
