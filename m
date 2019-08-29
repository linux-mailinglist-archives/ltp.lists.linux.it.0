Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C29A2A4B
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 00:50:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 928BB3C201A
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 00:50:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CED063C1C80
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 00:50:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DA240200385
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 00:50:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E8095B621
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 22:50:36 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 30 Aug 2019 00:50:29 +0200
Message-Id: <20190829225029.29506-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH] tst_test.sh: Always return 0 from
 _tst_require_root()
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

8722680b6 ("tst_net.sh: Use _tst_require_root instead of TST_NEEDS_ROOT=1")
is broken _tst_require_root() returns non zero value therefore
tst_require_root() is called as well:

/opt/ltp/testcases/bin/if4-addr-change.sh: 102: /opt/ltp/testcases/bin/tst_net.sh: tst_require_root: not found

While code should not expect functions returning always zero, in this
case it's an unwanted side effect, therefore fix it by wrapping
_tst_require_root() code with if clause.

Fixes: e7b804df6 ("shell: Add tst_security.sh helper")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

sorry for this old bug and for overlooking this error in tst_net.sh
change.

Kind regards,
Petr

 testcases/lib/tst_test.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index f779cc471..e0b24c6b9 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -391,7 +391,9 @@ _tst_setup_timer()
 
 _tst_require_root()
 {
-	[ "$(id -ru)" != 0 ] && tst_brk TCONF "Must be super/root for this test!"
+	if [ "$(id -ru)" != 0 ]; then
+		tst_brk TCONF "Must be super/root for this test!"
+	fi
 }
 
 tst_run()
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
