Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2A23514E4
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 14:47:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB41F3C77C0
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 14:47:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 046473C22AC
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 14:47:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7690520097A
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 14:47:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2300B132
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 12:47:30 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  1 Apr 2021 14:47:24 +0200
Message-Id: <20210401124724.25394-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] df01.sh: Fix DF_FS_TYPE assignment on bind mount
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

In case of bind mount of testing directory, grep will assign filesystem
twice, with new line:

$ echo "DF_FS_TYPE: '$DF_FS_TYPE'"
DF_FS_TYPE: 'ext2
ext2'

Limiting only first line to avoid failure with confusing message:

df01 5 TFAIL: 'df' failed.
df: ext2: No such file or directory

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/commands/df/df01.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/commands/df/df01.sh b/testcases/commands/df/df01.sh
index 0e73a16af..f59676bfa 100755
--- a/testcases/commands/df/df01.sh
+++ b/testcases/commands/df/df01.sh
@@ -39,7 +39,7 @@ setup()
 {
 	tst_mkfs
 	tst_mount
-	DF_FS_TYPE=$(mount | grep "$TST_DEVICE" | awk '{print $5}')
+	DF_FS_TYPE=$(mount | grep "$TST_DEVICE" | awk 'NR==1{print $5}')
 }
 
 df_test()
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
