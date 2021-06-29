Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F98D3B6EB7
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:27:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 13EE33C6C6C
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:27:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F9823C194A
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:27:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 72071600770
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:27:50 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DBF4420395;
 Tue, 29 Jun 2021 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624951669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5YvWlQkZUkiG+CoZUAQzPS7JhZtrwtPvi26V9Etgu+Y=;
 b=UxNWiqJEskidm9viIwPrwgiCpuh8C/k3/IFf1MdH+6hJtmxESh1uYX78SNHdAHSwPAQGTg
 oI7wWf5gTxpFjn/xm50s/vVWytBi/Dr35H2vhbupdq5Ahgkyaw7xSTZVvq8pdvLDxv+5qV
 bNLM04ecT7KzmdaGZjBeG4vIpPf6YXg=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id A910BA3B8A;
 Tue, 29 Jun 2021 07:27:49 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 08:27:04 +0100
Message-Id: <20210629072710.23800-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629072710.23800-1-rpalethorpe@suse.com>
References: <20210629072710.23800-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/7] Add Sparse based checker and TST_RET/ERR check
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

Vendors in Sparse as a git module. Then uses it to check for stores to
TST_RET/ERR within the library.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 .gitmodules             |   3 +
 tools/sparse/.gitignore |   1 +
 tools/sparse/Makefile   |  20 ++++++
 tools/sparse/README.md  |  34 +++++++++
 tools/sparse/main.c     | 148 ++++++++++++++++++++++++++++++++++++++++
 tools/sparse/sparse-src |   1 +
 6 files changed, 207 insertions(+)
 create mode 100644 tools/sparse/.gitignore
 create mode 100644 tools/sparse/Makefile
 create mode 100644 tools/sparse/README.md
 create mode 100644 tools/sparse/main.c
 create mode 160000 tools/sparse/sparse-src

diff --git a/.gitmodules b/.gitmodules
index 1c9e9c38a..a3c34af4b 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -1,3 +1,6 @@
 [submodule "testcases/kernel/mce-test"]
 	path = testcases/kernel/mce-test
 	url = git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/mce-test.git
