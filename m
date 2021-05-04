Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5055F372B3A
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 15:42:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A1D33C5858
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 15:42:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B525A3C57E0
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:41:36 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9E3B61A00937
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:41:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620135695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uAERq38wyTg1GvK3ri30x1yoVPaz8GLaqai1XbAAUs4=;
 b=uLB/MI2HUfEoi2GAG8Wyo7LWR9uLwhx6BwBcGrQxyTudlHd+i6soJHrdjl6N9E589JDDN0
 mBVaudcicSdM7IkT5sYMW0iK03mr7I4L3hIDXpJoSGf5A3GSO7ruEbP1qPosoHu3FI3SZt
 q2UbOEUPXco5ufZzyLg0TY+bTwcKhKo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47611B2FF;
 Tue,  4 May 2021 13:41:35 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 14:40:55 +0100
Message-Id: <20210504134100.20666-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504134100.20666-1-rpalethorpe@suse.com>
References: <20210504134100.20666-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v6 2/7] API: Make tst_count_scanf_conversions public
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Useful in other parts of the library like tst_cgroup.c

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/safe_file_ops_fn.h | 10 ++++++++++
 lib/safe_file_ops.c        | 16 ++++------------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/include/safe_file_ops_fn.h b/include/safe_file_ops_fn.h
index ed7d978dd..6d680967b 100644
--- a/include/safe_file_ops_fn.h
+++ b/include/safe_file_ops_fn.h
@@ -23,6 +23,16 @@
 
 #include "lapi/utime.h"
 
+/*
+ * Count number of expected assigned conversions. Any conversion starts with '%'.
+ * The '%%' matches % and no assignment is done. The %*x matches as x would do but
+ * the assignment is suppressed.
+ *
+ * NOTE: This is not 100% correct for complex scanf strings, but will do for
+ *       all of our intended usage.
+ */
+int tst_count_scanf_conversions(const char *fmt);
+
 /*
  * All-in-one function to scanf value(s) from a file.
  */
diff --git a/lib/safe_file_ops.c b/lib/safe_file_ops.c
index 0ec2ff8fe..249a512a1 100644
--- a/lib/safe_file_ops.c
+++ b/lib/safe_file_ops.c
@@ -34,15 +34,7 @@
 #include "test.h"
 #include "safe_file_ops_fn.h"
 
-/*
- * Count number of expected assigned conversions. Any conversion starts with '%'.
- * The '%%' matches % and no assignment is done. The %*x matches as x would do but
- * the assignment is suppressed.
- *
- * NOTE: This is not 100% correct for complex scanf strings, but will do for
- *       all of our intended usage.
- */
-static int count_scanf_conversions(const char *fmt)
+int tst_count_scanf_conversions(const char *fmt)
 {
 	unsigned int cnt = 0;
 	int flag = 0;
@@ -89,7 +81,7 @@ int file_scanf(const char *file, const int lineno,
 		return 1;
 	}
 
-	exp_convs = count_scanf_conversions(fmt);
+	exp_convs = tst_count_scanf_conversions(fmt);
 
 	va_start(va, fmt);
 	ret = vfscanf(f, fmt, va);
@@ -141,7 +133,7 @@ void safe_file_scanf(const char *file, const int lineno,
 		return;
 	}
 
-	exp_convs = count_scanf_conversions(fmt);
+	exp_convs = tst_count_scanf_conversions(fmt);
 
 	va_start(va, fmt);
 	ret = vfscanf(f, fmt, va);
@@ -195,7 +187,7 @@ int file_lines_scanf(const char *file, const int lineno,
 		return 1;
 	}
 
-	arg_count = count_scanf_conversions(fmt);
+	arg_count = tst_count_scanf_conversions(fmt);
 
 	while (fgets(line, BUFSIZ, fp) != NULL) {
 		va_start(ap, fmt);
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
