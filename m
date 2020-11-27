Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 087C92C696D
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 17:31:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6B9A3C6C28
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 17:31:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 958913C5DEA
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 17:30:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 88CC91001445
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 17:30:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA8CCAD0B
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 16:30:57 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Nov 2020 17:31:48 +0100
Message-Id: <20201127163150.22903-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] First step in formalizing the test library
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

This is partly motivated by the issue #462 where we ended up with a
loose corer cases that are not well defined.

So as a first step this patches:

- Do fix old problem with TBROK propagation

- Start a library description that hopefully captures
  so-far unwritten desing decisions and rules

Cyril Hrubis (2):
  lib: tst_test.c: Add TBROK counter.
  lib: Add test library design document

 lib/README.md               | 130 ++++++++++++++++++++++++++++++++++++
 lib/newlib_tests/.gitignore |   1 +
 lib/newlib_tests/test22.c   |  34 ++++++++++
 lib/tst_test.c              |  13 +++-
 4 files changed, 176 insertions(+), 2 deletions(-)
 create mode 100644 lib/README.md
 create mode 100644 lib/newlib_tests/test22.c

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
