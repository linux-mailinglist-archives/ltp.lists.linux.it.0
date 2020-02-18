Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA27162305
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 10:08:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95E0E3C05ED
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 10:08:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 340A73C05ED
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 10:08:26 +0100 (CET)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 61B141401A4C
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 10:08:25 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id y8so7810761pll.13
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 01:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Md0BwpHk5f9oKWJ4y60MtWnuHMi1y9us5Al2BsCrAwU=;
 b=qPPsmsSHqVkKvAp5MugQb8m9YsF1kQeJaZKKKHFXilslRA+/q2GA7NW8nkHzknRXN+
 8AO1GQraMVJ0QMk5GUaWnXgKTBJWH0GzPQCiO4NFhKtIZsvxPBmxoIhulP5FcsnyI/l1
 8zkrWXdjM7t/dy5kI6r5YBrv5r2tetdNeFa9LWbVRMQANqYKN0ikF2KenF05GydfyZg5
 UJW8S6WzkwwtS/djjOiktX7GMdOsWVViFtRcquwOyQwiiKqT5bD/Lzyfd7d7+etE0iN+
 siPk+1m9KvD4FkYps/hmSap9xU8blselEh2mxfDed1m6KQiDY1P+u2c32//tsGkFY5S2
 3hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Md0BwpHk5f9oKWJ4y60MtWnuHMi1y9us5Al2BsCrAwU=;
 b=qs80K8WS5aH01XzjSZ+e3HTMHC2Lv5l1cFVbiWUXsAqH1RDXUOxPc1EKhWy9MYzsnS
 JfczvxJ6Y8TqFfTJVY9/kwkKVf6j+UU2664NaDQVF9YBfmI1FhKqQlGDeZvfvbgrlvCT
 WZdB39ant21p9kTfwqPdD6vKK355dnjmdtwkhRgC62ZgOrqw7h6fKhufM00hAJ+Ot+F2
 scvS3/hE9PUaN50Yq6eLOWXGlMukYfi/Mlb5D2rU7gSBJsZrBJ5+BTYZkKRmbuqM9WVz
 3YOQNamHA33Owxuemx0SkrIyeGC9Lvyi7bf3UYsfYDi4cOjDu9U0PRO+5yJkmxycaREh
 p5sQ==
X-Gm-Message-State: APjAAAXGnKAGRPgqqJy1MilWHidgYtcj1RK4znFOFeKfWhSlhFwWSGnu
 /AymrPSR5pTAiFR992NmpUUd7A==
X-Google-Smtp-Source: APXvYqxY4ZA3J9pPWep7CYaEDtC12dpkLZCo6l12YlZcUCAJ/EKAljZKXljTM32SJYllR4BWUnnp1Q==
X-Received: by 2002:a17:90a:17c5:: with SMTP id
 q63mr1425241pja.138.1582016903800; 
 Tue, 18 Feb 2020 01:08:23 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id 7sm3322218pfc.21.2020.02.18.01.08.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Feb 2020 01:08:23 -0800 (PST)
Date: Tue, 18 Feb 2020 14:38:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200218090821.dekn7cjshdcpo5kg@vireshk-i7>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <e4955c8edfb29c1d0f74a8cd24b1dcc68f3b6814.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2emOw=Abnvk-3EOVFyCoY=c6HtC_1o0gih5n+aL-WfXLw@mail.gmail.com>
 <20200217133638.GB14410@rei>
 <CAEemH2caDii5LcOX7fbOcrJNY9=TL6RfEi6Y0ajybxMKNgw7ag@mail.gmail.com>
 <20200218082506.2hbjglknpqdo3upm@vireshk-i7>
 <CAEemH2du9GQ17PC5uyGHdshErCSjL_qxXuWabRFpORBujQyX-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2du9GQ17PC5uyGHdshErCSjL_qxXuWabRFpORBujQyX-w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

On 18-02-20, 17:02, Li Wang wrote:
> On Tue, Feb 18, 2020 at 4:25 PM Viresh Kumar <viresh.kumar@linaro.org>
> wrote:
> 
> > On 18-02-20, 09:15, Li Wang wrote:
> > > On Mon, Feb 17, 2020 at 9:36 PM Cyril Hrubis <chrubis@suse.cz> wrote:
> > >
> > > > ...
> > > > > > +static struct tst_test test = {
> > > > > > +       .min_kver = "5.2",
> > > > > >
> > > > >
> > > > > I suggest removing .min_kver check in all of the tests to let they
> > can be
> > > > > running on many distributions(which backport the features).
> > > >
> > > > If we do that we have to explicitely check for ENOSYS errno in each
> > > > test, quite possibly with a dummy call to the tested syscall in test
> > > > setup, because once these calls gets libc wrappers we will no longer
> > > > call the tst_syscall() that checks for it.
> > > >
> > >
> > > +1 add dummy call to the tested syscall in the setup.
> > > Agree, thanks for point out this.
> >
> > Not sure if I understood it very clearly and don't want to spam everyone
> > with an
> > incorrect patchset still missing this point and so asking here :)
> >
> > How exactly would the setup() routine look like? Something like this ?
> >
> >         syscall(#NR, ##__VA_ARGS__);
> >
> 
> I suggest to use tst_syscall(...);.
> 
> A dummy call in setup() just helps check the ENOSYS errno, something like:
> 
> $ cat testcases/cve/cve-2016-7117.c |grep setup -A 10
> static void setup(void)
> {
>         ...
>         tst_syscall(__NR_recvmmsg, 0, 0, 0, 0, 0);
> }

Okay, thanks.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
