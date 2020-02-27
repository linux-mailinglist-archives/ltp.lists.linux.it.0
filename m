Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F1617239D
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 17:40:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BBD53C25C6
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 17:40:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 08E423C24D6
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 17:39:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9CE106007A2
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 17:39:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1A552B388
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 16:39:29 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 17:39:21 +0100
Message-Id: <20200227163922.317-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227163922.317-1-pvorel@suse.cz>
References: <20200227163922.317-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] doc: Improve flags info
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/style-guide.txt             | 4 ++--
 doc/test-writing-guidelines.txt | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/doc/style-guide.txt b/doc/style-guide.txt
index b853fa8dc..55331c8d7 100644
--- a/doc/style-guide.txt
+++ b/doc/style-guide.txt
@@ -102,8 +102,8 @@ concerned about portability.
 7. Handle TBROK and TFAIL correctly
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Use +TBROK+ when an unexpected failure unrelated to the goal of the testcase
-occurred, and use +TFAIL+ when an unexpected failure related to the goal of
+Use +tst_brk(TBROK)+ when an unexpected failure unrelated to the goal of the testcase
+occurred, and use +tst_res(TFAIL)+ when an unexpected failure related to the goal of
 the testcase occurred.
 
 8. Don't roll your own syscall numbers
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 48fd06764..5f08e364e 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -421,6 +421,7 @@ Printf-like function to report test result, it's mostly used with ttype:
 | 'TPASS' | Test has passed.
 | 'TFAIL' | Test has failed.
 | 'TINFO' | General message.
+| 'TWARN' | Something went wrong but we decided to continue. Mostly used in cleanup functions.
 |==============================
 
 The 'ttype' can be combined bitwise with 'TERRNO' or 'TTERRNO' to print
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
