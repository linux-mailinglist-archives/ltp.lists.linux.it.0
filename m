Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BAD8613AC
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Feb 2024 15:11:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BCAB3CF62B
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Feb 2024 15:11:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 728AD3CB93C
 for <ltp@lists.linux.it>; Fri, 23 Feb 2024 15:11:50 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 80973603479
 for <ltp@lists.linux.it>; Fri, 23 Feb 2024 15:11:49 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E3E521EE0;
 Fri, 23 Feb 2024 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1708697508;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RPFuf1u6Px61XNpLlF91k+4dSZIHGiM+sTA3QHtltAY=;
 b=1R0XSSp8Gd9b8fQZLMhkbyO3LHeB75Fd/qMAOjMmwH4+ro1FNQuGOPsmyJmj/CQrx9KnUa
 d6IN+PRaKW25zGX4xW8szRnew3UG84jhNT9aissxgNfrFXLDLEAzhf9Y3uJFbiUzuwpiTS
 hMDZKHzhmbhQRW9qBV0SsRdX2Nyr2NE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1708697508;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RPFuf1u6Px61XNpLlF91k+4dSZIHGiM+sTA3QHtltAY=;
 b=CuO6glBtNqnoiuuowA1b+6nGPQmMhV+W+wyXG73hfl4si9ZKVU/3qV557CHTJCdZx4cL30
 BCBHliu4fiv/zvCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1708697508;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RPFuf1u6Px61XNpLlF91k+4dSZIHGiM+sTA3QHtltAY=;
 b=1R0XSSp8Gd9b8fQZLMhkbyO3LHeB75Fd/qMAOjMmwH4+ro1FNQuGOPsmyJmj/CQrx9KnUa
 d6IN+PRaKW25zGX4xW8szRnew3UG84jhNT9aissxgNfrFXLDLEAzhf9Y3uJFbiUzuwpiTS
 hMDZKHzhmbhQRW9qBV0SsRdX2Nyr2NE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1708697508;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RPFuf1u6Px61XNpLlF91k+4dSZIHGiM+sTA3QHtltAY=;
 b=CuO6glBtNqnoiuuowA1b+6nGPQmMhV+W+wyXG73hfl4si9ZKVU/3qV557CHTJCdZx4cL30
 BCBHliu4fiv/zvCQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 34AF713419;
 Fri, 23 Feb 2024 14:11:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id RuRyCKSn2GVeAgAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Fri, 23 Feb 2024 14:11:48 +0000
Date: Fri, 23 Feb 2024 15:11:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20240223141146.GC1463543@pevik>
References: <20240104204614.1426027-1-pvorel@suse.cz>
 <20240104204614.1426027-3-pvorel@suse.cz> <ZdiSqReYgNf88ema@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZdiSqReYgNf88ema@yuki>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWO(0.00)[2]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[10.73%]
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/9] metadata: parse.sh: Allow to pass list of
 files
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

HI Cyril,

> Hi!
> > +if [ $# -gt 0 ]; then
> > +	tests=$*
> > +else
> > +	tests=$(find testcases/ -name '*.c' | sort)
> > +fi

> This unfortunately does not work when there are unexpected characters in
> the paths. Which shouldn't happen unless you pass an absoulte path to
> the script which contains for example space.

Ah :(.

> I do not think that we can safely pass a list in a variable without
> breaking it in that case. E.g. it works directly with $* or $@ if it's
> quoted properly as:

> for test in "$@"; do
> 	...

OK, we can either drop it entirely, or use something like this (I'm not happy
about global):

parse()
{
	local test="$1"

	a=$($top_builddir/metadata/metaparse -Iinclude -Itestcases/kernel/syscalls/utils/ "$test")
	if [ -n "$a" ]; then
		if [ -z "$first" ]; then
			echo ','
		fi
		first=
		cat <<EOF
$a
EOF
	fi
}

first=1

if [ $# -gt 0 ]; then
	for test in "$@"; do
		parse "$test"
	done
else
	for test in $(find testcases/ -name '*.c' | sort); do
		parse "$test"
	done
fi

> But as long as you pass $@ indirectly it breaks on spaces.


> Note that the subshell $() with find has the same problem, but there is
> much less room for breaking something because that is passed relative
> paths inside of LTP.

> And yes I hate argument parsing in shell..

Yeah, we all love shell pitfalls :).

Kind regards,
Petr

> > +for test in $tests; do
> >  	a=$($top_builddir/metadata/metaparse -Iinclude -Itestcases/kernel/syscalls/utils/ "$test")
> >  	if [ -n "$a" ]; then
> >  		if [ -z "$first" ]; then

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
