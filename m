Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 579062D4060
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 11:56:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAF1F3C2BE3
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 11:56:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 015953C2B12
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 11:56:20 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id DBFEB1000AFC
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 11:56:19 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,405,1599494400"; d="scan'208";a="102224660"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Dec 2020 18:56:17 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 228734CE6011
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 18:56:17 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 9 Dec 2020 18:56:16 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 9 Dec 2020 18:56:16 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 9 Dec 2020 18:35:46 +0800
Message-ID: <20201209103547.1343502-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 228734CE6011.A6081
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] docparse/docparse.c: Split the process of implied
 flags
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

Check implied flags in one loop and set implied flags in another
loop so that the following false positive can be avoided:
----------------------------------------------------
# docparse/docparse testcases/kernel/syscalls/chdir/chdir01.c
testcases/kernel/syscalls/chdir/chdir01.c: useless tag: needs_device
...
----------------------------------------------------

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 docparse/docparse.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/docparse/docparse.c b/docparse/docparse.c
index be6125353..22c5c6f2c 100644
--- a/docparse/docparse.c
+++ b/docparse/docparse.c
@@ -401,15 +401,15 @@ int main(int argc, char *argv[])
 
 	/* Normalize the result */
 	for (i = 0; implies[i].flag; i++) {
-		if (!data_node_hash_get(res, implies[i].flag))
-			continue;
-
-		if (data_node_hash_get(res, implies[i].implies)) {
+		if (data_node_hash_get(res, implies[i].flag) &&
+		    data_node_hash_get(res, implies[i].implies))
 			fprintf(stderr, "%s: useless tag: %s\n", argv[1], implies[i].implies);
-			continue;
-		}
+	}
 
-		data_node_hash_add(res, implies[i].implies, data_node_string("1"));
+	for (i = 0; implies[i].flag; i++) {
+		if (data_node_hash_get(res, implies[i].flag) &&
+		    !data_node_hash_get(res, implies[i].implies))
+			data_node_hash_add(res, implies[i].implies, data_node_string("1"));
 	}
 
 	data_node_hash_add(res, "fname", data_node_string(argv[1]));
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
