Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II6UK/VJmGk6FQMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 12:48:05 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539F1675C6
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 12:48:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF9B03D07AC
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 12:48:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD0C03D0735
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 12:47:54 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 20249600676
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 12:47:53 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8FEDB3E6EA;
 Fri, 20 Feb 2026 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771588073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dBqGddCggCis+gF5Fs0EPWiY8DsLoqNYi3BT/vQIMSs=;
 b=Gsspr37X7cBLcd9QevFbXe6eN4tH64HoGWMbQkrQb3A0fiV/w4pR9j9I3/QrqdraEKkowx
 aXQ1vA1xacnr2lt+2ZBu3XhnWB1kqlRNM/VbqcPaIHIVYM7XRj2nXWpLzDkst9T8JKa1L2
 AmKBm1RCURNGkmR3jtAfcwi5BWDMnsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771588073;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dBqGddCggCis+gF5Fs0EPWiY8DsLoqNYi3BT/vQIMSs=;
 b=TtOLF4hBArBLk/LhGzFtDg2JPEkV1YugR7fBlKGHoMEiAF9aX93hgtm7J0HE8BwgMHU/tp
 8VTyLIpxTxEJTNBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771588073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dBqGddCggCis+gF5Fs0EPWiY8DsLoqNYi3BT/vQIMSs=;
 b=Gsspr37X7cBLcd9QevFbXe6eN4tH64HoGWMbQkrQb3A0fiV/w4pR9j9I3/QrqdraEKkowx
 aXQ1vA1xacnr2lt+2ZBu3XhnWB1kqlRNM/VbqcPaIHIVYM7XRj2nXWpLzDkst9T8JKa1L2
 AmKBm1RCURNGkmR3jtAfcwi5BWDMnsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771588073;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dBqGddCggCis+gF5Fs0EPWiY8DsLoqNYi3BT/vQIMSs=;
 b=TtOLF4hBArBLk/LhGzFtDg2JPEkV1YugR7fBlKGHoMEiAF9aX93hgtm7J0HE8BwgMHU/tp
 8VTyLIpxTxEJTNBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7527F3EA65;
 Fri, 20 Feb 2026 11:47:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id C8VZGulJmGlhcQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 20 Feb 2026 11:47:53 +0000
Date: Fri, 20 Feb 2026 12:47:58 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <aZhJ7h0toQVUzHnf@yuki.lan>
References: <20260205121540.329921-1-pvorel@suse.cz>
 <20260205121540.329921-2-pvorel@suse.cz>
 <aZQytH7k6pVXqdsz@yuki.lan> <20260219202051.GB341772@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260219202051.GB341772@pevik>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/6] doc: INSTALL: dma_thread_diotest.c: Remove
 runltp from doc
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
Cc: ltp@lists.linux.it, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,linux.it:url,yuki.lan:mid,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 4539F1675C6
X-Rspamd-Action: no action

Hi!
> > > @@ -105,9 +105,9 @@ Quick Start
> > >  	$ ./configure
> > >  	$ make all
> > >  	# make install
> >         ^
> > 	This should be $ (not caused by this patch but worth fixing)
> 
> I can change it, but IMHO for creating /opt/ltp is needed to run it as root
> for a first time. Or one must chmod/chown /opt/ltp under root.

Huh? The make install should just work fine. I'm just pointing out the
typo # vs $. Or did I miss something?

> > > -	$ /opt/ltp/runltp
> 
> > >  *NOTE:
> > > +- For running tests use kirk [1], individual test you can run directly.
> >                                                     ^
> > 					 This sentece has wrong order of words.
> 
> > And also oversimplifies things, there is no mention of setting correct
> > PATH that needs to be done in order to run these tests.
> 
> > I would just drop that and leave only the first sentence.
> 
> Sure, I can remove it:
> 
> +++ INSTALL
> @@ -107,7 +107,7 @@ Quick Start
>  	# make install
>  
>  *NOTE:
> -- For running tests use kirk [1], individual test you can run directly.
> +- For running tests use kirk [1].
>  - LTP assumes the existence of the nobody, bin, and daemon users and their
>  groups.  If these IDs do not exist, certain tests will fail. The respective
>  user and group IDs should be the same, i.e. if `nobody's' user ID is 99, then
> ---
> If I'm correct this is likely the only change. Can you add your RBT and I modify
> before merge?

Once we agree on the # vs $.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
