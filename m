Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F17AAD3BE5
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:07:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89C393C2296
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:07:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6584F3C176C
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:07:48 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2618F6013B9
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:06:12 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 67ABA9F9AC;
 Fri, 11 Oct 2019 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570784867; bh=bq/s37OK66uH/me4nEHgN3TX6E5P64SCpxET4nB9HFg=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=g/4I8z1MX4xfda3sHcgBH5XUISjr4cZDWtEM1GIbSW7Jn+wHKAqdEzxoufnIl77R+
 mttlDMXVsCEH34NiJCRayFcFvn46OUvec0Nq9IK5kpx9d1t0XCgBaXWPYW0AFd+JFo
 SRbaPW5x7T+hcqFpJ32Pc3CQHUQ5gTjcisD/x3MY=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it, pvorel@suse.cz, chrubis@suse.cz, jstancek@redhat.com
Date: Fri, 11 Oct 2019 11:07:37 +0200
Message-Id: <20191011090737.17997-3-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011090737.17997-1-lkml@jv-coder.de>
References: <20191011090737.17997-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] shell: Rename
 s/tst_test_drivers/tst_require_drivers/
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

This require describes the function of the command better than test.
"tst_require_root" is also a well established name in ltp api with the
same semantic.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/lib/tst_test.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 125e3a105..4c9a92c2c 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -326,7 +326,7 @@ tst_check_cmds()
 	return 0
 }
 
-tst_test_drivers()
+tst_require_drivers()
 {
 	[ $# -eq 0 ] && return 0
 
@@ -449,7 +449,7 @@ tst_run()
 	[ "$TST_DISABLE_SELINUX" = 1 ] && tst_disable_selinux
 
 	tst_require_cmds $TST_NEEDS_CMDS
-	tst_test_drivers $TST_NEEDS_DRIVERS
+	tst_require_drivers $TST_NEEDS_DRIVERS
 
 	if [ -n "$TST_MIN_KVER" ]; then
 		tst_kvcmp -lt "$TST_MIN_KVER" && \
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
