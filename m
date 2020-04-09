Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 268101A3BC0
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 23:14:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA9FA3C2CEF
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 23:14:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D99693C2CE0
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 23:13:51 +0200 (CEST)
Received: from latitanza.investici.org (latitanza.investici.org
 [82.94.249.234])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1FDFE60048F
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 23:13:50 +0200 (CEST)
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 51D18121A22;
 Thu,  9 Apr 2020 21:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
 s=stigmate; t=1586466830;
 bh=AGzM95wamc0kxK5FZ4BTjgoLu3yNkogJ8zXOMl8GkmE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AYV2eczgT2hl3XLu9/RA3BT+OH1cDj/SS9ELhuK+4xnhOftmRksiD/COj5dgXUQH7
 N4Gi+a7WgRdAG1BoyF9Wp6H5GBvX45meR9iCRrGo6iW/zYUB0SalTH5CiWosh7hODP
 42isfOEMu811k4m+hCq47OE93rQ/5ceq0k/r6H+A=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: laniel_francis@privacyrequired.com) by localhost
 (Postfix) with ESMTPSA id F0182121A21; 
 Thu,  9 Apr 2020 21:13:49 +0000 (UTC)
From: laniel_francis@privacyrequired.com
To: ltp@lists.linux.it
Date: Thu,  9 Apr 2020 23:12:55 +0200
Message-Id: <20200409211255.1357-2-laniel_francis@privacyrequired.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <67fdc846a8cd8616c9eb13cf89463b9d637e6849>
References: <67fdc846a8cd8616c9eb13cf89463b9d637e6849>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/2] Add SAFE_PIPE2.
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

From: Francis Laniel <laniel_francis@privacyrequired.com>

This macro is the equivalent of SAFE_PIPE for pipe2 system call.
---
 include/old/safe_macros.h |  3 +++
 include/tst_safe_macros.h |  6 ++++++
 lib/safe_macros.c         | 15 +++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/include/old/safe_macros.h b/include/old/safe_macros.h
index e778d3077..a7bd43c80 100644
--- a/include/old/safe_macros.h
+++ b/include/old/safe_macros.h
@@ -66,6 +66,9 @@
 #define SAFE_PIPE(cleanup_fn, fildes)	\
 	safe_pipe(__FILE__, __LINE__, cleanup_fn, (fildes))
 
+#define SAFE_PIPE2(fildes, flags) \
+	safe_pipe2(__FILE__, __LINE__, NULL, (fildes), (flags))
+
 #define SAFE_READ(cleanup_fn, len_strict, fildes, buf, nbyte)	\
 	safe_read(__FILE__, __LINE__, cleanup_fn, (len_strict), (fildes), \
 	    (buf), (nbyte))
diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index d95d26219..a21d75646 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -87,6 +87,12 @@ static inline int safe_dup(const char *file, const int lineno,
 #define SAFE_PIPE(fildes) \
 	safe_pipe(__FILE__, __LINE__, NULL, (fildes))
 
+int safe_pipe2(const char *file, const int lineno, void (*cleanup_fn) (void),
+	       int fildes[2], int flags);
+
+#define SAFE_PIPE2(fildes, flags) \
+	safe_pipe2(__FILE__, __LINE__, NULL, (fildes), (flags))
+
 #define SAFE_READ(len_strict, fildes, buf, nbyte) \
 	safe_read(__FILE__, __LINE__, NULL, (len_strict), (fildes), (buf), (nbyte))
 
diff --git a/lib/safe_macros.c b/lib/safe_macros.c
index dde9b7b5e..780245821 100644
--- a/lib/safe_macros.c
+++ b/lib/safe_macros.c
@@ -248,6 +248,21 @@ int safe_pipe(const char *file, const int lineno, void (*cleanup_fn) (void),
 	return rval;
 }
 
+int safe_pipe2(const char *file, const int lineno, void (*cleanup_fn) (void),
+               int fildes[2], int flags)
+{
+	int rval;
+
+	rval = pipe2(fildes, flags);
+	if (rval == -1) {
+		tst_brkm(TBROK | TERRNO, cleanup_fn,
+			 "%s:%d: pipe2({%d,%d}) failed",
+			 file, lineno, fildes[0], fildes[1]);
+	}
+
+	return rval;
+}
+
 ssize_t safe_read(const char *file, const int lineno, void (*cleanup_fn) (void),
                   char len_strict, int fildes, void *buf, size_t nbyte)
 {
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
