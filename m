Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DE91DAC2C
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 09:32:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40A8F3C4E1A
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 09:32:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B8D853C088F
 for <ltp@lists.linux.it>; Wed, 20 May 2020 09:31:56 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A72951401A62
 for <ltp@lists.linux.it>; Wed, 20 May 2020 09:31:55 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id a13so967984pls.8
 for <ltp@lists.linux.it>; Wed, 20 May 2020 00:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/UKOYgIkcAQeXxZukEua9Uexdm6gKGqohCYVVpiZsrU=;
 b=A3FEnFPpB7uTjyPtOF+7NVnS97gzLLzPD9yZs1scZ597iXrqzFOzQoGnIKcwXOuAmy
 bV2Sr+V1DZX/4OQ10t5zz6bylJ5ouw2h0T8amJvOZypU9X2szZmU7pjDyMX3064ukVy0
 w19yPaFIb1yPx0AMcY3IstN0Ev8+mfjBoBOmOT6uh5FoaaSFYElwb8xxQK87KVKAZjdl
 AJhYux9BxKZVXIEy5WsDrPzQg2DzljZx89hFQzYBCWg+G+MIZZs4gMWFNvY2MGI4aBDV
 +2EM8ltE6ipmWYeCLlxK/PfjvukzzzgAsKKN4/fKtH/dpwQt15ndhpTBHwJiz+7v04bU
 r/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/UKOYgIkcAQeXxZukEua9Uexdm6gKGqohCYVVpiZsrU=;
 b=jlzLOssWExHvKcJ0AnQHWFPkkZVbLHtBIVWlcDlGkei3Y4rwo44R+vKet0SXyoF7uy
 pG8o69D1Xd+yElU7CbqNz+J1zp2/bn22JPQfk9nhD4H5H7oNrO6bEwkk3EUOJYeidF4V
 453t82KTWVqgWhdsMh91HTieheITkcGt7wZzZ/zepnbXD/XxSfqa/XTxLtXgGnjW8Dfr
 V7vuvdYCZGWSb75AJgC37zPSVC6gljpkEc7Sc+T4MUdXtYFVU8HLh1xmZ1yf2AjwasYG
 nb2Tjl3xaRIwTY4vpEVbEFcq8CRD4/GjT82PQKhVjSHt+gY2S+0xkraQmRYMVz+YsRlL
 UCxg==
X-Gm-Message-State: AOAM53335RWriiqxCzLqW4382W0OPS5OD076oNuvjKj3RR35D6b7RJj9
 m1pCT/g6yavPhhmKEHdlddqV5g==
X-Google-Smtp-Source: ABdhPJyzy6W5EYErUPWGVNatKftnhWF00f3kzAUyr/3D8+zhIIDEG5iDfOVRSO0M31vSt+e42ye7ig==
X-Received: by 2002:a17:902:d3d4:: with SMTP id
 w20mr3328125plb.3.1589959914084; 
 Wed, 20 May 2020 00:31:54 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id v3sm1337644pja.8.2020.05.20.00.31.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 00:31:53 -0700 (PDT)
Date: Wed, 20 May 2020 13:01:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200520073151.y5xttqnqeqe4jmka@vireshk-i7>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <a6c2c59a9cffb86d751b911384a560803e723623.1589877853.git.viresh.kumar@linaro.org>
 <20200519122155.GB16008@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519122155.GB16008@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] syscalls: Don't pass struct timespec to
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19-05-20, 14:21, Cyril Hrubis wrote:
> So we can as well so that they take the tst_ts structure, then we are
> also free to change the way the timestamp is acquired without the need
> to change all the callers.

I am not sure I understood it all. What do you mean by "also free to change the
way the timestamp is acquired"?

Also, even if these routines take a struct tst_ts, the callers will all need to
have the changes which are currently done, as they can't pass struct timespec
anymore. Over that, few of the callers (cve-2016-7117.c and tst_timer_test.c)
would be required to have more changes as right now they only needed to move
from timespec to __kernel_old_timespec and nothing else.

Another reason why I didn't pass tst_ts to them is because you suggested me
earlier, to not pass that to the tst_syscall() definitions I added earlier for
all the syscalls, where I was doing tst_get_ts() inside the tst_clock_gettime()
calls for example. And you asked me to let the caller do that and pass only the
actual timespec in a void *.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
