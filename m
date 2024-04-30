Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2244B8B69E8
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2024 07:29:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CE843C8B16
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2024 07:29:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C57EA3C8B61
 for <ltp@lists.linux.it>; Tue, 30 Apr 2024 07:28:54 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwang@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0CDBF600BCC
 for <ltp@lists.linux.it>; Tue, 30 Apr 2024 07:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714454932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IUiOe4ZPgmTmAA+pii3Qor7qpzu69eqcLaojjTuMJ7s=;
 b=AVdWerR9gPgwhd5cfPmsu9zA8LzRVbAgp7UsVAFfLcxrY8yDvasA1wJuEDqi1KfgYoVW3G
 dapbDEUyOudcsM9nUJ3vgRwKw7UG7nGBpDJsu41RWLf4VWirrmv2X7tNdkw7JKtAvERRls
 GpCpsykfnQLwFaF2cPUnJJfkNzqnTNU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-tNXHdxmvO0a3EN5BknvKEg-1; Tue, 30 Apr 2024 01:28:50 -0400
X-MC-Unique: tNXHdxmvO0a3EN5BknvKEg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF1EE101152C
 for <ltp@lists.linux.it>; Tue, 30 Apr 2024 05:28:49 +0000 (UTC)
Received: from liwang-workstation.lab.eng.nay.redhat.com (unknown
 [10.66.144.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFF4E400EAF
 for <ltp@lists.linux.it>; Tue, 30 Apr 2024 05:28:48 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 30 Apr 2024 13:28:44 +0800
Message-Id: <20240430052845.31039-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 1/2] lib: add SAFE_CALLOC macro
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

Signed-off-by: Li Wang <liwang@redhat.com>
---
 include/tst_safe_macros.h |  5 +++++
 lib/tst_safe_macros.c     | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 53aceb5ca..f228b99e1 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -75,6 +75,11 @@ int safe_dup2(const char *file, const int lineno, int oldfd, int newfd);
 #define SAFE_MALLOC(size) \
 	safe_malloc(__FILE__, __LINE__, NULL, (size))
 
+void *safe_calloc(const char *file, const int lineno, size_t nmemb, size_t size);
+
+#define SAFE_CALLOC(nmemb, size) \
+	safe_calloc(__FILE__, __LINE__, (nmemb), (size))
+
 void *safe_realloc(const char *file, const int lineno, void *ptr, size_t size);
 
 #define SAFE_REALLOC(ptr, size) \
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index c6e6b15dc..40fdaca76 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -9,6 +9,7 @@
 #include <stdlib.h>
 #include <errno.h>
 #include <sched.h>
+#include <malloc.h>
 #include <sys/ptrace.h>
 #include "config.h"
 #ifdef HAVE_SYS_FANOTIFY_H
@@ -546,6 +547,20 @@ int safe_dup2(const char *file, const int lineno, int oldfd, int newfd)
 	return rval;
 }
 
+void *safe_calloc(const char *file, const int lineno, size_t nmemb, size_t size)
+{
+	void *rval;
+
+	rval = calloc(nmemb, size);
+
+	if (rval == NULL) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"calloc(%zu, %zu) failed", nmemb, size);
+	}
+
+	return rval;
+}
+
 void *safe_realloc(const char *file, const int lineno, void *ptr, size_t size)
 {
 	void *ret;
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
