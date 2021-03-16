Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA46033CE26
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 07:55:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 981463C2D7F
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 07:55:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A0ECD3C2D61
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 07:55:56 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 034BF1400F56
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 07:55:55 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.4.45])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 4DA7C9F713;
 Tue, 16 Mar 2021 06:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1615877754; bh=jp44ACfamV9m2dKoht+ll/ODvGOnleucWiqQbNdv02o=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=edMZEp4VCm67xlglS0xmLVfmgMzhcWcQXPiZAviELRzpk+9ggRvkO049S4M7fvKAX
 g6G7MqIAV+P6LmY4Fh8qeZox8sDF+Bb+ssY7eva2iml8QRAdDmy+uPG6u4M7etqqwq
 A5YORgd6H5Qu7HBfyjH0I2FvdjY73IFXovOgCA3Q=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Tue, 16 Mar 2021 07:55:42 +0100
Message-Id: <20210316065542.1221203-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] open_posix: Add all logfiles to gitignore
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

The logfiles are created, when the tests are compiled and
should not be committed.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/open_posix_testsuite/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/open_posix_testsuite/.gitignore b/testcases/open_posix_testsuite/.gitignore
index 7ddf3cd90..ad281df14 100644
--- a/testcases/open_posix_testsuite/.gitignore
+++ b/testcases/open_posix_testsuite/.gitignore
@@ -13,3 +13,5 @@
 
 /bin/t0
 run.sh
+
+logfile
\ No newline at end of file
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
