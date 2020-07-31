Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C247923458A
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 14:14:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CA3C3C2601
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 14:14:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A2A4F3C13DC
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 14:14:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1933B20150A
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 14:14:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C55DDAF8E
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 12:15:00 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 31 Jul 2020 14:15:06 +0200
Message-Id: <20200731121508.12805-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200731121508.12805-1-chrubis@suse.cz>
References: <20200731121508.12805-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] build system: Add explicit make rules
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

This commit adds explicit build rules, the main motivation are recent
build failures caused by library orderings. To fix that this commit
introduces LTPLDLIBS special variable that is passed to linker before
the LDLIBS which avoids the need for tricks as
"LDLIBS := -lltpfoo $(LDLIBS)" in the Makefiles.

This commit also silences the output by default a bit, the verbose
output could be enabled by VERBOSE=1 env variable, which is probably
what most of the build systems will do if this gets commited. I guess
that we can as well silence a bit the "make entering/leaving directory"
if this the right way to go.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/mk/env_post.mk |  2 ++
 include/mk/rules.mk    | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 include/mk/rules.mk

diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
index f4169ad66..bdf8c696d 100644
--- a/include/mk/env_post.mk
+++ b/include/mk/env_post.mk
@@ -107,4 +107,6 @@ $(error You must define $$(prefix) before executing install)
 endif # END $(filter-out install,$(MAKECMDGOALS)),$(MAKECMDGOALS)
 endif
 
+include $(top_srcdir)/include/mk/rules.mk
+
 endif
diff --git a/include/mk/rules.mk b/include/mk/rules.mk
new file mode 100644
index 000000000..e9b9c35ef
--- /dev/null
+++ b/include/mk/rules.mk
@@ -0,0 +1,29 @@
+%.o: %.c
+ifdef VERBOSE
+	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
+else
+	@$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
+	@echo CC $@
+endif
+
+ifdef VERBOSE
+COMPILE.c=$(CC) $(CPPFLAGS) $(CFLAGS) -c
+else
+COMPILE.c=@echo CC $@; $(CC) $(CPPFLAGS) $(CFLAGS) -c
+endif
+
+%: %.o
+ifdef VERBOSE
+	$(CC) $(LDFLAGS) $^ $(LTPLDLIBS) $(LDLIBS) -o $@
+else
+	@$(CC) $(LDFLAGS) $^ $(LTPLDLIBS) $(LDLIBS) -o $@
+	@echo LD $@
+endif
+
+%: %.c
+ifdef VERBOSE
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $^ $(LTPLDLIBS) $(LDLIBS) -o $@
+else
+	@$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $^ $(LTPLDLIBS) $(LDLIBS) -o $@
+	@echo CC $@
+endif
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
