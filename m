Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6FA00670
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2025 10:07:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCEA83EFDE2
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2025 10:07:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 559A43E242A
 for <ltp@lists.linux.it>; Fri,  3 Jan 2025 10:07:49 +0100 (CET)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CBB831BDD89E
 for <ltp@lists.linux.it>; Fri,  3 Jan 2025 10:07:47 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2A5BD2115E;
 Fri,  3 Jan 2025 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1735895266;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tRQScYmAu1BrIF9Iv49/tOpd4PqUSbHvcBziCJbu2Bw=;
 b=tLhRH1Q8RLxQD8ANolOrkCdvYwe3EDjTVflS/WyXIy0VnbiGt/FhxMyxJLhJXlHqDinEWG
 BHKHZgYLSv9O6P4vcqTo93e8X6YlpBqkVMO2nKjswfRdJSCOG9+AxM9Ug+I5hv8Vgnd2mm
 8NgbC934k/X9szloH3SQpxeTxdrRQOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1735895266;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tRQScYmAu1BrIF9Iv49/tOpd4PqUSbHvcBziCJbu2Bw=;
 b=p/xojsZmp9PW3evBQ29HWYgW4q1+astlD5idQ8eFIpo8QZ65UC2y4PFNeakSZuZ+IFAeZS
 dj9Gflqz9hXhf6Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1735895266;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tRQScYmAu1BrIF9Iv49/tOpd4PqUSbHvcBziCJbu2Bw=;
 b=tLhRH1Q8RLxQD8ANolOrkCdvYwe3EDjTVflS/WyXIy0VnbiGt/FhxMyxJLhJXlHqDinEWG
 BHKHZgYLSv9O6P4vcqTo93e8X6YlpBqkVMO2nKjswfRdJSCOG9+AxM9Ug+I5hv8Vgnd2mm
 8NgbC934k/X9szloH3SQpxeTxdrRQOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1735895266;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tRQScYmAu1BrIF9Iv49/tOpd4PqUSbHvcBziCJbu2Bw=;
 b=p/xojsZmp9PW3evBQ29HWYgW4q1+astlD5idQ8eFIpo8QZ65UC2y4PFNeakSZuZ+IFAeZS
 dj9Gflqz9hXhf6Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E611413418;
 Fri,  3 Jan 2025 09:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HeNoNuGod2enCgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 03 Jan 2025 09:07:45 +0000
Date: Fri, 3 Jan 2025 10:07:44 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>, ltp@lists.linux.it,
 Po-Hsu Lin <po-hsu.lin@canonical.com>,
 "Ricardo B . Marliere" <rbm@suse.com>
Message-ID: <20250103090744.GA193802@pevik>
References: <20241231115607.56105-1-pvorel@suse.cz>
 <20241231115607.56105-2-pvorel@suse.cz>
 <CAEemH2dUU4JNNxL3Gxrdgf-=_DPWW=Cbb-2AysWi0_BLc3yDFw@mail.gmail.com>
 <20250102101428.GA72628@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250102101428.GA72628@pevik>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto]; 
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -3.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/2] lib: Add helpers for module signature
 enforcement
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Po-Hsu Lin, all,

> Hi Li,

> > > +/**
> > > + * tst_check_module_signature_enforced() - Check if test needs to be
> > > skipped due
> > > + * enforced module signature.
> > > + *
> > > + * Skip test with tst_brk(TCONF) due module signature enforcement if
> > > + * module.sig_enforce=1 kernel parameter or CONFIG_MODULE_SIG_FORCE=y.
> > > + */
> > > +
> > > +static inline void tst_check_module_signature_enforced(void)


> > This function is used to skip tests while detecting the signature
> > enforcement ON, but the name might be ambiguous somewhere.

> +1, I was not sure myself about naming.

> > I would suggest to name it:

> >   tst_check_module_signature_not_enforced(void)  or,
> >   tst_skip_if_module_signature_enforced(void)  or,
> >   tst_requires_module_signature_disabled(void)

> Thanks for the suggestions.  tst_requires_module_signature_disabled(void) looks
> best to me, we use "require" and "needs" for tst_brk().

> I'll wait little longer before merging in case there is some feedback.

FYI patchset merged with rename:
s/tst_check_module_signature_enforced/tst_requires_module_signature_disabled/

Thanks for your review.

Kind regards,
Petr

> Kind regards,
> Petr

> > Otherwise, the whole patch set looks good.

> > Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
