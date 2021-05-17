Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8313839F2
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:31:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 526603C3339
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:31:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8813A3C314B
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B824D1400158
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621269040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZ2GhdvB0HbYKwHa28XWafj39BXHKc+CX8iEN6OjXwc=;
 b=MeHVyEvrtB9+R8IohloySiNzK56sSEpfiUxTXyC9AcWmhDIikFUR2jl8ghC7Rjg7pKCdRK
 UJ2BXvsnFJl3ogj2eFJVwK6y2Rrf8dWn7/KrXqic35YWdhQq4cu4VlIim5mcYdEZSybRt3
 +4ozryGZ+QM4gIjzOobvK1Xj22wam24=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DF00B263;
 Mon, 17 May 2021 16:30:40 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 17 May 2021 17:30:29 +0100
Message-Id: <20210517163029.22974-7-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517163029.22974-1-rpalethorpe@suse.com>
References: <20210517163029.22974-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 6/6] API: Check exported symbols
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

Abort the build process if a new symbol is exported from the library
without tst_ or safe_ prepended.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 lib/Makefile                 | 12 +++++++
 scripts/check_export_syms.sh | 64 ++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100755 scripts/check_export_syms.sh

diff --git a/lib/Makefile b/lib/Makefile
index f019432e8..76ef49a3e 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -42,5 +42,17 @@ $(pc_file):
 	test -d "$(@D)" || mkdir -p "$(@D)"
 	install -m $(INSTALL_MODE) "$(builddir)/$(@F)" "$@"
 
+CHECK_LIB ?= $(top_srcdir)/scripts/check_export_syms.sh
+.PHONY: check_lib
+check_lib: libltp.a
+ifdef VERBOSE
+	$(CHECK_LIB) $<
+else
+	@echo CHECK_LIB $<
+	@$(CHECK_LIB) $<
+endif
+
+MAKE_TARGETS		+= check_lib
+
 include $(top_srcdir)/include/mk/lib.mk
 include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/scripts/check_export_syms.sh b/scripts/check_export_syms.sh
new file mode 100755
index 000000000..d573ed946
--- /dev/null
+++ b/scripts/check_export_syms.sh
@@ -0,0 +1,64 @@
+#!/bin/sh -eu
+# Check the exported symbols from an object file or archive
+
+obj_file=$1
+
+non_prefix_syms() {
+    nm $obj_file --defined-only -o -g -l | \
+	awk -F ' ' "\$3 !~ /tst_|safe_|ltp_/ { print }"
+}
+
+ignore_list=$(tr -d '\n' <<EOF
+parse_opts|
+STD_LOOP_COUNT|
+usc_global_setup_hook|
+usc_test_looping|
+parse_ranges|
+random_bit|
+random_range|
+random_rangel|
+random_rangell|
+random_range_seed|
+range_max|
+range_min|
+range_mult|
+lio_check_asyncio|
+lio_help1|
+lio_help2|
+Lio_info1|
+Lio_info2|
+lio_parse_io_arg1|
+lio_parse_io_arg2|
+lio_random_methods|
+lio_read_buffer|
+lio_set_debug|
+Lio_SysCall|
+lio_wait4asyncio|
+lio_write_buffer|
+stride_bounds|
+TEST_ERRNO|
+TEST_RETURN|
+TST_RET_PTR|
+TCID|
+TST_ERR|
+TST_PASS|
+TST_RET
+EOF
+)
+
+ignore_regex="\$3 !~ /$ignore_list/"
+fmt_error_statement=$(cat <<"EOF"
+{
+  ("basename " $4) | getline cfile
+  print "ERROR: lib symbol exported without tst_ or safe_: " cfile"::"$3
+  failed = 1
+}
+END {
+  if (failed == 1) {
+      exit(1)
+  }
+}
+EOF
+)
+
+non_prefix_syms | awk -F ' ' "$ignore_regex $fmt_error_statement"
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
