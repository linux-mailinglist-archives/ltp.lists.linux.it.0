Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B839BDC2
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 18:56:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A36C3C7FE0
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 18:56:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EBA113C248C
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 18:56:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 573201A0154B
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 18:56:03 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 53A8321A3A;
 Fri,  4 Jun 2021 16:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622825762;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xpjosN7Lf//Pd+7IUjT1f+SVABLvml9WkCfMBlsORZQ=;
 b=UzW7SFdFzqq5iCa64/gNy4yMlk2TcqKlz7drO/TvY2lnN8ZQsDADhqzNvqt2EyxvpfDHdX
 aEg4ANlz+/nfBw/iCiVx3KJ8pEhc3HvsWrDlWh/9SJhJy3EXsSa6M97kB+6H7AQXbeo2I7
 i0cYCKswLMm7x3GDVL2vBDsL3d/Nbtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622825762;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xpjosN7Lf//Pd+7IUjT1f+SVABLvml9WkCfMBlsORZQ=;
 b=H1hRqz3hXmSt84nXFPVHTW3DpfXTojGbiAXxJ+C8BEZA+9q/4glUO/V6RvAcf4IPn/viag
 n9UkE1wM8sSZrADA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0D063118DD;
 Fri,  4 Jun 2021 16:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622825762;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xpjosN7Lf//Pd+7IUjT1f+SVABLvml9WkCfMBlsORZQ=;
 b=UzW7SFdFzqq5iCa64/gNy4yMlk2TcqKlz7drO/TvY2lnN8ZQsDADhqzNvqt2EyxvpfDHdX
 aEg4ANlz+/nfBw/iCiVx3KJ8pEhc3HvsWrDlWh/9SJhJy3EXsSa6M97kB+6H7AQXbeo2I7
 i0cYCKswLMm7x3GDVL2vBDsL3d/Nbtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622825762;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xpjosN7Lf//Pd+7IUjT1f+SVABLvml9WkCfMBlsORZQ=;
 b=H1hRqz3hXmSt84nXFPVHTW3DpfXTojGbiAXxJ+C8BEZA+9q/4glUO/V6RvAcf4IPn/viag
 n9UkE1wM8sSZrADA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id iSL/ACJbumCXNAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 16:56:02 +0000
Date: Fri, 4 Jun 2021 18:56:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YLpbIO3JlTucspgH@pevik>
References: <20210603183827.24339-1-pvorel@suse.cz>
 <20210603183827.24339-2-pvorel@suse.cz> <YLo9YXWrWweICm81@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLo9YXWrWweICm81@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

...
> > +++ b/include/mk/generic_trunk_target.inc
> > @@ -48,7 +48,7 @@

> >  include $(top_srcdir)/include/mk/functions.mk

> > -RECURSIVE_TARGETS		?= all install
> > +RECURSIVE_TARGETS		?= all check check-c check-shell install

> If you add a target to RECURSIVE_TARGETS such target automatically
> traverses directories, that what the target is for. See the rule at the
> end of the generic_trunk_target.inc. Which means that you redefine
> targets if you define the same targets to loop and run the tests above.
Ah, thanks!

> I guess that you want add another target that depends on check targets
> to actually run the tests?

> Maybe:

> check-c: check-c-run

> check-c-run: $(TEST_TARGETS)
> 	for i in $(TEST_TARGETS); do
> 		...
> 	done

> in order to run the tests.

> In this case the check* targets would be used for directory traversal
> and the check-c-run would be used to run the tests.

Sounds reasonable.

> >  $(eval $(get_make_dirs))

> > @@ -71,7 +71,7 @@ trunk-install: $(INSTALL_FILES)
> >  # Avoid creating duplicate .PHONY references to all, clean, and install. IIRC,
> >  # I've seen some indeterministic behavior when one does this in the past with
> >  # GNU Make...
> > -.PHONY: $(filter-out $(RECURSIVE_TARGETS),all clean install)
> > +.PHONY: $(filter-out $(RECURSIVE_TARGETS),all check clean install)

> The check is already in RECURSIVE_TARGETS
Thanks!

I'll send v2 on Monday, which also use test* as target name instead of check*
as we agreed on Richie's Libclang based analyzer patchset [1].

Kind regards,
Petr

[1] https://lists.linux.it/pipermail/ltp/2021-June/023008.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
