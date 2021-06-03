Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CBC39A4FF
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 17:49:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B007A3C8015
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 17:49:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 961C23C813B
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 17:48:39 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3DAD61400549
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 17:48:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4B6F321A05;
 Thu,  3 Jun 2021 15:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1622735315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=N95AocOJfNi8LVmeOgJBye01W+Q1Id4qjBNMUTnR6n4=;
 b=UKM4FhRmo5GbCFg5mQweSWz/BG7pq/4gU5nJBcPRgLA/DAshf8BlExgM9BTDHbKWpmbuPo
 SccxTBCRMEYtV/f65P71RZjUWXvKgviW0/YpLhqiafxi+TO+8nutTXvobMj/+MPwfPyF7h
 sZFs/8EwyiY3wvguigYF0zN/Uqfm5Cg=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 02B9CA3B85;
 Thu,  3 Jun 2021 15:48:34 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu,  3 Jun 2021 16:48:23 +0100
Message-Id: <20210603154825.30165-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/2] Libclang based analyzer
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

This implements a TEST() check and integrates the check into the build
system.

Compared to the Coccinelle version it's very ugly. However I think
this will allow us to get all the low hanging fruit without creating
major problems for test developers.

I guess it could be run during CI if we either fix all the existing
TEST() usages in the library or add an ignore list. I already have a
Coccinelle script to help with the former.

Richard Palethorpe (2):
  Add 'make checks' and clang-checks to build system
  Start libclang based analyzer and TEST() check

 configure.ac                       |   2 +
 include/mk/config.mk.in            |   5 +
 include/mk/env_post.mk             |   8 ++
 include/mk/generic_leaf_target.inc |   5 +-
 include/mk/lib.mk                  |   3 +
 include/mk/rules.mk                |   9 ++
 include/mk/testcases.mk            |   1 +
 tools/clang-checks/.gitignore      |   1 +
 tools/clang-checks/Makefile        |  13 ++
 tools/clang-checks/main.c          | 218 +++++++++++++++++++++++++++++
 10 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 tools/clang-checks/.gitignore
 create mode 100644 tools/clang-checks/Makefile
 create mode 100644 tools/clang-checks/main.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
