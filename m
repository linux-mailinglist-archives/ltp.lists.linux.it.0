Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D632A4404D1
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Oct 2021 23:19:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 961873C6F15
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Oct 2021 23:19:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7ED9F3C6F3D
 for <ltp@lists.linux.it>; Fri, 29 Oct 2021 23:18:31 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DA8031BE4350
 for <ltp@lists.linux.it>; Fri, 29 Oct 2021 23:18:30 +0200 (CEST)
Received: from localhost (unknown [IPv6:2804:14c:124:8a08::1002])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: krisman)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8149D1F45C6F;
 Fri, 29 Oct 2021 22:18:29 +0100 (BST)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: jack@suse.com,
	amir73il@gmail.com,
	repnop@google.com
Date: Fri, 29 Oct 2021 18:17:29 -0300
Message-Id: <20211029211732.386127-7-krisman@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211029211732.386127-1-krisman@collabora.com>
References: <20211029211732.386127-1-krisman@collabora.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 6/9] syscalls/fanotify21: Support submission of
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
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In order to test FAN_FS_ERROR, we want to corrupt the filesystem.  The
easiest way to do it is by using debugfs.  Add a small helper to issue
debugfs requests.  Since most likely this will be the only testcase to
need this, don't bother making it a proper helper for now.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
changes since v1:
  - Add .needs_cmds to require debugfs
---
 testcases/kernel/syscalls/fanotify/fanotify21.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify21.c b/testcases/kernel/syscalls/fanotify/fanotify21.c
index 95c988821a34..43e606c27372 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify21.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify21.c
@@ -49,6 +49,13 @@ static void trigger_fs_abort(void)
                   MS_REMOUNT|MS_RDONLY, "abort");
 }
 
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
@@ -228,7 +235,11 @@ static struct tst_test test = {
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
