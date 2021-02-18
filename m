Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1EB31EB40
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 16:07:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 849F33C664F
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 16:07:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id EF1553C5831
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 16:07:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0DC7E600668
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 16:07:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5EBD3AD57
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 15:07:44 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 18 Feb 2021 16:07:38 +0100
Message-Id: <20210218150738.26253-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] configure: Fix pkg.m4 detection
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

6e17e2ba1 attempt to detect missing pkg.m4, which usually gets installed
with pkg-config/pkgconfig. Unfortunately this macro is since 0.29, which
is too new for CentOS 7. Let's use PKG_CHECK_EXISTS, which is since 0.16
(old enough, we expect 0.24).

Fixes: 6e17e2ba1 ("configure: Improve error message on missing pkg-config")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index beeb9e669..d41688f04 100644
--- a/configure.ac
+++ b/configure.ac
@@ -30,7 +30,7 @@ AC_DEFUN([AC_PROG_STRIP], [AC_CHECK_TOOL(STRIP, strip, :)])
 AC_PROG_STRIP
 AC_PROG_YACC
 
-m4_ifndef([PKG_PREREQ],
+m4_ifndef([PKG_CHECK_EXISTS],
 	[m4_fatal([must install pkg-config or pkgconfig and pkg.m4 macro (usual dependency), see INSTALL])])
 
 AC_PREFIX_DEFAULT(/opt/ltp)
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
