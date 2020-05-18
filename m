Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 715611D71B0
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 09:22:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A450D3C4F50
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 09:22:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BBECD3C24E3
 for <ltp@lists.linux.it>; Mon, 18 May 2020 09:22:50 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EA3D2140121B
 for <ltp@lists.linux.it>; Mon, 18 May 2020 09:22:49 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id b12so3850322plz.13
 for <ltp@lists.linux.it>; Mon, 18 May 2020 00:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kY3H/MwzeYvEEPJVoyisskHZJHhgRBrg0ywygzegYko=;
 b=fKLEUd9lK/7+rKZ84gIoYSsSQatpUqCehtFcNk3sPPRa36jT7ej+cwQQdKYIhgijxw
 XElDiyKPlClE4LgHXXLsmLBZZ5NYBhaMRfY0Q8Ae6X5Km5xab89UCjETJMY0ypoY6mR2
 u8ilZFYJKcbAGZPRBJpQJYRYW9aAGpzxDmT6I06xaNXaoELcLNFKsBtm48fKCKVkKMeD
 QUfivi/+PlKTOqgUbc9fSo6bOObtoQNejM57+3qf8T0GlTSy2KUVCJ55vuwVe89vWGhB
 mP8cICsw5Y9MgVEqyITRhH4Ihr+TAQb4KB4v4PAPWJBck4NzFO2FBrWkNUQmMssN695X
 RTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kY3H/MwzeYvEEPJVoyisskHZJHhgRBrg0ywygzegYko=;
 b=S2kPNrJIdZgS236L77/LeGkV/dgwXyHN0/O+pDyQyPnJDht2jrkRMHEILW2K+Jf8/1
 X60VIk1rNB/x/xj3DQZWnyQ6ef4zeBD/ScR/iGe5twm97Lovah3m1BNCUVu+PSRY3kh3
 7q1jhN41NTh54nAec0jeN6VSw3yuZMU/KZ/deQqXgSQE8QTYqYEN9FfOqmtVyzw5bUNt
 MVcB0KnIUzSpW82qUpN4KUl57ByOXQys7xWAFBQDcktOUXi3dkK6xQoQBh/1LWUU/Xmk
 1p1RxmIxtmj6BYKGxoOHATGV36lyQkUhtOY8n+d4KIXIyuTpPd75WQdOosdhrOb8Omg6
 hy7g==
X-Gm-Message-State: AOAM530XrOGwBtMSSCQDgyYmUVTpPP/k1Gsi9vZCDFnC4QYEfW+09xTU
 RPUOLateX8GjAQA1QZkUcG8vPw==
X-Google-Smtp-Source: ABdhPJxh8SaOKZCvYFhX8sL+2tUGMGHZeFlYbT2w/nPI8Ivb5i5IK4m98kYoHnKAHWyX1sLY0nFXKA==
X-Received: by 2002:a17:902:9044:: with SMTP id
 w4mr15459607plz.83.1589786568219; 
 Mon, 18 May 2020 00:22:48 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id q16sm7158391pgm.91.2020.05.18.00.22.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 00:22:47 -0700 (PDT)
Date: Mon, 18 May 2020 12:52:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Vikas Kumar <vikas.kumar2@arm.com>
Message-ID: <20200518072245.hvqpspikfh2d3qpl@vireshk-i7>
References: <20200514172831.27854-1-vikas.kumar2@arm.com>
 <20200514172831.27854-2-vikas.kumar2@arm.com>
 <20200515040849.yu27rdihdih5wxc3@vireshk-i7>
 <b13403ce-b7c9-79f6-c303-97763e867020@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b13403ce-b7c9-79f6-c303-97763e867020@arm.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 1/1] syscall: Add io_uring test
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

On 18-05-20, 10:03, Vikas Kumar wrote:

You reply isn't readable at all Vikas. Please read the kernel
documentation on how the discussion happens over mailing lists and
about not doing top-posting, importance of ">" character during a
reply etc. Take help of some ARM friends who may have already done
that earlier.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
