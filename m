Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE41181A7
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:04:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9FD33C22CB
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:04:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 38C2F3C17A1
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:04:26 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 44A4614012D6
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:04:26 +0100 (CET)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id AA5E79F7F0
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 08:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1575965064; bh=450iD61qPB2lP4yMNY3VcYWEVSikFYbGDVDc8wOfse0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=ZQCNaqcW/GKDmM1+WjTrgzf8yOZQ3eNO339lspSPApioSxBOpcRlKgsLSHRc7TEFm
 g8+X4CwLFAajBytpo325vXwstnP1btYFWQsLC7fH8XcSU637CRAoDrlNHprubxrh0e
 VY3hGElAkIyYpkj7YSU6V7cARUIr76s5EWaR9M1M=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Tue, 10 Dec 2019 09:04:16 +0100
Message-Id: <20191210080419.128773-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4] lsmod01: Add kernel module
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

Now that the naming debate for tst_needs vs. tst_require is done, I post the patch,
that started all of it again.

This patch adds a dummy module to lsmod01, to make the test run successfully,
if no modules are loaded at the time of test execution.

To have no impact on the test requirements, when modules are already loaded,
the root test and module search has to be done conditionally.
Therefor the library had to be extended/modified to add tst_require_root
and tst_require_module.


 doc/test-writing-guidelines.txt        |  6 ++++-
 testcases/commands/.gitignore          |  1 +
 testcases/commands/lsmod/Makefile      | 15 ++++++++++++
 testcases/commands/lsmod/lsmod01.sh    | 33 ++++++++++++++++++++++++++
 testcases/commands/lsmod/ltp_lsmod01.c | 28 ++++++++++++++++++++++
 testcases/lib/tst_net.sh               | 12 ++--------
 testcases/lib/tst_security.sh          |  4 ++--
 testcases/lib/tst_test.sh              | 43 +++++++++++++++++++---------------
 8 files changed, 110 insertions(+), 32 deletions(-)




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
