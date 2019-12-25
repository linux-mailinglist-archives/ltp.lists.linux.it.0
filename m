Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E6E12A67D
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Dec 2019 07:58:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 515CE3C242C
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Dec 2019 07:58:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 93C1C3C1C90
 for <ltp@lists.linux.it>; Wed, 25 Dec 2019 07:58:28 +0100 (CET)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AA02D600D01
 for <ltp@lists.linux.it>; Wed, 25 Dec 2019 07:58:24 +0100 (CET)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
 [147.11.189.41])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBP6w1lw008857
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 24 Dec 2019 22:58:12 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.468.0; Tue, 24 Dec 2019 22:57:44 -0800
From: <zhe.he@windriver.com>
To: <ltp@lists.linux.it>
Date: Wed, 25 Dec 2019 14:57:43 +0800
Message-ID: <1577257063-246792-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] nm01: Remove prefix zeros of the addresses output by
 nm before comparing
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

From: He Zhe <zhe.he@windriver.com>

The latest nm v2.33.1.20191208 outputs symbols addresses without prefix zeros
for "nm -f posix", which causes the following error.
nm01 5 TFAIL: Got wrong format with -f bsd

Let's remove the prefix zeros before comparing.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 testcases/commands/nm/nm01.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/commands/nm/nm01.sh b/testcases/commands/nm/nm01.sh
index 30c41bd..29b6bd7 100755
--- a/testcases/commands/nm/nm01.sh
+++ b/testcases/commands/nm/nm01.sh
@@ -84,6 +84,9 @@ test5()
 	EXPECT_PASS $NM -f bsd $TST_DATAROOT/f1 \> nm_bsd.out
 	EXPECT_PASS $NM -f posix $TST_DATAROOT/f1 \> nm_posix.out
 
+	ROD awk '{print gensub(/(0+)([0-9a-fA-F]+)/, "\\2", "g")}' nm_bsd.out \> nm_bsd.out
+	ROD awk '{print gensub(/(0+)([0-9a-fA-F]+)/, "\\2", "g")}' nm_posix.out \> nm_posix.out
+
 	ROD awk '{print $3 $2 $1}' nm_bsd.out \> nm1.out
 	ROD awk '{print $1 $2 $3}' nm_posix.out \> nm2.out
 
-- 
2.7.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
