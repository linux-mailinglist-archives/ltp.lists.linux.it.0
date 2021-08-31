Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 532FA3FC0A2
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 04:00:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABEFA3CA39E
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 04:00:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E13463C2ABC
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 04:00:49 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CDC061400757
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 04:00:45 +0200 (CEST)
X-QQ-mid: bizesmtp36t1630375240t99evskv
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 31 Aug 2021 10:00:30 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00A0001000
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 31 Aug 2021 10:00:29 +0800
Message-Id: <20210831020029.12897-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] test_macros05: Add TST_EXP_VAL_* test
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

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/lib/newlib_tests/test_macros05.c b/lib/newlib_tests/test_macros05.c
index a164f23ac..fda1410a2 100644
--- a/lib/newlib_tests/test_macros05.c
+++ b/lib/newlib_tests/test_macros05.c
@@ -26,6 +26,9 @@ static int fail_fn_should_not_be_seen_in_output(void)

 static void do_test(void)
 {
+	TST_EXP_VAL(MACRO_FAIL(), -2);
+	TST_EXP_VAL_SILENT(MACRO_FAIL(), -2);
+
 	TST_EXP_FAIL(MACRO_FAIL(), EINVAL);
 	TST_EXP_FAIL2(MACRO_FAIL(), EINVAL);

--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
