Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6760174323
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 04:15:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 128253C1D1C
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 04:15:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 467F03C1C95;
 Thu, 25 Jul 2019 04:15:18 +0200 (CEST)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 409461001572;
 Thu, 25 Jul 2019 04:15:10 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 19:15:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="177836772"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2019 19:15:13 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 24 Jul 2019 19:15:12 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 24 Jul 2019 19:15:12 -0700
Received: from shsmsx106.ccr.corp.intel.com ([169.254.10.240]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.80]) with mapi id 14.03.0439.000;
 Thu, 25 Jul 2019 10:15:10 +0800
From: "Yu, SiliangX" <siliangx.yu@intel.com>
To: ltp <ltp@lists.linux.it>, ltp-request <ltp-request@lists.linux.it>,
 ltp-owner <ltp-owner@lists.linux.it>, "Zhang, Yixin" <yixin.zhang@intel.com>, 
 "Chen, Jerry T" <jerry.t.chen@intel.com>
Thread-Topic: [PATCH LTP] -Cpuhotplug06:Skip the test if "htop" is used.
Thread-Index: AQHVQowJIWE3DqeTYEas9xRCNS1Aoqbal72g
Date: Thu, 25 Jul 2019 02:15:10 +0000
Message-ID: <93CB9FBFC0191046943085F64FD50730012E1660@SHSMSX106.ccr.corp.intel.com>
References: <20190724234502.105332-1-siliangx.yu@intel.com>
In-Reply-To: <20190724234502.105332-1-siliangx.yu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH LTP] -Cpuhotplug06:Skip the test if "htop" is used.
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

Hi,all

So sorry for this.
Please ignore this mail.

Best Regards
Siliang Yu


-----Original Message-----
From: Yu, SiliangX 
Sent: Thursday, July 25, 2019 7:45 AM
To: ltp <ltp@lists.linux.it>; ltp-request <ltp-request@lists.linux.it>; ltp-owner <ltp-owner@lists.linux.it>; Yu, SiliangX <siliangx.yu@intel.com>; Zhang, Yixin <yixin.zhang@intel.com>; Chen, Jerry T <jerry.t.chen@intel.com>
Subject: [PATCH LTP] -Cpuhotplug06:Skip the test if "htop" is used.

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
 
+LNTOP=$(ls -l $(which top) | cut -s -d ">" -f2) if [[ -n $LNTOP ]] && 
+[[ $LNTOP != "top" ]] ; then
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
