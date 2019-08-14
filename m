Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CC48C585
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Aug 2019 03:20:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F3F13C1D2F
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Aug 2019 03:20:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C15FC3C0752
 for <ltp@lists.linux.it>; Wed, 14 Aug 2019 03:20:26 +0200 (CEST)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0B7CE1A00CA9
 for <ltp@lists.linux.it>; Wed, 14 Aug 2019 03:20:23 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 18:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="177970344"
Received: from unknown (HELO
 clr-5bc08f9ae9b04006803b151ba2ab3629.jf.intel.com) ([10.165.9.167])
 by fmsmga007.fm.intel.com with ESMTP; 13 Aug 2019 18:20:19 -0700
From: SiliangYu <siliangx.yu@intel.com >
To: ltp <ltp@lists.linux.it>, Siliang Yu <siliangx.yu@intel.com>,
 Jerry Chen <jerry.t.chen@intel.com>, YiXin Zhang <yixin.zhang@intel.com>
Date: Wed, 14 Aug 2019 09:15:45 +0000
Message-Id: <20190814091545.147098-1-siliangx.yu@intel.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=5.0 required=7.0 tests=DATE_IN_FUTURE_06_12,
 FROM_ADDR_WS,FROM_WSP_TRAIL,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 LTP] Skip the test if "htop" is used.
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

From: "Yu,Siliang" <siliangx.yu@intel.com>

In clear linux os, "htop" is used instead "top", which doesn't support '-b'. Skip the test on clear linux.

Signed-off-by: Yu,Siliang <siliangx.yu@intel.com>
---
 .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
index 18a11197e..da7a4df73 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
@@ -49,6 +49,10 @@ done
 
 LOOP_COUNT=1
 
+if top -v | grep -q htop; then
+	tst_brkm TCONF "htop is used instead of top, Skip the test..."
+fi
+
 if [ $(get_present_cpus_num) -lt 2 ]; then
 	tst_brkm TCONF "system doesn't have required CPU hotplug support"
 fi
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
