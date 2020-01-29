Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0501214C423
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 01:47:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACA7A3C2476
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 01:46:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CFBC83C245A
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 01:46:56 +0100 (CET)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0B0C81A00927
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 01:46:55 +0100 (CET)
Received: by mail-pg1-x532.google.com with SMTP id k3so7922625pgc.3
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 16:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pclF3T8tO4JbxCUnb9jTgSXGCpFNwoMu2UeZPkyxwHo=;
 b=l24obR19vANe7q67bYCPYjUv3oXC3qjVLmJHbv2F+l9Xsaor6Nj3gTnR6snHSF8Hup
 QwvNulboFzT6PIJQbvaumzrbF5BHgQKydW6+19ieKX7F6XUWu5ovhidHYUUFNK9O4m9c
 J06JRMgOOTXuYZ/Ygfya8phxo78tXxizJ0RwaAp7reBrfiWnqIl9xz504pR2sK/sc3Dr
 nnMFGqXpoLVWbOYTQRefy2C72zZ5YtGezQ1CMkZasR6HPbQiexyPF4HVSyE9pQJmbarI
 kaNiADEAyGiPG+3j8myFTITEf7kWHJ1Ei6o/wWJyC1bAL0LS9/hZgd7pWgHpkTkRY6Am
 rtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pclF3T8tO4JbxCUnb9jTgSXGCpFNwoMu2UeZPkyxwHo=;
 b=P+apeAoM+zgxvkdJHESJabEmy1s/h3ssPpCOS2kv5nlLqV02OhbKiygPJHY/dbJFxO
 BMvjEwbOCe3K5jIb8+wElC0TvA9ZgXCrHwBXM2gv19XMODl52aqkTxO4yWLtZPOhASFJ
 eo1feUu/f/U8nAU2RbBw5ob40n8FQRC4LwjJV1PBy6rkx81D5V9Dj9XHwMBkmUdryTDl
 8gZKjWKw4KXNMFTFIauueGeABGVuYnOAgtSqeQo0hYhtQNQbg+4f8yz+PAkgmBSpE8ol
 e+AC8MT5hpd/FHvpVt21yCJ+EyhK5Gg5+xihf+FHTdyUn2ihUGeyaFlEIs4GezOyQVru
 PzNg==
X-Gm-Message-State: APjAAAXeJhTBbWMF2x4gjJSsh3Urba2ik3N3IDLoiO6rN5AeHDdGHjCz
 l+3DSnU80pnAx8sywqgCjNd3ew==
X-Google-Smtp-Source: APXvYqycCrZLdM9533PTPZhAZLsSuz344aBBAqE0O6jqFCwMsR5n9EvMJG7mZrILubBK21pd3MOVMQ==
X-Received: by 2002:a63:7c55:: with SMTP id l21mr27942148pgn.57.1580258814409; 
 Tue, 28 Jan 2020 16:46:54 -0800 (PST)
Received: from localhost ([122.172.141.204])
 by smtp.gmail.com with ESMTPSA id l1sm91905pjb.28.2020.01.28.16.46.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jan 2020 16:46:53 -0800 (PST)
Date: Wed, 29 Jan 2020 06:16:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200129004651.pdwhyxnnwluxewb6@vireshk-i7>
References: <2d23f3a542bbd04179aba828e28d37f5c7be7b45.1579859350.git.viresh.kumar@linaro.org>
 <cc9d0f47db41cad97c590cf7b58e8d662a437a91.1580180304.git.viresh.kumar@linaro.org>
 <20200128134037.GB26365@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128134037.GB26365@rei>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 2/2] syscalls/io_pgetevents: New tests
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

On 28-01-20, 14:40, Cyril Hrubis wrote:
> Hi!
> Pushed with one minor adjustement, thanks.
> 
> I've removed the tst_test.h include from the lapi header and put it into
> the two test sources. Since that is the main header the tests should
> include it's better when they include it explicitely.

That was a very intentional change I kept because the header should
also take care of its dependencies. An earlier version was using few
tst_syscall() calls in lapi header and so it should have directly
included tst_test.h file, which I did.

But the same got removed in the latest version and so the same isn't
required. Though changing the order of lapi header and tst_test.h in
the io_pgetevents0*.c files still generate compilation errors as
definition of syscall() isn't found as well and the header should now
explicitly include <unistd.h>.

I have a question now :)

In the pidfd_open() lapi header I used tst_syscall() and in
io_pgetevents() lapi header I used syscall(). Should I use
tst_syscall() in both of them ? If yes, then I will include tst_test.h
as well in both of them and send you a patch.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
