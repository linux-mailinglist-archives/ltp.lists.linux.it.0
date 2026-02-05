Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOrKNgtwhGm/2wMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Feb 2026 11:25:15 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7BFF1482
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Feb 2026 11:25:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C80D83CE3E4
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Feb 2026 11:25:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D14033C2F6A
 for <ltp@lists.linux.it>; Thu,  5 Feb 2026 11:25:12 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4FB0360073C
 for <ltp@lists.linux.it>; Thu,  5 Feb 2026 11:25:12 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A0C933E78A;
 Thu,  5 Feb 2026 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770287111;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eJGQXdO1n1qAR3UKOSFun+QycrWFlmjQetJGgkrM9jg=;
 b=lMFOtYm3JCFyNjvHJqA5i9ShT7QwOyz6u2L4YHZU8jd6pYdbHXjOZU7hfZqXnyibSkKNi5
 J8+FY3KYS8tdRB/BvL3v6vnevbSu8PP2uvrT6/yR6BZdlD8duFmJKninwrfNPu3ZBLcdBS
 fbH0S+hAQrA/0+PzLVILZIZaq4nwmQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770287111;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eJGQXdO1n1qAR3UKOSFun+QycrWFlmjQetJGgkrM9jg=;
 b=NKk/7vJ5sh6hMmDjQGulubgzDOquG+HGH+wmyIg1IUbDyZfje1LAgzeikoIjxAvBTmKrut
 5Inyzdq7HX6dleDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770287111;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eJGQXdO1n1qAR3UKOSFun+QycrWFlmjQetJGgkrM9jg=;
 b=lMFOtYm3JCFyNjvHJqA5i9ShT7QwOyz6u2L4YHZU8jd6pYdbHXjOZU7hfZqXnyibSkKNi5
 J8+FY3KYS8tdRB/BvL3v6vnevbSu8PP2uvrT6/yR6BZdlD8duFmJKninwrfNPu3ZBLcdBS
 fbH0S+hAQrA/0+PzLVILZIZaq4nwmQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770287111;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eJGQXdO1n1qAR3UKOSFun+QycrWFlmjQetJGgkrM9jg=;
 b=NKk/7vJ5sh6hMmDjQGulubgzDOquG+HGH+wmyIg1IUbDyZfje1LAgzeikoIjxAvBTmKrut
 5Inyzdq7HX6dleDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E4B63EA63;
 Thu,  5 Feb 2026 10:25:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zx7rHQdwhGkODwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 05 Feb 2026 10:25:11 +0000
Date: Thu, 5 Feb 2026 11:25:10 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20260205102510.GC294817@pevik>
References: <20260204124323.244578-1-pvorel@suse.cz>
 <aYQz6gN7WvJbSg1k@redhat.com> <aYRl0mUYv1aYLlyC@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYRl0mUYv1aYLlyC@redhat.com>
X-Spam-Score: -7.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] openat2: Move includes to lapi, remove _GNU_SOURCE
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:email,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 7F7BFF1482
X-Rspamd-Action: no action

> On Thu, Feb 05, 2026 at 02:08:42PM +0800, Li Wang wrote:
> > On Wed, Feb 04, 2026 at 01:43:23PM +0100, Petr Vorel wrote:
> > > Improve 767b3e519e. struct open_how is also used in lapi/openat2.h,
> > > which is used by all openat2*.c tests.  Therefore move <fcntl.h> to the
> > > lapi header (and use lapi/fcntl.h instead).

> > > Also remove _GNU_SOURCE which should not be needed.

> > > While at it, move include "config.h" to the top.

> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > ---
> > > Hi Li,

> > > my points from the original patchset why not use _GNU_SOURCE:

> > > glibc test tst-openat2.c [1] which includes <fcntl.h>, uses struct

> > Interesting, I haven't figure out why it can be built within glibc itself.

> I think that becuase it uses '-D_GNU_SOURCE' cflags has already globally
> enabled the GNU extension (equivalent to '#define _GNU_SOURCE'), which is
> done uniformly by glibc's build system.

Interesting, I did not know they compile tree with _GNU_SOURCE.

>  glibc/Makerules: ALL_BUILD_CFLAGS = $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) -D_GNU_SOURCE \
> 			-DIS_IN_build -include $(common-objpfx)config.h

Yes, -D is equivalent to #define.  IMHO it's better to use #define _GNU_SOURCE
(more obvious than command line switch).

> To verify this, when I add the '-D_GNU_SOURCE' cflgs in the LTP/openat20*.c
> compliation, it build succeed as well:

>  # gcc -I../../../../include -I../../../../include \
>    -I../../../../include/old/ -Wformat -Werror=format-security \
>    -Werror=implicit-function-declaration -Werror=return-type -fno-common \
>    -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition \
>    -D_GNU_SOURCE \
>    -std=gnu99 -L../../../../lib openat202.c  -lltp -o openat202

> So, to this patch, we need to add the _GNU_SOURCE definition.

Thanks for investigating, I'm sorry for bothering with it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
