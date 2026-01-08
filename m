Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC3AD02252
	for <lists+linux-ltp@lfdr.de>; Thu, 08 Jan 2026 11:36:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1767868609; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : content-type : content-transfer-encoding : sender :
 from; bh=r+KjvEwEouttY5446OIBRI4LxmLpx7VYSG4GCzf/6gQ=;
 b=CwJLkJSWTz2JDezAewiXC5mpem1t/xnr+PYk3LPYMN332eo8+9oUpj4hoa/L/eO/ympND
 qrXsXl2wPtxu+jgWUT25jY3c4V8vDHaqnBsy2HJ4jF6qDyQdRc775hsNDylONJTuPhYnG0Y
 ek9m9fM8Y4Fsi9WQme73Wb4eiGN0PFo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 526E23C5626
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jan 2026 11:36:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 50B9E3C2E57
 for <ltp@lists.linux.it>; Thu,  8 Jan 2026 11:36:37 +0100 (CET)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6DDD81400B73
 for <ltp@lists.linux.it>; Thu,  8 Jan 2026 11:36:35 +0100 (CET)
Received: from localhost.localdomain (2.general.phlin.uk.vpn [10.172.194.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id F347D40265; 
 Thu,  8 Jan 2026 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1767868595;
 bh=2EoTZ/gCmMUVH5/s13r7cmXEa8dXjGDJv8RYeky/aLE=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=csB8PWyhumruPHKFPeWtpCHkkDx6Judwj2GEb5jMBtd+Kgg4f4sYYfiEqfCUeN/Ky
 c3njhFJuitjO94PuRmRb4trinDSTmFavVZyxvQ/bUloYcoyFG5j2X+v7DFaclJ+fHL
 4vSlKTMKk33yqIt0Q4BOAQCshNb36DBou2R3IJ2aSPbh9c1oNu50MQu3MKNOzuhz2b
 6K5IkpToAUfsXRgumfNTgaCHMwmyuI1D3pj1IOlcE6SRsIRJAdd4KBoX6TfLmzDbNE
 h7xT/DGoZ4FmgVidwa6E2sWdsNa94hJUa3B7jt2dVCVnnhLP/DSFJmq8Nyxo3aSXu8
 7zDTxDo8Gw76dGwUcFk+0jkOY5NUJdIN2JaiIg0ZESg3xLjFOYqzI0ik8wvkombnbr
 c2tJCYyemC8LNsVoZ4kweJReXwUhc+RmWF1d3AmOkskrJEbZks8t5/tUgE6TmsIVQ3
 jgsThAFJ2+cgeVT8emmKBrIkAqno/f1i7uVjAZ4cEc5QpzasuEVEYHIrALkSQFHqLh
 kyUFL9db84amQdzya6lnbR5Fr076yck+kIwToeH4Vx/6ZDhzkuGuL5hpg6QuJOUCw6
 Y1sRigGPJu8/kG6oC9TOUXpvotr7XRxwhak3f5TAys9zFAR9EzWWjM72WXWbMVe/+l
 /BM3xiSkcWtVvmp0VbRJHUmw=
To: ltp@lists.linux.it
Date: Thu,  8 Jan 2026 18:36:06 +0800
Message-ID: <20260108103606.35227-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCHv2] listmount04.c: update struct mnt_id_req support to
 kernel >= 6.17.9
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
From: Po-Hsu Lin via ltp <ltp@lists.linux.it>
Reply-To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Cc: po-hsu.lin@canonical.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The kernel change 78f0e33cd6c93 ("fs/namespace: correctly handle errors
returned by grab_requested_mnt_ns") from 6.18 has been ported to upstream
6.17.9 [1][2].

Therefore change the expectation from >= 6.18 to >= 6.17.9 accodingly.

[1] https://lwn.net/Articles/1047684/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.17.9&id=8ff97ade

v2: add comments for this change into the code.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 .../kernel/syscalls/listmount/listmount04.c    | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/listmount/listmount04.c b/testcases/kernel/syscalls/listmount/listmount04.c
index 2b8b49101..59da46cfd 100644
--- a/testcases/kernel/syscalls/listmount/listmount04.c
+++ b/testcases/kernel/syscalls/listmount/listmount04.c
@@ -7,6 +7,10 @@
  * Verify that listmount() raises the correct errors according with
  * invalid data:
  *
+ * - EBADF: invalid mnt_ns_fd
+ * This check was introduced for kernel commit 78f0e33cd6c9 ("fs/namespace:
+ * correctly handle errors returned by grab_requested_mnt_ns") introduced
+ * in v6.18-rc7 and backported to v6.17.9.
  * - EFAULT: req or mnt_id are unaccessible memories
  * - EINVAL: invalid flags or mnt_id request
  * - ENOENT: non-existent mount point
@@ -20,8 +24,8 @@
 #include "lapi/syscalls.h"
 
 #define MNT_SIZE 32
-#define BEFORE_6_18 1
-#define AFTER_6_18 2
+#define BEFORE_6_17_9 1
+#define AFTER_6_17_9 2
 
 static mnt_id_req *request;
 static uint64_t mnt_ids[MNT_SIZE];
@@ -84,7 +88,7 @@ static struct tcase {
 		.nr_mnt_ids = MNT_SIZE,
 		.exp_errno = EINVAL,
 		.msg = "invalid mnt_id_req.spare",
-		.kver = BEFORE_6_18,
+		.kver = BEFORE_6_17_9,
 	},
 	{
 		.req_usage = 1,
@@ -95,7 +99,7 @@ static struct tcase {
 		.nr_mnt_ids = MNT_SIZE,
 		.exp_errno = EBADF,
 		.msg = "invalid mnt_id_req.mnt_ns_fd",
-		.kver = AFTER_6_18,
+		.kver = AFTER_6_17_9,
 	},
 	{
 		.req_usage = 1,
@@ -154,10 +158,10 @@ static void run(unsigned int n)
 
 static void setup(void)
 {
-	if (tst_kvercmp(6, 18, 0) >= 0)
-		kver = AFTER_6_18;
+	if (tst_kvercmp(6, 17, 9) >= 0)
+		kver = AFTER_6_17_9;
 	else
-		kver = BEFORE_6_18;
+		kver = BEFORE_6_17_9;
 }
 
 static struct tst_test test = {
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
