Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B16226056
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 15:02:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B30DD3C4E1D
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 15:02:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 247493C0EC0
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 15:02:22 +0200 (CEST)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 964401A014CB
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 15:02:20 +0200 (CEST)
IronPort-SDR: X+NdyFHSy1G+ZSoQV1XDJJoXjEM7kVPuTfpXiKtKEHcUdj6lOBrq369OCdxxP45raKsmakDqLa
 XVpR75h+x76A==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="149887054"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="149887054"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 06:01:50 -0700
IronPort-SDR: khYA8x4DJWLrxuOpDIrFGaLntP17hfjVDHuT7jiWl6cMMYDxGeZqtZPNysi+SOaZuGCTUFsr48
 8hPKNXpOaGPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="392024193"
Received: from yixin-dev.sh.intel.com ([10.239.161.27])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2020 06:01:49 -0700
From: Yixin Zhang <yixin.zhang@intel.com>
To: ltp@lists.linux.it,
	Yixin Zhang <yixin.zhang@intel.com>
Date: Mon, 20 Jul 2020 20:54:52 +0800
Message-Id: <20200720125452.13821-1-yixin.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH ltp] syscalls/io_uring: add .gitignore file
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

Add .gitignore file for syscalls/io_uring

Fixes: 4c97e173cfdd ("syscall: Add io_uring related tests")
Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
---
 testcases/kernel/syscalls/io_uring/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 testcases/kernel/syscalls/io_uring/.gitignore

diff --git a/testcases/kernel/syscalls/io_uring/.gitignore b/testcases/kernel/syscalls/io_uring/.gitignore
new file mode 100644
index 000000000000..bfe22441fbf2
--- /dev/null
+++ b/testcases/kernel/syscalls/io_uring/.gitignore
@@ -0,0 +1 @@
+/io_uring01
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
