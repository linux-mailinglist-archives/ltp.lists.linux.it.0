Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B201563CD47
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 03:22:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3AF593CCA0A
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 03:22:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB1783C85AE
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 03:22:13 +0100 (CET)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 171741000947
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 03:22:11 +0100 (CET)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NMNHX3mRfz15N2l
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 10:21:28 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 30 Nov 2022 10:22:07 +0800
To: <ltp@lists.linux.it>
Date: Wed, 30 Nov 2022 10:19:00 +0800
Message-ID: <20221130021901.33143-2-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221130021901.33143-1-zhaogongyi@huawei.com>
References: <20221130021901.33143-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib/safe_macros: Add SAFE_STRTOF
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
From: Zhao Gongyi via ltp <ltp@lists.linux.it>
Reply-To: Zhao Gongyi <zhaogongyi@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add a new macro SAFE_STRTOF, which is a safe mode of strtof().

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 include/safe_macros_fn.h  |  3 +++
 include/tst_safe_macros.h |  3 +++
 lib/safe_macros.c         | 26 ++++++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/include/safe_macros_fn.h b/include/safe_macros_fn.h
index 114d8fd43..546db4ad8 100644
--- a/include/safe_macros_fn.h
+++ b/include/safe_macros_fn.h
@@ -133,6 +133,9 @@ unsigned long safe_strtoul(const char *file, const int lineno,
                            void (cleanup_fn)(void),
                            char *str, unsigned long min, unsigned long max);

+float safe_strtof(const char *file, const int lineno,
+                 void (cleanup_fn)(void), char *str);
+
 long safe_sysconf(const char *file, const int lineno,
 		  void (cleanup_fn)(void), int name);

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index ab00dd14a..9ff98e7db 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -186,6 +186,9 @@ int safe_getgroups(const char *file, const int lineno, int size, gid_t list[]);
 #define SAFE_STRTOUL(str, min, max) \
 	safe_strtoul(__FILE__, __LINE__, NULL, (str), (min), (max))

+#define SAFE_STRTOF(str) \
+	safe_strtof(__FILE__, __LINE__, NULL, (str))
+
 #define SAFE_SYSCONF(name) \
 	safe_sysconf(__FILE__, __LINE__, NULL, name)

diff --git a/lib/safe_macros.c b/lib/safe_macros.c
index d8816631f..954f1d40a 100644
--- a/lib/safe_macros.c
+++ b/lib/safe_macros.c
@@ -21,6 +21,7 @@
 #include <stdlib.h>
 #include <unistd.h>
 #include <malloc.h>
+#include <math.h>
 #include "test.h"
 #include "safe_macros.h"

@@ -629,6 +630,31 @@ unsigned long safe_strtoul(const char *file, const int lineno,
 	return rval;
 }

+float safe_strtof(const char *file, const int lineno,
+		  void (cleanup_fn) (void), char *str)
+{
+	float rval;
+	char *endptr;
+
+	errno = 0;
+	rval = strtof(str, &endptr);
+
+	if ((errno == ERANGE) || (rval == 0)
+	    || (rval == HUGE_VAL) || (rval == -HUGE_VAL)) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"strtof(%s) failed", str);
+		return rval;
+	}
+
+	if (endptr == str || (*endptr != '\0' && *endptr != '\n')) {
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"Invalid value: '%s'", str);
+		return 0;
+	}
+
+	return rval;
+}
+
 long safe_sysconf(const char *file, const int lineno,
 		  void (cleanup_fn) (void), int name)
 {
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
