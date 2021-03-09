Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0951E332246
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 10:45:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCADF3C5548
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 10:45:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C072C3C4BE6
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 10:45:30 +0100 (CET)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8D1B9200BBF
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 10:45:29 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id jx13so605050pjb.1
 for <ltp@lists.linux.it>; Tue, 09 Mar 2021 01:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=S+MVll1Ki4mgQC1QOWIhbcoXDv840GHJwsoaD5RYy54=;
 b=N2vqtZ7tL6AvffCNDKAN3ueDEO93lFKSBAwqM2M8VEY/z/s50oGpRHF21utq64T471
 EPx0YJfygrwXgC/tiKu4r/63rf9HJLGF+9k5+BFiMf7Hge1wLIcggD9vGc7pHIxIQfmc
 RWJ8qJuE7hj1jzN7TTP7pHF0utBAJpi0Mq9kWdxJ7t5gmEn8pc8NAsnPL42ZBjWLmOFp
 duo7pboUf9KtGvIVR01ZEAokrJh/jVIS1PVNLruV5HMVOkwBBQ0ieKF8xW+PymfVoKE0
 hcylCCv10PFHv0PJCFWRZQex+zmgN9vceyCLppCffWyPArsFVK+JTp6hs8rqptlDrkie
 YqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S+MVll1Ki4mgQC1QOWIhbcoXDv840GHJwsoaD5RYy54=;
 b=lFfIqYHrhxP5hASmfZFfib3wBAAJ4GjJCyks9E9UL1o065mne8uoN39WVlXb6DNNlJ
 JigdRHI5dSBmM7UQ2qQMqNZFPQ0OpioG3ik7BMzPBoDraaV7Rs//eys1xH8eh6Hsx+Wq
 qO6LWCo1pChoJD3pxS4zUm1GcyNXMtLxCT0Q5qTNe1s8i6P7Jhh543AnAG945tm1VIVz
 5nbY+Mij9Cyj5Igo51RSqW1OMeyRXHkiFCPI9+DkEX2sMR9R7IlJSybntU8iSyhhtKP9
 hQD+4VMY4+xoFBMN6tD3fPZuDa6mlDqqOB/eiwxTh7MHe8a8+999KMKETUcCBMNET/fB
 4DXw==
X-Gm-Message-State: AOAM530cA/JU3aK2COjO7ASjC6gHvUJBNKp8xdODW3Z0d/AmeGlPw0v2
 uevH/qFwdDK2QJVypWKMRrUalEGlfs7Y9w==
X-Google-Smtp-Source: ABdhPJzmwNQwzyShQws8fmUICpSXhX3bU0KlDrfjYyx5+0AvDLc/mYfbKntT1ci2NT6qyWv4F/nbZg==
X-Received: by 2002:a17:90a:8b83:: with SMTP id
 z3mr3880326pjn.75.1615283128051; 
 Tue, 09 Mar 2021 01:45:28 -0800 (PST)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id a22sm6038020pgw.52.2021.03.09.01.45.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 01:45:27 -0800 (PST)
Date: Tue, 9 Mar 2021 15:15:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20210309094525.4ggmppfpvavsvjzl@vireshk-i7>
References: <20210309080028.16284-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309080028.16284-1-liwang@redhat.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

On 09-03-21, 08:00, Li Wang wrote:
> We catch some sporadically failures[1] like below, but we don't know which
> test loop it comes from. So adding more prints to help locate issue.
> 
>   tst_test.c:1286: TINFO: Timeout per run is 0h 05m 00s
>   vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
>   clock_gettime04.c:157: TPASS: CLOCK_REALTIME: Difference between successive readings is reasonable
>   clock_gettime04.c:150: TFAIL: CLOCK_REALTIME_COARSE: Difference between successive readings greater than 5 ms (1): 8
>   clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC: Difference between successive readings is reasonable
>   clock_gettime04.c:150: TFAIL: CLOCK_MONOTONIC_COARSE: Difference between successive readings greater than 5 ms (0): 5
>   clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive readings is reasonable
>   clock_gettime04.c:157: TPASS: CLOCK_BOOTTIME: Difference between successive readings is reasonable
> 
> After patching, it will show more details about the iteration:
> 
>   tst_test.c:1288: TINFO: Timeout per run is 0h 05m 00s
>   vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
>   clock_gettime04.c:158: TPASS: CLOCK_REALTIME: Difference between successive readings is reasonable for following variants:
>   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
>   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
>   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
>   clock_gettime04.c:162: TINFO:   - gettimeofday
>   clock_gettime04.c:158: TPASS: CLOCK_REALTIME_COARSE: Difference between successive readings is reasonable for following variants:
>   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
>   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
>   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
>   clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between successive readings is reasonable for following variants:
>   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
>   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
>   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
>   clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_COARSE: Difference between successive readings is reasonable for following variants:
>   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
>   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
>   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
>   clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive readings is reasonable for following variants:
>   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
>   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
>   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
>   clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Difference between successive readings is reasonable for following variants:
>   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
>   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
>   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> 
> [1] it occurs on a x86_64 (not virtualized) with kernel 5.11.0.
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  .../kernel/syscalls/clock_gettime/clock_gettime04.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
