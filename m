Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2EF3B7FF5
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 11:29:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DC8F3C86AA
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 11:29:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D06223C1A2B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 22:14:47 +0200 (CEST)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E3F6B1000544
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 22:14:46 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id j14so2034624qvu.6
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 13:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uvaby5gvroAX5HC+y94a4O9K04hquk3bJ0y+KPQxC60=;
 b=QOfJ1i6doLCaLKvWd7QE9NcumeGgRhUUqOsGSH37yiiZvQQeBlo+twAHzgkC/+xR7G
 6Gg9pFiJhN1lWfpjA2zS3jC+D6wkGR9bfz1jquysNgTuoGXVLVahVI1FVAcB1VxBjV39
 t6577/bHE6eEfg+R9ulGJnpOWWrdmLpbmi9eS7TnD6GwJXCHTzCfRHKrhX2WKFo0SGzV
 yD5Urp7YBqb2aYcMX/Rw/R7k74UByXC6DXvtlpt6pluEbX4EGYahLBoChaUMfn+R8HDA
 yPRQNBfJ6HD/6BgKEYC3L1lB9xORbDL9RPu6KBv4uzViTDFbaVVZAf8r0w2VZ6M+O3xV
 BC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uvaby5gvroAX5HC+y94a4O9K04hquk3bJ0y+KPQxC60=;
 b=D9wmzFnkVSpWckI69lB3hiozYsheffCiWcNkBvdAkeiCMdSUO3AC0fCTE6mOchZx9o
 d3zvlwMQgWw8FUe6TdRWIvTOm47LYVpmI7nVBO+LgTW1imTXRTuL1ODEk8QqvvKy3Yfw
 HobJpsMpMNkOvBVmGPG6y3g9Qe1JrOecDZUO+nP/RLRkTv31GC12w8PCgwQ++HbnkkSA
 6d/64GBtA/CYJchxRIDGqLe42htHTFiyWgQRu1Hzcfay+Osn+m7LpsUhK40p6JgrPpq0
 ZSeybygUaf9tfYXPqVCaSjdiKx3SWtSWsx5fHuu81d3q4Rdd23tovTvQV+InwwMqvUtC
 RGCg==
X-Gm-Message-State: AOAM533uH3W2fU6rRA1dnO8UxkeaZX9xVQ/kRoTTJNt8RmyMpsQGf6X2
 WodG0RghY2yW8OgeyvrMr906vT22LG5xLg==
X-Google-Smtp-Source: ABdhPJypSBP2VAgao4SXGRkrO8wNKGE5V/NO4blik1cOk9WCQLNz/7YlzWaQ8Zkw6IZ3ZZ9yUrNTXg==
X-Received: by 2002:ad4:4d85:: with SMTP id cv5mr17887549qvb.33.1624997685578; 
 Tue, 29 Jun 2021 13:14:45 -0700 (PDT)
Received: from ?IPv6:2620:10d:c0a8:11c1::12d2? ([2620:10d:c091:480::1:1f64])
 by smtp.gmail.com with ESMTPSA id o200sm10300043qke.105.2021.06.29.13.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 13:14:45 -0700 (PDT)
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
Message-ID: <62d1df14-7ee5-8ff4-5676-cf98cdd966df@toxicpanda.com>
Date: Tue, 29 Jun 2021 16:14:43 -0400
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
> 

Can I get y'alls .config?  I ran it on one of my 80cpu boxes and it didn't 
reproduce on my new code or on 5.12.  Thanks,

Josef

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
