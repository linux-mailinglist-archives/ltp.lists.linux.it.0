Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D874422BC87
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 05:37:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4780D3C286F
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 05:37:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 32C7D3C05A1
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 05:37:40 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 514D96012CC
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 05:37:39 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id d1so3728647plr.8
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 20:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f95y0aVgS9HV0iOASJXfl08FIdY3N9vld22gEfMzEeo=;
 b=E7qObONLhKmAKdqQc4Usrnoh2SWq319OqkB1G8eJb2DHNB13wubVThN6V5akm9u+vx
 7sCb7Zsbp1lKbHUijLtvBPkRyeTtXVUphUqWgt/7QU88HyD207OJN8hgAVe5vER7QwTk
 bup88uHdCmINFMKQAvWw1hB4ReX+UqupuqasO/f/4mM8f/RThMf1wMMukZEHnljZtQis
 2seV+hfPIXQKvFISQAfwqBxUTcfhSuflmUjWuKM3P/SDU3zL4UhkIH7XeItoXm4Eh7QD
 Z6nY8ceq3D3YBu1xmUShW5ozdFZQI7gRDumlbaT4z3DOu22Zl++t/H6c4Tz0xGcLrMna
 I3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f95y0aVgS9HV0iOASJXfl08FIdY3N9vld22gEfMzEeo=;
 b=gDqjiR92vVkcoQ69rEpF1pqhDl/VDt3cnByAZ5+2G2ddEobGSHw2OMa295s+iGpGjA
 +BvqrDklkaEgQDgJszGexMgFsFrbE51L7US54kw4Csiytb3lDYaLKt2wXVKutm2QAmFY
 lebhh/72XwPsYbF2cSeviP4Dd2tUo7KaFZ5DctBog/NGZa/M2LBYSrAx6pR55RZ2de1x
 dQPu/YlvDU5Qq3QW+YAaAerzFegiL9Ip1yhbjQFrA8WF1kQY0JSMxnW2H6HPRMfyTOQO
 o0QMW8Ey8ZBxh9rpqFodouYiiqQ2V5yuPNXIKSIXvA/rkxndKABV6fOVlOmhTk/tAjYV
 4kZQ==
X-Gm-Message-State: AOAM530RTNH2UciAHXYZcPjybHYYzmDYIlpifYv9Wpg85r6R24O7Z2uy
 V+iN9+9FcSefsOViPWQOxUdxvg==
X-Google-Smtp-Source: ABdhPJyZeitzFI2TJcK3RndUulRKDa8+78TVrI/yVSSnmy/t17ZB81lKHhzYTD21st+b9O1Zc+gPWw==
X-Received: by 2002:a17:90a:de0c:: with SMTP id
 m12mr3491807pjv.228.1595561857731; 
 Thu, 23 Jul 2020 20:37:37 -0700 (PDT)
Received: from localhost ([182.77.116.224])
 by smtp.gmail.com with ESMTPSA id g26sm4412236pfq.205.2020.07.23.20.37.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 20:37:36 -0700 (PDT)
Date: Fri, 24 Jul 2020 09:07:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200724033732.gwzu2zdhdziwtbtz@vireshk-mac-ubuntu>
References: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
 <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
 <20200714142843.GA14905@yuki.lan>
 <d008820f-22d2-078d-3a62-f1fa20e6750b@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d008820f-22d2-078d-3a62-f1fa20e6750b@cn.fujitsu.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] syscalls/timer_settime01: Make sure the timer
 fires
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
Cc: ltp@lists.linux.it, Vincent Guittot <vincent.guittot@linaro.org>,
 arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On 23-07-20, 10:39, Yang Xu wrote:
> When tesing timer_settime01 on 3.10.0-1136.el7.x86_64, this case fails
> whether we use any type clock.
> 
> timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME) passed
> timer_settime01.c:164: FAIL: timer_gettime(CLOCK_BOOTTIME_ALARM) reported
> bad values (0: 678013000): SUCCESS (0)
> timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
> timer_settime01.c:164: FAIL: timer_gettime(CLOCK_REALTIME_ALARM) reported
> bad values (0: 358240000): SUCCESS (0)
> timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME_ALARM) passed
> timer_settime01.c:174: PASS: timer_settime(CLOCK_TAI) passed

Can you share the complete test log? I am not sure if only the _ALARM
cocks are failing or all. You are getting values in the order of
300-700 ms, while the max value can't be greater than 50 ms. So seems
like a kernel issue to me. Over that, both _ALARM type clocks weren't
supported before 3.11 and looks like your kernel version is 3.10.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
