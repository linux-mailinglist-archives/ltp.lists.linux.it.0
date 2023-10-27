Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 255EA7D9EDA
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Oct 2023 19:27:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3F883CEB99
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Oct 2023 19:27:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B99153CACCC
 for <ltp@lists.linux.it>; Fri, 27 Oct 2023 19:27:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E9639201169
 for <ltp@lists.linux.it>; Fri, 27 Oct 2023 19:27:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 32FA01FDCD;
 Fri, 27 Oct 2023 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1698427620;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LrnNEvH0n9+6zCbmKPxgzPWz0qLTZo6k7NffkQanU8k=;
 b=fqwtR5QxyeJBv/zB4qoi4SwP3XJzQO1Ewnop9cbs3rNS7pw4DGka+5YGO/Wc7m9VDzfasg
 H6Injwm41w6P4talLHshfkeyo/BrCpxPcp7uyfTSU+8052HKvC0XC7JopMZD93W5JmucyU
 SVhbwsM0xedeyVpIGixnPA9yNFV0Fvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1698427620;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LrnNEvH0n9+6zCbmKPxgzPWz0qLTZo6k7NffkQanU8k=;
 b=5ztp3nhH2O4u0iRtZHW2uIge6e1/ypMjhPQUxXhpOyA54S3k29pWHV6riStaGQT6CCyuF4
 C0OUDcxn54GpanAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC42E1358C;
 Fri, 27 Oct 2023 17:26:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cNrdNuPyO2WnTwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 27 Oct 2023 17:26:59 +0000
Date: Fri, 27 Oct 2023 19:26:58 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>, ltp@lists.linux.it,
 Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20231027172658.GC673099@pevik>
References: <20231027093801.51947-1-xuyang2018.jy@fujitsu.com>
 <20231027171815.GB673099@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027171815.GB673099@pevik>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] umount01: Simplify test using TST_ macros
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

Hi all,

> Hi Xu,

> [ Cc Cyril, who wrote gvfsd-trash note in 10b61174c ("syscalls: umount01: Give a
> hint on failure with EBUSY") ]

I merged the patch. I'm sorry on the system which I tested the patch was really
running gvfsd-trash. I guess there is no easy solution to handle gvfsd-trash.
I guess the test should TCONF on running gvfsd-trash.

Kind regards,
Petr

> While this patch looks to be OK, there is a problem when run several times
> (either with -i > 1 or even just repeatedly run without -i):

...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
