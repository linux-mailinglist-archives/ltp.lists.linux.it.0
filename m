Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CFC3E2229
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 05:21:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFDF63C7F46
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 05:21:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9AC313C03FE
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 05:21:48 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3DF2C200931
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 05:21:44 +0200 (CEST)
X-QQ-mid: bizesmtp40t1628220099tqfea5ef
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 06 Aug 2021 11:21:33 +0800 (CST)
X-QQ-SSF: 0140000000200030B000B00C0000000
X-QQ-FEAT: zEy9C1EMlXyS8ziQZXxrlCwr7hfoNoEYzKi0QvHz7IXjGRUrDHq7zk76KarF/
 JZtxn5tia3XqSbZDUndQp7qrONVH3yMdlPTYDwhhEh3VKq+DtSOiaOCU/XYCGWloz7GlIYr
 vG7LhU0QAZhXJGe2+akVsYohAMz2dafDqdTAUbBKlM18iPU7txqhZ4mH6qjg5pqu9Yoe7o3
 l+hC0iYOrEl9O26+GsfDaHhtSNOe03zRUVRCUhiTSaBt3u7ZbvR4Qa1NrmfVU5sNXsCgyPD
 HtawYXQ4fjlTlPmIZcMUUh6rgJTFMsSqycXSHMQj6YQgBKJNh00RY3ty1ej6pL6ro7rA==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 11:21:31 +0800
Message-Id: <20210806032131.25721-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_tmpdir: tst_get_tmpdir() add error handing
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

diff --git a/lib/tst_tmpdir.c b/lib/tst_tmpdir.c
index 0c39eb89f..f006e4893 100644
--- a/lib/tst_tmpdir.c
+++ b/lib/tst_tmpdir.c
@@ -108,12 +108,18 @@ int tst_tmpdir_created(void)

 char *tst_get_tmpdir(void)
 {
+	char *ret = NULL;
+
 	if (TESTDIR == NULL) {
 		tst_brkm(TBROK, NULL, "you must call tst_tmpdir() first");
 		return NULL;
 	}

-	return strdup(TESTDIR);
+	ret = strdup(TESTDIR);
+	if (!ret)
+		tst_brkm(TBROK, NULL, "strdup() failed");
+
+	return ret;
 }

 const char *tst_get_startwd(void)
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
