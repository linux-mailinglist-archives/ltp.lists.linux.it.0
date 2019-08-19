Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A24C91D8E
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 09:10:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E6893C1C96
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 09:10:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id BBCE23C1770
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 09:09:58 +0200 (CEST)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 07B091400543
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 09:09:56 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 00:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="202158853"
Received: from yixin-dev.sh.intel.com ([10.239.161.25])
 by fmsmga004.fm.intel.com with ESMTP; 19 Aug 2019 00:09:52 -0700
From: Yixin Zhang <yixin.zhang@intel.com>
To: ltp@lists.linux.it,
	Yixin Zhang <yixin.zhang@intel.com>
Date: Mon, 19 Aug 2019 14:59:28 +0800
Message-Id: <20190819065928.26939-1-yixin.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH ltp] testcases/kernel/Makefile: remove 'timer' from
 Android FILTER_OUT_DIRS
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

'timer' folder is removed in 0051eab232e7f777f435945b1aba8911f203d65b.
Remove it from FILTER_OUT_DIRS for Android

Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
---
 testcases/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
index 1a6a79be0..03ea25375 100644
--- a/testcases/kernel/Makefile
+++ b/testcases/kernel/Makefile
@@ -63,7 +63,7 @@ endif
 
 ifeq ($(ANDROID),1)
 FILTER_OUT_DIRS		+= containers controllers device-drivers fs io ipc mem \
-				sched security timers
+				sched security
 endif
 
 include $(top_srcdir)/include/mk/generic_trunk_target.mk
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
