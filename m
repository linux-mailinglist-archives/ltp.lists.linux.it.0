Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A57801D7395
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 11:12:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6227B3C4F0B
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 11:12:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4CE823C0331
 for <ltp@lists.linux.it>; Mon, 18 May 2020 11:12:58 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 787CF6018C0
 for <ltp@lists.linux.it>; Mon, 18 May 2020 11:12:57 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id j21so4532501pgb.7
 for <ltp@lists.linux.it>; Mon, 18 May 2020 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sK2/izx9DmPGN9gPA+SM7ytRM2Bdb87MqseWPKOuh4U=;
 b=lccAHJQcXNxs48FuUWQ6J63wcIaXplMJc8w2zCbZIgeUlcPndrbTOwA9H33FfJlVKl
 x/WRD88S7MZwBV9Zv1oM3AQmJD8p/MYY0L6MrKmel6lBRVnw6sDjbi1okjFgr67nZMzh
 X+wxXp9VzpsGtVfSBSEok53j3kVuP6W5VmlTZ1B3Tg8Yj+1tc4VeGQEiUSFALpXH1nYM
 RUCbJJyyofJGt0yoMEEgvn3GBZd4ajicqTjU00tnkgsVTtBWU6R9sNBBqZCIgWOAjRyS
 ZV8sL7yOLP3BHHWAWfrQFWX0GlnHf/NDVJT8BW1YZK+DA6XNgmLG6nXefxd+Qjq8aNHs
 A55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sK2/izx9DmPGN9gPA+SM7ytRM2Bdb87MqseWPKOuh4U=;
 b=SnjkgRfYNyYJbruJm9/9MVi4ZroQniJE6D7NOGHiVLT2yYBCU5laejR9phIl8ccFLm
 0hkA03N/n18vciZehEbSr0U3eSWoz9a8KL0giEfN57hdTbYONmmR1gPNz8fjacEeTL2D
 azZK+65Wj5YkbUxgAZOroStcDriCJ35AgZecBPWjqaQgfwS3QzQXZI4wVrEfMZ9OYLwI
 1tAQqJEbRZ8Ev3IFR1R83d8Bl/jsteEH7jYUFCLPAfSm+Tdl8a0FPfLW34PN6rhmDcE7
 rh+QmuUZjNWk8I94GeU2aMeOhogDp3sp17nUmDekmk63G28JiyJARM53+B82wFhX8zOM
 nB/w==
X-Gm-Message-State: AOAM531RcpLG3YCEl9aNnNN7rncUjCtjCq9a/ntAJVp82rspHYaSRoP2
 9NmahYHeBi6iKCAoGbqxCgoDfmiadVA=
X-Google-Smtp-Source: ABdhPJxbFwxyy5gcJk85CvbvR8w2u6LdqTaAgkZDl5pd9YQgSPbyCXX2t46pWwMacCjIYQY3Cyi4Ew==
X-Received: by 2002:a62:be16:: with SMTP id l22mr16240162pff.40.1589793175944; 
 Mon, 18 May 2020 02:12:55 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id d184sm8066064pfc.130.2020.05.18.02.12.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 02:12:55 -0700 (PDT)
Date: Mon, 18 May 2020 14:42:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200518091253.qmvqo7xub7hpeovm@vireshk-i7>
References: <cover.1589789487.git.viresh.kumar@linaro.org>
 <CAK8P3a3aP5S_w_FFv=UvJRSRTjcoNVy_W6ycm4OTct-7Q_5_xg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3aP5S_w_FFv=UvJRSRTjcoNVy_W6ycm4OTct-7Q_5_xg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 00/17] Syscalls: Add support for time64 variants
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

On 18-05-20, 11:02, Arnd Bergmann wrote:
> These all look good to me.
> 
> I cross-referenced it with my list of syscall changes, and found that this
> set of patches does not contain
> clock_{gettime,settime,adjtime,getres,nanosleep},

These are already already merged.

> waitid, statx and msgctl/semctl/shmctl

Hmm, I didn't see them in the list of time64 calls somehow. Nor is
there a _time64 syscall number available for them. What did I miss ?
Or the original syscalls only support the 64bit timespec and there is
no separate time64 variant ?

> There is also a list of syscalls that may need to get updates to their tests
> because passing a timeval/timespec into them is now broken and they need
> to receive the __kernel_old_* variants:

Ahh, if I understand correct you are only talking about the cases
where the syscall is called directly without the libc wrapper, right ?
We can't use timeval/timespec there anymore.

> time, stime, gettimeofday, settimeofday, adjtimex, nanosleep,
> alarm, select, old_select, io_getevents, utime, utimes, futimesat,
> oldstat/oldlstat/oldfstat, newstat/newlstat/newfstat/newfstatat,
> stat64/lstat64/fstat64/fstatat64, and wait4/waitid/getrusage.

Okay, will have a look at them as well.

Thanks for the information.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
