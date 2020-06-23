Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B55206F99
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 11:03:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8557C3C58F5
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 11:03:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8760D3C00A6
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 19:02:21 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 79F5710004A3
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 19:02:21 +0200 (CEST)
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64B1A206EB;
 Tue, 23 Jun 2020 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592931738;
 bh=lyjF5JCMRLkYfJgb+nOoi8e9pbWAuyRNl9vIReX7pT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wnSPXYVfbyX9CmJZGaMbnvuqnseTjcR/2VLVOrOsSiykjRDpg7yS4p10BPbMNJ5H/
 1vQQyG7aPCqvBU5TCqzOBk+czJvnU83rKvnp9S5VcUSmzMoyGe22Akxn77qHm7Oji0
 nNFApQc1NRvwSoeFRqGXilnnJZ6QHjaOuqN3QhRA=
Date: Tue, 23 Jun 2020 10:02:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Message-ID: <20200623170217.GB150582@gmail.com>
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com>
 <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
 <20200623064056.GA8121@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623064056.GA8121@gondor.apana.org.au>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 24 Jun 2020 11:03:05 +0200
Subject: Re: [LTP] LTP: crypto: af_alg02 regression on linux-next 20200621
 tag
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
Cc: "David S. Miller" <davem@davemloft.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>, lkft-triage@lists.linaro.org,
 open list <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, James Morris <jmorris@namei.org>,
 LTP List <ltp@lists.linux.it>, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Jun 23, 2020 at 04:40:56PM +1000, Herbert Xu wrote:
> On Tue, Jun 23, 2020 at 11:53:43AM +0530, Naresh Kamboju wrote:
> >
> > Thanks for the investigation.
> > After reverting, two test cases got PASS out of four reported failure cases.
> >  ltp-crypto-tests:
> >      * af_alg02 - still failing - Hung and time out
> >      * af_alg05 - still failing - Hung and time out
> >   ltp-syscalls-tests:
> >      * keyctl07 - PASS
> >      * request_key03 - PASS
> > 
> > Please suggest the way to debug / fix the af_alg02 and af_alg05 failures.
> 
> Did you clear the MSG_MORE flag in the final send(2) call before
> you call recv(2)?
> 

The source code for the two failing AF_ALG tests is here:

https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg02.c
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg05.c

They use read() and write(), not send() and recv().

af_alg02 uses read() to read from a "salsa20" request socket without writing
anything to it.  It is expected that this returns 0, i.e. that behaves like
encrypting an empty message.

af_alg05 uses write() to write 15 bytes to a "cbc(aes-generic)" request socket,
then read() to read 15 bytes.  It is expected that this fails with EINVAL, since
the length is not aligned to the AES block size (16 bytes).

- Eric

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
