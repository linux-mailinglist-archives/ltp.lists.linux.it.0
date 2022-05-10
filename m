Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81209521A52
	for <lists+linux-ltp@lfdr.de>; Tue, 10 May 2022 15:52:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3774F3CA981
	for <lists+linux-ltp@lfdr.de>; Tue, 10 May 2022 15:52:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 229E63CA44E
 for <ltp@lists.linux.it>; Tue, 10 May 2022 15:52:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 982882001CA
 for <ltp@lists.linux.it>; Tue, 10 May 2022 15:52:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B65991F8B5;
 Tue, 10 May 2022 13:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652190764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0+ZezYm5Yql+8X1nKVfzh5SLhfreLHRurQDQfiY7x4I=;
 b=0zQsS4BCdbBetx1o1V5+qh/ENNJ6HaWc03hFz+wQkjXLAk0VO3dmdLZcytXotsdBMtiVnd
 mTy+q0AP1xX9aeNsDcYWjJmZ9Kz049cD2x0GSPAozRipWoO7+A8xaS29ET2wCplHYO5K/2
 JGbzQzaaPzDryAFnVY6XtHlYYtU+rEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652190764;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0+ZezYm5Yql+8X1nKVfzh5SLhfreLHRurQDQfiY7x4I=;
 b=Cu65Skq6QeK3Gli7uAcHojUZtiprrZ/tiRap0P3zetgK6xZ7709R6jT/w50G6LxTEncvlc
 gB8OtqpgzwrdCABA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3C4A13AA5;
 Tue, 10 May 2022 13:52:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EAfQJixuemLrNgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 10 May 2022 13:52:44 +0000
Date: Tue, 10 May 2022 15:54:57 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <Ynpusft75BBrjsJ3@yuki>
References: <YnkOEruIKIwEeC3M@yuki>
 <CAEemH2cUXJ1BGL_yzN+Eakdo__knmrHajwLCmZo9+H4VxE+gNw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cUXJ1BGL_yzN+Eakdo__knmrHajwLCmZo9+H4VxE+gNw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP release preparations
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > As for me I would like to get the runtime patchset in if possible.
> >
> 
> +1, I will add my review ASAP.

Thx.

> > What else should be considered for the release?
> >
> 
> 
> 1628025 New          [v2] rtc02: loosen the compare precision with few
> seconds
> 1625610 New          [1/2] lapi/mount.h: Remove <linux/mount.h>
> 1625609 New          [2/2] Remove duplicate include of <sys/mount.h>
> 
> also, I vote for adding expand Cgroup library from Luke's patchset, but
> if time is hurrying I'm fine without it as well.

I would vote for getting the cgroup patchset in as well here, even if
that would delay the release by a few days.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
