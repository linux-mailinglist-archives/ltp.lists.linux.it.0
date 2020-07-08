Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA6217D1D
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 04:34:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28F533C54D8
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 04:34:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 65CF23C29A4
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 04:34:29 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B2DAD2000DF
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 04:34:28 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id b92so510895pjc.4
 for <ltp@lists.linux.it>; Tue, 07 Jul 2020 19:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NDmAlGRfCyeDyauvd3+tHC/cil7GmO9l4a1GglbjoVc=;
 b=DieDU7tq3uH6YfTFPUER/gCQu3vM+y0UYUyLS4xg+4qKRjdhW9kfGMtQdANS7SffYg
 302c+CIGluNzSHhJaNLCPmL/UcjAzJL7h2DqGeJ/B4MO2jpzSEfILkFDfqSqMAUTlgHo
 FHXiVD8EIDrdOaIWjfU0tVNzNR6lhNoYKS1pPdgI8YxwUcF/cDSq1EWkUT90Ge8iN+uf
 BkvjUsM25IajxWGoql5hUuxytcl2ihqadwYKxGf3aeKAAz+qReIM8YezDTG40JEtjZS5
 nSqrOav3+gdSFaJeZBGjCCmf+cCnOGdK39aLIMGo+uniV4VnOOUMaaRLp7BXVrPz6yJz
 Eb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NDmAlGRfCyeDyauvd3+tHC/cil7GmO9l4a1GglbjoVc=;
 b=ImydbTp1v9EjJTgPgppUVjiWtrqfEFqrk9tB7Ya1k/cEx/PSQaZNpq50k+qiaEaeyT
 eN/cHu+G2ZTy8gEda+WZok1QnWkR9WaxyZtOOuQM7XbIfzd1LVXAw6HZ5iJvZMgGxytL
 8xUKJrfAejPN2ebcMTOVEQ1vlZTa0wKUdURthY/VPX7NNdOHrVU+mgppwjzpIszmMF9d
 H/FfUwjcMf3l+BuUXiA79NCel5vIH93uE5ggPitbtOJOGQN8j9xaOGRjal/UkYIZGrir
 Zu5N1AoMkbR+rvk/vZgVCd5c7q1b5xkUSwPrIGhhkq655yz7NoMBGHh8TvjdyLzqtys+
 yo8g==
X-Gm-Message-State: AOAM532W9beSu0tYvSRO7p4For03vYNgFkHYiWtusBptZVZSK3Nz4UVV
 WmfrexTKlIghD6eg3CA5SQfthg==
X-Google-Smtp-Source: ABdhPJwyIhO4GNnvptYQJkEqDSfmB2Ob0GM3wmsOkDVh+OREWx9LYf2n6h7GzYELCt2hlTY9VwVndQ==
X-Received: by 2002:a17:902:a9c8:: with SMTP id b8mr9451459plr.2.1594175666986; 
 Tue, 07 Jul 2020 19:34:26 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id s187sm23624701pfs.83.2020.07.07.19.34.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Jul 2020 19:34:26 -0700 (PDT)
Date: Wed, 8 Jul 2020 08:04:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200708023423.usul7nc27b6vlkrv@vireshk-i7>
References: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
 <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
 <CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com>
 <20200703125927.GA11556@yuki.lan>
 <CAEemH2cN735haDmyqbNa_LwDgumFqAspYfJaKRpsOg0Rij9tEA@mail.gmail.com>
 <20200707090301.GA3512@yuki.lan>
 <20200707091803.p7ptgfxa5nsleh5b@vireshk-i7>
 <20200707114952.GD3512@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707114952.GD3512@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On 07-07-20, 13:49, Cyril Hrubis wrote:
> Hi!
> > > Huh, how come the syscall is called clock_getres_time64 while the rest
> > > has only 64 appended such as clock_gettime64 and clock_settime64?
> > > 
> > > That's really strange...
> > 
> > That also made me wonder on how should I be naming routines.
> > Apparently they wanted to have "time64" in the name, if the syscall
> > already has "time" in it they just appended 64, else added "_time64".
> 
> If that is the case in upstream we should follow that convence for the
> functions as well...

That's what I tried to do in my patches normally.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
