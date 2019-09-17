Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A35B47B1
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 08:51:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B5453C20B6
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 08:51:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 61FB33C1C95
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 08:51:51 +0200 (CEST)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 09E611A013C5
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 08:51:48 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 23:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,515,1559545200"; d="scan'208";a="201772305"
Received: from yixin-dev.sh.intel.com ([10.239.161.25])
 by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2019 23:51:45 -0700
From: Yixin Zhang <yixin.zhang@intel.com>
To: ltp@lists.linux.it,
	Yixin Zhang <yixin.zhang@intel.com>
Date: Tue, 17 Sep 2019 14:40:27 +0800
Message-Id: <20190917064027.27208-1-yixin.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH ltp] lib/newlib_tests: add tst_capability0{1,
 2} into .gitignore
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

tst_capability0{1,2} is missed in .gitignore

Fixes: 0cbcfbef8 ("capability: library tests")

Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
---
 lib/newlib_tests/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index 6788ddf90..d4aa4935f 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -14,6 +14,8 @@ test13
 test14
 test15
 test16
+tst_capability01
+tst_capability02
 tst_device
 tst_safe_fileops
 tst_res_hexd
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
