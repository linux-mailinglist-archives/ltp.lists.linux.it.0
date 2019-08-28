Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFD8A00B9
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 13:30:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B4663C1CFF
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 13:30:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E9F0E3C1CE5
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 13:30:11 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 32104602557
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 13:30:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 56094AED0
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 11:30:09 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 28 Aug 2019 13:30:01 +0200
Message-Id: <20190828113001.15105-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH] tst_security.sh: Adjust AppArmor/SELinux
 messages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

* print info before an attempt to disable AppArmor/SELinux
* print setup tips only if needed (when TST_DISABLE_{APPARMOR,SELINUX} are
set, it does not make sense to print tips how to disable it)
* adjust setup tips messages

+ quiet output of aa-teardown
This suppress "Unloading AppArmor profiles" message
(output of /etc/init.d/apparmor was also suppressed)

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_security.sh | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/testcases/lib/tst_security.sh b/testcases/lib/tst_security.sh
index 25e085d3c..7d033bbc5 100644
--- a/testcases/lib/tst_security.sh
+++ b/testcases/lib/tst_security.sh
@@ -17,7 +17,8 @@ _tst_check_security_modules()
 
 	if tst_apparmor_enabled; then
 		tst_res TINFO "AppArmor enabled, this may affect test results"
-		tst_res TINFO "You can try to disable it with TST_DISABLE_APPARMOR=1 (requires super/root)"
+		[ "$TST_DISABLE_APPARMOR" = 1 ] || \
+			tst_res TINFO "it can be disabled with TST_DISABLE_APPARMOR=1 (requires super/root)"
 		profiles=
 		for cmd in $TST_NEEDS_CMDS; do
 			tst_apparmor_used_profile $cmd && profiles="$cmd $profiles"
@@ -28,7 +29,9 @@ _tst_check_security_modules()
 
 	if tst_selinux_enabled; then
 		tst_res TINFO "SELinux enabled in enforcing mode, this may affect test results"
-		tst_res TINFO "You can try to disable it with TST_DISABLE_SELINUX=1 (requires super/root)"
+
+		[ "$TST_DISABLE_SELINUX" = 1 ] || \
+			tst_res TINFO "it can be disabled with TST_DISABLE_SELINUX=1 (requires super/root)"
 		profiles=
 		for cmd in $TST_NEEDS_CMDS; do
 			tst_selinux_used_profile $cmd && profiles="$cmd $profiles"
@@ -91,11 +94,13 @@ tst_selinux_used_profile()
 # Return > 0: failed to disable AppArmor
 tst_disable_apparmor()
 {
+	tst_res TINFO "trying to disable AppArmor (requires super/root)"
 	_tst_require_root
+
 	local f="aa-teardown"
 	local action
 
-	tst_cmd_available $f && { $f; return; }
+	tst_cmd_available $f && { $f >/dev/null; return; }
 	f="/etc/init.d/apparmor"
 	if [ -f "$f" ]; then
 		for action in teardown kill stop; do
@@ -109,7 +114,9 @@ tst_disable_apparmor()
 # Return > 0: failed to disable SELinux
 tst_disable_selinux()
 {
+	tst_res TINFO "trying to disable SELinux (requires super/root)"
 	_tst_require_root
+
 	local f="$(_tst_get_enforce)"
 
 	[ -f "$f" ] && cat 0 > $f
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
