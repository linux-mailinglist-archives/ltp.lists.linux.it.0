Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0AB20AA65
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 04:12:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEA663C58A6
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 04:11:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id EE29C3C58BB
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 04:11:38 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id F24E71400C41
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 04:11:37 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 97C8E20B718A;
 Thu, 25 Jun 2020 19:11:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 97C8E20B718A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1593137497;
 bh=sn8FdQjIOMioZR9R2z+dXET7OMv+mCCZiwiMjqrA8vQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AmdaRDnDANreCJClWVzuH4dGmGwYtv3e0XkFOFhsZbq5QsR8KtMb0TWa/HeBl0VVG
 jEiyBjsqQBbVCIzuTf8s6Kf7dQqr0NZzvlfB7YxMFDrWb6gGlY8oCs7XpUt+6yo0bW
 1oCYKGns886rvPsK6sKCoY4c3Lt+5EUyTNZjKhkc=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: zohar@linux.ibm.com, pvorel@suse.cz, nramas@linux.microsoft.com,
 ltp@lists.linux.it
Date: Thu, 25 Jun 2020 22:11:26 -0400
Message-Id: <20200626021126.56760-3-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626021126.56760-1-t-josne@linux.microsoft.com>
References: <20200626021126.56760-1-t-josne@linux.microsoft.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/2] IMA: Add a test to verify importing a
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
Cc: balajib@linux.microsoft.com, linux-integrity@vger.kernel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add an IMA measurement test that verifies that an x509 certificate
can be imported into the .ima keyring and measured correctly.

Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
---
 .../kernel/security/integrity/ima/README.md   | 22 ++++++++++
 .../security/integrity/ima/tests/ima_keys.sh  | 44 ++++++++++++++++++-
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/README.md b/testcases/kernel/security/integrity/ima/README.md
index 16a1f48c3..9e6790306 100644
--- a/testcases/kernel/security/integrity/ima/README.md
+++ b/testcases/kernel/security/integrity/ima/README.md
@@ -16,6 +16,28 @@ CONFIG_INTEGRITY=y
 CONFIG_IMA=y
 ```
 
+IMA Key Import test
+-------------
+`ima_keys.sh` requires an x509 certificate to be signed by a key on one
+of the trusted keyrings. The x509 certificate must be placed at
+`/etc/keys/x509_ima.der` for this test or the path must be passed in
+the CERT_FILE env var.
+
+The x509 public key key must be signed by the private key you generate.
+Follow these instructions:
+https://manpages.ubuntu.com/manpages/disco/man1/evmctl.1.html#generate%20trusted%20keys.
+
+The test cannot be set-up automatically because the x509 public key must be
+built into the kernel and loaded onto a trusted keyring.
+
+As well as what's required for the IMA tests, the following are also required
+in the kernel configuration:
+```
+CONFIG_IMA_READ_POLICY=y
+CONFIG_SYSTEM_TRUSTED_KEYRING=y
+CONFIG_SYSTEM_TRUSTED_KEYS="/etc/keys/ima-local-ca.pem"
+```
+
 EVM tests
 ---------
 
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index 94eb15e09..499881251 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -5,10 +5,12 @@
 #
 # Verify that keys are measured correctly based on policy.
 
-TST_NEEDS_CMDS="grep mktemp cut sed tr"
-TST_CNT=1
+TST_NEEDS_CMDS="grep mktemp cut sed tr xxd keyctl evmctl openssl cmp"
+TST_CNT=2
 TST_NEEDS_DEVICE=1
 
+CERT_FILE="${CERT_FILE:-/etc/keys/x509_ima.der}"
+
 . ima_setup.sh
 
 # Based on https://lkml.org/lkml/2019/12/13/564.
@@ -69,4 +71,42 @@ test1()
 	fi
 }
 
+
+# Test that a cert can be imported into the ".ima" keyring correctly.
+test2() {
+	local keyring_id key_id test_file="file.txt"
+
+	[ -f $CERT_FILE ] || tst_brk TCONF "missing $CERT_FILE"
+
+	if ! openssl x509 -in $CERT_FILE -inform der > /dev/null; then
+		tst_brk TCONF "The suppled cert file ($CERT_FILE) is not a valid x509 certificate"
+	fi
+
+	tst_res TINFO "adding a cert to the .ima keyring ($CERT_FILE)"
+	
+	keyring_id=$(keyctl describe %:.ima | cut -d' ' -f2 | tr -d ':') || \
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
