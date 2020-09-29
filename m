Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5161327D3E9
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 18:51:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DEB13C5F35
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 18:51:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B31EA3C2A65
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 18:50:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D641C1A00EE2
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 18:50:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D2C8B28B;
 Tue, 29 Sep 2020 16:50:27 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 29 Sep 2020 18:50:21 +0200
Message-Id: <20200929165021.11731-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929165021.11731-1-pvorel@suse.cz>
References: <20200929165021.11731-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/4] ima_tpm.sh: Fix calculating PCR aggregate
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
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

for TPM 2.0 and never or very old evmctl versions.

Because exporting PCR registers for TPM 2.0 has not been upstreamed [1],
we use user space code, which requires evmctl >= 1.3 and tsspcrread.
Using evmctl allows to test for TPM devices which does not export event
log (/sys/kernel/security/tpm0/binary_bios_measurements).

For TPM 1.2 read tpm0 device pcrs file from kernel. (tss1pcrread could
be also used, but it's not yet packaged by distros.)

For old kernels which use sha1, any evmctl version is required (evmctl
ima_measurement was introduced in very old v0.7, but newer sysctl path
/sys/class/tpm/tpm0/device/pcrs requires evmctl 1.1)

We now support output format of ima_measurement command for various
evmctl versions:
* 1.3: "sha256: TPM PCR-10:" (or other algorithm, e.g. "sha1")
* 1.1-1.2.1: "HW PCR-10:" (the only previously supported format)
* 0.7-1.0: "PCR-10:"
NOTE: we ignore evmctl failure, because evmctl < 1.1 fails with
"PCRAgg does not match PCR-10".

[1] https://patchwork.kernel.org/patch/11759729/

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v2->v3:
* grep for PCRAgg (compatible with older versions)
* do not check evmctl ima_measurement failure due "PCRAgg does not match
  PCR-10" on evmctl < 1.1
* require evmctl 1.1 for new /sys/class/tpm/tpm0/device/pcrs

Kind regards,
Petr

 .../security/integrity/ima/tests/ima_tpm.sh   | 128 ++++++++++++------
 1 file changed, 86 insertions(+), 42 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh b/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
index 7eb3a9409..b878467ed 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
@@ -14,6 +14,7 @@ TST_SETUP="setup"
 
 EVMCTL_REQUIRED='1.3'
 ERRMSG_EVMCTL="install evmctl >= $EVMCTL_REQUIRED"
+ERRMSG_TPM="TPM hardware support not enabled in kernel or no TPM chip found"
 
 setup()
 {
@@ -101,11 +102,72 @@ get_tpm_version()
 	fi
 }
 
+read_pcr_tpm1()
+{
+	local pcr_path="/sys/class/tpm/tpm0/device/pcrs"
+	local evmctl_required="1.1"
+	local pcr hash
+
+	if [ ! -f "$pcrs_path" ]; then
+		pcrs_path="/sys/class/misc/tpm0/device/pcrs"
+	else
+		check_evmctl $evmctl_required || \
+			tst_brk TCONF "evmctl >= $evmctl_required required"
+	fi
+
+	if [ ! -f "$pcr_path" ]; then
+		tst_brk TCONF "missing PCR file $pcrs_path ($ERRMSG_TPM)"
+	fi
+
+	while read line; do
+		pcr="$(echo $line | cut -d':' -f1)"
+		hash="$(echo $line | cut -d':' -f2 | awk '{ gsub (" ", "", $0); print tolower($0) }')"
+		echo "$pcr: $hash"
+	done < $pcr_path
+}
+
+# NOTE: TPM 1.2 would require to use tss1pcrread which is not fully adopted
+# by distros yet.
+read_pcr_tpm2()
+{
+	local pcrmax=23
+	local pcrread="tsspcrread -halg $ALGORITHM"
+	local i pcr
+
+	tst_check_cmds tsspcrread || return 1
+
+	for i in $(seq 0 $pcrmax); do
+		pcr=$($pcrread -ha "$i" -ns)
+		if [ $? -ne 0 ]; then
+			tst_brk TBROK "tsspcrread failed: $pcr"
+		fi
+		printf "PCR-%02d: %s\n" $i "$pcr"
+	done
+}
+
+get_pcr10_aggregate()
+{
+	local pcr
+
+	evmctl -v ima_measurement $BINARY_MEASUREMENTS > hash.txt 2>&1
+
+	pcr=$(grep -E "^($ALGORITHM: )*PCRAgg.*:" hash.txt \
+		| awk '{print $NF}')
+
+	if [ -z "$pcr" ]; then
+		tst_res TFAIL "evmctl failed to get aggregate PCR-10"
+		cat hash.txt >&2
+		return
+	fi
+
+	echo "$pcr"
+}
+
 test1_virtual_tpm()
 {
 	local zero=$(echo $DIGEST | awk '{gsub(/./, "0")}; {print}')
 
-	tst_res TINFO "TPM hardware support not enabled in kernel or no TPM chip found, testing TPM-bypass"
+	tst_res TINFO "$ERRMSG_TPM, testing TPM-bypass"
 
 	if [ "$DIGEST" = "$zero" ]; then
 		tst_res TPASS "bios boot aggregate is $zero"
@@ -151,57 +213,39 @@ test1()
 	[ -z "$TPM_VERSION" ] && test1_virtual_tpm || test1_hw_tpm
 }
 
-# Probably cleaner to programmatically read the PCR values directly
-# from the TPM, but that would require a TPM library. For now, use
-# the PCR values from /sys/devices.
-validate_pcr()
+test2()
 {
-	tst_res TINFO "verify PCR (Process Control Register)"
+	local hash pcr_aggregate
 
-	local dev_pcrs="$1"
-	local pcr hash aggregate_pcr
+	tst_res TINFO "verify PCR values"
 
-	aggregate_pcr="$(evmctl -v ima_measurement $BINARY_MEASUREMENTS 2>&1 | \
-		grep 'HW PCR-10:' | awk '{print $3}')"
-	if [ -z "$aggregate_pcr" ]; then
-		tst_res TFAIL "failed to get PCR-10"
-		return 1
+	if [ -z "$TPM_VERSION" ]; then
+		tst_brk TCONF "TMP version not detected ($ERRMSG_TPM)"
 	fi
 
-	while read line; do
-		pcr="$(echo $line | cut -d':' -f1)"
-		if [ "$pcr" = "PCR-10" ]; then
-			hash="$(echo $line | cut -d':' -f2 | awk '{ gsub (" ", "", $0); print tolower($0) }')"
-			[ "$hash" = "$aggregate_pcr" ]
-			return $?
-		fi
-	done < $dev_pcrs
-	return 1
-}
-
-test2()
-{
-	tst_res TINFO "verify PCR values"
-	tst_check_cmds evmctl || return
+	if [ "$ALGORITHM" = "sha1" ]; then
+		tst_check_cmds evmctl || return 1
+	fi
 
-	tst_res TINFO "evmctl version: $(evmctl --version)"
+	read_pcr_tpm$TPM_VERSION > pcr.txt
+	hash=$(grep "^PCR-10" pcr.txt | cut -d' ' -f2)
+	if [ -z "$hash" ]; then
+		tst_res TBROK "PCR-10 hash not found"
+		cat pcr.txt
+		return 1
+	fi
+	tst_res TINFO "real PCR-10: '$hash'"
 
-	local pcrs_path="/sys/class/tpm/tpm0/device/pcrs"
-	if [ -f "$pcrs_path" ]; then
-		tst_res TINFO "new PCRS path, evmctl >= 1.1 required"
-	else
-		pcrs_path="/sys/class/misc/tpm0/device/pcrs"
+	pcr_aggregate="$(get_pcr10_aggregate)"
+	if [ -z "$pcr_aggregate" ]; then
+		return
 	fi
+	tst_res TINFO "aggregate PCR-10: '$hash'"
 
-	if [ -f "$pcrs_path" ]; then
-		validate_pcr $pcrs_path
-		if [ $? -eq 0 ]; then
-			tst_res TPASS "aggregate PCR value matches real PCR value"
-		else
-			tst_res TFAIL "aggregate PCR value does not match real PCR value"
-		fi
+	if [ "$hash" = "$pcr_aggregate" ]; then
+		tst_res TPASS "aggregate PCR value matches real PCR value"
 	else
-		tst_res TCONF "TPM Hardware Support not enabled in kernel or no TPM chip found"
+		tst_res TFAIL "aggregate PCR value does not match real PCR value"
 	fi
 }
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
