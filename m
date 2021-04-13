Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E206135E520
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 19:37:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A7B93C72A6
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 19:37:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0587B3C720A
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 19:37:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C37FB600728
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 19:37:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F128B141
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 17:37:52 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 13 Apr 2021 19:29:15 +0200
Message-Id: <20210413172916.24434-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] [COMMITTED] syscalls/*sync: Skip test on tmpfs
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

As sync() is no-op for tmpfs no bytes are transfered.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/fdatasync/fdatasync03.c           | 4 ++++
 testcases/kernel/syscalls/fsync/fsync04.c                   | 4 ++++
 testcases/kernel/syscalls/msync/msync04.c                   | 4 ++++
 testcases/kernel/syscalls/sync/sync01.c                     | 4 ++++
 .../kernel/syscalls/sync_file_range/sync_file_range02.c     | 6 +++++-
 testcases/kernel/syscalls/syncfs/syncfs01.c                 | 4 ++++
 6 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fdatasync/fdatasync03.c b/testcases/kernel/syscalls/fdatasync/fdatasync03.c
index 263175b85..5f3e0c96f 100644
--- a/testcases/kernel/syscalls/fdatasync/fdatasync03.c
+++ b/testcases/kernel/syscalls/fdatasync/fdatasync03.c
@@ -58,4 +58,8 @@ static struct tst_test test = {
 	.all_filesystems = 1,
 	.mntpoint = MNTPOINT,
 	.test_all = verify_fdatasync,
+	.skip_filesystems = (const char *[]) {
+		"tmpfs",
+		NULL
+	}
 };
diff --git a/testcases/kernel/syscalls/fsync/fsync04.c b/testcases/kernel/syscalls/fsync/fsync04.c
index 1e4b8754c..9aa1584c1 100644
--- a/testcases/kernel/syscalls/fsync/fsync04.c
+++ b/testcases/kernel/syscalls/fsync/fsync04.c
@@ -58,4 +58,8 @@ static struct tst_test test = {
 	.all_filesystems = 1,
 	.mntpoint = MNTPOINT,
 	.test_all = verify_fsync,
+	.skip_filesystems = (const char *[]) {
+		"tmpfs",
+		NULL
+	}
 };
diff --git a/testcases/kernel/syscalls/msync/msync04.c b/testcases/kernel/syscalls/msync/msync04.c
index 7c295d961..4a564a3d1 100644
--- a/testcases/kernel/syscalls/msync/msync04.c
+++ b/testcases/kernel/syscalls/msync/msync04.c
@@ -98,5 +98,9 @@ static struct tst_test test = {
 	.mntpoint = "msync04",
 	.mount_device = 1,
 	.all_filesystems = 1,
+	.skip_filesystems = (const char *[]) {
+		"tmpfs",
+		NULL
+	},
 	.min_kver = "2.6.25",
 };
diff --git a/testcases/kernel/syscalls/sync/sync01.c b/testcases/kernel/syscalls/sync/sync01.c
index dc093d863..423662678 100644
--- a/testcases/kernel/syscalls/sync/sync01.c
+++ b/testcases/kernel/syscalls/sync/sync01.c
@@ -53,6 +53,10 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.mount_device = 1,
 	.all_filesystems = 1,
+	.skip_filesystems = (const char *[]) {
+		"tmpfs",
+		NULL
+	},
 	.mntpoint = MNTPOINT,
 	.test_all = verify_sync,
 };
diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
index f68f46233..d9a8eec31 100644
--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
@@ -121,7 +121,11 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.mount_device = 1,
 	.all_filesystems = 1,
-	.skip_filesystems = (const char *const []){"fuse", NULL},
+	.skip_filesystems = (const char *const []){
+		"fuse",
+		"tmpfs",
+		NULL
+	},
 	.mntpoint = MNTPOINT,
 	.setup = setup,
 	.test = run,
diff --git a/testcases/kernel/syscalls/syncfs/syncfs01.c b/testcases/kernel/syscalls/syncfs/syncfs01.c
index 333726eaa..24e3f2285 100644
--- a/testcases/kernel/syscalls/syncfs/syncfs01.c
+++ b/testcases/kernel/syscalls/syncfs/syncfs01.c
@@ -62,6 +62,10 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.mount_device = 1,
 	.all_filesystems = 1,
+	.skip_filesystems = (const char*[]) {
+		"tmpfs",
+		NULL
+	},
 	.mntpoint = MNTPOINT,
 	.setup = setup,
 	.test_all = verify_syncfs,
-- 
2.26.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
