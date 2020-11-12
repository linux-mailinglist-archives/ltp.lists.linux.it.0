Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6771E2B097A
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 17:06:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF50C3C5FFF
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 17:06:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D11D33C5271
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 17:06:14 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A60D11A01549
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 17:06:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E00EAB95;
 Thu, 12 Nov 2020 16:06:13 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 Nov 2020 16:47:46 +0100
Message-Id: <20201112154748.17857-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] Add support for kconfig strings
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

We add a support for strings into the boolean tokenizer and also
validator for kconfig variables into the kconfig parser so that we find
most of the typos even before we attempt to evaluate the expressions.

Cyril Hrubis (2):
  lib: tst_bool_expr: Add support for strings
  lib/tst_kconfig: Validate variables

 lib/newlib_tests/.gitignore       |   1 +
 lib/newlib_tests/config01         |   1 +
 lib/newlib_tests/config02         |   1 +
 lib/newlib_tests/config03         |   1 +
 lib/newlib_tests/config04         |   1 +
 lib/newlib_tests/config05         |   1 +
 lib/newlib_tests/test_kconfig.c   |   1 +
 lib/newlib_tests/test_kconfig02.c |  29 +++++++++
 lib/newlib_tests/tst_bool_expr.c  |   3 +
 lib/tst_bool_expr.c               |   7 ++
 lib/tst_kconfig.c                 | 102 ++++++++++++++++++++++++++++++
 11 files changed, 148 insertions(+)
 create mode 100644 lib/newlib_tests/test_kconfig02.c

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
