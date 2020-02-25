Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873816BF14
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 11:48:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 113663C25E8
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 11:48:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0AD743C12E6
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 11:48:54 +0100 (CET)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1F98F1A014CB
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 11:48:54 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id y1so5331117plp.7
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 02:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0hj6t66OqX7YqNbnbI9t6mqpGXrZKart1sIlKeWSGao=;
 b=HGRqu5z6/Wv7WCJIQqdaj3nZ+FLMwHKj5wdSBKupSv9jgACCIUlT06D6Vo7wjvZOK6
 +hPMmyV6XCoi7na/DunsLhE3I2ycuMZrH5F5QWpJNvmSpkvowuzygpEg3ehRPaZ4PC/X
 i5s3Nr8hjwEn5u8Nf8qUg1NzQ3QUGHrzeOPwvTC4ccqmU4ZRBwVOY2yPH0KUvAq+75Iz
 gTNCtlfuOuuhN5rbdA4H7qD4/tNMzQSD9aTKNRsstEc9rP8yH6aFIMGvFrr6XfNGV6kO
 OJyWt1oQvgnqlifeJEmQnw3cd22PDo7bN+WgrLlrchntVIPeqriJS9OTBnONIbl3rgVE
 eh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0hj6t66OqX7YqNbnbI9t6mqpGXrZKart1sIlKeWSGao=;
 b=mJ8GQryWwLCeNKXlTCsynMCIAltaTD96pDVo6lv1Eg4/yyKkziR+C03JQ4z8Zo8cta
 64pXPWMAS+Gk9ahd95rm/rSjDGW5L7btqyxyrv46rMwdj+06NI1MG9ppcdAq1KsbUyQS
 OaZxgR3yv9353IkAQYeZglCraN12GNoXNHzQ6Es7I85jVeZI01VukF+BzdsuwQrkQOuZ
 MyJ1KyqfenR0UNaPvzx04lm2Kw32N8diet+qg1lLqJDeXShnJz54BRNz1M1V1wDdWPSd
 C9sHmTdssqKO2ojLjj/RaTdDtRWWp46+NY2hPcVjhpIoQC+sGF+d597x4Z2yzWsQOyMs
 m/dQ==
X-Gm-Message-State: APjAAAXuulfaPeGF7OhTMDC1q8auRm5K7ECanyRnhuAzFtQalczzPr4u
 u+q4PhnL12hX1qg8CG8e3e/3fQ==
X-Google-Smtp-Source: APXvYqw8KkCsB1rbOBh/x1lcZSrlM+sCowhF5aHP9YLOamujX1ipyY6FQ1mO1+d98leu41U5o/SZbA==
X-Received: by 2002:a17:90a:c24c:: with SMTP id
 d12mr4518840pjx.113.1582627732450; 
 Tue, 25 Feb 2020 02:48:52 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id s14sm16071012pgv.74.2020.02.25.02.48.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 02:48:51 -0800 (PST)
Date: Tue, 25 Feb 2020 16:18:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200225104849.jqkzsy5kf6a76ypc@vireshk-i7>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <CAEemH2dogCkDHtZzwWCx-ahg-CebGYLNyew6F2AkJVPC_yivBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dogCkDHtZzwWCx-ahg-CebGYLNyew6F2AkJVPC_yivBA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 00/10] Add new LTP tests related to fsmount
 family of syscalls
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

On 25-02-20, 18:00, Li Wang wrote:
> Hi Viresh,
> 
> These new tests look good, only a few comments/questions below:
> 
> Patch 1/10:
> 1. The git summary should be updated too (someone who push patch can help
> do that:).
> 2. Maybe better to replace the TWARN by TINFO? Since tst_is_mounted() as a
> general function to check if mount success, sometimes we just need the
> return status then do next work(I tend to leave the waring or break operate
> to LTP users:).

Done and sent an update as well.

> Patch 5/10, 9/10:
> May I ask why we use "sync" as the key value in fsconfig()? I ask this
> because it can get rid of the errors we found in XFS test before.

I wasn't able to test it earlier during V2 on my ARM platform and so
just added "foo" there.

This time, I tried running it on my x86 machine and so was able to run
xfs tests and so I figured out what needs to be passed by looking out
the Linux source.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/fs_context.c#n41

The first two arrays have the valid options that can be passed.

> Patch 9/10, 10/10:
> I guess that'd be better if we put the 'ismounted = 1' at the behind of
> tst_is_mounted(), do you feel the code sequence looks strange which we set
> 'ismounted' to 1 then do mount checking?

I understand the weirdness you are talking about, but I think the code
does what the right thing to do at this point is.

The question is, what are we supposed to do when move_mount() passes,
but we aren't able to see the mount in /proc/mounts ? I think, we
should call umount() anyway as move_mount() passed. And that's why I
have kept the ismounted = 1, line before the tst_is_mounted() call.

> Ack for the whole patchset v3 (+ follow some modification for above
> comments):
>     Acked-by: Li Wang <liwang@redhat.com>

Thanks for your reviews Li.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
