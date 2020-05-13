Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9001D1264
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 14:13:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C30BE3C54E8
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 14:13:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 657133C2358
 for <ltp@lists.linux.it>; Wed, 13 May 2020 14:13:41 +0200 (CEST)
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [92.103.151.219])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D04391A013A5
 for <ltp@lists.linux.it>; Wed, 13 May 2020 14:13:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 79DD327E0928
 for <ltp@lists.linux.it>; Wed, 13 May 2020 14:13:39 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8sqqoMqu8_b3; Wed, 13 May 2020 14:13:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 27E2A27E0921;
 Wed, 13 May 2020 14:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 27E2A27E0921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1589372019;
 bh=Ujc7yvdZwYw8ScJYZIinVM7PNSZgSDdXy9fXIRXrFhc=;
 h=From:To:Date:Message-Id;
 b=fCQhS9+StRKJFIMzTgUpp26FWGBKKnfkGdrPfuWBf+w5c6VLI4IHUM/5u84QIeKga
 uEbUuPS5frC3Qq9p4O6SD2tc0vSpBMGZJCWZP6Gcnrael2Kmx1Y12BYPL7zH1rzs3n
 DUuBuY76TAB76V/tx1JzVej6nRrhgiWMvJ46ha+c=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ep2NyniuxhUk; Wed, 13 May 2020 14:13:39 +0200 (CEST)
Received: from ysionneau-G3-3590.home
 (agrenoble-551-1-245-78.w90-42.abo.wanadoo.fr [90.42.76.78])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id D2D1927E0840;
 Wed, 13 May 2020 14:13:38 +0200 (CEST)
To: ltp@lists.linux.it
Date: Wed, 13 May 2020 14:13:27 +0200
Message-Id: <20200513121327.16342-1-ysionneau@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] Fix issue when running fcntl31 and fcntl31_64 over
 SSH as session leader
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
From: Yann Sionneau via ltp <ltp@lists.linux.it>
Reply-To: Yann Sionneau <ysionneau@kalray.eu>
Cc: Yann Sionneau <ysionneau@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

If you run the test like this:
ssh localhost path/to/fcntl31

It will fail like this:
TBROK  :  fcntl31.c:121: setpgrp() failed: errno=EPERM(1): Operation not permitted

As man page for setpgrp says, it is indeed not permitted to change process group ID
when you are session leader (PID == SID).

Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---
 testcases/kernel/syscalls/fcntl/fcntl31.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/fcntl/fcntl31.c b/testcases/kernel/syscalls/fcntl/fcntl31.c
index 52b4932fa..fd284fd7e 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl31.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl31.c
@@ -116,9 +116,12 @@ static void setup(void)
 
 	pid = getpid();
 
-	ret = setpgrp();
-	if (ret < 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "setpgrp() failed");
+	/* Changing process group ID is forbidden when PID == SID i.e. we are session leader */
+	if (pid != getsid(0)) {
+		ret = setpgrp();
+		if (ret < 0)
+			tst_brkm(TBROK | TERRNO, cleanup, "setpgrp() failed");
+	}
 	pgrp_pid = getpgid(0);
 	if (pgrp_pid < 0)
 		tst_brkm(TBROK | TERRNO, cleanup, "getpgid() failed");
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
