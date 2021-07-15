Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D80DA3C9BCF
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:30:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29C3F3C8626
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:30:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 539BA3C65D4
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:29:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C051B600046
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:29:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 259B222924;
 Thu, 15 Jul 2021 09:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626341395;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9kLeV+MyXUjzV9u7Ka3zhOHruzryCXmSoh+vPyLhBY0=;
 b=pOBpvmFK5OujRqwaOKzp+Ml+zahblIQKrf2q8kbzaey/R6clkcIg9VdxcKrJ3X6TcRc5Vf
 R5/GAHijZXj2pw047DgRQlBwhPouc2ziLTaoF+GUxnm91iJp2BXXWmUMyWt0g4SvQ98BF7
 4T6x8o1xNIsgwREJM7WgEKMSOb34Zcs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626341395;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9kLeV+MyXUjzV9u7Ka3zhOHruzryCXmSoh+vPyLhBY0=;
 b=aV+inUQKQUGdaBWz2MoDsaJyJ2BolXMV/YnpA2yjc8pFODtamtNdRx1snydvNvIhe+W3BA
 euH+yTMVbG5YNZAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E16CA13C30;
 Thu, 15 Jul 2021 09:29:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xGD8NBIA8GA8BwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 09:29:54 +0000
Date: Thu, 15 Jul 2021 11:29:52 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YPAAEPZMOnGWfWG6@pevik>
References: <20210714180840.160798-1-amir73il@gmail.com>
 <YO/e3wcY8oXyFCO5@pevik>
 <CAOQ4uxj_vJVXTJex1W1cAJ_LQkbNqUnasuiUTsp=Bgrznm472A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxj_vJVXTJex1W1cAJ_LQkbNqUnasuiUTsp=Bgrznm472A@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fanotify: Fix running tests in a loop
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

...
> > FYI both fixes prolonged running for about 100% (comparing with runs on master
> > which don't fail). Of course, that's not a problem at all, it's just interesting
> > for me how simple closing of file descriptor can be expensive.

> Nice observation! LTP is not the only test suite that observed this issue. See:
> https://lore.kernel.org/linux-fsdevel/CAC-ggsFLmFpz5Y=-9MMLwxuO2LOS9rhpewDp_-u2hrT9J79ryg@mail.gmail.com/

> In order to fix that issue we will need some LTP helpers to take care of closing
> fanotify/inotify fds in batches for loop runs, which is kind of what
> happened before
> the fd leak fix only the batch was infinite...

> Attached sample patch for fanotify18.
> You will need to run some more experiments to see if it is worth it or not
> and then if it is worth it, probably generalize the helpers.

Thanks for detailed info and patch. I'm going to merge the original patch as
it's not an issue to run tests slower (more important is to actually fix the
issue) and have look into your patchset whether it's worth of adding it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
