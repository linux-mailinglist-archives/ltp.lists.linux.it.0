Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E466A6E4FD
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 13:21:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD57C3C1D0F
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 13:21:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 654DA3C180C;
 Fri, 19 Jul 2019 08:17:04 +0200 (CEST)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 291666020BF;
 Fri, 19 Jul 2019 08:16:57 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 23:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; d="scan'208";a="173415372"
Received: from clr-fa122fde6a834fdf83018a81a8679117.sh.intel.com
 ([10.239.53.16])
 by orsmga006.jf.intel.com with ESMTP; 18 Jul 2019 23:16:53 -0700
From: "Siliang,Yu" <siliangx.yu@intel.com >
To: ltp <ltp@lists.linux.it>, ltp-request <ltp-request@lists.linux.it>,
 ltp-owner <ltp-owner@lists.linux.it>, Siliang Yu <siliangx.yu@intel.com>,
 YiXin Zhang <yixin.zhang@intel.com>, Jerry Chen <jerry.t.chen@intel.com>
Date: Fri, 19 Jul 2019 12:06:55 +0800
Message-Id: <20190719040655.54345-1-siliangx.yu@intel.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=5.9 required=7.0 tests=FROM_ADDR_WS,FROM_WSP_TRAIL,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 19 Jul 2019 13:21:24 +0200
Subject: [LTP] [PATCH LTP] - cpuhotplug06.sh:Add judgment for command "top".
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

Only on clear linux OS,"top" is a link file.
If it's clear linux,skip the test.

Signed-off-by: Yu,Siliang <siliangx.yu@intel.com>
---
 .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
index 18a11197e..d5877d085 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
@@ -49,6 +49,10 @@ done
 
 LOOP_COUNT=1
 
+if [[ -L "/usr/bin/top" ]];then
+        tst_brkm TCONF "Invalid argument on Clear Linux Skip the test..."
+fi
+
 if [ $(get_present_cpus_num) -lt 2 ]; then
 	tst_brkm TCONF "system doesn't have required CPU hotplug support"
 fi
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
