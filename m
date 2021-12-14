Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A65247456A
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 15:43:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73B5E3C8DC5
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 15:43:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8799F3C104E
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 15:43:14 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F387010011BE
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 15:43:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 517D41F37C;
 Tue, 14 Dec 2021 14:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639492993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYdqOo/MQwYrdgX9cdpDFlGQYFXec/iVwY2GVUNOIho=;
 b=dAqdNGLKZv3R9LbVjGWJw+EO1NHZhh6CRc4qysWQllGAqF0PzIawZMofvAWBB06NX1+3Kv
 GvBDowsxFdvMQProwx/8b0GDmjUfOqAleqDU6Q5aFcDUpoN/Z+4wBAeZMHishqPo7Uk91S
 JMnLc/qDXEPWdFE0ORP8uNUlXiS0cZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639492993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYdqOo/MQwYrdgX9cdpDFlGQYFXec/iVwY2GVUNOIho=;
 b=IBN8mQsOS9CFAImi1oQDLCpL688HTtxQP7U7rCV/bhddjoWr+jpfgLZj2xgK/jOSFtmb3V
 l88+qscv0sNjsmDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22B0913EA2;
 Tue, 14 Dec 2021 14:43:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4O3LBoGtuGEkTwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 14 Dec 2021 14:43:13 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 14 Dec 2021 15:43:07 +0100
Message-Id: <20211214144309.6704-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214144309.6704-1-pvorel@suse.cz>
References: <20211214144309.6704-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] lib: Introduce tst_defaults.h
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

Needed to reuse DEFAULT_FS_TYPE in next commit,
but put there also TEMPDIR, which is also variable used in both legacy
and new API.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
new in v2

 include/old/ltp_priv.h | 13 +------------
 include/tst_defaults.h | 21 +++++++++++++++++++++
 include/tst_private.h  |  1 +
 3 files changed, 23 insertions(+), 12 deletions(-)
 create mode 100644 include/tst_defaults.h

diff --git a/include/old/ltp_priv.h b/include/old/ltp_priv.h
index 0552457e59..0a0ef70f33 100644
--- a/include/old/ltp_priv.h
+++ b/include/old/ltp_priv.h
@@ -23,18 +23,7 @@
 #define __LTP_PRIV_H__
 
 #include <stdarg.h>
-
-/*
- * This is the default temporary directory used by tst_tmpdir().
- *
- * This is used when TMPDIR env variable is not set.
- */
-#define TEMPDIR	"/tmp"
-
-/*
- * Default filesystem to be used for tests.
- */
-#define DEFAULT_FS_TYPE "ext2"
+#include "tst_defaults.h"
 
 /* environment variables for controlling  tst_res verbosity */
 #define TOUT_VERBOSE_S  "VERBOSE"	/* All test cases reported */
diff --git a/include/tst_defaults.h b/include/tst_defaults.h
new file mode 100644
index 0000000000..083427b7e2
--- /dev/null
+++ b/include/tst_defaults.h
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2013 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+#ifndef TST_DEFAULTS_H_
+#define TST_DEFAULTS_H_
+
+/*
+ * This is the default temporary directory used by tst_tmpdir().
+ *
+ * This is used when TMPDIR env variable is not set.
+ */
+#define TEMPDIR	"/tmp"
+
+/*
+ * Default filesystem to be used for tests.
+ */
+#define DEFAULT_FS_TYPE "ext2"
+
+#endif /* TST_DEFAULTS_H_ */
diff --git a/include/tst_private.h b/include/tst_private.h
index b02f91228e..6f4f39b151 100644
--- a/include/tst_private.h
+++ b/include/tst_private.h
@@ -11,6 +11,7 @@
 
 #include <stdio.h>
 #include <netdb.h>
+#include "tst_defaults.h"
 
 #define MAX_IPV4_PREFIX 32
 #define MAX_IPV6_PREFIX 128
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
