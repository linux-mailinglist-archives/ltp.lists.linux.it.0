Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7D39FF7DD
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2025 11:14:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 504653E7A38
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2025 11:14:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 055B33E5701
 for <ltp@lists.linux.it>; Thu,  2 Jan 2025 11:14:35 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6CCEE142BF86
 for <ltp@lists.linux.it>; Thu,  2 Jan 2025 11:14:35 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 075511F38F;
 Thu,  2 Jan 2025 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1735812874;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8xOAWEW0JsZdrK4ZBLRnSg8bOsQ2v49LjBC5l/lpVI=;
 b=EjVfL5TQU1zhyDp4Ugh18swzTuTtkpdhZQ8J8F5f2nMYg2fMuspjTrcMTbE6sWwijIRPU1
 aXAdiC2vGILmmiMz6vpozTxKlnrLv9+q2aAg5+YMFY1Z4CbTxzxhlv/mJ2lQ1QwrLKM3We
 iufxHwWg0GXPgbsOFFVDsIIPGgnRwWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1735812874;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8xOAWEW0JsZdrK4ZBLRnSg8bOsQ2v49LjBC5l/lpVI=;
 b=PMLw2xHB33i1QwTA3rCuiQRrf5brBzQVXVwwOWzluxM991O6Pnu7+0+WkX7PXiBh8CRSLz
 uz55V8xSVQXaWSBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1735812874;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8xOAWEW0JsZdrK4ZBLRnSg8bOsQ2v49LjBC5l/lpVI=;
 b=EjVfL5TQU1zhyDp4Ugh18swzTuTtkpdhZQ8J8F5f2nMYg2fMuspjTrcMTbE6sWwijIRPU1
 aXAdiC2vGILmmiMz6vpozTxKlnrLv9+q2aAg5+YMFY1Z4CbTxzxhlv/mJ2lQ1QwrLKM3We
 iufxHwWg0GXPgbsOFFVDsIIPGgnRwWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1735812874;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8xOAWEW0JsZdrK4ZBLRnSg8bOsQ2v49LjBC5l/lpVI=;
 b=PMLw2xHB33i1QwTA3rCuiQRrf5brBzQVXVwwOWzluxM991O6Pnu7+0+WkX7PXiBh8CRSLz
 uz55V8xSVQXaWSBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9A1213418;
 Thu,  2 Jan 2025 10:14:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VAMhMAlndmd+VgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 02 Jan 2025 10:14:33 +0000
Date: Thu, 2 Jan 2025 11:14:28 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20250102101428.GA72628@pevik>
References: <20241231115607.56105-1-pvorel@suse.cz>
 <20241231115607.56105-2-pvorel@suse.cz>
 <CAEemH2dUU4JNNxL3Gxrdgf-=_DPWW=Cbb-2AysWi0_BLc3yDFw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dUU4JNNxL3Gxrdgf-=_DPWW=Cbb-2AysWi0_BLc3yDFw@mail.gmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MISSING_XM_UA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_THREE(0.00)[4];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -3.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>,
 "Ricardo B . Marliere" <rbm@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> > +/**
> > + * tst_check_module_signature_enforced() - Check if test needs to be
> > skipped due
> > + * enforced module signature.
> > + *
> > + * Skip test with tst_brk(TCONF) due module signature enforcement if
> > + * module.sig_enforce=1 kernel parameter or CONFIG_MODULE_SIG_FORCE=y.
> > + */
> > +
> > +static inline void tst_check_module_signature_enforced(void)


> This function is used to skip tests while detecting the signature
> enforcement ON, but the name might be ambiguous somewhere.

+1, I was not sure myself about naming.

> I would suggest to name it:

>   tst_check_module_signature_not_enforced(void)  or,
>   tst_skip_if_module_signature_enforced(void)  or,
>   tst_requires_module_signature_disabled(void)

Thanks for the suggestions.  tst_requires_module_signature_disabled(void) looks
best to me, we use "require" and "needs" for tst_brk().

I'll wait little longer before merging in case there is some feedback.

Kind regards,
Petr

> Otherwise, the whole patch set looks good.

> Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
