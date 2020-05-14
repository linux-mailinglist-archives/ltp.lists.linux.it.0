Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 738131D3D81
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 21:30:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A303F3C5445
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 21:30:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id ED9413C20E3
 for <ltp@lists.linux.it>; Thu, 14 May 2020 21:30:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 90B52601AF9
 for <ltp@lists.linux.it>; Thu, 14 May 2020 21:30:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96654AC26
 for <ltp@lists.linux.it>; Thu, 14 May 2020 19:30:20 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 14 May 2020 21:30:11 +0200
Message-Id: <20200514193011.11386-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] rpc-tirpc: Fix deprecated glibc detection
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

It's not enough to check for RPC headers. These can belong to libtirpc 64bit, which
is not enough when compiling 32bit LTP without 32bit libtirpc.

Fixes: 60b20c428 ("rpc: Enable and fix build basic RPC tests with glibc SunRPC")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 m4/ltp-tirpc.m4 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/m4/ltp-tirpc.m4 b/m4/ltp-tirpc.m4
index 639e1e886..4d9701469 100644
--- a/m4/ltp-tirpc.m4
+++ b/m4/ltp-tirpc.m4
@@ -17,9 +17,9 @@ AC_DEFUN([LTP_CHECK_TIRPC], [
 	dnl rpc_broadcast() instead of clnt_broadcast()), but glibc implementation
 	dnl does not have the new ones. We could either provide the deprecated
 	dnl functions (copy from libtirpc src/rpc_soc.c) or drop glibc tests.
-	AC_CHECK_HEADERS([rpc/rpc.h], [have_rpc_headers=yes])
+	AC_CHECK_FUNCS([xdr_char clnttcp_create], [have_rpc_glibc=yes])
 
-	if test "x$have_libtirpc" = "xyes" -o "x$have_rpc_headers" = "xyes"; then
+	if test "x$have_libtirpc" = "xyes" -o "x$have_rpc_glibc" = "xyes"; then
 		AC_SUBST(HAVE_RPC, 1)
 	fi
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
