Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FAE295C80
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 12:13:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D65F3C6228
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 12:13:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 010AE3C5690
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 12:13:13 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id DE2F91A00E7F
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 12:13:12 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; d="scan'208";a="100407945"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Oct 2020 18:13:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A65D648990D3
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 18:13:05 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.25) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Oct 2020 18:12:58 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 22 Oct 2020 06:12:28 -0400
Message-ID: <1603361548-1534-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.25]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A65D648990D3.A7C43
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] route{4,6}-rmmod: Filter out ":" and fix typos
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

Reported-by: Jin Cao <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 testcases/network/stress/route/route4-rmmod | 4 ++--
 testcases/network/stress/route/route6-rmmod | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/network/stress/route/route4-rmmod b/testcases/network/stress/route/route4-rmmod
index 7aa1958..1ba255e 100644
--- a/testcases/network/stress/route/route4-rmmod
+++ b/testcases/network/stress/route/route4-rmmod
@@ -164,14 +164,14 @@ do_setup()
     lhost_module=`ethtool -i $lhost_ifname | grep driver | sed "s/driver:[[:blank:]]*//"`
 
     # Chack the other active interface uses the same driver
-    for ifname in `ifconfig | grep ^eth | awk '{ print $1}'`; do
+    for ifname in `ifconfig | grep ^eth | awk '{print $1}' | sed "s/://"`; do
 	if [ $lhost_ifname = $ifname ]; then
 	    continue
 	fi
 
 	module=`ethtool -i $ifname | grep driver | sed "s/driver:[[:blank:]]*//"`
 	if [ $lhost_module = $module ]; then
-	    tst_resm TBROK "An active interface $ifname uses the same network deriver $module with the test intreface."
+	    tst_resm TBROK "An active interface $ifname uses the same network driver $module with the test interface."
 	    exit $TST_TOTAL
 	fi
     done
diff --git a/testcases/network/stress/route/route6-rmmod b/testcases/network/stress/route/route6-rmmod
index 765a57a..146fa77 100644
--- a/testcases/network/stress/route/route6-rmmod
+++ b/testcases/network/stress/route/route6-rmmod
@@ -160,14 +160,14 @@ do_setup()
     lhost_module=`ethtool -i $lhost_ifname | grep driver | sed "s/driver:[[:blank:]]*//"`
 
     # Chack the other active interface uses the same driver
-    for ifname in `ifconfig | grep ^eth | awk '{ print $1}'`; do
+    for ifname in `ifconfig | grep ^eth | awk '{print $1}' | sed "s/://"`; do
 	if [ $lhost_ifname = $ifname ]; then
 	    continue
 	fi
 
 	module=`ethtool -i $ifname | grep driver | sed "s/driver:[[:blank:]]*//"`
 	if [ $lhost_module = $module ]; then
-	    tst_resm TBROK "An active interface $ifname uses the same network deriver $module with the test intreface."
+	    tst_resm TBROK "An active interface $ifname uses the same network driver $module with the test interface."
 	    exit $TST_TOTAL
 	fi
     done
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
