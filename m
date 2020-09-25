Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDB5279123
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 20:51:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F5B83C4D19
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 20:51:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 017A73C2991
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 20:50:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 122091000A50
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 20:50:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AD6EAC97;
 Fri, 25 Sep 2020 18:50:39 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 25 Sep 2020 20:50:30 +0200
Message-Id: <20200925185034.24155-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/4] TPM 2.0 fixes in IMA tests
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

Hi,

v2 to fix bugs related to legacy ima_boot_aggregate:
* exit with TPASS to keep API happy
* add missing ! in algorithm condition
* missing -f $tpm_bios parameter
* reintroduce check for ima_boot_aggregate presence

Sorry for the noise

Kind regards,
Petr

diff --git testcases/kernel/security/integrity/ima/src/ima_boot_aggregate.c testcases/kernel/security/integrity/ima/src/ima_boot_aggregate.c
index 318d9c299..67f97ea04 100644
--- testcases/kernel/security/integrity/ima/src/ima_boot_aggregate.c
+++ testcases/kernel/security/integrity/ima/src/ima_boot_aggregate.c
@@ -117,8 +117,9 @@ static void do_test(void)
 	}
 	SHA1_Final(boot_aggregate, &c);
 
-	printf("boot_aggregate:");
+	printf("sha1:");
 	display_sha1_digest(boot_aggregate);
+	tst_res(TPASS, "found sha1 hash");
 }
 
 static struct tst_option options[] = {
diff --git testcases/kernel/security/integrity/ima/tests/ima_tpm.sh testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
index 300c96f64..78e81ed64 100755
--- testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
+++ testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
@@ -31,7 +31,7 @@ setup()
 
 	if ! check_evmctl $EVMCTL_REQUIRED; then
 		MISSING_EVMCTL=1
-		if [ "$ALGORITHM" = "sha1" ]; then
+		if [ "$ALGORITHM" != "sha1" ]; then
 			tst_brk TCONF "algorithm not sha1 ($ALGORITHM), $ERRMSG_EVMCTL"
 		fi
 	fi
@@ -159,7 +159,8 @@ test1()
 			tst_res TCONF "missing $tpm_bios, $ERRMSG_EVMCTL"
 			return
 		fi
-		cmd="ima_boot_aggregate"
+		tst_check_cmds ima_boot_aggregate || return
+		cmd="ima_boot_aggregate -f $tpm_bios"
 	fi
 	tst_res TINFO "using command: $cmd"
 

Petr Vorel (4):
  IMA: Move get_algorithm_digest(), set_digest_index() to ima_setup.sh
  IMA: Rewrite ima_boot_aggregate.c to new API
  ima_tpm.sh: Fix calculating boot aggregate
  ima_tpm.sh: Fix calculating PCR aggregate

 .../integrity/ima/src/ima_boot_aggregate.c    | 113 ++++-----
 .../integrity/ima/tests/ima_measurements.sh   |  62 +----
 .../security/integrity/ima/tests/ima_setup.sh |  70 +++++
 .../security/integrity/ima/tests/ima_tpm.sh   | 239 +++++++++++++-----
 4 files changed, 314 insertions(+), 170 deletions(-)

-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
