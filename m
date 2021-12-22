Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0549547D62C
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 18:59:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 351DF3C9267
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 18:59:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A3A4D3C091D
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 18:59:02 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D20066000F7
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 18:59:01 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9B3ACB81DA8;
 Wed, 22 Dec 2021 17:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5E9C36AE8;
 Wed, 22 Dec 2021 17:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640195939;
 bh=YzsGIhsCjKlo+Dr17RpxbVSdBhRvXkVe0NTxUujkss4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rh14M3s5UinP19Tdq4TYIbylkdD3uwHSssNJMhXpgx9SKXi2wvS0p+dEa1NYQFmC8
 BOZ6/t3iEwQMtZjqTQx7D0IJtRw5M7hZ2dtIc6QBgPObhJNsna9EjWFp5OeGMYh5+A
 xjjg5y+UnEdQcEd+Kaeht4iZA6QgFCw6MCO8K/p/d7UUAH1lINAUWS0bwhyTzp1gIK
 rVUVx18OGKrNBO8j8fczQMShwA1g81l0FxT4CDxQeqh9B8QsiohH/P5gZGm0nyO0JS
 jQC1ySF7aL/tSMfqxvkBTVrGBijk4JLvzVOhrIGylocoUCzOs6OIPouh//34aCCUzj
 qOplanY4zvGuQ==
Date: Wed, 22 Dec 2021 11:58:55 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YcNnXzREFOMn86E1@quark>
References: <20211220212756.13510-1-pvorel@suse.cz> <YcNE2Yt4zLs4ayz7@quark>
 <YcNZ8TDUR8+V+t6g@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcNZ8TDUR8+V+t6g@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

On Wed, Dec 22, 2021 at 06:01:37PM +0100, Petr Vorel wrote:
> Hi Eric,
> 
> > On Mon, Dec 20, 2021 at 10:27:56PM +0100, Petr Vorel wrote:
> > > tst_af_alg.c:84: TBROK: unexpected error binding AF_ALG socket to hash algorithm 'md5': ELIBBAD (80)
> 
> > This seems like a kernel bug; shouldn't the kernel report ENOENT for the
> > algorithms that fips_enabled isn't allowing, just like other algorithms that
> > aren't available?  Have you checked with linux-crypto@vger.kernel.org that the
> > current behavior is actually intentional?
> It reports ELIBBAD. Am I missing something?
> 

It does.  I am asking whether it should.  The purpose of LTP is to find kernel
bugs; perhaps it found a bug here?

- Eric

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
