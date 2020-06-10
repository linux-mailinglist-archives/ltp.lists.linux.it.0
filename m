Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5046C1F599E
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 19:02:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 119E03C61B4
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 19:02:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 6762B3C2E1A
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 19:01:44 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id BD9411400F99
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 19:01:43 +0200 (CEST)
Received: by linux.microsoft.com (Postfix, from userid 1066)
 id 88CF620B71CC; Wed, 10 Jun 2020 10:01:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 88CF620B71CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1591808501;
 bh=D1wH1dK8bNPhiuEReUqysKhlwE/xussjWlR2j7MN71c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qm/JAsjiOas+sAhE/RT9H1QcoyBm6nm/IECJpdCRiIoBJhdS/S6Dlo6U7dRmYde6O
 zaR46+fy/fmLB67LTtkt0w31dhdpvkVIL1Zy28guFYgNV9szayJVDUM4a9VAp7fNaC
 9pWvb3kW64IRRhF0V1JSE7lqSltgth6yrMajaIgc=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	zohar@linux.ibm.com
Date: Wed, 10 Jun 2020 10:01:23 -0700
Message-Id: <1591808483-22040-2-git-send-email-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591808483-22040-1-git-send-email-t-josne@linux.microsoft.com>
References: <1591808483-22040-1-git-send-email-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] IMA: Add a test to verify importing a certificate
 into keyring
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add an IMA measurement test that verifies that an x509 certificate
can be imported into the .ima keyring and measured correctly.

Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
---
 .../security/integrity/ima/tests/ima_keys.sh  | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index 1b0dd0aed..6904fabfa 100644
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -7,7 +7,7 @@
 
 TST_NEEDS_CMDS="awk cut"
 TST_SETUP="setup"
-TST_CNT=1
+TST_CNT=2
 TST_NEEDS_DEVICE=1
 
 . ima_setup.sh
@@ -69,4 +69,46 @@ $(echo "$line" | cut -d' ' -f5) keyring"
 	tst_res TPASS "specified keyrings were measured correctly"
 }
 
+
+# Test that a cert can be imported into the ".ima" keyring correctly.
+test2() {
+	local keyring_id key_id
+	CERT_FILE="/etc/keys/x509_ima.der" # Default
+
+	[ -f $CERT_FILE ] || tst_brk TCONF "missing $CERT_FILE"
+
+	if ! openssl x509 -in $CERT_FILE -inform der > /dev/null; then
+		tst_brk TCONF "The suppled cert file ($CERT_FILE) is not \
+a valid x509 certificate"
+	fi
+
+	tst_res TINFO "adding a cert to the \".ima\" keyring ($CERT_FILE)"
+
+	keyring_id=$(sudo keyctl show %:.ima | sed -n 2p | \
+		sed 's/^[[:space:]]*//' | cut -d' ' -f1) || \
+		tst_btk TCONF "unable to retrieve .ima keyring id"
+
+	if ! tst_is_num	"$keyring_id"; then
+		tst_brk TCONF "unable to parse keyring id from keyring"
+	fi
+
+	sudo evmctl import $CERT_FILE "$keyring_id" > /dev/null || \
+		tst_brk TCONF "unable to import a cert into the .ima keyring"
+
+	grep -F ".ima" "$ASCII_MEASUREMENTS" | tail -n1 | cut -d' ' -f6 | \
+		xxd -r -p > $TEST_FILE || \
+		tst_brk TCONF "cert not found in ascii_runtime_measurements log"
+
+	if ! openssl x509 -in $TEST_FILE -inform der > /dev/null; then
+		tst_brk TCONF "The cert logged in ascii_runtime_measurements \
+($CERT_FILE) is not a valid x509 certificate"
+	fi
+
+	if cmp -s "$TEST_FILE" $CERT_FILE; then
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
