Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C63A4350
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 15:50:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE90A3C8EA1
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 15:50:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 63C333C307A
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 15:50:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6EDB5601403
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 15:50:02 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8A65321A5C;
 Fri, 11 Jun 2021 13:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623419401;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1PlLonmDf5JSN3DQY2ha4Xsv2jXRGGosv1vEt1sey3M=;
 b=UaOpXb3w+4nnLetGp4kizJJ8cYRntA3aAQF5BeqG2MA75FjVLmFvXApfC0FlHRdMbo0jJV
 gHNNtDUTG7mTWiVWk1xbF96Fe9VUkWzXB96Dst4L2pX4uORSfCncYI/VM1WcJdtIoqJPH4
 BcatWaze7UCU0Qet/ryQY0mUuxrYL90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623419401;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1PlLonmDf5JSN3DQY2ha4Xsv2jXRGGosv1vEt1sey3M=;
 b=E6jnmo9rKpwas+OEcajhW+vsekfuURg1YjQ5HP+4y0k4UktvMjM6865rb1UO8IX2QA1Hk+
 l0EFDi8m2pqDnMDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 30A65118DD;
 Fri, 11 Jun 2021 13:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623419401;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1PlLonmDf5JSN3DQY2ha4Xsv2jXRGGosv1vEt1sey3M=;
 b=UaOpXb3w+4nnLetGp4kizJJ8cYRntA3aAQF5BeqG2MA75FjVLmFvXApfC0FlHRdMbo0jJV
 gHNNtDUTG7mTWiVWk1xbF96Fe9VUkWzXB96Dst4L2pX4uORSfCncYI/VM1WcJdtIoqJPH4
 BcatWaze7UCU0Qet/ryQY0mUuxrYL90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623419401;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1PlLonmDf5JSN3DQY2ha4Xsv2jXRGGosv1vEt1sey3M=;
 b=E6jnmo9rKpwas+OEcajhW+vsekfuURg1YjQ5HP+4y0k4UktvMjM6865rb1UO8IX2QA1Hk+
 l0EFDi8m2pqDnMDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id fCrtCQlqw2B5ZAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 11 Jun 2021 13:50:01 +0000
Date: Fri, 11 Jun 2021 15:49:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YMNqB2j57/b7ESJB@pevik>
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <20210604111434.21422-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604111434.21422-2-rpalethorpe@suse.com>
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

> Allows the user to run 'make check' to check all source files or
> 'make check-<target>' to check one source file corresponding to a
> target.

> Adds makefile pieces for tools/clang-check/main which will be a
> libclang based tool. By default this is ran by 'make check'.

> In theory allows other tools to be specified with
> 'make CHECK=tool CHECK_FLAGS=<args> check...'. e.g. 'make CHECK=sparse
> CHECK_FLAGS= check-tst_cgroup'

one more proposal (addition to Metan's fix [1]):
how about to add top level make check target:

diff --git Makefile Makefile
index 56812d77b..b65315618 100644
--- Makefile
+++ Makefile
@@ -79,6 +79,7 @@ BOOTSTRAP_TARGETS	:= $(sort $(COMMON_TARGETS) $(CLEAN_TARGETS) $(INSTALL_TARGETS
 CLEAN_TARGETS		:= $(addsuffix -clean,$(CLEAN_TARGETS))
 INSTALL_TARGETS		:= $(addsuffix -install,$(INSTALL_TARGETS))
 MAKE_TARGETS		:= $(addsuffix -all,$(filter-out lib,$(COMMON_TARGETS)))
+CHECK_TARGETS		:= $(addsuffix -check,testcases lib)
 
 # There's no reason why we should run `all' twice. Otherwise we're just wasting
 # 3+ mins of useful CPU cycles on a modern machine, and even more time on an
@@ -99,6 +100,11 @@ INSTALL_DIR		:= $(abspath $(INSTALL_DIR))
 $(sort $(addprefix $(abs_top_builddir)/,$(BOOTSTRAP_TARGETS)) $(INSTALL_DIR) $(DESTDIR)/$(bindir)):
 	mkdir -m 00755 -p "$@"
 
+$(CHECK_TARGETS):
+	echo "CHECK_TARGETS: $(CHECK_TARGETS)"; \
+	$(MAKE) -C "$(subst -check,,$@)" \
+		-f "$(abs_top_srcdir)/$(subst -check,,$@)/Makefile" all
+
 ## Pattern based subtarget rules.
 lib-install: lib-all
 
@@ -189,6 +195,9 @@ INSTALL_TARGETS		+= $(addprefix $(DESTDIR)/$(bindir)/,$(BINDIR_INSTALL_SCRIPTS))
 
 $(INSTALL_TARGETS): $(INSTALL_DIR) $(DESTDIR)/$(bindir)
 
+## Check
+check: $(CHECK_TARGETS)
+
 ## Install
 install: $(INSTALL_TARGETS)
 
---

Kind regards,
Petr

[1] https://lists.linux.it/pipermail/ltp/2021-June/023017.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
