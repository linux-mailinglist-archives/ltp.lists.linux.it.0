Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEFBD0715
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:16:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 089823C228D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:16:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 73B093C2288
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:16:34 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AB766600070
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:15:17 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id F02E69F7FB;
 Wed,  9 Oct 2019 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570601792; bh=ig5/yS5l+MGDwXzAud/8XrV1mwsnO4ndOqxff7DteMw=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=s4Z/BXsUa2na5rJX2CUqjhYyjMO5EMMjF2c+9rr4+TG677GzynP4mYLT85YLeURVL
 elv7nBO/2qiBZmmolKygmtQ6uOHOjTF0xO9E4DQ6Op8tjDuC+Gt2OCStKY4yoQXVvl
 PjcGr5QRqecNy4Ob95I+uvfPdvKnlXaGHolvNwOw=
From: Joerg Vehlow <lkml@jv-coder.de>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Oct 2019 08:16:19 +0200
Message-Id: <20191009061619.48677-3-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191009061619.48677-1-lkml@jv-coder.de>
References: <20191009061619.48677-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] tst_test.sh: Add public tst_test_root command
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

If a test requires root only under certan circumstances, TST_NEEDS_ROOT
is not sufficient, because it always requires root.
---
 testcases/lib/tst_test.sh | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index c70a5abbe..07712670d 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -326,6 +326,13 @@ tst_check_cmds()
 	return 0
 }
 
+tst_test_root()
+{
+	if [ "$(id -ru)" != 0 ]; then
+		tst_brk TCONF "Must be super/root for this test!"
+	fi
+}
+
 tst_test_drivers()
 {
 	[ $# -eq 0 ] && return 0
@@ -389,13 +396,6 @@ _tst_setup_timer()
 	_tst_setup_timer_pid=$!
 }
 
-_tst_require_root()
-{
-	if [ "$(id -ru)" != 0 ]; then
-		tst_brk TCONF "Must be super/root for this test!"
-	fi
-}
-
 _tst_find_module()
 {
 	local _tst_module=$1
@@ -469,7 +469,7 @@ tst_run()
 		tst_brk TBROK "Number of iterations (-i) must be > 0"
 	fi
 
-	[ "$TST_NEEDS_ROOT" = 1 ] && _tst_require_root
+	[ "$TST_NEEDS_ROOT" = 1 ] && tst_test_root
 
 	[ "$TST_DISABLE_APPARMOR" = 1 ] && tst_disable_apparmor
 	[ "$TST_DISABLE_SELINUX" = 1 ] && tst_disable_selinux
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
