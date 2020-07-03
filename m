Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD122213B71
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 15:59:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75A2E3C2A2B
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 15:59:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7C20B3C0B90
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 15:36:02 +0200 (CEST)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BE5D7600EB7
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 15:36:01 +0200 (CEST)
Received: by mail-pf1-f194.google.com with SMTP id u5so14009030pfn.7
 for <ltp@lists.linux.it>; Fri, 03 Jul 2020 06:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T5rcVRIkgD/btpU3eP+kPgBcl/ql3dV8wsHC9ym85fc=;
 b=g/8dIlHeTmnpaORr/6Dty/0Ac1Cr/FecA+2kT/HGdoHGU2aX8D1epe9i+7AZHDYL0H
 CHlvy9owWUH+l7racUwpdD+SDt++AtL2h1SJRUmNVjvzLYTLggCD+2nrGn8RQKesmBUb
 A+IzguxOtOHErB6L59heu6hGESD5/XAKoLAqatlUsWyelgR5j7bY0Oxzl6/l3tqx8UE0
 zY3rtW834Bq1NlIPaWfISiZOrqROXYI5wkZk+2fw2bWy3zAWtNhtRsJ0gpCGbPgJjcPN
 HBb6rMtnNzGvlMW1FyCCWtkHhtQrnJgbeQt4m8qfv+5TaeIIs40hRfkC1b3JTCwXea8S
 218g==
X-Gm-Message-State: AOAM533IsllvZnLE2bOeqhHBo/h4RI5+U2QKJtL3b5WghCShrHpn2MW4
 62cUZvPbB5TcW+Y0gXJOzpo=
X-Google-Smtp-Source: ABdhPJzpEuquvHuz9dy6BTpylDSjUJQBr0XwgRqlpSIxXVt6avNzJ3DHhTKXkfB0Cil4QhB/QzoeTw==
X-Received: by 2002:a65:640c:: with SMTP id a12mr28887324pgv.88.1593783360171; 
 Fri, 03 Jul 2020 06:36:00 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id m16sm12805082pfd.101.2020.07.03.06.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 06:35:58 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 1885F40945; Fri,  3 Jul 2020 13:35:58 +0000 (UTC)
Date: Fri, 3 Jul 2020 13:35:58 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Message-ID: <20200703133558.GX4332@42.do-not-panic.com>
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com>
 <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
 <20200623064056.GA8121@gondor.apana.org.au>
 <20200623170217.GB150582@gmail.com>
 <20200626062948.GA25285@gondor.apana.org.au>
 <CA+G9fYutuU55iL_6Qrk3oG3iq-37PaxvtA4KnEQHuLH9YpH-QA@mail.gmail.com>
 <20200702033221.GA19367@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702033221.GA19367@gondor.apana.org.au>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 03 Jul 2020 15:59:44 +0200
Subject: Re: [LTP] [v2 PATCH] crypto: af_alg - Fix regression on empty
 requests
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 James Morris <jmorris@namei.org>, Eric Biggers <ebiggers@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, LTP List <ltp@lists.linux.it>,
 "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Jul 02, 2020 at 01:32:21PM +1000, Herbert Xu wrote:
> On Tue, Jun 30, 2020 at 02:18:11PM +0530, Naresh Kamboju wrote:
> > 
> > Since we are on this subject,
> > LTP af_alg02  test case fails on stable 4.9 and stable 4.4
> > This is not a regression because the test case has been failing from
> > the beginning.
> > 
> > Is this test case expected to fail on stable 4.9 and 4.4 ?
> > or any chance to fix this on these older branches ?
> > 
> > Test output:
> > af_alg02.c:52: BROK: Timed out while reading from request socket.
> > 
> > ref:
> > https://qa-reports.linaro.org/lkft/linux-stable-rc-4.9-oe/build/v4.9.228-191-g082e807235d7/testrun/2884917/suite/ltp-crypto-tests/test/af_alg02/history/
> > https://qa-reports.linaro.org/lkft/linux-stable-rc-4.9-oe/build/v4.9.228-191-g082e807235d7/testrun/2884606/suite/ltp-crypto-tests/test/af_alg02/log
> 
> Actually this test really is broken.

FWIW the patch "umh: fix processed error when UMH_WAIT_PROC is used" was
dropped from linux-next for now as it was missing checking for signals.
I'll be open coding iall checks for each UMH_WAIT_PROC callers next. Its
not clear if this was the issue with this test case, but figured I'd let
you know.

  Luis

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
