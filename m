Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5E8AA1DF
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Apr 2024 20:14:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95E993CFC21
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Apr 2024 20:14:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8E23F3CF513
 for <ltp@lists.linux.it>; Thu, 18 Apr 2024 20:14:21 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7D4F560968C
 for <ltp@lists.linux.it>; Thu, 18 Apr 2024 20:14:19 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B8DB5CE23;
 Thu, 18 Apr 2024 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713464059;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATgkyBshT4v8YM/KIsxbyTVII+wNYTrsICqI6SMMHCo=;
 b=M6p19lswFwqt8c6LvarOjBniqCDu/qaaXaWFNCXNkqB6IHqFKbGUb/76WpYew5+VodpcQI
 lO/BoW/WUnbTm41o2kW6A/CEZKTpGIkKKaqQ54r/sFt+ESyc2b/U13bRzojc7q6qCbSQzw
 gltlUlKkf10PRxY9oE9S6yVekVI5qZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713464059;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATgkyBshT4v8YM/KIsxbyTVII+wNYTrsICqI6SMMHCo=;
 b=KLRyMYxY9mVAKz2jbY2a2trueQACJGan/vznNiH6HOOHvwuG3dMU48ClpvYR0kvtVpoicV
 gUCGTyuw/IehkRDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713464059;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATgkyBshT4v8YM/KIsxbyTVII+wNYTrsICqI6SMMHCo=;
 b=M6p19lswFwqt8c6LvarOjBniqCDu/qaaXaWFNCXNkqB6IHqFKbGUb/76WpYew5+VodpcQI
 lO/BoW/WUnbTm41o2kW6A/CEZKTpGIkKKaqQ54r/sFt+ESyc2b/U13bRzojc7q6qCbSQzw
 gltlUlKkf10PRxY9oE9S6yVekVI5qZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713464059;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATgkyBshT4v8YM/KIsxbyTVII+wNYTrsICqI6SMMHCo=;
 b=KLRyMYxY9mVAKz2jbY2a2trueQACJGan/vznNiH6HOOHvwuG3dMU48ClpvYR0kvtVpoicV
 gUCGTyuw/IehkRDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F35513687;
 Thu, 18 Apr 2024 18:14:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id p7ZcBPpiIWYfcAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 18 Apr 2024 18:14:18 +0000
Date: Thu, 18 Apr 2024 20:14:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20240418181411.GC75011@pevik>
References: <20240418141312.99794-1-pvorel@suse.cz>
 <20240418141312.99794-3-pvorel@suse.cz> <ZiE-p4CS1RDUuYGm@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZiE-p4CS1RDUuYGm@yuki>
X-Spam-Score: -7.50
X-Spam-Level: 
X-Spamd-Result: default: False [-7.50 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:replyto];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/3] libswap: Add {SAFE_,
 }MAKE_MINIMAL_SWAPFILE() macros
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
> > Maximum kernel page size is 256KiB (see kernel arch/Kconfig). Therefore
> > this is the minimum blocks allowed to be used to avoid warning on any
> > kernel page size setup:

> >     TWARN: Swapfile size is less than the system page size. Using page size
> >     (65536 bytes) instead of block size (4096 bytes).

> > Therefore define this size and add helper macros.

> I'm again, slightly againts the use of disk block size as a base measure
> of size. In practice the block size will either be 4k or 64k but it's
> quite confusing to justify the need for 256 blocks. With 256 blocks the
> minimal size will be either 1MB or 16MB depending on the actual
> filesystem. So rather than that can we just default to 1MB minimal swap
> file, which makes the test a bit more predictable?

Makes sense, I'll send v2.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
