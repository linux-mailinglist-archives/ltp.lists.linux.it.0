Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D450DE76
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Apr 2022 13:08:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B57D03C3344
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Apr 2022 13:08:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A2B83C0FED
 for <ltp@lists.linux.it>; Mon, 25 Apr 2022 13:08:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 195B7600629
 for <ltp@lists.linux.it>; Mon, 25 Apr 2022 13:08:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 34A831F388;
 Mon, 25 Apr 2022 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650884902;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/zttouSPQHV33iIy9sJDPlGJ5+qsLP/sMFc4/yUkC9Y=;
 b=zEBLgjIrxOT/slLh736u/+8tUbPUZ518+5LB3Rm6JXpTg5yzKEDMW0rGMbYBdv79SGRWx5
 xfhKD8u8NnGreQ2Rsga9ukZMCKui3wCC7CR2d1cXxENdDK3z+naCWoESnEBfvR+xGBzi6b
 uim7JoZon+OOgrmRS/ClEI8dHelap+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650884902;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/zttouSPQHV33iIy9sJDPlGJ5+qsLP/sMFc4/yUkC9Y=;
 b=3lWwPCk21tKr20x5E4X0SWPCESO8YJhkv81RtqL/hZokStZyKCVNLxGl3GR5Aj7dRmkN6W
 gO3ZzC3W996rzYAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 289C813AED;
 Mon, 25 Apr 2022 11:08:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GRaLCSaBZmKGRwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 25 Apr 2022 11:08:22 +0000
Date: Mon, 25 Apr 2022 13:08:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YmaBJM8piHx4Juay@pevik>
References: <20220425092118.21619-1-rpalethorpe@suse.com>
 <YmZrVzxghAnmxIud@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YmZrVzxghAnmxIud@rei>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] sighold02: Fix muslc builds by removing __SIGRTMIN
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

Hi all,

> Hi!
> > The minimum real-time signal is always 32 according to
> > signal(7). Meanwhile __SIGRTMIN is not defined in all lib C
> > implementations.

> > Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> > ---
> >  testcases/kernel/syscalls/sighold/sighold02.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/testcases/kernel/syscalls/sighold/sighold02.c b/testcases/kernel/syscalls/sighold/sighold02.c
> > index daa86192e..1cfb7688b 100644
> > --- a/testcases/kernel/syscalls/sighold/sighold02.c
> > +++ b/testcases/kernel/syscalls/sighold/sighold02.c
> > @@ -33,7 +33,7 @@ static int sigs_map[NUMSIGS];

> >  static int skip_sig(int sig)
> >  {
> > -	if (sig >= __SIGRTMIN && sig < SIGRTMIN)
> > +	if (sig >= 32 && sig < SIGRTMIN)
> >  		return 1;

> Looks like __SIGRTMIN is defined to 32 for all architectures glibc
> supports, so this should be pretty much safe.

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Well, we have __SIGRTMIN 32 fallback definition in include/lapi/signal.h,
we use it in few tests. It was used in old variant, but you removed it during
rewrite in 38e69985cb2707a056f9c86a90c8570c721e6a7d.

BTW I looked whether we could use SIGRTMIN instead of underscore variants,
I suppose we can't (looks like SIGRTMIN is 32 + something):

musl:
#define SIGRTMIN  (__libc_current_sigrtmin())
src/signal/sigrtmin.c
#include <signal.h>
int __libc_current_sigrtmin()
{
    return 35;
}

glibc:
static int current_rtmin = __SIGRTMIN + RESERVED_SIGRT;
(current_rtmin is used in __libc_current_sigrtmin(), RESERVED_SIGRT is defined 0 and 2)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
