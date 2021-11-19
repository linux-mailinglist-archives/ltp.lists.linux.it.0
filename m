Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F48456B19
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 08:47:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9A0E3C8A47
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 08:47:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4CB033C89B1
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 08:46:17 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E04501A0119D
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 08:46:16 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.195.115.12])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 47C1F9FE1A;
 Fri, 19 Nov 2021 07:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1637307976; bh=WfDQxebY2h5LCLWPZK3snL0UxSmBDwAbDJ/4glAmXMU=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=JbxDrVdM6QzWFwOKUVsY6CAku4V4AiYVrcfziu8IkdrK3wpUKZ8xGdLGihYV/ZPm1
 /1xDtUc6D+/5+zMulYyonX8/9OxdTSuPYiac0FcT9kf7cTe6uRwZCAiRra+3lW/QRR
 Qx4Xe9P1y+n4D/M6F7jMHq/jxf6OyjH158ItUGMA=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Fri, 19 Nov 2021 08:45:57 +0100
Message-Id: <20211119074602.857595-8-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119074602.857595-1-lkml@jv-coder.de>
References: <20211119074602.857595-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 07/12] posix/pthread_key_create/2-1: Remove invalid
 part of test
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

The first step accroding to the test description is: "Create a key", but the
code was "get the value for an unitialized key". This was undefined behavior.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../conformance/interfaces/pthread_key_create/2-1.c        | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/2-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/2-1.c
index f150f3443..51c89f376 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/2-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/2-1.c
@@ -28,13 +28,6 @@ int main(void)
 	pthread_key_t key;
 	void *rc;
 
-	/* Verify that the value associated with "key" in a new thread is NULL */
-	rc = pthread_getspecific(key);
-	if (rc != NULL) {
-		printf("Test FAILED\n");
-		return PTS_FAIL;
-	}
-
 	if (pthread_key_create(&key, NULL) != 0) {
 		printf("Error: pthread_key_create() failed\n");
 		return PTS_UNRESOLVED;
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
