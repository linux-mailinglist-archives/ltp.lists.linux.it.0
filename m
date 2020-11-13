Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EF02B1948
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 11:45:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A21D33C5FC9
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 11:45:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 311C03C2ED7
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 11:44:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ECCA5601253
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 11:44:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2C9BAF0D
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 10:44:35 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 11:44:30 +0100
Message-Id: <20201113104431.17808-6-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113104431.17808-1-mdoucha@suse.cz>
References: <20201113104431.17808-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 6/7] Unify error handling in lib/tst_fs_setup.c
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

- Properly format caller file:line location

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Replaced the last remaining tst_brk() with tst_brk_()

 lib/tst_fs_setup.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/tst_fs_setup.c b/lib/tst_fs_setup.c
index 54ea37077..6b93483de 100644
--- a/lib/tst_fs_setup.c
+++ b/lib/tst_fs_setup.c
@@ -36,14 +36,15 @@ int mount_overlay(const char *file, const int lineno, int skip)
 
 	if (errno == ENODEV) {
 		if (skip) {
-			tst_brk(TCONF, "%s:%d: " TST_FS_SETUP_OVERLAYFS_MSG,
-				file, lineno);
+			tst_brk_(file, lineno, TCONF,
+				TST_FS_SETUP_OVERLAYFS_MSG);
 		} else {
-			tst_res(TINFO, "%s:%d: " TST_FS_SETUP_OVERLAYFS_MSG,
-				file, lineno);
+			tst_res_(file, lineno, TINFO,
+				TST_FS_SETUP_OVERLAYFS_MSG);
 		}
 	} else {
-		tst_brk(TBROK | TERRNO, "overlayfs mount failed");
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"overlayfs mount failed");
 	}
 	return ret;
 }
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
