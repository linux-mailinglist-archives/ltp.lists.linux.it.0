Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFEA2AD5DE
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 13:09:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A5383C5362
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 13:09:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7D5583C2F4B
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 13:09:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0521C1000B6C
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 13:09:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59977AF39
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 12:09:32 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 10 Nov 2020 13:09:23 +0100
Message-Id: <20201110120923.21759-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] m4: Remove workaround for old pkg-config
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

fix was for 0.24 which is probably old enough (released in 2010;
problematic 0.23 was released 2008).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Travis CI:
https://travis-ci.org/github/pevik/ltp/builds/742685737

 m4/ltp-tirpc.m4 | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/m4/ltp-tirpc.m4 b/m4/ltp-tirpc.m4
index 4d9701469..f06fed3d9 100644
--- a/m4/ltp-tirpc.m4
+++ b/m4/ltp-tirpc.m4
@@ -22,9 +22,4 @@ AC_DEFUN([LTP_CHECK_TIRPC], [
 	if test "x$have_libtirpc" = "xyes" -o "x$have_rpc_glibc" = "xyes"; then
 		AC_SUBST(HAVE_RPC, 1)
 	fi
-
-	dnl fix for old pkg-config (< 0.24)
-	dnl https://autotools.io/pkgconfig/pkg_check_modules.html
-	AC_SUBST(TIRPC_CFLAGS)
-	AC_SUBST(TIRPC_LIBS)
 ])
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
