Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 810EA3DE809
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:11:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26E523C8867
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:11:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55D703C57C1
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 23:47:21 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D87C42000EF
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 23:47:20 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id C78EC1F42CCA
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: ltp@lists.linux.it,
	jack@suse.com,
	amir73il@gmail.com
Date: Mon,  2 Aug 2021 17:46:44 -0400
Message-Id: <20210802214645.2633028-7-krisman@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802214645.2633028-1-krisman@collabora.com>
References: <20210802214645.2633028-1-krisman@collabora.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 03 Aug 2021 10:10:09 +0200
Subject: [LTP] [PATCH 6/7] syscalls/fanotify20: Test file event with broken
 inode
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

This test corrupts an inode entry with an invalid mode through debugfs
and then tries to access it.  This should result in a ext4 error, which
we monitor through the fanotify group.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 .../kernel/syscalls/fanotify/fanotify20.c     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify20.c b/testcases/kernel/syscalls/fanotify/fanotify20.c
index e7ced28eb61d..0c63e90edc3a 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify20.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify20.c
@@ -76,6 +76,36 @@ static void trigger_fs_abort(void)
 		   MS_REMOUNT|MS_RDONLY, "abort");
 }
 
+#define TCASE2_BASEDIR "tcase2"
+#define TCASE2_BAD_DIR TCASE2_BASEDIR"/bad_dir"
+
+static unsigned int tcase2_bad_ino;
+static void tcase2_prepare_fs(void)
+{
+	struct stat stat;
+
+	SAFE_MKDIR(MOUNT_PATH"/"TCASE2_BASEDIR, 0777);
+	SAFE_MKDIR(MOUNT_PATH"/"TCASE2_BAD_DIR, 0777);
+
+	SAFE_STAT(MOUNT_PATH"/"TCASE2_BAD_DIR, &stat);
+	tcase2_bad_ino = stat.st_ino;
+
+	SAFE_UMOUNT(MOUNT_PATH);
+	do_debugfs_request(tst_device->dev, "sif " TCASE2_BAD_DIR " mode 0xff");
+	SAFE_MOUNT(tst_device->dev, MOUNT_PATH, tst_device->fs_type, 0, NULL);
+}
+
+static void tcase2_trigger_lookup(void)
+{
+	int ret;
+
+	/* SAFE_OPEN cannot be used here because we expect it to fail. */
+	ret = open(MOUNT_PATH"/"TCASE2_BAD_DIR, O_RDONLY, 0);
+	if (ret != -1 && errno != EUCLEAN)
+		tst_res(TFAIL, "Unexpected lookup result(%d) of %s (%d!=%d)",
+			ret, TCASE2_BAD_DIR, errno, EUCLEAN);
+}
+
 static const struct test_case {
 	char *name;
 	int error;
@@ -92,6 +122,14 @@ static const struct test_case {
 		.error_count = 1,
 		.error = EXT4_ERR_ESHUTDOWN,
 		.inode = NULL
+	},
+	{
+		.name = "Lookup of inode with invalid mode",
+		.prepare_fs = tcase2_prepare_fs,
+		.trigger_error = &tcase2_trigger_lookup,
+		.error_count = 1,
+		.error = 0,
+		.inode = &tcase2_bad_ino,
 	}
 };
 
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
