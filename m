Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMjPNuXYrmmKJQIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Mar 2026 15:27:49 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8170223A84B
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Mar 2026 15:27:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA3FE3DD9D4
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2026 15:27:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C7F753C4C11
 for <ltp@lists.linux.it>; Mon,  9 Mar 2026 15:27:46 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4CA546001E1
 for <ltp@lists.linux.it>; Mon,  9 Mar 2026 15:27:46 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE96D4D229;
 Mon,  9 Mar 2026 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1773066465;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7CLbatxYM8txW0jCWp4Y0i0hhSFhv01eCu4Fty9GYto=;
 b=iN8liNBNpLEWnd74z68+TNGQZdTL/USb50IunaiCsP1rbYSkqI9NAqgVZ+LbncMoPTeCqg
 h6UwWBT3xLjr6wCAvhGqRxG2LJHwDcqmqEx8MNg4w3dROH/jYQ8trLj7Y5LjSLSqWrouEl
 XACuLByb4wgUBdeDuBTg7XgR6BmjznQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1773066465;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7CLbatxYM8txW0jCWp4Y0i0hhSFhv01eCu4Fty9GYto=;
 b=dljHFECLpj6o92MjUfEc0DFCeH3uF6FC+FPvxZOthrTrhGSyYCM4DTcXbhPG3nufd8Cu1f
 nnbGZ/Ionm3gsDDw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=v+3fiFHi;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="ee/CMJR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1773066464;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7CLbatxYM8txW0jCWp4Y0i0hhSFhv01eCu4Fty9GYto=;
 b=v+3fiFHiqRaBKE8T6mFH2w6UrxUWwm3b5jeFOrxZ7AfUZRgIQIcrymUaUGvG4L9llDYWsw
 NVObSdXTm2mSXwTJmJfqF3BgiF5d89UR8RlhZImP9HT2F8EpPIG56lrG0VHRY3osoBk0E3
 2H7PJUsV44d7Zqs9aOWJO5owe8BGpGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1773066464;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7CLbatxYM8txW0jCWp4Y0i0hhSFhv01eCu4Fty9GYto=;
 b=ee/CMJR6Qh7M9xShhUhH0u1OIshysOqTjN8ydvfyqL1qZxFvoqGT6jpNzcxTivpj5jrYzb
 IzbQH1mvkzwQ1uAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B484C3EF43;
 Mon,  9 Mar 2026 14:27:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0CpXK+DYrmnMRwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 09 Mar 2026 14:27:44 +0000
Date: Mon, 9 Mar 2026 15:27:43 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20260309142743.GA26820@pevik>
References: <20260224162726.28933-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260224162726.28933-1-mdoucha@suse.cz>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] aio_cancel_3-1: Rewrite test
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
X-Rspamd-Queue-Id: 8170223A84B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,picard.linux.it:rdns,picard.linux.it:helo,linux.it:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.457];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Hi Martin,

> The test schedules multiple async writes into a file and then hopes that
> at least one will block long enough that it can be canceled
> before completion. Use a socket pair instead of a file to force async
> writes to block indefinitely and make sure at least one can be canceled.
> Then cancel all requests on the input socket and check that all signals
> have been delivered and the expected number of requests has been canceled.
> This fixes a race condition where aio_cancel() could be delayed until
> after all writes have already completed, making the test unreliable.

Thanks for the fix, merged!
Also thank you for additional error log output and formatting cleanup.

I suppose some of the tests still need to be fixed ([46]-1.c queue a lot of
aio_write()).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
