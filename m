Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE61DE29B
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 11:08:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 326893C4CEA
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 11:08:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id ECC783C4CD5
 for <ltp@lists.linux.it>; Fri, 22 May 2020 11:08:13 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2F6AB140118A
 for <ltp@lists.linux.it>; Fri, 22 May 2020 11:08:13 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id q24so4723984pjd.1
 for <ltp@lists.linux.it>; Fri, 22 May 2020 02:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tKLltSuwh5yJkFsG9JTL+RZMD7LEqfVPwSZYH+hFrjM=;
 b=QMWDNmOD548w6u9rCZa8mW8xHpBsmYkNUkgq/CF7Er89Hb267/rIcOCzDi/EBMd4oE
 oaR5lsQD8BJihUGxWmbfy+ccpB3rIRe8mMfuc6of2mcWfsi8uwnZbpt63aZNzc4B7Yhp
 sy5wJ1gD7kk1DuXDbQPp/rVfTJ19tpnY4VViVbsbwqgjGoSXLY0CLHlJzgzkq09AJVIc
 ANxu4s72J2vy4TP2bwuhI0D1037KqVydMI8RJGWifeRNbv2LDPcgx3haT0vuYVAN11A/
 d3BPwFcEiyPa4+Js5v+C0UQkIdb5R1ItDiPfVC7Nys60lLsfhUqr6Ojnvrk9D+cPFtUK
 ahxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tKLltSuwh5yJkFsG9JTL+RZMD7LEqfVPwSZYH+hFrjM=;
 b=Wa+Z3N/TqTizg/vQJbtgvtXYx2fGpCKtwLQ22qf/Yz9nSiWu0+FdAkCoAFpW3vZYyl
 XaE79ogVIuzu328N0mX1DIXcLrTtdjHmZUI5wlrQ147yBeRCCPYtycLx65Tyd42y5xjN
 cIMZDn3TaAiX/b1Z0CGyuK50cDRH1m7qNvr72dHXjgJZWJeU2eSe1aBwGM5MVUdiINCd
 SAjZdrIwjzruhopEHHX6SnWZi5eB6Hot4V1hQZT+M74U/GwkXEuqCZVgMR9Xq4mNcvM5
 UkI6jmxZWFDs3AF/kUBMcCcrCBttQkdoFzqB5YvMaCB3pdpAR9YKOeT8pkRm8XHuvo5Y
 jCSw==
X-Gm-Message-State: AOAM533wCl4bzF0kRNc5J8sGkfeHKSowwflPDgngggXIi+W+e1OYRcaw
 UjOjKmL/9Y3MJhjk94fRVm+FDQ==
X-Google-Smtp-Source: ABdhPJwlUMSnVOHKpf1LfG0ItKIkkaYGOMizVZT0OApQ/1lqdhzv6x5YR5NP+WlYOzNavYWrMRT7rQ==
X-Received: by 2002:a17:90a:c7c9:: with SMTP id
 gf9mr3397138pjb.19.1590138491632; 
 Fri, 22 May 2020 02:08:11 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id d15sm10071758pjc.0.2020.05.22.02.08.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 02:08:10 -0700 (PDT)
Date: Fri, 22 May 2020 14:38:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200522090808.uobmfe4rw7qfmqf4@vireshk-i7>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <CAK8P3a2N-J5LoNPHa7hjRPcOR0ytNfZQ678pFuCJaJJHGYS--A@mail.gmail.com>
 <20200521142510.GD7833@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521142510.GD7833@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/5] syscalls: Add tests to verify the _time_high
 fields
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 21-05-20, 16:25, Cyril Hrubis wrote:
> Hi!
> > > This patchset adds a new test to three syscalls to verify that the
> > > extended fields, _time_high, are cleared by the kernel. This was
> > > suggested by Arnd.
> > >
> > > I did run them, but on a 64 bit machine. Please see if you can check
> > > that they work properly on 32 bit machines, where we really want to test
> > > them. This is rebased over ltp master.
> > >
> > > Cyril, This conflicts a bit with my other time64 syscall tests, I will
> > > rebase one of these, after you apply any of these first :)
> > 
> > The known bugs we had here were actually on 64-bit machines running
> > compat 32-bit user space. You should be able to test this on most
> > 64-bit distros using the compat libraries and building ltp against the
> > 32-bit version (not sure what the best way is to configure that, but it
> > should not be hard).
> 
> We run LTP compiled with -m32 in our automation in SUSE precisely
> because of these reasons. Not sure if somebody else does that.

Okay, I tested LTP with:

LDFLAGS=-m32 CFLAGS=-m32 ./configure

and the time-high fields got cleared on my x86 machine with 5.5 kernel.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
