Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7133839BB57
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 16:59:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1088F3C7FCB
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 16:59:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3D3FE3C2631
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 16:59:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 96439601085
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 16:59:13 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C9A2A21A1B;
 Fri,  4 Jun 2021 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622818752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tzVBV6bYe+XA2Tb729OT+5Ut1zTU1W18aIpDoo4VyjY=;
 b=hrvHtO5DXIXMs8qnp2FDyBGJ0fH33SaVR/nQkVgFGPgKBy10IKIVepEuYCFo2k2JqGORzI
 dAgcx6tmEgynvzf1q8Ft9B6LnfJVMOW70IyvgQnWoSvzY6J8b8cRL5F9qNq5WVifcIwR3G
 U6hqftLYrLMh7VZpimJNBWj5p/eOEcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622818752;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tzVBV6bYe+XA2Tb729OT+5Ut1zTU1W18aIpDoo4VyjY=;
 b=R/RsQaPj6OyvlUCYrr6V0QVVjjJpoGR2blUMcxrlzGGdVUju+jaYuCjRhS3Myl7kjy9dGD
 7lxoOGoItp1usHCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id ACB70118DD;
 Fri,  4 Jun 2021 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622818752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tzVBV6bYe+XA2Tb729OT+5Ut1zTU1W18aIpDoo4VyjY=;
 b=hrvHtO5DXIXMs8qnp2FDyBGJ0fH33SaVR/nQkVgFGPgKBy10IKIVepEuYCFo2k2JqGORzI
 dAgcx6tmEgynvzf1q8Ft9B6LnfJVMOW70IyvgQnWoSvzY6J8b8cRL5F9qNq5WVifcIwR3G
 U6hqftLYrLMh7VZpimJNBWj5p/eOEcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622818752;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tzVBV6bYe+XA2Tb729OT+5Ut1zTU1W18aIpDoo4VyjY=;
 b=R/RsQaPj6OyvlUCYrr6V0QVVjjJpoGR2blUMcxrlzGGdVUju+jaYuCjRhS3Myl7kjy9dGD
 7lxoOGoItp1usHCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id udnXKMA/umDQfwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 04 Jun 2021 14:59:12 +0000
Date: Fri, 4 Jun 2021 16:33:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YLo5szc46auM8Pit@yuki>
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <20210604111434.21422-2-rpalethorpe@suse.com>
 <YLo0XKY9b+S2ROQQ@pevik> <87zgw5iu0i.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zgw5iu0i.fsf@suse.de>
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > $ make check
> > make: *** No rule to make target 'check'.  Stop.
> >
> > $ cd lib && make check
> > CHECK lib/cloner.c
> > CHECK lib/get_path.c
> > CHECK lib/parse_opts.c
> > CHECK lib/random_range.c
> > CHECK lib/safe_file_ops.c
> > CHECK lib/safe_macros.c
> > CHECK lib/safe_net.c
> > CHECK lib/safe_pthread.c
> > CHECK lib/safe_stdio.c
> > CHECK lib/self_exec.c
> > CHECK lib/tlibio.c
> > tst_af_alg.c:16:2: CHECK ERROR: TEST() macro should not be used in library
> > tst_af_alg.c:27:2: CHECK ERROR: TEST() macro should not be used in library
> > tst_af_alg.c:74:2: CHECK ERROR: TEST() macro should not be used in library
> > tst_af_alg.c:109:2: CHECK ERROR: TEST() macro should not be used in library
> > tst_af_alg.c:119:2: CHECK ERROR: TEST() macro should not be used in library
> > make: *** [../include/mk/rules.mk:46: check-tst_af_alg] Error 1
> >
> > Similarly what I added to my patchset which also adds new make target:
> > https://patchwork.ozlabs.org/project/ltp/patch/20210603183827.24339-2-pvorel@suse.cz/
> > Although my code has duplicate issue:
> > ../include/mk/generic_trunk_target.inc:105: warning: overriding recipe for target 'check-c'
> > ../include/mk/generic_leaf_target.inc:110: warning: ignoring old recipe for target 'check-c'
> > ../include/mk/generic_trunk_target.inc:105: warning: overriding recipe for target 'check-shell'
> > ../include/mk/generic_leaf_target.inc:118: warning: ignoring old recipe for target 'check-shell'
> >
> > Also make check on regular test expect it's a library. IMHO these two must be
> > probably separated:
> >
> > $ cd testcases/kernel/syscalls/fchown/ && make check
> > CHECK testcases/kernel/syscalls/fchown/fchown01.c
> > CHECK testcases/kernel/syscalls/fchown/fchown02.c
> > CHECK testcases/kernel/syscalls/fchown/fchown03.c
> > CHECK testcases/kernel/syscalls/fchown/fchown04.c
> > fchown05.c:80:4: CHECK ERROR: TEST() macro should not be used in library
> > make: *** [../../../../include/mk/rules.mk:46: check-fchown05] Error 1
> 
> It fails because it is using the old test API, so there is no struct
> tst_test test var. I don't think we need to separate the checker. It can
> detect what type of file (translation unit) it is processing. In the
> case of old API tests, I would simply disable any checks.
> 
> All the old tests and test libraries will have something in common. For
> the tests, they all import "test.h" (even if through another header), so
> we can identify them by that.

For the top level library we pass -DLTPLIB in CFLAGS, not sure if that
could be used to identify library code...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
