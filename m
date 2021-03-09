Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA22233248E
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 12:56:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25E9F3C6A90
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 12:56:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 38A263C4FC7
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 12:56:28 +0100 (CET)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A19A61A00F3A
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 12:56:27 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id t9so769215pjl.5
 for <ltp@lists.linux.it>; Tue, 09 Mar 2021 03:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4osY3UfCvo/rVg277T6c+5c0k/1771P9THAiVASV2TA=;
 b=E/qtBz513HUwb646CQ+hMqwrkqE5yprHCyVvvdt3Cg0H8YSs2SZoZBfVSGB87Iqp/a
 vPvajgkvjA4nVERmglYmZzWwfML7O9JSS8yCa9cudybInKprO5WvYNujIfB2eQdPwEfV
 ZwWCNlID1Z6sMhocGYsvGkFSqWkxLTsME3ZXj2G0mi4KxGxM+iH9BJdppZk/Hls4rWbG
 SxgBq1V1ZOrjnyDp5uKASpyGQ8AuvT50b8lFFqr40GENnE268FMZgE29GDpTZ6dLMDTQ
 oqhWSoNZ4UlHIm7I8z+Cft/oZlTAb3i7/P7KOzgJkF8T29nnnR3bTvdUmJfxdEpMZdXa
 /1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4osY3UfCvo/rVg277T6c+5c0k/1771P9THAiVASV2TA=;
 b=KtCP+F1UJBz8ef5YJ+Oi23VUuVlqbPPzUs07trNnVd+NieZa3QDIYa104MqF14oJB6
 k4gzgdlsyjyM5ifqFpi4vS7K9CAu38+Gswg3DBIHFXhtSHNS6zUsxfrfJW23NKJhiJDX
 SXhvsLxvZMi291/sfataJF+ki3neAqFAqNZrKixqcY0EIl2Dhfr5W9KAAd6GvElNfPGe
 t7FWFU2+d9oFsysm1vnD6OzZ6jxTtwzevD4uMmWy5BSSkMYDefiyeQqcm11RRPWoIN5n
 YZX9CIM1MxJawNU0APEuxECTI2UiZwZ53VPRFyXiTGtgpJtWyyld1fO4b2BmTy1HhcbZ
 MQ9g==
X-Gm-Message-State: AOAM531OAmnntfDseCk4wv8YCuWN06IKvDK02T2Mw7ql0+ANYt961+yp
 X38DcXg60mFAan2eVBgBwxhbEg==
X-Google-Smtp-Source: ABdhPJxyd0SrJuVXXWL11rYYKK+Tj44pAeEwLC8IxLerwM1qMuNd3R0DSEwAeuF/hxIiPsX6vcgicw==
X-Received: by 2002:a17:90b:4d0f:: with SMTP id
 mw15mr4383823pjb.92.1615290986113; 
 Tue, 09 Mar 2021 03:56:26 -0800 (PST)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id i11sm13819515pfo.29.2021.03.09.03.56.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 03:56:25 -0800 (PST)
Date: Tue, 9 Mar 2021 17:26:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20210309115623.ze5c7li7vuf65gvg@vireshk-i7>
References: <20210309080028.16284-1-liwang@redhat.com>
 <20210309094525.4ggmppfpvavsvjzl@vireshk-i7>
 <YEdhgvXg/mYkppz6@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEdhgvXg/mYkppz6@pevik>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCh v2] clock_gettime04: print more info to help
 debugging
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 09-03-21, 12:52, Petr Vorel wrote:
> Hi Li, Viresh,
> 
> > On 09-03-21, 08:00, Li Wang wrote:
> > > We catch some sporadically failures[1] like below, but we don't know which
> > > test loop it comes from. So adding more prints to help locate issue.
> 
> > >   tst_test.c:1286: TINFO: Timeout per run is 0h 05m 00s
> > >   vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
> > >   clock_gettime04.c:157: TPASS: CLOCK_REALTIME: Difference between successive readings is reasonable
> > >   clock_gettime04.c:150: TFAIL: CLOCK_REALTIME_COARSE: Difference between successive readings greater than 5 ms (1): 8
> > >   clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC: Difference between successive readings is reasonable
> > >   clock_gettime04.c:150: TFAIL: CLOCK_MONOTONIC_COARSE: Difference between successive readings greater than 5 ms (0): 5
> > >   clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive readings is reasonable
> > >   clock_gettime04.c:157: TPASS: CLOCK_BOOTTIME: Difference between successive readings is reasonable
> 
> > > After patching, it will show more details about the iteration:
> 
> > >   tst_test.c:1288: TINFO: Timeout per run is 0h 05m 00s
> > >   vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
> > >   clock_gettime04.c:158: TPASS: CLOCK_REALTIME: Difference between successive readings is reasonable for following variants:
> > >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> > >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> > >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> > >   clock_gettime04.c:162: TINFO:   - gettimeofday
> > >   clock_gettime04.c:158: TPASS: CLOCK_REALTIME_COARSE: Difference between successive readings is reasonable for following variants:
> > >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> > >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> > >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> > >   clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between successive readings is reasonable for following variants:
> > >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> > >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> > >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> > >   clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_COARSE: Difference between successive readings is reasonable for following variants:
> > >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> > >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> > >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> > >   clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive readings is reasonable for following variants:
> > >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> > >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> > >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> > >   clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Difference between successive readings is reasonable for following variants:
> > >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> > >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> > >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> 
> Sorry for putting my opinion late. Instead of repeating variants (duplicity)
> I'd prefer just print variants once at the beginning + print which variant
> failed.

I too thought about that, but then realized that the variant list
isn't same for all the clocks, like gettimeofday only there for
CLOCK_REALTIME and so let it go.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
