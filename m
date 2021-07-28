Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A93D8DE4
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 14:34:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 685583C90A1
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 14:34:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0D0FB3C642D
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 14:34:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 479A61000F22
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 14:34:24 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5A657222DA;
 Wed, 28 Jul 2021 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1627475663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=N4OhGfl6xckZpfxsBN8lc20Qy8gogwcl1oMUeWW0PBI=;
 b=njZ1Uobo9Q3TvbQbllxqWvzfw+k7Hdd9gB4DH61JZxH7r+GqgwXUcqEnna4SMEUeBr4S1g
 A0Nmcgti9dFYLSJ9Wh1nKNgvE90JYxz+mrRnDOSj99Z47MHunyEXb4HH7ZeBBfEclOgQgD
 FpQDdGyr/ZYOLb1UiTl1bIsJrIrpx3A=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 291BAA3B83;
 Wed, 28 Jul 2021 12:34:23 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 28 Jul 2021 13:34:04 +0100
Message-Id: <20210728123412.31858-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/8] Sparse based checker and rule proposal
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

V3:
* Rename main to sparse-ltp
* Unify TEST/TST_EXP docs
* Add/fix a couple of links in the docs
* minor formatting changes in sparse-ltp
* Add note on building with -m32

V2:
* Automatically download and build sparse.
* Only build sparse if "make check" is run. It is filtered from "make all".
* Move libtsc.h out of the realtime tests dir. Note that checking of metldown.c
  now fails because it uses a GCC builtin sparse does not recognize.

As mentioned above, there are various errors during checking that need
fixing. For the most part these are legit errors (usually old style
function definitions or redefining of symbols). With stuff like
metldown I am tempted to filter it, but OTOH it looks relatively
straight forward to add a builtin to Sparse upstream. I just need time
to do it. First though I would like to get "make check" working on the
library, so we can put that in CI.

Richard Palethorpe (8):
  Add Sparse based checker and TST_RET/ERR check
  Add 'make check' to the build system
  doc: Add rules and recommendations list
  doc: Remind authors and maintainers to run make check
  doc: Document TEST macro and state TST_RET/ERR rule LTP-002
  Reference LTP-002 rule in Cocci scripts
  API: Move libtsc.h from realtime tests include to tst_tsc.h
  API/tst_tsc: Add guards and remove some boilerplate

 .gitmodules                                   |   3 +
 Makefile                                      |   8 +
 doc/c-test-api.txt                            |  54 ++++++-
 doc/library-api-writing-guidelines.txt        |  14 ++
 doc/maintainer-patch-review-checklist.txt     |   4 +-
 doc/rules.tsv                                 |   3 +
 doc/test-writing-guidelines.txt               |   8 +
 include/mk/env_post.mk                        |   8 +
 include/mk/generic_leaf_target.inc            |   5 +-
 include/mk/generic_trunk_target.inc           |   7 +-
 include/mk/lib.mk                             |   3 +
 include/mk/module.mk                          |   2 +
 include/mk/rules.mk                           |   9 ++
 include/mk/sparse.mk                          |   9 ++
 include/mk/testcases.mk                       |   1 +
 .../include/libtsc.h => include/tst_tsc.h     |  35 +----
 .../coccinelle/libltp-test-macro-vars.cocci   |   6 +-
 scripts/coccinelle/libltp-test-macro.cocci    |   4 +-
 testcases/cve/Makefile                        |   2 -
 testcases/cve/meltdown.c                      |   2 +-
 testcases/open_posix_testsuite/Makefile       |   4 +
 .../func/async_handler/async_handler_tsc.c    |   3 +-
 .../func/measurement/preempt_timing.c         |   3 +-
 .../realtime/func/measurement/rdtsc-latency.c |   3 +-
 tools/Makefile                                |   2 +
 tools/sparse/.gitignore                       |   1 +
 tools/sparse/Makefile                         |  27 ++++
 tools/sparse/README.md                        |  51 ++++++
 tools/sparse/sparse-ltp.c                     | 147 ++++++++++++++++++
 tools/sparse/sparse-src                       |   1 +
 30 files changed, 382 insertions(+), 47 deletions(-)
 create mode 100644 doc/rules.tsv
 create mode 100644 include/mk/sparse.mk
 rename testcases/realtime/include/libtsc.h => include/tst_tsc.h (53%)
 create mode 100644 tools/sparse/.gitignore
 create mode 100644 tools/sparse/Makefile
 create mode 100644 tools/sparse/README.md
 create mode 100644 tools/sparse/sparse-ltp.c
 create mode 160000 tools/sparse/sparse-src

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
