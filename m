Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 493238A8067
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Apr 2024 12:07:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0983D3CFB7E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Apr 2024 12:07:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF6DE3CFB0F
 for <ltp@lists.linux.it>; Wed, 17 Apr 2024 12:07:55 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6BFB814060D5
 for <ltp@lists.linux.it>; Wed, 17 Apr 2024 12:07:54 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF38A206BB;
 Wed, 17 Apr 2024 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713348473;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O/I+nVVfeDP0EI49VPwfWYlVuNrU9xH86TRIiw2lQGk=;
 b=PG5UZbzW/m9Q1fkGwRX6Xfbog0HTiUleM1UmJLuXWGbPnYPVzFtXEpXIA28+uFnMOHkMm+
 3bTfEe6OLRUN4DC9RlxzpcAAVs4KSp8+SZ3l7Mx79AoRp5zyEsVB87ekyqPbFikZau2M5U
 6+aD/zX4PueQgmSi0F4WI+/37BwfLQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713348473;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O/I+nVVfeDP0EI49VPwfWYlVuNrU9xH86TRIiw2lQGk=;
 b=vtwGghrbj3M0I6qXkH8U6L0clcWeDtrMNzjtkfVvMnUhNd6zCqhgMS0jYMvDfYCIQYfPc7
 e97x8wgtsLkhRuBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=BgLx+Zk+;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=9P1f+JCr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713348472;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O/I+nVVfeDP0EI49VPwfWYlVuNrU9xH86TRIiw2lQGk=;
 b=BgLx+Zk+wu3hSooRRW20gsQtuhOEPoN47whTN5heZWmDc7kxdOg4wZgOekTYkElRaDq4df
 GA6BDN7c9rNCStk9ACxN6gzbnR8/4lwM0FZdEWazF4ZJB54ddNhQZl8B3nSzWvKxepUkFE
 zy2yZY7iMBHwd+7L5ql+3qMfrTzVrxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713348472;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O/I+nVVfeDP0EI49VPwfWYlVuNrU9xH86TRIiw2lQGk=;
 b=9P1f+JCryUDserqjr6ArYYl735qrJPxxnnY9fkiH5HWp0T0wtopB4frPtCaYgVQY0ruyP7
 tJcemkb7n9MFIcBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE8E913957;
 Wed, 17 Apr 2024 10:07:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pJ49MXifH2bjZgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 17 Apr 2024 10:07:52 +0000
Date: Wed, 17 Apr 2024 12:07:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <20240417100751.GB713385@pevik>
References: <20240415091806.18556-1-andrea.cervesato@suse.de>
 <Zh502b2hn9K8S4PQ@yuki> <20240417091914.GB708026@pevik>
 <75519d70-3295-4756-8fbd-eca241b5ed2e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75519d70-3295-4756-8fbd-eca241b5ed2e@suse.com>
X-Spam-Score: -3.71
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EF38A206BB
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; MISSING_XM_UA(0.00)[];
 DKIM_TRACE(0.00)[suse.cz:+]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] doc: Add section for C API documentation
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

Hi Andrea, Cyril,

> Hi!

> On 4/17/24 11:19, Petr Vorel wrote:
> > Hi,

> > > Hi!
> > > > +The C API documentation is written using
> > > Maybe to be a bit more clear:
> > > "The C API documentation is generated from headers using" ?
> > +1

> > with that change:
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> > If you both agree, I'll merge it with this change.

> Sure.

Good, merged with this change (and Cyril's RBT).

> Acked-by: Andrea Cervesato <andrea.cervesato@suse.com>

FYI not added this, as you are the patch author (there is your SOB).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
