Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89413165ABD
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 10:59:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EAE63C2240
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 10:59:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4D0C13C12AE
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 10:59:10 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B603E200974
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 10:59:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0EC20ADCC
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 09:59:09 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 20 Feb 2020 10:59:08 +0100
Message-Id: <20200220095908.14980-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/fgetxattr02: Use loop instead of RAM disk
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

There are minimal systems that does not ship with RAM disk kernel module
which makes this test fail with ENXIO when we attempt to open the block
device in the test setup.

LTP depends on heavily on loop device driver already so it makes sense
to switch over to a loop device backed block device instead.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/fgetxattr/fgetxattr02.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c b/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c
index 02e81810a..82fb676be 100644
--- a/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c
+++ b/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c
@@ -210,7 +210,8 @@ static void setup(void)
 	size_t i = 0;
 	struct sockaddr_un sun;
 
-	dev_t dev = makedev(1, 3);
+	dev_t chr_dev = makedev(1, 3);
+	dev_t blk_dev = makedev(7, 3);
 
 	SAFE_TOUCH(FILENAME, 0644, NULL);
 	SAFE_TOUCH(SYMLINKF, 0644, NULL);
@@ -219,8 +220,8 @@ static void setup(void)
 
 	/* root: mknod(2) needs it to create something other than a file */
 	SAFE_MKNOD(FIFO, S_IFIFO | 0777, 0);
-	SAFE_MKNOD(CHR, S_IFCHR | 0777, dev);
-	SAFE_MKNOD(BLK, S_IFBLK | 0777, dev);
+	SAFE_MKNOD(CHR, S_IFCHR | 0777, chr_dev);
+	SAFE_MKNOD(BLK, S_IFBLK | 0777, blk_dev);
 
 	for (i = 0; i < ARRAY_SIZE(tc); i++) {
 
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
