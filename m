Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC1C1D9348
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:25:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58C163C4E7A
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:25:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 3A57D3C1811
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:25:43 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 55570201023
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:25:43 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id nu7so1068970pjb.0
 for <ltp@lists.linux.it>; Tue, 19 May 2020 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eA0Tvt+UgTjSIHo1sXL8SLwiOiR9/Xw3uCt48PcqBsM=;
 b=ykt6TFeg6+G30Uy/Kp98usWGaI4ZUlEYTyjMK8on3IZ8HZYLeu387bx2wt8TWbA//l
 v7lJ6skz8CVJvQVlR9H+XcX9JiMclhM9L2KItBPd31/7b0PihTC8bY3EgvK4+eHbsSLd
 ZQzyVgzxhv9GRgpi2XxDlZvUujOS6xMySu6v2Fd4bmwcN1RxAAhPf/4IpqjFULfnIJdK
 J1VZGmkExXVnqyDMpC/L/Kuc+CcFandckUO8lOkjhQtIzN+z01bcHRVV+HjNybxudijH
 tUQ//6v+/jsTor+RcZNwL+fnF42CAndPhkVqovN+5dR0kyWqenfxECfjBbnFyqAouVQL
 16Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eA0Tvt+UgTjSIHo1sXL8SLwiOiR9/Xw3uCt48PcqBsM=;
 b=kWKKP+WYBwFzEKgyox2nQXQDZ3mk9yeSlW/JohdI/oxTJzzRmLoB/yjXOtW2F+FznT
 KrCjyvILuBCeG+CzouhHZeTlSnOhj6cxD3RHKQgL7wistcWWbN/9b9shjZKjtUnN5FCc
 Y9PbFOmtD6I+UeYJQvH1xdQ49FJ+K5tXTqjU7bLT2jkTAuDVJhmIYR9DcFYzj6H8A7DL
 ci5t83VFqhvFeURsAcUfhiQ9MQrXczVZ1skFj8+ttdGf/sHFwt/0TYSe+lOWvHf0og+h
 PIoHIvei61hiffyi71rwbx/vsOL8T3CMeBSSVbqlU7MWNbIVO3myg65boEFAXEtthy4P
 6W9g==
X-Gm-Message-State: AOAM532Kymx7PrKPV09Zil0mzT5d8nUxFImQTgQGhCvjonxdJ7tSyQGI
 RAksMVa8D8tUanl6bZggzhPX93GAZpM=
X-Google-Smtp-Source: ABdhPJzNJQUfjEgAvyMYgxJr0boiuZkydmFCvnMFDYle6iKiK9vqXjqB4EPxTvS11lEjK2Db/jXANw==
X-Received: by 2002:a17:90a:c686:: with SMTP id
 n6mr4270869pjt.194.1589880341703; 
 Tue, 19 May 2020 02:25:41 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id w186sm11084834pff.83.2020.05.19.02.25.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 02:25:41 -0700 (PDT)
Date: Tue, 19 May 2020 14:55:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200519092539.klvwkmzduk3zkds3@vireshk-i7>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <931bddab3d92f73f07f32dd7e1770078fdc07e0e.1589877853.git.viresh.kumar@linaro.org>
 <CAK8P3a3LkUoJs-2yj_F8LpgiGQC6auLVSSuB3QCKOr+NwUhnHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3LkUoJs-2yj_F8LpgiGQC6auLVSSuB3QCKOr+NwUhnHQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/5] syscalls: settimeofday: Use gettimeofday()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19-05-20, 11:20, Arnd Bergmann wrote:
> On Tue, May 19, 2020 at 10:51 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Use gettimeofday() instead of calling it with tst_syscall().
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> 
> I think the change makes it work reliably, but it does change what you
> are testing for: instead of testing the low-level system call interface,
> this will now test the libc interface, which is implemented on top
> of the vdso or clock_gettime().

Actually the testcase was for settimeofday() and we were unnecessarily
calling gettimeofday with tst_syscall(). And so the testcase should
remain unaffected that way. Had this been a testcase for
gettimeofday(), I would have agreed with you.

> I think all variants (vdso, syscall(__NR_gettimeofday), libc
> gettimeofday, emulation with clock_gettime syscall/vdso/libc)
> need to be tested. It's possible they all are, but that should
> be clarified in the changelog text.

They aren't tested that way.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
