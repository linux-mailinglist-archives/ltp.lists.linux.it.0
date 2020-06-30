Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AD720F0D1
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 10:48:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DB383C2AC1
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 10:48:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E4CFE3C26E8
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 10:48:24 +0200 (CEST)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 553D4601937
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 10:48:23 +0200 (CEST)
Received: by mail-lj1-x242.google.com with SMTP id s1so21515510ljo.0
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6fsC+acqOWGmffLGOO9jUUTQnpmWJlfaJA/k6/maTXQ=;
 b=jwhzWOYTDIWkGYCjUjnh/hwQSfIQFakAv6CQUjqEt4lGOfycy+SXqpkauASE8Uv9mR
 HQv/CFC25aFyJGL1zaWOskY9nxqomD8anB5SgT41JK2+NAhLoVv/V7kapQtj1LprizUz
 9NWgdrg5DV/8QYEDqTeEoQBll6ZNiEtOUu9LIYIqDwuaV90Hauso9TljSKrWlRjz1xmS
 5k/P3sBGk/fhl23Y3JhxJup+qF6wPjQBiJmZFPfu+b47V4hlKIbXN9MJiKdk/p4O6ugh
 FfkzZelWVMWID7VeVmDc58BAsTKDDi1fjv0yA5t2BtW/F2wHXOgM/ab7n3m4BpJJL7ol
 t/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6fsC+acqOWGmffLGOO9jUUTQnpmWJlfaJA/k6/maTXQ=;
 b=UcMFgK7CoxYVGxohpKAKNYmby7rX5huhBvwkcGMg5z0cGdxueJWPT7/JORtT8qrB+i
 LjfyXY+V0aqkp2raf6UZifYeltARmFETXABJ2YhWkZQ+30hmSrQ4bLmyuKndW0g2GrPK
 x23sG9tQtWNdCRheXoukRBBp5339EZndmivfobv0/RrKgdqXeT6sml6uVX4d9VjqoWAo
 Bb+um8/lMgOHWk2AckcD4dxSa9p2SHN7GyTgIx8I/O8UdUofW5fK5qL493Pqf94CJgdf
 qI58stQD/TPIuxuCQLNn3euL8K+RNLrMBpMfsvjnhwPDZCsl/T3acowyNI16Xv65dJWg
 YvCA==
X-Gm-Message-State: AOAM532SG1rFSl/vsj8g0ZIONtqfJ0Tu82RvVo8134XOjJJYlsNkca/7
 YQg3gmxIwoFI12ZUcm2E6Hwf/bOcNm3bxKrsVv8ObA==
X-Google-Smtp-Source: ABdhPJwX4BRg7XNjPqa+bGRmf7a5TT5LE3ptad/uzUQ2PEfbNV+nz2O7wy3pdPl3lEJ0PbZmgV66tY8SYz/nHrGnDlw=
X-Received: by 2002:a2e:9ed0:: with SMTP id h16mr10660397ljk.366.1593506903171; 
 Tue, 30 Jun 2020 01:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com>
 <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
 <20200623064056.GA8121@gondor.apana.org.au>
 <20200623170217.GB150582@gmail.com>
 <20200626062948.GA25285@gondor.apana.org.au>
In-Reply-To: <20200626062948.GA25285@gondor.apana.org.au>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 30 Jun 2020 14:18:11 +0530
Message-ID: <CA+G9fYutuU55iL_6Qrk3oG3iq-37PaxvtA4KnEQHuLH9YpH-QA@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Eric Biggers <ebiggers@kernel.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] crypto: af_alg - Fix regression on empty requests
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
 "David S. Miller" <davem@davemloft.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>, lkft-triage@lists.linaro.org,
 open list <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, James Morris <jmorris@namei.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, LTP List <ltp@lists.linux.it>,
 "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 26 Jun 2020 at 12:00, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Tue, Jun 23, 2020 at 10:02:17AM -0700, Eric Biggers wrote:
> >
> > The source code for the two failing AF_ALG tests is here:
> >
> > https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg02.c
> > https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg05.c
> >
> > They use read() and write(), not send() and recv().
> >
> > af_alg02 uses read() to read from a "salsa20" request socket without writing
> > anything to it.  It is expected that this returns 0, i.e. that behaves like
> > encrypting an empty message.

Since we are on this subject,
LTP af_alg02  test case fails on stable 4.9 and stable 4.4
This is not a regression because the test case has been failing from
the beginning.

Is this test case expected to fail on stable 4.9 and 4.4 ?
or any chance to fix this on these older branches ?

Test output:
af_alg02.c:52: BROK: Timed out while reading from request socket.

ref:
https://qa-reports.linaro.org/lkft/linux-stable-rc-4.9-oe/build/v4.9.228-191-g082e807235d7/testrun/2884917/suite/ltp-crypto-tests/test/af_alg02/history/
https://qa-reports.linaro.org/lkft/linux-stable-rc-4.9-oe/build/v4.9.228-191-g082e807235d7/testrun/2884606/suite/ltp-crypto-tests/test/af_alg02/log

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
