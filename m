Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F86D963FA
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 17:18:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF6C93C1D65
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 17:18:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4865C3C1CE7
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 17:18:34 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 230E51A00CBA
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 17:18:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B4EB0AE4D
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 15:18:32 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 20 Aug 2019 17:18:27 +0200
Message-Id: <20190820151831.7418-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820151831.7418-1-chrubis@suse.cz>
References: <20190820151831.7418-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/5] lib/tst_device: Export more functions.
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

Export tst_attach_device() and tst_deteach_device() which will be later
on used by a kernel netlink uevent tests.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_device.h | 7 +++++++
 lib/tst_device.c     | 8 ++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/tst_device.h b/include/tst_device.h
index f0ddc3e93..c6e7b45b1 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -50,6 +50,13 @@ int tst_clear_device(const char *dev);
  *
  */
 int tst_find_free_loopdev(const char *path, size_t path_len);
+
+
+int tst_attach_device(const char *dev_path, const char *file_path);
+
+
+int tst_detach_device(const char *dev_path);
+
 /*
  * Reads test block device stat file and returns the bytes written since the
  * last call of this function.
diff --git a/lib/tst_device.c b/lib/tst_device.c
index 22abdef46..10f71901d 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -139,7 +139,7 @@ int tst_find_free_loopdev(char *path, size_t path_len)
 	return -1;
 }
 
-static int attach_device(const char *dev, const char *file)
+int tst_attach_device(const char *dev, const char *file)
 {
 	int dev_fd, file_fd;
 	struct loop_info loopinfo;
@@ -185,7 +185,7 @@ static int attach_device(const char *dev, const char *file)
 	return 0;
 }
 
-static int detach_device(const char *dev)
+int tst_detach_device(const char *dev)
 {
 	int dev_fd, ret, i;
 
@@ -284,7 +284,7 @@ const char *tst_acquire_device__(unsigned int size)
 	if (tst_find_free_loopdev(dev_path, sizeof(dev_path)) == -1)
 		return NULL;
 
-	if (attach_device(dev_path, DEV_FILE))
+	if (tst_attach_device(dev_path, DEV_FILE))
 		return NULL;
 
 	device_acquired = 1;
@@ -329,7 +329,7 @@ int tst_release_device(const char *dev)
 	 *
 	 * The file image is deleted in tst_rmdir();
 	 */
-	ret = detach_device(dev);
+	ret = tst_detach_device(dev);
 
 	device_acquired = 0;
 
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
