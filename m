Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3998723E
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 08:30:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D27AD3C1D71
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 08:30:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id EEA903C183A
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 08:30:13 +0200 (CEST)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 299A3200B12
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 08:30:12 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 23:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="326543113"
Received: from yixin-dev.sh.intel.com ([10.239.161.25])
 by orsmga004.jf.intel.com with ESMTP; 08 Aug 2019 23:30:10 -0700
From: Yixin Zhang <yixin.zhang@intel.com>
To: ltp@lists.linux.it,
	Yixin Zhang <yixin.zhang@intel.com>
Date: Fri,  9 Aug 2019 14:19:59 +0800
Message-Id: <20190809062000.8671-4-yixin.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809062000.8671-1-yixin.zhang@intel.com>
References: <20190809062000.8671-1-yixin.zhang@intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH ltp 4/5] runtest/crashme: rename mem01 to avoid
 duplication
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

mem01 is already in runtest file mm. Rename the test to mem01_crashme
here.

Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
---
 runtest/crashme | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runtest/crashme b/runtest/crashme
index a4c5b41cc..e853663e6 100644
--- a/runtest/crashme
+++ b/runtest/crashme
@@ -10,7 +10,7 @@ crash01 crash01
 crash02 crash02
 # Generate random syscalls and execute them, less probability
 # to hose your system, but still.
-mem01 mem01 -r
+mem01_crashme mem01 -r
 # Memory eater. Loves to be run in parallel with other programs.
 # May panic on buggy systems if the OOM killer was not fast enough :-)
 fork12 fork12
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
