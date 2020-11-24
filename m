Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E642C26B8
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 14:03:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3BA83C4E51
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 14:03:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 743F03C2D13
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 14:03:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D154F1400DEF
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 14:03:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38BDEAC66
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 13:03:05 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 24 Nov 2020 14:04:25 +0100
Message-Id: <20201124130425.4264-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls: quotactl04,
 statx05: Fix TWARN on missing mkfs
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

When mkfs.ext4 was missing we would get TWARN because the setup will fail to
parse the mkfs version followed by TCONF from the library function that
attempts format the device.

Fix this by requiring the mkfs.ext4 in the tst_test structure which will exit
the test before we attempt to parse the mkfs version.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/quotactl/quotactl04.c | 4 ++++
 testcases/kernel/syscalls/statx/statx05.c       | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
index 3cc2b974f..8b17b1fbc 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl04.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
@@ -170,4 +170,8 @@ static struct tst_test test = {
 	.needs_device = 1,
 	.dev_fs_type = "ext4",
 	.mntpoint = MNTPOINT,
+	.needs_cmds = (const char *[]) {
+		"mkfs.ext4",
+		NULL
+	}
 };
diff --git a/testcases/kernel/syscalls/statx/statx05.c b/testcases/kernel/syscalls/statx/statx05.c
index d7ac24418..81a5bcbf2 100644
--- a/testcases/kernel/syscalls/statx/statx05.c
+++ b/testcases/kernel/syscalls/statx/statx05.c
@@ -135,4 +135,8 @@ static struct tst_test test = {
 	.needs_device = 1,
 	.mntpoint = MNTPOINT,
 	.dev_fs_type = "ext4",
+	.needs_cmds = (const char *[]) {
+		"mkfs.ext4",
+		NULL
+	}
 };
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
