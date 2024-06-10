Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E49CA9025FD
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2024 17:49:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A25563D0B68
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2024 17:49:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 772D33C0326
 for <ltp@lists.linux.it>; Mon, 10 Jun 2024 17:49:05 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C9EFF1A00FE8
 for <ltp@lists.linux.it>; Mon, 10 Jun 2024 17:49:04 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 311E821D95;
 Mon, 10 Jun 2024 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1718034543;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+DbmSL8s4sP1Xi4g2NuB2OQf6NEgbD3kqruZO9Ft/uk=;
 b=uDV6zkd9lLTDhi5t1RlCHslp0gZSo6lMTClufbuZij7vHgwfxpfOwULXLcuIo9Sup1t6nW
 4UrAX/M+LOLCnh7UR2NqTsVgb1a2r4pZs1Klf21iPEdWDPnZMCFodmcOxMb1KJ5c8gqUnf
 zUJ1GSdZvZEISCewPgszx7tZQTJwbwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1718034543;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+DbmSL8s4sP1Xi4g2NuB2OQf6NEgbD3kqruZO9Ft/uk=;
 b=ykNshdn0VVV4Qv8G0Ai8JjV25yvQsdeCGtoE4GqTZvyfVAsgW9nd3mwuH0P+Max9PzeBtl
 nnPUSAQsY5DUF0Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1718034543;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+DbmSL8s4sP1Xi4g2NuB2OQf6NEgbD3kqruZO9Ft/uk=;
 b=uDV6zkd9lLTDhi5t1RlCHslp0gZSo6lMTClufbuZij7vHgwfxpfOwULXLcuIo9Sup1t6nW
 4UrAX/M+LOLCnh7UR2NqTsVgb1a2r4pZs1Klf21iPEdWDPnZMCFodmcOxMb1KJ5c8gqUnf
 zUJ1GSdZvZEISCewPgszx7tZQTJwbwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1718034543;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+DbmSL8s4sP1Xi4g2NuB2OQf6NEgbD3kqruZO9Ft/uk=;
 b=ykNshdn0VVV4Qv8G0Ai8JjV25yvQsdeCGtoE4GqTZvyfVAsgW9nd3mwuH0P+Max9PzeBtl
 nnPUSAQsY5DUF0Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D55213A7F;
 Mon, 10 Jun 2024 15:49:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uIoWAm8gZ2a8XQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 10 Jun 2024 15:49:03 +0000
Date: Mon, 10 Jun 2024 17:49:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <20240610154901.GA774421@pevik>
References: <20240607-seccomp-v1-1-70063fea55ba@suse.com>
 <20240610140743.GD746646@pevik>
 <6416f2eb-73a9-47d1-9071-5576dda4631b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6416f2eb-73a9-47d1-9071-5576dda4631b@suse.com>
X-Spam-Score: -3.50
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.991]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:email,suse.com:email,imap1.dmz-prg2.suse.org:helo];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MISSING_XM_UA(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] Move prctl04 in seccomp testing suite
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

Hi Andrea,

> Hi Petr,

> On 6/10/24 16:07, Petr Vorel wrote:
> > Hi Andrea,

> > > From: Andrea Cervesato <andrea.cervesato@suse.com>
> > > prictl04 has been renamed as seccomp01 and a test variant has been added
> > > in order to support the seccomp() syscall, that is currently equivalent
> > > to prctl(PR_SET_SECCOMP).
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> > It'd be nice to update test description, that __NR_seccomp is also used.
> That can be done easily

Sure (this would not block merging if it were the only thing).

> > And print info what is being tested, based on tst_variant (see chmod/chmod01.c).
> Ok

I could even add this, if you don't have time to send new version (please Cc me
with the new version or let me know if I should just modify the test).

> > BTW the old test was broken on musl:
> > prctl04.c:212: TFAIL: SECCOMP_MODE_FILTER doesn't permit exit()

> I don't know about this. Maybe it requires one more test. Is there are
> reason for that?

That's kind of report that either musl has bug or it's a test bug when running
on musl. We at SUSE does not care about musl, thus it's for somebody who
actually cares.

Kind regards,
Petr

> > Kind regards,
> > Petr

> Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
