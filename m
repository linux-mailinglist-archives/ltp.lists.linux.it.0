Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B10394566C6
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 00:58:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FEC43C89B0
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 00:58:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B0F2A3C899B
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 00:58:12 +0100 (CET)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7A47D200C35
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 00:58:11 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 6F3011F47098
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637279890; bh=4ltSuo40feNEKTd2UPvpFTWVFo8E467iYwf8MrGWWsI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gj4puOQidzdmoh+rbbV9V6lxoqfxlItPgG4r47eWBimj6snhUHU7+LkFNXj4oR5Ks
 ejqFoIhS2kNpcNrC9rqlMKig+Ugt0XU1aUyLKcXOKEYa5q+MIHpRqDSCdaHQX0Iytm
 0QAMOlk84BtXCncioDEgMB1R2ZXF3eqyhvhGyhGnvu+zSY90yd40omwrTgQg7Nv8BX
 yGRETZUiAHEnBNQvEb/3+F/vK8Q1NxsflyVzlqpUiwX+aGG54ErqjSJICBMB9DNY20
 DpmRd6II8JYP9NBfkT9n937bGcRrffKX/RLmk2pgNg79qCjZ40gw7AbO/RzTNuHoy9
 28XYW4cglQq8Q==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: pvorel@suse.cz,
	jack@suse.com,
	amir73il@gmail.com,
	repnop@google.com
Date: Thu, 18 Nov 2021 18:57:40 -0500
Message-Id: <20211118235744.802584-6-krisman@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211118235744.802584-1-krisman@collabora.com>
References: <20211118235744.802584-1-krisman@collabora.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 5/9] syscalls/fanotify22: Validate incoming FID in
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
 kernel@collabora.com, ltp@lists.linux.it, khazhy@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Verify the FID provided in the event.  If the FH has size 0, this is
assumed to be a superblock error (i.e. null FH).

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
Changes since v2:
  - Move FILEID_INVALID define to header file (Amir)
  - Don't use FSID_VAL_MEMBER (Petr)
Changes since v1:
  - Move defines to header file.
  - Use 0-len FH for sb error
---
 testcases/kernel/syscalls/fanotify/fanotify.h |  8 +++
 .../kernel/syscalls/fanotify/fanotify22.c     | 60 +++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 6b0e68a23a6b..f7778bb36b4d 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -255,6 +255,10 @@ static inline void fanotify_get_fid(const char *path, __kernel_fsid_t *fsid,
 	}
 }
 
+#ifndef FILEID_INVALID
+#define FILEID_INVALID		0xff
+#endif
+
 struct fanotify_fid_t {
 	__kernel_fsid_t fsid;
 	struct file_handle handle;
@@ -450,4 +454,8 @@ struct fanotify_event_info_header *get_event_info(
 	((struct fanotify_event_info_error *)				\
 	 get_event_info((event), FAN_EVENT_INFO_TYPE_ERROR))
 
+#define get_event_info_fid(event)					\
+	((struct fanotify_event_info_fid *)				\
+	 get_event_info((event), FAN_EVENT_INFO_TYPE_FID))
+
 #endif /* __FANOTIFY_H__ */
diff --git a/testcases/kernel/syscalls/fanotify/fanotify22.c b/testcases/kernel/syscalls/fanotify/fanotify22.c
index d324191c28c8..eeee582f1268 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify22.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify22.c
@@ -40,6 +40,9 @@ int fd_notify;
 
 #define MOUNT_PATH "test_mnt"
 
+/* These expected FIDs are common to multiple tests */
+static struct fanotify_fid_t null_fid;
+
 static void trigger_fs_abort(void)
 {
 	SAFE_MOUNT(tst_device->dev, MOUNT_PATH, tst_device->fs_type,
@@ -50,6 +53,7 @@ static struct test_case {
 	char *name;
 	int error;
 	unsigned int error_count;
+	struct fanotify_fid_t *fid;
 	void (*trigger_error)(void);
 } testcases[] = {
 	{
@@ -57,9 +61,43 @@ static struct test_case {
 		.trigger_error = &trigger_fs_abort,
 		.error_count = 1,
 		.error = ESHUTDOWN,
+		.fid = &null_fid,
 	},
 };
 
+int check_error_event_info_fid(struct fanotify_event_info_fid *fid,
+				 const struct test_case *ex)
+{
+	struct file_handle *fh = (struct file_handle *) &fid->handle;
+
+	if (memcmp(&fid->fsid, &ex->fid->fsid, sizeof(fid->fsid))) {
+		tst_res(TFAIL, "%s: Received bad FSID type (%x...!=%x...)",
+			ex->name, FSID_VAL_MEMBER(fid->fsid, 0),
+			ex->fid->fsid.val[0]);
+
+		return 1;
+	}
+	if (fh->handle_type != ex->fid->handle.handle_type) {
+		tst_res(TFAIL, "%s: Received bad file_handle type (%d!=%d)",
+			ex->name, fh->handle_type, ex->fid->handle.handle_type);
+		return 1;
+	}
+
+	if (fh->handle_bytes != ex->fid->handle.handle_bytes) {
+		tst_res(TFAIL, "%s: Received bad file_handle len (%d!=%d)",
+			ex->name, fh->handle_bytes, ex->fid->handle.handle_bytes);
+		return 1;
+	}
+
+	if (memcmp(fh->f_handle, ex->fid->handle.f_handle, fh->handle_bytes)) {
+		tst_res(TFAIL, "%s: Received wrong handle. "
+			"Expected (%x...) got (%x...) ", ex->name,
+			*(int *)ex->fid->handle.f_handle, *(int *)fh->f_handle);
+		return 1;
+	}
+	return 0;
+}
+
 int check_error_event_info_error(struct fanotify_event_info_error *info_error,
 				 const struct test_case *ex)
 {
@@ -103,6 +141,7 @@ void check_event(char *buf, size_t len, const struct test_case *ex)
 	struct fanotify_event_metadata *event =
 		(struct fanotify_event_metadata *) buf;
 	struct fanotify_event_info_error *info_error;
+	struct fanotify_event_info_fid *info_fid;
 	int fail = 0;
 
 	if (len < FAN_EVENT_METADATA_LEN) {
@@ -121,6 +160,14 @@ void check_event(char *buf, size_t len, const struct test_case *ex)
 		fail++;
 	}
 
+	info_fid = get_event_info_fid(event);
+	if (info_fid)
+		fail += check_error_event_info_fid(info_fid, ex);
+	else {
+		tst_res(TFAIL, "FID record not found");
+		fail++;
+	}
+
 	if (!fail)
 		tst_res(TPASS, "Successfully received: %s", ex->name);
 }
@@ -143,6 +190,17 @@ static void do_test(unsigned int i)
 	check_event(event_buf, read_len, tcase);
 }
 
+static void init_null_fid(void)
+{
+	/* Use fanotify_save_fid to fill the fsid and overwrite the
+	 * file_handler to create a null_fid
+	 */
+	fanotify_save_fid(MOUNT_PATH, &null_fid);
+
+	null_fid.handle.handle_type = FILEID_INVALID;
+	null_fid.handle.handle_bytes = 0;
+}
+
 static void setup(void)
 {
 	REQUIRE_FANOTIFY_EVENTS_SUPPORTED_ON_FS(FAN_CLASS_NOTIF|FAN_REPORT_FID,
@@ -151,6 +209,8 @@ static void setup(void)
 
 	fd_notify = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF|FAN_REPORT_FID,
 				       O_RDONLY);
+
+	init_null_fid();
 }
 
 static void cleanup(void)
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
