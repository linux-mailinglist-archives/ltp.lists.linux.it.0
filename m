Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4F329AA36
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 12:04:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 386A03C618A
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 12:04:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A385F3C30F8
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 12:04:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4709D140119E
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 12:04:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9A995ACA1;
 Tue, 27 Oct 2020 11:04:10 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 27 Oct 2020 12:04:44 +0100
Message-Id: <20201027110446.20416-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] Add support for kconfig constraints
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
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This patchset adds a support for generic boolean expressions in order to
be able to check for a more complex kernel configurations.

The motivation for this is recent rename in kernel config names that
cannot be checked for by a simplistic approach we previously
implemented.

The boolean expression parser was written as a generic as possible since
I do expect that we will reuse it for different types of assertions in
the future.

Cyril Hrubis (2):
  lib: Add generic boolean expression parser and eval
  lib/tst_kconfig: Make use of boolean expression eval

 doc/test-writing-guidelines.txt  |  21 +-
 include/tst_bool_expr.h          |  80 ++++++
 include/tst_kconfig.h            |  34 +--
 lib/newlib_tests/.gitignore      |   1 +
 lib/newlib_tests/config06        |   1 +
 lib/newlib_tests/test_kconfig.c  |   1 +
 lib/newlib_tests/tst_bool_expr.c | 128 ++++++++++
 lib/tst_bool_expr.c              | 425 +++++++++++++++++++++++++++++++
 lib/tst_kconfig.c                | 362 +++++++++++++++++---------
 9 files changed, 904 insertions(+), 149 deletions(-)
 create mode 100644 include/tst_bool_expr.h
 create mode 100644 lib/newlib_tests/config06
 create mode 100644 lib/newlib_tests/tst_bool_expr.c
 create mode 100644 lib/tst_bool_expr.c

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
