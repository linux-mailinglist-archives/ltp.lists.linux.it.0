Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE51D9394
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:42:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE9373C4E6E
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:42:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1FE7F3C042A
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:42:06 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DC0711000DD1
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:42:05 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id q9so1122020pjm.2
 for <ltp@lists.linux.it>; Tue, 19 May 2020 02:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JGevkp+G5ahF0DiEtcgLKWC3CaY185OnUo99uajvEAI=;
 b=iMRI92AD5c2XfmA8WayAFmLP9OdB4O1xhBMcxGsEWFwHktw2nrsKaM+w41oQDo6hXc
 ZWoPrRCjBMnherzgfaPOnZr+JfY9L4QJ2m7O/l1jzz05VzMcZ4k6Shidqzk/dIVve5wq
 wVOZbg8OKSf9ZM2YwYxTr+4DNkMn5UHOOPnvf8rKu9N8t0425tnqLTekndMdg2dXuhOZ
 6b0iKnNl2y4nabwmOE4I66D/PxZ9ed9YEOis7c8s7Sj4N9xCYAh3FBtKp8LE3y/SjQo7
 SVbDDczADSLX8ymI5OARUvBzyuDGRsjjUFblWqlogeii2Izslg984JeqJ9ygxZLiL3M9
 EcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JGevkp+G5ahF0DiEtcgLKWC3CaY185OnUo99uajvEAI=;
 b=BDMBG8tb5IQu0vfhYVKg5RUuK0HfxviDxeMCHA+OkWGQaeypfyo64B6FwerJJepevv
 OMa8sdSQZFtvoFrQGHgTyuGVbWTog50Jhtzcrbsl4cL36Hkl7Q6XRQZFwPOUV89aUn/H
 if63Iv2CgJP/tGpLmOJ/5oh/vVz7MAy4sxr/orpwW0ce2x6EPDKjAVcvXjBG9Iz5U8Bw
 AwTQrYZl9jWAL/tOZ+HFji6Xh91S1X5U1mOZcQwnXYm6X1SS5DwofYXVcQAZfB4Hf7U7
 78/uQ3ZL3ai29jnHpLwCvmuAuxijKiXLt3i8KNg+NT3mV3ZV4gR3FKQmqXYP93UjVEg/
 R47Q==
X-Gm-Message-State: AOAM531H35VHRLBd5cwYbzgg9x2O3C8j6ZxuBQma2/87TFUe57bxvxfu
 CwNpQL9HYJrgl0WSdXHWKSRzrw==
X-Google-Smtp-Source: ABdhPJyAnJC2S1LbwG12Sbn6xv3QYl/WksrO1mtGSPYEVrJ7AMaJDfzDKFwpURuGK7Y81ml339HA1w==
X-Received: by 2002:a17:90a:fb8e:: with SMTP id
 cp14mr3988448pjb.56.1589881324392; 
 Tue, 19 May 2020 02:42:04 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id x5sm5019522pfq.196.2020.05.19.02.42.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 02:42:03 -0700 (PDT)
Date: Tue, 19 May 2020 15:12:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200519094201.llskyyq2jbx7onai@vireshk-i7>
References: <cover.1589789487.git.viresh.kumar@linaro.org>
 <CAK8P3a3aP5S_w_FFv=UvJRSRTjcoNVy_W6ycm4OTct-7Q_5_xg@mail.gmail.com>
 <20200518091253.qmvqo7xub7hpeovm@vireshk-i7>
 <CAK8P3a3_dGzoGPckBByySvLYGC3FyiCSwCdfzxG8xjJsY0oXrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3_dGzoGPckBByySvLYGC3FyiCSwCdfzxG8xjJsY0oXrg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 00/17] Syscalls: Add support for time64 variants
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

On 18-05-20, 11:21, Arnd Bergmann wrote:
> For msgctl/semctl/shmctl, the existing syscalls were extended in a
> compatible way, using an extended 'high' field for each 32-bit
> seconds value. I later learned that on some architectures, the
> 'compat' version of that failed to zero-initialize those fields, so I
> guess all we need is a test that ensures this was fixed correctly,
> by initializing the '*_high' to something nonzero before calling
> the syscall, and checking that it gets zero-filled by the syscall.

Okay, I see the new structure (struct semid64_ds) getting added to the
kernel. But I am not sure how to call the 'compat' version, can you
please help ?

Do I just need to call like this ?

	struct semid64_ds buf_ds = {
                .sem_otime_high = 1,
                .sem_ctime_high = 1
        };
	union semun arg;

	arg.buf = &buf_ds;
	semctl(semid, 0, IPC_STAT, arg);

?
-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
