Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DA3D410E
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:25:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F25123C147F
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:25:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4B5103C1447
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:24:44 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0E746201189
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:24:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 425F1B560;
 Fri, 11 Oct 2019 13:24:43 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Oct 2019 15:24:30 +0200
Message-Id: <20191011132433.24197-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011132433.24197-1-pvorel@suse.cz>
References: <20191011132433.24197-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v5 5/8] shell: Introduce EXPECT_{FAIL,PASS}_BRK()
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
 doc/test-writing-guidelines.txt |  5 ++++-
 testcases/lib/tst_test.sh       | 34 +++++++++++++++++++++++++++++----
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 6da87baa7..722472800 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2428,7 +2428,7 @@ Note the '>' is escaped with '\', this causes that the '>' and filename are
 passed to the 'ROD' function as parameters and the 'ROD' function contains
 code to split '$@' on '>' and redirects the output to the file.
 
-EXPECT_PASS and EXPECT_FAIL
+EXPECT_PASS{,_BRK} and EXPECT_FAIL{,_BRK}
 +++++++++++++++++++++++++++
 
 [source,sh]
@@ -2443,6 +2443,9 @@ and 'tst_resm TFAIL' otherwise. 'EXPECT_FAIL' does vice versa.
 Output redirection rules are the same as for the 'ROD' function. In addition
 to that, 'EXPECT_FAIL' always redirects the command's stderr to '/dev/null'.
 
+There are also 'EXPECT_PASS_BRK' and 'EXPECT_FAIL_BRK', which works the same way
+except breaking a test when unexpected action happen.
+
 tst_kvcmp
 +++++++++
 
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index e0b24c6b9..6b9374b2b 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -139,27 +139,53 @@ ROD()
 	fi
 }
 
-EXPECT_PASS()
+_tst_expect_pass()
 {
+	local fnc="$1"
+	shift
+
 	tst_rod "$@"
 	if [ $? -eq 0 ]; then
 		tst_res TPASS "$@ passed as expected"
 	else
-		tst_res TFAIL "$@ failed unexpectedly"
+		$fnc TFAIL "$@ failed unexpectedly"
 	fi
 }
 
-EXPECT_FAIL()
+_tst_expect_fail()
 {
+	local fnc="$1"
+	shift
+
 	# redirect stderr since we expect the command to fail
 	tst_rod "$@" 2> /dev/null
 	if [ $? -ne 0 ]; then
 		tst_res TPASS "$@ failed as expected"
 	else
-		tst_res TFAIL "$@ passed unexpectedly"
+		$fnc TFAIL "$@ passed unexpectedly"
 	fi
 }
 
+EXPECT_PASS()
+{
+	_tst_expect_pass tst_res "$@"
+}
+
+EXPECT_PASS_BRK()
+{
+	_tst_expect_pass tst_brk "$@"
+}
+
+EXPECT_FAIL()
+{
+	_tst_expect_fail tst_res "$@"
+}
+
+EXPECT_FAIL_BRK()
+{
+	_tst_expect_fail tst_brk "$@"
+}
+
 TST_RETRY_FN_EXP_BACKOFF()
 {
 	local tst_fun="$1"
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
