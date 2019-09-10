Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9DAE579
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 10:28:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C4DA3C209E
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 10:28:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 855873C1C8F
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 10:28:53 +0200 (CEST)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5729D200051
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 10:28:50 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 01:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="359743422"
Received: from unknown (HELO
 clr-5bc08f9ae9b04006803b151ba2ab3629.jf.intel.com) ([10.165.9.167])
 by orsmga005.jf.intel.com with ESMTP; 10 Sep 2019 01:28:48 -0700
From: SiliangYu <siliangx.yu@intel.com >
To: ltp <ltp@lists.linux.it>, Siliang Yu <siliangx.yu@intel.com>,
 Jerry Chen <jerry.t.chen@intel.com>, YiXin Zhang <yixin.zhang@intel.com>
Date: Tue, 10 Sep 2019 16:23:37 +0000
Message-Id: <20190910162337.60664-1-siliangx.yu@intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.7 required=7.0 tests=DATE_IN_FUTURE_06_12,
 FROM_ADDR_WS,FROM_WSP_TRAIL,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 LTP] Skip the test if "htop" is used.
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
index 18a11197e..74a3dd2b1 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
@@ -49,6 +49,10 @@ done
 
 LOOP_COUNT=1
 
+if top -v | grep -q htop; then
+	tst_brkm TCONF "htop is used instead of top, Skip the test(workaround: alias top='/path/to/real/top')"
+fi
+
 if [ $(get_present_cpus_num) -lt 2 ]; then
 	tst_brkm TCONF "system doesn't have required CPU hotplug support"
 fi
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
