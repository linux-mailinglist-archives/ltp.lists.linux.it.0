Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB884A074B9
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 12:30:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95EDE3C217E
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 12:30:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 481B53C0325
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 12:30:13 +0100 (CET)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AAA461A010A9
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 12:30:12 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 25D611F393;
 Thu,  9 Jan 2025 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736422211;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zblfhnf8ZxW/S5GBMnJizwlSMziFLgDKUOTvoWPhgoc=;
 b=0K2EaxI/3JJ0yLLFg8DBvKBAVYedSoGfFSnJHyg99DjxV8UT8XJDC3SGfyKezU0StspCod
 fNPxYxIyFv33m6fNifZjCTpfS5rfLs0EnrIaGNaL64Nh5qENH+lUXv8URwIGBSD8SMQVQ4
 WJNQMKvcFxVVylZdeSNp5JxPJr2PsLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736422211;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zblfhnf8ZxW/S5GBMnJizwlSMziFLgDKUOTvoWPhgoc=;
 b=VJNkD+iGtrON0wcxj67/cQytea/RXESrS8ZvIfx0i+jxQFlIPcRcLnO06UH1N1TdeE5hWB
 4gaTLUqE3y5sgWDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736422211;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zblfhnf8ZxW/S5GBMnJizwlSMziFLgDKUOTvoWPhgoc=;
 b=0K2EaxI/3JJ0yLLFg8DBvKBAVYedSoGfFSnJHyg99DjxV8UT8XJDC3SGfyKezU0StspCod
 fNPxYxIyFv33m6fNifZjCTpfS5rfLs0EnrIaGNaL64Nh5qENH+lUXv8URwIGBSD8SMQVQ4
 WJNQMKvcFxVVylZdeSNp5JxPJr2PsLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736422211;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zblfhnf8ZxW/S5GBMnJizwlSMziFLgDKUOTvoWPhgoc=;
 b=VJNkD+iGtrON0wcxj67/cQytea/RXESrS8ZvIfx0i+jxQFlIPcRcLnO06UH1N1TdeE5hWB
 4gaTLUqE3y5sgWDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E178F13876;
 Thu,  9 Jan 2025 11:30:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id auECNUKzf2dyJwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 09 Jan 2025 11:30:10 +0000
Date: Thu, 9 Jan 2025 12:30:09 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Ma Xinjian <maxj.fnst@fujitsu.com>, ltp@lists.linux.it, akumar@suse.de
Message-ID: <20250109113009.GA198463@pevik>
References: <20241219065700.3153237-1-maxj.fnst@fujitsu.com>
 <20250109094235.GA184406@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250109094235.GA184406@pevik>
X-Spam-Score: -3.50
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,imap1.dmz-prg2.suse.org:helo]; 
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] set_tid_address01: refactor with new LTP API
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

> Hi Ma Xinjian, Avinesh,

> ...
> > +	TEST(tst_syscall(__NR_set_tid_address, &newtid));
> > +	if (TST_RET == getpid())
> > +		tst_res(TPASS, "set_tid_address call succeeded: as expected %ld", TST_RET);
> > +	else
> > +		tst_res(TFAIL | TTERRNO, "set_tid_address call failed: expected %d, but got %ld", getpid(), TST_RET);

> I wanted to replace this with:

> TST_EXP_EQ_LI(tst_syscall(__NR_set_tid_address, &newtid), getpid());

> But that TST_EXP_EQ_LI() not use TTERRNO.

> Maybe use this?

> 	TST_EXP_PID(tst_syscall(__NR_set_tid_address, &newtid));
> 	TST_EXP_EQ_LI(TST_RET, getpid());

OK, this is the correct one liner:
TST_EXP_VAL(tst_syscall(__NR_set_tid_address, &newtid), getpid());

Any objection to merge with change below?

Kind regards,
Petr

> Kind regards,
> Petr

+++ testcases/kernel/syscalls/set_tid_address/set_tid_address01.c
@@ -16,11 +16,7 @@ static void verify_set_tid_address(void)
 {
 	int newtid = -1;
 
-	TEST(tst_syscall(__NR_set_tid_address, &newtid));
-	if (TST_RET == getpid())
-		tst_res(TPASS, "set_tid_address call succeeded: as expected %ld", TST_RET);
-	else
-		tst_res(TFAIL | TTERRNO, "set_tid_address call failed: expected %d, but got %ld", getpid(), TST_RET);
+	TST_EXP_VAL(tst_syscall(__NR_set_tid_address, &newtid), getpid());
 }
 
 static struct tst_test test = {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
