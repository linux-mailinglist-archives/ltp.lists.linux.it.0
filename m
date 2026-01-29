Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLTZI4hZe2m5EAIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 13:58:48 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F93B0335
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 13:58:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76C193CC16D
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 13:58:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4721A3CAFF7
 for <ltp@lists.linux.it>; Thu, 29 Jan 2026 13:58:43 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 18CEC1A00A51
 for <ltp@lists.linux.it>; Thu, 29 Jan 2026 13:58:42 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B232A340F5;
 Thu, 29 Jan 2026 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769691521;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aLb9WsA7KNPAisYzFQGPufdZ82dAk9D8Sk3XGb0UYls=;
 b=tvE9//XYglJc47tfQEnO0M/AxzWGFMTmyZ0vw2Rmg97SzD2oENYrSrAgginOrZJtKZ9uMH
 Avht8uXuDveEtF+EbjoUCj9Y2ocvfJNd+OAjR8zlF+FL0wdu8eX92ayvMl/yEKHDIoNGcx
 MCA+7m8FFkBHLM42T693T7aoaFnNTLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769691521;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aLb9WsA7KNPAisYzFQGPufdZ82dAk9D8Sk3XGb0UYls=;
 b=K4RF0uH9JHUGE1eaqHjTaTpdW6aQCyBvMLrQu405hHHvjl78YxkBKK2NthD6TJ1ROn//oe
 Hhr2NeKE9Cfyh8BA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="tvE9//XY";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=K4RF0uH9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769691521;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aLb9WsA7KNPAisYzFQGPufdZ82dAk9D8Sk3XGb0UYls=;
 b=tvE9//XYglJc47tfQEnO0M/AxzWGFMTmyZ0vw2Rmg97SzD2oENYrSrAgginOrZJtKZ9uMH
 Avht8uXuDveEtF+EbjoUCj9Y2ocvfJNd+OAjR8zlF+FL0wdu8eX92ayvMl/yEKHDIoNGcx
 MCA+7m8FFkBHLM42T693T7aoaFnNTLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769691521;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aLb9WsA7KNPAisYzFQGPufdZ82dAk9D8Sk3XGb0UYls=;
 b=K4RF0uH9JHUGE1eaqHjTaTpdW6aQCyBvMLrQu405hHHvjl78YxkBKK2NthD6TJ1ROn//oe
 Hhr2NeKE9Cfyh8BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67A023EA61;
 Thu, 29 Jan 2026 12:58:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0HhlFoFZe2lQfwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 29 Jan 2026 12:58:41 +0000
Date: Thu, 29 Jan 2026 13:58:40 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "Kubaj, Piotr" <piotr.kubaj@intel.com>
Message-ID: <20260129125840.GA102011@pevik>
References: <20260123124952.338065-2-piotr.kubaj@intel.com>
 <20260123202521.GB367190@pevik>
 <c3447fef150c0ad541c4628b50fc84cf19debb23.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3447fef150c0ad541c4628b50fc84cf19debb23.camel@intel.com>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] thermal: add new test group
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
Cc: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, "Ossowski,
 Tomasz" <tomasz.ossowski@intel.com>, "Dubel,
 Helena Anna" <helena.anna.dubel@intel.com>, "Niestepski,
 Daniel" <daniel.niestepski@intel.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_NA(0.00)[suse.cz];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 29F93B0335
X-Rspamd-Action: no action

Hi Piotr,

...
> > > +static void run(void)
> > > +{
> > > +	bool status = 1;
> > > +	char line[8192];
> > > +	uint64_t interrupt_init[nproc], interrupt_later[nproc];
> > > +
> > > +	read_interrupts(interrupt_init, nproc);
> > > +
> > > +	DIR *dir = SAFE_OPENDIR("/sys/class/thermal/");
> > > +	struct dirent *entry;
> > > +	int tz_counter = 0;
> > > +
> > > +	while ((entry = SAFE_READDIR(dir))) {
> > > +		if ((strncmp(entry->d_name, "thermal_zone",
> > > sizeof("thermal_zone"))) > 0)
> > > +			tz_counter++;
> > > +	}
> > > +	SAFE_CLOSEDIR(dir);
> > > +	tst_res(TDEBUG, "Found %d thermal zone(s)", tz_counter);
> > As I noted previously, at least this part will not change if you run
> > test more
> > times, does it? Why not to move it to the setup()?

> > Imagine running test 1000x iterations:
> > ./thermal_interrupt_events -i 1000

> > Why to waste time with reading it again?

> > The only exception might be reading interrupts. I would expect it's
> > ok to have
> > only the initial state (read in the setup() as well), but maybe (when
> > test run
> > with more iterations via -i x) it needs to have the updated state
> > (from the
> > previous iteration).
> That part is still in consultation with our architect.

Thank you! Of course, it's ok to keep it if it's needed.

...
> > > +	for (int i = 0; i < tz_counter; i++) {
> > > +		if (x86_pkg_temp_tz[i]) {

> > run() is quite long. Maybe move content of of this loop would help.
> > Something like this (use whatever function name) would help the
> > readability.

> > 	for (int i = 0; i < tz_counter; i++) {
> > 		if (x86_pkg_temp_tz[i])
> > 			test_zone(x86_pkg_temp_tz[i]);
> > 	}
> > Maybe even split the while part into it's own function.
> Changed. I wanted to avoid creating functions that were only used once.

Understand, but there is also code readability which matters.

...
> > > +
> > > +			while (sleep_time > 0) {
> > > +				tst_res(TDEBUG, "Running for %f
> > > seconds, then sleeping for %d seconds", run_time, sleep_time);
> > nit: %f should be %d, right?
> run_time is double, because difftime returns double. Switching to %d
> causes a warning. If you prefer, I might add casting to int and then
> %d.

The output looks better but it's very minor.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
