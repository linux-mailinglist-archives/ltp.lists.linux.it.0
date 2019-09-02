Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8019A4D50
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 04:34:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4407B3C2114
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 04:34:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8BA8A3C20CB
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 04:34:32 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E465E600971
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 04:34:33 +0200 (CEST)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F0A342A09A9
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 02:34:28 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id v17so2433670otq.3
 for <ltp@lists.linux.it>; Sun, 01 Sep 2019 19:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SZy3zzqs0gz2bgluL47mGHgxnSQOcZkMAYVp/ZMucrk=;
 b=AOtGEjE22ORsx3V36nAX709BulgdSSzWWAessAg3NZqeYNBTLhX9NNG3pewH7ZHUNg
 1YtF6GIznePOciERvn/loZNfYbXdIhOOuIVAL8JzOBEGWWBKqG+/Zr6V6vbUvbaCDZY0
 wlL/bFO+hqtEAZfOzgcAc4MAJBEyWbI6g74aYGKOdN/hi3nRB5Kx66NrVRQPs8MJdhtq
 EI+ejpsDVx3An+CbkkUZfyeGShdwIFvpdZHvtCre5TpT46S3uO/pxM/uiiQFL2CNF7Ds
 C/GLopPQktgoTSmwsjaiLfmk8DlI/hd708imERjlH0GU1gpHrYTwf+xHORHnIJarPrz+
 ZWxQ==
X-Gm-Message-State: APjAAAUqdQtHKrpE/zQNsQNaQUrF/gh5ECMRcFduQoL67k875T5Rg91z
 ZKNqSlQ1wqA4pHDEWVg9ySJZyng4yzJcBa0dmqdPoTecq3jkEpaD9TioqY6d9KvOmgs1DUqRxn9
 6MAuZ4KsPx2JOM3gWIQ2KiWQmxI4=
X-Received: by 2002:a05:6830:17d6:: with SMTP id
 p22mr22489726ota.67.1567391668476; 
 Sun, 01 Sep 2019 19:34:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzAICtbBhrBq8De//vXC1IKR+MW7EZAWEztPiDOv2dNUV5T8JYnw6co6QSSF+/mZ6mTQ7K/1WravMrspL7CkGE=
X-Received: by 2002:a05:6830:17d6:: with SMTP id
 p22mr22489711ota.67.1567391668207; 
 Sun, 01 Sep 2019 19:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190829181146.20261-1-pvorel@suse.cz>
 <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
 <20190830085036.GA27453@dell5510>
 <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
 <20190830104609.GA9330@dell5510>
In-Reply-To: <20190830104609.GA9330@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Mon, 2 Sep 2019 10:34:16 +0800
Message-ID: <CAEemH2ch1+asP7OKikqrM4Sea2f2xvVB4JPbUqDkm41cFJ+kdg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_stress_test.sh: Respect LTP_TIMEOUT_MUL set
 by user
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Aug 30, 2019 at 6:46 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Cristian,
>
> > On 30/08/2019 09:50, Petr Vorel wrote:
> > > Hi Li,
>
> > > Good point. Something like this could do it:
> > > -LTP_TIMEOUT_MUL=7
> > > +min_timeout=7
> > > +[ -z "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $min_timeout ] && LTP_TIMEOUT_MUL=$min_timeout
>
> > > Unless we test only integers:
> > > +[ is_int "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $min_timeout ] && LTP_TIMEOUT_MUL=$min_timeout
>
>
> > I would certainly introduce a check on the minimum allowed test-timeout and just stick to integers.
> > (is it really needed to worry for float multipliers ?)

No, I guess the integer division in the shell/C is enough.

> Not sure, but it'd be good to have it same for C and for shell. Otherwise
> working variable for C would fail on shell.
>
> > I also wonder if it is worth somehow put this minimum-enforce mechanism inside the framework itself
> > instead that hardcoding it in this specific test (unless you already mean to do it this way...
> > and I misunderstood)
> Yes, I was thinking about it as well.
> LTP_TIMEOUT_MUL should be reserved for users, tests should use LTP_TIMEOUT_MUL_MIN,
> check for LTP_TIMEOUT_MUL being higher than LTP_TIMEOUT_MUL_MIN would be in
> _tst_setup_timer(). Similar mechanism I introduced in 9d6a960d9 (VIRT_PERF_THRESHOLD_MIN).

+1 agree.

>
> I wonder if it'd be useful to have some functionality in C (ltp_timeout_mul_min
> as a struct tst_test, default 1).

Yes. But seems no need to involve a new field in struct tst_test,
maybe we could complete that in the function tst_set_timeout(int
timeout).

>
> > So that, roughly, in the test
>
> > LTP_TIMEOUT_MUL_MIN=7
> > LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-7}
>
> > and somewhere in framework test initialization you enforce it (maybe with a warning for the user when overriding its setup)
>
> > [ -z "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $LTP_TIMEOUT_MUL_MIN ] && LTP_TIMEOUT_MUL=$LTP_TIMEOUT_MUL_MIN
> +1. Feel free to send a patch.

Agree.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
