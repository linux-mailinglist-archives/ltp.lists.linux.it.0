Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8051E30787F
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 15:47:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 163443C791D
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 15:47:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 617773C3215
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 15:47:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0A245200FDF
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 15:47:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C031AE7D
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 14:47:02 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 28 Jan 2021 15:46:49 +0100
Message-Id: <20210128144649.6012-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] lib: Fix fs support detection for non-root
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

grep /proc/filesystems to find kernel support.
But consider only 0 (filesystem found) or 1 (not found),
ignore other results (e.g. 2: /proc/filesystems not available or
no permissions) and fallback to old solution (calling mount()).

Warn when mount() fails due no permission (EPERM).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_supported_fs_types.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
index 00ede549d..66307e09e 100644
--- a/lib/tst_supported_fs_types.c
+++ b/lib/tst_supported_fs_types.c
@@ -52,10 +52,29 @@ static int has_kernel_support(const char *fs_type, int flags)
 	char buf[128];
 	int ret;
 
+	const char * const argv[] = { "grep", "-q", "-F", "-w", fs_type, "/proc/filesystems", NULL };
+	ret = tst_cmd_(NULL, argv, "/dev/null", "/dev/null", TST_CMD_PASS_RETVAL);
+
+	if (ret == 0) {
+		tst_res(TINFO, "Kernel supports %s", fs_type);
+		return 1;
+	}
+
+	if (ret == 1) {
+		tst_res(TINFO, "Filesystem %s is not supported", fs_type);
+		return 0;
+	}
+
 	if (!tmpdir)
 		tmpdir = "/tmp";
 
 	mount("/dev/zero", tmpdir, fs_type, 0, NULL);
+
+	if (errno == EPERM) {
+		tst_res(TWARN, "No permission to detect support for %s", fs_type);
+		return 1;
+	}
+
 	if (errno != ENODEV) {
 		tst_res(TINFO, "Kernel supports %s", fs_type);
 		return 1;
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
