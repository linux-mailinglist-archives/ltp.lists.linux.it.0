Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E008A33EB94
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 09:33:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7AD13C2D45
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 09:33:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AD7FD3C2D0C
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 09:33:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 264B7600482
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 09:33:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65744AC1E;
 Wed, 17 Mar 2021 08:33:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 17 Mar 2021 09:33:47 +0100
Message-Id: <20210317083347.9791-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/1] doc: Add Maintainer Patch Review Checklist
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
 doc/maintainer-patch-review-checklist.txt | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 doc/maintainer-patch-review-checklist.txt

diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-patch-review-checklist.txt
new file mode 100644
index 000000000..cfe3918c1
--- /dev/null
+++ b/doc/maintainer-patch-review-checklist.txt
@@ -0,0 +1,32 @@
+# Maintainer Patch Review Checklist
+
+Patchset should be tested locally and ideally also in maintainer's fork in
+https://travis-ci.org/[Travis CI].
+
+Commit messages should have
+
+* author's `Signed-off-by` tag
+* committer's `Reviewed-by` or `Signed-off-by` tag
+* check also mailing lists for other reviewers / testers
+
+## New tests
+New test should have
+
+* record in runtest file
+* test run with more iteration (`-i 100`)
+
+### C tests
+* use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c[C API]
+* record in `.gitignore`
+* check coding style with `checkpatch.pl`
+(more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#131-c-coding-style[C coding style])
+* docparse documentation
+
+### Shell tests
+* use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#23-writing-a-testcase-in-shell[shell API]
+* check coding style with `checkbashism.pl`
+(more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#132-shell-coding-style[Shell coding style])
+
+## LTP library
+For patchset touching library please check also
+https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines[LTP Library API Writing Guidelines].
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
