Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC8914BD33
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 16:47:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB67E3C246F
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 16:47:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0A4C03C245E
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 16:47:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 412181401A7B
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 16:47:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53202AC6E
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 15:47:00 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 28 Jan 2020 16:46:59 +0100
Message-Id: <20200128154659.32399-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] pty03: Add -lrt into LDFLAGS
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

Older distributions needs -lrt for clock_* functions.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/pty/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/pty/Makefile b/testcases/kernel/pty/Makefile
index 88101a6b8..8fed1b510 100644
--- a/testcases/kernel/pty/Makefile
+++ b/testcases/kernel/pty/Makefile
@@ -27,5 +27,6 @@ include $(top_srcdir)/include/mk/testcases.mk
 CPPFLAGS		+= -D_GNU_SOURCE
 
 pty03: CFLAGS += -pthread
+pty03: LDFLAGS += -lrt
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
