Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4369A12D6C0
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 08:02:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E549E3C2392
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 08:02:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 668D13C2035
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 08:02:54 +0100 (CET)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6B62D1000A48
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 08:02:52 +0100 (CET)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBV72oYs014535
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 30 Dec 2019 23:02:50 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.468.0; Mon, 30 Dec 2019 23:02:50 -0800
From: <zhe.he@windriver.com>
To: <ltp@lists.linux.it>
Date: Tue, 31 Dec 2019 15:02:48 +0800
Message-ID: <1577775768-134223-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] nm01: Remove prefix zeros of the addresses output
 by nm before comparing
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
v2:
Add boundary mark to RE pattern to exactly cover the prefix zeros
Add one more temp file to contain trimmed output

 testcases/commands/nm/nm01.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/testcases/commands/nm/nm01.sh b/testcases/commands/nm/nm01.sh
index 30c41bd..fd9d3d9 100755
--- a/testcases/commands/nm/nm01.sh
+++ b/testcases/commands/nm/nm01.sh
@@ -84,8 +84,11 @@ test5()
 	EXPECT_PASS $NM -f bsd $TST_DATAROOT/f1 \> nm_bsd.out
 	EXPECT_PASS $NM -f posix $TST_DATAROOT/f1 \> nm_posix.out
 
-	ROD awk '{print $3 $2 $1}' nm_bsd.out \> nm1.out
-	ROD awk '{print $1 $2 $3}' nm_posix.out \> nm2.out
+	ROD awk '{print gensub(/\y(0+)([0-9a-fA-F]+)\y/, "\\2", "g")}' nm_bsd.out \> trimmed_nm_bsd.out
+	ROD awk '{print gensub(/\y(0+)([0-9a-fA-F]+)\y/, "\\2", "g")}' nm_posix.out \> trimmed_nm_posix.out
+
+	ROD awk '{print $3 $2 $1}' trimmed_nm_bsd.out \> nm1.out
+	ROD awk '{print $1 $2 $3}' trimmed_nm_posix.out \> nm2.out
 
 	if diff nm1.out nm2.out > /dev/null; then
 		tst_res TPASS "Got BSD format with -f bsd"
-- 
2.7.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
