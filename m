Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 599EB2DA332
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 23:20:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20B3B3C3363
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 23:20:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3A99F3C2DE1
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 23:19:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BF26F600724
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 23:19:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9EFCFAC90;
 Mon, 14 Dec 2020 22:19:54 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 14 Dec 2020 23:19:43 +0100
Message-Id: <20201214221946.6340-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214221946.6340-1-pvorel@suse.cz>
References: <20201214221946.6340-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/4] IMA: Move get_algorithm_digest(),
 set_digest_index() to ima_setup.sh
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

To be reusable by more tests (preparation for next commit).

Call set_digest_index() inside get_algorithm_digest() if needed
instead of expecting get_algorithm_digest() caller to call
set_digest_index() before.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../integrity/ima/tests/ima_measurements.sh   | 62 ++--------------
 .../security/integrity/ima/tests/ima_setup.sh | 70 +++++++++++++++++++
 2 files changed, 76 insertions(+), 56 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh b/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
index 9a7500c76..1927e937c 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
@@ -6,7 +6,7 @@
 #
 # Verify that measurements are added to the measurement list based on policy.
 
-TST_NEEDS_CMDS="awk cut"
+TST_NEEDS_CMDS="awk cut sed"
 TST_SETUP="setup"
 TST_CNT=3
 TST_NEEDS_DEVICE=1
@@ -20,72 +20,22 @@ setup()
 	TEST_FILE="$PWD/test.txt"
 	POLICY="$IMA_DIR/policy"
 	[ -f "$POLICY" ] || tst_res TINFO "not using default policy"
-	DIGEST_INDEX=
-
-	local template="$(tail -1 $ASCII_MEASUREMENTS | cut -d' ' -f 3)"
-	local i
-
-	# parse digest index
-	# https://www.kernel.org/doc/html/latest/security/IMA-templates.html#use
-	case "$template" in
-	ima|ima-ng|ima-sig|ima-buf) DIGEST_INDEX=4 ;;
-	*)
-		# using ima_template_fmt kernel parameter
-		local IFS="|"
-		i=4
-		for word in $template; do
-			if [ "$word" = 'd' -o "$word" = 'd-ng' ]; then
-				DIGEST_INDEX=$i
-				break
-			fi
-			i=$((i+1))
-		done
-	esac
-
-	[ -z "$DIGEST_INDEX" ] && tst_brk TCONF \
-		"Cannot find digest index (template: '$template')"
 }
 
 ima_check()
 {
-	local delimiter=':'
-	local algorithm digest expected_digest line
+	local algorithm digest expected_digest line tmp
 
 	# need to read file to get updated $ASCII_MEASUREMENTS
 	cat $TEST_FILE > /dev/null
 
 	line="$(grep $TEST_FILE $ASCII_MEASUREMENTS | tail -1)"
-	if [ -z "$line" ]; then
-		tst_res TFAIL "cannot find measurement record for '$TEST_FILE'"
-		return
-	fi
-	tst_res TINFO "measurement record: '$line'"
 
-	digest=$(echo "$line" | cut -d' ' -f $DIGEST_INDEX)
-	if [ -z "$digest" ]; then
-		tst_res TFAIL "cannot find digest (index: $DIGEST_INDEX)"
-		return
-	fi
-
-	if [ "${digest#*$delimiter}" != "$digest" ]; then
-		algorithm=$(echo "$digest" | cut -d $delimiter -f 1)
-		digest=$(echo "$digest" | cut -d $delimiter -f 2)
+	if tmp=$(get_algorithm_digest "$line"); then
+		algorithm=$(echo "$tmp" | cut -d'|' -f1)
+		digest=$(echo "$tmp" | cut -d'|' -f2)
 	else
-		case "${#digest}" in
-		32) algorithm="md5" ;;
-		40) algorithm="sha1" ;;
-		*)
-			tst_res TFAIL "algorithm must be either md5 or sha1 (digest: '$digest')"
-			return ;;
-		esac
-	fi
-	if [ -z "$algorithm" ]; then
-		tst_res TFAIL "cannot find algorithm"
-		return
-	fi
-	if [ -z "$digest" ]; then
-		tst_res TFAIL "cannot find digest"
-		return
+		tst_res TBROK "failed to get algorithm/digest for '$TEST_FILE': $tmp"
 	fi
 
 	tst_res TINFO "computing digest for $algorithm algorithm"
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
index eb0087b27..dbf8a1db4 100644
--- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
@@ -191,6 +191,76 @@ ima_cleanup()
 	fi
 }
 
+set_digest_index()
+{
+	DIGEST_INDEX=
+
+	local template="$(tail -1 $ASCII_MEASUREMENTS | cut -d' ' -f 3)"
+	local i word
+
+	# parse digest index
+	# https://www.kernel.org/doc/html/latest/security/IMA-templates.html#use
+	case "$template" in
+	ima|ima-ng|ima-sig) DIGEST_INDEX=4 ;;
+	*)
+		# using ima_template_fmt kernel parameter
+		local IFS="|"
+		i=4
+		for word in $template; do
+			if [ "$word" = 'd' -o "$word" = 'd-ng' ]; then
+				DIGEST_INDEX=$i
+				break
+			fi
+			i=$((i+1))
+		done
+	esac
+
+	[ -z "$DIGEST_INDEX" ] && tst_brk TCONF \
+		"Cannot find digest index (template: '$template')"
+}
+
+get_algorithm_digest()
+{
+	local line="$1"
+	local delimiter=':'
+	local algorithm digest
+
+	if [ -z "$line" ]; then
+		echo "measurement record not found"
+		return 1
+	fi
+
+	[ -z "$DIGEST_INDEX" ] && set_digest_index
+	digest=$(echo "$line" | cut -d' ' -f $DIGEST_INDEX)
+	if [ -z "$digest" ]; then
+		echo "digest not found (index: $DIGEST_INDEX, line: '$line')"
+		return 1
+	fi
+
+	if [ "${digest#*$delimiter}" != "$digest" ]; then
+		algorithm=$(echo "$digest" | cut -d $delimiter -f 1)
+		digest=$(echo "$digest" | cut -d $delimiter -f 2)
+	else
+		case "${#digest}" in
+		32) algorithm="md5" ;;
+		40) algorithm="sha1" ;;
+		*)
+			echo "algorithm must be either md5 or sha1 (digest: '$digest')"
+			return 1 ;;
+		esac
+	fi
+	if [ -z "$algorithm" ]; then
+		echo "algorithm not found"
+		return 1
+	fi
+	if [ -z "$digest" ]; then
+		echo "digest not found"
+		return 1
+	fi
+
+	echo "$algorithm|$digest"
+}
+
 # loop device is needed to use only for tmpfs
 TMPDIR="${TMPDIR:-/tmp}"
 if [ "$(df -T $TMPDIR | tail -1 | awk '{print $2}')" != "tmpfs" -a -n "$TST_NEEDS_DEVICE" ]; then
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
