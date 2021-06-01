Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 569893970D8
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:04:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAFB43C5DF2
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:04:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C06253C55A3
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:03:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4812E1A0081C
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:03:58 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D4F21FD73;
 Tue,  1 Jun 2021 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622541838;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gf/9A8uZe/Qd8tKAH1Ae0f7o3kTTjP7KZu+SV8VCahg=;
 b=k4pUuJiPJqzwyivPON761E7uJvV152gcMj+wq4m9DmGuNJXC6HhosCkC6imORhDNL1hLES
 NfS+3vlB8oNGydr3ht1DXak6HLdYZS+XsAB7vKu05P4DeV1SpV6cSBO5m7sWhWZrn8pECm
 Lhbylh2SqLT9Uqe+MSNrnlsLHWhfyoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622541838;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gf/9A8uZe/Qd8tKAH1Ae0f7o3kTTjP7KZu+SV8VCahg=;
 b=tC8CgiRF7TYxJR6KKodtogriHWBkKYOlHKXB3CkdwFfDvvHVMFU3Co90ydds6z2+g3hC4r
 qSrPwmFCb/MJ2cDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4F8A3118DD;
 Tue,  1 Jun 2021 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622541838;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gf/9A8uZe/Qd8tKAH1Ae0f7o3kTTjP7KZu+SV8VCahg=;
 b=k4pUuJiPJqzwyivPON761E7uJvV152gcMj+wq4m9DmGuNJXC6HhosCkC6imORhDNL1hLES
 NfS+3vlB8oNGydr3ht1DXak6HLdYZS+XsAB7vKu05P4DeV1SpV6cSBO5m7sWhWZrn8pECm
 Lhbylh2SqLT9Uqe+MSNrnlsLHWhfyoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622541838;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gf/9A8uZe/Qd8tKAH1Ae0f7o3kTTjP7KZu+SV8VCahg=;
 b=tC8CgiRF7TYxJR6KKodtogriHWBkKYOlHKXB3CkdwFfDvvHVMFU3Co90ydds6z2+g3hC4r
 qSrPwmFCb/MJ2cDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ZmFFEg4GtmBQfwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 01 Jun 2021 10:03:58 +0000
Date: Tue, 1 Jun 2021 12:03:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YLYGDIIvhKQB+2Ad@pevik>
References: <20210531165052.8731-1-pvorel@suse.cz>
 <CAASaF6zQt38sSkA7PDNZL53J7gbOXTCgC54Xbwb6qe=7-_wpWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6zQt38sSkA7PDNZL53J7gbOXTCgC54Xbwb6qe=7-_wpWg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] CI: Move from Travis to GitHub Actions
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
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Mon, May 31, 2021 at 6:51 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi,

> > Travis often false positive due "pull rate limit" issue [1],
> > thus I decided to finally switch to GitHub Actions.

> > Also using GitHub native CI allows more advanced features
> > (e.g. update wiki with doc/*.txt, nightly build docparser doc).

> > Whole thing is tested [2].

> > I rewritten build.sh, added -r step.
> > It's ugly, using commands in yaml would be more readable. But I'd prefer
> > 1) not writting shell in yaml 2) have build script for local use.

> > Please comment, test.


> We should update docs too, but series looks OK, ACK.

Hi Jan,

thanks! I was thinking about it but than forgot.
I'll fix it now.
I was a bit fast with merging.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
