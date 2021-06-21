Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 421DF3AE83C
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 13:38:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 098CB3C8EB9
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 13:38:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 51A153C8EE8
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 13:38:24 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 15CE21400DA5
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 13:38:22 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7B4521FD2F;
 Mon, 21 Jun 2021 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624275502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJr6so0gS3SHtzNk8uuFZcMQtCHZW9iXr+7npnUSMgY=;
 b=bthzWspQ0NbIgWyEWC8Yto8kXMtaHtbEzyFYibyvzgu0XohfIguVizUzhlGjbZxtox91YQ
 wK/tK9BCwolWdwlwoIM79kGoZKb/A3rgX3MtQcqwztzkw6Sivqp2DKYnbke4YsvsbDGioq
 yheOke5EFecBQkNnwA+Zo33D/bfh8Cc=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 3DEE4A3BAA;
 Mon, 21 Jun 2021 11:38:22 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 21 Jun 2021 12:38:03 +0100
Message-Id: <20210621113804.26179-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621113804.26179-1-rpalethorpe@suse.com>
References: <20210621113804.26179-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] API: Remove TEST macro usage from library headers
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

Technically the headers are part of the test translation unit. However
we think of them as being part of the API. So we should also remove
TEST from here.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Suggested-by: Li Wang <liwang@redhat.com>
---
 include/lapi/clone.h             |  6 ++++--
 include/lapi/fsmount.h           | 10 ++++++----
 include/lapi/init_module.h       |  6 ++++--
 include/lapi/io_uring.h          |  9 +++++----
 include/lapi/name_to_handle_at.h |  7 ++++---
 include/lapi/openat2.h           |  6 ++++--
 6 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/include/lapi/clone.h b/include/lapi/clone.h
index 81db443c9..5bf51d90e 100644
--- a/include/lapi/clone.h
+++ b/include/lapi/clone.h
@@ -39,10 +39,12 @@ static inline int clone3(struct clone_args *args, size_t size)
 
 static inline void clone3_supported_by_kernel(void)
 {
+	long ret;
+
 	if ((tst_kvercmp(5, 3, 0)) < 0) {
 		/* Check if the syscall is backported on an older kernel */
-		TEST(syscall(__NR_clone3, NULL, 0));
-		if (TST_RET == -1 && TST_ERR == ENOSYS)
+		ret = syscall(__NR_clone3, NULL, 0);
+		if (ret == -1 && errno == ENOSYS)
 			tst_brk(TCONF, "Test not supported on kernel version < v5.3");
 	}
 }
diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
index d6ebed9b4..dc39c8791 100644
--- a/include/lapi/fsmount.h
+++ b/include/lapi/fsmount.h
@@ -133,12 +133,14 @@ enum fsconfig_command {
 
 static inline void fsopen_supported_by_kernel(void)
 {
+	long ret;
+
 	if ((tst_kvercmp(5, 2, 0)) < 0) {
 		/* Check if the syscall is backported on an older kernel */
-		TEST(syscall(__NR_fsopen, NULL, 0));
-		if (TST_RET != -1)
-			SAFE_CLOSE(TST_RET);
-		else if (TST_ERR == ENOSYS)
+		ret = syscall(__NR_fsopen, NULL, 0);
+		if (ret != -1)
+			SAFE_CLOSE(ret);
+		else if (errno == ENOSYS)
 			tst_brk(TCONF, "Test not supported on kernel version < v5.2");
 	}
 }
diff --git a/include/lapi/init_module.h b/include/lapi/init_module.h
index 14eaabee6..48464a2e4 100644
--- a/include/lapi/init_module.h
+++ b/include/lapi/init_module.h
@@ -24,10 +24,12 @@ static inline int finit_module(int fd, const char *param_values, int flags)
 
 static inline void finit_module_supported_by_kernel(void)
 {
+       long ret;
+
        if ((tst_kvercmp(3, 8, 0)) < 0) {
                /* Check if the syscall is backported on an older kernel */
-               TEST(syscall(__NR_finit_module, 0, "", 0));
-               if (TST_RET == -1 && TST_ERR == ENOSYS)
+               ret = syscall(__NR_finit_module, 0, "", 0);
+               if (ret == -1 && errno == ENOSYS)
                        tst_brk(TCONF, "Test not supported on kernel version < v3.8");
        }
 }
diff --git a/include/lapi/io_uring.h b/include/lapi/io_uring.h
index 897ed7c64..e5c879951 100644
--- a/include/lapi/io_uring.h
+++ b/include/lapi/io_uring.h
@@ -296,11 +296,12 @@ static inline int io_uring_enter(int fd, unsigned int to_submit,
 
 static inline void io_uring_setup_supported_by_kernel(void)
 {
+	long ret;
 	if ((tst_kvercmp(5, 1, 0)) < 0) {
-		TEST(syscall(__NR_io_uring_setup, NULL, 0));
-		if (TST_RET != -1)
-			SAFE_CLOSE(TST_RET);
-		else if (TST_ERR == ENOSYS)
+		ret = syscall(__NR_io_uring_setup, NULL, 0);
+		if (ret != -1)
+			SAFE_CLOSE(ret);
+		else if (errno == ENOSYS)
 			tst_brk(TCONF,
 				"Test not supported on kernel version < v5.1");
 	}
diff --git a/include/lapi/name_to_handle_at.h b/include/lapi/name_to_handle_at.h
index 275db4ae0..3f081f1c0 100644
--- a/include/lapi/name_to_handle_at.h
+++ b/include/lapi/name_to_handle_at.h
@@ -34,6 +34,7 @@ static inline int open_by_handle_at(int mount_fd, struct file_handle *handle,
 static inline struct file_handle *
 allocate_file_handle(int dfd, const char *pathname)
 {
+	long ret;
 	struct file_handle fh = {}, *fhp;
 	int mount_id;
 
@@ -41,9 +42,9 @@ allocate_file_handle(int dfd, const char *pathname)
 	 * Make an initial call to name_to_handle_at() to discover the size
 	 * required for the file handle.
 	 */
-	TEST(name_to_handle_at(dfd, pathname, &fh, &mount_id, 0));
-	if (TST_RET != -1 || TST_ERR != EOVERFLOW) {
-		tst_res(TFAIL | TTERRNO,
+	ret = name_to_handle_at(dfd, pathname, &fh, &mount_id, 0);
+	if (ret != -1 || errno != EOVERFLOW) {
+		tst_res(TFAIL | TERRNO,
 			"name_to_handle_at() should fail with EOVERFLOW");
 		return NULL;
 	}
diff --git a/include/lapi/openat2.h b/include/lapi/openat2.h
index d4154c26e..46804a441 100644
--- a/include/lapi/openat2.h
+++ b/include/lapi/openat2.h
@@ -62,10 +62,12 @@ struct open_how_pad {
 
 static inline void openat2_supported_by_kernel(void)
 {
+	long ret;
+
 	if ((tst_kvercmp(5, 6, 0)) < 0) {
 		/* Check if the syscall is backported on an older kernel */
-		TEST(syscall(__NR_openat2, -1, NULL, NULL, 0));
-		if (TST_RET == -1 && TST_ERR == ENOSYS)
+		ret = syscall(__NR_openat2, -1, NULL, NULL, 0);
+		if (ret == -1 && errno == ENOSYS)
 			tst_brk(TCONF, "Test not supported on kernel version < v5.6");
 	}
 }
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
