Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B891D12C8
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 14:34:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC0563C5505
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 14:34:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id AF2A03C2555
 for <ltp@lists.linux.it>; Wed, 13 May 2020 14:34:06 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 333681A00CB9
 for <ltp@lists.linux.it>; Wed, 13 May 2020 14:34:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E9F7AE33
 for <ltp@lists.linux.it>; Wed, 13 May 2020 12:34:08 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 13 May 2020 14:33:57 +0200
Message-Id: <20200513123357.13005-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] rpc-tirpc: Fix building TI-RPC code
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

TIRPC_LIBS variable requires including include/mk/env_pre.mk.

(Not included in Makefile.inc, because all it's users include
env_pre.mk themselves).

Fixes: c7d2a7458 ("rpc-tirpc: Detect libtirpc with pkg-config")
Fixes: 60b20c428 ("rpc: Enable and fix build basic RPC tests with glibc SunRPC")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/Makefile   | 2 ++
 .../network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/Makefile     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/Makefile
index c559153ae..253706e71 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/Makefile
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/Makefile
@@ -3,6 +3,8 @@
 
 top_srcdir		?= ../../../../../..
 
+include	$(top_srcdir)/include/mk/env_pre.mk
+
 ifeq ($(TIRPC_LIBS),)
 FILTER_OUT_DIRS	+= tirpc
 endif
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/Makefile
index 0cbf4e504..95516cd29 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/Makefile
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/Makefile
@@ -3,6 +3,8 @@
 
 top_srcdir		?= ../../../../../../..
 
+include	$(top_srcdir)/include/mk/env_pre.mk
+
 ifeq ($(TIRPC_LIBS),)
 # glibc does not define registerrpc() in <rpc/rpc.h>
 # registerrpc() is deprecated in libtirpc, it should be replaced by rpc_reg()
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
