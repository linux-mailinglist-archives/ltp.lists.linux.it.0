Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8246D3D40
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Apr 2023 08:23:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9CDB3CD045
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Apr 2023 08:23:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B13443C01AA
 for <ltp@lists.linux.it>; Mon,  3 Apr 2023 08:23:47 +0200 (CEST)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A59FE14000E1
 for <ltp@lists.linux.it>; Mon,  3 Apr 2023 08:23:41 +0200 (CEST)
X-UUID: 6bfc115cb1664417be7a6c8b8a9d5a03-20230403
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:dbab399b-b6b6-4a5e-b0f4-f2fc98da7fb7, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:31
X-CID-INFO: VERSION:1.1.22, REQID:dbab399b-b6b6-4a5e-b0f4-f2fc98da7fb7, IP:5,
 URL
 :0,TC:0,Content:0,EDM:25,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:31
X-CID-META: VersionHash:120426c, CLOUDID:f3c520b5-beed-4dfc-bd9c-e1b22fa6ccc4,
 B
 ulkID:230403142336MFT8NUWG,BulkQuantity:0,Recheck:0,SF:24|17|19|45|102,TC:
 nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
 :0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 6bfc115cb1664417be7a6c8b8a9d5a03-20230403
X-User: gehao@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <gehao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1801248448; Mon, 03 Apr 2023 14:23:34 +0800
From: Hao Ge <gehao@kylinos.cn>
To: ltp@lists.linux.it
Date: Mon,  3 Apr 2023 14:23:21 +0800
Message-Id: <20230403062321.50716-1-gehao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] matrix_mult: Fix matrices'array out of bounds
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
Cc: gehao@kylinos.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When i=0,i_m=MATRIX_SIZE-i,calculation results
is MATRIX_SIZE(100),it will cause out of bounds
due to this array max item is MATRIX_SIZE -1;

So we should have a minus 1 operation for i_m.

Signed-off-by: Hao Ge <gehao@kylinos.cn>
---
 testcases/realtime/func/matrix_mult/matrix_mult.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/realtime/func/matrix_mult/matrix_mult.c b/testcases/realtime/func/matrix_mult/matrix_mult.c
index e2a55628a..c32092344 100644
--- a/testcases/realtime/func/matrix_mult/matrix_mult.c
+++ b/testcases/realtime/func/matrix_mult/matrix_mult.c
@@ -100,7 +100,7 @@ static void matrix_mult(struct matrices *matrices)
 
 	matrix_init(matrices->A, matrices->B);
 	for (i = 0; i < MATRIX_SIZE; i++) {
-		int i_m = MATRIX_SIZE - i;
+		int i_m = MATRIX_SIZE - i - 1;
 		for (j = 0; j < MATRIX_SIZE; j++) {
 			double sum = matrices->A[i_m][j] *  matrices->B[j][i];
 			for (k = 0; k < MATRIX_SIZE; k++)
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
