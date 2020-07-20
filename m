Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6DA225C7C
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 12:16:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 595383C4E16
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 12:16:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 766183C0886
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 12:16:07 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 936221401A09
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 12:16:06 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id 1so8832652pfn.9
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=euB6Y6Ve7H2RKQakdy7VDcg5NDTlTfBMRHrtS8BNQ98=;
 b=oE+TicxBKnMNMLuJR+Ra10kFUpJtg78lTITrgICDJ2TScvRRMs4vTst5V05UQJ0KtK
 on9bqNniQLDUz5wF9mrcXRW/HVuK8VAHq/cuFlu8aZCiwcEBtBEnGBHGA/Xd8aB48Nc3
 Hxbkr5csLOvgyYNYPwxMNXZJqeYchsjYzpHs4rJv8IOTGh2wXTcgaCHPob2l1NVrAej0
 PSx2iVyG7N8WXZZQQwTOX+foE1sKdiUV/L3wCZQkFsML4CpC5/uNY1x1aSNDUNZrcn1l
 MPK7PNhErKh19fwqNXfYz7LFBJGcqbvzmyiocgR6PG3AATebLzJuUMgl1AJtmYRqjdli
 hZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=euB6Y6Ve7H2RKQakdy7VDcg5NDTlTfBMRHrtS8BNQ98=;
 b=lw0MHkmFCD0nrIKjN38EGcqkCqU7bVdECP1iZtRBklVjRdcQVdQjvtoFGaN4C6yXXz
 RKXFqHPsV8X4zhtDWX6NUpTfuaaYvMyImmbFBxXkTZl1YMF4qYJlc/IHdCHbzUAsHJQo
 Fme85SwbfcZvwyznKCUvv4g7L5sFVctMJM2g3zJIWdMi62v1zv4/tqfuSl6Q51GPUXa3
 02+xRTDMy/sK0rHepvyXsAD4hm8aNtSY/tXd3O4TxFDoekLoJb0AJTPLN4xzKeZuqiAe
 qYmS9GtPCFcVpjCSZoJTNcIbIl8BXoa2yQiPf/VE36NXHcCsx5oSsGxRTxwY0gu6GGPw
 kzLQ==
X-Gm-Message-State: AOAM531UkYbSMyCvkq5oWFXfwSATYw1LKWE8NcyJwRk8AHzIlSjDSHAj
 8v2VopkeBB7qv9XwV5NKJmelFNjOHeU=
X-Google-Smtp-Source: ABdhPJznNPTpgJO35rxeiXvhirPpKZ7HJRV3Zej/2R5C6gOfqyxoVGsfgzek51EkRhGQEqHH+vON9w==
X-Received: by 2002:a62:ce46:: with SMTP id y67mr17778651pfg.118.1595240164687; 
 Mon, 20 Jul 2020 03:16:04 -0700 (PDT)
Received: from localhost ([223.179.133.67])
 by smtp.gmail.com with ESMTPSA id h23sm16237250pfo.166.2020.07.20.03.16.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jul 2020 03:16:03 -0700 (PDT)
Date: Mon, 20 Jul 2020 15:45:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Message-ID: <20200720101543.txvvfa5m7sua3evv@vireshk-mac-ubuntu>
References: <cover.1594367611.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1594367611.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC 0/3] syscalls: Rearrange sigwait syscall tests
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

On 10-07-20, 13:31, Viresh Kumar wrote:
> Hi Cyril,
> 
> As suggested by you I have tried to rearrange stuff here and having some
> difficulty in getting rid of the last few build and runtime errors. And
> so sending this as RFC.
> 
> Problem 1: Build failure.
> ---------
> 
> This fails with the error:
> ltp/libs/libltpsigwait/sigwaitinfo01.c:53: undefined reference to `create_sig_proc'
> 
> create_sig_proc() is defined in lib/ and I am trying to use it in libs/.
> Somehow linking is failing here as there is no local user of the routine
> create_sig_proc() within lib/ directory. If I create a dummy user
> (https://pastebin.com/LiNukt1n) there, then the build passes.
> 
> I don't know how to properly fix this.
> 
> Problem 2: Runtime breakage.
> ---------
> 
> If I build it using the earlier hack then at runtime I have started to
> get following error while running the tests now, right after the first
> test passes:
> 
> tst_test.c:362: BROK: Child (14595) killed by signal SIGTERM
> 
> I don't really understand why this has started to come up now, while it
> didn't happen earlier at all.
> 
> This is rebased over the earlier series which is under review
> (specifically the following patch,
> [PATCH V7 10/19] syscalls/rt_sigtimedwait: Add support for time64 tests).

Ping!

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
