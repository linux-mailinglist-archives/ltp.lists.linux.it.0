Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B89C1D89D1
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 23:15:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 633DE3C2694
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 23:15:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 794163C042A
 for <ltp@lists.linux.it>; Mon, 18 May 2020 23:15:22 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D24F460178D
 for <ltp@lists.linux.it>; Mon, 18 May 2020 23:14:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7959AB1DC;
 Mon, 18 May 2020 21:15:23 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 18 May 2020 23:15:14 +0200
Message-Id: <20200518211514.20445-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518211514.20445-1-pvorel@suse.cz>
References: <20200518211514.20445-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] rpc_test.sh: Print used TI-RPC implementation
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

This helps to debug glibc tests. Some of them are failing:
Cannot register service: RPC: Unable to receive; errno = Connection refused

+ unify case on message in check_portmap_rpcbind.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/rpc/basic_tests/rpc_lib.sh | 2 +-
 testcases/network/rpc/rpc-tirpc/rpc_test.sh  | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/testcases/network/rpc/basic_tests/rpc_lib.sh b/testcases/network/rpc/basic_tests/rpc_lib.sh
index 96dae8dd3..c7c868709 100644
--- a/testcases/network/rpc/basic_tests/rpc_lib.sh
+++ b/testcases/network/rpc/basic_tests/rpc_lib.sh
@@ -11,5 +11,5 @@ check_portmap_rpcbind()
 		pgrep rpcbind > /dev/null && PORTMAPPER="rpcbind" || \
 			tst_brk TCONF "portmap or rpcbind is not running"
 	fi
-	tst_res TINFO "Using $PORTMAPPER"
+	tst_res TINFO "using $PORTMAPPER"
 }
diff --git a/testcases/network/rpc/rpc-tirpc/rpc_test.sh b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
index dc97213d0..410482c14 100755
--- a/testcases/network/rpc/rpc-tirpc/rpc_test.sh
+++ b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
@@ -55,6 +55,13 @@ setup()
 
 	[ -n "$CLIENT" ] || tst_brk TBROK "client program not set"
 	tst_check_cmds $CLIENT $SERVER || tst_brk TCONF "LTP compiled without TI-RPC support?"
+
+	tst_cmd_available ldd which || return
+	if ldd $(which $CLIENT) |grep -q /libtirpc\.so; then
+		tst_res TINFO "using libtirpc: yes"
+	else
+		tst_res TINFO "using libtirpc: no (probably using glibc)"
+	fi
 }
 
 cleanup()
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
