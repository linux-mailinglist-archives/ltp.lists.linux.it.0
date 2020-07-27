Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F6422FC2A
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 00:30:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8739E3C26CD
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 00:30:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2B5DA3C0488
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 00:30:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AE1F21A0110D
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 00:30:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47999AEB6;
 Mon, 27 Jul 2020 22:31:02 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 28 Jul 2020 00:30:39 +0200
Message-Id: <20200727223041.13110-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727223041.13110-1-pvorel@suse.cz>
References: <20200727223041.13110-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v5 2/4] IMA: Add policy related helpers
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 balajib@linux.microsoft.com, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v5.

 .../security/integrity/ima/tests/ima_setup.sh | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
index 975ce9cbb..c46f273ab 100644
--- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
@@ -54,6 +54,45 @@ compute_digest()
 	return 1
 }
 
+check_policy_readable()
+{
+	if [ -f $IMA_POLICY ]; then
+		tst_res TINFO "missing $IMA_POLICY (reboot or CONFIG_IMA_WRITE_POLICY=y required)"
+		return 1
+	fi
+	cat $IMA_POLICY > /dev/null 2>/dev/null
+}
+
+require_policy_readable()
+{
+	if [ -f $IMA_POLICY ]; then
+		tst_brk TCONF "missing $IMA_POLICY (reboot or CONFIG_IMA_WRITE_POLICY=y required)"
+	fi
+	if ! check_policy_readable; then
+		tst_brk TCONF "cannot read IMA policy (CONFIG_IMA_READ_POLICY=y required)"
+	fi
+}
+
+check_ima_policy_content()
+{
+	local pattern="$1"
+	local grep_params="${2--q}"
+
+	check_policy_readable || return 1
+	grep $grep_params "$pattern" $IMA_POLICY
+}
+
+require_ima_policy_content()
+{
+	local pattern="$1"
+	local grep_params="${2--q}"
+
+	require_policy_readable
+	if ! grep $grep_params "$pattern" $IMA_POLICY; then
+		tst_brk TCONF "IMA policy does not specify '$pattern'"
+	fi
+}
+
 require_ima_policy_cmdline()
 {
 	local policy="$1"
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
