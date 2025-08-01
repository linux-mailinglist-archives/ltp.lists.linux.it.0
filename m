Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F912B18010
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Aug 2025 12:21:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB75B3CCDFF
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Aug 2025 12:21:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 309393CCDE5
 for <ltp@lists.linux.it>; Fri,  1 Aug 2025 12:20:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 784BD600CCA
 for <ltp@lists.linux.it>; Fri,  1 Aug 2025 12:20:54 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 56CBC21B74;
 Fri,  1 Aug 2025 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1754043653;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YH3GiZ4qHAk1t5WXpOK4mtsQKLN14cFEapeWm1OfiBU=;
 b=oG9VSRpz/SbXKFbaE7hwqP/upo9yBXNf8sgDHGGmPNr3TLwMQTWFW3jmOdVmURVW+SdBdL
 SUQfpZ1PovmXJxp9LJqsg24iOPHWLItDNyCrAAYHVUVxXsgt5ianIt5ob3gWL8Akr6emjb
 lIcdOp3hbhegnoLAj+jo2enHgwAiols=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1754043653;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YH3GiZ4qHAk1t5WXpOK4mtsQKLN14cFEapeWm1OfiBU=;
 b=y7arpDIsxF456oL0+QMh818WiNhno650CO2GlFmidhFnMKK7q5KPzHxsSQPRfvtmHQka9z
 ZMObXtVMD9CWniDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1754043653;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YH3GiZ4qHAk1t5WXpOK4mtsQKLN14cFEapeWm1OfiBU=;
 b=oG9VSRpz/SbXKFbaE7hwqP/upo9yBXNf8sgDHGGmPNr3TLwMQTWFW3jmOdVmURVW+SdBdL
 SUQfpZ1PovmXJxp9LJqsg24iOPHWLItDNyCrAAYHVUVxXsgt5ianIt5ob3gWL8Akr6emjb
 lIcdOp3hbhegnoLAj+jo2enHgwAiols=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1754043653;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YH3GiZ4qHAk1t5WXpOK4mtsQKLN14cFEapeWm1OfiBU=;
 b=y7arpDIsxF456oL0+QMh818WiNhno650CO2GlFmidhFnMKK7q5KPzHxsSQPRfvtmHQka9z
 ZMObXtVMD9CWniDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21374138A5;
 Fri,  1 Aug 2025 10:20:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Cv+cBQWVjGiZSgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 01 Aug 2025 10:20:53 +0000
Date: Fri, 1 Aug 2025 12:20:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20250801102047.GA974145@pevik>
References: <20250801100935.974351-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250801100935.974351-1-pvorel@suse.cz>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -3.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/1] Makefile: Add kernel modules related make
 targets
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

Hi,

> Changes v1->v2:
> * Add also modules-clean and modules-install
> This is needed as 'make modules clean' or 'make modules install'
> would be running 2 separate targets.

Also, I wondered about fail when kernel modules aren't build:

include/mk/module.mk contains:

ifeq ($(WITH_MODULES),no)
SKIP := 1
else
ifeq ($(LINUX_VERSION_MAJOR)$(LINUX_VERSION_PATCH),)
SKIP := 1
else
SKIP ?= $(shell \
	[ "$(LINUX_VERSION_MAJOR)" -gt "$(REQ_VERSION_MAJOR)" ] || \
	[ "$(LINUX_VERSION_MAJOR)" -eq "$(REQ_VERSION_MAJOR)" -a \
	  "$(LINUX_VERSION_PATCH)" -ge "$(REQ_VERSION_PATCH)" ]; echo $$?)
endif
endif

ifneq ($(SKIP),0)
MAKE_TARGETS := $(filter-out %.ko, $(MAKE_TARGETS))
endif

# Ignoring the exit status of commands is done to be forward compatible with
# kernel internal API changes. The user-space test will return TCONF, if it
# doesn't find the module (i.e. it wasn't built either due to kernel-devel
# missing or module build failure).
%.ko: %.c .dep_modules ;
-----

We could allow to fail build with:
$ make modules FORCE=1

with these changes to include/mk/module.mk:

ifneq ($(SKIP),0)
MAKE_TARGETS := $(filter-out %.ko, $(MAKE_TARGETS))
ifeq ($(FORCE),1)
$(error Modules not built)
endif
endif

ifneq ($(FORCE),1)
%.ko: %.c .dep_modules ;
endif

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
