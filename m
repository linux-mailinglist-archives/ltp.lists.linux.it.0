Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F71312B86
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Feb 2021 09:15:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C87DB3C693F
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Feb 2021 09:15:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 61C0E3C5DD9
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 09:15:01 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 850746000BF
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 09:14:58 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,161,1610380800"; d="scan'208";a="104322187"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Feb 2021 16:14:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 664554CE6F7A
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 16:14:49 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.48) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Feb 2021 16:14:51 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 8 Feb 2021 03:14:38 -0500
Message-ID: <1612772078-29651-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.48]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 664554CE6F7A.A942C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] netns_helper: Make iproute version check work
 correctly
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

Since the iproute2 patch[1]("replace SNAPSHOT with auto-generated version string"),
the output format of "ip -V" has changed form "ip utility, iproute2-ss*" to
"ip utility, iproute2-*", which leads to an exception when checking the version
of iproute. Use return to avoid unexpected TCONF.

[1]https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=fbef655568

Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 testcases/kernel/containers/netns/netns_helper.h  | 10 ++++++++--
 testcases/kernel/containers/netns/netns_helper.sh |  9 +++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/containers/netns/netns_helper.h b/testcases/kernel/containers/netns/netns_helper.h
index 8b87645..8337051 100644
--- a/testcases/kernel/containers/netns/netns_helper.h
+++ b/testcases/kernel/containers/netns/netns_helper.h
@@ -37,6 +37,7 @@ static void check_iproute(unsigned int spe_ipver)
 	FILE *ipf;
 	int n;
 	unsigned int ipver = 0;
+	char ver;
 
 	ipf = popen("ip -V", "r");
 	if (ipf == NULL)
@@ -44,7 +45,14 @@ static void check_iproute(unsigned int spe_ipver)
 				"Failed while opening pipe for iproute check");
 
 	n = fscanf(ipf, "ip utility, iproute2-ss%u", &ipver);
+	pclose(ipf);
 	if (n < 1) {
+		ipf = popen("ip -V", "r");
+		n = fscanf(ipf, "ip utility, iproute2-%s", &ver);
+		if (n >= 1) {
+			pclose(ipf);
+			return;
+		}
 		tst_brkm(TCONF, NULL,
 			"Failed while obtaining version for iproute check");
 	}
@@ -52,8 +60,6 @@ static void check_iproute(unsigned int spe_ipver)
 		tst_brkm(TCONF, NULL, "The commands in iproute tools do "
 			"not support required objects");
 	}
-
-	pclose(ipf);
 }
 
 static int dummy(void *arg)
diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
index a5b77a0..bec43ac 100755
--- a/testcases/kernel/containers/netns/netns_helper.sh
+++ b/testcases/kernel/containers/netns/netns_helper.sh
@@ -50,6 +50,15 @@ tst_check_iproute()
 	local cur_ipver="$(ip -V)"
 	local spe_ipver="$1"
 
+	echo $cur_ipver | grep "ip utility, iproute2-ss" > /dev/null
+	ret1=$?
+	echo $cur_ipver | grep "ip utility, iproute2-" > /dev/null
+	ret2=$?
+
+	if [ $ret1 -ne 0 -a $ret2 -eq 0 ]; then
+		return
+	fi
+
 	cur_ipver=${cur_ipver##*s}
 
 	if [ -z "$cur_ipver" -o -z "$spe_ipver" ]; then
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