+[submodule "tools/sparse/sparse-src"]
+	path = tools/sparse/sparse-src
+	url = git://git.kernel.org/pub/scm/devel/sparse/sparse.git
diff --git a/tools/sparse/.gitignore b/tools/sparse/.gitignore
new file mode 100644
index 000000000..ba2906d06
--- /dev/null
+++ b/tools/sparse/.gitignore
@@ -0,0 +1 @@
+main
diff --git a/tools/sparse/Makefile b/tools/sparse/Makefile
new file mode 100644
index 000000000..cf4ccdb60
--- /dev/null
+++ b/tools/sparse/Makefile
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com>
+
+top_srcdir		?= ../..
+
+include $(top_srcdir)/include/mk/env_pre.mk
+include $(top_srcdir)/include/mk/functions.mk
+
+SPARSE_SRC	?= sparse-src
+
+$(SPARSE_SRC)/libsparse.a:
+	$(error "You need to build Sparse. See tools/sparse/README.md")
+
+HOST_MAKE_TARGETS	:= main
+MAKE_DEPS		+= $(SPARSE_SRC)/libsparse.a
+HOST_CFLAGS		+= -I$(SPARSE_SRC)
+HOST_LDLIBS		+= $(SPARSE_SRC)/libsparse.a
+
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/tools/sparse/README.md b/tools/sparse/README.md
new file mode 100644
index 000000000..368cd7d99
--- /dev/null
+++ b/tools/sparse/README.md
@@ -0,0 +1,34 @@
+# Sparse based linting
+
+This tool checks LTP test and library code for common problems.
+
+## Building
+
+The bad news is you must get and build Sparse[^1]. The good news this only
+takes a minute.
+
+If you already have the Sparse source code, then do the
+following. Where `$SRC_PATH` is the path to the Sparse directory.
+
+```sh
+$ cd tools/sparse
+$ make -C $SRC_PATH -j$(nproc) # Optional
+$ make SPARSE_SRC=$SRC_PATH
+```
+If not then you can fetch it via the git submodule
+
+```sh
+$ cd tools/sparse
+$ git submodule update --init
+$ cd sparse-src
+$ make -C sparse-src -j$(nproc)
+$ make
+```
+
+## Usage
+
+It is integrated with the LTP build system. Just run `make check` or
+`make check-a_test01`, where `a_test01` is an arbitrary test
+executable or object file.
+
+[1]: Many distributions have a Sparse package. This only contains some executables. There is no shared library
diff --git a/tools/sparse/main.c b/tools/sparse/main.c
new file mode 100644
index 000000000..58f9a549c
--- /dev/null
+++ b/tools/sparse/main.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC <rpalethorpe@suse.com>
+ *
+ * Sparse allows us to perform checks on the AST (struct symbol) or on
+ * a linearized representation. In the latter case we are given a set
+ * of entry points (functions) containing basic blocks of
+ * instructions.
+ *
+ * The basic blocks contain byte code in SSA form. This is similar to
+ * the the intermediate representation most compilers use during
+ * optimisation.
+ */
+#include <stdarg.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <ctype.h>
+#include <unistd.h>
+#include <fcntl.h>
+
+#include "lib.h"
+#include "allocate.h"
+#include "opcode.h"
+#include "token.h"
+#include "parse.h"
+#include "symbol.h"
+#include "expression.h"
+#include "linearize.h"
+
+/* The rules for test, library and tool code are different */
+enum ltp_tu_kind {
+	LTP_LIB,
+	LTP_OTHER,
+};
+
+static enum ltp_tu_kind tu_kind = LTP_OTHER;
+
+/* Check for LTP-002
+ *
+ * Inspects the destination symbol of each store instruction. If it is
+ * TST_RET or TST_ERR then emit a warning.
+ */
+static void check_lib_sets_TEST_vars(const struct instruction *insn)
+{
+	static struct ident *TST_RES_id, *TST_ERR_id;
+
+	if (!TST_RES_id) {
+		TST_RES_id = built_in_ident("TST_RET");
+		TST_ERR_id = built_in_ident("TST_ERR");
+	}
+
+	if (insn->opcode != OP_STORE)
+		return;
+	if (insn->src->ident != TST_RES_id &&
+	    insn->src->ident != TST_ERR_id)
+		return;
+
+	warning(insn->pos,
+		"LTP-002: Library should not write to TST_RET or TST_ERR");
+}
+
+static void do_basicblock_checks(struct basic_block *bb)
+{
+	struct instruction *insn;
+
+	FOR_EACH_PTR(bb->insns, insn) {
+		if (!bb_reachable(insn->bb))
+			continue;
+
+		if (tu_kind == LTP_LIB)
+			check_lib_sets_TEST_vars(insn);
+	} END_FOR_EACH_PTR(insn);
+}
+
+static void do_entrypoint_checks(struct entrypoint *ep)
+{
+	struct basic_block *bb;
+
+	FOR_EACH_PTR(ep->bbs, bb) {
+		do_basicblock_checks(bb);
+	} END_FOR_EACH_PTR(bb);
+}
+
+/* Compile the AST into a graph of basicblocks */
+static void process_symbols(struct symbol_list *list)
+{
+	struct symbol *sym;
+
+	FOR_EACH_PTR(list, sym) {
+		struct entrypoint *ep;
+
+		expand_symbol(sym);
+		ep = linearize_symbol(sym);
+		if (!ep || !ep->entry)
+			continue;
+
+		do_entrypoint_checks(ep);
+
+		if (dbg_entry)
+			show_entry(ep);
+	} END_FOR_EACH_PTR(sym);
+}
+
+static void collect_info_from_args(const int argc, char *const *const argv)
+{
+	int i;
+
+	for (i = 0; i < argc; i++) {
+		if (!strcmp("-DLTPLIB", argv[i])) {
+			tu_kind = LTP_LIB;
+		}
+	}
+}
+
+int main(int argc, char **argv)
+{
+	struct string_list *filelist = NULL;
+	char *file;
+
+	Waddress_space = 0;
+	Wbitwise = 0;
+	Wcast_truncate = 0;
+	Wcontext = 0;
+	Wdecl = 0;
+	Wexternal_function_has_definition = 0;
+	Wflexible_array_array = 0;
+	Wimplicit_int = 0;
+	Wint_to_pointer_cast = 0;
+	Wmemcpy_max_count = 0;
+	Wnon_pointer_null = 0;
+	Wone_bit_signed_bitfield = 0;
+	Woverride_init = 0;
+	Wpointer_to_int_cast = 0;
+	Wvla = 0;
+
+	do_output = 0;
+
+	collect_info_from_args(argc, argv);
+
+	process_symbols(sparse_initialize(argc, argv, &filelist));
+	FOR_EACH_PTR(filelist, file) {
+		process_symbols(sparse(file));
+	} END_FOR_EACH_PTR(file);
+
+	report_stats();
+	return 0;
+}
diff --git a/tools/sparse/sparse-src b/tools/sparse/sparse-src
new file mode 160000
index 000000000..8af243292
--- /dev/null
+++ b/tools/sparse/sparse-src
@@ -0,0 +1 @@
+Subproject commit 8af2432923486c753ab52cae70b94ee684121080
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
