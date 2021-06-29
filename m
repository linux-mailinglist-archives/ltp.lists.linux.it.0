Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 472D13B6EBB
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:28:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA05F3C6C6D
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:28:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC8C73C1B6E
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:27:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7CDD51400E0E
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:27:50 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 994E12260E;
 Tue, 29 Jun 2021 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624951669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4btONU75fzkuwi+gCTNg69AZUa7IrWuXHgYBVUUx9f0=;
 b=UGStAtmsSneHPOyWpusVUeaoJcR3CtGrS3zvx4NqKA+AKmUxDs4NEkhEdp177BzuO3QOfG
 Sb1duAHeI7zpRSKvTweMDVsUAtmumMevNXTcy/jz3EjE37waJU5vkTf67vZJbY0nf4ed+v
 YQ7yeh2Ve2GZ+KX2dq6OPzxuL3xRhpU=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 68479A3B8A;
 Tue, 29 Jun 2021 07:27:49 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 08:27:03 +0100
Message-Id: <20210629072710.23800-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/7] Sparse based checker and rule proposal
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

Hello,

So it turns out that it is quite easy to implement the TST_RET/ERR
check in Sparse. It compiles the code into an IR which is just the
right abstraction for the test. It is also possible to inspect the AST
with Sparse. It appears more difficult to inspect the AST before
macros are expanded.

Sparse is not packaged as a shared library, but has few/no
dependencies and is easy to compile. It seems like it was meant to be
vendored. Including it as a git module seems reasonable to me. Please
see tools/sparse/README.md.

There are still a lot of errors/noise when running 'make check' on the
entire tree. These are mainly caused by old function definitions and
such. They need to be fixed before the tool can be used properly.

Also I have tried to document the rule and created a list of rules. So
this can also be taken as a formal proposal for the rule itself.

Thanks,
Richard Palethorpe (7):
  Add Sparse based checker and TST_RET/ERR check
  Add 'make check' to the build system
  meltdown: Set CFLAGS for check targets
  doc: Add rules and recommendations list
  doc: Remind authors and maintainers to run make check
  doc: Document TEST macro and state TST_RET/ERR rule LTP-002
  Reference LTP-002 rule in Cocci scripts

 .gitmodules                                   |   3 +
 Makefile                                      |   8 +
 doc/c-test-api.txt                            |  47 ++++++
 doc/library-api-writing-guidelines.txt        |  14 ++
 doc/maintainer-patch-review-checklist.txt     |   2 +-
 doc/rules.tsv                                 |   3 +
 doc/test-writing-guidelines.txt               |   6 +
 include/mk/env_post.mk                        |   8 +
 include/mk/generic_leaf_target.inc            |   5 +-
 include/mk/generic_trunk_target.inc           |   7 +-
 include/mk/lib.mk                             |   3 +
 include/mk/module.mk                          |   2 +
 include/mk/rules.mk                           |   9 ++
 include/mk/sparse.mk                          |   9 ++
 include/mk/testcases.mk                       |   1 +
 .../coccinelle/libltp-test-macro-vars.cocci   |   6 +-
 scripts/coccinelle/libltp-test-macro.cocci    |   4 +-
 testcases/cve/Makefile                        |   1 +
 testcases/open_posix_testsuite/Makefile       |   4 +
 tools/sparse/.gitignore                       |   1 +
 tools/sparse/Makefile                         |  20 +++
 tools/sparse/README.md                        |  34 ++++
 tools/sparse/main.c                           | 148 ++++++++++++++++++
 tools/sparse/sparse-src                       |   1 +
 24 files changed, 335 insertions(+), 11 deletions(-)
 create mode 100644 doc/rules.tsv
 create mode 100644 include/mk/sparse.mk
 create mode 100644 tools/sparse/.gitignore
 create mode 100644 tools/sparse/Makefile
 create mode 100644 tools/sparse/README.md
 create mode 100644 tools/sparse/main.c
 create mode 160000 tools/sparse/sparse-src

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
