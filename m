Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EDF2645D4
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 14:16:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1858F3C52C3
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 14:16:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D3D123C240A
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 14:16:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2EF4B6011D1
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 14:16:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 106EDAE33;
 Thu, 10 Sep 2020 12:16:50 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 10 Sep 2020 14:16:28 +0200
Message-Id: <20200910121628.18505-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] fanotify10: Treat ignore mask bug as TCONF for <
 v5.9
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

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Amir,

based on suggestion http://lists.linux.it/pipermail/ltp/2020-September/018891.html,
but not really sure if it should be applied, because we loose warning:

HINT: You _MAY_ be missing kernel fixes, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9bdda4e9cf2d
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f02fd3fa13e
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=497b0c5a7c06

Kind regards,
Petr


 testcases/kernel/syscalls/fanotify/fanotify10.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index 2c4401f61..5b4591b4a 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -508,8 +508,8 @@ static void test_fanotify(unsigned int n)
 					"zero length read from fanotify fd");
 			}
 			if (ret > 0) {
-				tst_res(TFAIL, "group %d (%x) with %s and "
-					"%s ignore mask got event",
+				tst_res((tst_kvercmp(5, 9, 0)) < 0 ? TCONF : TFAIL,
+					"group %d (%x) with %s and %s ignore mask got event",
 					i, fanotify_class[p], mark->name, ignore_mark->name);
 				if (event->fd != FAN_NOFD)
 					SAFE_CLOSE(event->fd);
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
