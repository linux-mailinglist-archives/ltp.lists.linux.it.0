Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D62B4472
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 14:11:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4B193C5DA4
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 14:11:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 958B63C4F46
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 14:11:55 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4DB33600827
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 14:11:55 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id AD0679F928;
 Mon, 16 Nov 2020 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605532313; bh=LtmZwIvGcaD603OWs2QVdin+pVp0kjBaCF/XhLeYbxA=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=g1tqo+8kg2oBZER7+4VmIPouwuAdUjwXRd6k8yT7zlA2j4oSG238SS4e7jR2CgntO
 SnaitRRVeY0BMu4qZq0jVTecj0kNRt/q862dAUvPnl956HgHgHswJHCIrW0XLSRbVV
 ZMXwx1IUf0j8YH0fwl1L4SeBdTq8113E7wK4decc=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Mon, 16 Nov 2020 14:11:48 +0100
Message-Id: <20201116131148.19243-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] pipe13: Increase time to wait for child processes to
 terminate
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

If the system is not fast enough, to clean up
the child processes, the test shows a false negative result.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/kernel/syscalls/pipe/pipe13.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/pipe/pipe13.c b/testcases/kernel/syscalls/pipe/pipe13.c
index 4e6777e63..5d76e1f00 100644
--- a/testcases/kernel/syscalls/pipe/pipe13.c
+++ b/testcases/kernel/syscalls/pipe/pipe13.c
@@ -60,7 +60,7 @@ static void verify_pipe(unsigned int n)
 	SAFE_CLOSE(fds[0]);
 	SAFE_CLOSE(fds[1]);
 
-	while (cnt < child_num && sleep_us < 100000) {
+	while (cnt < child_num && sleep_us < 1000000) {
 		ret = waitpid(-1, NULL, WNOHANG);
 		if (ret < 0)
 			tst_brk(TBROK | TERRNO, "waitpid()");
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
