Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC352173537
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 11:24:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 177303C6AEE
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 11:24:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DC5DD3C6ABC
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 11:24:37 +0100 (CET)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 07C20600A5E
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 11:24:37 +0100 (CET)
Received: by mail-pg1-x541.google.com with SMTP id s2so428464pgv.6
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 02:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b3KEetRncdnh+mteITpF+bnNLJvEA/aTEZIzizJfnSM=;
 b=pTd5cuyZAjGKsG54K1pGl+O7VjoihRE2ALh0t47GIQ7A4FyMRPkyjPTNfi0C/u6leF
 omiAm2y1wz4nfhDhQlyn7R6BTEGKiFoNFjhPr4R5IAUNJpnHGxWBCbM4zLb9GQJOxs48
 mo3dZVICfKCqyFUoraHABSh+r6f3+TvUrsV+FznuxuEfNNLpEShdLBE4Tsi1xnz3TBwB
 iusH9BEdOOmWmdBo3Jy+uAB8q7WCnl7E0ldWEoXJ6/Veq+TA5IX0zKcdi8yBVmZzw4M8
 8Eo41914aqR3y3xJz1v3IBmec+PxxYLDaqYdyEU2C7ph1kRuFz1RZnsEMGBwTs/7auZG
 RseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b3KEetRncdnh+mteITpF+bnNLJvEA/aTEZIzizJfnSM=;
 b=poli4zhGCmiWVfShNCPd6fGuIp74VMEC0WUJ7adxEz1NTsFKmGBYy7YyjqLMX+qt3I
 lFMxG/xXUWpQApj1NOflXEzgqXpzyFymaNzX6Y+QZZPFGQNYuPLKceRoP7sLueThbfKB
 ZOEV4z4+ljBQ1sn9rC73iy76ihyuv0PX/+5YTEkm69d2m5g5O6zjZkVLHszAzzRCRl8e
 JnQiLhqChKe3oUlW1QdmLCEjaeJgzbZ801YO3b9GgS8+1wsF9wvfnv9A1/oRa338R3BE
 S+jQTPY8/Fqrtv9csccgPppqDoEn+jH7PifVu5ndlB4fEdbc34vOdQFNxPO/vE3bHKlf
 kYEg==
X-Gm-Message-State: APjAAAUnVD6iVEanC1vbMY5MLLgJblwJoSl7bmAHd884YkwdhH3zrDAp
 6Df5w27QlyFa1xdD8Avcx0V0cQ==
X-Google-Smtp-Source: APXvYqy/ZNF2SzpZ+RaW8s8dEQlFptr5V+bhNzlhAfuTCJ1tryvizDsHMiicgzZ+mM5/BZqos6IqKA==
X-Received: by 2002:a63:fc62:: with SMTP id r34mr3888727pgk.437.1582885475471; 
 Fri, 28 Feb 2020 02:24:35 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id w17sm10284008pfi.56.2020.02.28.02.24.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Feb 2020 02:24:34 -0800 (PST)
Date: Fri, 28 Feb 2020 15:54:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200228102432.3kdhl4aqkla4akss@vireshk-i7>
References: <CAKohponuu3zpsQCv0v1_Yqb_tmqy5yyUejMoS1_M_UFf5FU2Mw@mail.gmail.com>
 <20200228085859.GA31181@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228085859.GA31181@rei>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Query: Adding support for clone3()
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

On 28-02-20, 09:58, Cyril Hrubis wrote:
> Hi!
> > I was looking to start implementation of clone3() syscall in LTP
> > and am a bit confused here and need your help in doing the same.
> > 
> > LTP abstracts the call to clone() syscall in lib/cloner.c and the current
> > prototype of it looks like this.
> > 
> >        int clone(int (*fn)(void *), void *stack, int flags, void *arg, ...
> >                  /* pid_t *parent_tid, void *tls, pid_t *child_tid */ );
> 
> This function is there mostly for implementation of container testscases
> so that they does not need to deal with the clone() syscall complexity.

Right.

> > One of the challenges with the implementation of clone3() is that
> > there is no glibc wrapper available. And in case of clone() glibc
> > wrapper isn't ordinary as it takes care of calling fn() and handling
> > few stack related things, apart from calling the real syscall.
> > 
> > I am confused now on how should I write support for clone3().
> > 
> > Any suggestions will be appreciated. Thanks.
> 
> Let's just add the code into lapi/clone.h, would that work for you?

Which code are you talking about ?

Here is some stuff about the glibc wrapper for clone() from an stackoverflow
page [1]:

clone(void (*fn)(void *), void *stack_pointer)
{
    push fn onto stack_pointer
    syscall_clone()
    if (child) {
        pop fn off of stack
        fn();
        exit();
    }
}

This takes care of calling fn() and doing some stack related stuff.
The kernel syscall doesn't expect the fn() argument but only the
userspace calls do. How should I handle the extra stuff that userspace
expects for a clone() call ?

-- 
viresh

[1] https://stackoverflow.com/questions/18904292/is-it-true-that-fork-calls-clone-internally

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
