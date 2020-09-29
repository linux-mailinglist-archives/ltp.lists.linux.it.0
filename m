Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B334627C2F8
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 12:58:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 773DC3C2A93
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 12:58:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 884503C2824
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 12:58:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 24A02600702
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 12:58:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 745D8AFF9
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 10:58:32 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 29 Sep 2020 12:58:23 +0200
Message-Id: <20200929105824.28793-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] doc/user-guide: Shorten the description
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
 doc/user-guide.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/doc/user-guide.txt b/doc/user-guide.txt
index 13865bc88..5cb8322cf 100644
--- a/doc/user-guide.txt
+++ b/doc/user-guide.txt
@@ -1,7 +1,7 @@
 LTP User Guidelines
 ===================
 
-For compiling and installing and running the tests see `README.md`.
+For compiling, installing and running the tests see `README.md`.
 For running LTP network tests see `testcases/network/README.md`.
 
 1. Library environment variables
@@ -18,8 +18,8 @@ For running LTP network tests see `testcases/network/README.md`.
                           Variable is also used in shell tests, but ceiled to int.
 | 'PATH'                | It's required to addjust path:
                           `PATH="$PATH:$LTPROOT/testcases/bin"`
-| 'TMPDIR'              | Base directory for template directory, which is required by C tests
-                          `tst_test->needs_tmpdir=1` (or others) or shell 'TST_NEEDS_TMPDIR=1').
+| 'TMPDIR'              | Base directory for template directory (C: '.needs_tmpdir = 1'
+                          and others, which imply it, shell: 'TST_NEEDS_TMPDIR=1').
 | 'TST_NO_CLEANUP'      | Disable running test cleanup (defined in 'TST_CLEANUP').
 |==============================================================================
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
