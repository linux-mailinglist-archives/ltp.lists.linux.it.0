Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CC1483DED
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 09:18:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 704F43C9073
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 09:18:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1C8103C222E
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 09:18:43 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A9D44600807
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 09:18:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0359A1F386;
 Tue,  4 Jan 2022 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1641284322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TnmNDSFKZYUxjfango2FZqody8FAE5yjzKWThUVeqY=;
 b=N6BhaxqXcJapr6hSX+Tj1Wzxm8+Vwa3yxxLKlCaMNeAT6Anf8u90ojmLpEK1uipTC/Kd9P
 xOmAmv8/6VzcG85yFisLRskREuCmWBo762QbS01p2GRxdxrJPtPl6zZdgGR8+uAQyMaQCK
 Kl2Xbmb4GpUwIKVnNGYqfSwSU9ZiZKU=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A46B213AB9;
 Tue,  4 Jan 2022 08:18:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UMJJIeEC1GGeZwAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 04 Jan 2022 08:18:41 +0000
To: ltp@lists.linux.it
Date: Tue,  4 Jan 2022 09:18:27 +0100
Message-Id: <20220104081836.22827-2-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104081836.22827-1-andrea.cervesato@suse.com>
References: <20220104081836.22827-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1 01/10] Prepare watchqueue testing suite build
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/Makefile              |  1 +
 testcases/kernel/watchqueue/.gitignore | 10 ++++++++++
 testcases/kernel/watchqueue/Makefile   |  8 ++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 testcases/kernel/watchqueue/.gitignore
 create mode 100644 testcases/kernel/watchqueue/Makefile

diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
index 4604f1f38..d44856c57 100644
--- a/testcases/kernel/Makefile
+++ b/testcases/kernel/Makefile
@@ -38,6 +38,7 @@ SUBDIRS			+= connectors \
 			   sound \
 			   tracing \
 			   uevents \
+			   watchqueue \
 
 ifeq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
 SUBDIRS			+= power_management
diff --git a/testcases/kernel/watchqueue/.gitignore b/testcases/kernel/watchqueue/.gitignore
new file mode 100644
index 000000000..797ccc243
--- /dev/null
+++ b/testcases/kernel/watchqueue/.gitignore
@@ -0,0 +1,10 @@
+wqueue01
+wqueue02
+wqueue03
+wqueue04
+wqueue05
+wqueue06
+wqueue07
+wqueue08
+watch_test.c
+watch_test
diff --git a/testcases/kernel/watchqueue/Makefile b/testcases/kernel/watchqueue/Makefile
new file mode 100644
index 000000000..0008b8cc4
--- /dev/null
+++ b/testcases/kernel/watchqueue/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir			?= ../../..
+
+LDLIBS += $(KEYUTILS_LIBS)
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
