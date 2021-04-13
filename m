Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2746E35DDAC
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 13:27:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DC203C71F4
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 13:27:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 574BE3C1B0B
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 13:27:07 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 44A001000643
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 13:27:05 +0200 (CEST)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FKNYz0f8GzlXk0
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 19:25:11 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 19:26:53 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 13 Apr 2021 19:26:49 +0800
Message-ID: <20210413112649.3141-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_res: Replace tst_res with tst_brk for shell
 testcases
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

We need replace tst_res with tst_brk to terminate the test immediately since
there is no sence to go on.

For those:
	testcases/commands/lsmod/lsmod01.sh
        testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
        testcases/network/virt/sit01.sh

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/commands/lsmod/lsmod01.sh                            | 3 +--
 .../kernel/security/integrity/ima/tests/ima_measurements.sh    | 2 +-
 testcases/network/virt/sit01.sh                                | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/testcases/commands/lsmod/lsmod01.sh b/testcases/commands/lsmod/lsmod01.sh
index 2e044c718..44ca59b95 100755
--- a/testcases/commands/lsmod/lsmod01.sh
+++ b/testcases/commands/lsmod/lsmod01.sh
@@ -23,8 +23,7 @@ setup()
 		tst_require_cmds insmod
 		insmod "$TST_MODPATH"
 		if [ $? -ne 0 ]; then
-			tst_res TBROK "insmod failed"
-			return
+			tst_brk TBROK "insmod failed"
 		fi

 		module_inserted=1
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh b/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
index 1927e937c..4c8d740b5 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
@@ -35,7 +35,7 @@ ima_check()
 		algorithm=$(echo "$tmp" | cut -d'|' -f1)
 		digest=$(echo "$tmp" | cut -d'|' -f2)
 	else
-		tst_res TBROK "failed to get algorithm/digest for '$TEST_FILE': $tmp"
+		tst_brk TBROK "failed to get algorithm/digest for '$TEST_FILE': $tmp"
 	fi

 	tst_res TINFO "computing digest for $algorithm algorithm"
diff --git a/testcases/network/virt/sit01.sh b/testcases/network/virt/sit01.sh
index 4ecc1f8c0..27fa0ee77 100755
--- a/testcases/network/virt/sit01.sh
+++ b/testcases/network/virt/sit01.sh
@@ -11,7 +11,7 @@ virt_type="sit"

 do_setup()
 {
-	[ -n "$TST_IPV6" ] && tst_res TBROK "invalid option '-6' for sit tunnel"
+	[ -n "$TST_IPV6" ] && tst_brk TBROK "invalid option '-6' for sit tunnel"

 	virt_lib_setup

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
