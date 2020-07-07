Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8312F2168E0
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 11:18:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC2B23C54BE
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 11:18:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 56DF63C29AD
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 11:18:09 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7C03314013AE
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 11:18:08 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id j19so12862866pgm.11
 for <ltp@lists.linux.it>; Tue, 07 Jul 2020 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BSbKbzub+/mZe0CKvuGIZRgfuRX1uD2h180yYIAv94I=;
 b=agMAb15VCmCYVgKmwAiM+cNlgdUa+L1kC+ryA408v3FuvPSZ5CD99HQZtfMBWRu5iK
 h0uUYRuDlo3QPhlU/MaaTg8Ibiu5wduas00x8SA+XzKTHK1UrpRWcPi4KUPUemw2n+z9
 SxHNqftWkOeRe6YyagvsiQjvrGwKJSQPji5xq3sKMNJJn5N4orEC0Ngwh0TmKDgLTgH7
 nzE/aBPsj3/SVWOLoZNYwmuiwaS0X0Aysud0M4O4rZ6F4+GFyJw4o3vTOjX55kZ7IBeX
 Lz/blG8ZqNi4bS88m9w4qm1wGBIpj230us215zpZ1ybozxpFzGT1ovUETdaJS5Vnr4qt
 Im1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BSbKbzub+/mZe0CKvuGIZRgfuRX1uD2h180yYIAv94I=;
 b=Ox14tfSzBdhwpi2bQfdK/YekYRoz7+/Y2Hn8wAPGLDHb+JgnRaEIBhD44lGoE6O7FN
 gDt1IdCRDeoaZyNaWFH16csxaHOCJvUCwa0sDWwCf/Yqk+YLazZG3nMKwAA0HeVLEsSV
 CMeDZYPD6lqMW4kTJc7jFAoXPTRX8FWL9zxdQaBgTzaWIdiw4ZLtxAXEANWNzyjAK0Jc
 1d/PtqL9fOu/q5kwidIl31QHrtFglIhoilVQPckSkiwgC9rFKhoqV7zCEGJ8lr8sD40q
 LR/obUCue43At9cUhdrDNInmMwQKEJeIqng6S+Y2YV46n4fqJDA8/xot9874CZ5XFoQ4
 S4VQ==
X-Gm-Message-State: AOAM532z4+DLBvNKu/WsF3MjIhnPTIkc2KWKBpK/vReLP1F4sI3SIhJo
 joI+UbiszwjirUO0ZoX0FrYVDA==
X-Google-Smtp-Source: ABdhPJzZlAdDn9F35NjQLvMDnMbju9zfNd2l64vA6iM/Q2tFWpCSHBo/Tymgc68BT5+RXJ9jlRv0bg==
X-Received: by 2002:a63:a55e:: with SMTP id r30mr43794895pgu.329.1594113486939; 
 Tue, 07 Jul 2020 02:18:06 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id k23sm253909pgb.92.2020.07.07.02.18.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Jul 2020 02:18:06 -0700 (PDT)
Date: Tue, 7 Jul 2020 14:48:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200707091803.p7ptgfxa5nsleh5b@vireshk-i7>
References: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
 <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
 <CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com>
 <20200703125927.GA11556@yuki.lan>
 <CAEemH2cN735haDmyqbNa_LwDgumFqAspYfJaKRpsOg0Rij9tEA@mail.gmail.com>
 <20200707090301.GA3512@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707090301.GA3512@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 5/6] syscalls: Don't pass struct timespec to
 tst_syscall()
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
Cc: Donghai Qiao <dqiao@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 07-07-20, 11:03, Cyril Hrubis wrote:
> Huh, how come the syscall is called clock_getres_time64 while the rest
> has only 64 appended such as clock_gettime64 and clock_settime64?
> 
> That's really strange...

That also made me wonder on how should I be naming routines.
Apparently they wanted to have "time64" in the name, if the syscall
already has "time" in it they just appended 64, else added "_time64".

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
