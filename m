Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0303DE888
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:38:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91E4B3C8133
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:38:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5F0993C2C99
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 10:38:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BC8F2600A18
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 10:38:50 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 220C5200A8;
 Tue,  3 Aug 2021 08:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1627979930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpHoj27PiEO2aogoF2S+s/cXFrq+cU22lxGCmwgBeYk=;
 b=SCkUBiPFJFIgfO/q0Z4J8VeEImoYh/1cVlmt3tlNqWRdUXMJ5F/wT69FjJypaE+yPLLIo5
 YkpkLk3+9ZD+Kz+Fjv4fbzJpZBAhuhGwpVp692O/36v0rpy87GlFBE7TL866RedT/uvgEO
 U7p7sWOGOd07Fm7+UiQmQirP4EkTxOQ=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id E13EEA3BCD;
 Tue,  3 Aug 2021 08:38:49 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  3 Aug 2021 09:38:35 +0100
Message-Id: <20210803083836.8612-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210803070520.30885-1-rpalethorpe@suse.com>
References: <20210803070520.30885-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] Add lapi/ip_tables.h and use it in setsockopt03
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

Oops forgot to add the file below.

V2:
* Add ip_tables.h compatability header

 include/lapi/ip_tables.h                      | 46 +++++++++++++++++++
 .../kernel/syscalls/setsockopt/setsockopt03.c | 39 +---------------
 2 files changed, 48 insertions(+), 37 deletions(-)
 create mode 100644 include/lapi/ip_tables.h

diff --git a/include/lapi/ip_tables.h b/include/lapi/ip_tables.h
new file mode 100644
index 000000000..e91238ffd
--- /dev/null
+++ b/include/lapi/ip_tables.h
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#ifndef LAPI_IP_TABLES__
+#define LAPI_IP_TABLES__
+
+#include "config.h"
+
+#include <linux/netfilter_ipv4/ip_tables.h>
+
+#ifndef HAVE_STRUCT_XT_ENTRY_MATCH
+struct xt_entry_match {
+	union {
+		struct {
+			uint16_t match_size;
+			char name[29];
+			uint8_t revision;
+		} user;
+		struct {
+			uint16_t match_size;
+			void *match;
+		} kernel;
+		uint16_t match_size;
+	} u;
+	unsigned char data[0];
+};
+#endif
+
+#ifndef HAVE_STRUCT_XT_ENTRY_TARGET
+struct xt_entry_target {
+	union {
+		struct {
+			uint16_t target_size;
+			char name[29];
+			uint8_t revision;
+		} user;
+		struct {
+			uint16_t target_size;
+			void *target;
+		} kernel;
+		uint16_t target_size;
+	} u;
+	unsigned char data[0];
+};
+#endif
+
+#endif
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt03.c b/testcases/kernel/syscalls/setsockopt/setsockopt03.c
index 3d49628d6..1434475db 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt03.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt03.c
@@ -21,12 +21,13 @@
 #include <netinet/in.h>
 #include <net/if.h>
 #include <limits.h>
-#include <linux/netfilter_ipv4/ip_tables.h>
 
 #include "tst_test.h"
 #include "tst_safe_net.h"
 #include "tst_kernel.h"
 
+#include "lapi/ip_tables.h"
+
 #define TOO_SMALL_OFFSET 74
 #define OFFSET_OVERWRITE 0xFFFF
 #define NEXT_OFFSET (sizeof(struct ipt_entry)		\
@@ -34,42 +35,6 @@
 		     + sizeof(struct xt_entry_target))
 #define PADDING (OFFSET_OVERWRITE - NEXT_OFFSET)
 
-#ifndef HAVE_STRUCT_XT_ENTRY_MATCH
-struct xt_entry_match {
-	union {
-		struct {
-			uint16_t match_size;
-			char name[29];
-			uint8_t revision;
-		} user;
-		struct {
-			uint16_t match_size;
-			void *match;
-		} kernel;
-		uint16_t match_size;
-	} u;
-	unsigned char data[0];
-};
-#endif
-
-#ifndef HAVE_STRUCT_XT_ENTRY_TARGET
-struct xt_entry_target {
-	union {
-		struct {
-			uint16_t target_size;
-			char name[29];
-			uint8_t revision;
-		} user;
-		struct {
-			uint16_t target_size;
-			void *target;
-		} kernel;
-		uint16_t target_size;
-	} u;
-	unsigned char data[0];
-};
-#endif
-
 struct payload {
 	struct ipt_replace repl;
 	struct ipt_entry ent;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
