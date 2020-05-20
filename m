Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 785DA1DAC62
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 09:38:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07B6E3C4E27
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 09:38:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D81433C088F
 for <ltp@lists.linux.it>; Wed, 20 May 2020 09:38:25 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D4B461A01553
 for <ltp@lists.linux.it>; Wed, 20 May 2020 09:38:22 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,412,1583164800"; d="scan'208";a="92620581"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 May 2020 15:32:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8FBB94CE26C8;
 Wed, 20 May 2020 15:32:06 +0800 (CST)
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 20 May 2020 15:32:06 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 20 May 2020 15:32:06 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 20 May 2020 15:26:04 +0800
Message-ID: <20200520072605.12614-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 8FBB94CE26C8.AF45F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] tirpc: Pass all extra client options to client program
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

New rpc_test.sh only passes the first extra client option to
client program if extra client options are two or more.
For example, only "1" is passed into tirpc_rpc_broadcast_exp:
-------------------------------------------
./runltp -f net.tirpc_tests -s tirpc_rpc_broadcast_exp
...
tag=tirpc_rpc_broadcast_exp stime=1589957933
cmdline="rpc_test.sh -s tirpc_svc_1 -c tirpc_rpc_broadcast_exp -e "1 2""
...
rpc_test 1 TFAIL: tirpc_rpc_broadcast_exp 10.0.0.2 536875000 1 failed unexpectedly
-------------------------------------------
For extra client options, use comma as a delimiter in net.tirpc_tests
and replace it with white space in rpc_test.sh

Fixes: 3190368d2df8 ("rpc/rpc_test.sh: Rewrite into new shell API")
Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 runtest/net.tirpc_tests                     | 2 +-
 testcases/network/rpc/rpc-tirpc/rpc_test.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/runtest/net.tirpc_tests b/runtest/net.tirpc_tests
index 48e9ba3f5..8aa69ef4d 100644
--- a/runtest/net.tirpc_tests
+++ b/runtest/net.tirpc_tests
@@ -38,7 +38,7 @@ tirpc_clnt_control rpc_test.sh -s tirpc_svc_3 -c tirpc_clnt_control
 tirpc_rpc_reg rpc_test.sh -c tirpc_rpc_reg
 tirpc_rpc_call rpc_test.sh -s tirpc_svc_1 -c tirpc_rpc_call
 tirpc_rpc_broadcast rpc_test.sh -s tirpc_svc_1 -c tirpc_rpc_broadcast
-tirpc_rpc_broadcast_exp rpc_test.sh -s tirpc_svc_1 -c tirpc_rpc_broadcast_exp -e "1 2"
+tirpc_rpc_broadcast_exp rpc_test.sh -s tirpc_svc_1 -c tirpc_rpc_broadcast_exp -e "1,2"
 
 tirpc_clnt_create rpc_test.sh -s tirpc_svc_2 -c tirpc_clnt_create
 tirpc_clnt_create_timed rpc_test.sh -s tirpc_svc_2 -c tirpc_clnt_create_timed
diff --git a/testcases/network/rpc/rpc-tirpc/rpc_test.sh b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
index dc97213d0..bcefadbdb 100755
--- a/testcases/network/rpc/rpc-tirpc/rpc_test.sh
+++ b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
@@ -37,7 +37,7 @@ rpc_parse_args()
 {
 	case "$1" in
 		c) CLIENT="$OPTARG" ;;
-		e) CLIENT_EXTRA_OPTS="$OPTARG" ;;
+		e) CLIENT_EXTRA_OPTS="${OPTARG//','/' '}" ;;
 		s) SERVER="$OPTARG" ;;
 	esac
 }
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
