Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C662DA5840
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 15:42:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6AE3A3C20F0
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 15:42:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1ED8A3C1E09
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 15:42:21 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DF0EE200DEC
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 15:42:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 23580AD18;
 Mon,  2 Sep 2019 13:42:19 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Sep 2019 15:42:13 +0200
Message-Id: <20190902134213.545-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH] tst_net.sh: Fix unintended
 tst_require_root call in shell new API
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

for cases where tst_require_root_ is called by root (by evaluating ||):
/opt/ltp/testcases/bin/tst_net.sh: line 102: tst_require_root: command not found

NOTE: 4552972e5 ("tst_test.sh: Always return 0 from
_tst_require_root()") was intended to fix it, but it didn't.

Fixes: 8722680b6 ("tst_net.sh: Use _tst_require_root instead of TST_NEEDS_ROOT=1")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

sorry for useless 4552972e5 commit.

Kind regards,
Petr

 testcases/lib/tst_net.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 6a9d51b81..6c3ae708d 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -99,7 +99,11 @@ tst_brk_()
 }
 tst_require_root_()
 {
-	[ -z "$TST_USE_LEGACY_API" ] && _tst_require_root || tst_require_root
+	if [ -z "$TST_USE_LEGACY_API" ]; then
+		_tst_require_root
+	else
+		tst_require_root
+	fi
 }
 
 init_ltp_netspace()
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
