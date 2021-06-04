Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BAE39B7BD
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 13:15:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFB023C7FEF
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 13:15:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 14BDA3C7FC2
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 13:14:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3835B100061E
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 13:14:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 53BE421A07;
 Fri,  4 Jun 2021 11:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1622805282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vZ604evB8UvKqMbqBGnXK+NPs/ApQiJbXlCGRNPX3Og=;
 b=LMIIIP5mCnDPIZ46hB2NJ2II9CiAQFb8rsMvx2eh6W2OlMAsLL39RXdtUzpaloP+49B+bR
 WP8dCLhnA2ejUOMyd9vUXjOJfwObOPRlPVBy1U7hfgV69hs1FaB480/M5sQFW41zlYWs8e
 +J0PUdOV+lX19GEUVxcd5CgxHRtGO7E=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 20321A3B89;
 Fri,  4 Jun 2021 11:14:42 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri,  4 Jun 2021 12:14:32 +0100
Message-Id: <20210604111434.21422-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 0/2] Libclang based analyzer
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

V2:
* Consistently use singular form of 'check'
* Include missing clang-check.mk
* Add some more comments in main.c

Richard Palethorpe (2):
  Add 'make check' and clang-check to build system
  Start libclang based analyzer and TEST() check

 configure.ac                       |   2 +
 include/mk/clang-check.mk          |   9 ++
 include/mk/config.mk.in            |   5 +
 include/mk/env_post.mk             |   8 +
 include/mk/generic_leaf_target.inc |   5 +-
 include/mk/lib.mk                  |   3 +
 include/mk/rules.mk                |   9 ++
 include/mk/testcases.mk            |   1 +
 tools/clang-check/.gitignore       |   1 +
 tools/clang-check/Makefile         |  14 ++
 tools/clang-check/main.c           | 239 +++++++++++++++++++++++++++++
 11 files changed, 295 insertions(+), 1 deletion(-)
 create mode 100644 include/mk/clang-check.mk
 create mode 100644 tools/clang-check/.gitignore
 create mode 100644 tools/clang-check/Makefile
 create mode 100644 tools/clang-check/main.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
