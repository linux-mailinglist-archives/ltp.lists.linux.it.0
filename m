Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BEB93401D
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2024 18:03:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1328B3D1ADE
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2024 18:03:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB8803D0CFB
 for <ltp@lists.linux.it>; Wed, 17 Jul 2024 18:03:14 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3F2C8600551
 for <ltp@lists.linux.it>; Wed, 17 Jul 2024 18:03:13 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 300BA1FB81;
 Wed, 17 Jul 2024 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1721232193;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YWeIfZmdKfpJlE+OP2/Cdw9Vob5hIiwBzSeYNiY16Kk=;
 b=QVXb2thu9C9hInNx5v+A+axtwD2Q/vSwWNXNXtpzbmb2Zr9XOpIIwb0f8n7f6vzCw/lTyw
 y6RLPZIsPC5PtIEPezfkhFG+HDnvE43oJrxq3rP2EeZ2wZyi3BdfV8w5aX8RuotQjDd1kd
 E4wdPR83wTkBY86RP/8BCmZwNpR9Q0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1721232193;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YWeIfZmdKfpJlE+OP2/Cdw9Vob5hIiwBzSeYNiY16Kk=;
 b=0V3/4+lMd4q8z3BNQQ/5E6NB9C1TXjaIle8iX73C0j+YvQz3gumqkuAHdFWUROahX6FTlP
 VxXxnUlV0QLwCxAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1721232192;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YWeIfZmdKfpJlE+OP2/Cdw9Vob5hIiwBzSeYNiY16Kk=;
 b=aQmLkbeBWSPVIb63YfxkhR2XEyASdwH5hPHqfg4/Zi4Cqe47VLOd/6eRMMco1mcdTIFjxe
 yQU0MQxEKdt89P1gMRfFRFO+oIMY9DeebB9BYTYfKRuQ7ZA9F8ySaGUx30Nu7lej7NLjTW
 kG2OwHUwFh7e2te9w7+BDbv5LyXkZ1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1721232192;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YWeIfZmdKfpJlE+OP2/Cdw9Vob5hIiwBzSeYNiY16Kk=;
 b=myKpeTRQoca3Od8Ro7Mq0IzLgDBkyYa7KmHrK4slHQckTfkZ/lcoscFyebUD496nOaYGGq
 pKrtt6rHbz29y8Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F302B1368F;
 Wed, 17 Jul 2024 16:03:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Yc68OT/rl2aAJQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 17 Jul 2024 16:03:11 +0000
Date: Wed, 17 Jul 2024 18:03:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20240717160310.GA579001@pevik>
References: <20240711104400.63355-1-pvorel@suse.cz>
 <20240711104400.63355-2-pvorel@suse.cz> <ZpfaqobEpwqoDDE9@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZpfaqobEpwqoDDE9@rei>
X-Spam-Score: -3.50
X-Spamd-Result: default: False [-3.50 / 50.00]; REPLY(-4.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.995]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_FIVE(0.00)[6]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,imap1.dmz-prg2.suse.org:helo]; 
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC PATCH 2/2] sched_football: Rewrite into new API
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
Cc: John Stultz <jstultz@google.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > -/* Here's the position of the ball */
> > -static int the_ball;
> > -
> > +static int ball;

> Honestly the only thing that I do not like about this is that you
> dropped the the_ from the ball, because *the* ball is *the* thing that
> we observe for the whole time.

OK, I put 'the_ball' back.

> Otherwise I do not think that the test library can interfere with the
> test in any way so we can go ahead and push this.

Thanks! I also add TODO to makefile for proper integration, removed unneeded
includes (mostly included by tst_test.h or unused) and merged!

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
