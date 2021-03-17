Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D79833F122
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 14:26:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 408923C6094
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 14:26:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 37A9C3C2D4E
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 14:26:36 +0100 (CET)
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E4F97100046F
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 14:26:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=U37NZ
 7RrCnNmby/uQ3Dut9tzVBn5RYDw8UCsEGFcZ3M=; b=Z73IkwAqZndVICJj2/AEH
 Bo7ua5dOMZrdCWSAVgYUmHbP5llCW6RaKY6s9sZVIMdW8erBGimTApucS4Fc1cNC
 o8+eeVMjwXRLvFQf0fdMBR2OCj51u6QjmTg41bovcHzyC+rjdUL3xWnMrFpEdHqR
 Q7X/sM7G8zyacaZ4otdRg8=
Received: from localhost.localdomain (unknown [183.210.48.59])
 by smtp10 (Coremail) with SMTP id DsCowABHNEGCA1JgW0t9pw--.37206S2;
 Wed, 17 Mar 2021 21:26:27 +0800 (CST)
From: ice_yangxiao@163.com
To: ltp@lists.linux.it
Date: Wed, 17 Mar 2021 21:26:24 +0800
Message-Id: <20210317132624.13507-1-ice_yangxiao@163.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CM-TRANSID: DsCowABHNEGCA1JgW0t9pw--.37206S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyDZF15XF1rWFW8tw4Dtwb_yoWDZrbEy3
 Wxtan5ursaq3ZYvrsYya17ZF17Z3sYgFn3ZFy5Arn7Jr1Yy3s8Awn5Wry8Zrs8urZIkF4x
 t3WxAry8try29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8pBT5UUUUU==
X-Originating-IP: [183.210.48.59]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiEANYXl8YFQl3dQAAsM
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] include/tst_test_macros.h: Use TTERRNO for
 TST_EXP_FAIL() properly
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

From: Xiao Yang <yangx.jy@cn.fujitsu.com>

1) Remove TTERRNO if TST_RET == 0
2) Use TTERRNO if TST_RET == -1

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 include/tst_test_macros.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 92cb5c66b..189891507 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -114,8 +114,7 @@ extern void *TST_RET_PTR;
 		TST_PASS = 0;                                                  \
 		                                                               \
 		if (TST_RET == 0) {                                            \
-			TST_MSG_(TFAIL | TTERRNO, " succeeded",                \
-			         #SCALL, ##__VA_ARGS__);                       \
+			TST_MSG_(TFAIL, " succeeded", #SCALL, ##__VA_ARGS__);  \
 		        break;                                                 \
 		}                                                              \
 		                                                               \
@@ -127,11 +126,11 @@ extern void *TST_RET_PTR;
 		                                                               \
 		if (ERRNO) {                                                   \
 			if (TST_ERR == ERRNO) {                                \
-				TST_MSG_(TPASS | TERRNO, "",                   \
+				TST_MSG_(TPASS | TTERRNO, "",                  \
 				         #SCALL, ##__VA_ARGS__);               \
 				TST_PASS = 1;                                  \
 			} else {                                               \
-				TST_MSGP_(TFAIL | TERRNO, " expected %s",      \
+				TST_MSGP_(TFAIL | TTERRNO, " expected %s",     \
 				          tst_strerrno(ERRNO),                 \
 				          #SCALL, ##__VA_ARGS__);              \
 			}                                                      \
-- 
2.26.2



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
