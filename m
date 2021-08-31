Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B570C3FC4A3
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:10:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3782F3C9A50
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:10:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F0503C2A3D
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:10:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9AF751400176
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:10:18 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id ED5841FE51;
 Tue, 31 Aug 2021 09:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1630401017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeNQ/MbTXU8ItX0KHTt5PIsuWo9QGYbToKdoFhjVCD4=;
 b=sPvV4lo2c1pTiSAHaElWwYSWpjvZUOVdoGLYbGbPTZ7Ba+1hXKNXHJsJP/BICnfXJuJY+M
 1rh+a+k4nGT9dmRAoIfGXfC5id5JM7IcIPl50oFAS9Pmpgw8d1uqFLnbu0YIyPqG5JX6qP
 R7L28+EB/xQnDjgkFI/CVHAeKSNB4NE=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id BB751A3BA1;
 Tue, 31 Aug 2021 09:10:17 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 31 Aug 2021 10:10:02 +0100
Message-Id: <20210831091005.25361-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YSz36VZ18+N4YsM/@yuki>
References: <YSz36VZ18+N4YsM/@yuki>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] API: Add tst_printf to avoid specifying the
 output FD in tests
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

In bpf_common.h we have to print the verifier log with
dprintf(STDERR_FILENO, ...)  because it is usually too large for
tst_{res,brk}(). As these functions use sprintf() and write() to allow
printing in signal handlers.

We can hide the STDERR_FILENO part in the library. Just incase we want
to change the fileno at some point.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

V2: Add this patch and use tst_printf

 include/tst_test.h | 3 +++
 lib/tst_test.c     | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/tst_test.h b/include/tst_test.h
index 27ebed94e..5e3619698 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -79,6 +79,9 @@ void tst_brk_(const char *file, const int lineno, int ttype,
 		tst_brk_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
 	})
 
+void tst_printf(const char *const fmt, ...)
+		__attribute__((nonnull(1), format (printf, 1, 2)));
+
 /* flush stderr and stdout */
 void tst_flush(void);
 
diff --git a/lib/tst_test.c b/lib/tst_test.c
index b61aa8b03..4224353da 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -360,6 +360,15 @@ void tst_brk_(const char *file, const int lineno, int ttype,
 	va_end(va);
 }
 
+void tst_printf(const char *const fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	vdprintf(STDERR_FILENO, fmt, va);
+	va_end(va);
+}
+
 static void check_child_status(pid_t pid, int status)
 {
 	int ret;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
