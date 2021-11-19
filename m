Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A7040456B1A
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 08:47:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B7403C8986
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 08:47:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C22143C89B4
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 08:46:17 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 66E821001127
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 08:46:17 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.195.115.12])
 by mail.jv-coder.de (Postfix) with ESMTPSA id A1AD09FE82;
 Fri, 19 Nov 2021 07:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1637307976; bh=8Z1qcAfGOzyI9lBIYRbkUsl1DEG9Sr7OBJMDniXZFeA=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=N9RvplYrCj314FWQ5woPoUkX3X++GPRBT0riqh8lIu6fcv3q1bwfcb5tZyP5BF6Aa
 IIuFXtM6jvKFrSyVxYzdIKvpUBmn+6A9uV/4AfiYCxp4LEl6ph3IfsOmrApb2wg5FQ
 YAiWJucpHElaFhc4/R59F29Y8UPD8vYIWYhwTfno=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Fri, 19 Nov 2021 08:45:58 +0100
Message-Id: <20211119074602.857595-9-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119074602.857595-1-lkml@jv-coder.de>
References: <20211119074602.857595-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 08/12] posix/asctime: Fix potentioal buffer overflow
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

The buffer used in the sprintf was too small and could overflow.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../open_posix_testsuite/conformance/interfaces/asctime/1-1.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/asctime/1-1.c b/testcases/open_posix_testsuite/conformance/interfaces/asctime/1-1.c
index bc3095081..8463d953d 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/asctime/1-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/asctime/1-1.c
@@ -28,7 +28,7 @@ int main(void)
 {
 	struct tm time_ptr;
 
-	char expected[26];
+	char expected[128];
 	char *real;
 
 	char wday_name[7][3] =
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
