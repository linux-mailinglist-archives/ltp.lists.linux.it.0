Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE84E340CB8
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 19:17:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CCEC3C7A3D
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 19:17:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 599D63C6069
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 19:16:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 31BCA601A92
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 19:16:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD45AAD71;
 Thu, 18 Mar 2021 18:16:54 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 18 Mar 2021 19:16:41 +0100
Message-Id: <20210318181641.2062-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318181641.2062-1-pvorel@suse.cz>
References: <20210318181641.2062-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] doc: Add Maintainer Patch Review Checklist
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
 doc/maintainer-patch-review-checklist.txt | 53 +++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 doc/maintainer-patch-review-checklist.txt

diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-patch-review-checklist.txt
new file mode 100644
index 000000000..2587287aa
--- /dev/null
+++ b/doc/maintainer-patch-review-checklist.txt
@@ -0,0 +1,53 @@
+# Maintainer Patch Review Checklist
+
+Patchset should be tested locally and ideally also in maintainer's fork in
+https://travis-ci.org/[Travis CI].
+
+NOTE: Travis does only build testing, passing the CI means only that the
+      test compiles fine on variety of different distributions and
+      releases.
+
+The test should be executed at least once locally and should PASS as well.
+
+Commit messages should have
+
+* Author's `Signed-off-by` tag
+* Committer's `Reviewed-by` or `Signed-off-by` tag
+* Check also mailing lists for other reviewers / testers
+* `Fixes: hash` if it fixes particular commit
+* `Fixes: #N` if it fixes N github issue, so it's automatically closed
+
+After patch is accepted or rejected, set correct state and archive in
+https://patchwork.ozlabs.org/project/ltp/list/[LTP patchwork instance].
+
+Also update LTP WIKI (git URL https://github.com/linux-test-project/ltp.wiki.git)
+if touch 'doc/*.txt'.
+
+## New tests
+New test should
+
+* Have a record in runtest file
+* Test should work fine with more than one iteration
+  (e.g. run with `-i 100`)
+* Have a brief description
+
+### C tests
+* Use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c[C API]
+* Test files are added into corresponding '.gitignore' files
+* Check coding style with
+  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl[checkpatch.pl]
+  (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#131-c-coding-style[C coding style])
+* Docparse documentation
+* If a test is a regression test it should include tags
+  (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2238-test-tags[Test tags])
+
+### Shell tests
+* Use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#23-writing-a-testcase-in-shell[shell API]
+* Check coding style with
+  https://salsa.debian.org/debian/devscripts/raw/master/scripts/checkbashisms.pl[checkbashism.pl]
+  (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#132-shell-coding-style[Shell coding style])
+* If a test is a regression test it should include related kernel or glibc commits as a comment
+
+## LTP library
+For patchset touching library please check also
+https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines[LTP Library API Writing Guidelines].
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
