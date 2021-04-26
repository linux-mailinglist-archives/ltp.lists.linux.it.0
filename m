Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C5536AC9C
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 09:03:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D78A23C66D0
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 09:03:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 73F3F3C1DA6
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 09:03:24 +0200 (CEST)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7121C600750
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 09:03:24 +0200 (CEST)
Received: by mail-pg1-x52e.google.com with SMTP id f29so2335671pgm.8
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 00:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NXt2XCMAaF1WrwBsMXsHat0VZ2CQ+GllCbYYmj0DwhQ=;
 b=ArgOUgoEt4+Kr1RgoMspFPlUCo/Tyy3ZOpusVZsF7EaZdyi6NimQWLnDaNDfdCdgLs
 pbqYBdxczmwxaZ24rKWb0MqpiNFSfs6uu2YWWSKk8EJtnRM/JCjDc90xcJKytXKyxav8
 9jCs5HaRWIQjdYw12loFdoGZBbvvgkeJ9m651EkRGW29DrFAqne/bB1NrmtOHDqmfUr0
 1Vr7bL2hdIfB13O2+ZMsBAVCWgNZIgGxFIIOwu0G8NKUpBvvAh6OXV/pAhdtFWg8oZP0
 kJZFxqwTGpxkYC6AhXgGVeMlLqH5LCljYPrN70RsjiewKPrCk2Zb4KNOV7NSjLHRjNfN
 32Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NXt2XCMAaF1WrwBsMXsHat0VZ2CQ+GllCbYYmj0DwhQ=;
 b=jeWZ4XCmQEyGSsA90TX/CRSPbixNAE3lF3F7o/QB/bYQ+2LmDwFB1Cg2J8ZyANr3SC
 +34/6g/5BrTuGIAnT2PO84mxVY3oYa+4TRg+dJbu9VnLO1LDa6k9rowLLAF4SLGPIP8J
 QViHk8Rp450ATX7SfG30O44Mme8mzDbVS8W2gtF1ztMdFJ31lYQ8k2xjIk9SOClwSYhT
 Hs/lx7/ZeHH6X8B7KFiwYUP9lOTOR/cxoo1tBpWAST+qUMCi9VuvLtA/57bz9pw2gymO
 58bsv5LNf/7kBk/ZBtaxroX24GYhaEtTemzQFZyXI6xZ2ruDU8mBSBSZCfGbSWIw/gjO
 OpAQ==
X-Gm-Message-State: AOAM5304dp91nWuDW3tzeONs1aBMuWHnwKoyTeN1s70P4tWn7I7NpSyF
 iHiYgggaf9gq9wExOv2aVSX3Ekygyv+svA==
X-Google-Smtp-Source: ABdhPJyb6aMM0qd1JD3VcoKMImPxSqmD7B7UCjCLnAiE0xdBosLw10HgSLSO2dkDBJhjLStN9J6IuQ==
X-Received: by 2002:aa7:8a4e:0:b029:263:5a27:e867 with SMTP id
 n14-20020aa78a4e0000b02902635a27e867mr16145621pfa.55.1619420602632; 
 Mon, 26 Apr 2021 00:03:22 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id 195sm10062367pfy.194.2021.04.26.00.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 00:03:22 -0700 (PDT)
Date: Mon, 26 Apr 2021 12:33:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <20210426070320.iow3avu2pq22qled@vireshk-i7>
References: <20210422072609.9938-1-sujiaxun@uniontech.com>
 <YIZSzNd9uK8kItYb@pevik>
 <20210426055556.dmcogdykez2ddxn3@vireshk-i7>
 <YIZa4Ph81LmkEkLZ@pevik>
 <20210426062357.i72js3urkoofvzcj@vireshk-i7>
 <f06db611-5024-78d6-07e9-36115889b7a7@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f06db611-5024-78d6-07e9-36115889b7a7@uniontech.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix the 64-bit macro definition of mips
 architecture
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

On 26-04-21, 15:00, sujiaxun wrote:
> uos@uos-PC:~$ echo |gcc -dM -E - | grep -i arch
> #define _MIPS_ARCH "mips64r2"
> #define _MIPS_ARCH_MIPS64R2 1
> uos@uos-PC:~$ echo |gcc -dM -E - | grep -i mips64
> #define _MIPS_ISA _MIPS_ISA_MIPS64
> #define _MIPS_TUNE "mips64r2"
> #define _MIPS_TUNE_MIPS64R2 1
> #define _MIPS_ARCH "mips64r2"
> #define _MIPS_ARCH_MIPS64R2 1
> #define __mips64 1
> uos@uos-PC:~$ uname  -m
> mips64
> 
> The mips architecture gcc has no built-in __arch64__, only __mips64
> definitions. Of course, "__BITS_PER_LONG == 64" can also be used, but I
> think it is better to use __mips64 in the mips architecture.

Hmm, I will rather try to do what the kernel source code does, i.e.
use __BITS_PER_LONG here instead.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
