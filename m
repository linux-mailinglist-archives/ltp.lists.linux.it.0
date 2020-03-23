Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 334CF18F960
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 17:11:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B57643C4E49
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 17:11:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BB69C3C4E33
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 17:11:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8CEC41000C2B
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 17:11:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D6018AFE4;
 Mon, 23 Mar 2020 16:11:30 +0000 (UTC)
Date: Mon, 23 Mar 2020 17:11:29 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200323161129.GA28014@dell5510>
References: <20200318153801.3529-1-chrubis@suse.cz>
 <20200318153801.3529-4-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318153801.3529-4-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/9] safe_macros: Add SAFE_SETNS()
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
Cc: Cyril Hrubis <metan@ucw.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

...
> diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
> index f5413a18e..353ef5b1d 100644
> --- a/lib/tst_safe_macros.c
> +++ b/lib/tst_safe_macros.c
> @@ -6,6 +6,7 @@
>  #define _GNU_SOURCE
>  #include <unistd.h>
>  #include <errno.h>
> +#include "lapi/setns.h"
One more fix needed: lapi file needs to be loaded later:

diff --git lib/tst_safe_macros.c lib/tst_safe_macros.c
index 353ef5b1d..7d33f2b79 100644
--- lib/tst_safe_macros.c
+++ lib/tst_safe_macros.c
@@ -6,7 +6,6 @@
 #define _GNU_SOURCE
 #include <unistd.h>
 #include <errno.h>
-#include "lapi/setns.h"
 #include <sched.h>
 #include "config.h"
 #ifdef HAVE_SYS_FANOTIFY_H
@@ -14,6 +13,7 @@
 #endif
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
+#include "lapi/setns.h"
 #include "tst_safe_macros.h"
 #include "lapi/personality.h"
 
to prevent failure:
In file included from /usr/src/ltp/lib/tst_safe_macros.c:9:
/usr/src/ltp/include/lapi/setns.h: In function 'setns':
/usr/src/ltp/include/lapi/setns.h:16: error: implicit declaration of function 'tst_brk'
/usr/src/ltp/include/lapi/setns.h:16: error: 'TCONF' undeclared (first use in this function)
/usr/src/ltp/include/lapi/setns.h:16: error: (Each undeclared identifier is reported only once

The rest of the patchset looks ok to me:

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
