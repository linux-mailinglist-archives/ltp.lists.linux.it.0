Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 215BA1A2AED
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 23:18:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D0F73C2D1F
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 23:18:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C0BC13C2D42
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 23:18:01 +0200 (CEST)
Received: from confino.investici.org (confino.investici.org
 [IPv6:2a00:c38:11e:ffff::a020])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BF5D1200C94
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 23:18:00 +0200 (CEST)
Received: from mx1.investici.org (unknown [127.0.0.1])
 by confino.investici.org (Postfix) with ESMTP id 2EFB42171D;
 Wed,  8 Apr 2020 21:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
 s=stigmate; t=1586380679;
 bh=Ecu5wwbk7katxb8msk79U0Xe0/46vfR4pzxIHq12zV4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CDJZgH2cYFV/0a9Fm6ET7Ow6ap26l907vk0rhtHQE6Vq2VlpG39f//78ImVPQNAXg
 XbTUtyywFgTqm7ljF+nf2cheehXoZ8/ZhIi3326V8jU1FUHz9WCM/ideYRK4i43T9I
 TNDikXN2JanNnzt5EgUISDjgTdjeEt8nf/BQUVEU=
Received: from [212.103.72.250] (mx1.investici.org [212.103.72.250])
 (Authenticated sender: laniel_francis@privacyrequired.com) by localhost
 (Postfix) with ESMTPSA id 0E3E320EB7; 
 Wed,  8 Apr 2020 21:17:59 +0000 (UTC)
From: laniel_francis@privacyrequired.com
To: ltp@lists.linux.it
Date: Wed,  8 Apr 2020 23:17:00 +0200
Message-Id: <20200408211700.7958-2-laniel_francis@privacyrequired.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <208a947b-a64a-0962-b3de-0756f1cc1c92@cn.fujitsu.com>
References: <208a947b-a64a-0962-b3de-0756f1cc1c92@cn.fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] Add SAFE_PIPE2.
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
 include/safe_macros_fn.h  |  3 +++
 include/tst_safe_macros.h |  3 +++
 lib/safe_macros.c         | 15 +++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/include/safe_macros_fn.h b/include/safe_macros_fn.h
index 3df952811..ec2d34ae3 100644
--- a/include/safe_macros_fn.h
+++ b/include/safe_macros_fn.h
@@ -67,6 +67,9 @@ int safe_open(const char *file, const int lineno,
 int safe_pipe(const char *file, const int lineno,
               void (*cleanup_fn)(void), int fildes[2]);
 
+int safe_pipe2(const char *file, const int lineno, void (*cleanup_fn) (void),
+               int fildes[2], int flags);
+
 ssize_t safe_read(const char *file, const int lineno,
                   void (*cleanup_fn)(void), char len_strict, int fildes,
                   void *buf, size_t nbyte);
diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index d95d26219..1738d3cc6 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -87,6 +87,9 @@ static inline int safe_dup(const char *file, const int lineno,
 #define SAFE_PIPE(fildes) \
 	safe_pipe(__FILE__, __LINE__, NULL, (fildes))
 
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
