Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3158C7A53
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2024 18:27:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEA863CFA6A
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2024 18:27:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E63EF3CF74A
 for <ltp@lists.linux.it>; Thu, 16 May 2024 18:27:30 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 14116602749
 for <ltp@lists.linux.it>; Thu, 16 May 2024 18:27:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9C7625C6EA;
 Thu, 16 May 2024 16:27:28 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72C79137C3;
 Thu, 16 May 2024 16:27:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PfeZGfAzRmYvHwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 16 May 2024 16:27:28 +0000
Date: Thu, 16 May 2024 18:27:23 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <20240516162723.GC317330@pevik>
References: <20240515093349.7347-1-andrea.cervesato@suse.de>
 <20240515093349.7347-2-andrea.cervesato@suse.de>
 <20240516013048.GB260285@pevik>
 <d06e0e62-1827-4699-838d-8ae961ca2905@suse.com>
 <20240516144945.GB317330@pevik>
 <2f999e65-26e6-442e-886e-7f98cce6dd19@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f999e65-26e6-442e-886e-7f98cce6dd19@suse.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 9C7625C6EA
X-Spam-Status: No, score=0.0 required=7.0 tests=DMARC_MISSING,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1 01/10] Add SAFE_STATX macro
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

Hi Andrea,

> Hi,

...
> > > > > +++ b/include/tst_safe_macros.h
> > > > > @@ -503,4 +503,11 @@ int safe_sscanf(const char *file, const int lineno, const char *restrict buffer,
> > > > >    #define SAFE_SSCANF(buffer, format, ...) \
> > > > >    	safe_sscanf(__FILE__, __LINE__, (buffer), (format),	##__VA_ARGS__)
> > > > > +struct statx;
> > > > Could you please remove this? (unneeded)
> > > That's needed because in some distro statx is not defined before reaching
> > > that line causing build failure.
> > <sys/stat.h> are included in lapi/stat.h. I wonder if <linux/stat.h> would fail.
> It's related with distros which need to use fallback. There's no fallback of
> "struct statx" when defining the
> statx() syscall wrapper, so it fails during build.

OK, struct statx is at least on musl guarded with _GNU_SOURCE, that's why
struct statx in the header helps. This is better than define _GNU_SOURCE also
for the header (it's in tst_safe_macros.c). But it would be good to document
this (either in the commit message or in the source) - I always wonder when
staring in various workarounds like this few years later and wondering if it can
be removed.

I was thinking it would be possible to switch to <linux/stat.h> and we would
save the detection. But given struct statx is used in tst_safe_macros.h,
we would need to replace all <sys/stat.h> with <linux/stat.h> also in the tests
which use tst_safe_macros.h:

$ git grep -l tst_safe_macros.h $(git grep -l -e include..lapi/stat.h -e include..sys/stat.h) | wc -l
8

But I don't think it's a good idea to switch to <linux/stat.h>.

Kind regards,
Petr

> > If the definition later works it should be fixable by including the needed
> > header in lapi/stat.h, right?

> > Could you post link to CI job which failed?

> > Kind regards,
> > Petr

> > > > With that, you might add for this patch in the next version:
> > > > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> > > > Kind regards,
> > > > Petr
> > > Andrea

> Andrea

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
