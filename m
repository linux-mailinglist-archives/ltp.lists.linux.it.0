Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DFC8304B0
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jan 2024 12:44:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1B553CE301
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jan 2024 12:44:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF9E23C88E1
 for <ltp@lists.linux.it>; Wed, 17 Jan 2024 12:44:14 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5883360091B
 for <ltp@lists.linux.it>; Wed, 17 Jan 2024 12:44:13 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8BB901FC05;
 Wed, 17 Jan 2024 11:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1705491853;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0V5EO6QS4VOCGXCI+CEKZl4DbQcXcxyvV0pF844Z0eE=;
 b=pp8K5sp7aYOVcLpOvcbLj+gK/TTOGxXBhvw2x1rPOfBuM6oOfu0647Z0yd9jpL23P3qE40
 D3nzIgs0sKNoR1VmqIDCG8fz5cyU/QSuGK5GrKZdFyKATJPqhtLbFgJmVchesHqV8loyY3
 NJ8lH5dOOHqIFhxzdfeuxkHm08urNTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1705491853;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0V5EO6QS4VOCGXCI+CEKZl4DbQcXcxyvV0pF844Z0eE=;
 b=Tr1dE5/yqs9HkzPYNzujutjq9QXXt+guzCcsr0KObZGwozJ43QBDTtfnyBtLavvf1lu9wz
 +vmHWXCBe8RXveDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1705491853;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0V5EO6QS4VOCGXCI+CEKZl4DbQcXcxyvV0pF844Z0eE=;
 b=pp8K5sp7aYOVcLpOvcbLj+gK/TTOGxXBhvw2x1rPOfBuM6oOfu0647Z0yd9jpL23P3qE40
 D3nzIgs0sKNoR1VmqIDCG8fz5cyU/QSuGK5GrKZdFyKATJPqhtLbFgJmVchesHqV8loyY3
 NJ8lH5dOOHqIFhxzdfeuxkHm08urNTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1705491853;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0V5EO6QS4VOCGXCI+CEKZl4DbQcXcxyvV0pF844Z0eE=;
 b=Tr1dE5/yqs9HkzPYNzujutjq9QXXt+guzCcsr0KObZGwozJ43QBDTtfnyBtLavvf1lu9wz
 +vmHWXCBe8RXveDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FCA813751;
 Wed, 17 Jan 2024 11:44:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lVzOGY29p2VASgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 17 Jan 2024 11:44:13 +0000
Date: Wed, 17 Jan 2024 12:44:12 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20240117114412.GA2700187@pevik>
References: <20240117101801.12536-1-chrubis@suse.cz>
 <20240117110744.GA2692706@pevik> <Zae88oHNozj41lU9@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zae88oHNozj41lU9@yuki>
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=pp8K5sp7;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="Tr1dE5/y"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.76 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 REPLYTO_EQ_FROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.cz:dkim];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.cz:+]; RCPT_COUNT_TWO(0.00)[2];
 MX_GOOD(-0.01)[]; DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.05)[60.25%]
X-Spam-Score: -0.76
X-Rspamd-Queue-Id: 8BB901FC05
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib: TST_EXP_FAIL: Fix the *_ARR_() macros
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

> Hi!
> > I'm sorry, I haven't noticed the problem. tst_test_macros.h is getting quite
> > complex, maybe we should add some comments into the header.

> Pushed, thanks.

> I guess that ideal fix would be comparing the output from the newlib
> TST_EXP_* tescases with expected output. That would actually catch most
> of the bugs introduced in there.

I've had it on my TODO list, hope to get to it sometimes in February.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
