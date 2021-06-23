Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1648F3B1474
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 09:16:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A306C3C6FD5
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 09:16:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E80E33C8E3B
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 09:16:01 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 845D6200C36
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 09:16:00 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 0E3BA9F7F3;
 Wed, 23 Jun 2021 07:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1624432559; bh=bwWkaJnd4mipAtFTrkU9LZOIYx7Yt5Z2KRZJaqxxK/0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=dy+yoxB49OMcMH3lpFl6cDlXJpPM/jacktPx2cxtfKYrahu5mF1VjUo+6nXR3yIAA
 eQ1AfLN3GQ68VHyq5dIwFhq0+kfGX48y/0HLYd01PigO0e0QX5BBIUhd2BpOcCcY6+
 9Pd4QMwrkO/8ehIo9em7iRqkxH4qyWpiz6rhJSag=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	rpalethorpe@suse.com
Date: Wed, 23 Jun 2021 09:15:40 +0200
Message-Id: <20210623071543.171021-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623071543.171021-1-lkml@jv-coder.de>
References: <20210623071543.171021-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/3] cpuset_regression_test: Convert to new api
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

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../cpuset/cpuset_regression_test.sh          | 147 +++++++-----------
 1 file changed, 56 insertions(+), 91 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh b/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
index dccfd91cd..1dda19704 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
@@ -1,82 +1,65 @@
 #!/bin/sh
-#
+# SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2015 Fujitsu Ltd.
 # Author: Zeng Linggang <zenglg.jy@cn.fujitsu.com>
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-#
 # This is a regression test for commit:
-# http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/
-# ?id=bb2bc55
+# http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=bb2bc55
 #
+# A newly created cpuset group crashed the kernel, if exclusive was set to 1,
+# before a cpuset was set.
+
+TST_SETUP=setup
+TST_CLEANUP=cleanup
+TST_TESTFUNC=test
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
+TST_MIN_KVER="3.18"
+
+. cgroup_lib.sh
+
+LOCAL_MOUNTPOINT="cpuset_test"
 
-TCID=cpuset_regression_test
-TST_TOTAL=1
-. test.sh
+root_cpuset_dir=
+cpu_exclusive="cpuset.cpu_exclusive"
+cpus="cpuset.cpus"
+old_cpu_exclusive_value=1
 
 setup()
 {
-	tst_require_root
+	local cpu_num
 
-	if tst_kvcmp -lt "3.18"; then
-		tst_brkm TCONF "Test must be run with kernel 3.18.0 or newer"
-	fi
-
-	local cpu_num=$(tst_getconf _NPROCESSORS_ONLN)
+	cpu_num=$(tst_getconf _NPROCESSORS_ONLN)
 	if [ $cpu_num -lt 2 ]; then
-		tst_brkm TCONF "We need 2 cpus at least to have test"
+		tst_brk TCONF "We need 2 cpus at least to have test"
 	fi
 
-	tst_tmpdir
-
-	TST_CLEANUP=cleanup
+	if ! is_cgroup_subsystem_available_and_enabled "cpuset"; then
+		tst_brk TCONF "Either kernel does not support cpuset controller or feature not enabled"
+	fi
 
 	# We need to mount cpuset if it is not found.
-	mount_flag=0
-	grep -w cpuset /proc/mounts > tmpfile
-	if [ $? -eq 0 ]; then
-		root_cpuset_dir=$(cat tmpfile | awk '{print $2}')
-	else
-		root_cpuset_dir="cpuset_test"
+	root_cpuset_dir=$(get_cgroup_mountpoint cpuset)
+	if [ -z "$root_cpuset_dir" ]; then
+		root_cpuset_dir="$LOCAL_MOUNTPOINT"
 
 		ROD_SILENT mkdir -p ${root_cpuset_dir}
-
 		ROD_SILENT mount -t cpuset cpuset ${root_cpuset_dir}
-
-		mount_flag=1
 	fi
 
-	if [ -f ${root_cpuset_dir}/cpuset.cpu_exclusive ]; then
-		cpu_exclusive=cpuset.cpu_exclusive
-		cpus=cpuset.cpus
-	elif [ -f ${root_cpuset_dir}/cpu_exclusive ]; then
+	if ! [ -f ${root_cpuset_dir}/${cpu_exclusive} ]; then
 		cpu_exclusive=cpu_exclusive
 		cpus=cpus
-	else
-		tst_brkm TBROK "Both cpuset.cpu_exclusive and cpu_exclusive" \
-			       "do not exist."
 	fi
 
-	cpu_exclusive_value=$(cat ${root_cpuset_dir}/${cpu_exclusive})
-	if [ "${cpu_exclusive_value}" != "1" ];then
+	if ! [ -f ${root_cpuset_dir}/${cpu_exclusive} ]; then
+		tst_brk TBROK "Both cpuset.cpu_exclusive and cpu_exclusive do not exist"
+	fi
+
+	old_cpu_exclusive_value=$(cat ${root_cpuset_dir}/${cpu_exclusive})
+	if [ "${old_cpu_exclusive_value}" != "1" ];then
 		echo 1 > ${root_cpuset_dir}/${cpu_exclusive}
-		if [ $? -ne 0 ]; then
-			tst_brkm TBROK "'echo 1 >" \
-				       "${root_cpuset_dir}/${cpu_exclusive}'" \
-				       "failed"
-		fi
+		[ $? -ne 0 ] && tst_brk TBROK "'echo 1 > ${root_cpuset_dir}/${cpu_exclusive}' failed"
 	fi
 }
 
