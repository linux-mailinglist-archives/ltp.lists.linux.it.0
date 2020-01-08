Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF75133F5A
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 11:35:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B4B33C243B
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 11:35:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0B9DF3C2093
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 11:35:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E33201A01524
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 11:35:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0584BB266;
 Wed,  8 Jan 2020 10:34:23 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  8 Jan 2020 11:34:11 +0100
Message-Id: <20200108103413.29096-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108103413.29096-1-pvorel@suse.cz>
References: <20200108103413.29096-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] rpc-tirpc: Add libntirpc support
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
Cc: Mike Frysinger <vapier@gentoo.org>, Steve Dickson <SteveD@RedHat.com>,
 libtirpc-devel@lists.sourceforge.net, Daniel Gryniewicz <dang@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 m4/ltp-tirpc.m4 | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/m4/ltp-tirpc.m4 b/m4/ltp-tirpc.m4
index 3f23b1a17..dd563e650 100644
--- a/m4/ltp-tirpc.m4
+++ b/m4/ltp-tirpc.m4
@@ -6,10 +6,13 @@ AC_DEFUN([LTP_CHECK_TIRPC], [
 	dnl libtirpc library and headers
 	PKG_CHECK_MODULES([LIBTIRPC], [libtirpc], [have_libtirpc=yes], [have_libtirpc=no])
 
+	dnl libntirpc library and headers
+	PKG_CHECK_MODULES([LIBNTIRPC], [libntirpc], [have_libntirpc=yes], [have_libntirpc=no])
+
 	dnl TI-RPC headers (in glibc, since 2.26 installed only when configured with --enable-obsolete-rpc)
 	AC_CHECK_HEADERS([rpc/rpc.h], [have_rpc_headers=yes])
 
-	if test "x$have_libtirpc" = "xyes" -o "x$have_rpc_headers" = "xyes"; then
-		AC_DEFINE([HAVE_TIRPC], [1], [Define to 1 if you have libtirpc library and headers or glibc with TI-RPC support])
+	if test "x$have_libtirpc" = "xyes" -o "x$have_libntirpc" = "xyes" -o "x$have_rpc_headers" = "xyes"; then
+		AC_DEFINE([HAVE_TIRPC], [1], [Define to 1 if you have libtirpc or libntirpc library and headers or glibc with TI-RPC support])
 	fi
 ])
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
