Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4184C3B7F18
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 10:35:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C0E83C6C54
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 10:35:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6011F3C6C41
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 10:35:00 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 95130200C29
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 10:34:59 +0200 (CEST)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyVgQ-0006BE-Bq
 for ltp@lists.linux.it; Wed, 30 Jun 2021 08:34:58 +0000
Received: by mail-ed1-f71.google.com with SMTP id
 g14-20020a056402424eb02903954930851bso771268edb.0
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 01:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1IFtEhzs0Lv1y9+UgWa0DfCZGcuW1gInwvipY/SR0mg=;
 b=GGWOSflWYcsp4MYZFk3c9QQBFaiubVks/brHkH3ANhDa7Z7QH6XYZHnNZQfzpBG3W+
 lE5U+VM94r9pMKCAjax4qcf8FgAGD9gqssN2qXuIhiN/wHKUA7Vako7njzc94/Xe+i9C
 2kUVbffFWumin4LH2OhuCbpPKUDixfjnUl6kCNv2dCNwXsaZFA0jZ3qrj5ZmjZaWAGjH
 qgUpvSEpNJ+KAsb2E8Tv+AEEGnIk6+Fk0B/YTrIsD7HVAoZ8VwvmGqF1bFmcSuIha09J
 j/u53zPfItcqUCXa9+njCPzpghDobxDe8+brhfDZ/EvxWpNSTwFq/V+NMW9alDJfhemD
 xg1A==
X-Gm-Message-State: AOAM532vZ1U5BB46N7qyEYR9osr0gF0PzNc3fD7mF/Mhyq8gw08Bwq1E
 9YHs85dR2Wc3gOEUjGfS38JPAmCzvt8+QVdtQMebyhMR1vinJc9fQWwaR/3EvsMzWPHJYVflC5M
 3LIoGWZtr5HfExHvg4QUMnMStco6E
X-Received: by 2002:a05:6402:510d:: with SMTP id
 m13mr44656746edd.179.1625042098154; 
 Wed, 30 Jun 2021 01:34:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNgwxmBwrzLvr9noQ+vvLunox3/nAXTETv/38X874mVuhLyMIBpETi86RVWG3SYS6/SBEvBQ==
X-Received: by 2002:a05:6402:510d:: with SMTP id
 m13mr44656731edd.179.1625042097973; 
 Wed, 30 Jun 2021 01:34:57 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id gl26sm410271ejb.72.2021.06.30.01.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 01:34:57 -0700 (PDT)
To: Josef Bacik <josef@toxicpanda.com>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
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
 <57cfa398-8a33-06e2-dfcd-fa959c27ac47@toxicpanda.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <30d510db-df48-e499-6e46-bd84c85d4b41@canonical.com>
Date: Wed, 30 Jun 2021 10:34:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <57cfa398-8a33-06e2-dfcd-fa959c27ac47@toxicpanda.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 29/06/2021 20:32, Josef Bacik wrote:
> On 6/29/21 2:28 PM, Krzysztof Kozlowski wrote:
>> On 29/06/2021 20:06, Krzysztof Kozlowski wrote:
>>> Minor update - it's not only Azure's. AWS m5.8xlarge and m5.16xlarge (32
>>> and 64 cores) fail similarly. I'll try later also QEMU machines with
>>> different amount of CPUs.
>>>
>>
>> Test on QEMU machine with 31 CPUs passes. With 32 CPUs - failure as
>> reported.
>>
>> dmesg is empty - no error around this.
>>
>> Maybe something with per-cpu variables?
> 
> Ah yeah, so since you are further into this than I am, want to give my recent 
> batch of fixes a try?
> 
> https://github.com/josefbacik/linux/tree/delalloc-shrink
> 
> This might actually resolve the problems.  If not I'm getting one of our 64cpu 
> boxes setup to test this, I also couldn't reproduce it on my smaller local 
> machines.  Thanks,

I just gave ita try on v5.13 + merge of your branch and it fixes the
issue, at least on QEMU with 32 and 64 CPUs.

Would be good to find the exact commit fixing it to be sure it gets
backported to stables.


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
