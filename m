Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F4947D4C1
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 16:59:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F32703C925B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 16:59:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8907E3C2BA4
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 16:59:32 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EE7E610011B4
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 16:59:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 121CF21136;
 Wed, 22 Dec 2021 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640188771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5sMkAsfvXn7fyFXnQpDDZ+pO+qjzP+5/xcnaS2vJDJ8=;
 b=k6vpmcvqU7mnAgscZ2/hTQdavQorsXprAR/3xxmeLFHrKYXJgWIxoww15hNNP9z46CsNNU
 4BQxiuGvMPKH/3TncbBH3mbMyXZcRBwpUapcA3K+BcR48wr8BnTh7uvSbbOiEAjH6vu0ui
 LVf/7bMHZh5GWUCqNxXTDA7HxvyVYvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640188771;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5sMkAsfvXn7fyFXnQpDDZ+pO+qjzP+5/xcnaS2vJDJ8=;
 b=JOZBid9Ugi/LiYWD20Dm6fotGO18z9zmPRYZI6Jb39aRltVU6vSDZ+t2O6P552fHzQ9cHn
 HuIcd+jXgEeWS9BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFACF13D2F;
 Wed, 22 Dec 2021 15:59:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1h4MOWJLw2HNEAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 22 Dec 2021 15:59:30 +0000
Date: Wed, 22 Dec 2021 17:01:03 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YcNLv9eu1EwG5wft@yuki>
References: <20211220212756.13510-1-pvorel@suse.cz> <YcG2blRMnG/x6zAU@yuki>
 <YcHChO+A8Cc8ZDqv@pevik> <YcM6CZnV5v/UpvI6@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcM6CZnV5v/UpvI6@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] tst_af_alg: Another fix for disabled weak
 cipher
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
Cc: ltp@lists.linux.it, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> OK, this would not work for af_alg03.c, where false positive TCONF would be
> printed:
> tst_test.c:1426: TINFO: Timeout per run is 0h 05m 00s
> tst_af_alg.c:81: TCONF: kernel doesn't have aead algorithm 'rfc7539(chacha20,sha256)'
> af_alg03.c:24: TPASS: couldn't instantiate rfc7539 template with wrong digest size

Hmm, so af_alg actually passes wrong data to the tst_have_alg() on
purpose.

I guess that if we want to move the TCONF to the library we either have
to add a flag to the function or split it into a two. Not sure which one
is actually better.

Maybe we should split it into two functions, one that wouldn't do
anything but return the errno and one that would switch over that errno
and print messages as well. Something as:


int tst_try_alg(const char *algtype, const char *algname)
{
	...
	int retval = 0;

	if (ret != 0)
		retval = errno;

	close(algfd);
	return retval;
}


bool tst_have_alg(const char *algtype, const char *algname)
{
	ret = tst_try_alg(algtype, algname);

	switch (ret) {
	case 0:
		return true;
	case ENOENT:
		tst_res(TCONF, ...);
		return false;
	case ELIBBAD:
		if (tst_fips_enabled())
			return false;
	/* fallthrough */
	default:
		errno = ret;
		tst_brk(TBROK | TERRNO, ...);
	break;
	}
}


The the af_alg03 can call tst_try_alg() and check if the retval is
ENOENT.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
