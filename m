Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDeXIDC4hWmOFgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 10:45:20 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3285EFC35B
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 10:45:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9001B3C93A8
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Feb 2026 10:45:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B87CF3C1CC0
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 10:45:17 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4ED9B60057C
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 10:45:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 922483E6C2;
 Fri,  6 Feb 2026 09:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770371116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lG8oANy1pmn2en5EjehHETZLljUfLcViyHDo6dX28cU=;
 b=rjpMxpUAJPqTtjvNtDbZLu71SABBf+65ANao6iKdRS1mTeUiD0N5obrVJQOOAO/A4R8eXR
 KfH9dos92e1EdCsPbCg74/cJe23CAoxnmz4W0/yKg4bfw3/JRyNX5y3jbLZWU8FsPpSji4
 qQPnIzgjlKGqiH5erl+ue4+cwJPARLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770371116;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lG8oANy1pmn2en5EjehHETZLljUfLcViyHDo6dX28cU=;
 b=kn0BxU49USln87ZeCB8wSGbq0IXzis6GjSNeCw/0CDfzdNczoTOTP2ZOjAx4cl8Fjjgb7l
 frXAHMFCgTJOqdCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770371116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lG8oANy1pmn2en5EjehHETZLljUfLcViyHDo6dX28cU=;
 b=rjpMxpUAJPqTtjvNtDbZLu71SABBf+65ANao6iKdRS1mTeUiD0N5obrVJQOOAO/A4R8eXR
 KfH9dos92e1EdCsPbCg74/cJe23CAoxnmz4W0/yKg4bfw3/JRyNX5y3jbLZWU8FsPpSji4
 qQPnIzgjlKGqiH5erl+ue4+cwJPARLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770371116;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lG8oANy1pmn2en5EjehHETZLljUfLcViyHDo6dX28cU=;
 b=kn0BxU49USln87ZeCB8wSGbq0IXzis6GjSNeCw/0CDfzdNczoTOTP2ZOjAx4cl8Fjjgb7l
 frXAHMFCgTJOqdCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 758393EA63;
 Fri,  6 Feb 2026 09:45:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id c6UyHCy4hWkRQwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 06 Feb 2026 09:45:16 +0000
Date: Fri, 6 Feb 2026 10:45:12 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <aYW4KB4oKXurWohy@yuki.lan>
References: <20260205135724.23772-1-chrubis@suse.cz>
 <20260205174756.GA338897@pevik> <aYWfNaJeXqut0Isb@redhat.com>
 <aYWnRzaz7Luhm26x@yuki.lan> <20260206093715.GB374678@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206093715.GB374678@pevik>
X-Spam-Score: -8.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib: tst_kconfig: Add runtime checks
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.cz:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,suse.cz:email]
X-Rspamd-Queue-Id: 3285EFC35B
X-Rspamd-Action: no action

Hi!
> > > > utsname01.c:39: TDEBUG: mmap((nil), 64, PROT_READ | PROT_WRITE(3), 33, -1, 0)
> > > > utsname01.c:40: TDEBUG: mmap((nil), 64, PROT_READ | PROT_WRITE(3), 33, -1, 0)
> 
> > Maybe we need TTRACE that would print syscall tracing like that and
> > TDEBUG for the rest of the messages.
> 
> I suppose TTRACE would be printed only for test process and not for the library,
> right?

Yes.

> And it'd be enabled only for debugging (existing -D or
> LTP_ENABLE_DEBUG=1):
> 
> if (ttype == TTRACE && context->lib_pid == getpid())
> 	return;
> 
> Other would we need a new switch and variable? (e.g. -T and
> LTP_ENABLE_TRACING_DEBUG=1)

I would go for LTP_ENABLE_TRACING=1.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
