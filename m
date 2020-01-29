Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B7A14CCBD
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 15:49:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BB923C2439
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 15:49:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 55C743C23F2
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 15:49:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BCC8F601020
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 15:49:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 06291B341
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 14:49:21 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 29 Jan 2020 15:49:11 +0100
Message-Id: <20200129144913.9889-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129144913.9889-1-mdoucha@suse.cz>
References: <20200129144913.9889-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] Fix releasing loop devices in shell API
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

tst_device helper program currently cannot release any loop devices because
tst_release_device() checks whether any loop device was acquired by the same
process. If not, it'll do nothing. And since loop devices for shell test
scripts are always acquired by a different tst_device process, the check always
fails.

Call tst_detach_device() instead to bypass the check.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/old/old_device.h   | 6 ++++++
 testcases/lib/tst_device.c | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/old/old_device.h b/include/old/old_device.h
index 17da57e1f..d2f1ecde5 100644
--- a/include/old/old_device.h
+++ b/include/old/old_device.h
@@ -41,6 +41,7 @@ const char *tst_dev_fs_type(void);
  * Note that you have to call tst_tmpdir() beforehand.
  *
  * Returns path to the device or NULL if it cannot be created.
+ * Call tst_release_device() when you're done.
  */
 const char *tst_acquire_device_(void (cleanup_fn)(void), unsigned int size);
 
@@ -56,6 +57,11 @@ static inline const char *tst_acquire_device(void (cleanup_fn)(void))
  */
 int tst_release_device(const char *dev);
 
+/*
+ * @dev: device path returned by the tst_acquire_device()
+ */
+int tst_detach_device(const char *dev);
+
 /*
  * Just like umount() but retries several times on failure.
  * @path: Path to umount
diff --git a/testcases/lib/tst_device.c b/testcases/lib/tst_device.c
index dc47d6f03..a657db30b 100644
--- a/testcases/lib/tst_device.c
+++ b/testcases/lib/tst_device.c
@@ -60,7 +60,13 @@ static int release_device(int argc, char *argv[])
 	if (argc != 3)
 		return 1;
 
-	return tst_release_device(argv[2]);
+	/*
+	 * tst_acquire_device() was called in a different process.
+	 * tst_release_device() would think that no device was acquired yet
+	 * and do nothing. Call tst_detach_device() directly to bypass
+	 * the check.
+	 */
+	return tst_detach_device(argv[2]);
 }
 
 int main(int argc, char *argv[])
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
