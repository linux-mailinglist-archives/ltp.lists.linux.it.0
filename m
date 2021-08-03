Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B9C3DEE3F
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 14:53:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 575283C8892
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 14:53:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E235F3C2AB9
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 14:53:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6C86D601142
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 14:53:08 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C2BDF200C7;
 Tue,  3 Aug 2021 12:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1627995187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vk0pQckzU7D48CN+fMIJjBCnFc0xCwV2KzG0X80vec=;
 b=hB7qSuU5azvFO0kEtl/wEiPF15GYUjArlXCtntsc8CHn2g9orbAVpKRf2sxFj1N6W14mRh
 t/TPlu8SmqlILLIzxeQT2VLRKg/UV4YybOxbrYNSvRhf8B0W8heQ151SwIfXG8Yzh31NZk
 rxiEe9+cu8Donf14l34bVJ5K3j4aIgM=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 918A1A3BCA;
 Tue,  3 Aug 2021 12:53:07 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  3 Aug 2021 13:52:50 +0100
Message-Id: <20210803125252.16214-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <87czquna4l.fsf@suse.de>
References: <87czquna4l.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/3] API: TST_EXP_FAIL: Allow passing when errno is
 not checked
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Judging by the existing usage of TST_EXP_FAIL(..., 0, ...) in
finit_module02. We want to pass if errno == 0 otherwise the test will
not return a result.

This is also less surprising than giving errno == 0 a dual
meaning.

This also changes the trailing '\' indentation to tabs. However this
is correct and the rest of the file is wrong.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

V3:
* Add fix for TST_EXP_FAIL which prevented the test from
  passing on a non buggy system.
* TCONF but continue on non 32-bit compat mode
* Add Fixes trailer

V2:
* Add mising lapi header

 include/tst_test_macros.h | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 41886fbbc..4c1df58ff 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -137,17 +137,15 @@ extern void *TST_RET_PTR;
 			break;                                                 \
 		}                                                              \
 		                                                               \
-		if (ERRNO) {                                                   \
-			if (TST_ERR == ERRNO) {                                \
-				TST_MSG_(TPASS | TTERRNO, " ",                 \
-				         #SCALL, ##__VA_ARGS__);               \
-				TST_PASS = 1;                                  \
-			} else {                                               \
-				TST_MSGP_(TFAIL | TTERRNO, " expected %s",     \
-				          tst_strerrno(ERRNO),                 \
-				          #SCALL, ##__VA_ARGS__);              \
-			}                                                      \
-		}                                                              \
+		if (!ERRNO || TST_ERR == ERRNO) {			\
+			TST_MSG_(TPASS | TTERRNO, " ",			\
+				 #SCALL, ##__VA_ARGS__);		\
+			TST_PASS = 1;					\
+		} else {						\
+			TST_MSGP_(TFAIL | TTERRNO, " expected %s",	\
+				  tst_strerrno(ERRNO),			\
+				  #SCALL, ##__VA_ARGS__);		\
+		}							\
 	} while (0)
 
 #define TST_EXP_FAIL(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET == 0, SCALL, ERRNO, __VA_ARGS__)
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
