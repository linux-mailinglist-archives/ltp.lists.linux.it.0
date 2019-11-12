Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C34F8C88
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:12:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FEAB3C24C8
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:12:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 647E73C0637
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 05:00:26 +0100 (CET)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9BBA41401B63
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 05:00:22 +0100 (CET)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
 [147.11.189.41])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xAC40IJT010421
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Mon, 11 Nov 2019 20:00:18 -0800
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
 Mon, 11 Nov 2019 20:00:05 -0800
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <ltp@lists.linux.it>
Date: Tue, 12 Nov 2019 11:52:37 +0800
Message-ID: <20191112035237.39839-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 12 Nov 2019 11:12:22 +0100
Subject: [LTP] [PATCH] mkswap01.sh: Add "udevadm trigger" before swap
 verification
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

Fix: https://github.com/linux-test-project/ltp/issues/458

Sometimes the swap device cannot show up in /dev/disk/by-uuid/
or /dev/disk/by-lable/ due to the issue #458. When this issue
happens, "blkid -c /dev/null" and "ls /dev/disk/by-uuid/" show
different UUID of the device.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 testcases/commands/mkswap/mkswap01.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/commands/mkswap/mkswap01.sh b/testcases/commands/mkswap/mkswap01.sh
index 3a348c6e6..9437c4a4e 100755
--- a/testcases/commands/mkswap/mkswap01.sh
+++ b/testcases/commands/mkswap/mkswap01.sh
@@ -129,6 +129,8 @@ mkswap_test()
 		return
 	fi
 
+	udevadm trigger --name-match=$TST_DEVICE
+
 	if [ -n "$device" ]; then
 		mkswap_verify "$mkswap_op" "$op_arg" "$device" "$size" "$dev_file"
 		if [ $? -ne 0 ]; then
-- 
2.14.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
