Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7FA2F4589
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 08:51:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0B293C6AA6
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 08:51:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EFB713C6AA3
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 08:51:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EC886100035D
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 08:51:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53371AED7;
 Wed, 13 Jan 2021 07:51:21 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 13 Jan 2021 08:51:08 +0100
Message-Id: <20210113075110.31628-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113075110.31628-1-pvorel@suse.cz>
References: <20210113075110.31628-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] lapi: Move struct file_handle into lapi/fcntl.h
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

that way it can be used in fanotify tests
(some of use the struct, but not name_to_handle_at() syscall)
and the struct is defined in <fcntl.h> anyway.

Although detection with HAVE_NAME_TO_HANDLE_AT works (at least on glibc,
musl and uclibc-ng) add proper autotools check for the struct presence.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 configure.ac                     |  6 ++++++
 include/lapi/fcntl.h             | 10 ++++++++++
 include/lapi/name_to_handle_at.h |  9 +--------
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/configure.ac b/configure.ac
index 06be1c094..e44e25cc6 100644
--- a/configure.ac
+++ b/configure.ac
@@ -148,6 +148,12 @@ AC_CHECK_TYPES([struct acct_v3],,,[#include <sys/acct.h>])
 AC_CHECK_TYPES([struct af_alg_iv, struct sockaddr_alg],,,[# include <linux/if_alg.h>])
 AC_CHECK_TYPES([struct fanotify_event_info_fid, struct fanotify_event_info_header],,,[#include <sys/fanotify.h>])
 AC_CHECK_TYPES([struct file_dedupe_range],,,[#include <linux/fs.h>])
+
+AC_CHECK_TYPES([struct file_handle],,,[
+#define _GNU_SOURCE
+#include <fcntl.h>
+])
+
 AC_CHECK_TYPES([struct fs_quota_statv],,,[#include <xfs/xqm.h>])
 AC_CHECK_TYPES([struct if_nextdqblk],,,[#include <linux/quota.h>])
 AC_CHECK_TYPES([struct iovec],,,[#include <sys/uio.h>])
diff --git a/include/lapi/fcntl.h b/include/lapi/fcntl.h
index d6665915f..e08970c4f 100644
--- a/include/lapi/fcntl.h
+++ b/include/lapi/fcntl.h
@@ -6,6 +6,7 @@
 #ifndef __LAPI_FCNTL_H__
 #define __LAPI_FCNTL_H__
 
+#include "config.h"
 #include <fcntl.h>
 #include <sys/socket.h>
 
@@ -140,4 +141,13 @@
 # define MAX_HANDLE_SZ	128
 #endif
 
+#ifndef HAVE_STRUCT_FILE_HANDLE
+struct file_handle {
+	unsigned int handle_bytes;
+	int handle_type;
+	/* File identifier.  */
+	unsigned char f_handle[0];
+};
+#endif /* HAVE_STRUCT_FILE_HANDLE */
+
 #endif /* __LAPI_FCNTL_H__ */
diff --git a/include/lapi/name_to_handle_at.h b/include/lapi/name_to_handle_at.h
index 3484133d1..275db4ae0 100644
--- a/include/lapi/name_to_handle_at.h
+++ b/include/lapi/name_to_handle_at.h
@@ -15,13 +15,6 @@
 #include "tst_test.h"
 
 #ifndef HAVE_NAME_TO_HANDLE_AT
-struct file_handle {
-	unsigned int handle_bytes;
-	int handle_type;
-	/* File identifier.  */
-	unsigned char f_handle[0];
-};
-
 static inline int name_to_handle_at(int dfd, const char *pathname,
                                     struct file_handle *handle,
                                     int *mount_id, int flags)
@@ -35,7 +28,7 @@ static inline int open_by_handle_at(int mount_fd, struct file_handle *handle,
 {
 	return tst_syscall(__NR_open_by_handle_at, mount_fd, handle, flags);
 }
-#endif
+#endif /* HAVE_NAME_TO_HANDLE_AT */
 
 /* Returns a valid pointer on success, NULL on errors */
 static inline struct file_handle *
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
