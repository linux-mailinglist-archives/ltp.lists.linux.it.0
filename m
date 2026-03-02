Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFFUHHGUpWnXEAYAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 14:45:21 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3951DA068
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 14:45:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C8B13D787F
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2026 14:45:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DFCE03D0666
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 14:45:09 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 43AF76002AC
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 14:45:09 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E7B885BD52;
 Mon,  2 Mar 2026 13:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772459108;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T49F5jPJX2q7DInCRH1cspXOpfgn7xDVAAqlj21pR0s=;
 b=aK/yQjEiahRig33humAs+eK3PIwqWMzlSj6jFnR3/WWFxTuiGTx/GVX2bo99RBWLbLSZBk
 JhNCM8a6Ep8wLdO+cqbiO3EnnvFz1tBFrVcs3v9M+L+HUQRYmQFi9lo2AV32Xi8bN7LNz4
 LziLWLRegHP0eXcomFx3yP92Rdb7/cQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772459108;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T49F5jPJX2q7DInCRH1cspXOpfgn7xDVAAqlj21pR0s=;
 b=nDKTiV3NYYsecGRVvg36HASrdPEW4H7h269Zf2KomVYvIX1A2uGD2/pA888pyVEApfxBD2
 b3Zgu6Bd60zUCBBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772459107;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T49F5jPJX2q7DInCRH1cspXOpfgn7xDVAAqlj21pR0s=;
 b=F/OS6n6Jt/x7bFcK7C6UxccX1qrJrh3NHgyaqHX539Vj/J3KLxIEuS6BetmdrdKGdCnvZG
 hqimahP1WNGWX/CsBrUjSdvA9VqdGc8QOpAewsPrysVc/6AdR+6wmxBiqeeGUCp7JOdD1j
 0CldVaLeW+NsccUokoAxl6fL9oKuZN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772459107;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T49F5jPJX2q7DInCRH1cspXOpfgn7xDVAAqlj21pR0s=;
 b=8U1rEbH951OXEFvSn/XGsjG2q1BUSJLoqflt4PMqtcZUZMrDN7dw5tHIfcQRf6oeu64RtP
 y33D9MGG5E+CvNDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90E613EA69;
 Mon,  2 Mar 2026 13:45:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id F89nH2OUpWlLCwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 02 Mar 2026 13:45:07 +0000
Date: Mon, 2 Mar 2026 14:45:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Piotr Kubaj <piotr.kubaj@intel.com>
Message-ID: <20260302134501.GA280343@pevik>
References: <20260226143134.138506-3-piotr.kubaj@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226143134.138506-3-piotr.kubaj@intel.com>
X-Spam-Score: -3.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v10] thermal: add new test group
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
Cc: helena.anna.dubel@intel.com, tomasz.ossowski@intel.com,
 rafael.j.wysocki@intel.com, ltp@lists.linux.it, daniel.niestepski@intel.com
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
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_NA(0.00)[suse.cz];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:email,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.974];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 0D3951DA068
X-Rspamd-Action: no action

Hi Piotr, all,

I like the runtime drastically speedup :).

...
> +static void cleanup(void)
> +{
> +	if (x86_pkg_temp_tz_found)
> +		SAFE_FILE_PRINTF(trip_path, "%d", trip);


We discussed EINVAL error on a first run in [1]
thermal_interrupt_events.c:178: TWARN: Failed to close FILE '/sys/class/thermal/thermal_zone1/trip_point_1_temp': EINVAL (22)

This happens in safe_file_vprintf(), just TBROK is converted to TWARN due being
in cleanup(). I wonder if separate test for this would be useful.

You pointed a kernel fix [2] bug git hash changed (now cgit shows Bad commit
"reference: 39b1bd1613b8f73994f654988ad75a72b633f5e2"). Do you know the new hash
of the fix? Maybe putting the hash info in the test would be useful

	.tags = (const struct tst_tag[]) {
			{"linux-git", "..."}, // hash of the fix
			{}

nit (we discussed it in the past): when x86_pkg_temp_tz_found is bool, instead
of using 1:
x86_pkg_temp_tz_found = 1;
would be cleaner to use true.

Otherwise LGTM now.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/20260121230639.GA10001@pevik/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/patch/?id=39b1bd1613b8f73994f654988ad75a72b633f5e2

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
