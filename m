Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BD77A4742
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 12:37:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2E353CE4C4
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 12:37:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0F1733C9611
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 12:37:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 82E55600879
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 12:37:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CFE0021A42;
 Mon, 18 Sep 2023 10:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695033448;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3yHOq2Vd7Uf4sIgUcpPUSy/UojE3APk7l0iDyertpIY=;
 b=SlEli4qrjim9bDO/mXagUmgZamVF35UzNCSZ+GiwmsiqvGlm50zyWa7pcr9m2GJ5gM/jYa
 MT40m3cElHfSp26yXSckrBKjgsxr40IT2m3iBRtImg8IRClw3XrlB4sOhPKZpaVOIx39gh
 ydpDZZIdIt6/pHVcxp7SWAnepBH6OfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695033448;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3yHOq2Vd7Uf4sIgUcpPUSy/UojE3APk7l0iDyertpIY=;
 b=EVTWi3/XX6hmuSK68IGRd6ucySeRD3junSFujNoK71yIx+Ga7tgHpoNmb6YijlKNm0AZp4
 8R8BjfpXjCQ938Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B235F1358A;
 Mon, 18 Sep 2023 10:37:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id J78lKmgoCGUwPQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 18 Sep 2023 10:37:28 +0000
Date: Mon, 18 Sep 2023 12:37:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230918103727.GB12384@pevik>
References: <20230918082506.17464-1-andrea.cervesato@suse.de>
 <20230918082506.17464-3-andrea.cervesato@suse.de>
 <20230918091756.GB30304@pevik> <ZQgarkBUEyDd4lxF@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQgarkBUEyDd4lxF@yuki>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] Add Linux Test eXecutor inside tools
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

> Hi!
> > This works, but why we don't use approach used for sparc, i.e.

> > $(MAKE) -C ltx-src

> > That way we would not have to redefine the default rules.

> Unfortunately this does not work well either because the ltx does not
> have install targed and trying to install a file from a subdirectory is
> not possible with the LTP build system. I've tried that and it didn't
> work.

> Let's merge this version that works, we can try to do make things better
> later on.

Sure. BTW I prefer v4, which replaces runltp-ng instead of keeping it.

> > Also it detects missing git clone and runs
> > git submodule update --init if needed.

> > I'm asking for a same approach, not only because later we can unify and reuse
> > the code in some make helper, but also because it'd be more user friendly if our
> > new git submodules work the same way.

> Now this needs to be discussed first. Currently the submodule is
> installed when user writes make check. That means that it's not
> triggered in default build and the default build works without network
> connection. I do not think that we should attempt to download additional
> repositories on default build.

Make sense.

> > But if there is not enough time before release I would not be against this.

> I'm would say that there is not enough time for a proper discussion, so
> I would really keep things as they are in the latest patchset and leave
> the discussion for later.

Sure.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
