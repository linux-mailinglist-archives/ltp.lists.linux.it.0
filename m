Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B06D3805A3
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 10:56:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 417043C3326
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 10:56:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DFE273C1997
 for <ltp@lists.linux.it>; Fri, 14 May 2021 10:56:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 89861201037
 for <ltp@lists.linux.it>; Fri, 14 May 2021 10:56:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFCDCACAD;
 Fri, 14 May 2021 08:56:38 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 14 May 2021 10:56:33 +0200
Message-Id: <20210514085633.1319-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/1] lapi: Add missing IFA_FLAGS
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

From: Petr Vorel <petr.vorel@gmail.com>

and use them in tst_netdevice.c. This fixes on older toolchains
(e.g. sourcery-arm from Buildroot):

tst_netdevice.c: In function 'modify_address':
tst_netdevice.c:218:44: error: 'IFA_FLAGS' undeclared (first use in this function)
  if (!tst_rtnl_add_attr(file, lineno, ctx, IFA_FLAGS, &addr_flags,

Fixes: bc2151a65 ("lib: Add helper functions for managing network interfaces")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2->v3:
* drop autotools check (Cyril)

Kind regards,
Petr

 include/lapi/rtnetlink.h | 13 +++++++++++++
 lib/tst_netdevice.c      |  3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 include/lapi/rtnetlink.h

diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
new file mode 100644
index 000000000..8a1b5385b
--- /dev/null
+++ b/include/lapi/rtnetlink.h
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com> */
+
+#ifndef LAPI_IF_ADDR_H__
+# define LAPI_IF_ADDR_H__
+
+#include <linux/rtnetlink.h>
+
+#ifndef IFA_FLAGS
+# define IFA_FLAGS 8
+#endif
+
+#endif	/* LAPI_IF_ADDR_H__ */
diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
index 5ca523759..d098173d5 100644
--- a/lib/tst_netdevice.c
+++ b/lib/tst_netdevice.c
@@ -5,10 +5,11 @@
 
 #include <asm/types.h>
 #include <linux/netlink.h>
-#include <linux/rtnetlink.h>
 #include <linux/veth.h>
 #include <sys/socket.h>
 #include <net/if.h>
+#include "lapi/rtnetlink.h"
+
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
 #include "tst_rtnetlink.h"
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
