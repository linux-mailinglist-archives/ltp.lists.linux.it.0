Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 399B51E19B7
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 05:09:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 333593C334A
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 05:09:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B8A6D3C020B
 for <ltp@lists.linux.it>; Tue, 26 May 2020 05:09:02 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E93071A01203
 for <ltp@lists.linux.it>; Tue, 26 May 2020 05:09:01 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id v63so9491543pfb.10
 for <ltp@lists.linux.it>; Mon, 25 May 2020 20:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JRnUlgamhq7+EvM3AfnBtKyVx6Wl7IukpWUkE/Xd8zI=;
 b=UODxtYDtY4e4/Mi0UT07t2m6qZ309mbdZecJIL9oRKThPtLo5G04s5v7pJ16yQ/6je
 ottFhf3kvMWkxd7D1f5eDRbzPAVzZqzFTI2QQso5pOjlkFrDLwatHPnx8lI3Z4PIaoEr
 bfP8P0S7QTXtvA/nlKplB+/Qd/5NMrFY6mjBhARL5cEwBQQdDZUnxcX0hKrSAqeVcVb/
 wWHUSB5zmZc2XZ7oKxY6PFDJdEz9vjrnWGd8tLxJ3zoqw/t9dGcXKU1q4Cazq9Lmict/
 0w+NyNy4EgAQ32oAMP/WM0gc8iwcKCDOWh0YB3pbT15zYn8fUUaomEQlCHxbnLDn342t
 l5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JRnUlgamhq7+EvM3AfnBtKyVx6Wl7IukpWUkE/Xd8zI=;
 b=ZNTMcgNf12VPbxXDWyh1NZG5eE3KMPwf6JSaoTIWDdaVInj6zeXI1ZfOjg+KA7XmJm
 zS2BOpxcseRJpKzrkfMVxXr+gvwXryhQwqbxfJEQvPF2Kya5a+wHVwVztYGhgYH+8oWl
 LZuTH9WOByfnorI/ttRQFu9hFUyHOPuRSIwB2R6wg7C8HzEt8mehbOpUu7eRtwRPIyvR
 iRw3pkJSmxOAygRLZ2rMONqTpbdo2YKm9AX8FPK44H+OfvbLIMv7fcfnYjr8Ee9ELctp
 8AAwuRb+aHuPe1jid6IRF4aS5o/Blu4Pu4zcIVNWds5eMOXso1YV+WA3VOHHfXLuIm9c
 IvdQ==
X-Gm-Message-State: AOAM530Sy+ZBbG4de6tlxwMZm4Y9j12+JgMWC4Swo81ChoyZuQAN/KEr
 WV2PsHCBrtiYGpIw2aRsG/NONA==
X-Google-Smtp-Source: ABdhPJxu8ApluyRZoQ0iyT9klzSdBopcq6Y83TWYFMULojNz6bn+ZtmK5R9ukUrLkDFpm30S6yCWdA==
X-Received: by 2002:a63:b91a:: with SMTP id z26mr29062049pge.444.1590462539816; 
 Mon, 25 May 2020 20:08:59 -0700 (PDT)
Received: from localhost ([122.172.60.59])
 by smtp.gmail.com with ESMTPSA id j7sm13815190pfh.154.2020.05.25.20.08.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 May 2020 20:08:59 -0700 (PDT)
Date: Tue, 26 May 2020 08:38:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200526030854.xocwohgiyg3p5edh@vireshk-i7>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <3b3344651f2ba4bf2446b6730a76ebcd9f894dd0.1590057824.git.viresh.kumar@linaro.org>
 <20200522123903.GB2446@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522123903.GB2446@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/5] syscalls:ipc: Move libraries to libs/ director
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

On 22-05-20, 14:39, Cyril Hrubis wrote:
> Hi!
> > Move the ipc libraries to libs/ directory. One of the reasons to do this
> > was to add the capability of adding tests with both old and new test
> > frameworks in the same ipc test directory.
> 
> Pushed with following diff, thanks.
> 
> 1) You cannot build two different libs in one directory
> 2) Setting LTPLIBS instead of LDFLAGS generates proper build
>    dependencies as well
> 3) Limit the linker flags for the kill and mremap tests

I don't think you pushed the changes you made. I still see my original
patch there. :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