@@ -86,65 +69,47 @@ cleanup()
 		rmdir ${root_cpuset_dir}/testdir
 	fi
 
-	if [ "$cpu_exclusive_value" != 1 ]; then
-		# Need to flush, or may be output:
-		# "write error: Device or resource busy"
+	if [ "$old_cpu_exclusive_value" != 1 ]; then
+		# Need to flush, or write may fail with: "Device or resource busy"
 		sync
-
-		echo ${cpu_exclusive_value} > \
-		     ${root_cpuset_dir}/${cpu_exclusive}
+		echo ${old_cpu_exclusive_value} > ${root_cpuset_dir}/${cpu_exclusive}
 	fi
 
-	if [ "${mount_flag}" = "1" ]; then
-		umount ${root_cpuset_dir}
+	if [ -d "$LOCAL_MOUNTPOINT" ]; then
+		umount ${LOCAL_MOUNTPOINT}
 		if [ $? -ne 0 ]; then
-			tst_resm TWARN "'umount ${root_cpuset_dir}' failed"
+			tst_res TWARN "'umount ${LOCAL_MOUNTPOINT}' failed"
 		fi
 
-		if [ -d "${root_cpuset_dir}" ]; then
-			rmdir ${root_cpuset_dir}
-		fi
+		rmdir ${LOCAL_MOUNTPOINT}
 	fi
-
-	tst_rmdir
 }
 
-cpuset_test()
+test()
 {
+	local cpu_exclusive_tmp cpus_value
+
 	ROD_SILENT mkdir ${root_cpuset_dir}/testdir
 
 	# Creat an exclusive cpuset.
 	echo 1 > ${root_cpuset_dir}/testdir/${cpu_exclusive}
-	if [ $? -ne 0 ]; then
-		tst_brkm TFAIL "'echo 1 >" \
-			       "${root_cpuset_dir}/testdir/${cpu_exclusive}'" \
-			       "failed"
-	fi
-
-	local cpu_exclusive_tmp=$(cat \
-				  ${root_cpuset_dir}/testdir/${cpu_exclusive})
+	[ $? -ne 0 ] && tst_brk TFAIL "'echo 1 > ${root_cpuset_dir}/testdir/${cpu_exclusive}' failed"
+	
+	cpu_exclusive_tmp=$(cat ${root_cpuset_dir}/testdir/${cpu_exclusive})
 	if [ "${cpu_exclusive_tmp}" != "1" ]; then
-		tst_brkm TFAIL "${cpu_exclusive} is '${cpu_exclusive_tmp}'," \
-			       "expected '1'"
+		tst_brk TFAIL "${cpu_exclusive} is '${cpu_exclusive_tmp}', expected '1'"
 	fi
 
-	# ${cpus} is empty at the begin, that maybe make the system *crash*.
+	# This may trigger the kernel crash
 	echo 0-1 > ${root_cpuset_dir}/testdir/${cpus}
-	if [ $? -ne 0 ]; then
-		tst_brkm TFAIL "'echo 0-1 >" \
-			       "${root_cpuset_dir}/testdir/${cpus}' failed"
-	fi
+	[ $? -ne 0 ] && tst_brk TFAIL "'echo 0-1 > ${root_cpuset_dir}/testdir/${cpus}' failed"
 
-	local cpus_value=$(cat ${root_cpuset_dir}/testdir/${cpus})
+	cpus_value=$(cat ${root_cpuset_dir}/testdir/${cpus})
 	if [ "${cpus_value}" != "0-1" ]; then
-		tst_brkm TFAIL "${cpus} is '${cpus_value}', expected '0-1'"
+		tst_brk TFAIL "${cpus} is '${cpus_value}', expected '0-1'"
 	fi
 
-	tst_resm TPASS "Bug is not reproduced"
+	tst_res TPASS "Bug is not reproducible"
 }
 
-setup
-
-cpuset_test
-
-tst_exit
+tst_run
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
