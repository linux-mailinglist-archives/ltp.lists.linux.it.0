Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC2D26451A
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 13:07:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E4B53C5355
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 13:07:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0D2B13C2629
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 13:07:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 322351000B56
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 13:07:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2980DABB2;
 Thu, 10 Sep 2020 11:07:33 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 10 Sep 2020 13:07:12 +0200
Message-Id: <20200910110712.2181-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] syscalls/fanotify15: TCONF also on EOPNOTSUPP
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
Cc: Jan Kara <jack@suse.cz>, Matthew Bobrowski <mbobrowski@mbobrowski.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

instead of TBROK:
fanotify15.c:86: INFO: Test #0: FAN_REPORT_FID on filesystem including FAN_DELETE_SELF
fanotify15.c:96: BROK: fanotify_mark(3, FAN_MARK_ADD | FAN_MARK_FILESYSTEM, FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_MODIFY | FAN_ONDIR | 0x400, AT_FDCWD, mntpoint/test_dir) failed: EOPNOTSUPP (95)

is now reported:
fanotify15.c:86: INFO: Test #0: FAN_REPORT_FID on filesystem including FAN_DELETE_SELF
fanotify15.c:93: CONF: FAN_REPORT_FID not supported on exfat filesystem

fanotify15.c:86: INFO: Test #0: FAN_REPORT_FID on filesystem including FAN_DELETE_SELF
fanotify15.c:93: CONF: FAN_REPORT_FID not supported on ntfs filesystem

Found on 5.8.0 on openSUSE Tumbleweed.

Fixes: 403f11f3a ("syscalls/fanotify15: verify fid for dirent events")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

I suppose that EXDEV (in fanotify_test_fid()) is really error which
should be caught as TBROK (unlike ENODEV and EOPNOTSUPP). Am I correct?

Kind regards,
Petr

 testcases/kernel/syscalls/fanotify/fanotify15.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify15.c b/testcases/kernel/syscalls/fanotify/fanotify15.c
index cca6a5313..6cb1b4a2f 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify15.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify15.c
@@ -89,7 +89,7 @@ static void do_test(unsigned int number)
 				FAN_CREATE | FAN_DELETE | FAN_MOVE |
 				FAN_MODIFY | FAN_ONDIR,
 				AT_FDCWD, TEST_DIR) == -1) {
-		if (errno == ENODEV)
+		if (errno == ENODEV || errno == EOPNOTSUPP)
 			tst_brk(TCONF,
 				"FAN_REPORT_FID not supported on %s "
 				"filesystem", tst_device->fs_type);
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
