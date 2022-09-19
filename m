Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E075BC393
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Sep 2022 09:41:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64A423CACA7
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Sep 2022 09:41:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B60203C1BC5
 for <ltp@lists.linux.it>; Mon, 19 Sep 2022 09:41:09 +0200 (CEST)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0F31510005F1
 for <ltp@lists.linux.it>; Mon, 19 Sep 2022 09:41:05 +0200 (CEST)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 28J7erk6090647;
 Mon, 19 Sep 2022 15:40:53 +0800 (+08)
 (envelope-from dylan@andestech.com)
Received: from atctrx.andestech.com (10.0.12.119) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 19 Sep 2022
 15:40:53 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <ltp@lists.linux.it>, <chrubis@suse.cz>
Date: Mon, 19 Sep 2022 15:39:15 +0800
Message-ID: <20220919073915.716432-1-dylan@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.12.119]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 28J7erk6090647
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3] kernel/uevent: Adjust the number of uevents
 dynamically in uevent02
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
Cc: alankao@andestech.com, minachou@andestech.com, dminus@andestech.com,
 x5710999x@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When CONFIG_SMP is not selected, CONFIG_RPS will not be enabled. Causes the
kernel to not create rx queues in sysfs[1] when creating tun devices.
Uevent02 will check if the rx queue exists, adjust the uevents dynamically
in setup() to pass this test.

[1]: https://github.com/torvalds/linux/blob/3245cb65fd91cd514801bf91f5a3066d562f0ac4/net/core/net-sysfs.c#L1109

Signed-off-by: Dylan Jhong <dylan@andestech.com>
---
 testcases/kernel/uevents/uevent02.c | 160 +++++++++++++++-------------
 1 file changed, 88 insertions(+), 72 deletions(-)

diff --git a/testcases/kernel/uevents/uevent02.c b/testcases/kernel/uevents/uevent02.c
index ce0cf757d..93336742e 100644
--- a/testcases/kernel/uevents/uevent02.c
+++ b/testcases/kernel/uevents/uevent02.c
@@ -18,11 +18,77 @@
 #include <linux/if.h>
 #include <linux/if_tun.h>
 
+#include "tst_kconfig.h"
 #include "tst_test.h"
 
 #include "uevent.h"
 
 #define TUN_PATH "/dev/net/tun"
