Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A1D3CCD
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:55:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 232993C1814
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:55:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 364913C1452
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:54:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 742B4600D20
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:53:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4C00BADDD;
 Fri, 11 Oct 2019 09:54:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Oct 2019 11:54:37 +0200
Message-Id: <20191011095442.10541-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/5] shell: Introduce TST_TIMEOUT variable
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

Hi,

hopefully the latest version.

Changes v4->v5:
* remove float related code (left from v3)
* remove "tst_test_cmds cut" check from tst_test.sh (there is check for
cut and other later => it should be probably removed as well, but as a
separate patch) (Cyril)
* remove unneeded IFS from test (Cyril)
* mention ceiling LTP_TIMEOUT_MUL in doc/user-guide.txt

Here is the diff:
diff --git doc/user-guide.txt doc/user-guide.txt
index 8913c3221..7f6334ec2 100644
--- doc/user-guide.txt
+++ doc/user-guide.txt
@@ -15,7 +15,7 @@ For running LTP network tests see `testcases/network/README.md`.
                           'n' or '0': never colorize.
 | 'LTP_TIMEOUT_MUL'     | Multiply timeout, must be number >= 1 (> 1 is useful for
                           slow machines to avoid unexpected timeout).
-                          Variable is also used in shell tests.
+                          Variable is also used in shell tests, but here ceiled to int.
 | 'PATH'                | It's required to addjust path:
                           `PATH="$PATH:$LTPROOT/testcases/bin"`
 | 'TMPDIR'              | Base directory for template directory, which is required by C tests
diff --git lib/newlib_tests/shell/test_timeout.sh lib/newlib_tests/shell/test_timeout.sh
index 7e296f9e9..2cbc66412 100755
--- lib/newlib_tests/shell/test_timeout.sh
+++ lib/newlib_tests/shell/test_timeout.sh
@@ -15,8 +15,6 @@ echo "Testing timeout in shell API"
 echo
 
 failed=0
-IFS="
-"
 for i in $DATA; do
 	file=$(echo $i | cut -d'|' -f1)
 	timeout=$(echo $i | cut -d'|' -f2)
diff --git testcases/lib/tst_test.sh testcases/lib/tst_test.sh
index 977ffd97e..8713c1cdd 100644
--- testcases/lib/tst_test.sh
+++ testcases/lib/tst_test.sh
@@ -392,7 +392,6 @@ _tst_setup_timer()
 	tst_is_num "$LTP_TIMEOUT_MUL" || tst_brk TCONF "$err ($LTP_TIMEOUT_MUL)"
 
 	if ! tst_is_int "$LTP_TIMEOUT_MUL"; then
-		tst_test_cmds cut
 		LTP_TIMEOUT_MUL=$(echo "$LTP_TIMEOUT_MUL" | cut -d. -f1)
 		LTP_TIMEOUT_MUL=$((LTP_TIMEOUT_MUL+1))
 		tst_res TINFO "ceiling LTP_TIMEOUT_MUL to $LTP_TIMEOUT_MUL"
@@ -403,13 +402,7 @@ _tst_setup_timer()
 		tst_brk TBROK "TST_TIMEOUT must be int >= 1! ($TST_TIMEOUT)"
 	fi
 
-	local sec
-	if [ "$is_float" ]; then
-		sec=`echo | awk '{printf("%d\n", '$TST_TIMEOUT' * '$LTP_TIMEOUT_MUL'+ 0.5)}'`
-	else
-		sec=$((TST_TIMEOUT * LTP_TIMEOUT_MUL))
-	fi
-
+	local sec=$((TST_TIMEOUT * LTP_TIMEOUT_MUL))
 	local h=$((sec / 3600))
 	local m=$((sec / 60 % 60))
 	local s=$((sec % 60))


Petr Vorel (5):
  shell: Add tst_is_num()
  shell: Introduce TST_TIMEOUT variable, add checks
  shell: Add timeout shell API tests
  memcg_stress_test.sh: use TST_TIMEOUT (replace LTP_TIMEOUT_MUL)
  net/if-mtu-change.sh: set TST_TIMEOUT

 doc/test-writing-guidelines.txt               | 14 ++++++--
 doc/user-guide.txt                            |  2 +-
 lib/newlib_tests/shell/test_timeout.sh        | 36 +++++++++++++++++++
 lib/newlib_tests/shell/timeout01.sh           | 13 +++++++
 lib/newlib_tests/shell/timeout02.sh           | 13 +++++++
 .../memcg/stress/memcg_stress_test.sh         |  2 +-
 testcases/lib/tst_test.sh                     | 32 +++++++++++++++--
 .../network/stress/interface/if-mtu-change.sh |  4 ++-
 8 files changed, 108 insertions(+), 8 deletions(-)
 create mode 100755 lib/newlib_tests/shell/test_timeout.sh
 create mode 100755 lib/newlib_tests/shell/timeout01.sh
 create mode 100755 lib/newlib_tests/shell/timeout02.sh

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
