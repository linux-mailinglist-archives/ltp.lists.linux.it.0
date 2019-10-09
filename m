Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30035D071D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:21:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CFA73C2268
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:21:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3D2D73C2034
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:21:19 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9A6E91A011FD
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:21:18 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id D8B159F7FB;
 Wed,  9 Oct 2019 06:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570602076; bh=Wy5G8otImhVftrOJSXmzqTDODvtiuyyDaYqeMm9Zgm4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=eibr9knK/8JNggBTOvgU6oeGSq+bPycJ1aGF2nVAP/Me8YaiHL2LSRAKySiB3XIiU
 95GF5ajnEqf4RQmUeUmB1L/7wiU3fMdaskiwj7JlMkidb8kWjT8XWum3xfr8rA+0vo
 3UAJKFgmulbJ+RoybuoMt4XRWhvJFTxkAS2R9Bgs=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Wed,  9 Oct 2019 08:21:12 +0200
Message-Id: <20191009062112.49947-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] ext4-new-features: Fix paths to ffsb-config files
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

The path to the ffsb-config files was just plain wrong (they are copied to
$LTPROOT/testcases/data/ext4-ffsb, but searched in cwd.
This is the same fix as in 4ae5699d, only for other tests.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../ext4-journal-checksum/ext4_journal_checksum.sh            | 2 +-
 .../ext4-uninit-groups/ext4_uninit_groups_test.sh             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/fs/ext4-new-features/ext4-journal-checksum/ext4_journal_checksum.sh b/testcases/kernel/fs/ext4-new-features/ext4-journal-checksum/ext4_journal_checksum.sh
index 9edb89397..822c94a8c 100755
--- a/testcases/kernel/fs/ext4-new-features/ext4-journal-checksum/ext4_journal_checksum.sh
+++ b/testcases/kernel/fs/ext4-new-features/ext4-journal-checksum/ext4_journal_checksum.sh
@@ -69,7 +69,7 @@ ext4_test_journal_checksum()
 		return
 	fi
 
-	ffsb ffsb-config2 > /dev/null
+	ffsb $LTPROOT/testcases/data/ext4-ffsb/ffsb-config2 > /dev/null
 	if [ $? -ne 0 ]; then
 		tst_resm TFAIL "ffsb returned failure"
 		umount mnt_point
diff --git a/testcases/kernel/fs/ext4-new-features/ext4-uninit-groups/ext4_uninit_groups_test.sh b/testcases/kernel/fs/ext4-new-features/ext4-uninit-groups/ext4_uninit_groups_test.sh
index d39afae56..cf4c354d9 100755
--- a/testcases/kernel/fs/ext4-new-features/ext4-uninit-groups/ext4_uninit_groups_test.sh
+++ b/testcases/kernel/fs/ext4-new-features/ext4-uninit-groups/ext4_uninit_groups_test.sh
@@ -34,13 +34,13 @@ age_filesystem()
 {
 	if [ $1 -eq $EMPTY ]; then
 		# aging, then del
-		ffsb ffsb-config3 > /dev/null
+		ffsb $LTPROOT/testcases/data/ext4-ffsb/ffsb-config3 > /dev/null
 		rm -rf mnt_point/*
 	elif [ $1 -eq $SMALL ]; then
 		# age filesystem from 0.0 to 0.2 -> 0.4 -> 0.6 -> 0.8 -> 1.0
 		for ((n = 3; n < 8; n++))
 		{
-			ffsb ffsb-config$n > /dev/null
+			ffsb $LTPROOT/testcases/data/ext4-ffsb/ffsb-config$n > /dev/null
 			mv mnt_point/data mnt_point/data$n
 		}
 	elif [ $1 -eq $LARGE ]; then
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
