Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCB9204FA0
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 12:53:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D5CA3C5E20
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 12:53:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 86FED3C0133
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 08:41:30 +0200 (CEST)
Received: from fornost.hmeau.com (unknown [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CA926600F9E
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 08:40:33 +0200 (CEST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1jncc4-0003im-6c; Tue, 23 Jun 2020 16:40:57 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 23 Jun 2020 16:40:56 +1000
Date: Tue, 23 Jun 2020 16:40:56 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200623064056.GA8121@gondor.apana.org.au>
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com>
 <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.3 required=7.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 23 Jun 2020 12:53:45 +0200
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
 Eric Biggers <ebiggers@google.com>, linux-crypto@vger.kernel.org,
 James Morris <jmorris@namei.org>, LTP List <ltp@lists.linux.it>,
 "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Jun 23, 2020 at 11:53:43AM +0530, Naresh Kamboju wrote:
>
> Thanks for the investigation.
> After reverting, two test cases got PASS out of four reported failure cases.
>  ltp-crypto-tests:
>      * af_alg02 - still failing - Hung and time out
>      * af_alg05 - still failing - Hung and time out
>   ltp-syscalls-tests:
>      * keyctl07 - PASS
>      * request_key03 - PASS
> 
> Please suggest the way to debug / fix the af_alg02 and af_alg05 failures.

Did you clear the MSG_MORE flag in the final send(2) call before
you call recv(2)?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
