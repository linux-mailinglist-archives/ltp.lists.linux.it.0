Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E40E23F3F8
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 22:47:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B7E73C31E5
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 22:47:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 644773C2334
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 22:47:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7E831140182E
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 22:47:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3252AC50;
 Fri,  7 Aug 2020 20:47:17 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  7 Aug 2020 22:46:49 +0200
Message-Id: <20200807204652.5928-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200807204652.5928-1-pvorel@suse.cz>
References: <20200807204652.5928-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] IMA/ima_keys.sh Fix policy content check usage
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
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

require_ima_policy_content cannot be used in subshell $() evaluation,
because tst_brk does not quit the test. It calls cleanup for the
subshell process and main process then continue:

ima_keys 1 TCONF: IMA policy does not specify 'func=KEY_CHECK'
=> Here it's running first cleanup. umount errors are because parent
shell process still has $PWD in directory to be unmounted:
umount: /tmp/LTP_ima_keys.0dIVrwJKIG/mntpoint: target is busy.
ima_keys 1 TINFO: umount(/dev/loop0) failed, try 1 ...
ima_keys 1 TINFO: Likely gvfsd-trash is probing newly mounted  fs, kill it to speed up tests.
umount: /tmp/LTP_ima_keys.0dIVrwJKIG/mntpoint: target is busy.
...
ima_keys 1 TINFO: umount(/dev/loop0) failed, try 50 ...
ima_keys 1 TINFO: Likely gvfsd-trash is probing newly mounted  fs, kill it to speed up tests.
ima_keys 1 TWARN: Failed to umount(/dev/loop0) after 50 retries
tst_device.c:222: WARN: ioctl(/dev/loop0, LOOP_CLR_FD, 0) no ENXIO for too long

Usage: tst_device acquire [size [filename]]
   or: tst_device release /path/to/device

ima_keys 1 TWARN: Failed to release device '/dev/loop0'
rm: cannot remove '/tmp/LTP_ima_keys.0dIVrwJKIG/mntpoint': Device or resource busy
ima_keys 1 TINFO: AppArmor enabled, this may affect test results
ima_keys 1 TINFO: it can be disabled with TST_DISABLE_APPARMOR=1 (requires super/root)
ima_keys 1 TINFO: loaded AppArmor profiles: none
/opt/ltp/testcases/bin/ima_keys.sh: line 25:  6166 Terminated              sleep $sec && tst_res TBROK "test killed, timeout! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill -9 -$pid  (wd: ~)

=> Here it should quit after running cleanup, but instead continue running:
ima_keys 1 TCONF: ima policy does not specify a keyrings to check

Fixes: f20f44d72 ("IMA/ima_keys.sh: Fix policy readability check")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Originally sent as
https://patchwork.ozlabs.org/project/ltp/patch/20200807112929.8984-1-pvorel@suse.cz/

 testcases/kernel/security/integrity/ima/tests/ima_keys.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index 3aea26056..53c289054 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -16,11 +16,14 @@ TST_NEEDS_DEVICE=1
 # (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
 test1()
 {
-	local keyrings keycheck_lines keycheck_line templates test_file="file.txt"
+	local keyrings keycheck_lines keycheck_line templates
+	local pattern="func=KEY_CHECK"
+	local test_file="file.txt"
 
 	tst_res TINFO "verifying key measurement for keyrings and templates specified in IMA policy file"
 
-	keycheck_lines=$(require_ima_policy_content "func=KEY_CHECK" "")
+	require_ima_policy_content "$pattern"
+	keycheck_lines=$(check_ima_policy_content "$pattern" "")
 	keycheck_line=$(echo "$keycheck_lines" | grep "keyrings" | head -n1)
 
 	if [ -z "$keycheck_line" ]; then
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
