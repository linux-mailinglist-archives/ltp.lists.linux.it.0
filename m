Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C679E3DE7FF
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:10:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89F303C8133
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:10:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2FE863C57C1
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 23:47:09 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2D5961A00985
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 23:47:09 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 556101F42CE9
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: ltp@lists.linux.it,
	jack@suse.com,
	amir73il@gmail.com
Date: Mon,  2 Aug 2021 17:46:41 -0400
Message-Id: <20210802214645.2633028-4-krisman@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802214645.2633028-1-krisman@collabora.com>
References: <20210802214645.2633028-1-krisman@collabora.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 03 Aug 2021 10:10:09 +0200
Subject: [LTP] [PATCH 3/7] syscalls/fanotify20: Validate incoming FID in
 FAN_FS_ERROR
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
 kernel@collabora.com, khazhy@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Verify the FID provided in the event.  If the testcase has a null inode,
this is assumed to be a superblock error (i.e. null FH).

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 .../kernel/syscalls/fanotify/fanotify20.c     | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify20.c b/testcases/kernel/syscalls/fanotify/fanotify20.c
index fd5cfb8744f1..d8d788ae685f 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify20.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify20.c
@@ -40,6 +40,14 @@
 
 #define FAN_EVENT_INFO_TYPE_ERROR	4
 
+#ifndef FILEID_INVALID
+#define	FILEID_INVALID		0xff
+#endif
+
+#ifndef FILEID_INO32_GEN
+#define FILEID_INO32_GEN	1
+#endif
+
 struct fanotify_event_info_error {
 	struct fanotify_event_info_header hdr;
 	__s32 error;
@@ -57,6 +65,9 @@ static const struct test_case {
 	char *name;
 	int error;
 	unsigned int error_count;
+
+	/* inode can be null for superblock errors */
+	unsigned int *inode;
 	void (*trigger_error)(void);
 	void (*prepare_fs)(void);
 } testcases[] = {
@@ -83,6 +94,42 @@ struct fanotify_event_info_header *get_event_info(
 	((struct fanotify_event_info_error *)				\
 	 get_event_info((event), FAN_EVENT_INFO_TYPE_ERROR))
 
+#define get_event_info_fid(event)					\
+	((struct fanotify_event_info_fid *)				\
+	 get_event_info((event), FAN_EVENT_INFO_TYPE_FID))
+
+int check_error_event_info_fid(struct fanotify_event_info_fid *fid,
+				 const struct test_case *ex)
+{
+	int fail = 0;
+	struct file_handle *fh = (struct file_handle *) &fid->handle;
+
+	if (!ex->inode) {
+		uint32_t *h = (uint32_t *) fh->f_handle;
+
+		if (!(fh->handle_type == FILEID_INVALID && !h[0] && !h[1])) {
+			tst_res(TFAIL, "%s: file handle should have been invalid",
+				ex->name);
+			fail++;
+		}
+		return fail;
+	} else if (fh->handle_type == FILEID_INO32_GEN) {
+		uint32_t *h = (uint32_t *) fh->f_handle;
+
+		if (h[0] != *ex->inode) {
+			tst_res(TFAIL,
+				"%s: Unexpected file handle inode (%u!=%u)",
+				ex->name, *ex->inode, h[0]);
+			fail++;
+		}
+	} else {
+		tst_res(TFAIL, "%s: Test can't handle received FH type (%d)",
+			ex->name, fh->handle_type);
+	}
+
+	return fail;
+}
+
 int check_error_event_info_error(struct fanotify_event_info_error *info_error,
 				 const struct test_case *ex)
 {
@@ -126,6 +173,7 @@ void check_event(char *buf, size_t len, const struct test_case *ex)
 	struct fanotify_event_metadata *event =
 		(struct fanotify_event_metadata *) buf;
 	struct fanotify_event_info_error *info_error;
+	struct fanotify_event_info_fid *info_fid;
 	int fail = 0;
 
 	if (len < FAN_EVENT_METADATA_LEN)
@@ -137,6 +185,9 @@ void check_event(char *buf, size_t len, const struct test_case *ex)
 	info_error = get_event_info_error(event);
 	fail += info_error ? check_error_event_info_error(info_error, ex) : 1;
 
+	info_fid = get_event_info_fid(event);
+	fail += info_fid ? check_error_event_info_fid(info_fid, ex) : 1;
+
 	if (!fail)
 		tst_res(TPASS, "Successfully received: %s", ex->name);
 }
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
