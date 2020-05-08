Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3251CA243
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:28:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04DE63C25D2
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:28:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1A6C73C7285
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:25:00 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7E8191001594
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:59 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id 207so284557pgc.6
 for <ltp@lists.linux.it>; Thu, 07 May 2020 21:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gRjeZHQJfmFHV0p/XvUA7f3Qe/eD4czNawskWvlejwE=;
 b=wZD9l7PK3aYgEkopgNu4GFDUOK1xFUDAg7qx5oMI2ptFXGO8/wr9loPO4nMxYbey84
 33qnebaG1na29pGGDY31MTEuO61sRzzyspZBzJE7GXxisG3ad5jaxym9YP5rnzn5TGJA
 HvH5PK1YGqDOw694PtETUkHrHQ0zWewFsWa1UDtHhUL0Imf/yPVJquEKW6sOyt3Swr+o
 46K5A8RvvWQJbFYSaLccmStFTfuu410IhDq2SJRKTflvwMbZjxaAz9oDBgrr2LqeaztS
 /tJ8rELMgPa2LQ8dT30s5xiG/uw9OYKggfmzMmnvqSDBIO0wWdNtIokMegtJmYed5Fbj
 Nr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gRjeZHQJfmFHV0p/XvUA7f3Qe/eD4czNawskWvlejwE=;
 b=ed2SkbCK82PlW+4NtAxB4Tpm0jMZh8wlr24USjbEzvU/4g1GDmcCo8rN7u1bLwh82G
 Isi8Ccl+OAoEdkAvQSTbeGo9+WRZHw6EZGKbeDtO4GaVagpKOUr1iEYysFhN10Q5AUiw
 bPtL/xdC6xPp2EwYdFKVqWwUthRxd2Quw+DU5bChItmLDmGLaDRVlaWDoM4jn3Advpj5
 vAM5XZ8s2lTjMGuj9KNdDEDUBnyIe2FWGSAB04sm8I/ObhlMHaDQMWnPD7Qrq98NztyR
 aE7X8PfKpxqcilODAL9iNmMkaBck0EliWPnJF0TL3oph/c5vBULPM7TXYdjiO8pu5iy9
 3yAg==
X-Gm-Message-State: AGi0PubXisYI6mHDUVW9JBh1R26dHKV6XLzUDTb9irFfaUhbie6bg92V
 flbfofcM5Aguw1nc5+3cOU6Yz1cK890=
X-Google-Smtp-Source: APiQypLWaR9hV2lRSQpKUUsk6GoAjdKUaugzB6C+He1saINo27fvTxBlj66bWhKCopoi85ufAPaT5Q==
X-Received: by 2002:a63:ff49:: with SMTP id s9mr591314pgk.46.1588911898009;
 Thu, 07 May 2020 21:24:58 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id d124sm347555pfa.98.2020.05.07.21.24.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:24:57 -0700 (PDT)
Date: Fri, 8 May 2020 09:54:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200508042455.xmf57rcdhtmxqeec@vireshk-i7>
References: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
 <379f4d58e86b5249f56ff58e1907dee69d67e451.1588669892.git.viresh.kumar@linaro.org>
 <20200507145258.GA16940@dell5510>
 <20200508033034.cyem2olxb7kpvu4s@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508033034.cyem2olxb7kpvu4s@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/8] syscalls/futex: Add support for time64 tests
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
Cc: arnd@arndb.de, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 08-05-20, 09:00, Viresh Kumar wrote:
> On 07-05-20, 16:52, Petr Vorel wrote:
> > Hi,
> > 
> > FYI, 2nd and 6th patch didn't apply cleanly.
> > Trivial fixes, but for anybody who is lazy to repeat the work here it's done:
> > https://github.com/pevik/ltp/tree/Viresh_Kumar/futex_wait_bitset.v1
> 
> I was wondering on why it won't rebase properly, unless I tried to do
> it again the way you have it. I forgot to mention that these patches
> were based on the earlier patches I sent and so there was some
> dependency in tst_timer.h. If you apply following series first, you
> won't get these rebase issues.
> 
> [PATCH 1/4] syscalls/timer_gettime: Add support for time64 tests
> 
> Will it be easier if I resend all my patches again in a single series
> ? I can also add the new tests I have converted then.

Okay, I cleaned up the GPL licensing thing and resent everything in a
single series. That should simplify everyone's life.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
