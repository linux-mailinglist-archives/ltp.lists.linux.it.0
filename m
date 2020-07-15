Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DA722026B
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 04:36:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 027833C4F81
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 04:36:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 7B6913C236A
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 04:36:48 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7E64C1A00432
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 04:36:47 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id s26so1006738pfm.4
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 19:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fVXODnquzv8XFjZRddBn8MhwvjAAxKCF0ywGGl29s7Q=;
 b=Qg3FCu1p5SH1QhmsIGwBLuXQGjDNBEror3rSZIL3hVjA0ClBfFb1C4XCRc7iZR+kSt
 k8QqEvdxiceE8eJN94KZwb37uvS98XbYOsjq9PxIDEGng8eJ7/Rf0KzeHcwbtbRgWSXq
 uWOltpY44GmuQy64ksXGgtgUa/gqbZsJWvtSHfEgZjNaz1WG/eS5vwdxQdr1mwENOcWE
 7Mr8+43JpSIQE1wUPBwEb3Lnd9qjqOp76bwTtd6D7+a6VUCkPp3yMze/tkwPnWTOQBi6
 5eNLu1TGZm87cK4zdgwvb3DuD/XjxZB5WoFnKYb4y2BMcLyzqncRvDoWvAU+eUue3TIP
 A85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fVXODnquzv8XFjZRddBn8MhwvjAAxKCF0ywGGl29s7Q=;
 b=tSWIThh6Qe5jEeCtR+IlLgyL1se5Io5lYJtmtx1U6/Db2UCXDbCKKpIYISyQGgIjhc
 VyRbl/L54N9dspCa50PggeJGNi8gbLMmYxxf36/+hy5h8yS03sJ36QmvPxQmu0Kgm8Ko
 uie7OYRE3uT58vJIpsxkILl+1ZppZPl+bczY5I6VdYz0rC9vyxjAWJd3/05CcIN2Txlp
 e7yh1KKhmNK3zTXig26wiM1aUnWvZt8UPaf5FBJyhAL/YwQTQlBENa2Ck7oztxGb8/Ka
 0DfCPgpIdY4ky6REygtvMhLWbUS69J5AelmXemqMYqnBuU5i4NPhCkDE4dvbTvM47vnE
 DAUQ==
X-Gm-Message-State: AOAM530eOuk7XkjmSIzxqyQWFJa1KjiXPENYM3x0bLIJ+4fS4Nj3uRqH
 SIM9m1C9icUI2BI6PAWbW4P6tA==
X-Google-Smtp-Source: ABdhPJxyaQXSiRh3gRN+qx/8TSytVHQdLE1I3byQYvM0vcPhjZfLd4j2+5jY099B/kJXz0TKZ+4EuA==
X-Received: by 2002:a63:7d16:: with SMTP id y22mr5671963pgc.136.1594780605750; 
 Tue, 14 Jul 2020 19:36:45 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id b14sm415501pfo.28.2020.07.14.19.36.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jul 2020 19:36:44 -0700 (PDT)
Date: Wed, 15 Jul 2020 08:06:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200715023642.jlldqjr7phru7ojj@vireshk-i7>
References: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
 <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
 <20200714142843.GA14905@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714142843.GA14905@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] syscalls/timer_settime01: Make sure the timer
 fires
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 14-07-20, 16:28, Cyril Hrubis wrote:
> Hi!
> Pushed with minor changes, thanks.
> 
> Among other fixes I've moved the signal check from the signal handler to
> the clear_signal() function, since the tst_res() function is not
> signal-async-safe...

What does that mean ? I remember that I added it there in
clear_signal() first, but then I tried to print the stuff (forcefully)
from sighandler() and it worked without any issues and so I did that.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
