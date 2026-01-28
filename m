Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDEJEHMGemlE1gEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 13:52:03 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1340A19BB
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 13:52:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7CDB63CB3F0
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 13:52:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C56B03C2787
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 13:52:00 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6AAEF600787
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 13:52:00 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BE00333C28;
 Wed, 28 Jan 2026 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769604719;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JNinW1eTZdSGTcg2ulm+U7vrlwRCjYgowggCsg2pWkw=;
 b=EOsdeEPlhUWTsuuFjE4cCKY9Tph9U3v2ikrIpGee2E8odroNjqQuAQF0t9obeev28KuZ4j
 BvUQ2fNra9kGOvJlUQuJVtrtuQ6Sw0SoBd/Q/VCQaNyNahskOX5I6cvRquAF8rE0Y/Yrv7
 aDTc0y6gA0ot4DRPyeXrG79Zo6D0E3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769604719;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JNinW1eTZdSGTcg2ulm+U7vrlwRCjYgowggCsg2pWkw=;
 b=7jKJZT3f+H2iQvdauGeIX/1f4x5yO70/NUk1qfAtQcpiq5cMQjEYX4JNghOA/n6kYm5xih
 07I8es518UqNq7Bw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=EOsdeEPl;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=7jKJZT3f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769604719;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JNinW1eTZdSGTcg2ulm+U7vrlwRCjYgowggCsg2pWkw=;
 b=EOsdeEPlhUWTsuuFjE4cCKY9Tph9U3v2ikrIpGee2E8odroNjqQuAQF0t9obeev28KuZ4j
 BvUQ2fNra9kGOvJlUQuJVtrtuQ6Sw0SoBd/Q/VCQaNyNahskOX5I6cvRquAF8rE0Y/Yrv7
 aDTc0y6gA0ot4DRPyeXrG79Zo6D0E3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769604719;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JNinW1eTZdSGTcg2ulm+U7vrlwRCjYgowggCsg2pWkw=;
 b=7jKJZT3f+H2iQvdauGeIX/1f4x5yO70/NUk1qfAtQcpiq5cMQjEYX4JNghOA/n6kYm5xih
 07I8es518UqNq7Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C1363EA61;
 Wed, 28 Jan 2026 12:51:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cboBF28GemlcHgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 28 Jan 2026 12:51:59 +0000
Date: Wed, 28 Jan 2026 13:51:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20260128125157.GA35959@pevik>
References: <20260121083343.127613-1-pvorel@suse.cz>
 <20260127131755.GA146899@pevik>
 <447d5d46a8ac3ed8a8283d87bd555459a2679495.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <447d5d46a8ac3ed8a8283d87bd555459a2679495.camel@linux.ibm.com>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] ima_setup.sh: Fix check of signed policy
 requirement
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
Cc: linux-integrity@vger.kernel.org, ltp@lists.linux.it
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
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:email,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: D1340A19BB
X-Rspamd-Action: no action

Hi Mimi,

> Hi Petr,

> On Tue, 2026-01-27 at 14:17 +0100, Petr Vorel wrote:
> > Hi Mimi, all,

> > > Kernel code in arch_get_ima_policy() depends also on
> > > CONFIG_IMA_ARCH_POLICY added in v5.0:
> > > d958083a8f640 ("x86/ima: define arch_get_ima_policy() for x86")

> > > Fixes: c38b528783 ("ima_{conditionals, policy}: Handle policy required to be signed")
> > > Suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > ---
> > > Hi Mimi, all,

> > > FYI I'd like to merge it this week to get it into LTP release.

> > > Kind regards,
> > > Petr

> > I dared to merge this to get it into upcoming LTP release (this/next week).

> I'm so sorry for the delay.

> Only if CONFIG_IMA_ARCH_POLICY IS configured, should check_need_signed_policy be
> set to true and the test skipped.  However, I'm seeing:

> tst_kconfig.c:531: TINFO: Constraint 'CONFIG_IMA_ARCH_POLICY' not satisfied!
> tst_kconfig.c:477: TINFO: Variables:
> tst_kconfig.c:495: TINFO:  CONFIG_IMA_ARCH_POLICY=n
> ima_conditionals 1 TCONF: Aborting due to unsuitable kernel config, see above!

> Instead it's requiring CONFIG_IMA_ARCH_POLICY to be enabled.

Thanks for the report. I'm sorry, I should have used tst_check_kconfigs binary
directly, I'll send a fix shortly.

Kind regards,
Petr

> Mimi


> > >  testcases/kernel/security/integrity/ima/tests/ima_setup.sh | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)

> > > diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> > > index 1bce78d425..df0b8d1532 100644
> > > --- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> > > +++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> > > @@ -466,10 +466,11 @@ require_evmctl()
> > >  }

> > >  # 56dc986a6b20b ("ima: require signed IMA policy when UEFI secure boot is enabled") # v6.5-rc4
> > > +# d958083a8f640 ("x86/ima: define arch_get_ima_policy() for x86") # v5.0
> > >  check_need_signed_policy()
> > >  {
> > >  	tst_secureboot_enabled && tst_kvcmp -ge '6.5' && tst_require_kconfigs \
> > > -		'CONFIG_IMA_KEYRINGS_PERMIT_SIGNED_BY_BUILTIN_OR_SECONDARY'
> > > +		'CONFIG_IMA_KEYRINGS_PERMIT_SIGNED_BY_BUILTIN_OR_SECONDARY,CONFIG_IMA_ARCH_POLICY'
> > >  }

> > >  # loop device is needed to use only for tmpfs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
