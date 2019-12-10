Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BC41181A9
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:04:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A92E73C2272
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:04:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A32DD3C22BE
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:04:35 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0EA861401708
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:04:34 +0100 (CET)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id E8FC69F891;
 Tue, 10 Dec 2019 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1575965074; bh=64R0GNWOtyNq04TKD+GoaQthliC0ChBlvB4Qq/wLzws=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=VQRl20FS6XQJLZlWdW8dzt1jzZq5UOimSC2btlLQgvLuCTJjWXHHiPkvmzTZEK9WH
 o11q1u9tM+JDyrtup022j4kQWTGiPTzEq9V4Mc4lBW7vdHbR4DfHS43AIeCQea1Nho
 v/d5n+Slu4IN2Q4TsnEwAj3Cg8rw97wsJDvexj5w=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Tue, 10 Dec 2019 09:04:18 +0100
Message-Id: <20191210080419.128773-3-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210080419.128773-1-lkml@jv-coder.de>
References: <20191210080419.128773-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4 2/3] tst_test.sh: Make public tst_require_root
 command public
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

If a test requires root only under certain circumstances, TST_NEEDS_ROOT
is not sufficient, because it always requires root.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 doc/test-writing-guidelines.txt |  3 ++-
 testcases/lib/tst_net.sh        | 12 ++----------
 testcases/lib/tst_security.sh   |  4 ++--
 testcases/lib/tst_test.sh       |  4 ++--
 4 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 3360f0920..d0c49dc9c 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2118,7 +2118,8 @@ simply by setting right '$TST_NEEDS_FOO'.
 [options="header"]
 |=============================================================================
 | Variable name      | Action done
-| 'TST_NEEDS_ROOT'   | Exit the test with 'TCONF' unless executed under root
+| 'TST_NEEDS_ROOT'   | Exit the test with 'TCONF' unless executed under root.
+|                    | Alternatively the tst_require_root command can be used
 | 'TST_NEEDS_TMPDIR' | Create test temporary directory and cd into it.
 | 'TST_NEEDS_DEVICE' | Prepare test temporary device, the path to testing
                        device is stored in '$TST_DEVICE' variable.
diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 59ceb3352..dd0c712c3 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -97,14 +97,6 @@ tst_brk_()
 {
 	[ -z "$TST_USE_LEGACY_API" ] && tst_brk $@ || tst_brkm $@
 }
-tst_require_root_()
-{
-	if [ -z "$TST_USE_LEGACY_API" ]; then
-		_tst_require_root
-	else
-		tst_require_root
-	fi
-}
 
 init_ltp_netspace()
 {
@@ -112,7 +104,7 @@ init_ltp_netspace()
 
 	if [ ! -f /var/run/netns/ltp_ns -a -z "$LTP_NETNS" ]; then
 		tst_require_cmds ip
-		tst_require_root_
+		tst_require_root
 
 		ROD ip li add name ltp_ns_veth1 type veth peer name ltp_ns_veth2
 		pid="$(ROD ns_create net,mnt)"
@@ -577,7 +569,7 @@ tst_del_ipaddr()
 tst_restore_ipaddr()
 {
 	tst_require_cmds ip
-	tst_require_root_
+	tst_require_root
 
 	local type="${1:-lhost}"
 	local link_num="${2:-0}"
diff --git a/testcases/lib/tst_security.sh b/testcases/lib/tst_security.sh
index 7d033bbc5..af7c81bb5 100644
--- a/testcases/lib/tst_security.sh
+++ b/testcases/lib/tst_security.sh
@@ -95,7 +95,7 @@ tst_selinux_used_profile()
 tst_disable_apparmor()
 {
 	tst_res TINFO "trying to disable AppArmor (requires super/root)"
-	_tst_require_root
+	tst_require_root
 
 	local f="aa-teardown"
 	local action
@@ -115,7 +115,7 @@ tst_disable_apparmor()
 tst_disable_selinux()
 {
 	tst_res TINFO "trying to disable SELinux (requires super/root)"
-	_tst_require_root
+	tst_require_root
 
 	local f="$(_tst_get_enforce)"
 
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index afee6aac5..c93ab7dbe 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -454,7 +454,7 @@ _tst_setup_timer()
 	_tst_setup_timer_pid=$!
 }
 
-_tst_require_root()
+tst_require_root()
 {
 	if [ "$(id -ru)" != 0 ]; then
 		tst_brk TCONF "Must be super/root for this test!"
@@ -529,7 +529,7 @@ tst_run()
 		tst_brk TBROK "Number of iterations (-i) must be > 0"
 	fi
 
-	[ "$TST_NEEDS_ROOT" = 1 ] && _tst_require_root
+	[ "$TST_NEEDS_ROOT" = 1 ] && tst_require_root
 
 	[ "$TST_DISABLE_APPARMOR" = 1 ] && tst_disable_apparmor
 	[ "$TST_DISABLE_SELINUX" = 1 ] && tst_disable_selinux
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
