Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DADAAA4DA8
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Apr 2025 15:38:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B65E83CBC90
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Apr 2025 15:38:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A7A293CBC87
 for <ltp@lists.linux.it>; Wed, 30 Apr 2025 15:38:40 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C9F021A00A21
 for <ltp@lists.linux.it>; Wed, 30 Apr 2025 15:38:39 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0098621859;
 Wed, 30 Apr 2025 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1746020318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJgBVD+kxLq1HlTZjNbiU0Z02m2UwNpR5q/xh8cAVA8=;
 b=dDqVWbRJEelkQ2pxFqrfJrcN2WlTSUYlL+N2MPa96Jjwue4aUxRNoJNAr5n3zxRylyBgqz
 234kHzXLnct9jQxGuXpMNzdDeKygr4U7aG9B+5xz6vRF0YgPJaoAbxujk/qF+A57GRGGai
 Fb0xh9Dns1GVnz0rBFmdeFzn3CLf3ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1746020318;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJgBVD+kxLq1HlTZjNbiU0Z02m2UwNpR5q/xh8cAVA8=;
 b=gMxHtgeKEhO0cISRBXir9MSB7sxA9uE5U+AExJUgXwQ139jkxNWu5OLgZu5OpEqXv+pM8s
 NtcE7SZAlGm7dsDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1746020318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJgBVD+kxLq1HlTZjNbiU0Z02m2UwNpR5q/xh8cAVA8=;
 b=dDqVWbRJEelkQ2pxFqrfJrcN2WlTSUYlL+N2MPa96Jjwue4aUxRNoJNAr5n3zxRylyBgqz
 234kHzXLnct9jQxGuXpMNzdDeKygr4U7aG9B+5xz6vRF0YgPJaoAbxujk/qF+A57GRGGai
 Fb0xh9Dns1GVnz0rBFmdeFzn3CLf3ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1746020318;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJgBVD+kxLq1HlTZjNbiU0Z02m2UwNpR5q/xh8cAVA8=;
 b=gMxHtgeKEhO0cISRBXir9MSB7sxA9uE5U+AExJUgXwQ139jkxNWu5OLgZu5OpEqXv+pM8s
 NtcE7SZAlGm7dsDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E15BA13A25;
 Wed, 30 Apr 2025 13:38:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4TprNd0nEmiGdwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 30 Apr 2025 13:38:37 +0000
Date: Wed, 30 Apr 2025 15:39:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <aBIn_7KdymKPYA9m@yuki.lan>
References: <20250228172439.3276777-1-pvorel@suse.cz>
 <20250228172439.3276777-5-pvorel@suse.cz>
 <Z8shfrkfVkwsCOTw@yuki.lan> <20250425183345.GA79209@pevik>
 <aBHkswcLfiC7sXSz@yuki.lan> <aBHl-Rqg1QFe8tjw@yuki.lan>
 <20250430114701.GA16680@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250430114701.GA16680@pevik>
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[yuki.lan:mid, tst_loader.sh:url, tst_env.sh:url,
 imap1.dmz-prg2.suse.org:helo, suse.cz:email]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC PATCH 4/5] shell lib: Add basic support for test
 cleanup
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
> > And one possible solution is to source the environment first and the
> > loader last, on the top of your shell-loader-setup-cleanup.v2 branch:
> 
> > diff --git a/testcases/lib/tests/shell_loader.sh b/testcases/lib/tests/shell_loader.sh
> > index eeed122c1..01acf6d35 100755
> > --- a/testcases/lib/tests/shell_loader.sh
> > +++ b/testcases/lib/tests/shell_loader.sh
> > @@ -14,6 +14,8 @@
> >  # }
> >  # ---
> 
> > +. tst_env.sh
> > +
> 
> OK, that is the missing piece, thank you!
> 
> i.e. sourcing tst_env.sh at the beginning before test function setup and
> tst_loader.sh at the end after test function setup). I thought we would avoid
> sourcing two files in the tests, that's why I haven't tried, but that's a minor
> detail. And it's better solution than having tst_exec.sh, which requires
> tst_run_shell.c modification, just to do the same thing (source tst_env.sh).

Given all the choices I too think that soucing tst_env.sh first to get
all the defitions and tst_loader.sh to start the test is the cleanest
solution.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
