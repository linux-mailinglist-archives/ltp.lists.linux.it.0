Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6010E1842E6
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 09:49:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E537B3C5902
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 09:48:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5F6F73C58F5
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 09:48:58 +0100 (CET)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7ED6A6005F8
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 09:48:57 +0100 (CET)
Received: by mail-pg1-x542.google.com with SMTP id s2so4593335pgv.6
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 01:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=boYhy77SfIOZaw/EpPdqSSOha8yxlRp1+x6kIHJO4Xk=;
 b=VKjskmL7V6l2Uerrj03dyv3pcrN4gD3tTFUNq6ijoWn4QzKkqzQhXkKrRJymhixc6t
 H8veI7MUyC1mFS7Mr+5jxBcUIu95DHrW3S1ZkamveH/9peSGlXWG5RUgRk5QHp9xmzro
 31eSNM3L32MeQw+2gnJfIUnUiR2ZVO36UEKdDbzZHifLfIDPrfo4smiS4aU6a449XKpm
 Un8qIMSdAi6xIdBJakobNJT4v5A6+F4i83+YrRcJ92fbZq6JxGOV8+sms30Ts0USeqSs
 83kgoobUN+7J9sTQsqUgPGaFsW0kjsOux9ZB4MQ4KNu6R30g8S77q7ib1yoVQTM1YPZW
 4ndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=boYhy77SfIOZaw/EpPdqSSOha8yxlRp1+x6kIHJO4Xk=;
 b=kugv+ICpSxwDvLdqk2o6ECbQtp210MAmusyBH0muX87lGLy1ZzGvu4ADg7yeue4UrX
 3RvUBHJBMDQy2t+/ljBQNO8UT1Pcs5+0bkx9+4U/80mxy4qTXTzUX9qEOo5mAnSMIawX
 g6ybdFXFDy68WMQ+xxsck9t/j/qz4lBGiZCAxbJb7i1K/zy9uGtT6aD32CYoN4o0HEmf
 4gyQtdwydfhIlEvlfkZCqXk09ye4wYKLftUBIcNknBFYpTj7Mf/YN+x+gFe7PvS9ckD4
 XIFOekpoYCsy6SCa068lXj5sClrbaZzU0bv9K5VeMh03dnl7pGj8qTqEOVmPosV6V/ux
 RO8A==
X-Gm-Message-State: ANhLgQ23OFqUCJ2Wc9RWjgFKHkJKUGhBD9MgIWLqlPsrsV1DnoNF2RkZ
 5grobNJsHXpj1VtWHRXJ977k+w==
X-Google-Smtp-Source: ADFU+vsq9PCat6zmgLvJR5w9LL7rN0SL6dV1XVDAhchq66xLSeOUVJB2OZVDLo0V9FiAxINMWSjj/Q==
X-Received: by 2002:a63:3449:: with SMTP id b70mr11935469pga.242.1584089335937; 
 Fri, 13 Mar 2020 01:48:55 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id y13sm6502373pfp.88.2020.03.13.01.48.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Mar 2020 01:48:55 -0700 (PDT)
Date: Fri, 13 Mar 2020 14:18:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200313084853.lnfi4dnyoht5yupi@vireshk-i7>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
 <824c287cd06190cf0a489535fd4617aff8742b03.1584014172.git.viresh.kumar@linaro.org>
 <20200312191025.GD3803@rei.lan>
 <20200313040012.bvkzfbxlvrwkkltd@vireshk-i7>
 <20200313080334.GA6597@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313080334.GA6597@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V6 05/10] syscalls/fsconfig: New tests
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

On 13-03-20, 09:03, Cyril Hrubis wrote:
> Hi!
> > > diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig01.c b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> > > index d05350ce2..aea6db822 100644
> > > --- a/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> > > +++ b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> > > @@ -77,6 +77,8 @@ static void run(void)
> > >                 SAFE_UMOUNT(MNTPOINT);
> > >                 tst_res(TPASS, "fsconfig() passed");
> > >         }
> > > +
> > > +       SAFE_CLOSE(fd);
> > 
> > This isn't required as cleanup() routine is taking care of it and this
> > is a test_all type test.
> 
> It _is_, I've tried top explain in the paragraph below, just run the
> test with large enough -i, sooner or late the test will run out of file
> descriptiors and then it will fail.
> 
> The key here is that the run() function can be called repeatedly but
> setup() and cleanup() are called only once at the start and at the end
> of the test.

I didn't knew about the -i option, yeah your change makes sense now :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
