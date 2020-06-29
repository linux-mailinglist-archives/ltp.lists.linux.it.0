Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CE420CD65
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 10:53:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C7153C575B
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 10:53:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4D6223C2AE2
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 10:53:15 +0200 (CEST)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5E0C0201128
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 10:53:14 +0200 (CEST)
Received: by mail-lj1-x243.google.com with SMTP id s1so17127378ljo.0
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 01:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G4N3NxnIHOlrbNxccCBL6Rnaa4Jaah/lF3KoyD4lJEU=;
 b=Y5a00ORenb6fp3CAxkO2RdJhoSHYbhVhEF70f/Bopch+KginR0LyR2AYL2cW7YtzgE
 4IBv/FjDw/X3ITMn7zE1q91GX2itg9qJ9m1DAIGJ86/5nVIvAESpGJNbQXrsq5JVOY8Q
 E02Bdpx76U4cBBUxa7dA3EhR/bJGYosrKez06N2Q11o/6BTmZ2nXQj9qA1UoQ07YuyQr
 ZMQ9sNVxKVhUWhtR+8oz6o4ZpoXBu+EE8pARkgtqi8O3gLxn7g4K5ldEY4iH6/+z7nqg
 CXwAu2lLH9//ry9zSvJFNwpPG3zUVVSA+8mEmzkmKQxRlv5HRIrcnw1SNTabSrO8WFfd
 aMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G4N3NxnIHOlrbNxccCBL6Rnaa4Jaah/lF3KoyD4lJEU=;
 b=rfLwRMs5Z+g84TJy5XNfoP8N1fGUk+whyNedfU7cC8qJMJVsvUoykhDPsbC3Wnv9Lh
 yjChnwI4nsPt1w78dkDwt/A8YQ6WE3C15PYbEwZHyUc+Uh641J5M3rYS8RuD0IaHfrw/
 lCv4M18EFm0tsKaBhg3DIASEI+xvFgpZr1KufSdx0rLLzWTY/6VyIaBmrIq4E0fbQPLx
 a8iHBHkcKqUIMss+rafXG9pCd5l7kGBWQy1nBA9qF0wScxk/kw+UmyNFOvvkJda7End4
 SMkuqvbTasKeCfVJ2h6jK9haqMCnnDw4udJIMs16t0eAqf992HoPLNrINAprOrHggnk/
 KQpQ==
X-Gm-Message-State: AOAM532/0ZXdVO6UwL85TfYtlI6kwOCJdLj3BAUFpyJdLDqT3Tjeq5kM
 QdVtUHZK1Uyuojwpvz7CgqK0G14AvZFywZF2XFD+cA==
X-Google-Smtp-Source: ABdhPJy1rQQ5J/jylQniMmYImqn4+s/8Ebp+FCxmpDIQBCBP4TtEoH93hKJjC0A/2GKgXMfoOCLC5zfzCmLvoKP0M2c=
X-Received: by 2002:a2e:b054:: with SMTP id d20mr7114033ljl.55.1593420793493; 
 Mon, 29 Jun 2020 01:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com>
 <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
 <20200623064056.GA8121@gondor.apana.org.au>
 <20200623170217.GB150582@gmail.com>
 <20200626062948.GA25285@gondor.apana.org.au>
 <20200627083147.GA9365@gondor.apana.org.au>
In-Reply-To: <20200627083147.GA9365@gondor.apana.org.au>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 29 Jun 2020 14:23:02 +0530
Message-ID: <CA+G9fYszuzVq5P+10OA1biMQHQ-4tTDtqoOBHHdVMQXrwnWFJQ@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [LKP] Re: [PATCH] crypto: af_alg - Fix regression on
 empty requests
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
Cc: lkp@lists.01.org, lkft-triage@lists.linaro.org,
 LKML <linux-kernel@vger.kernel.org>, LTP List <ltp@lists.linux.it>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat, 27 Jun 2020 at 14:02, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Fri, Jun 26, 2020 at 04:29:48PM +1000, Herbert Xu wrote:
> >
> > Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Fixes: f3c802a1f300 ("crypto: algif_aead - Only wake up when...")
> > Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> Reported-by: kernel test robot <rong.a.chen@intel.com>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

I have applied your patch and tested on Linux-next on arm, x86_64 and i386.
All LTP crypto tests got passed.

---
patch -p1 <  crypto-af_alg---Fix-regression-on-empty-requests.diff
patching file crypto/af_alg.c
patching file crypto/algif_aead.c
patching file crypto/algif_skcipher.c
patching file include/crypto/if_alg.h

Test output:
af_alg02.c:33: PASS: Successfully \"encrypted\" an empty message
af_alg05.c:40: PASS: read() expectedly failed with EINVAL

Test results summary:
af_alg01: pass
af_alg02: pass
af_alg03: pass
af_alg04: pass
af_alg05: pass
af_alg06: pass

ref:
https://lkft.validation.linaro.org/scheduler/job/1532020#L1413
https://lkft.validation.linaro.org/scheduler/job/1532019#L1516
https://lkft.validation.linaro.org/scheduler/job/1532026#L935

-- 
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
