Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 639771191A3
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 21:13:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2EDDE3C2274
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 21:13:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2E8B83C22CF
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 21:13:35 +0100 (CET)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B3261600BE9
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 21:13:34 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id z7so21455146wrl.13
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 12:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8vYsm1QdWIIo6SGLo/enNXLIaLYxT+YIuMsf3Qc6KL4=;
 b=qAqEf/84KigNn79/JGclVhwv0/+NNmfINoekmXUnHo3T0zRdMnpWTKl4vb2s1vvGDv
 MnHW841NnXwSTMhghYeIB4oY0wMk+IQSzbvAwLNKZoY5xFxaSjmpEs1y4sG9Hy2g+Lqj
 Xvq8DN8HzVrAi9PM1t7LdsgNTLzs0lD8YnrwpynLk+TmYyQ4lDmu3vihngitQYJ406kg
 em9fhHqh5aHo0Z6rVCLZOyr43AF7niTLAOAntkSglwJyRX/uy+OrRVyHv2hEaZxa6K8b
 pFMttA+jnkO3ctptix9Gd57vHT2ZvbSn+tzOxQczuYpp61jreNGsks7tyqhvwCTNjdfj
 NPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vYsm1QdWIIo6SGLo/enNXLIaLYxT+YIuMsf3Qc6KL4=;
 b=fgDn3FjUN6c9FFi/Jo6UcolIfNlW5D+xh6j0Z1H4EfDV8IqjJrhJhAfQlA/hOHmVqO
 OtkqFFQVJePV7pjPKUIuUDHOb/xM9caAsGqI9kYGGt1s1CL3EHhWSWIOhEHFeZRkKVaV
 Ik5aNoFuqAo2ZGcBVonSySSNW77ampq6uM9SKMnwJ2CuvKLhxJVl2dc+asz+tJ82bjhp
 GuJGKyUGeojoT4q1PrNYFDIHFvQhAG3hMEekZScI60OjIu35EwZk+WUKCqV85dBuIj9D
 wQoxmWiR/81+2PaWgvkUU2br6cFJKixGjknQcR8NeHdelZ5cVaKedFJd1y6xfYbCO/Pj
 PiYw==
X-Gm-Message-State: APjAAAUokfJ+3jTIMcjvHmpGjAMv2iyoBYM+pztutwHNLDK/sPwa4ZUk
 jFkyfYKgJMS2+9BxMJxSjh3HQqkq
X-Google-Smtp-Source: APXvYqxxfQtvItx9QhXYLZ0Wu9f/PqYOL1F8AsLY4lEnIhSOSJBtTr8I/anweDVEbEPKBnWVbQmi9g==
X-Received: by 2002:adf:f382:: with SMTP id m2mr5260111wro.163.1576008813728; 
 Tue, 10 Dec 2019 12:13:33 -0800 (PST)
Received: from x230.suse.de ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id z18sm4208205wmf.21.2019.12.10.12.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 12:13:33 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 10 Dec 2019 21:13:21 +0100
Message-Id: <20191210201321.1430984-4-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210201321.1430984-1-petr.vorel@gmail.com>
References: <20191210201321.1430984-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] rpc: Remove <sys/socketvar.h>
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

nonstandard <sys/socketvar.h> just includes <sys/socket.h>.

This fixes build on musl.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../rpc/rpc_createdestroy_svcraw_create/rpc_svcraw_create.c      | 1 -
 .../rpc/rpc_createdestroy_svctcp_create/rpc_svctcp_create.c      | 1 -
 .../rpc_createdestroy_svctcp_create/rpc_svctcp_create_stress.c   | 1 -
 .../rpc_createdestroy_svcudp_bufcreate/rpc_svcudp_bufcreate.c    | 1 -
 .../rpc/rpc_createdestroy_svcudp_create/rpc_svcudp_create.c      | 1 -
 .../rpc_createdestroy_svcudp_create/rpc_svcudp_create_stress.c   | 1 -
 .../rpc_suite/rpc/rpc_regunreg_registerrpc/rpc_registerrpc.c     | 1 -
 .../rpc_suite/rpc/rpc_regunreg_svc_register/rpc_svc_register.c   | 1 -
 .../rpc/rpc_regunreg_svc_unregister/rpc_svc_unregister.c         | 1 -
 .../rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c | 1 -
 .../rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c       | 1 -
 11 files changed, 11 deletions(-)

diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcraw_create/rpc_svcraw_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcraw_create/rpc_svcraw_create.c
index e195c0ea6..004d1fad1 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcraw_create/rpc_svcraw_create.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcraw_create/rpc_svcraw_create.c
@@ -31,7 +31,6 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/socketvar.h>
 
 //Standard define
 #define PROCNUM 1
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/rpc_svctcp_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/rpc_svctcp_create.c
index 38eeabbbb..3f1b90aaf 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/rpc_svctcp_create.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/rpc_svctcp_create.c
@@ -31,7 +31,6 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/socketvar.h>
 
 //Standard define
 #define PROCNUM 1
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/rpc_svctcp_create_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/rpc_svctcp_create_stress.c
index 241ffd736..d465f26f5 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/rpc_svctcp_create_stress.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/rpc_svctcp_create_stress.c
@@ -31,7 +31,6 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/socketvar.h>
 
 //Standard define
 #define PROCNUM 1
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_bufcreate/rpc_svcudp_bufcreate.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_bufcreate/rpc_svcudp_bufcreate.c
index 4e9955b7d..24f7142ca 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_bufcreate/rpc_svcudp_bufcreate.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_bufcreate/rpc_svcudp_bufcreate.c
@@ -31,7 +31,6 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/socketvar.h>
 
 //Standard define
 #define PROCNUM 1
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/rpc_svcudp_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/rpc_svcudp_create.c
index 97fb875f0..19c2ac11f 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/rpc_svcudp_create.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/rpc_svcudp_create.c
@@ -31,7 +31,6 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/socketvar.h>
 
 //Standard define
 #define PROCNUM 1
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/rpc_svcudp_create_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/rpc_svcudp_create_stress.c
index 3b6b64039..e9f55557f 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/rpc_svcudp_create_stress.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/rpc_svcudp_create_stress.c
@@ -31,7 +31,6 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/socketvar.h>
 
 //Standard define
 #define PROCNUM 1
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_registerrpc/rpc_registerrpc.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_registerrpc/rpc_registerrpc.c
index 974c348bb..3778f36bc 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_registerrpc/rpc_registerrpc.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_registerrpc/rpc_registerrpc.c
@@ -31,7 +31,6 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/socketvar.h>
 #include <utmp.h>
 
 //Standard define
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_register/rpc_svc_register.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_register/rpc_svc_register.c
index 63adef031..99129cf7d 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_register/rpc_svc_register.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_register/rpc_svc_register.c
@@ -31,7 +31,6 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/socketvar.h>
 
 //Standard define
 #define PROCNUM 1
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_unregister/rpc_svc_unregister.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_unregister/rpc_svc_unregister.c
index b52a33760..8f0b6de68 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_unregister/rpc_svc_unregister.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_unregister/rpc_svc_unregister.c
@@ -31,7 +31,6 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/socketvar.h>
 
 //Standard define
 #define PROCNUM 1
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
index ea347b444..da3b93022 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
@@ -31,7 +31,6 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/socketvar.h>
 
 //Standard define
 #define PROCNUM 1
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
index 1d7151ca5..d0b7a20d4 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
@@ -31,7 +31,6 @@
 #include <rpc/rpc.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/socketvar.h>
 
 //Standard define
 #define PROCNUM 1
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
