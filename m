Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671C1A2234
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 14:40:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C6983C2D21
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 14:40:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 923E93C21E8
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 14:40:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DFD7010014B3
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 14:40:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 87F44AC44
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 12:40:16 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  8 Apr 2020 14:40:30 +0200
Message-Id: <20200408124030.9058-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] pty/Makefile: The -lrt has to go to LDLIBS
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

Fixes: a49448f1b41b ("pty03: Add -lrt into LDFLAGS")
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/pty/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/pty/Makefile b/testcases/kernel/pty/Makefile
index ca2ba5507..4469775aa 100644
--- a/testcases/kernel/pty/Makefile
+++ b/testcases/kernel/pty/Makefile
@@ -25,6 +25,6 @@ top_srcdir		?= ../../..
 include $(top_srcdir)/include/mk/testcases.mk
 
 pty03: CFLAGS += -pthread
-pty03: LDFLAGS += -lrt
+pty03: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
