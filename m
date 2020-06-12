Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9F71F79E7
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 16:39:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 962983C6119
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 16:39:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 542293C6101
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 16:38:51 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id AAABF1401B72
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 16:38:50 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 31BED20B711E;
 Fri, 12 Jun 2020 07:38:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 31BED20B711E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1591972729;
 bh=5WZ8nvboLoK+HtaXPpoUSQfFQrir5XjemXwQlzQORdo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a9AseU18PGpKQv/aNa06dLXbbop+Rrxb0jGd/ICMS76s0iozBr+MN3VhcwCwFDzA3
 uWlWjGJ17664LBYU4vkxKNhOx7j45s2TTuh8hEueLK/P1mOj3ErVEd+rAkxKnNvYIo
 WJy4G7d9L8/v1u7Ze+sZT3pmQjgVCQbIJWTJecd0=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	zohar@linux.ibm.com
Date: Fri, 12 Jun 2020 10:38:42 -0400
Message-Id: <20200612143842.3993-3-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200612143842.3993-1-t-josne@linux.microsoft.com>
References: <20200612143842.3993-1-t-josne@linux.microsoft.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] IMA: Add a test to verify importing a
 certificate into keyring
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.com,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add an IMA measurement test that verifies that an x509 certificate
can be imported into the .ima keyring and measured correctly.

Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
---
 .../security/integrity/ima/tests/ima_keys.sh  | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index f9c60a6fc..1eabb3e2e 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -5,10 +5,12 @@
 #
 # Verify that keys are measured correctly based on policy.
 
-TST_NEEDS_CMDS="awk cut xxd"
-TST_CNT=1
+TST_NEEDS_CMDS="awk cut xxd keyctl evmctl openssl cmp"
+TST_CNT=2
 TST_NEEDS_DEVICE=1
 
+CERT_FILE="${CERT_FILE:-}/etc/keys/x509_ima.der"
+
 . ima_setup.sh
 
 # Based on https://lkml.org/lkml/2019/12/13/564.
@@ -62,4 +64,43 @@ test1()
 	tst_res TPASS "specified keyrings were measured correctly"
 }
 
+
+# Test that a cert can be imported into the ".ima" keyring correctly.
+test2() {
+	local keyring_id key_id test_file="$PWD/test.txt"
+
+	[ -f $CERT_FILE ] || tst_brk TCONF "missing $CERT_FILE"
+
+	if ! openssl x509 -in $CERT_FILE -inform der > /dev/null; then
+		tst_brk TCONF "The suppled cert file ($CERT_FILE) is not a valid x509 certificate"
+	fi
+
+	tst_res TINFO "adding a cert to the .ima keyring ($CERT_FILE)"
+
+	keyring_id=$(keyctl show %:.ima | sed -n 2p | \
+		sed 's/^[[:space:]]*//' | cut -d' ' -f1) || \
+		tst_btk TCONF "unable to retrieve .ima keyring id"
+
+	if ! tst_is_num	"$keyring_id"; then
+		tst_brk TCONF "unable to parse keyring id from keyring"
+	fi
+
+	evmctl import $CERT_FILE "$keyring_id" > /dev/null || \
+		tst_brk TCONF "unable to import a cert into the .ima keyring"
+
+	grep -F ".ima" "$ASCII_MEASUREMENTS" | tail -n1 | cut -d' ' -f6 | \
+		xxd -r -p > $test_file || \
+		tst_brk TCONF "cert not found in ascii_runtime_measurements log"
+
+	if ! openssl x509 -in $test_file -inform der > /dev/null; then
+		tst_brk TCONF "The cert logged in ascii_runtime_measurements is not a valid x509 certificate"
+	fi
+
+	if cmp -s "$test_file" $CERT_FILE; then
+		tst_res TPASS "logged cert matches original cert"
+	else
+		tst_res TFAIL "logged cert does not match original cert"
+	fi
+}
+
 tst_run
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
