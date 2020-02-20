Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA33165730
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:50:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3692B3C2239
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:50:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 590103C0EAD
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:50:29 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9F08E140175B
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:50:28 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id u12so1339896pgb.10
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 21:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0bkdfK3qoChVDcQJNErJ+PixC+fzAPbjIsrJ6lYuHUI=;
 b=sT1Uk/Oei9SHMe8LJybcphNHFDZW5UIbdFydZ7/Cgh95Z/X/hqKGCJUAvnZwDnzaoK
 6W/9ZRxwgJ/v38efAMrRfMAieFsT7Yfx+sjWIqoazvrDPeJBHpF+GcdffRf18XW7b3LQ
 aTWIx/QU0HDoeLw28PFdsg9iJ6hQuTQZCZdypyiuX6J+cDCt41Ea2SJXhkMFhJkZJXu+
 W6ABnd/qCf4G7vf8J6B4lWPExwNqf4TuKW2joa7DGDQRblfbim5EsOF90CG9qx3QdqUm
 PZKEWG1aQs/7Xr228tTAKVoDGLGZE3BOx9wcwfnTn1InL757WkLZDrkAh/oW3M1LRgH1
 vK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0bkdfK3qoChVDcQJNErJ+PixC+fzAPbjIsrJ6lYuHUI=;
 b=KICQ3ZVWz+ro7g/Ix7jkittIEdvDv8dqK18Dp1b/0Z50M9+5Kw32xeeA0PgPIF9O9I
 jLZSBNL1kMfDJAa1lqZRxTKGShCmpyUFYnhheJ15Bawqr0LwUAdQNKWEHMol7wf7rJEI
 l13oB/iqPkSuOYeWJ7VJIMEb8utgJiYWhSjr8TXCuSO3toYMyx4kvBjZpn3lB7Li1ArM
 OxkmFJjKzyW39zYOHbSTad9Uof/pnoJfDlrUG2Bsts/VADs58ZQwU1cqqmNqsjTuQTS8
 Y+0uFg818ezAWHODkCe1CN8/SH8b9goRLyKw7rzS/FtVuyWooe+tKLuFsdKXUnBExgqp
 JRnw==
X-Gm-Message-State: APjAAAX/KNEMqZrq1kP2RqRmoEkvVbfSnK91f/lUV/nGsIismyUeS5ec
 Tv/ogjicqDDkXLy0xHNueVnEZw==
X-Google-Smtp-Source: APXvYqzt6g7wWXoH0Xb+NFt+0kmGbZ8WnoXX2peo+/IIfNWsvxRyVF/GnmFl7HsdXGz6Yx9H0e9h9A==
X-Received: by 2002:a65:468d:: with SMTP id h13mr4891877pgr.359.1582177827118; 
 Wed, 19 Feb 2020 21:50:27 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id z3sm1582621pfz.155.2020.02.19.21.50.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 21:50:26 -0800 (PST)
Date: Thu, 20 Feb 2020 11:20:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200220055024.fgh2uxje6yanrshh@vireshk-i7>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <6ac7573e8ea5ab6f0ab9256b73802126d72b5156.1582104018.git.viresh.kumar@linaro.org>
 <CAEemH2f6gudJjZ1HAsVFVKkuR3FUyBVHf1JQDHeQMdavQqc+2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f6gudJjZ1HAsVFVKkuR3FUyBVHf1JQDHeQMdavQqc+2A@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 05/10] syscalls/fsconfig: New tests
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

On 20-02-20, 13:41, Li Wang wrote:
> > +       TEST(fsconfig(fd, FSCONFIG_SET_PATH, "foo", tst_device->dev,
> > AT_FDCWD));
> > +       if (TST_RET == -1) {
> > +               if (TST_ERR == EOPNOTSUPP) {
> > +                       tst_res(TINFO, "fsconfig(): FSCONFIG_SET_PATH not
> > supported");

On my ARM setup, I always hit this path for few of the syscalls :(

> > +               } else {
> > +                       tst_res(TFAIL | TERRNO, "fsconfig() failed");
> >
> 
> The test reports an EINVAL error when testing fsconfig() with
> 'FSCONFIG_SET_PATH' on XFS. I'm now trying to look close to this issue.
> 
> kernel: 5.6.0-rc2+ x86_64
> 
> tst_test.c:1278: INFO: Testing on xfs
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
> tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
> fsconfig01.c:46: FAIL: fsconfig() failed: EINVAL (22)

Both "foo" and tst_device->dev may be wrong here unfortunately. Same
for few other commands like: _PATH, _PATH_EMPTY, _FD..

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
