Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 240D531B7C2
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 12:04:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC52E3C59B8
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 12:04:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3163F3C26CF
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 12:04:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3ED916006DB
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 12:04:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76F6AAE6D
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 11:04:27 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 15 Feb 2021 12:04:19 +0100
Message-Id: <20210215110419.2964-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] configure: Improve error message on missing
 pkg-config
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

make autotools
configure:7350: error: possibly undefined macro: AC_DEFINE

Fixes: #787

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 configure.ac | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure.ac b/configure.ac
index d4bef5e45..c1f24891d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -30,6 +30,9 @@ AC_DEFUN([AC_PROG_STRIP], [AC_CHECK_TOOL(STRIP, strip, :)])
 AC_PROG_STRIP
 AC_PROG_YACC
 
+m4_ifndef([PKG_PREREQ],
+	[m4_fatal([must install pkg-config or pkgconfig and pkg.m4 macro (usual dependency)])])
+
 AC_PREFIX_DEFAULT(/opt/ltp)
 
 AC_CHECK_DECLS([IFLA_NET_NS_PID],,,[#include <linux/if_link.h>])
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
