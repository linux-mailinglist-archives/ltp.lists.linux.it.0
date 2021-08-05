Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA4D3E0E4E
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 08:28:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF28E3C7D7B
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 08:28:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 874B93C7D1E
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 08:28:28 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1789E200DBB
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 08:28:25 +0200 (CEST)
X-QQ-mid: bizesmtp54t1628144898t5ukmkrb
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 05 Aug 2021 14:28:14 +0800 (CST)
X-QQ-SSF: 0140000000200020B000B00A0000000
X-QQ-FEAT: NviVax2pLsWVIGU4J3CIG33LtV7G4zGh9ZA7oBWxpfJX77xU/UEGE2txtaV0n
 JIIuwTWSKrayGaauUzaqTdxJpebCIjN8oFIgBur1l15z5/N4PkVP5CBpCFfECCFIH8HB4Vq
 pVZO5Ci64sT4aa88KLI7cxsE3E5lfXuO6jI4G26KERrdr+GzmeMAe2GNAx+kt2WptEOzBlG
 W7YtfVyNo38ke4VrFUK23uevqKPVneIUfWWQuIse1myV5WfDxs7LE+jcIwVbLssjZtKI7A5
 b3pw3KXOqR8k3wP9gzUEnEqnxhTm9png1gPBG/BUGEEpj+murrYjOEh6MCt8EyapmpjOSjA
 AMkaCXP
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Thu,  5 Aug 2021 14:28:12 +0800
Message-Id: <20210805062812.7363-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] include/tst_test: Expose tst_tmpdir and tst_rmdir to
 newlib tests.
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

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/include/tst_test.h b/include/tst_test.h
index ce4e007cf..0e0806c93 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -303,6 +303,14 @@ void tst_set_timeout(int timeout);
  * Returns path to the test temporary directory in a newly allocated buffer.
  */
 char *tst_get_tmpdir(void);
+/*
+ * Make the temporary directory and change to the temporary directory.
+ */
+void tst_tmpdir(void);
+/*
+ * Remove the temporary directory.
+ */
+void tst_rmdir(void);

 #ifndef TST_NO_DEFAULT_MAIN

--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
