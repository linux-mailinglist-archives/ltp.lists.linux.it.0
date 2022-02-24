Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7B94C2FC0
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Feb 2022 16:34:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A54223CA07F
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Feb 2022 16:34:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE2FA3C9B4E
 for <ltp@lists.linux.it>; Thu, 24 Feb 2022 16:34:05 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9736260063E
 for <ltp@lists.linux.it>; Thu, 24 Feb 2022 16:34:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AEB1A212C1
 for <ltp@lists.linux.it>; Thu, 24 Feb 2022 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645716843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UeaDkLrT+Oih5Da3hzly50VYGtaoGjzcktLMgK2Mihc=;
 b=JE9w6f2hLQ3tQ/m2fyEDha/qiuyFJuUxpzD4dfzxWxzsdbSW7cBYGRgb76OeofalIzvWz2
 FTq4STdocra51fKheoFfmWbObZm5aDuFAGybDF8EMVN84B/NeAQf/JddL6nWg406c/sM5n
 ZkJ7zzCRQWq9fxybI7fdn1WcH8DER7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645716843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UeaDkLrT+Oih5Da3hzly50VYGtaoGjzcktLMgK2Mihc=;
 b=zBDKDaXqd41a1U6VZr3MVT9rgvkormPuHKtF0XpqFOeGabrIl4kXMnFfejNlaCJ36UqBve
 QUERPcZcSNgsaOCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9602513AFF
 for <ltp@lists.linux.it>; Thu, 24 Feb 2022 15:34:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xaIAI2ulF2KxYQAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 24 Feb 2022 15:34:03 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 24 Feb 2022 16:34:02 +0100
Message-Id: <20220224153402.1778-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] Fix setsockopt(PACKET_RX_RING) usage on PPC64
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

struct tpacket_req3.tp_block_size value must be a multiple of page size.
Replace constants with values calculated from actual page size to fix
setsockopt() tests on PPC64 which has 64KB pages instead of 4KB.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/setsockopt/setsockopt06.c | 6 ++++--
 testcases/kernel/syscalls/setsockopt/setsockopt07.c | 6 ++++--
 testcases/kernel/syscalls/setsockopt/setsockopt09.c | 4 +++-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt06.c b/testcases/kernel/syscalls/setsockopt/setsockopt06.c
index 12a80dee4..644e61f3f 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt06.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt06.c
@@ -28,6 +28,7 @@
 #include "lapi/if_ether.h"
 
 static int sock = -1;
+static unsigned int pagesize;
 static struct tst_fzsync_pair fzsync_pair;
 
 static void setup(void)
@@ -35,6 +36,7 @@ static void setup(void)
 	int real_uid = getuid();
 	int real_gid = getgid();
 
+	pagesize = SAFE_SYSCONF(_SC_PAGESIZE);
 	SAFE_TRY_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
 
 	SAFE_UNSHARE(CLONE_NEWUSER);
@@ -52,9 +54,9 @@ static void *thread_run(void *arg)
 {
 	int ret;
 	struct tpacket_req3 req = {
-		.tp_block_size = 4096,
+		.tp_block_size = pagesize,
 		.tp_block_nr = 1,
-		.tp_frame_size = 4096,
+		.tp_frame_size = pagesize,
 		.tp_frame_nr = 1,
 		.tp_retire_blk_tov = 100
 	};
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt07.c b/testcases/kernel/syscalls/setsockopt/setsockopt07.c
index d2c568e3e..d22f9918b 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt07.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt07.c
@@ -31,6 +31,7 @@
 #include "lapi/if_ether.h"
 
 static int sock = -1;
+static unsigned int pagesize;
 static struct tst_fzsync_pair fzsync_pair;
 
 static void setup(void)
@@ -38,6 +39,7 @@ static void setup(void)
 	int real_uid = getuid();
 	int real_gid = getgid();
 
+	pagesize = SAFE_SYSCONF(_SC_PAGESIZE);
 	SAFE_TRY_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
 
 	SAFE_UNSHARE(CLONE_NEWUSER);
@@ -73,9 +75,9 @@ static void run(void)
 	unsigned int val, version = TPACKET_V3;
 	socklen_t vsize = sizeof(val);
 	struct tpacket_req3 req = {
-		.tp_block_size = 4096,
+		.tp_block_size = pagesize,
 		.tp_block_nr = 1,
-		.tp_frame_size = 4096,
+		.tp_frame_size = pagesize,
 		.tp_frame_nr = 1,
 		.tp_retire_blk_tov = 100
 	};
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt09.c b/testcases/kernel/syscalls/setsockopt/setsockopt09.c
index baaefda15..2fc66ebbc 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt09.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt09.c
@@ -31,12 +31,14 @@
 #include "lapi/if_packet.h"
 
 static int sock = -1;
+static unsigned int pagesize;
 
 static void setup(void)
 {
 	int real_uid = getuid();
 	int real_gid = getgid();
 
+	pagesize = SAFE_SYSCONF(_SC_PAGESIZE);
 	SAFE_TRY_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
 
 	SAFE_UNSHARE(CLONE_NEWUSER);
@@ -50,7 +52,7 @@ static void run(void)
 {
 	unsigned int version = TPACKET_V3;
 	struct tpacket_req3 req = {
-		.tp_block_size = 16384,
+		.tp_block_size = 4 * pagesize,
 		.tp_block_nr = 256,
 		.tp_frame_size = TPACKET_ALIGNMENT << 7,
 		.tp_retire_blk_tov = 64,
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
