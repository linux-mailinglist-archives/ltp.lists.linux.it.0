Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1B932301E
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 19:00:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB8E33C60CA
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 19:00:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F30CF3C4C13
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 19:00:19 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 011C4200C35
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 19:00:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B9EBAC1D;
 Tue, 23 Feb 2021 18:00:18 +0000 (UTC)
Date: Tue, 23 Feb 2021 19:00:16 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <YDVCsNAfn+Ot6QIB@pevik>
References: <20210222023805.12846-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222023805.12846-1-nramas@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] IMA: Add test for selinux measurement
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
Cc: paul@paul-moore.com, selinux@vger.kernel.org,
 stephen.smalley.work@gmail.com, tusharsu@linux.microsoft.com,
 linux-integrity@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lakshmi,

> +++ b/testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
...
> +validate_policy_capabilities()
> +{
> +	local measured_cap measured_value expected_value
> +	local result=1
> +	local inx=7
> +
> +	# Policy capabilities flags start from "network_peer_controls"
> +	# in the measured SELinux state at offset 7 for 'awk'
> +	while [ $inx -lt 20 ]; do
> +		measured_cap=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
> +		inx=$(( $inx + 1 ))
> +
> +		measured_value=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
> +		expected_value=$(cat "$SELINUX_DIR/policy_capabilities/$measured_cap")
> +		if [ "$measured_value" != "$expected_value" ];then
> +			tst_res TWARN "$measured_cap: expected: $expected_value, got: $digest"
We rarely use TWARN in the tests, only when the error is not related to the test result.
Otherwise we use TFAIL.

The rest LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

I did few formatting and style changes:
https://github.com/pevik/ltp/commits/ima/selinux.v2.fixes
(branch ima/selinux.v2.fixes), see diff below.

As we discuss, I'm going tom merge test when patchset is merged in maintainers tree,
please ping me. And ideally we should mention kernel commit hash as a comment in
the test.

Thanks a lot!

Kind regards,
Petr

diff --git testcases/kernel/security/integrity/ima/tests/ima_selinux.sh testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
index e5060a5e3..ed758631b 100755
--- testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
+++ testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
@@ -13,16 +13,14 @@ TST_SETUP="setup"
 . ima_setup.sh
 
 FUNC_CRITICAL_DATA='func=CRITICAL_DATA'
-REQUIRED_POLICY="^measure.*($FUNC_CRITICAL_DATA)"
+REQUIRED_POLICY="^measure.*$FUNC_CRITICAL_DATA"
 
 setup()
 {
-	SELINUX_DIR=$(tst_get_selinux_dir)
-	if [ -z "$SELINUX_DIR" ]; then
-		tst_brk TCONF "SELinux is not enabled"
-		return
-	fi
+	tst_require_selinux_enabled
 	require_ima_policy_content "$REQUIRED_POLICY" '-E' > $TST_TMPDIR/policy.txt
+
+	SELINUX_DIR=$(tst_get_selinux_dir)
 }
 
 # Format of the measured SELinux state data.
@@ -41,16 +39,16 @@ validate_policy_capabilities()
 	# in the measured SELinux state at offset 7 for 'awk'
 	while [ $inx -lt 20 ]; do
 		measured_cap=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
-		inx=$(( $inx + 1 ))
+		inx=$(($inx + 1))
 
 		measured_value=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
 		expected_value=$(cat "$SELINUX_DIR/policy_capabilities/$measured_cap")
-		if [ "$measured_value" != "$expected_value" ];then
+		if [ "$measured_value" != "$expected_value" ]; then
 			tst_res TWARN "$measured_cap: expected: $expected_value, got: $digest"
 			result=0
 		fi
 
-		inx=$(( $inx + 1 ))
+		inx=$(($inx + 1))
 	done
 
 	return $result
@@ -109,7 +107,6 @@ test2()
 	local initialized_value
 	local enforced_value expected_enforced_value
 	local checkreqprot_value expected_checkreqprot_value
-	local result
 
 	tst_res TINFO "verifying SELinux state measurement"
 
@@ -149,27 +146,25 @@ test2()
 	measured_data=$(cat $state_file)
 	enforced_value=$(echo $measured_data | awk -F'[=;]' '{print $4}')
 	expected_enforced_value=$(cat $SELINUX_DIR/enforce)
-	if [ "$expected_enforced_value" != "$enforced_value" ];then
+	if [ "$expected_enforced_value" != "$enforced_value" ]; then
 		tst_res TFAIL "enforce: expected: $expected_enforced_value, got: $enforced_value"
 		return
 	fi
 
 	checkreqprot_value=$(echo $measured_data | awk -F'[=;]' '{print $6}')
 	expected_checkreqprot_value=$(cat $SELINUX_DIR/checkreqprot)
-	if [ "$expected_checkreqprot_value" != "$checkreqprot_value" ];then
+	if [ "$expected_checkreqprot_value" != "$checkreqprot_value" ]; then
 		tst_res TFAIL "checkreqprot: expected: $expected_checkreqprot_value, got: $checkreqprot_value"
 		return
 	fi
 
 	initialized_value=$(echo $measured_data | awk -F'[=;]' '{print $2}')
-	if [ "$initialized_value" != "1" ];then
+	if [ "$initialized_value" != "1" ]; then
 		tst_res TFAIL "initialized: expected 1, got: $initialized_value"
 		return
 	fi
 
-	validate_policy_capabilities $measured_data
-	result=$?
-	if [ $result = 0 ]; then
+	if validate_policy_capabilities $measured_data; then
 		tst_res TFAIL "policy capabilities did not match"
 		return
 	fi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
