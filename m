Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E92B0936
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 16:59:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0B0F3C5FFF
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 16:59:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A54AF3C4FEF
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 16:59:18 +0100 (CET)
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CA65160102D
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 16:59:17 +0100 (CET)
Received: by mail-io1-xd42.google.com with SMTP id m9so6522083iox.10
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 07:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bpYaD/RKbCzyAbZxAQjufdftApCsyZEN40qiWlLJNUs=;
 b=QQbc2H3KSmRoCsrBq94OMdgtpj47aWHGw1yU5pktsESh+sw194Y0rinwlIOiK3wtY0
 P7O6OXFkVSk+Xk++dHipIVV97+tt54F0odH5G2u0uAJRyqEW59pt7pAVqldIZKuXEF2R
 FdUTIE26SN1wFiEmLMyo0bRBG8nqNzvZAcD7qxf7b1eejx0qjJKs/L6oWICCOf3NvD5r
 Wh8RLbvYmyLhJEDl491whZdUgXnNJ2ea6HFQeFf8WKt7FnMbCMPwpl42z29Syn5d/rAo
 jREjO6Sb3BDtmyD4Bg7A9mVZJs89swCcLFRrbRnbA68L2YDxSnI+1rTZMQgqEG7ZMXcM
 usGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bpYaD/RKbCzyAbZxAQjufdftApCsyZEN40qiWlLJNUs=;
 b=kre+/emCqpmpqwMrQWx7mmpPgf/MOvnC7Crfy49Vje+PXM5ncUmHFPkvTMRHXTCLWK
 KcC4w7mDeH9s9HJXiONwYovov76hqaIgTdg/1b96oQNiLZnTFo4nwRiwpioGittvRaHE
 mgCorviW6r6wpm1XX3X51zewUKuqCommf8DTsKHspyWyXIu3gGNyCOOWNQFHoqFU8JMN
 uDt/LBuMA1Ae0jUPiofFIymn3VSMySI94cjavaSAoWZLnJD4/usdr78q83oR01umpY9u
 acs6fdB2nsTRX0fH1lLC82CsNVKDMqWYEvy25gd/bjR4KufElXGrqwFMQc0piDnPIWsg
 l6tg==
X-Gm-Message-State: AOAM530HU0HNgQVngoPqmNDY9FSnL/8/qQJaA0KitRjm8MgiluZyCf3y
 +/iWe49/ycSuAQ0z81k1zIW8Fs7vXQW0Eg==
X-Google-Smtp-Source: ABdhPJwtjlLhAJTcQqOcZurQtr63fOLOH6itk4jvtBKj/IRUZVFpUQNLe/UN18rZHHFJfn+h5p4mkA==
X-Received: by 2002:a02:208:: with SMTP id 8mr254570jau.79.1605196756037;
 Thu, 12 Nov 2020 07:59:16 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id w12sm3138231ilo.63.2020.11.12.07.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 07:59:15 -0800 (PST)
To: Christoph Hellwig <hch@lst.de>, Petr Vorel <pvorel@suse.cz>
References: <20201111180846.21515-1-pvorel@suse.cz>
 <20201112144307.GA8377@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <9276a97c-3b71-ddb4-d027-6b184c8d86fa@kernel.dk>
Date: Thu, 12 Nov 2020 08:59:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112144307.GA8377@lst.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] loop: Fix occasional uevent drop
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
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>, Martijn Coenen <maco@android.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11/12/20 7:43 AM, Christoph Hellwig wrote:
> On Wed, Nov 11, 2020 at 07:08:46PM +0100, Petr Vorel wrote:
>> 716ad0986cbd caused to occasional drop of loop device uevent, which was
>> no longer triggered in loop_set_size() but in a different part of code.
>>
>> Bug is reproducible with LTP test uevent01 [1]:
>>
>> i=0; while true; do
>>     i=$((i+1)); echo "== $i =="
>>     lsmod |grep -q loop && rmmod -f loop
>>     ./uevent01 || break
>> done
>>
>> Put back triggering through code called in loop_set_size().
>>
>> Fix required to add yet another parameter to
>> set_capacity_revalidate_and_notify().
> 
> I don't like where this is heading, especially as I've rewritten the whole
> area pending inclusion for 5.11. I think the you want something like what
> I did in this three commits with a loop commit equivalent to the last
> commit for nbd:
> 
> http://git.infradead.org/users/hch/block.git/commitdiff/89348f9f510d77d0bf69994f096eb6b71199e0f4
> 
> http://git.infradead.org/users/hch/block.git/commitdiff/89348f9f510d77d0bf69994f096eb6b71199e0f4
> 
> Jens, maybe I should rebase things so that a version of that first
> commit can go into 5.10 and stable?

That's fine, already wasn't a huge fan of pulling in block-5.10. So let's
plan on fixing this for -rc4, and I'll rebase the 5.11 branches on top of
that.

-- 
Jens Axboe


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
