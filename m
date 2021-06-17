Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F32393AAD07
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:08:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4E2B3C7883
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:08:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6903E3C88EE
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:08:19 +0200 (CEST)
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C40C81A01236
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:08:15 +0200 (CEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((LNX1044)) with ASMTP (SSL) id KDZ00109
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 15:08:09 +0800
Received: from localhost.localdomain (10.200.104.74) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server id
 15.1.2176.14; Thu, 17 Jun 2021 15:08:09 +0800
From: dongshijiang <dongshijiang@inspur.com>
To: <ltp@lists.linux.it>
Date: Thu, 17 Jun 2021 03:08:06 -0400
Message-ID: <20210617070806.174220-1-dongshijiang@inspur.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.200.104.74]
tUid: 20216171508097cb282a98dca52bdeaa5fc8160486f5c
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] fix rpc_suite/rpc:add check returned value
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
Cc: dongshijiang <dongshijiang@inspur.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

"Segmentation fault (core dumped)" due to the failure of svcfd_create during the rpc test, so you need to check the return value of the "svcfd_create" function

Signed-off-by: dongshijiang <dongshijiang@inspur.com>
---
 .../rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c      | 5 +++++
 .../rpc_createdestroy_svc_destroy/rpc_svc_destroy_stress.c   | 5 +++++
 .../rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c       | 5 +++++
 .../rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c   | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c
index 60b96cec3..3557c0068 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c
@@ -46,6 +46,11 @@ int main(void)
 
 	//First of all, create a server
 	svcr = svcfd_create(fd, 0, 0);
+
+	//check returned value
+	if ((SVCXPRT *) svcr == NULL) {
+		return test_status;
+	}
 
 	//Then call destroy macro
 	svc_destroy(svcr);
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy_stress.c
index ecd145393..5a4331f4d 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy_stress.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy_stress.c
@@ -55,6 +55,11 @@ int main(int argn, char *argc[])
 	//First of all, create a server
 	for (i = 0; i < nbCall; i++) {
 		svcr = svcfd_create(fd, 0, 0);
+
+		//check returned value
+		if ((SVCXPRT *) svcr == NULL)
+			continue;
+		svcr = NULL;
 
 		//Then call destroy macro
 		svc_destroy(svcr);
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
index da3b93022..de4df15f1 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
@@ -48,6 +48,11 @@ int main(void)
 
 	//create a server
 	svcr = svcfd_create(fd, 1024, 1024);
+
+	//check returned value
+	if ((SVCXPRT *) svcr == NULL) {
+		return test_status;
+	}
 
 	//call routine
 	xprt_register(svcr);
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
index d0b7a20d4..fbaec25ad 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
@@ -52,6 +52,11 @@ int main(int argn, char *argc[])
 
 	//create a server
 	svcr = svcfd_create(fd, 1024, 1024);
+
+	//check returned value
+	if ((SVCXPRT *) svcr == NULL) {
+		return test_status;
+	}
 
 	xprt_register(svcr);
 	//call routine
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
