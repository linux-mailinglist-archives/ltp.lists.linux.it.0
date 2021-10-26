Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A1B43B9DB
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 20:44:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE0D43C6A5B
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 20:44:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 24BC13C6941
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 20:43:58 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7FFC060207B
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 20:43:57 +0200 (CEST)
Received: from localhost (unknown [IPv6:2804:14c:124:8a08::1002])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: krisman)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 85B4F1F43877;
 Tue, 26 Oct 2021 19:43:56 +0100 (BST)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: ltp@lists.linux.it,
	jack@suse.com,
	amir73il@gmail.com
Date: Tue, 26 Oct 2021 15:42:35 -0300
Message-Id: <20211026184239.151156-7-krisman@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211026184239.151156-1-krisman@collabora.com>
References: <20211026184239.151156-1-krisman@collabora.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 06/10] syscalls/fanotify20: Support submission of
 debugfs commands
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
Cc: linux-ext4@vger.kernel.org, kernel@collabora.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>, khazhy@google.com,
 repnop@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In order to test FAN_FS_ERROR, we want to corrupt the filesystem.  The
easiest way to do it is by using debugfs.  Add a small helper to issue
debugfs requests.  Since most likely this will be the only testcase to
need this, don't bother making it a proper helper for now.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
changes since v1:
  - Add .needs_cmds to require debugfs
---
 testcases/kernel/syscalls/fanotify/fanotify20.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify20.c b/testcases/kernel/syscalls/fanotify/fanotify20.c
index 220cd51419e8..7c4b01720654 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify20.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify20.c
@@ -47,6 +47,13 @@ int fd_notify;
 /* These expected FIDs are common to multiple tests */
 static struct fanotify_fid_t null_fid;
 
+static void do_debugfs_request(const char *dev, char *request)
+{
+	const char *cmd[] = {"debugfs", "-w", dev, "-R", request, NULL};
+
+	SAFE_CMD(cmd, NULL, NULL);
+}
+
 static struct test_case {
 	char *name;
 	int error;
@@ -216,7 +223,11 @@ static struct tst_test test = {
 	.mntpoint = MOUNT_PATH,
 	.all_filesystems = 0,
 	.needs_root = 1,
-	.dev_fs_type = "ext4"
+	.dev_fs_type = "ext4",
+	.needs_cmds = (const char *[]) {
+		"debugfs",
+		NULL
+	}
 };
 
 #else
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
