Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ED5320F74
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 03:35:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C84E3C61A4
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 03:35:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7B8FE3C3236
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 03:35:47 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id AC41D60072B
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 03:35:46 +0100 (CET)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id A37DD20B6C40;
 Sun, 21 Feb 2021 18:35:44 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A37DD20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613961344;
 bh=LkWB75n09GiV7ZOI8kEIlFzc10vE1kUc2HXSUsQPCEc=;
 h=From:To:Cc:Subject:Date:From;
 b=LPs2CBrJ5SzLFG9t71KqMUUZo7rW7Lq9x+zAAVVHgo8vgUwg16x73i4FX4HitreXT
 8GEsg5XMvV8P/hVnN6mcwjbu3z4P1UyxCVzhp73Lsi+mzIDgMMKppqAns2wJ2pMC+J
 2TXD/EUhiK0Rjrnpfofp83T576Da8CpPmARBue3s=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: pvorel@suse.cz,
	zohar@linux.ibm.com
Date: Sun, 21 Feb 2021 18:34:21 -0800
Message-Id: <20210222023421.12576-1-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] IMA: Check for ima-buf template is not required for
 keys tests
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
an IMA template.

Update keys tests to not check for ima template in the policy rule.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
This patch is based
in https://github.com/pevik/ltp/commits/ima/selinux.v2.draft
in branch ima/selinux.v2.draft.

 testcases/kernel/security/integrity/ima/tests/ima_keys.sh | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index c9eef4b68..a3a7afbf7 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -15,8 +15,7 @@ TST_CLEANUP=cleanup
 . ima_setup.sh
 
 FUNC_KEYCHECK='func=KEY_CHECK'
-TEMPLATE_BUF='template=ima-buf'
-REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK.*$TEMPLATE_BUF|$TEMPLATE_BUF.*$FUNC_KEYCHECK)"
+REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK)"
 
 setup()
 {
@@ -33,7 +32,7 @@ check_keys_policy()
 	local pattern="$1"
 
 	if ! grep -E "$pattern" $TST_TMPDIR/policy.txt; then
-		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK, $TEMPLATE_BUF"
+		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK"
 		return 1
 	fi
 	return 0
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
