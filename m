Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 535FD292532
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 12:10:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 104173C31C3
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 12:10:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 7A9ED3C253A
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 12:10:53 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EFE7F2002DF
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 12:10:52 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id r10so969600plx.3
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 03:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pFtc9CnX9fVWbCJAiqq/TPdXBQOm4Vn7ttiSRZ2Mb20=;
 b=oCLuEbINCWvU/1YMPjmIYmxGvhVtsSh/1ariBeNjtz1JOsX4ibKKsLmgLyfA8KLlj0
 iPkKzuutwVrAEuz+P5Sg3QoROzfBddRUSGf1V/zoWBLYifjpUGUxQP/sozxZEy6Cutff
 7kLxR23VeRsCwXhf/1r1a5F61/p5/ZiKAFAc5heWLj5mq5x6r8U+GRWzh5zX/bJIKnGq
 5H0EXvUw+hXnFxJlM0HiZYzJ/Xvn/Ds1xYv5xJf3FsK91g+fuy1tUAwUkdsFHzu5pyY4
 y4LgJF+JY07sGm89NkxTcaEirDot7VEB2KSs3RdsYkCa7YXn8RB0+uPwWuCRl2zf9kQU
 f/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pFtc9CnX9fVWbCJAiqq/TPdXBQOm4Vn7ttiSRZ2Mb20=;
 b=b1tOyxJilWAyWuuDUKnu5Qx4cQTD78O3RuChU9PlLPFHm6lRPusEkg3lQM+CSv7isG
 XkDm2xGYBvn0HLO4bn2q+2Qww2eHfNLR3r0ha+0lZjeGml6T8pDP1NusGOPOiAc9sN1I
 3wv8mpo0jU4palfECeoITxs9oUfF08tc/6OHyGE0UoultKoisdNhyWYR0zkBoyiXgLzw
 v5oe9X1MbZyW6eI0tZiNp5bSKE+osd/fl40BzfueqaOVCuBq3GKGFZ4ZwlbBJhbbGYLV
 XwmnEqWvEVDT/gfeyTM/oQvg06KAR2f8uES16gXFxHdMcS/uAHS1vN4zTmfFgUMSZkSg
 8isQ==
X-Gm-Message-State: AOAM532dJ0g6xqsT/+lxa/iGVjHYUS31gkvep3NMJumAR5RnWCe0uEus
 h2z2uK9zAm/AdqaPeqOegYK0dw==
X-Google-Smtp-Source: ABdhPJyJgVTwwPMSbiXOIotg4XbZDuwRswBTNa2UPTZOEjYVQJlZXzXEwWl/b7GcSipJAd16LZGeyQ==
X-Received: by 2002:a17:902:8347:b029:d5:de7a:db11 with SMTP id
 z7-20020a1709028347b02900d5de7adb11mr6235404pln.2.1603102251318; 
 Mon, 19 Oct 2020 03:10:51 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id n15sm11767403pgt.75.2020.10.19.03.10.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Oct 2020 03:10:50 -0700 (PDT)
Date: Mon, 19 Oct 2020 15:40:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201019101048.knbl2w3q2xev6ywc@vireshk-i7>
References: <6fbfc6919c0000e7a7745afbc3c94baab02603fa.1599558175.git.viresh.kumar@linaro.org>
 <fb31dd18ad396ab602ba8957ee01a666f79ad9bb.1599558175.git.viresh.kumar@linaro.org>
 <20201014121343.GD31816@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014121343.GD31816@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 2/3] syscalls: select: Verify that data is
 available to read
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 14-10-20, 14:13, Cyril Hrubis wrote:
> Hi!
> > select() returns a positive value on success if timeout hasn't happened,
> > else returns 0. Check that and send some data to the write file
> > descriptor for the same.
> > 
> > Acked-by: Li Wang <liwang@redhat.com>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  testcases/kernel/syscalls/select/select01.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/testcases/kernel/syscalls/select/select01.c b/testcases/kernel/syscalls/select/select01.c
> > index 1213aa931251..c6b30aa67dd7 100644
> > --- a/testcases/kernel/syscalls/select/select01.c
> > +++ b/testcases/kernel/syscalls/select/select01.c
> > @@ -25,25 +25,32 @@ static struct select_info {
> >  	int *nfds;
> >  	fd_set *readfds;
> >  	fd_set *writefds;
> > +	int *writefd;
> >  	char *desc;
> >  } tests[] = {
> > -	{&fd_reg, &readfds_reg, NULL, "with regular file"},
> > -	{&fds_pipe[1], &readfds_pipe, &writefds_pipe, "with system pipe"},
> > -	{&fd_npipe, &readfds_npipe, &writefds_npipe, "with named pipe (FIFO)"},
> > +	{&fd_reg, &readfds_reg, NULL, NULL, "with regular file"},
> > +	{&fds_pipe[1], &readfds_pipe, &writefds_pipe, &fds_pipe[1], "with system pipe"},
> > +	{&fd_npipe, &readfds_npipe, &writefds_npipe, &fd_npipe, "with named pipe (FIFO)"},
> >  };
> >  
> >  static void run(unsigned int n)
> >  {
> >  	struct select_info *tc = &tests[n];
> >  	struct timeval timeout;
> > +	char buf;
> >  
> >  	timeout.tv_sec = 0;
> >  	timeout.tv_usec = 100000;
> >  
> > +	if (tc->writefd)
> > +		SAFE_WRITE(0, *tc->writefd, &buf, sizeof(buf));
> 
> I'm not sure why we are writing data here. For both the pipe and fifo
> the select() will return that we can write there, hence the return would
> be non-zero regardless.

Maybe I haven't understood what you meant when you said this earlier:

  And the coverate in these tests is a bit lacking, we do not have a
  single tests that would send a data over a pipe to a fd select is
  watching and check that select was woken up by that. There is no such
  test in the pselect/ directory either.

> Also I would like to be more specific. E.g. expecting specific return
> instead of just non-zero and also making sure the right bits are enabled
> in the fd sets.

Something like this ?

diff --git a/testcases/kernel/syscalls/select/select01.c b/testcases/kernel/syscalls/select/select01.c
index e4b5caecbb10..4b33c0a01380 100644
--- a/testcases/kernel/syscalls/select/select01.c
+++ b/testcases/kernel/syscalls/select/select01.c
@@ -38,12 +38,15 @@ static void run(unsigned int n)
        struct tcases *tc = &tests[n];
        struct timeval timeout;
        char buf;
+       int exp_ret = 1;
 
        timeout.tv_sec = 0;
        timeout.tv_usec = 100000;
 
-       if (tc->writefd)
+       if (tc->writefd) {
                SAFE_WRITE(0, *tc->writefd, &buf, sizeof(buf));
+               exp_ret++;
+       }
 
        TEST(do_select(*tc->nfds + 1, tc->readfds, tc->writefds, 0, &timeout));
 
@@ -51,6 +54,8 @@ static void run(unsigned int n)
                tst_res(TFAIL | TTERRNO, "select() failed %s", tc->desc);
        else if (!TST_RET)
                tst_res(TFAIL, "select() timed out %s", tc->desc);
+       else if (TST_RET != exp_ret)
+               tst_res(TFAIL, "select() returned incorrect value: %s, expected: %d, got: %lu", tc->desc, exp_ret, TST_RET);
        else
                tst_res(TPASS, "select() passed %s", tc->desc);
 }

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
