Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D09C17A20CE
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Sep 2023 16:25:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A48F83CE677
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Sep 2023 16:25:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2BACD3CB23E
 for <ltp@lists.linux.it>; Fri, 15 Sep 2023 16:25:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2D05210002B3
 for <ltp@lists.linux.it>; Fri, 15 Sep 2023 16:25:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 83BD11FD66;
 Fri, 15 Sep 2023 14:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694787946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+YdM+quIRtgqq5Q4ZAMFNQ+Sad9f42S174foxnR9ORI=;
 b=QpTNeZxmDg5KF8yYDI8h6m9A30FtAdwKuqCahorDWv4I4wJMos9kWybXnYcTCdxnx13XaY
 ekedYg5I2wsczuJ6pfJKvw3UF5N9zqZmytUsG9iSV9fXU9Doxv/OA780Yp4Ku7YJYcF6Dq
 hfL5As1wlUfOXbj55et/x4zUFOjN/7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694787946;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+YdM+quIRtgqq5Q4ZAMFNQ+Sad9f42S174foxnR9ORI=;
 b=syC3euM4TGDrHCiwpjjjAlX0CxEvvZvFfowCNyVd6V0iJbT3akfMlSqSYL2vOsL9gU0/SN
 qLY4JcO0ez2ecLCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64B0D13251;
 Fri, 15 Sep 2023 14:25:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7KTbFmppBGXBfAAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Fri, 15 Sep 2023 14:25:46 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri, 15 Sep 2023 16:25:45 +0200
Message-Id: <20230915142545.16446-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Add Linux Test eXecutor inside tools
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

The ltx program runs on the system under test (SUT). It's primary
purpose is to run test executables in parallel and serialise the
results.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 .gitmodules          |  3 +++
 tools/ltx/.gitignore |  1 +
 tools/ltx/Makefile   | 26 ++++++++++++++++++++++++++
 tools/ltx/ltx-src    |  1 +
 4 files changed, 31 insertions(+)
 create mode 100644 tools/ltx/.gitignore
 create mode 100644 tools/ltx/Makefile
 create mode 160000 tools/ltx/ltx-src

diff --git a/.gitmodules b/.gitmodules
index 088023039..c9a6eea31 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -7,3 +7,6 @@
 [submodule "tools/kirk"]
 	path = tools/kirk
 	url = https://github.com/linux-test-project/kirk.git
+[submodule "tools/ltx/ltx-src"]
+	path = tools/ltx/ltx-src
+	url = https://github.com/linux-test-project/ltx.git
diff --git a/tools/ltx/.gitignore b/tools/ltx/.gitignore
new file mode 100644
index 000000000..0205b4ec7
--- /dev/null
+++ b/tools/ltx/.gitignore
@@ -0,0 +1 @@
+ltx
diff --git a/tools/ltx/Makefile b/tools/ltx/Makefile
new file mode 100644
index 000000000..0fbf7cfd9
--- /dev/null
+++ b/tools/ltx/Makefile
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2023 Cyril Hrubis <chrubis@suse.cz>
+#
+# Install script for Linux Test eXecutor
+
+top_srcdir		?= ../..
+
+include $(top_srcdir)/include/mk/env_pre.mk
+
+BINARY=ltx
+
+MAKE_TARGETS := $(BINARY)
+
+CFLAGS+=-I$(abs_srcdir)/ltx-src/ -I$(abs_srcdir)/ltx-src/msgpack/
+
+$(BINARY): $(wildcard $(abs_srcdir)/ltx-src/*.c $(abs_srcdir)/ltx-src/msgpack/*.c)
+ifdef VERBOSE
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $^ $(LDLIBS) -o $@
+else
+	@echo CC $@
+	@$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $^ $(LDLIBS) -o $@
+endif
+
+INSTALL_DIR := $(prefix)
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/tools/ltx/ltx-src b/tools/ltx/ltx-src
new file mode 160000
index 000000000..d6d150947
--- /dev/null
+++ b/tools/ltx/ltx-src
@@ -0,0 +1 @@
+Subproject commit d6d1509479537f4fdfa9b5adcb67eb6312714999
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
