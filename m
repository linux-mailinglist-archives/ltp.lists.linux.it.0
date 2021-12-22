Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1672547D441
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 16:31:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A220E3C925B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 16:31:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 245A23C2BA4
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 16:31:42 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3AC021A01139
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 16:31:41 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CA2861AFE;
 Wed, 22 Dec 2021 15:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6303BC36AE8;
 Wed, 22 Dec 2021 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640187099;
 bh=fep8Y0HnfxjmZRYvI/1KisSMfojZs+oUH6aL0AZ2w9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B/BM3Dcp4ZGTY+sAzpq5/Thp5iwGm4udEaS+6XQy6ZpRL5fdKePTjNZYjlIGvtdTg
 Ap88AsHlbxpi+YFIVm17JKCKQfzlt+yDpKA3qFnZRof4dUJ6H3y3ry7XtW0tDOPjXB
 3KeWVNnFRYlDQVQnLsSPYZ64kh3zJWa/iCt13ya2b/anHd+YGiXASxJVuX551NGV/U
 AXDJzi0xJqh32JmTbjji2uO1fGXZrYVuFLlRozfxbXmxJP0+BcHzQ6KoZ2taGmYs0I
 YmmpycbGuzVdu4tx/YvGXiRZpj0DqneWDJnxTIQC5V8k95KOtiwk9ISOBLhW/gZa1T
 9yxRiY80wZt7Q==
Date: Wed, 22 Dec 2021 09:31:37 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YcNE2Yt4zLs4ayz7@quark>
References: <20211220212756.13510-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220212756.13510-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Dec 20, 2021 at 10:27:56PM +0100, Petr Vorel wrote:
> tst_af_alg.c:84: TBROK: unexpected error binding AF_ALG socket to hash algorithm 'md5': ELIBBAD (80)

This seems like a kernel bug; shouldn't the kernel report ENOENT for the
algorithms that fips_enabled isn't allowing, just like other algorithms that
aren't available?  Have you checked with linux-crypto@vger.kernel.org that the
current behavior is actually intentional?

> @@ -77,11 +86,16 @@ bool tst_have_alg(const char *algtype, const char *algname)
>  
>  	ret = bind(algfd, (const struct sockaddr *)&addr, sizeof(addr));
>  	if (ret != 0) {
> -		if (errno != ENOENT) {
> +		if (errno == ELIBBAD && tst_fips_enabled()) {
> +			tst_res(TCONF,
> +				"FIPS enabled => %s algorithm '%s' disabled",
> +				algtype, algname);
> +		} else if (errno != ENOENT) {
>  			tst_brk(TBROK | TERRNO,
>  				"unexpected error binding AF_ALG socket to %s algorithm '%s'",
>  				algtype, algname);
>  		}
> +
>  		have_alg = false;
>  	}

This function is supposed to return false if the algorithm isn't available; it
shouldn't be skipping the test.

> @@ -22,8 +23,9 @@ static void test_with_hash_alg(const char *hash_algname)
>  	char key[4096] = { 0 };
>  
>  	if (!tst_have_alg("hash", hash_algname)) {
> -		tst_res(TCONF, "kernel doesn't have hash algorithm '%s'",
> -			hash_algname);
> +		if (errno != ELIBBAD)
> +			tst_res(TCONF, "kernel doesn't have hash algorithm '%s'",
> +				hash_algname);
>  		return;
>  	}
>  	sprintf(hmac_algname, "hmac(%s)", hash_algname);

Why treat this case any differently from any other hash algorithm that isn't
available?

- Eric

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
