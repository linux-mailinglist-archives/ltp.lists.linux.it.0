Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4AE4566BE
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 00:58:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D4843C0930
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 00:58:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 151203C899C
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 00:58:01 +0100 (CET)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8E1046020DA
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 00:58:00 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 8EE8B1F47098
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637279879; bh=rwtNSWvQX+7xmt4GpPOTiL9OPrYhl410OyKlms/69DM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lczo/mflAaBuy9MpBNjiu1SuW4YKg7VGHA/bCkH9Vys8R37xu7W3qcTj2F/iEDNdO
 17v1fmFGUNlVtm5S/hsnXfG5oAFf61SrA3csMsiRwgJsDHYC3o0Pk/Ggz5B7wb4lw8
 qyR45NZfZKBw3aVElhADXqKyG3nfXo3/IUbc7D1EkkmR7mx/4+VBsFVvADOXXy/9TJ
 uuRZkia7WI8pBPBmbmx79lewEY4CLFG83mToVT9KAb37eb+o8sQTV4lFRZ0dfFtWzP
 Ak/W9uR332SSRUpETuWb5++pozDBHWeXAnMcWqPj07njWDdSkB0+88JVmADS6mt6KH
 CY1Jt2QbmF1lQ==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: pvorel@suse.cz,
	jack@suse.com,
	amir73il@gmail.com,
	repnop@google.com
Date: Thu, 18 Nov 2021 18:57:37 -0500
Message-Id: <20211118235744.802584-3-krisman@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211118235744.802584-1-krisman@collabora.com>
References: <20211118235744.802584-1-krisman@collabora.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/9] syscalls: fanotify: Add macro to require
 specific events
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
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>, linux-ext4@vger.kernel.org,
 kernel@collabora.com, ltp@lists.linux.it, khazhy@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add a helper for tests to fail if an event is not available in the
kernel.  Since some events only work with REPORT_FID or a specific
class, update the verifier to allow those to be specified.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Reviewed-by: Matthew Bobrowski <repnop@google.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
If I understand correctly, the decision was to leave fanotify10
unchanged and this is what I've done here.

Changes since v1:
  - Use SAFE_FANOTIFY_INIT instead of open coding. (Amir)
  - Use FAN_CLASS_NOTIF for fanotify12 testcase. (Amir)
---
 testcases/kernel/syscalls/fanotify/fanotify.h   | 17 ++++++++++++++---
 testcases/kernel/syscalls/fanotify/fanotify03.c |  4 ++--
 testcases/kernel/syscalls/fanotify/fanotify10.c |  3 ++-
 testcases/kernel/syscalls/fanotify/fanotify12.c |  3 ++-
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index b9f430fe0c35..242245826004 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -287,14 +287,16 @@ static inline void require_fanotify_access_permissions_supported_by_kernel(void)
 	SAFE_CLOSE(fd);
 }
 
-static inline int fanotify_events_supported_by_kernel(uint64_t mask)
+static inline int fanotify_events_supported_by_kernel(uint64_t mask,
+						      unsigned int init_flags,
+						      unsigned int mark_flags)
 {
 	int fd;
 	int rval = 0;
 
-	fd = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
+	fd = SAFE_FANOTIFY_INIT(init_flags, O_RDONLY);
 
-	if (fanotify_mark(fd, FAN_MARK_ADD, mask, AT_FDCWD, ".") < 0) {
+	if (fanotify_mark(fd, FAN_MARK_ADD | mark_flags, mask, AT_FDCWD, ".") < 0) {
 		if (errno == EINVAL) {
 			rval = -1;
 		} else {
@@ -404,4 +406,13 @@ static inline int fanotify_mark_supported_by_kernel(uint64_t flag)
 				    fanotify_mark_supported_by_kernel(mark_type)); \
 } while (0)
 
+#define REQUIRE_FANOTIFY_EVENTS_SUPPORTED_ON_FS(init_flags, mark_type, mask, fname) do { \
+	if (mark_type)							\
+		REQUIRE_MARK_TYPE_SUPPORTED_BY_KERNEL(mark_type);	\
+	if (init_flags)							\
+		REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(init_flags, fname); \
+	fanotify_init_flags_err_msg(#mask, __FILE__, __LINE__, tst_brk_, \
+		fanotify_events_supported_by_kernel(mask, init_flags, mark_type)); \
+} while (0)
+
 #endif /* __FANOTIFY_H__ */
diff --git a/testcases/kernel/syscalls/fanotify/fanotify03.c b/testcases/kernel/syscalls/fanotify/fanotify03.c
index 26d17e64d1f5..2081f0bd1b57 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify03.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify03.c
@@ -323,8 +323,8 @@ static void setup(void)
 	require_fanotify_access_permissions_supported_by_kernel();
 
 	filesystem_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_FILESYSTEM);
-	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC_PERM);
-
+	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC_PERM,
+								      FAN_CLASS_CONTENT, 0);
 	sprintf(fname, MOUNT_PATH"/fname_%d", getpid());
 	SAFE_FILE_PRINTF(fname, "1");
 
diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index 92e4d3ff3054..0fa9d1f4f7e4 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -509,7 +509,8 @@ cleanup:
 
 static void setup(void)
 {
-	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC);
+	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC,
+								      FAN_CLASS_CONTENT, 0);
 	filesystem_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_FILESYSTEM);
 	fan_report_dfid_unsupported = fanotify_init_flags_supported_on_fs(FAN_REPORT_DFID_NAME,
 									  MOUNT_PATH);
diff --git a/testcases/kernel/syscalls/fanotify/fanotify12.c b/testcases/kernel/syscalls/fanotify/fanotify12.c
index 76f1aca77615..c77dbfd8c23d 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify12.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify12.c
@@ -222,7 +222,8 @@ cleanup:
 
 static void do_setup(void)
 {
-	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC);
+	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC,
+								      FAN_CLASS_NOTIF, 0);
 
 	sprintf(fname, "fname_%d", getpid());
 	SAFE_FILE_PRINTF(fname, "1");
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
