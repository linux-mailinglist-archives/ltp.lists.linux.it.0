Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2B374304
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 03:55:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34D843C1CF9
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 03:55:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E81D83C1C90;
 Thu, 25 Jul 2019 03:55:22 +0200 (CEST)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CF7241001577;
 Thu, 25 Jul 2019 03:55:13 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 18:55:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="189215430"
Received: from clr-fa122fde6a834fdf83018a81a8679117.sh.intel.com
 ([10.239.53.16])
 by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2019 18:55:13 -0700
From: "Siliang,Yu" <siliangx.yu@intel.com >
To: ltp <ltp@lists.linux.it>, ltp-request <ltp-request@lists.linux.it>,
 ltp-owner <ltp-owner@lists.linux.it>, Siliang Yu <siliangx.yu@intel.com>,
 YiXin Zhang <yixin.zhang@intel.com>, Jerry Chen <jerry.t.chen@intel.com>
Date: Thu, 25 Jul 2019 07:45:02 +0800
Message-Id: <20190724234502.105332-1-siliangx.yu@intel.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=5.7 required=7.0 tests=FROM_ADDR_WS,FROM_WSP_TRAIL,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH LTP] -Cpuhotplug06:Skip the test if "htop" is used.
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

In some distro, "htop" is used instead "top", which doesn't support '-b'. Skip the test if "htop" is used.
---
 .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
index 18a11197e..ecf4eedea 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
@@ -49,6 +49,11 @@ done
 
 LOOP_COUNT=1
 
+LNTOP=$(ls -l $(which top) | cut -s -d ">" -f2)
+if [[ -n $LNTOP ]] && [[ $LNTOP != "top" ]] ; then
+	tst_brkm TCONF "Command doesn't support , Skip the test..."
+fi
+
 if [ $(get_present_cpus_num) -lt 2 ]; then
 	tst_brkm TCONF "system doesn't have required CPU hotplug support"
 fi
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
