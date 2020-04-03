Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3724019D0D7
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 09:12:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C37F3C2F96
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 09:12:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 23B803C2F36
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 09:12:29 +0200 (CEST)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 35EA7601CEC
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 09:12:29 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id np9so2612883pjb.4
 for <ltp@lists.linux.it>; Fri, 03 Apr 2020 00:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RirNzfgt7tDbOVXlNKT75Qqx/JRjjoi1LhgjIGoarsU=;
 b=bxqolBjWJR40tU7KsD9V8tNiVqVURtsfDDIzrj9TmZOEZtLzVHcF62wFT91ELLG0pU
 ZlQrlTytgp2wPEm21/d/So5D/P28UnlRHtcNYUXPmd5ejKjeAprX8knnDPmmrne7DD05
 2kfieF5dGL9QXFCSG7eWjs+Id00y3Rin9ltKgsiZCJZHYBHPBc6N+6xgZVR/CEDNGdB7
 srHlynnRE6ZYoIdRX29BvkEt+YSOhfPGMaZdkEU0zIYE+aHIso6a8l7eULwV7eaTX7WX
 5jizqaTl4oPJKJjxL4FqGpIok/hnHpXbMaEJ+8DHZWCzbUdr03RyeecunQaxnGujYTEU
 9bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RirNzfgt7tDbOVXlNKT75Qqx/JRjjoi1LhgjIGoarsU=;
 b=JiV62XNlE8w3fpp7GcFt+2HULo/oa9RKbmOQX96B1au0H0x3+p1FEOaLujyYE0Caep
 pYBIfIQ8NJuBhPOsiheB+t986GZAspvKF5X6MDKqF/YJZb1Ne76j5n1sMExMKD9+0wxX
 EV6p0bcL8iCUd0OXVZVVcSHsC8YEDhl7PDOSy8w86fa/ijDFrwIZNYJ4DUMgYkgdKjAX
 eZ9vP2Te3PBI+dKhOi9hm54kjDUM7ww3q5496P2R24O4ONYeVxmO+6Zm1800JWsR7aZa
 nz1+ZxCvyeYwZ8oAwxaKRMRBHMUoMzKHo44IoJ6IvFiNjd0gxQ9DBbMnhLyOUK8LCPi4
 73zw==
X-Gm-Message-State: AGi0PuZeGpDOs6KzOmWZ7FEQlHls7Nidp7NNWcIJ0ybLGjHabRbTpt0/
 K6Ubb/8+1BPdxcfnhz1PTiQWvtaVsiE=
X-Google-Smtp-Source: APiQypLHVKANWE+lwggRHmEYUVd1oiGz1IHe8LqbonS60HkZYkA2VhnxDpPuPph+hHE6IcfoAhBeVw==
X-Received: by 2002:a17:902:7603:: with SMTP id
 k3mr6761246pll.100.1585897946995; 
 Fri, 03 Apr 2020 00:12:26 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id kb18sm5531405pjb.14.2020.04.03.00.12.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 00:12:26 -0700 (PDT)
Date: Fri, 3 Apr 2020 12:42:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: LTP List <ltp@lists.linux.it>
Message-ID: <20200403071223.4d2vcfwiuxnuxij6@vireshk-i7>
References: <CAKohpokaPiyGFkAXgG2oy_f5UGMCtsVUUAf4vA3Npa2ixAbNig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKohpokaPiyGFkAXgG2oy_f5UGMCtsVUUAf4vA3Npa2ixAbNig@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Query: Supporting time64 syscalls
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 23-03-20, 14:42, Viresh Kumar wrote:
> Hi guys,
> 
> I was looking to start working on the time64 syscalls
> (like clock_gettime64, timerfd_settime64, etc) and
> was looking for your suggestions on how to proceed on
> the same.
> 
> AFAIU, the only difference is that the argument is 64 bit now
> instead of 32 bit and so I don't think I should be adding new
> tests but reusing the existing ones for both 32 bit and 64 bit
> variants.

@Cyril/Petr,

Any suggestions on how should I go about these tests ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
