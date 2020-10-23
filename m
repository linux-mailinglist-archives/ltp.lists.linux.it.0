Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D151129761D
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 19:51:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D6513C317C
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 19:51:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E9EC13C23E0
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 19:51:15 +0200 (CEST)
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6A7F81A013C5
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 19:51:15 +0200 (CEST)
Received: by mail-lf1-x142.google.com with SMTP id l2so3118144lfk.0
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjWltIsY/Tc/YTJZanmOnMdRvb0TAEPFdspWZ6zBj4M=;
 b=ThO1o259d6kg56YqDsLmT8MiBOJwLSiD9qKO4kwi21uldYbpY5uyCtH8bMuSvipaQl
 CAjmtz5HofISRTDvt16RteSXYTCR0nmL/dTW8wJ3RA9FrZ/uL5lQDuHg90R5IKGG2JeY
 BhpUEEHod/4CuMNQE9mr91H2mLES9qJx1qZ1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjWltIsY/Tc/YTJZanmOnMdRvb0TAEPFdspWZ6zBj4M=;
 b=I+1ZoJNDO4n4vCGH3O+SBAiPponxFmBUaohrrDlFxRzJ9LFjdKsPlF1o9llO4NfMla
 cQ93so8QnTtZ8A7DsjzM63amwfmj8OkemFHrxMUCX3gJstnq3Rz5J9J0ZH3ejZqOeXVi
 6T0vVzJnxwQbXhzjrLwS2RxFp5sNYkLnZmqsl226JKfQO2U50VqwnQZ9tt1LwxiX3br6
 9gbExL77fDLS2V87A7l4RaxPNt0BkP6uGeM2cez/gVgOk4i5mXO+vrOOTUIW4n2p8J3+
 aVIZuCdCd3KCgKT8JVpzLaIuEf+9TeBpZENdrQz68YVgc9UTNOIpt5LOxrYmJ99WOCSy
 Oe0g==
X-Gm-Message-State: AOAM531oIFo7rVqny0Mq/YeO5XSJ+9ZtfL8YauRH4AtRzHkLevGzhPyi
 BQ2qgr6cVzRGJEoU0zu1RBtUKz7SXzKdSw==
X-Google-Smtp-Source: ABdhPJzAP/BdQvTuF11kMWt4V3Vc9OOfcEZjFB2nIBX809kFuUaTFXAkkIsVp6dPo5M3YyJcf0Flpg==
X-Received: by 2002:a19:7e92:: with SMTP id z140mr1216674lfc.299.1603475474237; 
 Fri, 23 Oct 2020 10:51:14 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id z21sm206119lfb.20.2020.10.23.10.51.12
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 10:51:13 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id a5so2434895ljj.11
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 10:51:12 -0700 (PDT)
X-Received: by 2002:a2e:868b:: with SMTP id l11mr1279720lji.102.1603475472083; 
 Fri, 23 Oct 2020 10:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
 <CA+G9fYu5aGbMHaR1tewV9dPwXrUR5cbGHJC1BT=GSLsYYwN6Nw@mail.gmail.com>
In-Reply-To: <CA+G9fYu5aGbMHaR1tewV9dPwXrUR5cbGHJC1BT=GSLsYYwN6Nw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Oct 2020 10:50:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjyp3Y_vXJwvoieBJpmmTrs46kc4GKbq5x_nvonHvPJBw@mail.gmail.com>
Message-ID: <CAHk-=wjyp3Y_vXJwvoieBJpmmTrs46kc4GKbq5x_nvonHvPJBw@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in
 libc-2.27.so[7f3d77058000+1aa000]
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, X86 ML <x86@kernel.org>,
 LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-mm <linux-mm@kvack.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, lkft-triage@lists.linaro.org,
 Thomas Gleixner <tglx@linutronix.de>, kasan-dev <kasan-dev@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Oct 23, 2020 at 10:00 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> [Old patch from yesterday]
>
> After applying your patch on top on linux next tag 20201015
> there are two observations,
>   1) i386 build failed. please find build error build

Yes, this was expected. That patch explicitly only works on x86-64,
because 32-bit needs the double register handling for 64-bit values
(mainly loff_t).

>   2) x86_64 kasan test PASS and the reported error not found.

Ok, good. That confirms that the problem you reported is indeed the
register allocation.

The patch I sent an hour ago (the one based on Rasmus' one from
yesterday) should fix things too, and - unlike yesterday's - work on
32-bit.

But I'll wait for confirmation (and hopefully a sign-off from Rasmus
so that I can give him authorship) before actually committing it.

              Linus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
