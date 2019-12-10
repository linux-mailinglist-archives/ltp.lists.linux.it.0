Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B471181A8
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:04:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 397683C22C7
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:04:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 765753C22B6
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:04:31 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F028A100157F
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:04:28 +0100 (CET)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id DD93F9F891;
 Tue, 10 Dec 2019 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1575965068; bh=6+GbKgpeImVILA08XKtEPIqupJhOVJZWXrmYlk0yXRQ=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=nH/PibKVy6hrJbDgII7eHbHj44xvM9D2VEANyjVZ8yk1acPjQlTPpVIElGtZpWgUV
 oknA/uHAC6VQtRcIBlUUPdO80ypox+89+RDwNNH+pJqxwo1pihdHLZaykQDTgcpPi/
 8bAdtCaDkNX8fXcP2ixl3FDLV35B7Jqhv8MRB2HY=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Tue, 10 Dec 2019 09:04:17 +0100
Message-Id: <20191210080419.128773-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210080419.128773-1-lkml@jv-coder.de>
References: <20191210080419.128773-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4 1/3] tst_test.sh: Add tst_require_module command
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

Adds a new library function tst_require_module, that can be used, when a
test needs a module dynamically at runtime

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 doc/test-writing-guidelines.txt |  3 +++
 testcases/lib/tst_test.sh       | 39 +++++++++++++++++++--------------
 2 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 546bb7a49..3360f0920 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2184,6 +2184,9 @@ module in a few possible paths.
 If module was found the path to it will be stored into '$TST_MODPATH'
 variable, if module wasn't found the test will exit with 'TCONF'.
 
+Alternatively the 'tst_require_module()' function can be used to do the same
+at runtime.
+
 2.3.3 Optional command line parameters
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 70c1ef2e3..afee6aac5 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -461,6 +461,27 @@ _tst_require_root()
 	fi
 }
 
+tst_require_module()
+{
+	local _tst_module=$1
+
+	for tst_module in "$_tst_module" \
+	                  "$LTPROOT/testcases/bin/$_tst_module" \
+	                  "$TST_STARTWD/$_tst_module"; do
+
+			if [ -f "$tst_module" ]; then
+				TST_MODPATH="$tst_module"
+				break
+			fi
+	done
+	
+	if [ -n "$TST_MODPATH" ]; then
+		tst_res TINFO "Found module at '$TST_MODPATH'"
+	else
+		tst_brk TCONF "Failed to find module '$_tst_module'"
+	fi
+}
+
 tst_run()
 {
 	local _tst_i
@@ -552,23 +573,7 @@ tst_run()
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
-	fi
+	[ -n "$TST_NEEDS_MODULE" ] && tst_require_module "$TST_NEEDS_MODULE"
 
 	if [ -n "$TST_SETUP" ]; then
 		$TST_SETUP
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
