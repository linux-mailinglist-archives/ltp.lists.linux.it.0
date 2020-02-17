Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 219F9160C72
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:09:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4AFB3C23CF
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:09:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C78FC3C238C
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:09:53 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6503D200CFF
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:09:52 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id j7so6403026plt.1
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 00:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kWm69+RtNDPzbUhoJGbrRS6EZTl9hbwSY2OL/sJFDBo=;
 b=J2FcOZpv1BD/qzvp613pZcOYHYiqzfFlvhmwXRJI7d1Q+PINr330MO5spzmGqBdL+w
 RPYseB8hrewh4CVtygwIbUPwtu4khZJ0CLko1mBz8S9t7ckL/OUuPfiZncgWEUFg6mnw
 fgR+FRRZY6yOktrSwkM+pkAW4J1GGffNHoJr4YEOTH3zjEhjIJ/xR1458snFOe2n/ZSO
 p42PLoI40fP6zZT3mIgr3Ad++ra/TCzsWZYyrdhcyXWUZ0WP5LV+kikRD708qWiIco27
 lUsScsxVcEvvz8IAwSjWv6oFgC8ckFWTCsoTBCnMtXLbxqpqHHsoyhEsokDq65XICUdR
 +iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kWm69+RtNDPzbUhoJGbrRS6EZTl9hbwSY2OL/sJFDBo=;
 b=Mp17RvsFAYX6IzSJV7SfqE1G9WhidQbEHdm2FPRnW1+3Sa3ty7byMgt1Cympy3QqWz
 NwNGoXLIcOY87KUSf/65795/HpucppFe2HZ0aWsmQpWDKy449lmdrAum5qTt8H61aY1K
 aja/k4vyJ4Dba21C95rEN8H5qBluZucPTTcvL6y2LrjV2nZrwMBf4Lh22zYW8WE9vuqv
 SOiAbEs3QrYsc+QFYMhoRlmmVsK+4GVWd9EHGgv6xuqVCiHgiAYdy1yKJvhcySwrSYop
 ATYilG32A6rE2pXXt9+ONOKpT8MaCuLMv+PNOZZCKJ2VAz4QsOI87fnx3pJSUYPytyGB
 op7g==
X-Gm-Message-State: APjAAAUE7kIG5iFnzQFzYbixESYtp8AyEUBv5Qj4g7d2goHxY+Qq08+B
 PItQhPnP9Y8UWRiJ7//3lQrwxw==
X-Google-Smtp-Source: APXvYqzsqZDLPNY6AeSnaYlala5e/FQ9c57LmU11PWXjZuG89BEYFOBiatdxDh9IuxqKQW4GYdQ/GA==
X-Received: by 2002:a17:902:d702:: with SMTP id
 w2mr14759885ply.243.1581926990048; 
 Mon, 17 Feb 2020 00:09:50 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id 7sm15909657pfc.21.2020.02.17.00.09.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Feb 2020 00:09:49 -0800 (PST)
Date: Mon, 17 Feb 2020 13:39:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200217080947.2x7peip36m3vwfi2@vireshk-i7>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <e4955c8edfb29c1d0f74a8cd24b1dcc68f3b6814.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2emOw=Abnvk-3EOVFyCoY=c6HtC_1o0gih5n+aL-WfXLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2emOw=Abnvk-3EOVFyCoY=c6HtC_1o0gih5n+aL-WfXLw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On 16-02-20, 18:11, Li Wang wrote:
> > +static struct tst_test test = {
> > +       .min_kver = "5.2",
> >
> 
> I suggest removing .min_kver check in all of the tests to let they can be
> running on many distributions(which backport the features).

I never thought about that earlier, good point. All other comments look fine as
well. Thanks.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
