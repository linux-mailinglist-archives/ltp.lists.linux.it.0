Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 689FC3A43E8
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:17:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 301593C7630
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:17:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A0C593C3089
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:17:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3E6C8600077
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:17:55 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C26C81FD73;
 Fri, 11 Jun 2021 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623421074;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qa2o6thvtEv+2TiTuFoTL7BdQzrKbd1J+/u6wG0/YhQ=;
 b=NkAKBFmXzxfrh5vK2TXpw0KxSre8kh2g6nsgeiPbr4xyJBQAEy7OTwHLWyoIx37HoNbFtK
 glu0VDob7zp64YCi/Pb5jviVCgFKIRx399YsZxL8iEi+yprW5ne0rb0gbhxQ42dcf0dJOw
 IF8bCnUed1zIIUPMY/TNo03ojE+PRMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623421074;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qa2o6thvtEv+2TiTuFoTL7BdQzrKbd1J+/u6wG0/YhQ=;
 b=zNWR2cmjfFw+rIxCEKoHF+h7+rlyym86KRVkAtEvgu241aZXfr92Mc86SGY5eucmHPWyFe
 J4MdfYX5NLw2AbCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 86C53118DD;
 Fri, 11 Jun 2021 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623421074;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qa2o6thvtEv+2TiTuFoTL7BdQzrKbd1J+/u6wG0/YhQ=;
 b=NkAKBFmXzxfrh5vK2TXpw0KxSre8kh2g6nsgeiPbr4xyJBQAEy7OTwHLWyoIx37HoNbFtK
 glu0VDob7zp64YCi/Pb5jviVCgFKIRx399YsZxL8iEi+yprW5ne0rb0gbhxQ42dcf0dJOw
 IF8bCnUed1zIIUPMY/TNo03ojE+PRMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623421074;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qa2o6thvtEv+2TiTuFoTL7BdQzrKbd1J+/u6wG0/YhQ=;
 b=zNWR2cmjfFw+rIxCEKoHF+h7+rlyym86KRVkAtEvgu241aZXfr92Mc86SGY5eucmHPWyFe
 J4MdfYX5NLw2AbCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id eWe5HpJww2CIcgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 11 Jun 2021 14:17:54 +0000
Date: Fri, 11 Jun 2021 16:17:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Message-ID: <YMNwj5509FviXCza@pevik>
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <20210604111434.21422-2-rpalethorpe@suse.com>
 <YMNqB2j57/b7ESJB@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMNqB2j57/b7ESJB@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/2] Add 'make check' and clang-check to
 build system
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,
> Hi Richie,

> one more proposal (addition to Metan's fix [1]):
> how about to add top level make check target:

> diff --git Makefile Makefile
> index 56812d77b..b65315618 100644
> --- Makefile
> +++ Makefile
> @@ -79,6 +79,7 @@ BOOTSTRAP_TARGETS	:= $(sort $(COMMON_TARGETS) $(CLEAN_TARGETS) $(INSTALL_TARGETS
>  CLEAN_TARGETS		:= $(addsuffix -clean,$(CLEAN_TARGETS))
>  INSTALL_TARGETS		:= $(addsuffix -install,$(INSTALL_TARGETS))
>  MAKE_TARGETS		:= $(addsuffix -all,$(filter-out lib,$(COMMON_TARGETS)))
> +CHECK_TARGETS		:= $(addsuffix -check,testcases lib)

>  # There's no reason why we should run `all' twice. Otherwise we're just wasting
>  # 3+ mins of useful CPU cycles on a modern machine, and even more time on an
> @@ -99,6 +100,11 @@ INSTALL_DIR		:= $(abspath $(INSTALL_DIR))
>  $(sort $(addprefix $(abs_top_builddir)/,$(BOOTSTRAP_TARGETS)) $(INSTALL_DIR) $(DESTDIR)/$(bindir)):
>  	mkdir -m 00755 -p "$@"

> +$(CHECK_TARGETS):
> +	echo "CHECK_TARGETS: $(CHECK_TARGETS)"; \
This should be obviously left out (my debug message).
> +	$(MAKE) -C "$(subst -check,,$@)" \
> +		-f "$(abs_top_srcdir)/$(subst -check,,$@)/Makefile" all
This should be check target
		-f "$(abs_top_srcdir)/$(subst -check,,$@)/Makefile" check
> +
>  ## Pattern based subtarget rules.
>  lib-install: lib-all

> @@ -189,6 +195,9 @@ INSTALL_TARGETS		+= $(addprefix $(DESTDIR)/$(bindir)/,$(BINDIR_INSTALL_SCRIPTS))

>  $(INSTALL_TARGETS): $(INSTALL_DIR) $(DESTDIR)/$(bindir)

> +## Check
> +check: $(CHECK_TARGETS)
> +
>  ## Install
>  install: $(INSTALL_TARGETS)

> ---

+ there needs to be check added to RECURSIVE_TARGETS
+++ include/mk/generic_trunk_target.inc
@@ -48,7 +48,7 @@
 
 include $(top_srcdir)/include/mk/functions.mk
 
-RECURSIVE_TARGETS		?= all install
+RECURSIVE_TARGETS		?= all install check
 
 $(eval $(get_make_dirs))
 
---

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
