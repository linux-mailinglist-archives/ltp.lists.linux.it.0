Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 010A833D675
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 16:06:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 813333C6431
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 16:06:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CD96A3C2D51
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 16:06:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 34ED660122E
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 16:06:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C28FAE89;
 Tue, 16 Mar 2021 15:06:06 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 16 Mar 2021 16:05:59 +0100
Message-Id: <20210316150600.16461-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] IMA: Move check_evmctl to setup,
 add require_evmctl()
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Helper functions can be reused in other tests.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../security/integrity/ima/tests/ima_setup.sh | 43 +++++++++++++++++++
 .../security/integrity/ima/tests/ima_tpm.sh   | 33 --------------
 2 files changed, 43 insertions(+), 33 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
index 59a7ffeac..565f0bc3e 100644
--- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
@@ -269,6 +269,49 @@ get_algorithm_digest()
 	echo "$algorithm|$digest"
 }
 
+# check_evmctl REQUIRED_TPM_VERSION
+# return: 0: evmctl is new enough, 1: version older than required (or version < v0.9)
+check_evmctl()
+{
+	local required="$1"
+
+	local r1="$(echo $required | cut -d. -f1)"
+	local r2="$(echo $required | cut -d. -f2)"
+	local r3="$(echo $required | cut -d. -f3)"
+	[ -z "$r3" ] && r3=0
+
+	tst_is_int "$r1" || tst_brk TBROK "required major version not int ($v1)"
+	tst_is_int "$r2" || tst_brk TBROK "required minor version not int ($v2)"
+	tst_is_int "$r3" || tst_brk TBROK "required patch version not int ($v3)"
+
+	tst_check_cmds evmctl || return 1
+
+	local v="$(evmctl --version | cut -d' ' -f2)"
+	[ -z "$v" ] && return 1
+	tst_res TINFO "evmctl version: $v"
+
+	local v1="$(echo $v | cut -d. -f1)"
+	local v2="$(echo $v | cut -d. -f2)"
+	local v3="$(echo $v | cut -d. -f3)"
+	[ -z "$v3" ] && v3=0
+
+	if [ $v1 -lt $r1 ] || [ $v1 -eq $r1 -a $v2 -lt $r2 ] || \
+		[ $v1 -eq $r1 -a $v2 -eq $r2 -a $v3 -lt $r3 ]; then
+		return 1
+	fi
+	return 0
+}
+
+# require_evmctl REQUIRED_TPM_VERSION
+require_evmctl()
+{
+	local required="$1"
+
+	if ! check_evmctl $required; then
+		tst_brk TCONF "evmctl >= $required required"
+	fi
+}
+
 # loop device is needed to use only for tmpfs
 TMPDIR="${TMPDIR:-/tmp}"
 if [ "$(df -T $TMPDIR | tail -1 | awk '{print $2}')" != "tmpfs" -a -n "$TST_NEEDS_DEVICE" ]; then
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh b/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
index 1cc34ddda..71083efd8 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
@@ -52,39 +52,6 @@ setup()
 	fi
 }
 
-# check_evmctl REQUIRED_TPM_VERSION
-# return: 0: evmctl is new enough, 1: version older than required (or version < v0.9)
-check_evmctl()
-{
-	local required="$1"
-
-	local r1="$(echo $required | cut -d. -f1)"
-	local r2="$(echo $required | cut -d. -f2)"
-	local r3="$(echo $required | cut -d. -f3)"
-	[ -z "$r3" ] && r3=0
-
-	tst_is_int "$r1" || tst_brk TBROK "required major version not int ($v1)"
-	tst_is_int "$r2" || tst_brk TBROK "required minor version not int ($v2)"
-	tst_is_int "$r3" || tst_brk TBROK "required patch version not int ($v3)"
-
-	tst_check_cmds evmctl || return 1
-
-	local v="$(evmctl --version | cut -d' ' -f2)"
-	[ -z "$v" ] && return 1
-	tst_res TINFO "evmctl version: $v"
-
-	local v1="$(echo $v | cut -d. -f1)"
-	local v2="$(echo $v | cut -d. -f2)"
-	local v3="$(echo $v | cut -d. -f3)"
-	[ -z "$v3" ] && v3=0
-
-	if [ $v1 -lt $r1 ] || [ $v1 -eq $r1 -a $v2 -lt $r2 ] || \
-		[ $v1 -eq $r1 -a $v2 -eq $r2 -a $v3 -lt $r3 ]; then
-		return 1
-	fi
-	return 0
-}
-
 # prints major version: 1: TPM 1.2, 2: TPM 2.0
 # or nothing on TPM-bypass (no TPM device)
 # WARNING: Detecting TPM 2.0 can fail due kernel not exporting TPM 2.0 files.
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
