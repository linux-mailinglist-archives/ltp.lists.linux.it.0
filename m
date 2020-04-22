Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8ED1B35ED
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 06:07:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B2233C29B9
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 06:07:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 455903C29B9
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 06:07:33 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B6D97600772
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 06:07:30 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id w20so415126pll.4
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 21:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4/hYeXDQ8dO7J6M0h50+VdwjDCoXUOugk1NU12fbeaE=;
 b=DVob4MGVcAftoHL4nJwjgXEqqkjgBm/CSswENBa54ienhU/3cHnaP5G6gGhN3lxpAV
 VTxgiDdnRShzcPPjBe6xNVr3zmbQ/wcQU9xtDdYHg+l6U19ZbrtLQTRam+7EGaPhjCh2
 zf2P8STzGmrd/HxDUrAhetEr2eKlfzJL/uca84Xr4UjdLcTFz0Q0TVqCQ/XhcCD07xQd
 D0YS9yEpm92Y924VF9qgue+0Mju1EkgYYHleaQkzGelrDrkuVPeSoVseBVCpakCcAuAc
 aC5MOJli1LhrmGnyRLGV+isM3JV20voTiGSU4x6iCNvnPj8xAypjJQeTcvgmxWvwGfiU
 zoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4/hYeXDQ8dO7J6M0h50+VdwjDCoXUOugk1NU12fbeaE=;
 b=mxNx4i+uyx6PEv8B6YKUjqWlmeXi3nr3FPb0PwZCtwdG7L1uA5IqOnzgbRMVtZgt+g
 cdcShtP7qgZSLgr9kwEmacaL/r/OytKaW3NM2NC2DsDHdZNy1AD129tLM3VHfc/bt3Qz
 PsUXZ5X6OWMV2hkI4YLjorl3QNeQS1GLWNpa7Z8uq3RC6WCrRNE3PWYk/6jKB7rmfQa3
 L9cfolI8JSiP5j7lExN4X9bk/1AsS8XyGLKhJcNF5HyBro8jQU6aVsMWfRF3w2uZua7b
 B281fYNaURvsIUa3zuOJbC6EflrAW3CxWY8Vkdwg6c37aWF7lk10CnU+1WWDVtj+YwYc
 uYeQ==
X-Gm-Message-State: AGi0PuZVH0D2HaHxKZnOHYr3aoepKU5XXYvHiN23z+pNl9FmP0w0gC2q
 G+1X6xoEqXo5vtX0MUbc0mxEaQ==
X-Google-Smtp-Source: APiQypITmYLqZ3kXHxUMsb8BWPXx6xJugkfRukyhCXIe558knBFTXIQKxlAMD0lzRYl73IaXBvGyTw==
X-Received: by 2002:a17:902:fe87:: with SMTP id
 x7mr24893732plm.282.1587528450790; 
 Tue, 21 Apr 2020 21:07:30 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id x66sm4028534pfb.173.2020.04.21.21.07.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Apr 2020 21:07:29 -0700 (PDT)
Date: Wed, 22 Apr 2020 09:37:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200422040727.xuwjiymdvsaa5swq@vireshk-i7>
References: <cover.1587033556.git.viresh.kumar@linaro.org>
 <08a307591b531593bbaa5b1e8a4c841e80493937.1587033556.git.viresh.kumar@linaro.org>
 <20200421154006.GA14036@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421154006.GA14036@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 1/2] tst_timer: Add support for kernel's 64 bit
 timespec
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

On 21-04-20, 17:40, Cyril Hrubis wrote:
> Hi!
> I've cleaned up and simplified these changes + wrote a simple test and
> pushed the result, thanks a lot for your effors.
> 
> Can you please rebase the test changes on the top of these changes? It
> should be merely cosmetical, function names have changes etc.

Thanks for the changes, they look much better now :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
