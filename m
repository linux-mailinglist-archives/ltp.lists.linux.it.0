Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1075A263A86
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 04:32:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 833EA3C2C8A
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 04:32:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 533423C224B
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 04:32:03 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 47F22140115A
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 04:32:01 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,411,1592841600"; d="scan'208";a="99077141"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Sep 2020 10:31:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 7408B48990EA
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 10:31:59 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.75) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 10 Sep 2020 10:31:58 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 9 Sep 2020 22:30:28 -0400
Message-ID: <1599705028-12889-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.75]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7408B48990EA.A884C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] route{4,
 6}-rmmod: Declare variables before using them
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

When running route4-rmmod case, it reports the following error:
/opt/ltp/testcases/bin/route4-rmmod: line 100: lhost_module: unbound variable.

It fails because "set -u" is used in .testcases/lib/cmdlib.sh and
"set -u" treats unset variables and parameters as errors.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 testcases/network/stress/route/route4-rmmod | 3 +++
 testcases/network/stress/route/route6-rmmod | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/testcases/network/stress/route/route4-rmmod b/testcases/network/stress/route/route4-rmmod
index 5947bb3..7aa1958 100644
--- a/testcases/network/stress/route/route4-rmmod
+++ b/testcases/network/stress/route/route4-rmmod
@@ -125,6 +125,9 @@ do_setup()
 	exit $TST_TOTAL
     fi
 
+    # The module name of the interface at the local host
+    lhost_module=
+
     # Make sure to clean up
     do_cleanup
 
diff --git a/testcases/network/stress/route/route6-rmmod b/testcases/network/stress/route/route6-rmmod
index 73f26f2..765a57a 100644
--- a/testcases/network/stress/route/route6-rmmod
+++ b/testcases/network/stress/route/route6-rmmod
@@ -121,6 +121,9 @@ do_setup()
 	exit $TST_TOTAL
     fi
 
+    # The module name of the interface at the local host
+    lhost_module=
+
     # Make sure to clean up
     do_cleanup
 
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
