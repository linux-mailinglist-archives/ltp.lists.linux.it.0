Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 484BE1D2BF6
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 11:58:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFBC63C250C
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 11:58:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6920B3C1414
 for <ltp@lists.linux.it>; Thu, 14 May 2020 11:58:02 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C54D01A011C6
 for <ltp@lists.linux.it>; Thu, 14 May 2020 11:58:01 +0200 (CEST)
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MXHBo-1jauON0K90-00Ym3I for <ltp@lists.linux.it>; Thu, 14 May 2020
 11:58:01 +0200
Received: by mail-qk1-f178.google.com with SMTP id i14so2335880qka.10
 for <ltp@lists.linux.it>; Thu, 14 May 2020 02:58:00 -0700 (PDT)
X-Gm-Message-State: AOAM532xSwpuiSQA0xhsKta6c83UcDozP4PVrXHqGmgwrwZLhCYKVicW
 tU/0AJ73mmccxgpYgqC0sft8JkmD21vnZ/tq6aE=
X-Google-Smtp-Source: ABdhPJy2B+Ji0XFiwYilPywqLVMutsSvxywCUB5/F4+GalsIt2+rSMGw8QUMixBt/FpSdAbrGZOd5qryioRwOOpF6sY=
X-Received: by 2002:a37:434b:: with SMTP id q72mr4156555qka.352.1589450279885; 
 Thu, 14 May 2020 02:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <addb718d24b6a32853bfc9fc6f47833b253fc719.1589434662.git.viresh.kumar@linaro.org>
 <20200514094421.GA18592@yuki.lan>
In-Reply-To: <20200514094421.GA18592@yuki.lan>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 May 2020 11:57:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Fd=aRkn1A6iELbU77UxQDASPVAAaLHZasPtLCJm2HBg@mail.gmail.com>
Message-ID: <CAK8P3a0Fd=aRkn1A6iELbU77UxQDASPVAAaLHZasPtLCJm2HBg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Provags-ID: V03:K1:zQY6Xmgxe8BJ1GWxktM0aXpHJ5NBoL0+eJKArrXK4Y7DZIakq2T
 ZTtsa4MEGrMIqF9PamW++eLWQ0lhZFaJbGEdFw3IXet5WntuBy7O+/AVL63UMWGQZ9AuvAS
 POVYpGwgxVYZSz9IdIHAso7H5oqpjvnDshL9NdMP5RT8mccqt3ar+CoNQ/CcxQ6ScaoNP4b
 ya+76jxZ9BFgmSV2w3WKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m0K1Zv0lWbQ=:Bu+N/aED2fFT260lbEjB+g
 0g6iqFgKPKgejjmoVHSKhL5Xqy3kMlOA3XzY3i91MA8FaZ06VXEuRo15fJUv8P7qQysoqmh7D
 knxFu30MfjVaLHud93FYrPVeAjikKjp99Jdl+4cdn3L1Grv+Mo447yVwHYeSBy1aUeSEIpd6U
 kXvWmQGzFutZscQK2CiXkpAl315ef2QrEoopF0kDL3+XC6J8MUPHzOk+JMi5Wuu67JlWLELuz
 Hv4HJGIANBAPWb1jcEManPZLq5mvdzbGbktH0UMCScZkUYgvdGJSBsqAE0O9iEQqVUdHCbX4y
 AxqZ8AgidTSOHxSgJ4QOyuhKoObyLR+FNYIllf/RRxFQaHWbqarimqdfqteHUxaqDmEWfoofd
 Xwg3rSpxT2NAlgzG9p5dLJjEvWYc0kGntbx0GqpebtNqX0ygHzJUOxd6mPfSrdR4HWBdTSdfy
 2EYVHV2W7evYIV23hIomZLUKtQdn9/1DaqkXtwENl9/h3htUmjGv+U5HCkafhdYX47jr0Ti3T
 TBd7FFajkj+as/OFn6X4Nx36naAwkFu9MCJWCx2wDDjnDOOTfR/hPWOZP/aICD/kCffALVPM8
 QDiZ+45ir/CNPYmnD8BCOzhDb90kx6K9CN41R4N9QH//hm1QBJHEhqtnr6SP/Uium4M7bTz2d
 wnegLUzotUp5nf99aCRk8ca1jw3rKYOsdZR0Kf7QYwK9InbZHsjTei70y0USUzEvsFAMW7JRd
 A6dmMy5oyRxFFe6zG3bRy5eP8NxU4oTQ6VuSaso0UpxCcgPnAG9Q9v0gdX2hcTYqK7AlaZRAB
 HhpV0DrLxbJcCfQ51c4hiOXoS6dPp0MH0nK9ACt4XpdtlyCFQs=
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls: Fix issues around calling syscalls
 with old timespec
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, May 14, 2020 at 11:43 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> > +
> > +struct __kernel_old_timex {
> > +     unsigned int modes;     /* mode selector */
> > +     __kernel_long_t offset; /* time offset (usec) */
> > +     __kernel_long_t freq;   /* frequency offset (scaled ppm) */
> > +     __kernel_long_t maxerror;/* maximum error (usec) */
> > +     __kernel_long_t esterror;/* estimated error (usec) */
> > +     int status;             /* clock command/status */
> > +     __kernel_long_t constant;/* pll time constant */
> > +     __kernel_long_t precision;/* clock precision (usec) (read only) */
> > +     __kernel_long_t tolerance;/* clock frequency tolerance (ppm)
> > +                                * (read only)
> > +                                */
> > +     struct timeval time;    /* (read only, except for ADJ_SETOFFSET) */
>
> This is still libc struct timeval, should be this the
> __kernel_old_timeval instead?

Yes, it should. The above is a copy of 'struct timex' from linux/timex.h,
which is in a strange state because there is some existing user space code
that relies on the layout to be whatever gets passed into the libc adjtimex()
function.

We should probably do the same thing in the kernel headers and
rename timex to __kernel_old_timex, using __kernel_old_timeval,
and force all application code that mixes it with the libc interfaces
to change as well.

       Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
