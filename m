Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 343CF95EFBB
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2024 13:30:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFA533D2731
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2024 13:30:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0B05D3D20F7
 for <ltp@lists.linux.it>; Mon, 26 Aug 2024 13:30:00 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 266E31400255
 for <ltp@lists.linux.it>; Mon, 26 Aug 2024 13:29:59 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F22821A7A;
 Mon, 26 Aug 2024 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1724671798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSh3yHytAmrtvOpcsyvGb66t+ywQzlUHxIL8WtNdVLc=;
 b=w1gTwCWgQwZdSm1AnhZnLg2PAkafNjD2Le4F+sJrLdhuvCTH0BZZBqC4QJWR+n6ohLfq0r
 O1n0xigAzgRwuAOQfIzL22z1f23gYhaNyNqP5y1FJiXzkNWegEg1hNdjAUw8MrJhGVO7uD
 DWTOA81Gow8hEF6M0JFtvXc2lR1Jn4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1724671798;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSh3yHytAmrtvOpcsyvGb66t+ywQzlUHxIL8WtNdVLc=;
 b=8cdN0THZp2yJnfDOAA2Bx5AwaYjZA2M47js2fiy4EtGw+0yJTbD63oCILexFNZAVxAJ8rT
 UnEP6pAiQ9TOpfBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1724671798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSh3yHytAmrtvOpcsyvGb66t+ywQzlUHxIL8WtNdVLc=;
 b=w1gTwCWgQwZdSm1AnhZnLg2PAkafNjD2Le4F+sJrLdhuvCTH0BZZBqC4QJWR+n6ohLfq0r
 O1n0xigAzgRwuAOQfIzL22z1f23gYhaNyNqP5y1FJiXzkNWegEg1hNdjAUw8MrJhGVO7uD
 DWTOA81Gow8hEF6M0JFtvXc2lR1Jn4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1724671798;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSh3yHytAmrtvOpcsyvGb66t+ywQzlUHxIL8WtNdVLc=;
 b=8cdN0THZp2yJnfDOAA2Bx5AwaYjZA2M47js2fiy4EtGw+0yJTbD63oCILexFNZAVxAJ8rT
 UnEP6pAiQ9TOpfBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 454F71398D;
 Mon, 26 Aug 2024 11:29:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sVj/DjZnzGYGGAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 26 Aug 2024 11:29:58 +0000
Date: Mon, 26 Aug 2024 13:28:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jingyi Song <jingyisong@hust.edu.cn>
Message-ID: <Zsxm8c-ymd-8iLgP@yuki.lan>
References: <20240823083720.1545566-1-jingyisong@hust.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240823083720.1545566-1-jingyisong@hust.edu.cn>
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] doc: add `--recurse-submodules` when cloning the
 repo
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> User could run syscalls testing suite with
> `./kirk -f ltp -r syscalls`,
> but they may not be aware of the submodule `kirk`.
> So I add the `--recurse-submodules` option.

Sounds good to me, we do have a few sumbodules already and it makes
sense to pull them with the initial clone.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
