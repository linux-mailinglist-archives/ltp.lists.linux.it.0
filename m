Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5114BD9BC
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Feb 2022 13:43:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 956C03CA185
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Feb 2022 13:43:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B04F93C96D5
 for <ltp@lists.linux.it>; Mon, 21 Feb 2022 13:43:01 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 700481001158
 for <ltp@lists.linux.it>; Mon, 21 Feb 2022 13:42:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 561211F391;
 Mon, 21 Feb 2022 12:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645447379;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HAqGmbOcqPpLArVut/VQf0ussrFzfva7N/1NlmU3N3k=;
 b=0ImBIVKasqBwg0HqIyK8iNWtybv9IzkZtDzfFKhFvW3U5VeZdiNl22AztlDvTxO7Pa5hR2
 HDYRiW87ZYVYf+uzLxfCDa+ig9F2CWkEl6sLuQ7B0uDzyBg35aRMWuFEB04QSFrie92Z56
 ZwLrJz3loC9OSXPtb5v0WagNeVxENzY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645447379;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HAqGmbOcqPpLArVut/VQf0ussrFzfva7N/1NlmU3N3k=;
 b=V8YevgIasf1S3tyKrBcRu1S669cvaBTcg4+2GY+csfik62uGJRIgWcqxann12AYA4nz/Wm
 kpq6pYXZgIFxVaAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29BC913AC3;
 Mon, 21 Feb 2022 12:42:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W/enCNOIE2LaawAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 21 Feb 2022 12:42:59 +0000
Date: Mon, 21 Feb 2022 13:42:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YhOI0W/PtQJP8fGK@pevik>
References: <1645005868-2373-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1645005868-2373-4-git-send-email-xuyang2018.jy@fujitsu.com>
 <Yg6f6p/rdFTfzkoR@pevik> <620F118E.3070306@fujitsu.com>
 <Yg9EkoeDiRQhekhX@pevik> <87k0dojy5j.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k0dojy5j.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] Add pidfd_getfd01 test
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

> Hello Petr,

> Petr Vorel <pvorel@suse.cz> writes:

> > Hi Richie, Xu,

> >> Hi Petr
> >> > Hi Xu,

> >> > ...
> >> >> +++ b/testcases/kernel/syscalls/pidfd_getfd/pidfd_getfd01.c
> >> > ...
> >> >> +	remotefd = TST_RET;
> >> >> +	flag = fcntl(remotefd, F_GETFD);
> >> >> +	if (flag == -1)
> >> >> +		tst_brk(TFAIL | TERRNO, "fcntl(F_GETFD) failed");
> >> > Just:
> >> > flag = SAFE_FCNTL(remotefd, F_GETFD);
> >> Yes, I almost forgot we have this macro.
> > @Richie: It'd be useful if sparse checks would suggest to use SAFE_*()
> > functions, but not sure if easily detectable. Something like setup() and
> > cleanup() function and syscall followed by if (foo == -1) followed by tst_brk().

> > Kind regards,
> > Petr

> Yeah, this would be relatively simple in Coccinelle. In Sparse I'm not
> sure, but it is one of the main use cases IMO.
I remember few years ago (2017) metan did big cleanup with Coccinelle.
If much simpler, we might want to introduce some basic scripts (without
vendoring Coccinelle, it'd have to be installed).

> Hopefully the IR produced by these code patterns is fairly stable. In
> that case we can do some simple pattern matching.
Frankly speaking, if ever implemented it's probably you who is going to
implement it, thus your choice what you use :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
