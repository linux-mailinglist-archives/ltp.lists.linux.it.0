Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC168655
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 11:29:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2942A3C1D03
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 11:29:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 73E7D3C18F9
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 11:29:49 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A8C3F6005C0
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 11:29:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2142AD0B
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 09:29:46 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 15 Jul 2019 11:29:45 +0200
Message-Id: <20190715092945.14175-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] snd_timer01: Fix compilation
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

On a few older distributions the timer functions used in fuzzy sync
library needs -lrt and also -pthread has to be in CFLAGS instead.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/sound/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/sound/Makefile b/testcases/kernel/sound/Makefile
index ad1e25c30..9abcc2b27 100644
--- a/testcases/kernel/sound/Makefile
+++ b/testcases/kernel/sound/Makefile
@@ -6,7 +6,7 @@ include $(top_srcdir)/include/mk/testcases.mk
 
 CPPFLAGS		+= -D_GNU_SOURCE
 
-LDLIBS			+= -pthread
-
+snd_timer01: CFLAGS+=-pthread
+snd_timer01: LDLIBS+=-lrt
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
