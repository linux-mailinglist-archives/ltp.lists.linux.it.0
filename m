Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E439BB83
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 17:15:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EF663C5419
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 17:15:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 21F9C3C26C2
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 17:14:55 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0C96B60107A
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 17:14:54 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5507D21963;
 Fri,  4 Jun 2021 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622819694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4UFZ3Y8A3GcBxdFi0RTzZjMlsyngSq8kUFNC8XoZ/sU=;
 b=sw49J/lkwqTD5cI0fauufkAIrQImo2SY20dEHz9/CrtuYbUKQwIOV5kohZI/GiBbmJZRQp
 g9uACmNXbyUGxVDGjTYaSQTia8HNrdAAkJMdKI7HLSe/wH2UXYs6bEpJCg1lk82XwpY3uS
 4dO0mP7Xa1D9NRBpavMh7cl2x6ptq1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622819694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4UFZ3Y8A3GcBxdFi0RTzZjMlsyngSq8kUFNC8XoZ/sU=;
 b=O1EyJQSn/T4sNfdAC7ueIq0iz9OFtfvmLxkKRLhpNwOsryoRO+kOAAHklIeU3pY0D39koZ
 vjmXJlc7ZqB4ghBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 340DC118DD;
 Fri,  4 Jun 2021 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622819694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4UFZ3Y8A3GcBxdFi0RTzZjMlsyngSq8kUFNC8XoZ/sU=;
 b=sw49J/lkwqTD5cI0fauufkAIrQImo2SY20dEHz9/CrtuYbUKQwIOV5kohZI/GiBbmJZRQp
 g9uACmNXbyUGxVDGjTYaSQTia8HNrdAAkJMdKI7HLSe/wH2UXYs6bEpJCg1lk82XwpY3uS
 4dO0mP7Xa1D9NRBpavMh7cl2x6ptq1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622819694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4UFZ3Y8A3GcBxdFi0RTzZjMlsyngSq8kUFNC8XoZ/sU=;
 b=O1EyJQSn/T4sNfdAC7ueIq0iz9OFtfvmLxkKRLhpNwOsryoRO+kOAAHklIeU3pY0D39koZ
 vjmXJlc7ZqB4ghBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 5n8vC25DumDcCAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 04 Jun 2021 15:14:54 +0000
