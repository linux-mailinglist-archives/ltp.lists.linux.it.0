Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C64E1811DC
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 08:25:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD3E13C5F3A
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 08:25:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0D5C23C5F23
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 08:25:07 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 55F461000B6C
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 08:25:07 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id t3so663552plz.9
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 00:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nxMelj4z0MJQZQqLZeDaYzd/rDUcr4F/kCKeCmNrero=;
 b=TFiTW4yG18UqY5g90GZnOxNLzf+dz6Unbp0l/0J5DpfCFmpITZVBx5CLVSHKaYiiAr
 2cxBV462tv7jqjJrhjv/jktc+tX0oafqQLqUI7RawHAD/kPKYC33aZsqLQHAXhqx5Psn
 qd1kXd6OKpnIYLhvLMIUkuyY/p0d9LLw484s9lBuXYRJNE37cYpG+jtPw8BIifaiYGXH
 pZmacEg/Ei6X0nPTBk9323rr3giK1gOi0CUYeTaDn7cOaszhkh+B/l4wkbwY6nfZLyRW
 q/Q1PZj3Kq+tyJTHYve49TzmHAQyHtWk+uwVLC/afoWUV5QFHpAhf5TDvJxZ3N/DSvAG
 E3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nxMelj4z0MJQZQqLZeDaYzd/rDUcr4F/kCKeCmNrero=;
 b=I54/trsmu+mWoZSZYMTMvHkYsY5O6ZznVTnhdLpM607dIqVH/SAK1eI5z87jWcgPZh
 x2WQPz1UViDuTaFPjY+SQ+Inr5Oqi8gUd25Byl36CFDaWTR5BPjWyCR+PCubIzuAmnKJ
 2BlfjwmDekA0spC/Xk2paoV4wSIyv0mlxXfw9hW25KgZSKcETzp3cKCAQLjyATN7/akk
 W96ZGDKyQiiJnh4+Wgq0/Dl15Su0PWn4SlYFY457efGbGvcyir9TNBt4t1OlmyX63JmM
 6TO47vH3Quog94rwjT6ZM83BpVQMkchmQBY4MN9rdsxsKZitvQwt7S7GKFL6xS+t3eXJ
 /5bg==
X-Gm-Message-State: ANhLgQ3OjmSnFlHQ6PzDL3cH3JYJn4xAh0s9fQtBmKk1QHUeUT0h3NOw
 wjtZCDK+AH79BVImlRqI7y8oHw==
X-Google-Smtp-Source: ADFU+vtD571aMBg3YWKX3GWZFwx6ANHqtq2L4p1pPRycbdLdvKbl4CIeAo3NnCFl5eTgDiX5jZ6dGQ==
X-Received: by 2002:a17:90b:1101:: with SMTP id
 gi1mr1902806pjb.187.1583911505635; 
 Wed, 11 Mar 2020 00:25:05 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id h3sm49942915pfo.102.2020.03.11.00.25.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Mar 2020 00:25:04 -0700 (PDT)
Date: Wed, 11 Mar 2020 12:55:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200311072502.hpj5bycslu6ygk74@vireshk-i7>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <495a95969c63d67868b82d2b15bd663f19780d0e.1582779464.git.viresh.kumar@linaro.org>
 <20200306131046.GC3375@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306131046.GC3375@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 04/10] syscalls/fsopen: New tests
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
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 06-03-20, 14:10, Cyril Hrubis wrote:
> Hi!
> > +	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
> > +			MOVE_MOUNT_F_EMPTY_PATH));
> > +
> > +	SAFE_CLOSE(fsmfd);
> > +
> > +	if (TST_RET == -1) {
> > +		tst_res(TFAIL | TERRNO, "move_mount() failed");
> > +		goto out;
> > +	}
> > +
> > +	if (tst_is_mounted(MNTPOINT))
> > +		tst_res(TPASS, "%s: fsopen() passed", tc->name);
> > +
> > +	SAFE_UMOUNT(MNTPOINT);
> 
> I gues sthat the SAFE_UMOUNT() should be inside of the if here and in
> the rest of the testcases.

Petr had a similar comment earlier and here is my explanation to it.

There should always be a unmount() in response to a successful call to
mount() APIs. What if, because of some other bugs in the kernel or
testsuite, tst_is_mounted() returns 0? We should still do the
unmount() part as the mount() API didn't return an error.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
