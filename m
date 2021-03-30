Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B99D834E838
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 15:01:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4AE753C8BD0
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 15:01:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4EF093C0CB5
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 15:01:47 +0200 (CEST)
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9142D6008F2
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 15:01:43 +0200 (CEST)
Received: from localhost (unknown [192.168.167.223])
 by lucky1.263xmail.com (Postfix) with ESMTP id 35EF8B9D67
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 21:01:40 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P2194T140112570611456S1617109283504413_; 
 Tue, 30 Mar 2021 21:01:40 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a8a4fd9362bf988bf330e0a87a126db8>
X-RL-SENDER: sujiaxun@uniontech.com
X-SENDER: sujiaxun@uniontech.com
X-LOGIN-NAME: sujiaxun@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: sujiaxun <sujiaxun@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 30 Mar 2021 21:01:15 +0800
Message-Id: <20210330130115.26575-1-sujiaxun@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] bugfix for cpio/cpio_tests.sh
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
Cc: sujiaxun <sujiaxun@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In cpio version 2.12 and 2.13,'cpio --help' create is lowercase

Signed-off-by: sujiaxun <sujiaxun@uniontech.com>
---
 testcases/commands/cpio/cpio_tests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/commands/cpio/cpio_tests.sh b/testcases/commands/cpio/cpio_tests.sh
index a98b7eca7..5f3a13e85 100755
--- a/testcases/commands/cpio/cpio_tests.sh
+++ b/testcases/commands/cpio/cpio_tests.sh
@@ -13,7 +13,7 @@ TST_SETUP="setup"

 setup()
 {
-	if ! cpio --help 2>&1 | grep -q -- '-o.*Create'; then
+	if ! cpio --help 2>&1 | grep -qi -- '-o.*Create'; then
 		tst_brk TCONF "-o flag not supported"
 	fi

--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
