Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEBE3A6320
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 13:09:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB99E3C4D16
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 13:09:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 60B9F3C2779
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 13:09:33 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C8442600486
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 13:09:32 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E420E1FD33
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623668971;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+f/VUKyxLoudZXeJHF4k3sBAYPT80Vf0HMk3LuGZlYc=;
 b=rSoOKQvsjYF7j0FVzdc63BDiwkGr84++xLB4k5sstEq6YIzq7moTVKqJbZhPxSSHW7skTw
 QdtPqTL5+M/e+dQ0y2pp18ziu7eXZZtFadBjHFUqCd6sr4Kz4dSaWwswoPfDCR4F1iCZpG
 IanvKP+5eTmfv83Ogssoxxh01lXQByk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623668971;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+f/VUKyxLoudZXeJHF4k3sBAYPT80Vf0HMk3LuGZlYc=;
 b=lbXLvAEtCG7AR2chKwzyH7MRCP2nMVopfQVZgG7t0JLegzeest4aZI563FX1OH7efgbp9y
 hAq+Phm40WkBLuAg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id AA316A3BD8;
 Mon, 14 Jun 2021 11:09:31 +0000 (UTC)
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <20210604111434.21422-2-rpalethorpe@suse.com> <YMNqB2j57/b7ESJB@pevik>
 <YMNwj5509FviXCza@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YMNwj5509FviXCza@pevik>
Date: Mon, 14 Jun 2021 12:09:31 +0100
Message-ID: <87tum04s9g.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Petr,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>> Hi Richie,
>
>> one more proposal (addition to Metan's fix [1]):
>> how about to add top level make check target:
>
>> diff --git Makefile Makefile
>> index 56812d77b..b65315618 100644
>> --- Makefile
>> +++ Makefile
>> @@ -79,6 +79,7 @@ BOOTSTRAP_TARGETS	:= $(sort $(COMMON_TARGETS) $(CLEAN_TARGETS) $(INSTALL_TARGETS
>>  CLEAN_TARGETS		:= $(addsuffix -clean,$(CLEAN_TARGETS))
>>  INSTALL_TARGETS		:= $(addsuffix -install,$(INSTALL_TARGETS))
>>  MAKE_TARGETS		:= $(addsuffix -all,$(filter-out lib,$(COMMON_TARGETS)))
>> +CHECK_TARGETS		:= $(addsuffix -check,testcases lib)
>
>>  # There's no reason why we should run `all' twice. Otherwise we're just wasting
>>  # 3+ mins of useful CPU cycles on a modern machine, and even more time on an
>> @@ -99,6 +100,11 @@ INSTALL_DIR		:= $(abspath $(INSTALL_DIR))
>>  $(sort $(addprefix $(abs_top_builddir)/,$(BOOTSTRAP_TARGETS)) $(INSTALL_DIR) $(DESTDIR)/$(bindir)):
>>  	mkdir -m 00755 -p "$@"
>
>> +$(CHECK_TARGETS):
>> +	echo "CHECK_TARGETS: $(CHECK_TARGETS)"; \
> This should be obviously left out (my debug message).
>> +	$(MAKE) -C "$(subst -check,,$@)" \
>> +		-f "$(abs_top_srcdir)/$(subst -check,,$@)/Makefile" all
> This should be check target
> 		-f "$(abs_top_srcdir)/$(subst -check,,$@)/Makefile" check
>> +
>>  ## Pattern based subtarget rules.
>>  lib-install: lib-all
>
>> @@ -189,6 +195,9 @@ INSTALL_TARGETS		+= $(addprefix $(DESTDIR)/$(bindir)/,$(BINDIR_INSTALL_SCRIPTS))
>
>>  $(INSTALL_TARGETS): $(INSTALL_DIR) $(DESTDIR)/$(bindir)
>
>> +## Check
>> +check: $(CHECK_TARGETS)
>> +
>>  ## Install
>>  install: $(INSTALL_TARGETS)
>
>> ---
>
> + there needs to be check added to RECURSIVE_TARGETS
> +++ include/mk/generic_trunk_target.inc
> @@ -48,7 +48,7 @@
>  
>  include $(top_srcdir)/include/mk/functions.mk
>  
> -RECURSIVE_TARGETS		?= all install
> +RECURSIVE_TARGETS		?= all install check
>  
>  $(eval $(get_make_dirs))
>  
> ---
>
> Kind regards,
> Petr

Thanks. It appears defining trunk-check (similar to check-all) and
"check: trunk-check" in addition to adding check to the recursive
targets seems to work.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
