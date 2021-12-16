Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE004772AD
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Dec 2021 14:06:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F4093C8F36
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Dec 2021 14:06:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 66B883C042E
 for <ltp@lists.linux.it>; Thu, 16 Dec 2021 14:06:34 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C3593100159C
 for <ltp@lists.linux.it>; Thu, 16 Dec 2021 14:06:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 03DF1210E6;
 Thu, 16 Dec 2021 13:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639659993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FCkJy5yXlDEQ5gpZXKAzouRZAX1huo6865/ogEZb2RM=;
 b=tQyRqvsLCqF88Wt6jI71UDo/kb3gBVtCD87fpEOCLEWB5yrjG1PhS7QhRyaVoKVgZ2zswI
 ZxWfGQzvJ0Ps5CDnfUu9YdM5dk6uSMP9EQh/m9OnsWYLaBebw0JQEm5Csip2oKBH5hv1Xz
 jk7MuHj/eM0nHhgj+plgQmGRPQkvL4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639659993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FCkJy5yXlDEQ5gpZXKAzouRZAX1huo6865/ogEZb2RM=;
 b=uoVMJMJgDJv6nSMWVOhCgEmMJV9TroHcEZmylmvK7qjr/7MMEzbGSeNxSipgBAMmXBbdKz
 7FRJuyhP/b3RVvAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2B5913E3B;
 Thu, 16 Dec 2021 13:06:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LcggNtg5u2GbZgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 16 Dec 2021 13:06:32 +0000
Date: Thu, 16 Dec 2021 14:07:59 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Ybs6L1f9qcYMaEfw@yuki>
References: <20211216125456.6760-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216125456.6760-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_af_alg: Another fix for disabled weak
 cyphers
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
> e.g. md5 and sm3 on enabled FIPS (fips=1 on cmdline) on SLES 15-SP4.
> Similar fix to 4fa302ef9d. It fixes:
> 
> tst_af_alg.c:84: TBROK: unexpected error binding AF_ALG socket to hash algorithm 'md5': ELIBBAD (80)

That's strange choice of errno, ELIBBAD usually means corrupted ELF
file, it looks like this comes from kernel fucntion crypto_alg_lookup()
if the __crypto_alg_lookup() returns alg structure but the
CRYPTO_ALG_LARVAL bit is not set. Unfortunatelly I have no idea what
that really means. Have you confirmed with someone who understands the
code that these cipers are intentionally disabled and that this errno is
to be expected? And even if that is so we should skip the test on fips
mode only...

> become
> af_alg01.c:26: TCONF: kernel doesn't have hash algorithm 'md5'
> af_alg01.c:26: TCONF: kernel doesn't have hash algorithm 'md5-generic'
> ...
> af_alg01.c:26: TCONF: kernel doesn't have hash algorithm 'sm3'
> af_alg01.c:26: TCONF: kernel doesn't have hash algorithm 'sm3-generic'
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  lib/tst_af_alg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/tst_af_alg.c b/lib/tst_af_alg.c
> index 05caa63016..e1cb480f77 100644
> --- a/lib/tst_af_alg.c
> +++ b/lib/tst_af_alg.c
> @@ -77,7 +77,7 @@ bool tst_have_alg(const char *algtype, const char *algname)
>  
>  	ret = bind(algfd, (const struct sockaddr *)&addr, sizeof(addr));
>  	if (ret != 0) {
> -		if (errno != ENOENT) {
> +		if (errno != ENOENT && errno != ELIBBAD) {
>  			tst_brk(TBROK | TERRNO,
>  				"unexpected error binding AF_ALG socket to %s algorithm '%s'",
>  				algtype, algname);
> -- 
> 2.34.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
