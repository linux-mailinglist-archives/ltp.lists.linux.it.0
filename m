Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF750D0714
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:16:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AB473C2284
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:16:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6E4FF3C134D
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:16:30 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BF972201143
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:16:29 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id E9F9A9F7FC;
 Wed,  9 Oct 2019 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570601789; bh=PfxuAx7WKH4hAGs0zH10vO92R1kD/PiP+ae4gEwuGkw=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=nvY5qZHFOhvf1HhX9x3BT6b73XgvSoDUqRSpbleVHIIMR1+nQ/y0E0eVSP29vr2Iw
 /KAL9aW6cyZwVuGkraQCXc1nldUljMotLW8CWctgkaTt9Lj8IRGwUZaHOglMybrUNQ
 JfEJ8P4JYUOpaKbH3Q3EueoQmo5H2zm35M0G/gCU=
From: Joerg Vehlow <lkml@jv-coder.de>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Oct 2019 08:16:18 +0200
Message-Id: <20191009061619.48677-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191009061619.48677-1-lkml@jv-coder.de>
References: <20191009061619.48677-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] tst_test.sh: Add TST_USES_MODULE
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

Adds a new library variable TST_USES_MODULE, that can be used, when a
test may need a module, but should not fail, if the module is not available.
---
 doc/test-writing-guidelines.txt |  4 ++-
 testcases/lib/tst_test.sh       | 50 ++++++++++++++++++++++-----------
 2 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index cd0d28b8e..4a0652a8d 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2125,6 +2125,8 @@ simply by setting right '$TST_NEEDS_FOO'.
 | 'TST_NEEDS_CMDS'   | String with command names that has to be present for
                        the test (see below).
 | 'TST_NEEDS_MODULE' | Test module name needed for the test (see below).
+| 'TST_USES_MODULE'  | Same as TST_NEEDS_MODULE, except that a missing module
+|                    | is not an error.
 | 'TST_NEEDS_DRIVERS'| Checks kernel drivers support for the test.
 |=============================================================================
 
@@ -2174,7 +2176,7 @@ Locating kernel modules
 +++++++++++++++++++++++
 
 The LTP build system can build kernel modules as well, setting
-'$TST_NEEDS_MODULE' to module name will cause to library to look for the
+'$TST_NEEDS_MODULE' to module name will cause the library to look for the
 module in a few possible paths.
 
 If module was found the path to it will be stored into '$TST_MODPATH'
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index e0b24c6b9..c70a5abbe 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -396,6 +396,32 @@ _tst_require_root()
 	fi
 }
 
+_tst_find_module()
+{
+	local _tst_module=$1
+	local _tst_is_required=${2:-0}
+
+	for tst_module in "$_tst_module" \
+						"$LTPROOT/testcases/bin/$_tst_module" \
+						"$TST_STARTWD/$_tst_module"; do
+
+			if [ -f "$tst_module" ]; then
+				TST_MODPATH="$tst_module"
+				break
+			fi
+	done
+
+	if [ -z "$TST_MODPATH" ]; then
+		if [ $_tst_is_required -eq 1 ]; then
+			tst_brk TCONF "Failed to find module '$_tst_module'"
+		else
+			tst_res TINFO "Module '$_tst_module' not found."
+		fi
+	else
+		tst_res TINFO "Found module at '$TST_MODPATH'"
+	fi
+}
+
 tst_run()
 {
 	local _tst_i
@@ -410,7 +436,7 @@ tst_run()
 			SETUP|CLEANUP|TESTFUNC|ID|CNT|MIN_KVER);;
 			OPTS|USAGE|PARSE_ARGS|POS_ARGS);;
 			NEEDS_ROOT|NEEDS_TMPDIR|TMPDIR|NEEDS_DEVICE|DEVICE);;
-			NEEDS_CMDS|NEEDS_MODULE|MODPATH|DATAROOT);;
+			NEEDS_CMDS|NEEDS_MODULE|USES_MODULE|MODPATH|DATAROOT);;
 			NEEDS_DRIVERS|FS_TYPE|MNTPOINT|MNT_PARAMS);;
 			IPV6|IPVER|TEST_DATA|TEST_DATA_IFS);;
 			RETRY_FUNC|RETRY_FN_EXP_BACKOFF);;
@@ -487,22 +513,12 @@ tst_run()
 		TST_DEVICE_FLAG=1
 	fi
 
-	if [ -n "$TST_NEEDS_MODULE" ]; then
-		for tst_module in "$TST_NEEDS_MODULE" \
-		                  "$LTPROOT/testcases/bin/$TST_NEEDS_MODULE" \
-		                  "$TST_STARTWD/$TST_NEEDS_MODULE"; do
-
-				if [ -f "$tst_module" ]; then
-					TST_MODPATH="$tst_module"
-					break
-				fi
-		done
-
-		if [ -z "$TST_MODPATH" ]; then
-			tst_brk TCONF "Failed to find module '$TST_NEEDS_MODULE'"
-		else
-			tst_res TINFO "Found module at '$TST_MODPATH'"
-		fi
+	if [ -n "$TST_NEEDS_MODULE" ] && [ -n "$TST_USES_MODULE" ]; then
+		tst_brk TBROK "Setting TST_NEEDS_MODULE and TST_USES_MODULE at the same time is not allowed"
+	elif [ -n "$TST_NEEDS_MODULE" ]; then
+		_tst_find_module "$TST_NEEDS_MODULE" 1
+	elif [ -n "$TST_USES_MODULE" ]; then
+		_tst_find_module "$TST_USES_MODULE" 0
 	fi
 
 	if [ -n "$TST_SETUP" ]; then
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
