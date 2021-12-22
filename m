Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F8B47D021
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 11:39:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 592AE3C9287
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 11:39:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F0A883C620F
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 11:39:00 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 610031400053
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 11:39:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 94116212B6;
 Wed, 22 Dec 2021 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640169539;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5AuwUBK707fswwo8RR3iDOzf06s9NbzsWOGJdOSZMmQ=;
 b=HgZe14ZJvD+T+1rsnDT6UeojaMPS+wzMwGgXnbBNC+lfwXmyzgUxvEEHXB0c2N3SQvHrZo
 3LhD41ny+fceGLc0rLLSVQFC/oRKkXOy74/R4Y5VAFehK1eiwAFB3YFmbFR+DzJ16VFmzU
 +0SrhN4Zt1SXfRZE0qksMlxKtLweAuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640169539;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5AuwUBK707fswwo8RR3iDOzf06s9NbzsWOGJdOSZMmQ=;
 b=vEEvvu61DtCQJ3fIbwU286+P+rorfz0ugoEW+tsYFXCeqRroX9LrO0q2K2w1oA3ZCr4d1s
 jXHNH3u6kEc+JeAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5993D13D02;
 Wed, 22 Dec 2021 10:38:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zv3UE0MAw2FMfQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 22 Dec 2021 10:38:59 +0000
Date: Wed, 22 Dec 2021 11:38:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YcMAQULMrkTiBvGh@pevik>
References: <20211221193500.31950-1-pvorel@suse.cz>
 <61C28CB8.3050209@fujitsu.com>
 <CAEemH2cqTErtNZka8X3L3AgOhy-a2x8fqy1k-QKJWiXc7wA2fA@mail.gmail.com>
 <61C2C02A.90104@fujitsu.com> <YcLeaPJmSvmUJwJO@pevik>
 <61C2E3DB.9070004@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61C2E3DB.9070004@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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

Hi Xu,

> Hi Petr
> > Hi Xu,

> >>> This is not working as expected in Github CI. I'm still looking at the
> >>> problem.
> >>> https://github.com/wangli5665/ltp/runs/4602025797?check_suite_focus=true
> >> I tested local but it works well. I guess ci fails because of linux user
> >> namespace. Maybe we should require CAP_SYS_RESOURCE cap instead of using
> >> geteuid.
> > Good catch, verifying.
> You can refer to my ltp fork
> https://github.com/xuyang0410/ltp/commits/oom_kill_ci_fixes
Ah, I didn't noticed your work, we both worked on the same thing.
I added check on both places (for the cleanup as well) and check also
CAP_SYS_ADMIN (obviously CAP_SYS_RESOURCE would be enough).

Kind regards,
Petr

> Best Regards
> Yang Xu

> > Kind regards,
> > Petr

> >> Best Regards
> >> Yang Xu

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
