Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B96581F87
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jul 2022 07:34:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFA113C527F
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jul 2022 07:34:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 202153C04D1
 for <ltp@lists.linux.it>; Wed, 27 Jul 2022 07:34:09 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9BA50601256
 for <ltp@lists.linux.it>; Wed, 27 Jul 2022 07:34:09 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [91.26.40.236])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 9FD48A346B;
 Wed, 27 Jul 2022 05:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1658900049; bh=6RjkiwowBRIgS2Jns/m2YVgpAlm0ulI0s7+kyB3eZt8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=es55rOPIYQKATGc8+nis2CFlx7PxvQS0sI3KameUE2wduqfJ7gUWjxNqttbz3uCam
 /VxjWNRA54dX9QB7OTHwcb90PwSVaZPJoDnNsAnxxo4otJlfnuVsfttXh9/FYbEZ84
 mjq8wELlvY9R7dZ/RqnxlEDGqfuzSbLTc7aAKE7E=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	chrubis@suse.cz,
	rpalethorpe@suse.de
Date: Wed, 27 Jul 2022 07:33:05 +0200
Message-Id: <20220727053307.3009235-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727053307.3009235-1-lkml@jv-coder.de>
References: <20220727053307.3009235-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 1/3] openposix: Fix existence test for local
 flag-files
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
Cc: Joerg Vehlow <joerg.vehlow@aox.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox.de>

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
---
 testcases/open_posix_testsuite/scripts/generate-makefiles.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/open_posix_testsuite/scripts/generate-makefiles.sh b/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
index 5cfb8e38c..3234aa454 100755
--- a/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
+++ b/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
@@ -136,7 +136,7 @@ EOF
 EOF
 
 		for var in CFLAGS LDFLAGS LDLIBS; do
-			if [ -f "${TOP_SRCDIR}/$var" ]; then
+			if [ -f "${prereq_cache_dir}/$var" ]; then
 				cat >> "$makefile.1" <<EOF
 ${var}+=		`cat "${prereq_cache_dir}/${var}" 2>/dev/null`
 EOF
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
