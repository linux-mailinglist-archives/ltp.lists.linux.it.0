Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E0257804
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 13:15:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D7273C555B
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 13:15:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 53F933C02FA
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 13:15:00 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 951731A0174C
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 13:14:59 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id t11so2872965plr.5
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 04:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CEVOE+pwsXWRYYfIcYB7//gPooecYPVSq3wAS0Mgf1I=;
 b=FHp/kkUBKPzS0+cRPKxCR9WKffQdNM4FPPkqNv+ewBEKx3a6DnPoxnuHk3nxIG5hzI
 StTRllTpscgSTWglurC2p78PA8+9Mns7AI280M3Kb98Kor/oA1FUEFvOYqjkyybfmrvY
 pgjtxQw9pkPtqElzEVOBYWoPcXXES9/bG9JWm4x3psFg792x6R5I7Cc9e4gauez3Kqei
 yDaOi/y837EklJiiD3Do9eQDp3huXnncgC/hmna3DVXhI8LMcmW2y6U7GCqhhCqgkFGs
 1h7Qb3ov3xIbySE2AwsXZs8Pt8hZZ6DqWtgDPoDQ3klGkFFrfgBUGNr/dgYO4gmAyE1a
 2gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CEVOE+pwsXWRYYfIcYB7//gPooecYPVSq3wAS0Mgf1I=;
 b=WqfnBkVp+GzlWx7xpi2F7rDtPHbaWXpyhlPXe2vF1r2RAdOUpRfENUTm2XqsnA5aKw
 hoIdOuyapT5hOmMYmyMq6MjrOdhI34odkckx+Fj/XuS42qhlqArnzV/RiuhKQqvSLT62
 kY1ehaaIRV2AESCGc7FT00y7NvmmQjx/RHXfccqCMnHHduwujOXRq+A9Uq6wgH8N9ZuU
 2Agaa99ISWssj9mxdnR4XGlLiA4M95zGnEsg8vaQuOnlu/tIiczq8wGViWKZC+W8mgWe
 gYdmFaVQSKGzqookl8oQGXHu1pWPjyTeZfWneGcSgDgLmmGL44twgwqRPnSjqWFjY8JJ
 q1Ig==
X-Gm-Message-State: AOAM5320vvpSINAgQuk6kTWIRwK55Q21owKU/imCrsWtsRMJ1odioX0e
 B6NHVJZTUVsa9R0H8/dLvr6lar6IlpW0ng==
X-Google-Smtp-Source: ABdhPJwfgVojtxyY5PuSJNECn93uy0bFjsQhyrXD0Ic7bqKcu9iI6nX+AWc6djvjdJBhCI5skVgQ2g==
X-Received: by 2002:a17:90a:9382:: with SMTP id
 q2mr942844pjo.118.1598872497732; 
 Mon, 31 Aug 2020 04:14:57 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id n1sm2797247pfq.123.2020.08.31.04.14.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Aug 2020 04:14:57 -0700 (PDT)
Date: Mon, 31 Aug 2020 16:44:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Message-ID: <20200831111455.mdqzddghovvv2mvq@vireshk-i7>
References: <20200807132700.GB9851@yuki.lan>
 <b0d7642a89808c93e059beda06d8519361784686.1597839878.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0d7642a89808c93e059beda06d8519361784686.1597839878.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V9 1/2] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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

On 19-08-20, 17:57, Viresh Kumar wrote:
> This adds support for semtimedop() and its time64 variant to the
> existing semop() syscall tests.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V9:
> - Removed vDSO from comment
> - Add additional failure tests for EGAIN errors
> - Moved timeout configuration change to setup()
> - Test added for NULL timeout

Ping.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
