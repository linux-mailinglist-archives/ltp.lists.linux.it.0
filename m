Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A66FDAD6
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 11:10:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05F0D3C2384
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 11:10:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C0C9A3C089F
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 11:10:54 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5546C6009E0
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 11:10:53 +0100 (CET)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id F25C29F8E1;
 Fri, 15 Nov 2019 10:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1573812652; bh=Fjryzszu8lLJK/dZRTxUYLbz/FgAAat/kpO7k0MbG28=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=iiimdiYA2HFq2LvzACKQZLd9/QppeWgmiE9gZSV2UtmrB+iVqUHQp3+dgMr8M0eYR
 svI9THzfsfHeyC0XaoBILTA7GbhzBzYthf5abXYMO2zaXiZMNuwfpPBgzfG4XKRq/D
 wkO2tDFNwl46hKu64zeijm9NDvaFpC78l72W8Mxs=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Fri, 15 Nov 2019 11:10:39 +0100
Message-Id: <20191115101039.43386-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] cpuset_regression_test: Fix for already existing
 cpusets
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

If there are already cpusets defined on the system, that use cpu 0-1,
the test fails, because it tries to exclusively use cpu 0-1 for the
testcase.

The fix sets the cpuset for all cgroups to 0 and disables exclusive
cpu usage for the duration of the test and restores it on cleanup.
For the test only cpu 1 is set as exclusive. This is enough to
trigger the bug this regression test was designed for.
This was tested by reverting the commit mentioned in the testcase.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../cpuset/cpuset_regression_test.sh          | 58 +++++++++++++++++--
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh b/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
index dccfd91cd..ed5e30f2a 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
@@ -26,6 +26,49 @@ TCID=cpuset_regression_test
 TST_TOTAL=1
 . test.sh
 
+# cpuset_backup_and_update <backup_dir> <what> <value>
+# Create backup of the values of a specific file (<what>)
+# in all cpuset groups and set the value to <value>
+# The backup is written to <backup_dir> in the same structure
+# as in the cpuset filesystem
+cpuset_backup_and_update()
+{
+	local backup_dir=$1
+	local what=$2
+	local value=$3
+	local old_dir=$(pwd)
+
+	cd ${root_cpuset_dir}
+	find . -mindepth 2 -name ${what} -print0 |
+	while IFS= read -r -d '' file; do
+		tst_resm TINFO "Backup ${file} ($(cat "${file}"))"
+		mkdir -p "$(dirname "${backup_dir}/${file}")"
+		cat "${file}" > "${backup_dir}/${file}"
+		echo "${value}" > "${file}"
+	done
+
+	cd ${old_dir}
+}
+
+# cpuset_restore <backup_dir> <what>
+# Restores the value of a file (<what>) in all cpuset
+# groups from the backup created by cpuset_backup_and_update
+cpuset_restore()
+{
+	local backup_dir=$1
+	local what=$2
+	local old_dir=$(pwd)
+
+	cd ${backup_dir}
+	find . -mindepth 2 -name ${what} -print0 |
+	while IFS= read -r -d '' file; do
+		tst_resm TINFO "Restore ${file} ($(cat "${file}"))"
+		cat "${file}" > "${root_cpuset_dir}/${file}"
+	done
+
+	cd ${old_dir}
+}
+
 setup()
 {
 	tst_require_root
@@ -69,6 +112,10 @@ setup()
 			       "do not exist."
 	fi
 
+	mkdir cpuset_backup
+	cpuset_backup_and_update "$(pwd)/cpuset_backup" ${cpu_exclusive} 0
+	cpuset_backup_and_update "$(pwd)/cpuset_backup" cpuset.cpus 0
+
 	cpu_exclusive_value=$(cat ${root_cpuset_dir}/${cpu_exclusive})
 	if [ "${cpu_exclusive_value}" != "1" ];then
 		echo 1 > ${root_cpuset_dir}/${cpu_exclusive}
@@ -86,6 +133,9 @@ cleanup()
 		rmdir ${root_cpuset_dir}/testdir
 	fi
 
+	cpuset_restore "$(pwd)/cpuset_backup" cpuset.cpus
+	cpuset_restore "$(pwd)/cpuset_backup" ${cpu_exclusive}
+
 	if [ "$cpu_exclusive_value" != 1 ]; then
 		# Need to flush, or may be output:
 		# "write error: Device or resource busy"
@@ -129,15 +179,15 @@ cpuset_test()
 	fi
 
 	# ${cpus} is empty at the begin, that maybe make the system *crash*.
-	echo 0-1 > ${root_cpuset_dir}/testdir/${cpus}
+	echo 1 > ${root_cpuset_dir}/testdir/${cpus}
 	if [ $? -ne 0 ]; then
-		tst_brkm TFAIL "'echo 0-1 >" \
+		tst_brkm TFAIL "'echo 1 >" \
 			       "${root_cpuset_dir}/testdir/${cpus}' failed"
 	fi
 
 	local cpus_value=$(cat ${root_cpuset_dir}/testdir/${cpus})
-	if [ "${cpus_value}" != "0-1" ]; then
-		tst_brkm TFAIL "${cpus} is '${cpus_value}', expected '0-1'"
+	if [ "${cpus_value}" != "1" ]; then
+		tst_brkm TFAIL "${cpus} is '${cpus_value}', expected '1'"
 	fi
 
 	tst_resm TPASS "Bug is not reproduced"
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
