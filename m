Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D620047A
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 10:56:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D29D3C2C64
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 10:56:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 81D703C1D1C
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 10:56:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B6A011000A20
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 10:56:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7279BAB3D;
 Fri, 19 Jun 2020 08:56:42 +0000 (UTC)
Date: Fri, 19 Jun 2020 10:56:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200619085637.GA9372@dell5510>
References: <20200612143842.3993-1-t-josne@linux.microsoft.com>
 <20200612143842.3993-2-t-josne@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612143842.3993-2-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] IMA: Add a test to verify measurment of
 keys
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: zohar@linux.ibm.com, ltp@lists.linux.it, linux-integrity@vger.kernel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lachlan,

...
> +	keycheck_line=$(grep "func=KEY_CHECK" $IMA_POLICY)
> +	if [ -z "$keycheck_line" ]; then
> +		tst_brk TCONF "ima policy does not specify \"func=KEY_CHECK\""
> +	fi
> +
> +	if echo "$keycheck_line" | grep -q "*keyrings*"; then
I guess "*keyrings*" as grep parameter is wrong. * for regexp should be .*
If you meant to grep for keyrings, it should be:
if ! echo "$keycheck_line" | grep -q "keyrings"; then
	tst_brk TCONF "ima policy does not specify a keyrings to check"
fi

Few more changes (mostly nits), is that ok for you?

Kind regards,
Petr

diff --git testcases/kernel/security/integrity/ima/README.md testcases/kernel/security/integrity/ima/README.md
index 16a1f48c3..66d0f5308 100644
--- testcases/kernel/security/integrity/ima/README.md
+++ testcases/kernel/security/integrity/ima/README.md
@@ -16,6 +16,24 @@ CONFIG_INTEGRITY=y
 CONFIG_IMA=y
 ```
 
+IMA Key Import tests
+~~~~~~~~~~~~~~~~~~~~
+
+`ima_keys.sh` requires a x509 public key, by default in `/etc/keys/x509_ima.der`.
+The key must be signed by the private key you generate. Follow these instructions:
+https://manpages.ubuntu.com/manpages/disco/man1/evmctl.1.html#generate%20trusted%20keys.
+
+The test cannot be set-up automatically because the kernel must be built
+with one of the keys you generate.
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
 
diff --git testcases/kernel/security/integrity/ima/tests/ima_keys.sh testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index 2b5324dbf..398ee141c 100755
--- testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -5,17 +5,18 @@
 #
 # Verify that keys are measured correctly based on policy.
 
-TST_NEEDS_CMDS="grep mktemp cut sed tr"
+TST_NEEDS_CMDS="cut grep sed tr xxd"
 TST_CNT=1
 TST_NEEDS_DEVICE=1
 
 . ima_setup.sh
 
-# Based on https://lkml.org/lkml/2019/12/13/564.
+# Based on https://lkml.org/lkml/2019/12/13/564
 # (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
 test1()
 {
-	local keyrings keycheck_line templates test_file=$(mktemp)
+	local err keycheck_line keyrings line templates
+	local test_file="file.txt"
 
 	tst_res TINFO "verifying key measurement for keyrings and templates specified in IMA policy file"
 
@@ -28,7 +29,7 @@ test1()
 		tst_brk TCONF "ima policy does not specify \"func=KEY_CHECK\""
 	fi
 
-	if echo "$keycheck_line" | grep -q "*keyrings*"; then
+	if ! echo "$keycheck_line" | grep -q "keyrings"; then
 		tst_brk TCONF "ima policy does not specify a keyrings to check"
 	fi
 
@@ -41,12 +42,12 @@ test1()
 	templates=$(echo "$keycheck_line" | tr " " "\n" | grep "template" | \
 		cut -d'=' -f2)
 
-	grep -E "($templates)*($keyrings)" $ASCII_MEASUREMENTS | while read line
+	grep -E "($templates)*$keyrings" $ASCII_MEASUREMENTS | while read line
 	do
-		local digest expected_digest algorithm
+		local algorithm digest expected_digest keyring
 
-		digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
 		algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
+		digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
 		keyring=$(echo "$line" | cut -d' ' -f5)
 
 		echo "$line" | cut -d' ' -f6 | xxd -r -p > $test_file
@@ -56,12 +57,12 @@ test1()
 
 		if [ "$digest" != "$expected_digest" ]; then
 			tst_res TFAIL "incorrect digest was found for the ($keyring) keyring"
+			err=1
 		fi
 	done
 
-	rm $test_file
-
-	tst_res TPASS "specified keyrings were measured correctly"
+	[ -z "$err" ] && \
+		tst_res TPASS "specified keyrings were measured correctly"
 }
 
 tst_run

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
