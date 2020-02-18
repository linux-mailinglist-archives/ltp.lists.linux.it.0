Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CBD16222A
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:25:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E9133C2552
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:25:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F16893C23A5
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:25:11 +0100 (CET)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5A595600D74
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:25:11 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id ay11so7800024plb.0
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 00:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/KjA92UBU/xWwWPFYW14SBJUOURX0YcJzWs/vEvxxRE=;
 b=zvk3J7ieUC7QA2wquEqnmg5OsKYrPNCw4Q0eTeGQYEeMQmRqtAfLso5pG8dZyeh0P6
 6JRGqMbXJ2ZWDVgnu/KafCEPWV95F9/GX9n11fbcfEKwoFGdhh0mswf8FOeHez0y0UyV
 /hCeR//Uppq+nux8TYduD7IrfW+KBfe8aqOfAVBLa89b1MxT78mY+7/xrxb7++lVFve6
 YLHe9Wel7D9+HCxMX0evS6rMcJQD4aIElxGGIN60io68O8ZeeBvCgJjeIECFZNrdfrkt
 iyfb3e57O7Etbm5AfqXVpT3G2Pps9fwxAGz06RVYj/gmDyh+950sHdT+nfteWhMsf2aq
 M1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/KjA92UBU/xWwWPFYW14SBJUOURX0YcJzWs/vEvxxRE=;
 b=iKUZGFeE/Ad+azja2u0/E41y9G8RXfdvd1SuylVuEvYIiT6SYDPtLGWhkfbAKNpNrG
 dPm/ujwP7fW/8xPnkb2auDKt05QWHcx9aYhqW1xA1YoaZolcLRrnFEVfsmlnvoXwWss8
 +tyb3LCQkHfrwczPf+f7LKDpENEV2TrZkj9bLGZ1YQYrwaZj0kFl0JvBC1dxHpUKDgXn
 PsH0QiAAh6+GV2v+z1VkY2wcIOvCdf21TDS+kZJse3iD9wUvB5AEZBusvvDIS7/wXQyM
 ew2jPvs8J0l/UNe6RADoJHQamQYNY7PTbrzqJA6Y4d3yLm4OIQKHxfOINtSrJNq93vPw
 iw3Q==
X-Gm-Message-State: APjAAAW3TnbuXpaPOt1jJ7U+9eK3KFQTsQLtAXEJwk74Esj774oU39FQ
 fBcvxxizBG+qjw8x9Y9ImkU0nA==
X-Google-Smtp-Source: APXvYqz+7ga7eftim3VVK8oHUyW/kCOoJzJlAbmDIk773kD9t9DtmCqS4QhwK4lnNZDXC3NcIhz/Dw==
X-Received: by 2002:a17:902:654d:: with SMTP id
 d13mr18931698pln.187.1582014309488; 
 Tue, 18 Feb 2020 00:25:09 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id w18sm3060083pfq.167.2020.02.18.00.25.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Feb 2020 00:25:08 -0800 (PST)
Date: Tue, 18 Feb 2020 13:55:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200218082506.2hbjglknpqdo3upm@vireshk-i7>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <e4955c8edfb29c1d0f74a8cd24b1dcc68f3b6814.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2emOw=Abnvk-3EOVFyCoY=c6HtC_1o0gih5n+aL-WfXLw@mail.gmail.com>
 <20200217133638.GB14410@rei>
 <CAEemH2caDii5LcOX7fbOcrJNY9=TL6RfEi6Y0ajybxMKNgw7ag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2caDii5LcOX7fbOcrJNY9=TL6RfEi6Y0ajybxMKNgw7ag@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] syscalls/fsopen: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 18-02-20, 09:15, Li Wang wrote:
> On Mon, Feb 17, 2020 at 9:36 PM Cyril Hrubis <chrubis@suse.cz> wrote:
> 
> > ...
> > > > +static struct tst_test test = {
> > > > +       .min_kver = "5.2",
> > > >
> > >
> > > I suggest removing .min_kver check in all of the tests to let they can be
> > > running on many distributions(which backport the features).
> >
> > If we do that we have to explicitely check for ENOSYS errno in each
> > test, quite possibly with a dummy call to the tested syscall in test
> > setup, because once these calls gets libc wrappers we will no longer
> > call the tst_syscall() that checks for it.
> >
> 
> +1 add dummy call to the tested syscall in the setup.
> Agree, thanks for point out this.

Not sure if I understood it very clearly and don't want to spam everyone with an
incorrect patchset still missing this point and so asking here :)

How exactly would the setup() routine look like? Something like this ?

        syscall(#NR, ##__VA_ARGS__);

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
