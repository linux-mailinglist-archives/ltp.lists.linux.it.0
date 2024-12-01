Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5479E0386
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Dec 2024 14:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1733146370; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=CkxR+3KRGYFoQ7uSkd+YkrS4vuwA8eu4laFvtKUdNyI=;
 b=E9ftl6gCcCsI63syippzPVpFPXMOzS6dJ9p5dqusD7F0SGiRM+ebAbWdv8auuC/+WIouw
 bPMmEWnts08g48etrJGLR8wGsw6k5AvLFUl8vdJIL2q0UXGL0XxPYIfADtvnyxRuewQXSYa
 ww6Be3iG/PWUyd7ixPNioDrnzpbZKW8=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E7C553DD45A
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Dec 2024 14:32:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A28933DC5B7
 for <ltp@lists.linux.it>; Sun,  1 Dec 2024 10:36:16 +0100 (CET)
Authentication-Results: in-3.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3;
 helo=nyc.source.kernel.org; envelope-from=zlang@kernel.org;
 receiver=lists.linux.it)
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C025B1BC24ED
 for <ltp@lists.linux.it>; Sun,  1 Dec 2024 10:36:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2BDD2A40A22;
 Sun,  1 Dec 2024 09:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AB3C4CECF;
 Sun,  1 Dec 2024 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733045773;
 bh=ACdJRYtvT54h2D5uwzZyukQ5TybF5LCQCuBGDaRqadA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IAaUhQbyVifk1SBtkY9VPE6CiF86oFUu3ILFofqve0zuXvyPFSpxs87/dYon8sHba
 16w47wSn3MyKD0meaKvzancjOXGjqRysx9lEUPiKrCkf6WJy2nUXu/kxKgPaUUlz0M
 NufCm3Com12YqJi7yD99lTMMiBXVJral7WXK89aUI47qggUfw/nDbxjJFXu1/JYXIx
 eZ2KPaK+fQyM94xKtPigLZsxsULRjs7Dt9LxaXgs4KYp75a/ecVX/xamnwb6zuzSQK
 zpoZiMvzgQ39ZNQBLKrkzmswzlkiIR5IaPHa98dKzMQoelqNrR33t25VBTMDel4Ivo
 KTltt0x7hA0ng==
To: ltp@lists.linux.it
Date: Sun,  1 Dec 2024 17:36:05 +0800
Message-ID: <20241201093606.68993-3-zlang@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241201093606.68993-1-zlang@kernel.org>
References: <20241201093606.68993-1-zlang@kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 02 Dec 2024 14:31:52 +0100
Subject: [LTP] [PATCH 2/3] stat04+lstat03: fix bad blocksize mkfs option for
 xfs
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
From: Zorro Lang via ltp <ltp@lists.linux.it>
Reply-To: Zorro Lang <zlang@kernel.org>
Cc: linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Not all filesystems use "-b 1024" to set its blocksize. XFS uses
"-b size=1024", so this test fails as "unknown option -b 1024" on
xfs.

Signed-off-by: Zorro Lang <zlang@kernel.org>
---
 testcases/kernel/syscalls/lstat/lstat03.c | 8 ++++++--
 testcases/kernel/syscalls/stat/stat04.c   | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/lstat/lstat03.c b/testcases/kernel/syscalls/lstat/lstat03.c
index d48af180b..675fb56f4 100644
--- a/testcases/kernel/syscalls/lstat/lstat03.c
+++ b/testcases/kernel/syscalls/lstat/lstat03.c
@@ -44,8 +44,9 @@ static void run(void)
 
 static void setup(void)
 {
+	char *opt_name="-b";
 	char opt_bsize[32];
-	const char *const fs_opts[] = {opt_bsize, NULL};
+	const char *const fs_opts[] = {opt_name, opt_bsize, NULL};
 	struct stat sb;
 	int pagesize;
 	int fd;
@@ -54,7 +55,10 @@ static void setup(void)
 	SAFE_STAT(".", &sb);
 	pagesize = sb.st_blksize == 4096 ? 1024 : 4096;
 
-	snprintf(opt_bsize, sizeof(opt_bsize), "-b %i", pagesize);
+	if (strcmp(tst_device->fs_type, "xfs") == 0)
+		snprintf(opt_bsize, sizeof(opt_bsize), "size=%i", pagesize);
+	else
+		snprintf(opt_bsize, sizeof(opt_bsize), "%i", pagesize);
 	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
 	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, 0);
 
diff --git a/testcases/kernel/syscalls/stat/stat04.c b/testcases/kernel/syscalls/stat/stat04.c
index 05ace606a..2a17cc7d7 100644
--- a/testcases/kernel/syscalls/stat/stat04.c
+++ b/testcases/kernel/syscalls/stat/stat04.c
@@ -43,8 +43,9 @@ static void run(void)
 
 static void setup(void)
 {
+	char *opt_name="-b";
 	char opt_bsize[32];
-	const char *const fs_opts[] = {opt_bsize, NULL};
+	const char *const fs_opts[] = {opt_name, opt_bsize, NULL};
 	struct stat sb;
 	int pagesize;
 	int fd;
@@ -56,7 +57,10 @@ static void setup(void)
 	SAFE_STAT(".", &sb);
 	pagesize = sb.st_blksize == 4096 ? 1024 : 4096;
 
-	snprintf(opt_bsize, sizeof(opt_bsize), "-b %i", pagesize);
+	if (strcmp(tst_device->fs_type, "xfs") == 0)
+		snprintf(opt_bsize, sizeof(opt_bsize), "size=%i", pagesize);
+	else
+		snprintf(opt_bsize, sizeof(opt_bsize), "%i", pagesize);
 	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
 	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, 0);
 
-- 
2.45.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
