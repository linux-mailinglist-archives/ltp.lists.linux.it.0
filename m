Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1BA36396D
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 04:39:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF6993C6E55
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 04:39:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6C6133C19EE
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 04:38:57 +0200 (CEST)
Received: from mail-m971.mail.163.com (mail-m971.mail.163.com [123.126.97.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 16DA12005F8
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 04:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=h9kJY
 s1foqIu0Dj2FN43MtnNUDoF33LjJcoIJMW7lkA=; b=B2YulaKAcYdA1kGPc6Xpl
 f9Ag2GAbBwIm9viF4rX8opx5Mk+lWkdCAhVd+9SV6agrO2fzcjEjrQdBd2HhrwaB
 yAcAVMBdJZgoiYIh9XoR5JXukwJVAXjvYF7poIjqYt0IGP6jTo0f0JyKF37A6Tjk
 DazG9GgLlEW1PiKQz3bF4c=
Received: from localhost.localdomain (unknown [122.96.45.112])
 by smtp1 (Coremail) with SMTP id GdxpCgBH1WE27XxgTxwoCA--.108S2;
 Mon, 19 Apr 2021 10:38:47 +0800 (CST)
From: ice_yangxiao@163.com
To: ltp@lists.linux.it
Date: Mon, 19 Apr 2021 10:38:43 +0800
Message-Id: <20210419023845.19140-1-ice_yangxiao@163.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CM-TRANSID: GdxpCgBH1WE27XxgTxwoCA--.108S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1kurykGw4fCrWkZFW8JFb_yoW3trb_C3
 W3JrykWw4SgF4fta9ayFyxXr47Cw4rGF15ZF1UAas7A34jywn8Jrs3Gr97Wrs8WwsxCFyU
 tF97ZryIqF17AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb_cTtUUUUU==
X-Originating-IP: [122.96.45.112]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiEBd5Xl8YFmb6BQAAso
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] include/tst_test_macros.h: Add TST_EXP_PID and
 TST_EXP_PID_SILENT macros
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

From: Xiao Yang <yangx.jy@fujitsu.com>

Signed-off-by: Xiao Yang <yangx.jy@fujitsu.com>
---
 include/tst_test_macros.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 189891507..101ac2c87 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -77,6 +77,17 @@ extern void *TST_RET_PTR;
 				#SCALL, ##__VA_ARGS__);                        \
 	} while (0)
 
+#define TST_EXP_PID_SILENT(SCALL, ...)	TST_EXP_FD_SILENT(SCALL, __VA_ARGS__)
+
+#define TST_EXP_PID(SCALL, ...)                                                \
+	do {                                                                   \
+		TST_EXP_PID_SILENT(SCALL, __VA_ARGS__);                        \
+									       \
+		if (TST_PASS)                                                  \
+			TST_MSGP_(TPASS, " returned pid %ld", TST_RET,         \
+				#SCALL, ##__VA_ARGS__);                        \
+	} while (0)
+
 #define TST_EXP_PASS_SILENT(SCALL, ...)                                        \
 	do {                                                                   \
 		TEST(SCALL);                                                   \
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
