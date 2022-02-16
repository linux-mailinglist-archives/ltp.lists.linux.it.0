Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9344B81AA
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 08:37:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 348033CA099
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 08:37:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E24623C952F
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 08:37:34 +0100 (CET)
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4B34F200DEC
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 08:37:31 +0100 (CET)
X-QQ-mid: bizesmtp78t1644997044ts0n3d5r
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 16 Feb 2022 15:37:19 +0800 (CST)
X-QQ-SSF: 01400000002000B0E000C00A0000000
X-QQ-FEAT: yFK/CQtHqNWbr0Sd+8ewGx81wXh+OXDtOYDKI12XY15YmgbOheWyAl5ES5uei
 lQ5gK/TeEkgyIhyCqrYpNpEM4NnogsWQEWagOdr2V7O5jAGTMZnsZV8Mz2u0syaQkuKrC2Y
 HTLW3ubbTvcNgNvh4+GB4iGnG1QpmwjQjA7PP/E5qoBPt8VzcRFk8e4irsvFTLDsrJxQQZC
 7khX5VVaiwHzcQMfgDgFk/V2GMwrMH1RlpTx2nHaXHALewyoqCaHfuR0EZRiJguaW2E35ft
 JCyRZYxplrdmjwmTzBOFmaE6ZD27IJfhi12qSGrJHISUOfp6rVvSbvVaCqctmbUDL8m5JXL
 bI0kYULCFjAGe9TLlaJ09+fkUJh+Qypl6kGDoRJ
X-QQ-GoodBg: 2
From: tangmeng <tangmeng@uniontech.com>
To: ltp@lists.linux.it
Date: Wed, 16 Feb 2022 15:37:16 +0800
Message-Id: <20220216073716.19598-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/fchmod_06: Fix code formatting issues
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
Cc: tangmeng <tangmeng@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When running make check, the following error is reported:
fchmod06.c:53: error: code indentation should use tabs whenever possible.
This commit fixes it

Signed-off-by: tangmeng <tangmeng@uniontech.com>
---
 testcases/kernel/syscalls/fchmod/fchmod06.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fchmod/fchmod06.c b/testcases/kernel/syscalls/fchmod/fchmod06.c
index 446865b1b..4a8aee6ca 100644
--- a/testcases/kernel/syscalls/fchmod/fchmod06.c
+++ b/testcases/kernel/syscalls/fchmod/fchmod06.c
@@ -50,7 +50,7 @@ static void verify_fchmod(unsigned int i)
 	}
 
 	tst_res(TFAIL | TTERRNO,
-	        "fchmod() failed unexpectedly, expected %i - %s",
+		"fchmod() failed unexpectedly, expected %i - %s",
 		TST_ERR, tst_strerrno(TST_ERR));
 }
 
-- 
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
