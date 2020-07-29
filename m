Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D701232152
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 17:13:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C03493C2680
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 17:13:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id CEA1A3C05A1
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 17:13:22 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B62C86014C9
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 17:11:58 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id t15so2167377pjq.5
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wbsMjdP8AkeCdbEzNjoz2vZVuxnskwdOxuD0uJHkWL4=;
 b=ZTJs1qd3bBnKYsKG1LuMMgsnXI7SU6V9psp78l+Em2GWDdADMgUIkJpusSAzc9tyqG
 qrhsBHuj9nEKOTvkbidZYPiyQaRKd2TRu1Rt+qVHSO860Y0DPtkr4uypAAulR+arwPUR
 L5bEs7XD/hGkGce7tFbDi8dAM7jEYLrcmJfUlFXrJ6JyxBrXaUSZD3sw4VzkQZXKVRcq
 qEsPmekiht4X7iwDGieHADLrjddq5siwBQVj1Eg4E3+mMvrJDSYPbVZJL6/ds5AjrUG7
 5eSE0hmKqGFretcyWTbkzpiDhvx/OD5jFcVr9QFaq3zvGm9aLGceSz8HWitxMIXrkRTi
 VYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wbsMjdP8AkeCdbEzNjoz2vZVuxnskwdOxuD0uJHkWL4=;
 b=mvdsF7122kzzCq6LSVAOtJpv1KkuuHZuj1VprRMogoof4hyMylmzoD3NcBP/0sf5DA
 9REX3HBQQ6NAYUy8dlHhweiupVm+s5GFbCPB1tJIsINhIRmlyLnDOFc+t5QVZTdOuCMc
 LgmuqeKA2S7R4UXW8OTXlrSNXNFrczgZItBAIcH9Kp0P81OoBI95T9he7GJujLh3CSJN
 EcA2WANN0ODMoAJEXnBzHYlnhZTaazQZsqgXwikqiAzgE2nRIPL3Fh2D3K9cX3uKKD+P
 CGqLpHYWaB+KRBNi8ZKezceNBsY1wK84LdmPZRIb051c0mzq36EF9wZekszqBrFKu1TN
 JGRg==
X-Gm-Message-State: AOAM531Jlsomoc2J56Uud29+bMg8Lj0PJkuFkrNzMViX1Ybt2O5L9/gU
 V2WmLPeXnJctsWY+KUNKca3bkg==
X-Google-Smtp-Source: ABdhPJwdIzEOpmrgzB3ijWlvwzJ9mmwSMvGIuy67TLyCek3rlWwbYByeHM1h3cma+yRwhw1vtMErZQ==
X-Received: by 2002:a17:90a:2045:: with SMTP id
 n63mr9803121pjc.112.1596035600237; 
 Wed, 29 Jul 2020 08:13:20 -0700 (PDT)
Received: from localhost ([106.215.77.228])
 by smtp.gmail.com with ESMTPSA id x15sm2758774pfr.208.2020.07.29.08.13.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 08:13:19 -0700 (PDT)
Date: Wed, 29 Jul 2020 20:43:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200729151317.evk2cphq7tclcww5@vireshk-mac-ubuntu>
References: <53c9ed8dc17ea6fa0b46502cd1c724a3a8539c8c.1595842740.git.viresh.kumar@linaro.org>
 <e964452fdb6c526a2cc61650573905e27adb83d5.1595842740.git.viresh.kumar@linaro.org>
 <20200729144054.GI7152@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729144054.GI7152@yuki.lan>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/2] libs: sigwait: Get rid of REPORT_SUCCESS()
 macro
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 29-07-20, 16:40, Cyril Hrubis wrote:
> Hi!
> Unfortunately half of this patch does not apply after the changes in the
> first one, can you please rebase?

I didn't see any issues with normal rebase of this patch over the other one, git
probably resolved issues itself.

I just now tried to apply this one with "git am -3" and it worked for me at
least (maybe git took some references from my tree).

But anyway, I will resend it now.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
