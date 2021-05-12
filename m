Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4337BEE3
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 15:52:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9877B3C8A99
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 15:52:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 887063C1A7D
 for <ltp@lists.linux.it>; Wed, 12 May 2021 15:52:03 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C6D1368FF3F
 for <ltp@lists.linux.it>; Wed, 12 May 2021 15:52:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E62CB158;
 Wed, 12 May 2021 13:52:02 +0000 (UTC)
Date: Wed, 12 May 2021 15:52:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YJvdgJCg2ZWq8lWM@pevik>
References: <20210512084904.35159-1-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512084904.35159-1-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Makefile: Use SPDX in Makefile
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

Hi Ziyao,

> For the testsuite that has used SPDX, also modify its Makefile to use SPDX.
Nice cleanup. Good, you included only GPLv2+ Makefiles.

Unfortunately patch cannot be applied with 'git am' and even with patch:

$ patch -p1 <Makefile-Use-SPDX-in-Makefile.patch
patching file doc/Makefile
patch: **** malformed patch at line 244: diff --git a/include/Makefile b/include/Makefile

Line 244 is top_srcdir:
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2009, Cisco Systems Inc.
 # Ngie Cooper, July 2009
-#
 top_srcdir			?= ..

I suppose you generate patch correctly with 'git format-patch' and send with
'git send-email'. I wonder if your mailserver breaks the patch. Could you check
it and optionally use different mailserver? (you can send mail to ML from e.g.
gmail and still have Signed-off-by: with huawei.com mail address).

...
> +++ b/testcases/open_posix_testsuite/Makefile
> @@ -1,35 +1,23 @@
> -#
> -# Read COPYING for licensing details.
> -#
> +# SPDX-License-Identifier: GPL-2.0-or-later
>  # Ngie Cooper, June 2010
> -#
>  # Makefiles that are considered critical to execution; if they don't exist
>  # all of the Makefiles will be rebuilt by default.
>  CRITICAL_MAKEFILE=	conformance/interfaces/timer_settime/Makefile
> -
>  # The default logfile for the tests.
>  LOGFILE?=		logfile
>  # Subdirectories to traverse down.
>  SUBDIRS=		conformance functional stress
> -
>  MAKE_ENV=		LOGFILE=`if echo "$(LOGFILE)" | grep -q '^/'; then echo "$(LOGFILE)"; else echo "\`pwd\`/$(LOGFILE)"; fi`.$@
> -
>  BUILD_MAKE_ENV=		"CFLAGS=$(CFLAGS)" "LDFLAGS=$(LDFLAGS)"
>  BUILD_MAKE_ENV+=	"LDLIBS=$(LDLIBS)" $(MAKE_ENV)
> -
>  TEST_MAKE_ENV=		$(MAKE_ENV)
> -
>  BUILD_MAKE=		env $(BUILD_MAKE_ENV) $(MAKE)
> -
>  TEST_MAKE=		env $(TEST_MAKE_ENV) $(MAKE) -k
>  top_srcdir?=		.
> -
>  prefix?=		`$(top_srcdir)/scripts/print_prefix.sh`
> -
>  datadir?=		$(prefix)/share
> -
>  exec_prefix?=		$(prefix)
>  all: conformance-all functional-all stress-all tools-all
> @@ -41,7 +29,7 @@ endif
>  clean: $(CRITICAL_MAKEFILE)
>  	@rm -f $(LOGFILE)*
>  	@for dir in $(SUBDIRS) tools; do \
> -	    $(MAKE) -C $$dir clean >/dev/null; \
> +		$(MAKE) -C $$dir clean >/dev/null; \
>  	done
>  distclean: distclean-makefiles
> @@ -54,7 +42,7 @@ distclean-makefiles:
>  generate-makefiles: distclean-makefiles
>  	@env top_srcdir=$(top_srcdir) \
> -	    $(top_srcdir)/scripts/generate-makefiles.sh
> +		$(top_srcdir)/scripts/generate-makefiles.sh
>  install: bin-install conformance-install functional-install stress-install
> @@ -102,8 +90,8 @@ tools-all:
>  	@$(MAKE) -C tools all
>  $(CRITICAL_MAKEFILE): \
> -    $(top_srcdir)/scripts/generate-makefiles.sh	\
> -    $(top_srcdir)/CFLAGS			\
> -    $(top_srcdir)/LDFLAGS			\
> -    $(top_srcdir)/LDLIBS
> +	$(top_srcdir)/scripts/generate-makefiles.sh	\
> +	$(top_srcdir)/CFLAGS			\
> +	$(top_srcdir)/LDFLAGS			\
> +	$(top_srcdir)/LDLIBS
>  	@$(MAKE) generate-makefiles

Unrelated change: you fix also indent here. It'd be better to add it into
separate patch.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
