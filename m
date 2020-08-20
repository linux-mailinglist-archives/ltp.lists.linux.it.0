Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0509824B1B9
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 11:09:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B39653C5817
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 11:09:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B4EC33C04C3
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 11:08:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6E99D1A00E3C
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 11:08:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFBB8B75C;
 Thu, 20 Aug 2020 09:09:04 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 20 Aug 2020 11:08:21 +0200
Message-Id: <20200820090824.3033-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820090824.3033-1-pvorel@suse.cz>
References: <20200820090824.3033-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [LTP v4 2/5] IMA/ima_keys.sh: Require template=ima-buf,
 fix grep pattern
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
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

test1 (and following test2 which will be added) require ima-buf template
which contains 'buf' identifier (the buffer data that was used to
generate the hash without size limitations). For simplicity we ignore
custom templates (ima_template_fmt kernel command line parameter), which
could also define it.

Also fix grep format for searching in the policy: add missing '.'
Searching for lines with specified templates *and* keyrings in the
measurement, but there is algorithm and hash in between, thus '.*'.
Previously template was just ignored due using just '*'.

Fixes: d2768c84e ("IMA: Add a test to verify measurement of keys")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New commit (maybe I should have split them into 2 commits).

 .../kernel/security/integrity/ima/tests/ima_keys.sh    | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index 53c289054..015a3c115 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -17,13 +17,15 @@ TST_NEEDS_DEVICE=1
 test1()
 {
 	local keyrings keycheck_lines keycheck_line templates
-	local pattern="func=KEY_CHECK"
+	local func='func=KEY_CHECK'
+	local buf='template=ima-buf'
+	local pattern="($func.*$buf|$buf.*$func)"
 	local test_file="file.txt"
 
 	tst_res TINFO "verifying key measurement for keyrings and templates specified in IMA policy file"
 
-	require_ima_policy_content "$pattern"
-	keycheck_lines=$(check_ima_policy_content "$pattern" "")
+	require_ima_policy_content "$pattern" '-Eq'
+	keycheck_lines=$(check_ima_policy_content "$pattern" '-E')
 	keycheck_line=$(echo "$keycheck_lines" | grep "keyrings" | head -n1)
 
 	if [ -z "$keycheck_line" ]; then
@@ -39,7 +41,7 @@ test1()
 	templates=$(echo "$keycheck_line" | tr " " "\n" | grep "template" | \
 		cut -d'=' -f2)
 
-	grep -E "($templates)*($keyrings)" $ASCII_MEASUREMENTS | while read line
+	grep -E "($templates).*($keyrings)" $ASCII_MEASUREMENTS | while read line
 	do
 		local digest expected_digest algorithm
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
