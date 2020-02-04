Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1A151C35
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 15:29:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20EAF3C252E
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 15:29:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0B7853C23DE
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 15:29:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A27C1201218
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 15:29:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 06FF1B1D0
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 14:29:20 +0000 (UTC)
Date: Tue, 4 Feb 2020 15:29:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200204142918.GB18759@dell5510>
References: <20200130110753.20459-1-pvorel@suse.cz>
 <20200204132152.GC16090@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204132152.GC16090@rei>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] autotools: Move simple definitions out of
 m4/* to configure.ac
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > +AC_CHECK_HEADERS(fts.h, [have_fts=1])
> > +AC_SUBST(HAVE_FTS_H, $have_fts)

> How is that different from simple AC_CHECK_HEADERS() ?

> Can't we just put the hader into the call above?

Maybe we could use ac_cv_header_sys_xattr_h=yes to set HAVE_FTS_H for Makefile.

So it works with following diff applied work as well.
I have no strong opinion which one is better.

Kind regards,
Petr

diff --git configure.ac configure.ac
index 1c9ef38eb..74648556e 100644
--- configure.ac
+++ configure.ac
@@ -38,6 +38,7 @@ AC_CHECK_DECLS([PR_CAPBSET_DROP, PR_CAPBSET_READ],,,[#include <sys/prctl.h>])
 
 AC_CHECK_HEADERS([ \
     asm/ldt.h \
+    fts.h \
     ifaddrs.h \
     keyutils.h \
     linux/can.h \
@@ -71,8 +72,10 @@ AC_CHECK_HEADERS([ \
     sys/xattr.h \
     xfs/xqm.h \
 ])
-AC_CHECK_HEADERS(fts.h, [have_fts=1])
-AC_SUBST(HAVE_FTS_H, $have_fts)
+
+if test "x$ac_cv_header_sys_xattr_h" = "xyes"; then
+AC_SUBST(HAVE_FTS_H, 1)
+fi
 
 AC_CHECK_FUNCS([ \
     copy_file_range \

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
