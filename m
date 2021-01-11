Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 097592F0B5A
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 04:07:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCCFE3C6023
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 04:07:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 275F23C042D
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 04:07:17 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 15A251A00615
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 04:07:16 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,337,1602518400"; d="scan'208";a="103350710"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jan 2021 11:07:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id C9BB44CE602D;
 Mon, 11 Jan 2021 11:07:14 +0800 (CST)
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 11 Jan 2021 11:07:15 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Mon, 11 Jan 2021 11:07:14 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 11 Jan 2021 11:07:03 +0800
Message-ID: <20210111030704.5761-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-yoursite-MailScanner-ID: C9BB44CE602D.AAEBB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] build.sh: Remove deprecated CROSS_COMPILE
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

The CROSS_COMPILE was no longer used by ltp since 400ac9bbe20.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/build.sh b/build.sh
index 452cc6f4c..602ca419e 100755
--- a/build.sh
+++ b/build.sh
@@ -64,7 +64,7 @@ build_cross()
 	fi
 
 	echo "===== cross-compile ${host} ${1}-tree build into $PREFIX ====="
-	build $1 $2 "--host=$host" CROSS_COMPILE="${host}-"
+	build $1 $2 "--host=$host"
 }
 
 build()
-- 
2.30.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
