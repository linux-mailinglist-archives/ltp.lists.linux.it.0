Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FEBCF84E5
	for <lists+linux-ltp@lfdr.de>; Tue, 06 Jan 2026 13:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1767702305; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : content-type : content-transfer-encoding : sender :
 from; bh=7hIvMJ8zyHo4GMQLooNqrQ/Qs/2HOcAkt8SB9PUjeKA=;
 b=N9wvemqWadLvacUOjkHYINQ7E6XP43i9lRQ2AVh3n/PMli1UUfIgbHzCrNuKhFCbRQ6/D
 8QEM2+Uzv+2mXo6aO/YlE/oFGDiK/AS3dte5rAeo3oOnBUc5P9I2gk4NFUXc2ca3D1ab4rD
 gYaviijEEqWDF1ohECZYnm/l1YZGoY4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A72E3C22B3
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jan 2026 13:25:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A4B93C0224
 for <ltp@lists.linux.it>; Tue,  6 Jan 2026 12:41:46 +0100 (CET)
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com
 [113.46.200.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7D7CD60062F
 for <ltp@lists.linux.it>; Tue,  6 Jan 2026 12:41:45 +0100 (CET)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=Eeg9Z9CD19NtRw/JvcgQt2Vu9xv0zj7cnGLti9huQJc=;
 b=ODiQyCd6/b4mRe3QdUybjPLSLrI/G9nXy76MRTxboT4rSzv1aPOmQLGclaI8Cr4ROD39svLIE
 HRawfKSo6E052NLo/0ExzFlk9cBzTFD+thv1Re60vcWDsF0fE600fyhfsg0KDM/oLZ/J7o3Ld0O
 0F2lQrCsQdGo0nD1ssrzV14=
Received: from mail.maildlp.com (unknown [172.19.163.15])
 by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dlq1G5Mxcz1K98y
 for <ltp@lists.linux.it>; Tue,  6 Jan 2026 19:38:26 +0800 (CST)
Received: from dggpemf500015.china.huawei.com (unknown [7.185.36.143])
 by mail.maildlp.com (Postfix) with ESMTPS id 8E72A40539
 for <ltp@lists.linux.it>; Tue,  6 Jan 2026 19:41:39 +0800 (CST)
Received: from huawei.com (10.50.85.128) by dggpemf500015.china.huawei.com
 (7.185.36.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 6 Jan
 2026 19:41:39 +0800
To: <ltp@lists.linux.it>
Date: Tue, 6 Jan 2026 20:05:45 +0800
Message-ID: <20260106120545.3142001-1-liujian56@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.50.85.128]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500015.china.huawei.com (7.185.36.143)
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Tue, 06 Jan 2026 13:25:03 +0100
Subject: [LTP] [PATCH] rpc: create valid fd to pass libtirpc validation
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
From: Liu Jian via ltp <ltp@lists.linux.it>
Reply-To: Liu Jian <liujian56@huawei.com>
Cc: liujian56@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The testcase(rpc_svc_destroy, rpc_svcfd_create, rpc_xprt_register,
rpc_xprt_unregister) was failing due to an invalid fd, which
caused libtirpc's internal validation to reject the operation.
This change ensures a valid socket fd is created and can pass the
validation checks in libtirpc.

Signed-off-by: Liu Jian <liujian56@huawei.com>
---
 .../rpc_svc_destroy.c                         | 26 +++++++++++++++++++
 .../rpc_svcfd_create.c                        | 25 ++++++++++++++++++
 .../rpc_xprt_register.c                       | 24 +++++++++++++++++
 .../rpc_xprt_unregister.c                     | 24 +++++++++++++++++
 4 files changed, 99 insertions(+)

diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c
index 22e560843..8d86276c8 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c
@@ -30,6 +30,11 @@
 #include <time.h>
 #include <rpc/rpc.h>
 
+#include <unistd.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <arpa/inet.h>
+
 //Standard define
 #define PROCNUM 1
 #define VERSNUM 1
@@ -43,6 +48,27 @@ int main(void)
 	int test_status = 1;	//Default test result set to FAILED
 	int fd = 0;
 	SVCXPRT *svcr = NULL;
+	struct sockaddr_in server_addr;
+
+	fd = socket(AF_INET, SOCK_DGRAM, 0);
+	if (fd < 0) {
+		printf("socket creation failed");
+		return test_status;
+	}
+
+	memset(&server_addr, 0, sizeof(server_addr));
+	server_addr.sin_family = AF_INET;
+	server_addr.sin_port = htons(9001);
+	if (inet_pton(AF_INET, "127.0.0.1", &server_addr.sin_addr) <= 0) {
+		printf("inet_pton failed");
+		close(fd);
+		return test_status;
+	}
+	if (connect(fd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
+		printf("connect failed");
+		close(fd);
+		return test_status;
+	}
 
 	//First of all, create a server
 	svcr = svcfd_create(fd, 0, 0);
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcfd_create/rpc_svcfd_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcfd_create/rpc_svcfd_create.c
index f0d89ba48..d409ed536 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcfd_create/rpc_svcfd_create.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcfd_create/rpc_svcfd_create.c
@@ -29,6 +29,10 @@
 #include <stdlib.h>
 #include <time.h>
 #include <rpc/rpc.h>
+#include <unistd.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <arpa/inet.h>
 
 //Standard define
 #define PROCNUM 1
@@ -43,6 +47,27 @@ int main(void)
 	int test_status = 1;	//Default test result set to FAILED
 	int fd = 0;
 	SVCXPRT *svcr = NULL;
+	struct sockaddr_in server_addr;
+
+	fd = socket(AF_INET, SOCK_DGRAM, 0);
+	if (fd < 0) {
+		printf("socket creation failed");
+		return test_status;
+	}
+
+	memset(&server_addr, 0, sizeof(server_addr));
+	server_addr.sin_family = AF_INET;
+	server_addr.sin_port = htons(9001);
+	if (inet_pton(AF_INET, "127.0.0.1", &server_addr.sin_addr) <= 0) {
+		printf("inet_pton failed");
+		close(fd);
+		return test_status;
+	}
+	if (connect(fd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
+		printf("connect failed");
+		close(fd);
+		return test_status;
+	}
 
 	//create a server
 	svcr = svcfd_create(fd, 0, 0);
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
index b10a1ce5e..10a78af34 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
@@ -31,6 +31,9 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
+#include <unistd.h>
+#include <netinet/in.h>
+#include <arpa/inet.h>
 
 //Standard define
 #define PROCNUM 1
@@ -45,6 +48,27 @@ int main(void)
 	int test_status = 1;	//Default test result set to FAILED
 	SVCXPRT *svcr = NULL;
 	int fd = 0;
+	struct sockaddr_in server_addr;
+
+	fd = socket(AF_INET, SOCK_DGRAM, 0);
+	if (fd < 0) {
+		printf("socket creation failed");
+		return test_status;
+	}
+
+	memset(&server_addr, 0, sizeof(server_addr));
+	server_addr.sin_family = AF_INET;
+	server_addr.sin_port = htons(9001);
+	if (inet_pton(AF_INET, "127.0.0.1", &server_addr.sin_addr) <= 0) {
+		printf("inet_pton failed");
+		close(fd);
+		return test_status;
+	}
+	if (connect(fd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
+		printf("connect failed");
+		close(fd);
+		return test_status;
+	}
 
 	//create a server
 	svcr = svcfd_create(fd, 1024, 1024);
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
index 3b6130eaa..8f3fa9b13 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
@@ -31,6 +31,9 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
+#include <unistd.h>
+#include <netinet/in.h>
+#include <arpa/inet.h>
 
 //Standard define
 #define PROCNUM 1
@@ -49,6 +52,27 @@ int main(int argn, char *argc[])
 	int test_status = 1;	//Default test result set to FAILED
 	SVCXPRT *svcr = NULL;
 	int fd = 0;
+	struct sockaddr_in server_addr;
+
+	fd = socket(AF_INET, SOCK_DGRAM, 0);
+	if (fd < 0) {
+		printf("socket creation failed");
+		return test_status;
+	}
+
+	memset(&server_addr, 0, sizeof(server_addr));
+	server_addr.sin_family = AF_INET;
+	server_addr.sin_port = htons(9001);
+	if (inet_pton(AF_INET, "127.0.0.1", &server_addr.sin_addr) <= 0) {
+		printf("inet_pton failed");
+		close(fd);
+		return test_status;
+	}
+	if (connect(fd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
+		printf("connect failed");
+		close(fd);
+		return test_status;
+	}
 
 	//create a server
 	svcr = svcfd_create(fd, 1024, 1024);
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
