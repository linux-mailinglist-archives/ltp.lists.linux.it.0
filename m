Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F4FA2ABE5
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2025 15:54:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AD933C9280
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2025 15:54:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5944F3C01C6
 for <ltp@lists.linux.it>; Thu,  6 Feb 2025 15:54:18 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0DDCE619A84
 for <ltp@lists.linux.it>; Thu,  6 Feb 2025 15:54:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D27C31F381;
 Thu,  6 Feb 2025 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1738853657;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TcIsUXkTogBqQYF4XktG5rNaFqOQ2R4QLIRyl3uvGRk=;
 b=Ypt0XDl4R+XD4fl0DHv7F2aO/tRE5/CYyox7xPKXkPD7AKHDzwNxK+UEQ7m/n7939A6BTD
 au7lPBlEBMPaL9ze4OROD4ZtR7KKr9w/jIPJqirxTyEzua9fQ4vgeps0OOqJedYKO+syMb
 rssrSD1T5wCB+7TI8Yy98bjnt4acfp8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1738853657;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TcIsUXkTogBqQYF4XktG5rNaFqOQ2R4QLIRyl3uvGRk=;
 b=S8HFpPTVfs+SR4Fx3JL4zFQjK+IYjEL1Wr8cTo7ScMGpHJPL44cDovV2zeGL09Mw4Vny20
 fP2jb5N7MyUWg9BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1738853656;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TcIsUXkTogBqQYF4XktG5rNaFqOQ2R4QLIRyl3uvGRk=;
 b=Gg6FS81a7yV+tpXfj5xlwcBSPtPzLeoqrXP908b+kJ9RlNw442qggjTl2EQX1ApDVRU88n
 xlOYzyDq2N2rk7AJpCVA0/17LE24FaWtt/XPpSSpJCa1+NICY1FaEtM3zviW83z9vOEkJK
 X7xKiy7UHk9gX3RFdd129N7pZNTFBLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1738853656;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TcIsUXkTogBqQYF4XktG5rNaFqOQ2R4QLIRyl3uvGRk=;
 b=/akJHovcD40H95TXXfwkkANXODJ5Z5uwKPyvQWfHyW32lsbDUBeGoiMV1y6D27hYB3+it5
 dXMr+jECoksigVCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B141813694;
 Thu,  6 Feb 2025 14:54:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NibCKRjNpGcCLgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 06 Feb 2025 14:54:16 +0000
Date: Thu, 6 Feb 2025 15:54:15 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <20250206145415.GA1573569@pevik>
References: <20250206-doc_tests_list-v5-0-52110e1421a9@suse.com>
 <20250206-doc_tests_list-v5-2-52110e1421a9@suse.com>
 <20250206142656.GB1566904@pevik>
 <1bb1f143-4ce5-4451-9da9-7176dd8fd0f4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bb1f143-4ce5-4451-9da9-7176dd8fd0f4@suse.com>
X-Spam-Score: -3.50
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MISSING_XM_UA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_THREE(0.00)[3];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 2/2] doc: add tests catalog page
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

> Hi Petr,

> On 2/6/25 15:26, Petr Vorel wrote:
> > Hi Andrea,

> > Acked-by: Petr Vorel<pvorel@suse.cz>

> > Thanks for extra comments to _generate_setup_table().

> > There is quite a lot of warnings. I'm not suggesting we should fix them (I don't
> > want to block this, let's merge it today), but more warnings and errors we get
> > the worse is to find a real problem which might appear in the future.

> > I might take time in the future to fix them - some of them could be easily
> > fixed and some of the warning means part of the description got lost, e.g.
> > "1. First test case" and "2. Second test case" in mountns0[1-3].c is not
> > followed by the actual description "X: bind mounts DIR_B to DIR_A", indent is
> > also wrong. This means sphinx syntax (reST) is not 100% compatible to
> > asciidoc{,tor} syntax. Syntax problems are also visible in Vim with highlighting
> > on.
> The warnings are all related to the asciidoc format which needs to be
> converted into RST.

OK. I'll have look into the fixes tomorrow.
I'll also prepare the docparse/ removal.

> The meaning of these patches was also to introduce this change.

Ah, I was not aware of the slight difference until seeing it in the action.
But sure, not a big deal.

Kind regards,
Petr

> Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
