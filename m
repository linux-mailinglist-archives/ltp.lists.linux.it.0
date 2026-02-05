Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id U8qXAyFshGmJ2wMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Feb 2026 11:08:33 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7E0F12E7
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Feb 2026 11:08:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC2EE3CE38D
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Feb 2026 11:08:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1AA9C3CE20E
 for <ltp@lists.linux.it>; Thu,  5 Feb 2026 11:08:29 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 71C4C600068
 for <ltp@lists.linux.it>; Thu,  5 Feb 2026 11:08:28 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B38B3E792;
 Thu,  5 Feb 2026 10:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770286107;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1oJ79PNWRDV77mLfMqwkw5xxnbWUBjyGMIkyXkvVQRo=;
 b=qpLQ4D5qUU9IFjc5HYidfGdUjZo3mgOINC7ktIkFvr+jXQwzB42aoRV8vRBHR4F77EN2Y1
 4H8mIhXDHoskMBPDUOYK/fBtQC+fzWrPJ90Q2pG6rttvO7jthGKMKygTOwOQolqohWFBJf
 gI7lMcK6GVMTJCMPoyrFFVvG8KeHRVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770286107;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1oJ79PNWRDV77mLfMqwkw5xxnbWUBjyGMIkyXkvVQRo=;
 b=7tjFpfQ9maSDOcQZeK6OPez8yABIesJz/dRvKK2HLSjFDeSc//eMQvJlLgYyvAzjO/NwfB
 7kzZ9WQO/D3nNgBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770286107;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1oJ79PNWRDV77mLfMqwkw5xxnbWUBjyGMIkyXkvVQRo=;
 b=qpLQ4D5qUU9IFjc5HYidfGdUjZo3mgOINC7ktIkFvr+jXQwzB42aoRV8vRBHR4F77EN2Y1
 4H8mIhXDHoskMBPDUOYK/fBtQC+fzWrPJ90Q2pG6rttvO7jthGKMKygTOwOQolqohWFBJf
 gI7lMcK6GVMTJCMPoyrFFVvG8KeHRVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770286107;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1oJ79PNWRDV77mLfMqwkw5xxnbWUBjyGMIkyXkvVQRo=;
 b=7tjFpfQ9maSDOcQZeK6OPez8yABIesJz/dRvKK2HLSjFDeSc//eMQvJlLgYyvAzjO/NwfB
 7kzZ9WQO/D3nNgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB7FB3EA63;
 Thu,  5 Feb 2026 10:08:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lx9YNBpshGmfAQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 05 Feb 2026 10:08:26 +0000
Date: Thu, 5 Feb 2026 11:08:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20260205100825.GB294817@pevik>
References: <20260203024320.227453-1-liwang@redhat.com>
 <20260204122332.GC224465@pevik> <aYNVsiL4xf2P9R6A@redhat.com>
 <20260204222753.GA279256@pevik> <aYP2AxZJeXgEDMpA@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYP2AxZJeXgEDMpA@redhat.com>
X-Spam-Score: -3.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/2] openat2: define _GNU_SOURCE and include
 <fcntl.h>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,linux.it:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 9B7E0F12E7
X-Rspamd-Action: no action

> On Wed, Feb 04, 2026 at 11:27:53PM +0100, Petr Vorel wrote:
> > Hi Li,

> > ...
> > > > lapi/openat2.h uses struct open_how directly, shouldn't be included lapi/fcntl.h
> > > > there?

> > > From my understand lapi/* are appendix for missing stuff in header file.

> > Yes, but we agreed in the past, that it's better to include relevant libc/kernel
> > header in the lapi header [1]:

> > 	LAPI header should always include original header.

> > [1] https://github.com/linux-test-project/ltp/blob/master/doc/old/C-Test-API.asciidoc#lapi-headers

> > I thought we had a discussion about it, but now I see nobody acked the change in
> > ML (cfbc41d775), therefore I somehow pushed this approach without consensus with
> > others. I'm sorry for that, we can revise that. At the moment quite a few lapi
> > headers use this approach (likely majority).

> > IMHO it's better to include it than expect that all tests which use lapi header
> > will include relevant header *before* (otherwise tests can happily always depend
> > on fallback instead of using a real value from a system header).

> Yes, I generally agree with this, and here is my understand:

> 1. Testcase should include original <header.h> (but not "lapi/header.h")
>    if *only* need the original <header.h> file.

... and don't need any fallback from the lapi header.

> 2. LAPI-header should always include original <header.h>, it handling
>    the missing/conflicting part there.
>    Thus, we can treat "lapi/header.h" as a patched <header.h> and only
>    use it intead of the original <header.h> in testcase if needed.

+1

> 3. We avoid including both original <header.h> and "lapi/header.h" in
>    testase at the same time.

+1

> > It's a minor detail, but being consistent helps for newcomers to understand
> > LTP code.

> > And *if* we agree on it, it should be now doc/developers/ground_rules.rst.

> > Also there is a different approach where should be fallbacks. We use some lapi
> > headers (e.g. lapi/openat2.h but there are more) which don't have public
> > equivalent in libc (/usr/include/bits/openat2.h cannot be used directly, but via
> > <fcntl.h>). Therefore I would put content of lapi/openat2.h into lapi/fcntl.h,
> > but that's a minor detail.

> I am ok with it, the advantage merge lapi/openat2.h into lapi/fcntl.h is
> keep things more centralized.

> But also, keep lapi/openat2.h seperated is more modular, and it should
> contains <fcntl.h> as well.

Yeah, I don't have strong opinion about it, both ways would work.

> > > Test cases should only include standard header files, and lapi should
> > > only be used in case of missing or conflicting header files.

> > But lapi/openat2.h also uses struct open_how. I would either include <fcntl.h>
> > in both sources or just in lapi/openat2.h. Having it only in tests looks to me
> > as not ideal.

> Right, thanks for bring up this topic.

Thank you for your time. I try to send a patch to add the outcome to
doc/developers/ground_rules.rst and wait for ack of others to get broader
consensus about it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
