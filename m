Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A84D6411
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Mar 2022 15:47:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DD583C8D45
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Mar 2022 15:47:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 483DD3C8C79
 for <ltp@lists.linux.it>; Fri, 11 Mar 2022 15:46:57 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6FE4820101A
 for <ltp@lists.linux.it>; Fri, 11 Mar 2022 15:46:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 76032210DB;
 Fri, 11 Mar 2022 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1647010016;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ILxm58ieiXV8mq5idLQnx/Tl8BjwkDO6AL14HpqgiqE=;
 b=tpssbln6xHiveClix0dG/EeXd1EB4GkfqI0Ke+t6T+k9H+qer8xu0GzoV3lrfzTIwDsD7I
 SVNrj4px09u1r7aH2rkXhhYBzMbn+EgUynWGi0aNwuXYKk2OkcaR3YdEPy2GPZdle1PfCj
 DxSYQBIfY/MGejUMSXX4XvIwCsSV6Ro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1647010016;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ILxm58ieiXV8mq5idLQnx/Tl8BjwkDO6AL14HpqgiqE=;
 b=a+YLKGzuNSqdcUetGy4/FxhSvzb9rDgh3Zfkv04KeKayK8vyX0sR2g673fIH1JdFb3O4UT
 48yO30R29xcfuVBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4742C13A89;
 Fri, 11 Mar 2022 14:46:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LbyjD+BgK2IKfAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 11 Mar 2022 14:46:56 +0000
Date: Fri, 11 Mar 2022 15:46:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Yitg3pLd3F9Jum0c@pevik>
References: <20220311120151.601-1-pvorel@suse.cz>
 <YitAg8rGd++vHUlB@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YitAg8rGd++vHUlB@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] madvise06: Fix segfault
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

...
> >  	if (SAFE_CG_HAS(tst_cg, "memory.swappiness")) {
> > -		SAFE_CG_PRINT(tst_cg, "memory.swappiness", "60");
> > +		SAFE_CG_PRINT(tst_cg, "memory.swappiness", SWAPPINESS);
> >  	} else {
> >  		check_path("/proc/sys/vm/swappiness");
> > -		SAFE_FILE_PRINTF("/proc/sys/vm/swappiness", "%d", 60);
> >  	}

> I'm not sure if we want to set the "/proc/sys/vm/swappiness"
> unconditinally in the .save_restore as previously we set it only if the
> cgroup was missing the swappines knob.

> So maybe we should go for a minimal fix here, just change the
> save_restore to match the new format and don't set the value there.
Make sense.

> >  	SAFE_CG_PRINTF(tst_cg, "cgroup.procs", "%d", getpid());
> > @@ -229,8 +229,8 @@ static struct tst_test test = {
> >  	.min_kver = "3.10.0",
> >  	.needs_tmpdir = 1,
> >  	.needs_root = 1,
> > -	.save_restore = (const char * const[]) {
> > -		"?/proc/sys/vm/swappiness",
> > +	.save_restore = (const struct tst_path_val const[]) {
> > +		{"?/proc/sys/vm/swappiness", SWAPPINESS},
> >  		NULL

> This has to be terminated by {} now.
Ah, thx!

Anyway, merged only minimal change with your Reviewed-by: tag.

Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
