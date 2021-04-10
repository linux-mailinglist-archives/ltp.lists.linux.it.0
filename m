Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AD28C35ABAA
	for <lists+linux-ltp@lfdr.de>; Sat, 10 Apr 2021 09:30:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A9853C7AEF
	for <lists+linux-ltp@lfdr.de>; Sat, 10 Apr 2021 09:30:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF52A3C1D3F
 for <ltp@lists.linux.it>; Sat, 10 Apr 2021 09:30:53 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AABA76006D1
 for <ltp@lists.linux.it>; Sat, 10 Apr 2021 09:30:52 +0200 (CEST)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FHRSM03t0zqT5G
 for <ltp@lists.linux.it>; Sat, 10 Apr 2021 15:28:35 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Sat, 10 Apr 2021 15:30:38 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Sat, 10 Apr 2021 15:30:38 +0800
Message-ID: <20210410073038.21386-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_test.sh: Add statistics info TST_BROK
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

Before test exit, we need print statistics info of TST_BROK.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/lib/tst_test.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index a6a8e9579..02152796a 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -82,6 +82,7 @@ _tst_do_exit()
 	echo "Summary:"
 	echo "passed   $TST_PASS"
 	echo "failed   $TST_FAIL"
+	echo "broked   $TST_BROK"
 	echo "skipped  $TST_CONF"
 	echo "warnings $TST_WARN"

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
