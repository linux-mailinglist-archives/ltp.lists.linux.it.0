Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC4398E38
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:18:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F92A3C7FFD
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:18:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 312DE3C2920
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C519E60083C
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:29 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 80EE21FE14;
 Wed,  2 Jun 2021 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622647109;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VXIG5OSaTlkM7wmlh+dib1VSVZpsjfD0SwLosDdjy+c=;
 b=jUwHPmlX1oCFOeKqBtPOhFgVrHQrwPgimh75RGaeZzPyDGT0iMNj0Ck0fjS5aHVdqEIUgE
 kIfduGJZaCLivA4QJeEaR5jCf7rXwOEyaQqK0tWBKJ716/XjrluIJk9GPkGBpJjS9LxY+t
 6rgVfCHoNJP+a4NJZidPhakFbU3FuUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622647109;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VXIG5OSaTlkM7wmlh+dib1VSVZpsjfD0SwLosDdjy+c=;
 b=N1f+1z3U7AEjoObOrvGo/38Lvg8mySUj23csfKQ2eekZvCxACFqbpR4lPb/VjdqgVNuHT5
 7O6baLyRFLKFpTCg==
Received: by imap.suse.de (Postfix, from userid 51)
 id 774C811CD4; Wed,  2 Jun 2021 16:20:03 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D2AAE11DF2;
 Wed,  2 Jun 2021 11:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622634673;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VXIG5OSaTlkM7wmlh+dib1VSVZpsjfD0SwLosDdjy+c=;
 b=M2rEKFStn2ccWnJOkpHFFCWZvvIAmgjsF5MrzIqYaQl+RaHJiT2IBykjcKsAg3U/WQ001U
 /XNCxL1WlUnIhAcV1FLpP0Cjt8+tvpTFt/VNjd7+NtFxG2saEpXlWuCNHxikptalVhAavp
 b/hE3v06WOtcDyKI+QEHomGwMlTdqSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622634673;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VXIG5OSaTlkM7wmlh+dib1VSVZpsjfD0SwLosDdjy+c=;
 b=JYk119EDKSFplVB5Z0mfHUiI2kT3cEb6T14aydJfV1THSEXcvGLzmchtpysbqYF6UZiQN7
 FpAzEaEEnBAa4iAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id MWNzMbFwt2DwAwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 02 Jun 2021 11:51:13 +0000
Date: Wed, 2 Jun 2021 13:51:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
Message-ID: <YLdwsHtUBjbmy7hW@pevik>
References: <20210526104633.29561-1-pvorel@suse.cz> <YLCddN29evt3O5jw@yuki>
 <YLC/gApc5oJ9noMW@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLC/gApc5oJ9noMW@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] sendfile0{2,9}: Remove OFF_T workaround
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

Hi Cyril,

> Hi Cyril,

> > Hi!
> > > Using OFF_T definition to off64_t for 64bit variants seems to be am old
> > > workaround for buggy libc. Nowadays we can rely on off_t to have correct size
> > > (i.e.: 32bit: 4 bytes; 64bit or 32bit with -D_FILE_OFFSET_BITS=64: 8 bytes)

> > Looks good to me, Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> > > Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > ---
> > > NOTE: -DOFF_T=off64_t is also defined in testcases/kernel/io/disktest
> > > and mentioned in {tst_,}safe_macros.h.

> > We should remove the -DOFF_T=off64_t comment from the *safe_macros.h and
> > keep only the _FILE_OFFSET_BITS there.

> Good. OK, after I solve our CI (github actions) I'll merge this and send another
> patch which removes it in testcases/kernel/io/disktest + the comment in
> *safe_macros.h.

Merged with your reviewed-by tag and going to implement above in separate patch.

Kind regards,
Petr

> Thanks for review and hints!

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
