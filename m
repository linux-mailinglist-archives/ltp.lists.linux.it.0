Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5F43E1064
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 10:36:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 156D83C7DA4
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 10:36:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B64B53C57C1
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 10:36:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 384A7600F0B
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 10:36:13 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 55EE4222E6;
 Thu,  5 Aug 2021 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1628152573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pwpj8dvVMXAMQeEfHIvkJeKNKj2OHqWsxEl1LMGUI0=;
 b=VUNGrKSfok/wV1ERtwX1Y4Adp5hvE8GwuH+meqhwKQRj6LdEHYgdQJMyD0uDEu4h1G3u03
 dK/4I3qcGk+3i9bv1/rHwVDOtBEd47Chbhj6UaxttglhVlFSYd+Xi/A5c1IQ/sQEF8Q7Jn
 Q7j9tJPPCa2gEkx78zKeHR8M0dkJVMo=
Received: from g78.suse.de (rpalethorpe.udp.ovpn1.nue.suse.de [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id C94A3A3B91;
 Thu,  5 Aug 2021 08:36:08 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu,  5 Aug 2021 09:35:37 +0100
Message-Id: <20210805083539.20634-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <87a6lwmm6c.fsf@suse.de>
References: <87a6lwmm6c.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/3] API: TST_EXP_FAIL: Allow passing when errno is
 not set
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

TEST() sets errno to zero. So if something does not set errno on
failure it will be zero. It is normal for functions not to use errno,
some standard libraries are the exception.

The original code will not allow for a pass result if errno is not
set. So we can just remove the branch to allow that. It's not clear
what the original intention was.

This also changes the trailing '\' indentation to tabs. However this
is correct and the rest of the file is wrong.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

V4:
* Check for EINVAL.
* Unconditionally check TST_ERR == ERRNO.
  (redundant/irrelevant due to the above change, but we still should do it IMO)

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
index 41886fbbc..cd65d8d0d 100644
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
+		if (TST_ERR == ERRNO) {					\
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
