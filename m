Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B331ADC4A
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 13:39:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C18ED3C2ACE
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 13:39:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 11DBB3C2ABA
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 13:39:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7ECF76012CD
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 13:39:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C7FCCABEF
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 11:39:29 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 17 Apr 2020 13:39:48 +0200
Message-Id: <20200417113948.12678-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] tst_cmd: Fix exit in search for program
 in $PATH
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

The check is executed before fork() so we have to do return instead of
exit() otherwise we exit the library process.

Fixes: 105d283bc ("lib/tst_cmd_*(): Search for program in $PATH")

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_cmd.c b/lib/tst_cmd.c
index 3a90d1a5d..4b67d4b31 100644
--- a/lib/tst_cmd.c
+++ b/lib/tst_cmd.c
@@ -64,7 +64,7 @@ int tst_cmd_fds_(void (cleanup_fn)(void),
 			tst_brkm(TCONF, cleanup_fn, "Couldn't find '%s' in $PATH at %s:%d", argv[0],
 				 __FILE__, __LINE__);
 		else
-			_exit(255);
+			return 255;
 	}
 
 	pid_t pid = vfork();
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
