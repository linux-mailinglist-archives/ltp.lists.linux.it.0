Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC01C3A6626
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 13:57:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 419D33C7298
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 13:57:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DAE793C2779
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 13:56:59 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EB14B1400C41
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 13:56:57 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6CC0C218C8;
 Mon, 14 Jun 2021 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1623671817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZNIs0eo4fUs2PsWpscC3JxzV1D9RZ9b43q/8W2eQFBY=;
 b=XoR9TH8JedWQCSmRmc3y8/Eim7434bTYU5YwjPsuFaKQ8LTczT6N+za1htHfuywk18xMyc
 0uYbCRvGSDQdRY95zlfRp2TC9nSZIFQeResC2te/plBmMnyLMbvs754417c9Xm6E4NBZ72
 cK6BOEYD0wwJ4TcZBXdj9vSxeydpyxU=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 3F55EA3B87;
 Mon, 14 Jun 2021 11:56:57 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 14 Jun 2021 12:56:36 +0100
Message-Id: <20210614115638.25467-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v3 0/2] Libclang based analyzer
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

This implements a TEST() macro check and integrates the check into the
build system.

Compared to the Coccinelle version this is verbose. I do not fancy
implementing auto fixes this way. I think it would be best to continue
using Coccinelle for that. The TEST fixes and semantic patches used to
create them are in a separate patch series.

However I think libclang will allow us to get all the low hanging
fruit without creating major problems for test
developers. Unfortunately libclang is difficult to use without
installing clang itself and llvm-config. However these are only
development dependencies and are not required for building.

I guess it could be run during CI if we either fix all the existing
TEST() usages in the library or add an ignore list. I already have a
Coccinelle script to help with the former.

TODO & Known issues:
* Solve/ignore missing header errors emitted by libclang
* Solve/ignore missing function errors emitted by libclang.
* Solve warning emitted by configure on Ubuntu because the preprocessor
  check can not find clang-c/Index.h (most likely CFLAGS related)
* Detect other cases where library functions set TST_RET and TST_ERR
* Create a script to check whether only symbols available in LLVM10 are
  used.

V3:
* Look for libclang and clang using autoconf
* Print warnings and installation instructions if 'make check' is run
  on a system where (lib)clang is missing. Note that we need libclang,
  clang and llvm-config. On most distros this probably requires installing
  clang-devel and llvm-devel which should install all required deps.
* Remove the functions which were not available in LLVM10
* Use -DLTPLIB instead of searching for 'struct tst_test test'

V2:
* Consistently use singular form of 'check'
* Include missing clang-check.mk
* Add some more comments in main.c

Richard Palethorpe (2):
  Add 'make check' and clang-check to build system
  Start libclang based analyzer and TEST() check

 Makefile                            |   8 +
 configure.ac                        |   2 +
 include/mk/clang-check.mk           |   9 ++
 include/mk/config.mk.in             |   5 +
 include/mk/env_post.mk              |  11 ++
 include/mk/generic_leaf_target.inc  |   5 +-
 include/mk/generic_trunk_target.inc |   7 +-
 include/mk/lib.mk                   |   3 +
 include/mk/rules.mk                 |   9 ++
 include/mk/testcases.mk             |   1 +
 m4/ltp-clang.m4                     |  29 ++++
 tools/clang-check/.gitignore        |   1 +
 tools/clang-check/Makefile          |  35 ++++
 tools/clang-check/main.c            | 238 ++++++++++++++++++++++++++++
 14 files changed, 361 insertions(+), 2 deletions(-)
 create mode 100644 include/mk/clang-check.mk
 create mode 100644 m4/ltp-clang.m4
 create mode 100644 tools/clang-check/.gitignore
 create mode 100644 tools/clang-check/Makefile
 create mode 100644 tools/clang-check/main.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
