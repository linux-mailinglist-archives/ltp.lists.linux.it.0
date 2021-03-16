Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B5133D990
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 17:38:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CED3E3C63A2
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 17:38:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AFB1B3C2D51
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 17:38:04 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C163C14010E4
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 17:38:03 +0100 (CET)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3F1F920B26E1;
 Tue, 16 Mar 2021 09:38:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3F1F920B26E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1615912682;
 bh=w0cqsDXvCHPX80ntbzNsUuFLg66c7LGOjUFx00MPG24=;
 h=From:To:Cc:Subject:Date:From;
 b=r3xn8+N7IkMjsZcpXwRDhxkJbItFT4nAdMmy3deOK3IIth5rkF8Qc0mPebuXEqBpS
 OI4JJ+mEC63XRhtL7m3CuqvoTpUndh5oA2vWeYWZ8l8v+y7hI//ZYDRNpnYXcEe+Oq
 HL/EUFm9bIiq8QOLz4glafhGXLmXmNDLhwcxSDwY=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: pvorel@suse.cz,
	zohar@linux.ibm.com
Date: Tue, 16 Mar 2021 09:37:56 -0700
Message-Id: <20210316163756.7634-1-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3] IMA: Allow only ima-buf template for key
 measurement
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
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

ima-buf is the default IMA template used for all buffer measurements.
Therefore, IMA policy rule for measuring keys need not specify
an IMA template.  But if a template is specified for key measurement
rule then it must be only ima-buf.

Update keys tests to not require a template to be specified for
key measurement rule, but if a template is specified verify it is
only ima-buf.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
 .../ima/datafiles/ima_keys/keycheck.policy    |  3 ++-
 .../security/integrity/ima/tests/ima_keys.sh  | 20 ++++++++++++++++---
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/datafiles/ima_keys/keycheck.policy b/testcases/kernel/security/integrity/ima/datafiles/ima_keys/keycheck.policy
index 623162002..b6fa7f45a 100644
--- a/testcases/kernel/security/integrity/ima/datafiles/ima_keys/keycheck.policy
+++ b/testcases/kernel/security/integrity/ima/datafiles/ima_keys/keycheck.policy
@@ -1 +1,2 @@
-measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf
+measure func=KEY_CHECK keyrings=.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf
+measure func=KEY_CHECK keyrings=.ima|.evm
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index c9eef4b68..b9bef4feb 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -15,8 +15,7 @@ TST_CLEANUP=cleanup
 . ima_setup.sh
 
 FUNC_KEYCHECK='func=KEY_CHECK'
-TEMPLATE_BUF='template=ima-buf'
-REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK.*$TEMPLATE_BUF|$TEMPLATE_BUF.*$FUNC_KEYCHECK)"
+REQUIRED_POLICY="^measure.*$FUNC_KEYCHECK"
 
 setup()
 {
@@ -28,12 +27,23 @@ cleanup()
 	tst_is_num $KEYRING_ID && keyctl clear $KEYRING_ID
 }
 
+check_policy_template()
+{
+	while read line; do
+	if ( echo $line | grep -q 'template=') && ( ! echo $line | grep -q 'template=ima-buf' ); then
+		tst_res TCONF "only template=ima-buf can be specified for KEY_CHECK"
+		return 1
+	fi
+	done < $TST_TMPDIR/policy.txt
+	return 0
+}
+
 check_keys_policy()
 {
 	local pattern="$1"
 
 	if ! grep -E "$pattern" $TST_TMPDIR/policy.txt; then
-		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK, $TEMPLATE_BUF"
+		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK"
 		return 1
 	fi
 	return 0
@@ -49,6 +59,8 @@ test1()
 
 	tst_res TINFO "verify key measurement for keyrings and templates specified in IMA policy"
 
+	check_policy_template || return
+
 	check_keys_policy "$pattern" > $tmp_file || return
 	keycheck_lines=$(cat $tmp_file)
 	keyrings=$(for i in $keycheck_lines; do echo "$i" | grep "keyrings" | \
@@ -101,6 +113,8 @@ test2()
 
 	tst_res TINFO "verify measurement of certificate imported into a keyring"
 
+	check_policy_template || return
+
 	check_keys_policy "$pattern" >/dev/null || return
 
 	KEYRING_ID=$(keyctl newring $keyring_name @s) || \
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
