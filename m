Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D053126DAF3
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 14:01:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7181D3C4E94
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 14:01:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3600E3C29DF
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 10:19:45 +0200 (CEST)
Received: from atcsqa06.andestech.com (59-120-53-16.HINET-IP.hinet.net
 [59.120.53.16])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id DD0E11A00CD8
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 10:19:42 +0200 (CEST)
Received: by atcsqa06.andestech.com (Postfix, from userid 5427)
 id 4FF89C1DEE; Thu, 17 Sep 2020 16:19:39 +0800 (CST)
From: Leo Yu-Chi Liang <ycliang@andestech.com>
To: ltp@lists.linux.it
Date: Thu, 17 Sep 2020 16:19:17 +0800
Message-Id: <20200917081917.31510-1-ycliang@andestech.com>
X-Mailer: git-send-email 2.17.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:01:17 +0200
Subject: [LTP] [PATCH]  device-drivers/zram: zram_lib: Fix modinfo's usage
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
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

zram_lib uses the exit code of modinfo to determine the presence of zram module,
but the exit code does not have direct relation to it.

We could be missing zram module and modinfo still exits "successfully"
because it has done its job of informing the user zram is missing.

Such behavior would give confusing zram test report.
Without this patch, some of the system run LTP without zram module
would have a FAIL instead of CONF as a result.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 testcases/kernel/device-drivers/zram/zram_lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index 3f4d1d55f..372b93990 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -211,5 +211,5 @@ zram_mount()
 	tst_res TPASS "mount of zram device(s) succeeded"
 }
 
-modinfo zram > /dev/null 2>&1 ||
+modinfo zram 2>&1 | grep filename > /dev/null 2>&1 ||
 	tst_brk TCONF "zram not configured in kernel"
-- 
2.17.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
