Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1893A4448
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:44:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2D113C8EA1
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:44:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2504A3C6457
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:44:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2AFCE20097E
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:44:10 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5D1031FD6D
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623422650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=udz/FDpJjAehM2RrSZ5K8cABxg6CtdtUGILRrCFk3sc=;
 b=kRfDyIcNbx90CluylCwUALBDieNMNxA8Q622UTETVPiqzmyZ+CXa1u+rdpQGxit1Xpbs68
 sVDpqut6Ux3fzBoVXMHtO1ECYXNI57JacPzQAkRyCH9HAePOcfcz2wQKjsIwlWxTIy4B4j
 q5SQp1KACM2jyRuNBWfHSNAnz0RTAHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623422650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=udz/FDpJjAehM2RrSZ5K8cABxg6CtdtUGILRrCFk3sc=;
 b=66dmAwiziNLrIYHjDiY3+VEbWRISNbQHcozxgBTGH6584L3Lk6nctHW6RXFkzaqcxYPLY+
 TbM0A7hjKy4ICGDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3B9B7118DD
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623422650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=udz/FDpJjAehM2RrSZ5K8cABxg6CtdtUGILRrCFk3sc=;
 b=kRfDyIcNbx90CluylCwUALBDieNMNxA8Q622UTETVPiqzmyZ+CXa1u+rdpQGxit1Xpbs68
 sVDpqut6Ux3fzBoVXMHtO1ECYXNI57JacPzQAkRyCH9HAePOcfcz2wQKjsIwlWxTIy4B4j
 q5SQp1KACM2jyRuNBWfHSNAnz0RTAHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623422650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=udz/FDpJjAehM2RrSZ5K8cABxg6CtdtUGILRrCFk3sc=;
 b=66dmAwiziNLrIYHjDiY3+VEbWRISNbQHcozxgBTGH6584L3Lk6nctHW6RXFkzaqcxYPLY+
 TbM0A7hjKy4ICGDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id IMJgDLp2w2ChfwAALh3uQQ (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 14:44:10 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Jun 2021 16:18:24 +0200
Message-Id: <20210611141824.9625-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] ipc/msgctl04: Make use of TST_EXP_FAIL()
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

In order to simplify the code a bit.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../kernel/syscalls/ipc/msgctl/msgctl04.c     | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgctl/msgctl04.c b/testcases/kernel/syscalls/ipc/msgctl/msgctl04.c
index b52ec5636..4b62896fb 100644
--- a/testcases/kernel/syscalls/ipc/msgctl/msgctl04.c
+++ b/testcases/kernel/syscalls/ipc/msgctl/msgctl04.c
@@ -76,21 +76,10 @@ static void verify_msgctl(unsigned int i)
 		return;
 	}
 
-	TEST(tv->msgctl(*(tc[i].msg_id), tc[i].cmd, tc[i].buf));
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "msgctl() returned %li", TST_RET);
-		return;
-	}
-
-	if (TST_ERR == tc[i].error) {
-		tst_res(TPASS | TTERRNO, "msgctl(%i, %i, %p)",
-			*tc[i].msg_id, tc[i].cmd, tc[i].buf);
-		return;
-	}
-
-	tst_res(TFAIL | TTERRNO, "msgctl(%i, %i, %p) expected %s",
-		*tc[i].msg_id, tc[i].cmd, tc[i].buf, tst_strerrno(tc[i].error));
+	TST_EXP_FAIL(tv->msgctl(*(tc[i].msg_id), tc[i].cmd, tc[i].buf),
+	             tc[i].error,
+	             "msgctl(%i, %i, %p)",
+	             *(tc[i].msg_id), tc[i].cmd, tc[i].buf);
 }
 
 static void setup(void)
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
