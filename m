Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5344A7199
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Feb 2022 14:32:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 380A93C98C3
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Feb 2022 14:32:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 344843C98A8
 for <ltp@lists.linux.it>; Wed,  2 Feb 2022 14:32:47 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5FCE11A0088E
 for <ltp@lists.linux.it>; Wed,  2 Feb 2022 14:32:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4E2931F397;
 Wed,  2 Feb 2022 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643808765;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FYRZXTw5ERxIr7WmFR1GB2AYKILtzHJgKVwneyr+2VM=;
 b=3O02rUuCt5b6h+St8ygMC8PeJP0Z8wpwo+ATwBzCovoYfuux1pDuUl8D3Pw9d0H3O52Q/U
 K8G9jGVGDpMs/OjqadbG3AzzSjoja5+wZCaZq6aWG+hKb0i2gpYM/DAMXn7G2itxqDlSZD
 KLRmGreGDMspAeJJRljQjmY2oHF6vw4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643808765;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FYRZXTw5ERxIr7WmFR1GB2AYKILtzHJgKVwneyr+2VM=;
 b=reon22FooJWutkzNPRsDVrUuAcBnLc0d+PizNRM5woJq18ij7zQBq+zjwU/7cOnK7bbo+F
 mK8ioBCs2gNF4BCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5F0813E48;
 Wed,  2 Feb 2022 13:32:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sBshNvyH+mETSwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 02 Feb 2022 13:32:44 +0000
Date: Wed, 2 Feb 2022 14:32:43 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Message-ID: <YfqH+7Bsr9LrnJn1@pevik>
References: <YfpnVfrto4Elshy5@pevik>
 <Yfp49PCW9Res5gXG@t14s.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yfp49PCW9Res5gXG@t14s.localdomain>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC] SCTP tests in LTP vs. on github.com/sctp
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
Cc: Xin Long <lucien.xin@gmail.com>, Neil Horman <nhorman@tuxdriver.com>,
 Vlad Yasevich <vyasevich@gmail.com>, linux-sctp@vger.kernel.org,
 Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Marcelo,

> Hi Petr,

> On Wed, Feb 02, 2022 at 12:13:25PM +0100, Petr Vorel wrote:
> > Hi all,

> > SCTP tests lksctp-tools [1] are also in LTP [2].
> > IMHO it's not worth to have it on both places.

> Agree. I wasn't aware of the copy in LTP, btw.

> A question I have now is, is getting more exposure because it is in
> LTP? As in, does it get executed periodically by bots somewhere?

Maybe yes, hard to tell. Not sure even how many people even run SCTP tests
included by LTP. We could ask at automated-testing [8] (embedded people + hopefully
folks from KernelCI [9]) or send the update there. We'd also put a link in
to remaining location in git commit message if agree to remove it from LTP.

> > lksctp-tools looks like to be the official ones [3] so maybe drop it from LTP?

> > Version in LTP was updated to 1.0.15 some time ago (upstream has 1.0.19, containing various fixes [4],
> > maybe worth to be backported to lksctp-tools? Frankly speaking even being older
> > version the LTP code looks to me better. One test was even rewritten to LTP new
> > C API [5] in order to apply more improvements [6].

> > BTW I'd really recommend lksctp-tools project to take new LTP C API [7] and
> > rewrite tests into it. But are these tests still relevant? (is it worth of
> > work?)

> These are nice tips, thanks. We certainly can have a take on them.
Yw.

Kind regards,
Petr

> Best regards,
> Marcelo


> > Kind regards,
> > Petr

> > [1] https://github.com/sctp/lksctp-tools
> > [2] https://github.com/linux-test-project/ltp/tree/master/utils/sctp
> > [3] https://github.com/sctp
> > [4] https://github.com/linux-test-project/ltp/commits/master/utils/sctp
> > [5] https://github.com/linux-test-project/ltp/commit/fcd43b3dd7a8e8fab2b03ec9fa659f21ff5cecb2
> > [6] https://github.com/linux-test-project/ltp/commit/fcd43b3dd7a8e8fab2b03ec9fa659f21ff5cecb2
> > [7] https://github.com/linux-test-project/ltp/wiki/C-Test-API
[8] https://lists.yoctoproject.org/g/automated-testing/
[9] https://foundation.kernelci.org/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
