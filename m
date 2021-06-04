Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7870439BAFD
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 16:37:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 219883C7FDA
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 16:37:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3466F3C2631
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 16:37:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8F9CF601D51
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 16:37:41 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE89C21A2C;
 Fri,  4 Jun 2021 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622817460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O+EYicu1A7iXAKkHRRcIi+TwG/b7Ov/0TCiH+11CayI=;
 b=Ni+Dl45ErlMp39D77t+F1wlaU82VRTAi6eHaM0W33gsPQ0cAv9U5+sZl+H0vSOb1Jx15w+
 afBFBgBatszZSZUuei+EDsVKcQmBc7qsWJsDZsoPtodoaCPNshpneYkdVKkFyjZ6bL2vo/
 G7C5uOw8z6qHviYSR2UnUVF+8Uv3GxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622817460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O+EYicu1A7iXAKkHRRcIi+TwG/b7Ov/0TCiH+11CayI=;
 b=Zw+74AYIUIVZauQ/VkqN2jC8Dtwh0N9cQwkCdyewRCupG7Y+8aLmaMXawBTO2FqIRAt1pt
 KyQp5SIG6JhzuCCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B2C3B118DD;
 Fri,  4 Jun 2021 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622817460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O+EYicu1A7iXAKkHRRcIi+TwG/b7Ov/0TCiH+11CayI=;
 b=Ni+Dl45ErlMp39D77t+F1wlaU82VRTAi6eHaM0W33gsPQ0cAv9U5+sZl+H0vSOb1Jx15w+
 afBFBgBatszZSZUuei+EDsVKcQmBc7qsWJsDZsoPtodoaCPNshpneYkdVKkFyjZ6bL2vo/
 G7C5uOw8z6qHviYSR2UnUVF+8Uv3GxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622817460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O+EYicu1A7iXAKkHRRcIi+TwG/b7Ov/0TCiH+11CayI=;
 b=Zw+74AYIUIVZauQ/VkqN2jC8Dtwh0N9cQwkCdyewRCupG7Y+8aLmaMXawBTO2FqIRAt1pt
 KyQp5SIG6JhzuCCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id /CSOK7Q6umDZdQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 04 Jun 2021 14:37:40 +0000
Date: Fri, 4 Jun 2021 16:11:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YLo0qHmuGHSCTOTN@yuki>
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <20210604111434.21422-2-rpalethorpe@suse.com>
 <YLo0XKY9b+S2ROQQ@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLo0XKY9b+S2ROQQ@pevik>
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> make -C "/home/pvorel/install/src/ltp.git/lib" -f "/src/ltp/lib/Makefile" all
> make[1]: Entering directory '/src/ltp/lib'
> make[2]: Nothing to be done for 'all'.
> make[2]: Nothing to be done for 'all'.
> make[1]: Leaving directory '/src/ltp/lib'
> CC testcases/kernel/syscalls/chown/chown01.o
> LD testcases/kernel/syscalls/chown/chown01
> CC testcases/kernel/syscalls/chown/chown02.o
> LD testcases/kernel/syscalls/chown/chown02
> CC testcases/kernel/syscalls/chown/chown03.o
> LD testcases/kernel/syscalls/chown/chown03
> CC testcases/kernel/syscalls/chown/chown04.o
> LD testcases/kernel/syscalls/chown/chown04
> CC testcases/kernel/syscalls/chown/chown05.o
> LD testcases/kernel/syscalls/chown/chown05
> make: *** No rule to make target 'chown01_16.c', needed by 'chown01_16'.  Stop.
> rm chown01.o chown03.o chown02.o chown05.o chown04.o
> 
> This is a newly introduced failure caused by some change in include/mk/ in this
> commit.

This is caused by the definition of CHECK_TARGETS in the env_post.mk,
the foo_16 binaries are generated from foo.c sources and there is no
foo_16.c which in turn confuses the check code. I.e. what this means is
that MAKE_TARGETS != list of sources without suffix and we have to do:

diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
index 8903a934d..c6367b0a5 100644
--- a/include/mk/env_post.mk
+++ b/include/mk/env_post.mk
@@ -89,7 +89,7 @@ $(error You must define $$(prefix) before executing install)
 endif # END $(filter-out install,$(MAKECMDGOALS)),$(MAKECMDGOALS)
 endif
 
-CHECK_TARGETS                  ?= $(addprefix check-,$(MAKE_TARGETS))
+CHECK_TARGETS                  ?= $(addprefix check-, $(patsubst %.c,%,$(sort $(wildcard $(abs_srcdir)/*.c))))
 CHECK                          ?= $(abs_top_srcdir)/tools/clang-check/main
 CHECK_FLAGS                    ?= -resource-dir $(shell $(CLANG) -print-resource-dir)


> Also make check on regular test expect it's a library. IMHO these two must be
> probably separated:
> 
> $ cd testcases/kernel/syscalls/fchown/ && make check
> CHECK testcases/kernel/syscalls/fchown/fchown01.c
> CHECK testcases/kernel/syscalls/fchown/fchown02.c
> CHECK testcases/kernel/syscalls/fchown/fchown03.c
> CHECK testcases/kernel/syscalls/fchown/fchown04.c
> fchown05.c:80:4: CHECK ERROR: TEST() macro should not be used in library
> make: *** [../../../../include/mk/rules.mk:46: check-fchown05] Error 1

I guess that we can pass different flags to the binary so that it gets
the context right.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
