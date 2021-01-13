Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C31862F458A
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 08:51:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E2B13C6AAE
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 08:51:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0A45B3C5DCE
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 08:51:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EA2C7200C0F
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 08:51:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2741CADE0;
 Wed, 13 Jan 2021 07:51:21 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 13 Jan 2021 08:51:07 +0100
Message-Id: <20210113075110.31628-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/3] Build fix undefined struct file_handle
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

Hi,

changes v1->v2:
* use autotools to detect struct file_handle

Kind regards,
Petr

diff --git configure.ac configure.ac
index 06be1c094..e44e25cc6 100644
--- configure.ac
+++ configure.ac
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
diff --git include/lapi/fcntl.h include/lapi/fcntl.h
index ab460beb3..e08970c4f 100644
--- include/lapi/fcntl.h
+++ include/lapi/fcntl.h
@@ -141,13 +141,13 @@
 # define MAX_HANDLE_SZ	128
 #endif
 
-#ifndef HAVE_NAME_TO_HANDLE_AT
+#ifndef HAVE_STRUCT_FILE_HANDLE
 struct file_handle {
 	unsigned int handle_bytes;
 	int handle_type;
 	/* File identifier.  */
 	unsigned char f_handle[0];
 };
-#endif /* HAVE_NAME_TO_HANDLE_AT */
+#endif /* HAVE_STRUCT_FILE_HANDLE */
 
 #endif /* __LAPI_FCNTL_H__ */

Petr Vorel (3):
  lapi: Move struct file_handle into lapi/fcntl.h
  fanotify: Fix build on undefined struct file_handle
  syscalls: Remove unused include <fcntl.h>

 configure.ac                                           |  6 ++++++
 include/lapi/fcntl.h                                   | 10 ++++++++++
 include/lapi/name_to_handle_at.h                       |  9 +--------
 testcases/kernel/syscalls/fanotify/fanotify.h          |  2 +-
 testcases/kernel/syscalls/fanotify/fanotify09.c        |  1 -
 testcases/kernel/syscalls/fanotify/fanotify13.c        |  1 -
 testcases/kernel/syscalls/fanotify/fanotify15.c        |  1 -
 testcases/kernel/syscalls/fanotify/fanotify16.c        |  1 -
 .../syscalls/name_to_handle_at/name_to_handle_at01.c   |  1 -
 .../syscalls/name_to_handle_at/name_to_handle_at02.c   |  1 -
 .../syscalls/open_by_handle_at/open_by_handle_at01.c   |  1 -
 .../syscalls/open_by_handle_at/open_by_handle_at02.c   |  1 -
 12 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
