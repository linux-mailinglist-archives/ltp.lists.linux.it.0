Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB9F477313
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Dec 2021 14:24:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA8E63C8F16
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Dec 2021 14:24:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 606243C2236
 for <ltp@lists.linux.it>; Thu, 16 Dec 2021 14:24:53 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D37A01A0199E
 for <ltp@lists.linux.it>; Thu, 16 Dec 2021 14:24:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F1B7B210E6;
 Thu, 16 Dec 2021 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639661091;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1vLlYzYCVttTn2IUe64m2Z1fBcPxgc5NjUEhdNqn+ho=;
 b=qqq6eko+5lf7u4vdn493KXkF8FdphrMl9MYJrZeq05/3p36reuNGqfVe/dsIpWZoDjycdU
 MejSGGAYWSVyBklJkYp7QfJUTFEST68BTekyGBhltCugtdRCFslWm8ZjQ6gXfhGhjp8MAI
 RMUYgU//fkWn2dipVFjmeBNBqH3Jtw4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639661091;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1vLlYzYCVttTn2IUe64m2Z1fBcPxgc5NjUEhdNqn+ho=;
 b=cSA2g3mROE1lb8uDFsilszXeX4f701G1mgSUsxeQAB6XXEbp3sYeYIGHKXC4SWfbT+rcVV
 yIG4J3h+9KuDI8AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CCC1213E18;
 Thu, 16 Dec 2021 13:24:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xe6IMCM+u2H7bgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 16 Dec 2021 13:24:51 +0000
Date: Thu, 16 Dec 2021 14:24:50 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Ybs+IvVwMdjUtVjZ@pevik>
References: <20211216125456.6760-1-pvorel@suse.cz>
 <Ybs6L1f9qcYMaEfw@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ybs6L1f9qcYMaEfw@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_af_alg: Another fix for disabled weak
 ciphers
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

Hi Cyril,

> Hi!
> > e.g. md5 and sm3 on enabled FIPS (fips=1 on cmdline) on SLES 15-SP4.
> > Similar fix to 4fa302ef9d. It fixes:

> > tst_af_alg.c:84: TBROK: unexpected error binding AF_ALG socket to hash algorithm 'md5': ELIBBAD (80)

> That's strange choice of errno, ELIBBAD usually means corrupted ELF
> file, it looks like this comes from kernel fucntion crypto_alg_lookup()
> if the __crypto_alg_lookup() returns alg structure but the
> CRYPTO_ALG_LARVAL bit is not set. Unfortunatelly I have no idea what
> that really means. Have you confirmed with someone who understands the
> code that these cipers are intentionally disabled and that this errno is
> to be expected? And even if that is so we should skip the test on fips
> mode only...

Yes, is the first time I saw ELIBBAD, thus I'll check with developers.
Showing only on md5 and sm3 was "proof" for me it's correct on correctly
configured system with fips=1, but you're right it's better to double check.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
