Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97D38878F
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 08:31:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4E853C3019
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 08:31:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F1EFF3C1A9C
 for <ltp@lists.linux.it>; Wed, 19 May 2021 08:31:22 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3D2791401130
 for <ltp@lists.linux.it>; Wed, 19 May 2021 08:31:21 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 1C1F09F72D;
 Wed, 19 May 2021 06:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1621405880; bh=c7tbkLpgGLznCizQOrIpvzY0jnC3Ua5/s3NaDB8tZqo=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=cJ7egiPDvvvugYWVGQ5TjUigHsO1oV0L/q/TBc/NipEEf0k1kMRDiEYTfLVQgTU0k
 qALc/cEG6HBctDm2v+JYuLLfltdeAKQRkn2DQOttsXl29bxYiQ8n4WXWffHbVSqJ+S
 cRSGOz7Tp8gqjwmjnTgEaIs5ovrbjxsxrTiYx54k=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	liwang@redhat.com,
	chrubis@suse.cz,
	pvorel@suse.cz
Date: Wed, 19 May 2021 08:31:08 +0200
Message-Id: <20210519063109.224352-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] shell: Fix timeout process termination for zsh
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

NOTE: This fix should be part of the release,
because it fixes something broken in this release only!

On zsh an exit in the trap for SIGTERM is ignored,
but wait returns with TERM exit status (143).
This can only improve the situation for other processe,
e.g. if the wait is killed by the SIGTERM from the main process,
it will still terminate the timeout process now.

Fixes: a30410f6ad77 ("shell: Prevent orphan timeout sleep processes")

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/lib/tst_test.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 3a5651c01..1b25f4c44 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -472,6 +472,7 @@ _tst_timeout_process()
 	sleep_pid=$!
 	trap "kill $sleep_pid; exit" TERM
 	wait $sleep_pid
+	[ $? -eq 143 ] && exit
 	trap - TERM
 	_tst_kill_test
 }
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
