Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2F68723F
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 08:30:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 121483C1D1F
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 08:30:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id F24F83C1D1E
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 08:30:14 +0200 (CEST)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E9E801401A5D
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 08:30:13 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 23:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="326543121"
Received: from yixin-dev.sh.intel.com ([10.239.161.25])
 by orsmga004.jf.intel.com with ESMTP; 08 Aug 2019 23:30:10 -0700
From: Yixin Zhang <yixin.zhang@intel.com>
To: ltp@lists.linux.it,
	Yixin Zhang <yixin.zhang@intel.com>
Date: Fri,  9 Aug 2019 14:20:00 +0800
Message-Id: <20190809062000.8671-5-yixin.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809062000.8671-1-yixin.zhang@intel.com>
References: <20190809062000.8671-1-yixin.zhang@intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH ltp 5/5] runtest/numa: rename duplicated test cases
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

move_pages** is used in syscalls, rename them to move_pages**_numa here.

Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
---
 runtest/numa | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/runtest/numa b/runtest/numa
index 7885be90c..667eff773 100644
--- a/runtest/numa
+++ b/runtest/numa
@@ -1,16 +1,16 @@
 Numa-testcases numa01.sh
-move_pages01 move_pages01
-move_pages02 move_pages02
-move_pages03 move_pages03
-move_pages04 move_pages04
-move_pages05 move_pages05
-move_pages06 move_pages06
-move_pages07 move_pages07
-move_pages08 move_pages08
-move_pages09 move_pages09
-move_pages10 move_pages10
-move_pages11 move_pages11
-move_pages12 move_pages12
+move_pages01_numa move_pages01
+move_pages02_numa move_pages02
+move_pages03_numa move_pages03
+move_pages04_numa move_pages04
+move_pages05_numa move_pages05
+move_pages06_numa move_pages06
+move_pages07_numa move_pages07
+move_pages08_numa move_pages08
+move_pages09_numa move_pages09
+move_pages10_numa move_pages10
+move_pages11_numa move_pages11
+move_pages12_numa move_pages12
 
 set_mempolicy01 set_mempolicy01
 set_mempolicy02 set_mempolicy02
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
