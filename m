Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD1F333796
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 09:43:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFC943C4B93
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 09:43:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 1F08C3C3178
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 09:43:10 +0100 (CET)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BE4F3600D32
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 09:43:09 +0100 (CET)
Received: by mail-pg1-x531.google.com with SMTP id g4so10945472pgj.0
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 00:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3qjAG/T9vhmRVrB3Z+xiToZ6hsUMHn/1poRhej7kQGQ=;
 b=kvquLldC78PwI8Osx3Un1kh0vnN0p5Ry44rAjwlXIwulTYFWrbGgdNfsE7b7mbAjVi
 pZB4G1Wr6dEC1Kzg671FFxfKxGzkdN1q/pvlDKNMsoXazVTfDNuFGVErAXeBg7H+fh+f
 pVnUYR3N7GD9iFNUuKZRi4QKHrQc24DKrCTRw/KsrElcaKh5HqQHTLc26OvyD4/vMOcF
 NKchoZGIuK5MALjKDYGslnIOA3H44t/3XFFwknfNRDawEMe7OopEezYD8K/dzDxlfryG
 oh+KnnrDMkq3Mi9tyegeqEBFYxgBLKYpm9wsPntFRJP736hhle85JrKlEKOpuvC7FhM0
 2Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3qjAG/T9vhmRVrB3Z+xiToZ6hsUMHn/1poRhej7kQGQ=;
 b=MlwVIZkwDWGa4X6wVjNlkKLoKqKxybyNXwYxOfpgg0aNtS+J5nf8y/94wtMoie6bJb
 BninYU5tQTdEkLmW4PhXKiEMc0KUjB3u+1rovb+yiZ3PwRfZEmZ9cMYa908os+wZXy3g
 fi9J9YMwpOfPmGC4jvDEWYiKgh+bb1ij5N0jPIEB0h019a4SiB/sz12F93wa9574VZcx
 spMunO5bekHkRebKZrB1/sszaHETBxkMar7x9Zr8wo7Yw1TcFjuTD6jLxcgGx9onKp7x
 wkoYRuwhwsi5nFALv332AE+9WRWERUgxPUDFOkc0JqVzCEMoySV06/8f0RRci8AD2Tgy
 l1ZA==
X-Gm-Message-State: AOAM532cIAHybfvq2kFEYdlXKNAhOLrqm9lfY6K8muD4gAYHxta5pRZM
 /qxNrR6U8GMrE/cE/zax2+7mOA==
X-Google-Smtp-Source: ABdhPJzmlcYnyKQZPEbi34Zr1jfZzuJHJ4Gic18ozLC0tDWeuzKcDWHZ/H4I09vbl79zhBo/Qo+BGg==
X-Received: by 2002:aa7:8a56:0:b029:1f3:9c35:3cbb with SMTP id
 n22-20020aa78a560000b02901f39c353cbbmr1970177pfa.24.1615365787954; 
 Wed, 10 Mar 2021 00:43:07 -0800 (PST)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id b17sm16163942pfp.136.2021.03.10.00.43.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Mar 2021 00:43:06 -0800 (PST)
Date: Wed, 10 Mar 2021 14:13:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20210310084304.d6b626clzj5rafvh@vireshk-i7>
References: <20210309080028.16284-1-liwang@redhat.com>
 <20210309094525.4ggmppfpvavsvjzl@vireshk-i7>
 <YEdhgvXg/mYkppz6@pevik>
 <20210309115623.ze5c7li7vuf65gvg@vireshk-i7>
 <CAEemH2esvVfy0YeCL2nXgj441XeBY7F+Y8MVEJ31nKRNPvjC+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2esvVfy0YeCL2nXgj441XeBY7F+Y8MVEJ31nKRNPvjC+g@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 10-03-21, 16:34, Li Wang wrote:
> But we can put the printing behind the 'gettimeofday+CLOCK_REALTIME'
> checking.
> Just similar to what I did in patch V1, is that your mean, Petr?
> 
> --- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> +++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> @@ -108,6 +108,9 @@ static void run(unsigned int i)
>                         if (tv->clock_gettime == my_gettimeofday && clks[i]
> != CLOCK_REALTIME)
>                                 continue;
> 
> +                       if (count == 10000)
> +                                tst_res(TINFO, "\t- %s", tv->desc);
> +
>                         ret = tv->clock_gettime(clks[i], tst_ts_get(&ts));
>                         if (ret) {
>                                 /*
> @@ -139,8 +142,8 @@ static void run(unsigned int i)
> 
>                         diff = end + slack - start;
>                         if (diff < 0) {
> -                               tst_res(TFAIL, "%s: Time travelled
> backwards (%d): %lld ns",
> -                                       tst_clock_name(clks[i]), j, diff);
> +                               tst_res(TFAIL, "%s(%s): Time travelled
> backwards (%d): %lld ns",
> +                                       tst_clock_name(clks[i]), tv->desc,
> j, diff);
>                                 return;
>                         }

I think it would be worth keeping it simple then and just print all
variants only once from setup(). Leave the special case of REALTIME
clock.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
