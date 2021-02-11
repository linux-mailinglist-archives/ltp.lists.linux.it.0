Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E733188E7
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 12:03:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECBBE3C5DEF
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 12:03:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 603583C5DD7
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 12:03:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 09162600C4D
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 12:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613041412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDP7U1R0iouOpm2jdCa7/4KWIoN5syrQDewpfToIJCU=;
 b=abD7Qft2Jg4Nnb0IX8lSDY6y/PV34/jIhOIC+Y8kQXmau2GalPIA8pLYdMnjmlX9RhZqCf
 tiq+M9GEp7brMjky8ZltFFCUMaQxc4eiEjJuX+QLMm5noL1nkcAQamU1t41k8ZMWUA4Uwx
 ieqdc9kYoafBi9SnooZBcvAq9uGQ0M0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3C1BADE3;
 Thu, 11 Feb 2021 11:03:32 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 11 Feb 2021 11:03:14 +0000
Message-Id: <20210211110317.31942-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211110317.31942-1-rpalethorpe@suse.com>
References: <20210211110317.31942-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/5] API: Add SAFE_DUP2
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

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_safe_macros.h |  5 +++++
 lib/tst_safe_macros.c     | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index ee3df4142..2a2b0088a 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -50,6 +50,11 @@ int safe_dup(const char *file, const int lineno, int oldfd);
 #define SAFE_DUP(oldfd) \
 	safe_dup(__FILE__, __LINE__, (oldfd))
 
+int safe_dup2(const char *file, const int lineno, int oldfd, int newfd);
+
+#define SAFE_DUP2(oldfd, newfd)			\
+	safe_dup2(__FILE__, __LINE__, (oldfd), (newfd))
+
 #define SAFE_GETCWD(buf, size) \
 	safe_getcwd(__FILE__, __LINE__, NULL, (buf), (size))
 
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index aa03a6d5c..182b690bb 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -415,6 +415,24 @@ int safe_dup(const char *file, const int lineno, int oldfd)
 	return rval;
 }
 
+int safe_dup2(const char *file, const int lineno, int oldfd, int newfd)
+{
+	int rval;
+
+	rval = dup2(oldfd, newfd);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			 "dup2(%i, %i) failed", oldfd, newfd);
+	} else if (rval != newfd) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			 "Invalid dup2(%i, %i) return value %d",
+			 oldfd, newfd, rval);
+	}
+
+	return rval;
+}
+
 sighandler_t safe_signal(const char *file, const int lineno,
 	int signum, sighandler_t handler)
 {
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
