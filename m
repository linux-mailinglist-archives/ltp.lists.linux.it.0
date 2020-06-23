Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AA52049D7
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 08:24:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 798333C5DE3
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 08:24:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 390603C2209
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 08:23:56 +0200 (CEST)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A7DEA1000B3F
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 08:23:55 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id i3so22077479ljg.3
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 23:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dPmL4ji10DM23gXnHiUP2NWgp6rzRT93lGyytV/WtJM=;
 b=BIdVinktvLNiMk2nDRyH/DIePkv0Y76ENlOPbiD73uhrPmAMWpcQr0GXrq31J7UWKy
 nx8cSiBDNUNtKhgqbuWTj5/yrtE899FP1q+Kbv9b1V1z5MhHcAfoTPmKUBPRNv4O93xb
 8ErCN2zCByMbG4NDklpkORi7nxFQvRFTmI7j6WCrrT6j3vugRvMD4MvqbAJez/VIbSj4
 F0L1wnWSrbrCCkBdJrgEi6penn3FCPOtrKz5WHjQOZua3SlwQcChthsVjDiMoQ/6X8iE
 H9FMLmhcj3Z+bPDhmvjDT6yMPl5j3w0NhSrNdNuLf8wDntXMPLPLJ4sFqphnVX3TlWyV
 A/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dPmL4ji10DM23gXnHiUP2NWgp6rzRT93lGyytV/WtJM=;
 b=F8+BZXwqxjsL5SrzdHf23buP5rHy3nV2TNC5xCO0jdd3CzXxmUbc3tv6oLlfLnsvbq
 C5VMoDOm9O07hjst6UrOGoXMuixgEK+/L2coq0pLIIt9h7vuLFWO0tsokp+5ueUhAZc9
 UkNUhKNh6j4GttbLObir7RdnPb6Rtn4SRJf0rhNLkoCslAQmNSIH9aEydh1fnO2ZXhqg
 ySqilBs1ThF8U3vyLtdwoob+BaIYL+VMptFttVj6zfZgBSsLcP3T+XAuevz0wfNW6Ngq
 VNu276HLUe4wxv/YU3iVJ0bKEdedOKjx4lkZaoC1Slaj1nYv1LMjGBpOa8bBLnqihk5R
 RYDw==
X-Gm-Message-State: AOAM531nYmNM1lrGvSWAoBqaJF2MKKhD/yahlC7fhdUFme3xTP+jhVo4
 eIoIVFu5871jlmQ7PznXOST8LMm+oubCtVxpa+6v/A==
X-Google-Smtp-Source: ABdhPJwyfBDDErbrS4GjTK/D+t1eKZ96j9X/dUhypMGUwehTdQFYmoz856g75PfnLqD8QeqGESPEHLqWG864TNrkBCI=
X-Received: by 2002:a2e:b88c:: with SMTP id r12mr10241919ljp.266.1592893434808; 
 Mon, 22 Jun 2020 23:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com>
In-Reply-To: <20200622224920.GA4332@42.do-not-panic.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 Jun 2020 11:53:43 +0530
Message-ID: <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>, linux-crypto@vger.kernel.org,
 LTP List <ltp@lists.linux.it>, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 23 Jun 2020 at 04:19, Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Tue, Jun 23, 2020 at 12:04:06AM +0530, Naresh Kamboju wrote:
> > LTP crypto regressions noticed on linux next 20200621.
> >
> > The common case for all tests is timeout after 15 minutes which
> > means tests got hung and LTP timers killed those test runs after
> > timeout.
> > The root cause of the failure is under investigation.
> >
> >   ltp-crypto-tests:
> >     * af_alg02 - failed
> >     * af_alg05 - failed
> >   ltp-syscalls-tests:
> >     * keyctl07 - failed
> >     * request_key03 - failed
<trim>
>
> Can you try reverting:
>
> d13ef8e10756873b0a8b7cc8f230a2d1026710ea
>
> The patch is titled "umh: fix processed error when UMH_WAIT_PROC is used"

Thanks for the investigation.
After reverting, two test cases got PASS out of four reported failure cases.
 ltp-crypto-tests:
     * af_alg02 - still failing - Hung and time out
     * af_alg05 - still failing - Hung and time out
  ltp-syscalls-tests:
     * keyctl07 - PASS
     * request_key03 - PASS

Please suggest the way to debug / fix the af_alg02 and af_alg05 failures.

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
