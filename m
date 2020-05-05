Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2A91C5AF5
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:23:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B9BB3C582D
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:23:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 434A33C57EE
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:23:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7A04260048E
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:23:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5A860AEC4
 for <ltp@lists.linux.it>; Tue,  5 May 2020 15:23:18 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  5 May 2020 17:23:13 +0200
Message-Id: <20200505152315.29216-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] Move if_packet.h compat macros to LAPI headers
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: New patch.

 include/lapi/if_ether.h                       | 19 ++++++++++
 include/lapi/if_packet.h                      | 32 ++++++++++++++++
 .../kernel/syscalls/setsockopt/setsockopt02.c | 37 +------------------
 3 files changed, 53 insertions(+), 35 deletions(-)
 create mode 100644 include/lapi/if_ether.h

diff --git a/include/lapi/if_ether.h b/include/lapi/if_ether.h
new file mode 100644
index 000000000..0e9a4fcc1
--- /dev/null
+++ b/include/lapi/if_ether.h
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
+ */
+
+#ifndef __LAPI_IF_ETHER_H__
+#define __LAPI_IF_ETHER_H__
+
+#include "config.h"
+
+#ifdef HAVE_LINUX_IF_ETHER_H
+# include <linux/if_ether.h>
+#endif
+
+#ifndef ETH_P_ALL
+# define ETH_P_ALL 0x0003
+#endif
+
+#endif /* __LAPI_IF_ETHER_H__ */
diff --git a/include/lapi/if_packet.h b/include/lapi/if_packet.h
index c077b564d..81110217d 100644
--- a/include/lapi/if_packet.h
+++ b/include/lapi/if_packet.h
@@ -7,6 +7,24 @@
 #ifndef __LAPI_IF_PACKET_H__
 #define __LAPI_IF_PACKET_H__
 
+#include "config.h"
+
+#ifdef HAVE_LINUX_IF_PACKET_H
+# include <linux/if_packet.h>
+#endif
+
+#ifndef PACKET_RX_RING
+# define PACKET_RX_RING 5
+#endif
+
+#ifndef PACKET_VERSION
+# define PACKET_VERSION 10
+#endif
+
+#ifndef PACKET_RESERVE
+# define PACKET_RESERVE 12
+#endif
+
 #ifndef PACKET_FANOUT
 #define PACKET_FANOUT	18
 #endif
@@ -15,4 +33,18 @@
 #define PACKET_FANOUT_ROLLOVER	3
 #endif
 
+#ifndef HAVE_STRUCT_TPACKET_REQ3
+# define TPACKET_V3 2
+
+struct tpacket_req3 {
+	unsigned int	tp_block_size;
+	unsigned int	tp_block_nr;
+	unsigned int	tp_frame_size;
+	unsigned int	tp_frame_nr;
+	unsigned int	tp_retire_blk_tov;
+	unsigned int	tp_sizeof_priv;
+	unsigned int	tp_feature_req_word;
+};
+#endif
+
 #endif /* __LAPI_IF_PACKET_H__ */
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt02.c b/testcases/kernel/syscalls/setsockopt/setsockopt02.c
index dc9db2d43..f0a2a5ecd 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt02.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt02.c
@@ -20,41 +20,8 @@
 #include <errno.h>
 #include "tst_test.h"
 #include "tst_safe_net.h"
-#include "config.h"
-
-#ifdef HAVE_LINUX_IF_PACKET_H
-# include <linux/if_packet.h>
-#endif
-
-#ifdef HAVE_LINUX_IF_ETHER_H
-# include <linux/if_ether.h>
-#endif
-
-#ifndef ETH_P_ALL
-# define ETH_P_ALL 0x0003
-#endif
-
-#ifndef PACKET_RX_RING
-# define PACKET_RX_RING 5
-#endif
-
-#ifndef PACKET_VERSION
-# define PACKET_VERSION 10
-#endif
-
-#ifndef HAVE_STRUCT_TPACKET_REQ3
-# define TPACKET_V3 2
-
-struct tpacket_req3 {
-	unsigned int	tp_block_size;
-	unsigned int	tp_block_nr;
-	unsigned int	tp_frame_size;
-	unsigned int	tp_frame_nr;
-	unsigned int	tp_retire_blk_tov;
-	unsigned int	tp_sizeof_priv;
-	unsigned int	tp_feature_req_word;
-};
-#endif
+#include "lapi/if_packet.h"
+#include "lapi/if_ether.h"
 
 static int sk;
 static long pgsz;
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
