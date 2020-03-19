Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB8C18BB9D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 16:51:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E1C73C545D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 16:51:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5D9053C5455
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 16:51:07 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 77B336010B4
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 16:51:06 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id c19so1621680pfo.13
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7v8cnlvdtkSqg37Li3Y594zMg+CLPZF85MopUvTGRNE=;
 b=mjRAFAvdMp67vEOFLswOL8NwR3RKkg8CgE2w334wiRKMj/JE+uGYITWqN0t+pZjqmw
 7zrai9FpDb8TIiBuccqD4c67dRjxu0swCgibz0JfpmD8MIpmq3cnfxOQ7W9EBtIrhZnq
 +MNBmICaOCRYsmQH5e5U3OZQ2ZEl87nw6M5a1km8BQMP60YSpFFI2FghAM+V+Cv9bTsA
 fNFdZHfkQyRhmQvJ4GrChYIf/r3fRnpRZTjlw6zNDNPQUGBFdz82Vz9+dbqq0zU7WELC
 nIzamCq4+Sh1Hd2EWIzvqF6bHPK7z+d4bcjIz4vR9O22Ci7JJyhjORRbEamt8MaqcLKx
 ij/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7v8cnlvdtkSqg37Li3Y594zMg+CLPZF85MopUvTGRNE=;
 b=dplWtFSWz5tBHf/gqGEz/WbY8n9P/0dQ/dIbapppRJiBrDYLr/2HFDFCn2cXLH9lZU
 czJU2f3fnKUicBF9gAlTbQaCtLIvauFPU8sq2/Uo9jadCZaQr/uNidtCGwoYwtl2dHyY
 AcmiVHCr4L0g57jtC3iFNg6G85Ma2KOihLwbj47UWegjWacqsVOjRxn3Z+GSIENWSqdt
 4wyndpOQHG9uewMI+CEd9zN4lzok5mZq0oJLIGz9lgRWQzFx26xXxrVx7/7oOwk4kaC/
 amiBv+jyVhN6YEEgJYLw31dyWOmpO0qBfiSUHCPSFL6ReO0X9MXMO/XzXp5F2tmBEgVA
 iMKA==
X-Gm-Message-State: ANhLgQ3MH+xzLi+vaue46EIhJ6GfdGiceIWC9P3Pf+0ksO3YewPvCNpV
 tUqPmkxhcbgI6I4obtTkvtfcc48ZGMA=
X-Google-Smtp-Source: ADFU+vuxPvFLF/0/8h4psJmptSPRcznqt9RAe4O+70UzQfO73aVqqEEH8Bak8DHj7fdJnayUjOVbWw==
X-Received: by 2002:a63:e74b:: with SMTP id j11mr2671306pgk.145.1584633065044; 
 Thu, 19 Mar 2020 08:51:05 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id m68sm4666979pjb.0.2020.03.19.08.51.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 08:51:04 -0700 (PDT)
Date: Thu, 19 Mar 2020 21:21:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200319155101.4vebj66v7vbv3x6h@vireshk-i7>
References: <cover.1584618969.git.viresh.kumar@linaro.org>
 <c64b9c05053d500a95cc920e332fa229085217b6.1584618969.git.viresh.kumar@linaro.org>
 <20200319230111.GC29386@yuki.lan>
 <20200319151956.3rwix5oint6cmt4f@vireshk-i7>
 <20200319232426.GD29386@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319232426.GD29386@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/2] syscalls/clone3: New tests
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

On 20-03-20, 00:24, Cyril Hrubis wrote:
> Huh? All that we have to is to move the code from the child_rx_signal()
> to the do_child() here, the child would setup a handler and call
> pause(), then it checks if correct values have been stored to a global
> varibles. And the same for the parent, the point is that we should do a
> minimal amount of work in the handler itself.
> 
> The problem here is that tst_res() writes to std streams, that have
> locks, so if we happen to get a signal while something writes there as
> well, we deadlock. Also printf()-like functions may call malloc, which
> has locks and may deadlock in the same way. It's unlikely that it will
> ever happen in this test, but that does not excuse us...

Ahh, I somehow read that as you are asking me to do all TPASS, TFAIL
thing in the run() call instead and so went into sharing between
parent child. Sorry about that.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
