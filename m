Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A9847CDD7
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 09:06:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDC513C928A
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 09:06:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC54D3C0B90
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 09:06:30 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D75811A016E0
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 09:06:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B2A601F37E;
 Wed, 22 Dec 2021 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640160388;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eUdHTkJ/4me5DjRStvxbPio4MOtpP0R/DFT6euftxm0=;
 b=nPfhtNtjCcptcc/zmlo8yGEtYkGICnhlbVhEXnG3SWBDOtg+mK+UAd/Ml2zXUOt5rXrn2b
 Wcx3VlcUvm6MRXydzPvwe/XH/s2lHD2I2SLVbGvR8sGZSHyK2c7G3FjBYxtZ1YrCg8MSQq
 P8eWMjn9ZVGwzaLui7fGdZ8eUq08Sek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640160388;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eUdHTkJ/4me5DjRStvxbPio4MOtpP0R/DFT6euftxm0=;
 b=X+hDPejCqXyXWm9WVSDXPV/FuJOKkfDuB86F2+ND+5mnzImCEE6TmgmokEL3O/jrt4OVVF
 dgERl7zet2QHxiAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8126C13CDA;
 Wed, 22 Dec 2021 08:06:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id liiAHYTcwmErNwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 22 Dec 2021 08:06:28 +0000
Date: Wed, 22 Dec 2021 09:06:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: xuyang2018.jy@fujitsu.com, Li Wang <liwang@redhat.com>
Message-ID: <YcLcgumNvNoqr2XD@pevik>
References: <20211221193500.31950-1-pvorel@suse.cz>
 <61C28CB8.3050209@fujitsu.com>
 <CAEemH2cqTErtNZka8X3L3AgOhy-a2x8fqy1k-QKJWiXc7wA2fA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cqTErtNZka8X3L3AgOhy-a2x8fqy1k-QKJWiXc7wA2fA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib: Skip tst_{disable,
 enable}_oom_protection() for non-root
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu, Li, all,

> Hi Xu, Petr,

> On Wed, Dec 22, 2021 at 10:26 AM xuyang2018.jy@fujitsu.com <
> xuyang2018.jy@fujitsu.com> wrote:

> > Hi Petr
> > > If needed to set value also for non-root, use set_oom_score_adj().
> > If so, why not rename set_oom_score_adj to tst_set_oom_score_adj and add
> > declartion to tst_memutils.h?


> Yes, it makes sense to expose this function to users to cover
> more oom test scenarios. For instance, set a high (>0) or low (<0)
> score in child_alloc() to verify if OOM-Killer still works well.
> But so far, we don't have such tests.

Sure, I we can do it. But first I'd prefer to fix CI (beware we have last
working day before xmas vacation).

> > ps: also have a word typo in set_oom_score_adj, adjustement => adjustment.
+1, thanks!

Kind regards,
Petr

> > Best Regards
> > Yang Xu

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
