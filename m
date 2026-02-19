Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Hw4DoTmlmkuqwIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 11:31:32 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C815DCC8
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 11:31:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44E363D0728
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 11:31:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 94A683D0680
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 11:31:27 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EF068600565
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 11:31:26 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1C9DC5BCC2;
 Thu, 19 Feb 2026 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771497086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kFfBfrloghamYef1DhH53R4nVJRR+zwC6wiN9j9tyIM=;
 b=YHm0D1Xxti1MWs9JzL9AqwUjrkNB0SZ5BtUG5rOt2DTpzpYg1+723neWdr3NBpR0UemrpY
 ItiDQ+/+hCroHSDxTOjv0qR5SlCvWwrcFEu4i4G82dWqUNZA0umUTwudyKgDWdUPlwSPg9
 qh010qeIJm7XFctuNo7Wijh1v6q4etY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771497086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kFfBfrloghamYef1DhH53R4nVJRR+zwC6wiN9j9tyIM=;
 b=cEVfaA7ZDN8/pUDE5gQJF6eQ2HUx9IuJ0wY++nDzIfvRYoexxNEC99gRCfGDLHy0RzaRIG
 dwzwWF1jKpBMv9Bw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=YHm0D1Xx;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=cEVfaA7Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771497086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kFfBfrloghamYef1DhH53R4nVJRR+zwC6wiN9j9tyIM=;
 b=YHm0D1Xxti1MWs9JzL9AqwUjrkNB0SZ5BtUG5rOt2DTpzpYg1+723neWdr3NBpR0UemrpY
 ItiDQ+/+hCroHSDxTOjv0qR5SlCvWwrcFEu4i4G82dWqUNZA0umUTwudyKgDWdUPlwSPg9
 qh010qeIJm7XFctuNo7Wijh1v6q4etY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771497086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kFfBfrloghamYef1DhH53R4nVJRR+zwC6wiN9j9tyIM=;
 b=cEVfaA7ZDN8/pUDE5gQJF6eQ2HUx9IuJ0wY++nDzIfvRYoexxNEC99gRCfGDLHy0RzaRIG
 dwzwWF1jKpBMv9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED5E43EA65;
 Thu, 19 Feb 2026 10:31:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id k48WOX3mlmlhcAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 19 Feb 2026 10:31:25 +0000
Date: Thu, 19 Feb 2026 11:31:27 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jinseok Kim <always.starving0@gmail.com>
Message-ID: <aZbmf5tEKC75gH7T@yuki.lan>
References: <20260211171627.11410-1-always.starving0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260211171627.11410-1-always.starving0@gmail.com>
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] open: fix directory verification and misleading
 test description
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	DKIM_TRACE(0.00)[suse.cz:-];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.cz:email,linux.it:url]
X-Rspamd-Queue-Id: C70C815DCC8
X-Rspamd-Action: no action

Hi!
> diff --git a/testcases/kernel/syscalls/open/open01.c b/testcases/kernel/syscalls/open/open01.c
> index baf73ab11..1355592e1 100644
> --- a/testcases/kernel/syscalls/open/open01.c
> +++ b/testcases/kernel/syscalls/open/open01.c
> @@ -37,7 +37,7 @@ static struct tcase {
>  	char *desc;
>  } tcases[] = {
>  	{TEST_FILE, O_RDWR | O_CREAT, 01444, S_ISVTX, "sticky bit"},
> -	{TEST_DIR, O_DIRECTORY, 0, S_IFDIR, "sirectory bit"}
> +	{TEST_DIR, O_DIRECTORY, 0, S_IFDIR, "directory"}
>  };
> 
>  static void verify_open(unsigned int n)
> @@ -53,11 +53,17 @@ static void verify_open(unsigned int n)
>  	fd = TST_RET;
> 
>  	SAFE_FSTAT(fd, &buf);
> -	if (!(buf.st_mode & tc->tst_bit))
> -		tst_res(TFAIL, "%s is cleared unexpectedly", tc->desc);
> -	else
> -		tst_res(TPASS, "%s is set as expected", tc->desc);
> -
> +	if (tc->tst_bit == S_ISVTX) {
> +		if (!(buf.st_mode & S_ISVTX))
> +			tst_res(TFAIL, "%s is cleared unexpectedly", tc->desc);
> +		else
> +			tst_res(TPASS, "%s is set as expected", tc->desc);
> +	} else if (tc->tst_bit == S_IFDIR) {
> +		if (!S_ISDIR(buf.st_mode))
> +			tst_res(TFAIL, "%s is not a directory", tc->desc);
> +		else
> +			tst_res(TPASS, "%s is a directory", tc->desc);
> +	}

Hmm, I guess that the check for S_ISDIR() is technically testing fstat()
since unlike the sticky bit case the directory is created in the test
setup.

I guess the cleaniest solutiont may be to add fstat test that would
check all kinds of modes. Looking at the headers there are at least:

- S_ISDIR
- S_ISCHR
- S_ISBLK
- S_ISREG
- S_ISFIFO
- S_ISLNK

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
