Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D79F3F6E91
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 06:49:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E45063C3077
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 06:49:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B7E7C3C2F5A
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 06:49:29 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4F9B5600697
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 06:49:28 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 20B4A9F750;
 Wed, 25 Aug 2021 04:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1629866967; bh=RE2pN3KeJ8mWCKbcnlENEpBfVMXuXujQ8RpuyYn6f9Q=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=XDLc0SV1Hu2aRZuZSqnS7dmgcHwvNKSDEdarFSYoGxZTTAlaZln87wZXnaE88W17T
 U8Ep3D3spv58tjrQKMUjsxwePvQkFdiAQUVMUtiDuW7sFyzQR8HFRQIaSNU5WGGwCn
 mFI7nSqnQFZYug5jZKUD4OGK9s5ZI1GO8c1RpQMA=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it, pvorel@suse.cz, chrubis@suse.cz,
 bogdan.lezhepekov@suse.com
Date: Wed, 25 Aug 2021 06:49:20 +0200
Message-Id: <20210825044921.1237802-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 1/2] shell: Add checkpoints api for new lib
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

The checkpoint api is even mentioned in shell-test-api.txt,
but with the old library used.
This also fixes the documentation.

memcg_lib.sh must be adapted in the same commit, because it already sets
TST_NEEDS_CHECKPOINTS=1 and had the ipc initialization code. This would
run the ipc initialization code twice.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---

Changes to v2:
 - Removed unecessary curly braces

 doc/shell-test-api.txt                        |  4 +-
 .../controllers/memcg/functional/memcg_lib.sh |  8 ----
 testcases/lib/tst_test.sh                     | 45 ++++++++++++++++++-
 3 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/doc/shell-test-api.txt b/doc/shell-test-api.txt
index bf297ab07..8d1bab5a1 100644
--- a/doc/shell-test-api.txt
+++ b/doc/shell-test-api.txt
@@ -729,14 +729,14 @@ The shell library provides an implementation of the checkpoint interface
 compatible with the C version. All 'TST_CHECKPOINT_*' functions are available.
 
 In order to initialize checkpoints '$TST_NEEDS_CHECKPOINTS' must be set to '1'
-before the inclusion of 'test.sh':
+before the inclusion of 'tst_test.sh':
 
 [source,sh]
 -------------------------------------------------------------------------------
 #!/bin/sh
 
 TST_NEEDS_CHECKPOINTS=1
-. test.sh
+. tst_test.sh
 -------------------------------------------------------------------------------
 
 Since both the implementations are compatible, it's also possible to start
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
index ee14a29fa..355acb6a6 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -104,14 +104,6 @@ memcg_setup()
 		tst_brk TCONF "Either kernel does not support Memory Resource Controller or feature not enabled"
 	fi
 
-	# Setup IPC
-	LTP_IPC_PATH="/dev/shm/ltp_${TCID}_$$"
-	LTP_IPC_SIZE=$PAGESIZE
-	ROD_SILENT dd if=/dev/zero of="$LTP_IPC_PATH" bs="$LTP_IPC_SIZE" count=1
-	ROD_SILENT chmod 600 "$LTP_IPC_PATH"
-	export LTP_IPC_PATH
-	# Setup IPC end
-
 	ROD mkdir /dev/memcg
 	ROD mount -t cgroup -omemory memcg /dev/memcg
 
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 78e2760e7..b45f84c4f 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -49,6 +49,10 @@ _tst_do_exit()
 		[ "$TST_TMPDIR_RHOST" = 1 ] && tst_cleanup_rhost
 	fi
 
+	if [ -n "$TST_NEEDS_CHECKPOINTS" -a -f "$LTP_IPC_PATH" ]; then
+		rm $LTP_IPC_PATH
+	fi
+
 	_tst_cleanup_timer
 
 	if [ $TST_FAIL -gt 0 ]; then
@@ -255,6 +259,27 @@ TST_RTNL_CHK()
 	tst_brk TBROK "$@ failed: $output"
 }
 
+TST_CHECKPOINT_WAIT()
+{
+	ROD tst_checkpoint wait 10000 "$1"
+}
+
+TST_CHECKPOINT_WAKE()
+{
+	ROD tst_checkpoint wake 10000 "$1" 1
+}
+
+TST_CHECKPOINT_WAKE2()
+{
+	ROD tst_checkpoint wake 10000 "$1" "$2"
+}
+
+TST_CHECKPOINT_WAKE_AND_WAIT()
+{
+	TST_CHECKPOINT_WAKE "$1"
+	TST_CHECKPOINT_WAIT "$1"
+}
+
 tst_mount()
 {
 	local mnt_opt mnt_err
@@ -549,6 +574,20 @@ tst_set_timeout()
 	_tst_setup_timer
 }
 
+_tst_init_checkpoints()
+{
+	local pagesize
+
+	LTP_IPC_PATH="/dev/shm/ltp_${TST_ID}_$$"
+	pagesize=$(tst_getconf PAGESIZE)
+	if [ $? -ne 0 ]; then
+		tst_brk TBROK "tst_getconf PAGESIZE failed"
+	fi
+	ROD_SILENT dd if=/dev/zero of="$LTP_IPC_PATH" bs="$pagesize" count=1
+	ROD_SILENT chmod 600 "$LTP_IPC_PATH"
+	export LTP_IPC_PATH
+}
+
 tst_run()
 {
 	local _tst_i
@@ -568,7 +607,9 @@ tst_run()
 			IPV6|IPV6_FLAG|IPVER|TEST_DATA|TEST_DATA_IFS);;
 			RETRY_FUNC|RETRY_FN_EXP_BACKOFF|TIMEOUT);;
 			NET_DATAROOT|NET_MAX_PKT|NET_RHOST_RUN_DEBUG|NETLOAD_CLN_NUMBER);;
-			NET_SKIP_VARIABLE_INIT);;
+			NET_SKIP_VARIABLE_INIT|NEEDS_CHECKPOINTS);;
+			CHECKPOINT_WAIT|CHECKPOINT_WAKE);;
+			CHECKPOINT_WAKE2|CHECKPOINT_WAKE_AND_WAIT);;
 			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
 			esac
 		done
@@ -643,6 +684,8 @@ tst_run()
 
 	[ -n "$TST_NEEDS_MODULE" ] && tst_require_module "$TST_NEEDS_MODULE"
 
+	[ -n "$TST_NEEDS_CHECKPOINTS" ] && _tst_init_checkpoints
+
 	if [ -n "$TST_SETUP" ]; then
 		if type $TST_SETUP >/dev/null 2>/dev/null; then
 			TST_DO_CLEANUP=1
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