Date: Fri, 4 Jun 2021 16:49:05 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YLo9YXWrWweICm81@yuki>
References: <20210603183827.24339-1-pvorel@suse.cz>
 <20210603183827.24339-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603183827.24339-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/3] make: Add make check{,-c,-shell} targets
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
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> For testing C and shell API.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  Makefile                            | 21 ++++++++++++++++++++-
>  include/mk/generic_leaf_target.inc  | 25 ++++++++++++++++++++++---
>  include/mk/generic_trunk_target.inc |  4 ++--
>  lib/newlib_tests/Makefile           |  8 ++++++++
>  4 files changed, 52 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 56812d77b..acea4551e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -75,10 +75,14 @@ endif
>  INSTALL_TARGETS		+= $(COMMON_TARGETS)
>  CLEAN_TARGETS		+= $(COMMON_TARGETS) lib libs
>  BOOTSTRAP_TARGETS	:= $(sort $(COMMON_TARGETS) $(CLEAN_TARGETS) $(INSTALL_TARGETS))
> +TEST_TARGETS		:= lib
> +TEST_SHELL_TARGETS	:= lib
>  
>  CLEAN_TARGETS		:= $(addsuffix -clean,$(CLEAN_TARGETS))
>  INSTALL_TARGETS		:= $(addsuffix -install,$(INSTALL_TARGETS))
>  MAKE_TARGETS		:= $(addsuffix -all,$(filter-out lib,$(COMMON_TARGETS)))
> +TEST_TARGETS		:= $(addsuffix -check-c,$(TEST_TARGETS))
> +TEST_SHELL_TARGETS	:= $(addsuffix -check-shell,$(TEST_SHELL_TARGETS))
>  
>  # There's no reason why we should run `all' twice. Otherwise we're just wasting
>  # 3+ mins of useful CPU cycles on a modern machine, and even more time on an
> @@ -113,6 +117,14 @@ $(filter-out include-clean,$(CLEAN_TARGETS))::
>  	-$(MAKE) -C "$(subst -clean,,$@)" \
>  		 -f "$(abs_top_srcdir)/$(subst -clean,,$@)/Makefile" clean
>  
> +$(TEST_TARGETS): lib-all
> +	$(MAKE) -C "$(subst -check-c,,$@)" \
> +		-f "$(abs_top_srcdir)/$(subst -check-c,,$@)/Makefile" check-c
> +
> +$(TEST_SHELL_TARGETS):
> +	$(MAKE) -C "$(subst -check-shell,,$@)" \
> +		-f "$(abs_top_srcdir)/$(subst -check-shell,,$@)/Makefile" check-shell
> +
>  # Just like everything depends on include-all / -install, we need to get rid
>  # of include last to ensure that things won't be monkey screwed up. Only do
>  # this if we're invoking clean or a subclean directly though.
> @@ -189,8 +201,15 @@ INSTALL_TARGETS		+= $(addprefix $(DESTDIR)/$(bindir)/,$(BINDIR_INSTALL_SCRIPTS))
>  
>  $(INSTALL_TARGETS): $(INSTALL_DIR) $(DESTDIR)/$(bindir)
>  
> +.PHONY: check check-c check-shell
> +
> +## Check
> +check-c: $(TEST_TARGETS)
> +check-shell: $(TEST_SHELL_TARGETS)
> +check: check-c check-shell
> +
>  ## Install
> -install: $(INSTALL_TARGETS)
> +install: lib-all $(INSTALL_TARGETS)
>  
>  ## Help
>  .PHONY: help
> diff --git a/include/mk/generic_leaf_target.inc b/include/mk/generic_leaf_target.inc
> index 64953f89a..d53623456 100644
> --- a/include/mk/generic_leaf_target.inc
> +++ b/include/mk/generic_leaf_target.inc
> @@ -63,8 +63,12 @@
>  #				  real files or directories). This will automatically append
>  #				  adds the .o suffix to all files referenced by
>  #				  $(MAKE_TARGETS)) to CLEAN_TARGETS, if MAKE_TARGETS wasn't
> -#				  defined (see
> -#				  $(MAKE_TARGETS)).
> +#				  defined (see $(MAKE_TARGETS)).
> +#
> +# $(TEST_TARGETS)		: LTP C API tests.
> +#
> +# $(TEST_SHELL_TARGETS)		: LTP shell API tests.
> +#
>  # $(INSTALL_MODE)		: What mode should we using when calling
>  # 				  install(1)?
>  #
> @@ -92,7 +96,7 @@
>  # INSTALL_DIR			:= $(libdir)
>  #
>  
> -.PHONY: all clean install
> +.PHONY: all check-c check-shell clean install
>  
>  ifneq ($(strip $(MAKE_TARGETS)),)
>  $(MAKE_TARGETS) += $(HOST_MAKE_TARGETS)
> @@ -102,6 +106,21 @@ $(MAKE_TARGETS): | $(MAKE_DEPS)
>  
>  all: $(MAKE_TARGETS)
>  
> +check-c: $(TEST_TARGETS)
> +	@set -e; echo; echo "===== Test C API ====="; \
> +	for i in $(TEST_TARGETS); do \
> +	    echo; echo "* $$i"; \
> +	    echo "PATH $(top_srcdir)/testcases/lib:$$PATH"; \
> +	    PATH="$(top_srcdir)/testcases/lib:$$PATH" ./$$i || [ $$? -eq 32 ]; \
> +	done
> +
> +check-shell: $(TEST_SHELL_TARGETS)
> +	@set -e; echo; echo "===== Test shell API ====="; \
> +	for i in $(TEST_SHELL_TARGETS); do \
> +	    echo; echo "* $$i"; \
> +	    PATH="$(abs_top_srcdir)/testcases/lib:$(abs_top_builddir)/testcases/lib:$$PATH" $(abs_srcdir)/$$i || [ $$? -eq 32 ]; \
> +	done
> +
>  clean:: $(CLEAN_DEPS)
>  	-$(RM) -f -r $(CLEAN_TARGETS)
>  
> diff --git a/include/mk/generic_trunk_target.inc b/include/mk/generic_trunk_target.inc
> index fc59f944f..d195fe3bd 100644
> --- a/include/mk/generic_trunk_target.inc
> +++ b/include/mk/generic_trunk_target.inc
> @@ -48,7 +48,7 @@
>  
>  include $(top_srcdir)/include/mk/functions.mk
>  
> -RECURSIVE_TARGETS		?= all install
> +RECURSIVE_TARGETS		?= all check check-c check-shell install

If you add a target to RECURSIVE_TARGETS such target automatically
traverses directories, that what the target is for. See the rule at the
end of the generic_trunk_target.inc. Which means that you redefine
targets if you define the same targets to loop and run the tests above.

I guess that you want add another target that depends on check targets
to actually run the tests?

Maybe:

check-c: check-c-run

check-c-run: $(TEST_TARGETS)
	for i in $(TEST_TARGETS); do
		...
	done

in order to run the tests.

In this case the check* targets would be used for directory traversal
and the check-c-run would be used to run the tests.

>  $(eval $(get_make_dirs))
>  
> @@ -71,7 +71,7 @@ trunk-install: $(INSTALL_FILES)
>  # Avoid creating duplicate .PHONY references to all, clean, and install. IIRC,
>  # I've seen some indeterministic behavior when one does this in the past with
>  # GNU Make...
> -.PHONY: $(filter-out $(RECURSIVE_TARGETS),all clean install)
> +.PHONY: $(filter-out $(RECURSIVE_TARGETS),all check clean install)

The check is already in RECURSIVE_TARGETS

>  all: trunk-all
>  
>  clean:: trunk-clean
> diff --git a/lib/newlib_tests/Makefile b/lib/newlib_tests/Makefile
> index 30ca6810c..182ef5689 100644
> --- a/lib/newlib_tests/Makefile
> +++ b/lib/newlib_tests/Makefile
> @@ -19,5 +19,13 @@ ifeq ($(ANDROID),1)
>  FILTER_OUT_MAKE_TARGETS	+= test08
>  endif
>  
> +# C API tests (which exit 0)
> +TEST_TARGETS += test0[579] test1[2568] test_exec test_timer
> +TEST_TARGETS += tst_bool_expr tst_res_hexd tst_strstatus
> +TEST_TARGETS += tst_fuzzy_sync0[1-2]
> +
> +# shell API tests (which exit 0)
> +TEST_SHELL_TARGETS += shell/tst_check_driver.sh
> +TEST_SHELL_TARGETS += shell/net/*.sh
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> -- 
> 2.31.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
