Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F11D73B1479
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 09:16:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 208073C6FEE
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 09:16:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0FFAA3C8E3D
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 09:16:02 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2EA431000F44
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 09:16:02 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 08E4E9FBF1;
 Wed, 23 Jun 2021 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1624432561; bh=TrXuGFo43ShWGSqjTyE2MIDQDyeGVzzYiq/oOeoHCOU=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Q2XpG4QA7syv41ef6ixjicrHMgh9vq2b2VHxVT9q9lloDzx565YDbPxknWJJOMngT
 YqW/Pfu0W6ADh8dqXax0Ocee27dFSTn2hSDK9caDkEE5YCHuMafKHf7HH5Y6xeUmD1
 HTlfiPyFq/XNgsDKoP+6b0tIvqp9LBRglbUNyVrg=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	rpalethorpe@suse.com
Date: Wed, 23 Jun 2021 09:15:42 +0200
Message-Id: <20210623071543.171021-4-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623071543.171021-1-lkml@jv-coder.de>
References: <20210623071543.171021-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 3/3] cpuset_regression_test: Allow running,
 if groups exist
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

Even if groups with a set cpuset.cpus exist, the original bug can still be
in the kernel. It was possible to create a group, set cpuset.cpus and only
then set cpuset.cpu_exclusive to 1. This did not trigger the bug.

This patche sets cpuset.cpus for all groups to an empty value, before
running the test and resets them to their original value after the test.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../cpuset/cpuset_regression_test.sh          | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh b/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
index 369fbedae..de1d6e649 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
@@ -19,12 +19,54 @@ TST_MIN_KVER="3.18"
 . cgroup_lib.sh
 
 LOCAL_MOUNTPOINT="cpuset_test"
+BACKUP_DIRECTORY="cpuset_backup"
 
 root_cpuset_dir=
 cpu_exclusive="cpuset.cpu_exclusive"
 cpus="cpuset.cpus"
 old_cpu_exclusive_value=1
 
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
+	local old_dir=$PWD
+
+	cd ${root_cpuset_dir}
+	find . -mindepth 2 -name ${what} -print0 |
+	while IFS= read -r -d '' file; do
+		mkdir -p "$(dirname "${backup_dir}/${file}")"
+		cat "${file}" > "${backup_dir}/${file}"
+		echo "${value}" > "${file}"
+	done
+
+	cd $old_dir
+}
+
+# cpuset_restore <backup_dir> <what>
+# Restores the value of a file (<what>) in all cpuset
+# groups from the backup created by cpuset_backup_and_update
+cpuset_restore()
+{
+	local backup_dir=$1
+	local what=$2
+	local old_dir=$PWD
+
+	cd ${backup_dir}
+	find . -mindepth 2 -name ${what} -print0 |
+	while IFS= read -r -d '' file; do
+		cat "${file}" > "${root_cpuset_dir}/${file}"
+	done
+
+	cd $old_dir
+}
+
 setup()
 {
 	if ! is_cgroup_subsystem_available_and_enabled "cpuset"; then
@@ -49,6 +91,11 @@ setup()
 		tst_brk TBROK "Both cpuset.cpu_exclusive and cpu_exclusive do not exist"
 	fi
 
+	# Ensure that no group explicitely uses a cpu,
+	# otherwise setting cpuset.cpus for the testgroup will fail
+	mkdir ${BACKUP_DIRECTORY}
+	cpuset_backup_and_update "${PWD}/${BACKUP_DIRECTORY}" ${cpus} ""
+
 	old_cpu_exclusive_value=$(cat ${root_cpuset_dir}/${cpu_exclusive})
 	if [ "${old_cpu_exclusive_value}" != "1" ];then
 		echo 1 > ${root_cpuset_dir}/${cpu_exclusive}
@@ -62,6 +109,10 @@ cleanup()
 		rmdir ${root_cpuset_dir}/testdir
 	fi
 
+	if [ -d "${BACKUP_DIRECTORY}" ]; then
+		cpuset_restore "${PWD}/${BACKUP_DIRECTORY}" ${cpus}
+	fi
+
 	if [ "$old_cpu_exclusive_value" != 1 ]; then
 		# Need to flush, or write may fail with: "Device or resource busy"
 		sync
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
