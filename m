Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F225BF25
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 12:36:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56DDC3C5A5F
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 12:36:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CBAD93C2D16
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 12:36:01 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 54487200744
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 12:36:01 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id mw10so1267688pjb.2
 for <ltp@lists.linux.it>; Thu, 03 Sep 2020 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ybC2dkvh1aDmr37gqolpWOlBr607VzYzmSLYhPLhx5E=;
 b=jXVahQUhewlsZI1JdJPbg1ZEcmYwhGyt2165kvUQmrM73LtOT8y/auWxv35UEClQ1i
 xIvqpe9oSYwtawfmAW5rJz2gknyylPDUkM70JS9w8iIVx2qVEToxjyPPktr9+euCDaaf
 Ar1dLH2vTP7a7gkZmvEy4N/KC4KKqFLFyFuucGOPbG76nrIs14DlcgtZ7dcbfMDrmjhW
 IqggQUpjk0rKA1fY/EYSGmTPA32wfajNbd0R/BNcTldZa3cT6q/bHdcFHMnvS41mQo6F
 yPuphzjc51Iw3ahzyk+HaLSavllTixcNoIg4rX5d8JRMA+nUnPl1bmuJIDSxWJ6Fug53
 VlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ybC2dkvh1aDmr37gqolpWOlBr607VzYzmSLYhPLhx5E=;
 b=fLdjwnCwSGf3Hv+g7rk2HRjjCy2cIfdhJptnTBjA7P1owkuxawjx06e3lhlHC8EaMC
 mH6GwBWcZId4LYmAmWM/VyWj3wH24sek9WMWvw6IOxIsnXx5oUodtPKWC6Md8krrAK2B
 gU0/0pamyhXLJuFYzpAqpR31TElufA4pg7rScWo2l/72PErO789jPtTEsuNMFVQ1t8Le
 hunMOVb/FNgSbxBWhTxnbRQBUJvpfnM+uYoVydqfXZ4oNvIBmXsmaEoHCz3W9RrJmY1h
 2ByNRNAwy0VAtmSZGgjvucxY4P+3sgylSdGn/3aJwyak8+QSu9IrjBuVmhTmsUIi9pyn
 TQKQ==
X-Gm-Message-State: AOAM531kYevvNWXSjfEuwAfVCdJElfMUZ+JOVaNctlBwkvNx1tQGm5Ow
 2u1PeWWGM4Xbbsl+8nMUnI0Mug==
X-Google-Smtp-Source: ABdhPJwXngpQzTWayjJyQaL9Ly3TYg4hNLk3JRfvKIKNPXWSg2PxTVn9PL9VIhkpKmYO8Qfhhyz85Q==
X-Received: by 2002:a17:90b:4acd:: with SMTP id
 mh13mr2730290pjb.147.1599129359711; 
 Thu, 03 Sep 2020 03:35:59 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id 70sm2732822pfu.107.2020.09.03.03.35.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 03:35:58 -0700 (PDT)
Date: Thu, 3 Sep 2020 16:05:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200903103556.nh3uxkb77zwqh2w2@vireshk-i7>
References: <728ce5d6b7e0f3eba8015c078bfc23ec144ce1c2.1599115178.git.viresh.kumar@linaro.org>
 <aabe6b47c9387e5ef3fc5b2a559295b72adc3c67.1599115178.git.viresh.kumar@linaro.org>
 <CAEemH2cHo=sS8b26988UmruGiK=63Zuaj7+qSM=qjuz+Wh9nnw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cHo=sS8b26988UmruGiK=63Zuaj7+qSM=qjuz+Wh9nnw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls: select: Verify that data is
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 03-09-20, 17:10, Li Wang wrote:
> On Thu, Sep 3, 2020 at 2:40 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > select() returns a positive value on success if timeout hasn't happened,
> > else returns 0. Check that and send some data to the write file
> > descriptor for the same.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >
> > ---
> > Cyril,
> >
> > Is this what you were looking for ? I am not sure why, but the last
> > test (with named pipe) times out all the time.
> > ---
> >  testcases/kernel/syscalls/select/select01.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/testcases/kernel/syscalls/select/select01.c
> > b/testcases/kernel/syscalls/select/select01.c
> > index 4367e7f3af3f..b3dcf1fff6f3 100644
> > --- a/testcases/kernel/syscalls/select/select01.c
> > +++ b/testcases/kernel/syscalls/select/select01.c
> > @@ -25,24 +25,31 @@ static struct select_info {
> >         int nfds;
> >         fd_set *readfds;
> >         fd_set *writefds;
> > +       int *writefd;
> >  } tests[] = {
> > -       {4, &readfds_reg, NULL},
> > -       {5, &readfds_pipe, &writefds_pipe},
> > -       {5, &readfds_npipe, &writefds_npipe},
> > +       {4, &readfds_reg, NULL, NULL},
> > +       {5, &readfds_pipe, &writefds_pipe, &fds_pipe[1]},
> > +       {5, &readfds_npipe, &writefds_npipe, &fd_npipe},
> >
> 
> The 'nfds' should be equal to 'fd + 1', otherwise, it gets timeout as you
> mentioned above.
> 
>   {7, &readfds_npipe, &writefds_npipe, &fd_npipe}

Thanks again Li. You were spot on once again.

I will wait for Cyril's review as well and then send V2.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
