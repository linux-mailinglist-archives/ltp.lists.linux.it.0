Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D7FFFA38
	for <lists+linux-ltp@lfdr.de>; Sun, 17 Nov 2019 15:27:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8B093C1C9A
	for <lists+linux-ltp@lfdr.de>; Sun, 17 Nov 2019 15:27:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8AD4E3C2015
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 15:26:56 +0100 (CET)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 025E82F68AC
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 15:26:56 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id b3so16402125wrs.13
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 06:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B0CUDMageiwevyN0IMxVxvmOndCFoPYdk57jOy6n/xU=;
 b=XiZTf0Fn9WzFTNrMIvrcQJV+5d8vQxjVOz1g+f3lOUkC7BZZ+zM7U+CFzopGEftZF0
 DxLb/3UGE4yUjliXgUiszES1pzsJzkCSgYcWZpGJkoZM1Wh6gs1y+n/8YOieVH63V1NL
 4oLnAY9dwMl1tQV2q+vD66ramoO5rx+hox+f3PfXY64C91kf7D3uhfBxMwOPQKEvokZE
 7JVGn8+rqdicdHbFrCF9yZqi4DnxqmGMRAvW2rDI8+qpoN0+7KDMObvH5H6UzByZoDID
 yS1yOcrqvBfjjsPVjW03JeY4RdKtbH2CnyNco3gh10e87N/ySkB386j8/Od6+uG9i9XT
 Hhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B0CUDMageiwevyN0IMxVxvmOndCFoPYdk57jOy6n/xU=;
 b=Cuq1GRiK4dNhoUZKyti/0O5SBqFes1/kQzmAOkOojDseoatdATdLgrgK4G1wj/nq6y
 vJ0r1qrgxrhebx/Px9EwBOPRKuxL8gmGMedbEYlame2bzSqA8q7FbPUMjq9q0kVk32fs
 aKGdoSHINzlk0OX7ONCKQn8D9zv+Skume3ezpEJJv4ezMUff76PEdMfXrEUJ8aGo13yL
 5ZTtv7yMPvauzwHsm24yRqJM6SqpZDIzUSMnC43E/YJsL1Ut35T3H2HsDi55+qx8N8b7
 s42XgyBthWJSo5/lpQWTHpGA32Eo6sr2RIS869G2yzrCCm14ZrQ4GIjb6WbREWSRmff5
 eo/Q==
X-Gm-Message-State: APjAAAVRaRg+dKTM3Yh2ay1X6ctZl/UEux6thGL3dvuvRpmIX9/EFe42
 zRgmdG3ycLWRPOZLhCH0A6FZaD7m
X-Google-Smtp-Source: APXvYqy2RXDTht7ONuCRnGj9yyYEuabMUH2No1X6cwTWuDWmyBdh4YORWHqYgsfR+qjGsqQ1lbHAXA==
X-Received: by 2002:adf:f709:: with SMTP id r9mr24048377wrp.8.1574000815144;
 Sun, 17 Nov 2019 06:26:55 -0800 (PST)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id o1sm19467892wrs.50.2019.11.17.06.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 06:26:54 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sun, 17 Nov 2019 15:26:43 +0100
Message-Id: <20191117142643.26210-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117142643.26210-1-petr.vorel@gmail.com>
References: <20191117142643.26210-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 2/2] rpc: Replace bcopy() with memcpy()
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

bcopy() is deprecated.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c  | 3 ++-
 .../rpc_clnttcp_create_limits.c                                | 3 ++-
 .../rpc_clnttcp_create_performance.c                           | 3 ++-
 .../rpc_clnttcp_create_stress.c                                | 3 ++-
 .../rpc_clntudp_bufcreate.c                                    | 1 +
 .../rpc_clntudp_bufcreate_limits.c                             | 1 +
 .../rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c  | 1 +
 .../rpc_clntudp_create_performance.c                           | 1 +
 .../rpc_clntudp_create_stress.c                                | 1 +
 9 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c
index e849468de..a83dd6005 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <time.h>
 #include <rpc/rpc.h>
 #include <sys/socket.h>
@@ -61,7 +62,7 @@ int main(int argn, char *argc[])
 		exit(-1);
 	}
 
-	bcopy(hp->h_addr, (caddr_t) & server_addr.sin_addr, hp->h_length);
+	memcpy((caddr_t) & server_addr.sin_addr, hp->h_addr, hp->h_length);
 	server_addr.sin_family = AF_INET;
 	server_addr.sin_port = 0;
 
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c
index 8c1800bc2..3bc2ae7df 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <time.h>
 #include <rpc/rpc.h>
 #include <sys/socket.h>
@@ -72,7 +73,7 @@ int main(int argn, char *argc[])
 		exit(-1);
 	}
 
-	bcopy(hp->h_addr, (caddr_t) & server_addr.sin_addr, hp->h_length);
+	memcpy((caddr_t) & server_addr.sin_addr, hp->h_addr, hp->h_length);
 	server_addr.sin_family = AF_INET;
 	server_addr.sin_port = 0;
 
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_performance.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_performance.c
index 0df43db53..f9dda4711 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_performance.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_performance.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <sys/time.h>
 #include <rpc/rpc.h>
 #include <netdb.h>
@@ -112,7 +113,7 @@ int main(int argn, char *argc[])
 		exit(5);
 	}
 
-	bcopy(hp->h_addr, (caddr_t) & server_addr.sin_addr, hp->h_length);
+	memcpy((caddr_t) & server_addr.sin_addr, hp->h_addr, hp->h_length);
 	server_addr.sin_family = AF_INET;
 	server_addr.sin_port = 0;
 
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c
index 384a00d99..51d641292 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <time.h>
 #include <rpc/rpc.h>
 #include <sys/socket.h>
@@ -65,7 +66,7 @@ int main(int argn, char *argc[])
 		exit(-1);
 	}
 
-	bcopy(hp->h_addr, (caddr_t) & server_addr.sin_addr, hp->h_length);
+	memcpy((caddr_t) & server_addr.sin_addr, hp->h_addr, hp->h_length);
 	server_addr.sin_family = AF_INET;
 	server_addr.sin_port = 0;
 
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c
index 285eb21b8..bbcecfecc 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <time.h>
 #include <rpc/rpc.h>
 #include <sys/socket.h>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c
index 1f2690ae4..a0182db87 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <time.h>
 #include <rpc/rpc.h>
 #include <sys/socket.h>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c
index faa8ef639..91f5b275d 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <time.h>
 #include <rpc/rpc.h>
 #include <sys/socket.h>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_performance.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_performance.c
index 2722730c3..a8df6050f 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_performance.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_performance.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <sys/time.h>
 #include <rpc/rpc.h>
 #include <netdb.h>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c
index 974f5fb76..1cbe1e8f8 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <time.h>
 #include <rpc/rpc.h>
 #include <sys/socket.h>
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
