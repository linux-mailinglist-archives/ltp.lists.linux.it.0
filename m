Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC53B7FF4
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 11:28:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A8D453C86A5
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 11:28:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 61D613C0354
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 20:32:20 +0200 (CEST)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 863DB100053B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 20:32:19 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id z3so5583331qkl.4
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 11:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FdTAed2LSsBnzt5mppM7ptg5hTbGbhSZ1V8HyoAvOkg=;
 b=p4LxCNymyBtzGTN48VIjv5wsucwiQGUlrGyfEAYtdryNyX1VuRilWX0IH7v919zbW1
 hCDHX01SDCQolN4L5HVK3vJtA+VGpvaer5V0oCki282T7l9O/TJWIapCDZPjhAE3TRy4
 InPM43x/pEXuJcHqZ8CczhXKs09JS1elwlCsgHjKulLj8AnLlmiP0AJ35gjK0wMrFooN
 1gfIWPEUdVhRhj98Iuy08od821uAJYvM9D19LnX2CqbNCO3H4DSqKE5qFKnSf9UVsIXQ
 EL7r1ih98PxBm9Y8zRtaAMNOb/uw2Zqw5bSEGZfvihcYr6QBSdXVzNxU2eOmiCsNmK3C
 gqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FdTAed2LSsBnzt5mppM7ptg5hTbGbhSZ1V8HyoAvOkg=;
 b=LvsT2yTG0cY2hUNFl6bed00tONxSDnpR5Moz5JaOc7P/BtERWUjOllkyWBVX5z5ZaM
 PC50SMWxBPNUzCJKb5SThncTPcZh4IgU32OgKvdmQ7PcYBRPOjasZW7i3PyW/+jmnqJR
 vhlUxRNRKlGPTo1mdV5WZNVHn6fvZ/gnAxMYvHU1nDRsX4UkfuTxo3AVAdeUcTis+d09
 m8R9eRmo8ahRmeACgvula87AP4DJUQYONMJCUis0GJw2D9cW9Xp2FUgmvzHkmOaMRQap
 XV+SQszaQ1TcrgKgcgTFREYXTYsu9wThK1lMOn5CMaBL7k2DJFaTHbG5dmri01i+g2o/
 EXCg==
X-Gm-Message-State: AOAM5336WX4KfmkS/uPO1mDpdpINpgOD/x3yrEe4Qt/tmOUU8eGoZd/V
 QceZHA+8EvYFTE4ZqUB0ETzZdw==
X-Google-Smtp-Source: ABdhPJwimaCD8ZfgQbaVJoflCansSCyaQJZuRQzAm8t9OSjmgNJoCCGt7uRXohHJeygN2eo+zwX3dQ==
X-Received: by 2002:a37:ad02:: with SMTP id f2mr15664410qkm.357.1624991538273; 
 Tue, 29 Jun 2021 11:32:18 -0700 (PDT)
Received: from ?IPv6:2620:10d:c0a8:11c1::12d2? ([2620:10d:c091:480::1:98e8])
 by smtp.gmail.com with ESMTPSA id d136sm4242135qkc.110.2021.06.29.11.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 11:32:17 -0700 (PDT)
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "kernel-team@lists.ubuntu.com" <kernel-team@lists.ubuntu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>, Qu Wenruo <wqu@suse.com>,
 Filipe Manana <fdmanana@suse.com>
References: <a3b42abc-6996-ab06-ea9f-238e7c6f08d7@canonical.com>
 <124d7ead-6600-f369-7af1-a1bc27df135c@toxicpanda.com>
 <667133e5-44cb-8d95-c40a-12ac82f186f0@canonical.com>
 <0b6a502a-8db8-ef27-f48e-5001f351ef24@toxicpanda.com>
 <2576a472-1c99-889a-685c-a12bbfb08052@canonical.com>
 <9e2214b1-999d-90cf-a5c2-2dbb5a2eadd4@canonical.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <57cfa398-8a33-06e2-dfcd-fa959c27ac47@toxicpanda.com>
Date: Tue, 29 Jun 2021 14:32:15 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9e2214b1-999d-90cf-a5c2-2dbb5a2eadd4@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 30 Jun 2021 11:28:00 +0200
Subject: Re: [LTP] [BUG] btrfs potential failure on 32 core LTP test
 (fallocate05)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 6/29/21 2:28 PM, Krzysztof Kozlowski wrote:
> On 29/06/2021 20:06, Krzysztof Kozlowski wrote:
>> Minor update - it's not only Azure's. AWS m5.8xlarge and m5.16xlarge (32
>> and 64 cores) fail similarly. I'll try later also QEMU machines with
>> different amount of CPUs.
>>
> 
> Test on QEMU machine with 31 CPUs passes. With 32 CPUs - failure as
> reported.
> 
> dmesg is empty - no error around this.
> 
> Maybe something with per-cpu variables?

Ah yeah, so since you are further into this than I am, want to give my recent 
batch of fixes a try?

https://github.com/josefbacik/linux/tree/delalloc-shrink

This might actually resolve the problems.  If not I'm getting one of our 64cpu 
boxes setup to test this, I also couldn't reproduce it on my smaller local 
machines.  Thanks,

Josef


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
