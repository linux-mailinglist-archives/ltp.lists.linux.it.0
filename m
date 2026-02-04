Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPdpC/HHg2k/uQMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 23:28:01 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F2DECFDA
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 23:28:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D70B73CE205
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Feb 2026 23:27:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F39653CD3CA
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 23:27:57 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 40FD91000378
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 23:27:56 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AD8345BD6B;
 Wed,  4 Feb 2026 22:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770244075;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bzkywv8tRXHyPA71VXfkL0QXP2B0wNf4KxWkd6bAw7Y=;
 b=Brz//1h07Qbpn4HJ5h8CO/xr0MOmMZhp4V6f1SPIAX8Pm4Kat1Tmt5F/9dTiUi3eUXCFvu
 o2zwiAT72w38nxGkeV0eu67CMBLD55I2Y1hrkSdjOj4pe5C2JbgDMOj5rhNcFEYRN15wsX
 2DsIVPhVfjf3AkD0Eg4P4nfLqhwIcOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770244075;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bzkywv8tRXHyPA71VXfkL0QXP2B0wNf4KxWkd6bAw7Y=;
 b=tyhXHQ/KQgqbsa6hNTd4h6133y0xTsSD5c8T78MKiJAu0KW9z7k/sDA2LL3FPwDPGlUcH+
 1fcPymikUDTqJ2BQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="Brz//1h0";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="tyhXHQ/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770244075;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bzkywv8tRXHyPA71VXfkL0QXP2B0wNf4KxWkd6bAw7Y=;
 b=Brz//1h07Qbpn4HJ5h8CO/xr0MOmMZhp4V6f1SPIAX8Pm4Kat1Tmt5F/9dTiUi3eUXCFvu
 o2zwiAT72w38nxGkeV0eu67CMBLD55I2Y1hrkSdjOj4pe5C2JbgDMOj5rhNcFEYRN15wsX
 2DsIVPhVfjf3AkD0Eg4P4nfLqhwIcOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770244075;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bzkywv8tRXHyPA71VXfkL0QXP2B0wNf4KxWkd6bAw7Y=;
 b=tyhXHQ/KQgqbsa6hNTd4h6133y0xTsSD5c8T78MKiJAu0KW9z7k/sDA2LL3FPwDPGlUcH+
 1fcPymikUDTqJ2BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 285893EA63;
 Wed,  4 Feb 2026 22:27:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Q+AzBevHg2k9RgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 04 Feb 2026 22:27:55 +0000
Date: Wed, 4 Feb 2026 23:27:53 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20260204222753.GA279256@pevik>
References: <20260203024320.227453-1-liwang@redhat.com>
 <20260204122332.GC224465@pevik> <aYNVsiL4xf2P9R6A@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYNVsiL4xf2P9R6A@redhat.com>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
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
	R_SPF_ALLOW(-0.20)[+a];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: C0F2DECFDA
X-Rspamd-Action: no action

Hi Li,

...
> > lapi/openat2.h uses struct open_how directly, shouldn't be included lapi/fcntl.h
> > there?

> From my understand lapi/* are appendix for missing stuff in header file.

Yes, but we agreed in the past, that it's better to include relevant libc/kernel
header in the lapi header [1]:

	LAPI header should always include original header.

[1] https://github.com/linux-test-project/ltp/blob/master/doc/old/C-Test-API.asciidoc#lapi-headers

I thought we had a discussion about it, but now I see nobody acked the change in
ML (cfbc41d775), therefore I somehow pushed this approach without consensus with
others. I'm sorry for that, we can revise that. At the moment quite a few lapi
headers use this approach (likely majority).

IMHO it's better to include it than expect that all tests which use lapi header
will include relevant header *before* (otherwise tests can happily always depend
on fallback instead of using a real value from a system header).

It's a minor detail, but being consistent helps for newcomers to understand
LTP code.

And *if* we agree on it, it should be now doc/developers/ground_rules.rst.

Also there is a different approach where should be fallbacks. We use some lapi
headers (e.g. lapi/openat2.h but there are more) which don't have public
equivalent in libc (/usr/include/bits/openat2.h cannot be used directly, but via
<fcntl.h>). Therefore I would put content of lapi/openat2.h into lapi/fcntl.h,
but that's a minor detail.

> Test cases should only include standard header files, and lapi should
> only be used in case of missing or conflicting header files.

But lapi/openat2.h also uses struct open_how. I would either include <fcntl.h>
in both sources or just in lapi/openat2.h. Having it only in tests looks to me
as not ideal.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