+#define CONFIG_RPS "CONFIG_RPS"
+#define MAX_UEVENTS 7
+
+static struct uevent_desc add = {
+	.msg = "add@/devices/virtual/net/ltp-tun0",
+	.value_cnt = 4,
+	.values = (const char*[]) {
+		"ACTION=add",
+		"DEVPATH=/devices/virtual/net/ltp-tun0",
+		"SUBSYSTEM=net",
+		"INTERFACE=ltp-tun0",
+	}
+};
+
+static struct uevent_desc add_rx = {
+	.msg = "add@/devices/virtual/net/ltp-tun0/queues/rx-0",
+	.value_cnt = 3,
+	.values = (const char*[]) {
+		"ACTION=add",
+		"DEVPATH=/devices/virtual/net/ltp-tun0/queues/rx-0",
+		"SUBSYSTEM=queues",
+	}
+};
+
+static struct uevent_desc add_tx = {
+	.msg = "add@/devices/virtual/net/ltp-tun0/queues/tx-0",
+	.value_cnt = 3,
+	.values = (const char*[]) {
+		"ACTION=add",
+		"DEVPATH=/devices/virtual/net/ltp-tun0/queues/tx-0",
+		"SUBSYSTEM=queues",
+	}
+};
+
+static struct uevent_desc rem_rx = {
+	.msg = "remove@/devices/virtual/net/ltp-tun0/queues/rx-0",
+	.value_cnt = 3,
+	.values = (const char*[]) {
+		"ACTION=remove",
+		"DEVPATH=/devices/virtual/net/ltp-tun0/queues/rx-0",
+		"SUBSYSTEM=queues",
+	}
+};
+
+static struct uevent_desc rem_tx = {
+	.msg = "remove@/devices/virtual/net/ltp-tun0/queues/tx-0",
+	.value_cnt = 3,
+	.values = (const char*[]) {
+		"ACTION=remove",
+		"DEVPATH=/devices/virtual/net/ltp-tun0/queues/tx-0",
+		"SUBSYSTEM=queues",
+	}
+};
+
+static struct uevent_desc rem = {
+	.msg = "remove@/devices/virtual/net/ltp-tun0",
+	.value_cnt = 4,
+	.values = (const char*[]) {
+		"ACTION=remove",
+		"DEVPATH=/devices/virtual/net/ltp-tun0",
+		"SUBSYSTEM=net",
+		"INTERFACE=ltp-tun0",
+	}
+};
+const struct uevent_desc *uevents[MAX_UEVENTS];
 
 static void generate_tun_uevents(void)
 {
@@ -44,78 +110,6 @@ static void verify_uevent(void)
 {
 	int pid, fd;
 
-	struct uevent_desc add = {
-		.msg = "add@/devices/virtual/net/ltp-tun0",
-		.value_cnt = 4,
-		.values = (const char*[]) {
-			"ACTION=add",
-			"DEVPATH=/devices/virtual/net/ltp-tun0",
-			"SUBSYSTEM=net",
-			"INTERFACE=ltp-tun0",
-		}
-	};
-
-	struct uevent_desc add_rx = {
-		.msg = "add@/devices/virtual/net/ltp-tun0/queues/rx-0",
-		.value_cnt = 3,
-		.values = (const char*[]) {
-			"ACTION=add",
-			"DEVPATH=/devices/virtual/net/ltp-tun0/queues/rx-0",
-			"SUBSYSTEM=queues",
-		}
-	};
-
-	struct uevent_desc add_tx = {
-		.msg = "add@/devices/virtual/net/ltp-tun0/queues/tx-0",
-		.value_cnt = 3,
-		.values = (const char*[]) {
-			"ACTION=add",
-			"DEVPATH=/devices/virtual/net/ltp-tun0/queues/tx-0",
-			"SUBSYSTEM=queues",
-		}
-	};
-
-	struct uevent_desc rem_rx = {
-		.msg = "remove@/devices/virtual/net/ltp-tun0/queues/rx-0",
-		.value_cnt = 3,
-		.values = (const char*[]) {
-			"ACTION=remove",
-			"DEVPATH=/devices/virtual/net/ltp-tun0/queues/rx-0",
-			"SUBSYSTEM=queues",
-		}
-	};
-
-	struct uevent_desc rem_tx = {
-		.msg = "remove@/devices/virtual/net/ltp-tun0/queues/tx-0",
-		.value_cnt = 3,
-		.values = (const char*[]) {
-			"ACTION=remove",
-			"DEVPATH=/devices/virtual/net/ltp-tun0/queues/tx-0",
-			"SUBSYSTEM=queues",
-		}
-	};
-
-	struct uevent_desc rem = {
-		.msg = "remove@/devices/virtual/net/ltp-tun0",
-		.value_cnt = 4,
-		.values = (const char*[]) {
-			"ACTION=remove",
-			"DEVPATH=/devices/virtual/net/ltp-tun0",
-			"SUBSYSTEM=net",
-			"INTERFACE=ltp-tun0",
-		}
-	};
-
-	const struct uevent_desc *const uevents[] = {
-		&add,
-		&add_rx,
-		&add_tx,
-		&rem_rx,
-		&rem_tx,
-		&rem,
-		NULL
-	};
-
 	pid = SAFE_FORK();
 	if (!pid) {
 		fd = open_uevent_netlink();
@@ -131,7 +125,29 @@ static void verify_uevent(void)
 	wait_for_pid(pid);
 }
 
+static void setup(void)
+{
+	struct tst_kconfig_var kconfig = {
+		.id = CONFIG_RPS,
+		.id_len = sizeof(CONFIG_RPS) - 1,
+	};
+	int i = 0;
+
+	tst_kconfig_read(&kconfig, 1);
+
+	uevents[i++] = &add;
+	if (kconfig.choice == 'y')
+		uevents[i++] = &add_rx;
+	uevents[i++] = &add_tx;
+	if (kconfig.choice == 'y')
+		uevents[i++] = &rem_rx;
+	uevents[i++] = &rem_tx;
+	uevents[i++] = &rem;
+	uevents[i++] = NULL;
+}
+
 static struct tst_test test = {
+	.setup = setup,
 	.test_all = verify_uevent,
 	.forks_child = 1,
 	.needs_checkpoints = 1,
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
