Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89884BD1E0
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 20:33:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 272323C20A2
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 20:33:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id BC8083C111E
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 20:33:31 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3964B1A00801
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 20:33:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97B7CAF1D;
 Tue, 24 Sep 2019 18:33:30 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 24 Sep 2019 20:33:25 +0200
Message-Id: <20190924183325.6143-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] doc: Add very simple library API writing guidelines
 docs
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
Hi,

this is rather kind of a bad joke than a serious patch.

Inspired by Christian patch, where he adds write-tests-for-shell-lib.txt.
I guess we need more high level docs, where content of his patch would
be added.

Feel free to write more useful docs than my stub.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1151766/

 doc/library-api-writing-guidelines.txt | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 doc/library-api-writing-guidelines.txt

diff --git a/doc/library-api-writing-guidelines.txt b/doc/library-api-writing-guidelines.txt
new file mode 100644
index 000000000..a238ee046
--- /dev/null
+++ b/doc/library-api-writing-guidelines.txt
@@ -0,0 +1,25 @@
+LTP Library API Writing Guidelines
+==================================
+
+1. General Rules
+----------------
+
+For extending library API it applies the same general rules as for writing tests
+(see test-writing-guidelines.txt), with strong focus on readability and simplicity.
+
+Library tests are in lib/newlib_tests directory.
+
+2. C API
+--------
+
+API source code is in headers include/*.h, include/lapi/*.h (backward compatibility)
+and C sources in lib/*.c. Files have tst_ prefix.
+
+3. Shell API
+------------
+
+API source code is in tst_test.sh, tst_security.sh and tst_net.sh
+(all in testcases/lib directory).
+
+Changes in the shell API should not introduce uncommon dependencies
+(use basic commands installed everywhere by default).
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
