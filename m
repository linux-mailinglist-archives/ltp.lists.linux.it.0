Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFAFBA3A75
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Sep 2025 14:41:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AD893CE10E
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Sep 2025 14:41:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 516E93CE099
 for <ltp@lists.linux.it>; Fri, 26 Sep 2025 14:41:35 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B7DD81A008A5
 for <ltp@lists.linux.it>; Fri, 26 Sep 2025 14:41:33 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2E4B225A16;
 Fri, 26 Sep 2025 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758890492;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iI5UUOJqau8209x7nWAJMJpgXPaVZ5+szd2nkE8R2/8=;
 b=HZ9iu49AsTy1gv/gniGdcltTbgNOC5DYEYZZrr9bMbicQv7LP1uK7lNUudiHLp1LyUsPP9
 3z+Ig+AEL4mjt1WgGeMKcMOWlhsYQpfmqTeZ1dFHsVpuY+NIu1SqyEJ1yVzt+MmpPwIUop
 OYMe/zuL5xbOjNrYBoXgEOBFmX8f8dw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758890492;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iI5UUOJqau8209x7nWAJMJpgXPaVZ5+szd2nkE8R2/8=;
 b=kYXkNrJHTzV9rh1ikRwKwH3bzLpbzpnnWLIx1TEq14YtRpmH7na8mM1emrPzOKTML7Dfoy
 V7zwCeqfFi1/77Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758890492;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iI5UUOJqau8209x7nWAJMJpgXPaVZ5+szd2nkE8R2/8=;
 b=HZ9iu49AsTy1gv/gniGdcltTbgNOC5DYEYZZrr9bMbicQv7LP1uK7lNUudiHLp1LyUsPP9
 3z+Ig+AEL4mjt1WgGeMKcMOWlhsYQpfmqTeZ1dFHsVpuY+NIu1SqyEJ1yVzt+MmpPwIUop
 OYMe/zuL5xbOjNrYBoXgEOBFmX8f8dw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758890492;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iI5UUOJqau8209x7nWAJMJpgXPaVZ5+szd2nkE8R2/8=;
 b=kYXkNrJHTzV9rh1ikRwKwH3bzLpbzpnnWLIx1TEq14YtRpmH7na8mM1emrPzOKTML7Dfoy
 V7zwCeqfFi1/77Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BAD51386E;
 Fri, 26 Sep 2025 12:41:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jJR1AfyJ1mg0SQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 26 Sep 2025 12:41:32 +0000
Date: Fri, 26 Sep 2025 14:41:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20250926124122.GA163930@pevik>
References: <aLVzVyaVhr4IHkyd@yuki.lan>
 <CAEemH2d_0eTYA+DtV5Dy16vTJ5s9a94mpKY6cp+Ofh2Ze1S68Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2d_0eTYA+DtV5Dy16vTJ5s9a94mpKY6cp+Ofh2Ze1S68Q@mail.gmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 MISSING_XM_UA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; FROM_HAS_DN(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -3.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP Release preparations
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

Hi Li, Cyril, all,

> Hi Cyril, Petr,

> Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > It's about the time we start to prepare for the September release. As
> > usuall I will go over the patches in the patchwork in the next week or
> > two. If there is something that you think should be part of the release,
> > please point it out so that I can have a look ASAP.



> LTP pre-release test looks good on our latest RHEL 9/10 series.
> Just few minor errors that need the following two fix patches:

> https://patchwork.ozlabs.org/project/ltp/patch/20250922203927.14552-1-akumar@suse.de/
> https://patchwork.ozlabs.org/project/ltp/patch/20250917075729.30093-1-liwang@redhat.com/

Thanks a lot for your testing. Both of these were fixed.

> Note:  Next week is our public holiday (7days), so I may not be able to
> reply to emails in time.

Enjoy your free time :).

All: I guess that's all for the release.

I'd vote for applying LTP_QUIET patch:
https://lore.kernel.org/ltp/20250922110611.duahjf4vqvwp4zs4@lida.tpb.lab.eng.brq.redhat.com/

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
