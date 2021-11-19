Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC8A456B11
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 08:46:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58FB73C89AE
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 08:46:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 916C83C891E
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 08:46:14 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 009E5601404
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 08:46:13 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.195.115.12])
 by mail.jv-coder.de (Postfix) with ESMTPSA id E9E8B9FD8F;
 Fri, 19 Nov 2021 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1637307973; bh=eyIp8tR1te44cf9Z1XM6ms51yrUt2ndYHZYmgPs7KSc=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=uumnPxK80wBf3kuBsjtM/q2dHpiHuJr1TKlFKIgc5wNeAUjw8+hou+rreVthxZI2a
 DyvFsBChfgk7bUG7BjMJEfXCKWS6TiKyFugLul7T6EsKyy54irn3VqOXbXfbSFjvZ9
 erUy5+SXz0PotvLIknHNFZRXRweXcO1QQeJumF9E=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Fri, 19 Nov 2021 08:45:51 +0100
Message-Id: <20211119074602.857595-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119074602.857595-1-lkml@jv-coder.de>
References: <20211119074602.857595-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 01/12] posix/pthread_create/15-1: Supress warning
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

generate-makefiles.sh gave the following warning:
conformance/interfaces/pthread_create/15-1.c should be test.

The script has a strange implementation, that just greps for "main" in the c file.
Based on that it decides if the file should be a test or a run-test.
Other tests in the suite including the main-function from testfrmw/threads_scenarii.c
also use a comment, that supresses the message

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../conformance/interfaces/pthread_create/15-1.c                 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/15-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/15-1.c
index e8c003fd4..a05db679b 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/15-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/15-1.c
@@ -76,6 +76,7 @@
 /***********************************    Test cases  *****************************************/
 /********************************************************************************************/
 
+/* main is defined in the next file */
 #define STD_MAIN
 #include "../testfrmw/threads_scenarii.c"
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
