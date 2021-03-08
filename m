Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E868E330CAC
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:49:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B8AB3C5573
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:49:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1774B3C0BCB
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:49:04 +0100 (CET)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 61F586003CC
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:49:04 +0100 (CET)
Received: by mail-pg1-x529.google.com with SMTP id w34so5184742pga.8
 for <ltp@lists.linux.it>; Mon, 08 Mar 2021 03:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0pKrkMTcMR9Zf4ClKHSrr0ITXJaUi/JfRWcc2fPCdMw=;
 b=zTk6g/gWLABKxEAYjEtmZJgXUHecrOOW+oI2dnWaVXULmgw0LDilKKKhpuy2HAjgTR
 rWGU8GToirvHh9HRUnex/sKwSEs7WNhJ5+gy5/H4we5HdC+GRenS9iqsXlZFhL02ri0h
 PsHBWWVDvbZpEuWuqGVWimfvaYUoXp0nDd0g1AiJh81YhZf4hA/ZgqwRKdtdK38YWL86
 Rjyw+NEUnLPVwR/2sXqoz5dJJXkWxu8k+ObzhYunXBNyOyQBvWK8URTQ8PIYWkpu6o2X
 c5eqIisjVrkJ2lxGZ3hu4JYB/mH4BPKBtzdO62qMMni9SEaAShlx2wBLHA6JvyzfVgp1
 taqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0pKrkMTcMR9Zf4ClKHSrr0ITXJaUi/JfRWcc2fPCdMw=;
 b=GUOKVkIYhXzw8HddxdJLr05TAvjiWElT5iMhitptXu44smyrwp4egRAXlteKUksBSl
 EO5LVNzZaovtPc9Ox2Fld948ARPrEN2Qlh/JrRX1CqFvVfsfSfaIbD4k679pBhIW+/q6
 Inv6f9gui5GAqHWnAFUXzZT3bL2IyAbHceSfS9A+3d/afu1l7MJ5vad05OXcYlZREEag
 06+A2dy+TVG0b/a3p6Rx8Mza9kdGM7Hrhvr/sFhKpmxik9XO6FcpMc3FSw1N41kaeBuI
 og/YSbxb2Dser34JodOmvO3cSkyq8BxzqU74vBIXXGnaz7uTBo0tieh4N1QibdCTHO+/
 3BHQ==
X-Gm-Message-State: AOAM5326xgKqEA+skcyhwfBeK8BpK6zg6ISIXKzE+pxXJ9LgsRPSZaSk
 9xg0B3elCBG+51s5OmQXBViFwA==
X-Google-Smtp-Source: ABdhPJynmXX0yr/Dacbyxd9xZN/+kfCNCsgusmyb3MGnNjWirvJTgKzkQ4RCw475NXeXRQhffl1H5g==
X-Received: by 2002:a62:8cd3:0:b029:1f3:17da:da13 with SMTP id
 m202-20020a628cd30000b02901f317dada13mr9379451pfd.52.1615204142797; 
 Mon, 08 Mar 2021 03:49:02 -0800 (PST)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id o13sm10321695pgv.40.2021.03.08.03.49.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Mar 2021 03:49:01 -0800 (PST)
Date: Mon, 8 Mar 2021 17:18:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20210308114859.tskerybpt6xtyffa@vireshk-i7>
References: <20210308065329.25824-1-liwang@redhat.com>
 <20210308101732.lzkjql3t7aoscruk@vireshk-i7>
 <CAEemH2d45hFqhB-++xgswYoOh4HGFtFZxXCKGhLhDdt9oXFbfA@mail.gmail.com>
 <20210308111447.h3l2a5yep3n4n5qs@vireshk-i7>
 <CAEemH2eKkGokVY2ZBs=U9eqDrDZVB5qKBVUApULrdL65tfnmLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eKkGokVY2ZBs=U9eqDrDZVB5qKBVUApULrdL65tfnmLQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime04: print more info to help debugging
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 08-03-21, 19:24, Li Wang wrote:
> # ./clock_gettime04
> tst_test.c:1288: TINFO: Timeout per run is 0h 05m 00s
> clock_gettime04.c:84: TINFO: Running in a virtual machine, multiply the
> delta by 10.
> vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
> clock_gettime04.c:158: TPASS: CLOCK_REALTIME: Difference between successive
> readings is reasonable
> clock_gettime04.c:158: TPASS: CLOCK_REALTIME_COARSE: Difference between
> successive readings is reasonable
> clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between
> successive readings is reasonable
> clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_COARSE: Difference between
> successive readings is reasonable
> clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_RAW: Difference between
> successive readings is reasonable
> clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Difference between successive
> readings is reasonable
> 
> 
> After my patch:
> 
> # ./clock_gettime04
> tst_test.c:1288: TINFO: Timeout per run is 0h 05m 00s
> clock_gettime04.c:84: TINFO: Running in a virtual machine, multiply the
> delta by 10.
> vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
> clock_gettime04.c:112: TINFO: vDSO or syscall with libc spec
> clock_gettime04.c:112: TINFO: syscall with old kernel spec
> clock_gettime04.c:112: TINFO: vDSO with old kernel spec
> clock_gettime04.c:112: TINFO: gettimeofday

The above doesn't look nice TBH.

> clock_gettime04.c:160: TPASS: CLOCK_REALTIME: Difference between successive
> readings is reasonable
> 
> >
> > What about adding tv->desc to all the existing print messages instead
> > ? Or maybe just the TFAIL ones? So we print everything in a single
> > line only ?
> >
> 
> But that still not good enough.
> e.g
> In PASS status, we missing some details.

Hmm, so there are two loops we are running here. One is for each CLOCK
and one for each variant. And the final PASS message only talks about
the CLOCK type and there is nothing about variants..

Lets decide how we want the output message to look and then code can
be changed accordingly.

Option 1: Just like what we have right now.

clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between
successive readings is reasonable

Option 2: Separate line for each variant.

clock_gettime04.c:158: TPASS: vDSO or syscall with libc spec: CLOCK_MONOTONIC: Difference between successive readings is reasonable
clock_gettime04.c:158: TPASS: syscall with old kernel spec  : CLOCK_MONOTONIC: Difference between successive readings is reasonable
clock_gettime04.c:158: TPASS: vDSO with old kernel spec     : CLOCK_MONOTONIC: Difference between successive readings is reasonable
clock_gettime04.c:158: TPASS: gettimeofday                  : CLOCK_MONOTONIC: Difference between successive readings is reasonable

Option 3: Same as option 2 but different formatting

clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between successive readings is reasonable for following variants:
        - vDSO or syscall with libc spec
        - syscall with old kernel spec
        - vDSO with old kernel spec
        - gettimeofday

Any other option here ?

For the FAIL messages, I think just adding tv->desc is good enough.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
