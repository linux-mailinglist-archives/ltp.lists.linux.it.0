Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2992948D0
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 09:22:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 548D13C319D
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 09:22:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 32D143C25E9
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 09:22:28 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7F67D600902
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 09:22:27 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id a200so942744pfa.10
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 00:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DieNVh9dJ7W0+IhdpXN9FTxh6tpb2Qp9GPzfCcsW/cQ=;
 b=KhyayeQslQkx/i/2Vk6DX1hz8bzRHti4kQuHjTYMXhyO3un4+cHrrqdmb1y3ZIrlPD
 caTY+nIlkTSp0czgYxBd+aucyBweoRHf5mGEY2xhl9lPtt9cyHs8G//PiMSxZSbdZH1o
 2CuXyzErnXJD91lxiHTTdGLsFit6U3S/AL6CBbcTe7HLlTjzdTu6CXo8aohmCaVexxvP
 keeiOQ735ossVj2awla8jzLW7kg5V7e8sCKrHkWAje/FsF8raBg3XzDoPiJTHsEyAJaD
 ocCUPXJ9wqcXtuduz1Bd4zCzOVStnmWP6SVasp+nNST5wFy4jeM79GyxG16gxdWdtS47
 bOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DieNVh9dJ7W0+IhdpXN9FTxh6tpb2Qp9GPzfCcsW/cQ=;
 b=RfXn7DQpqkLKndab8IdRFACE92aFlZIpuHDmKX0/S0ed/gjkdYmXjJ+nOw15ID0+X4
 rKs1l+XargXGlncwDcMx02rIHiwSEWMYeY83hyPTJF8XCLkHB0/U+JzBLyJH5KBm3KTy
 rIONQ2+bGVGGNPkULV+LtuoujnBi43iOxHCayG9xTomO//ML/H0cQXkwe0RSSG/+tBSZ
 f0JN7NwnuRgMFTYtIP98/glT0/UM9IF7KVSRq422RmyQfAFBAyP1C4SStIw8ANJXdGoj
 +5SbNJ9cjgcd4BdrJDzQ2t37CqT0aqS2mN3rQ6Ck3fX5oaxx2aGzowIlpKP481PC2BY/
 7Jxw==
X-Gm-Message-State: AOAM533WsMJzwRiL5p0UVo8T43TL1A0PU3R6gshSqRbemWNgd7bhOQce
 zSljtppgd7pHwkUqpbGATFkpPxGqIdYDHA==
X-Google-Smtp-Source: ABdhPJxROYUfmrJ/mqWenu/7cCAMurIeGMfn4M3gePekIjDzlZ5Ch7bWeb8rRRpAYxhwyx9MqgqGBw==
X-Received: by 2002:a62:c1c5:0:b029:155:2a10:504f with SMTP id
 i188-20020a62c1c50000b02901552a10504fmr2142013pfg.13.1603264945723; 
 Wed, 21 Oct 2020 00:22:25 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id g85sm1171236pfb.4.2020.10.21.00.22.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Oct 2020 00:22:24 -0700 (PDT)
Date: Wed, 21 Oct 2020 12:52:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Message-ID: <20201021072222.c47cnqee2mesdzcs@vireshk-i7>
References: <cover.1600252542.git.viresh.kumar@linaro.org>
 <aea25607851ab94a0cc69ea3d7213e47d1d6c94e.1600252542.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aea25607851ab94a0cc69ea3d7213e47d1d6c94e.1600252542.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 17/17] futex: Move variants struct definition
 to common header
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 16-09-20, 16:08, Viresh Kumar wrote:
> Use a single definition of the structure and move it to a common place.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .../kernel/syscalls/futex/futex_cmp_requeue01.c    | 12 ++++--------
>  .../kernel/syscalls/futex/futex_cmp_requeue02.c    |  9 +++------
>  testcases/kernel/syscalls/futex/futex_wait01.c     | 10 +++-------
>  testcases/kernel/syscalls/futex/futex_wait02.c     | 11 ++++-------
>  testcases/kernel/syscalls/futex/futex_wait03.c     | 11 ++++-------
>  testcases/kernel/syscalls/futex/futex_wait04.c     | 10 +++-------
>  .../kernel/syscalls/futex/futex_wait_bitset01.c    | 11 +++--------
>  testcases/kernel/syscalls/futex/futex_wake01.c     |  9 +++------
>  testcases/kernel/syscalls/futex/futex_wake02.c     | 11 ++++-------
>  testcases/kernel/syscalls/futex/futex_wake03.c     | 13 +++++--------
>  testcases/kernel/syscalls/futex/futex_wake04.c     | 14 +++++---------
>  testcases/kernel/syscalls/futex/futextest.h        |  7 +++++++
>  12 files changed, 48 insertions(+), 80 deletions(-)

Cyril, this one is pending too I believe.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
