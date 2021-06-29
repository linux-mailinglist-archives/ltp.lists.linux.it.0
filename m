Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C54163B7727
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 19:25:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 829EA3C86AB
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 19:25:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F76F3C6CF1
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 19:25:09 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4F12263B7CB
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 19:25:09 +0200 (CEST)
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyHTw-0003NG-Eb
 for ltp@lists.linux.it; Tue, 29 Jun 2021 17:25:08 +0000
Received: by mail-ed1-f69.google.com with SMTP id
 ds1-20020a0564021cc1b02903956bf3b50cso3472181edb.8
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 10:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ri3WXGzuTojlL+9mSjxaDY7X42NrL+ai9PlKm2Tb+w4=;
 b=KB1Zlz625axm7MkmLzMqeNXuKFg8mL88biqxo/LDogJ7WhnGEBrKzfLnT0a3h/K1nx
 iWGFkGd4lxtjyTQNaur+GiYyamJ67lx+IjmLzuFsdxXmT0D3YQNZyJxzblsVjI+zNt1U
 /GXWT1WoWLNN3MgnL1o4aLFRrpHsEBoP91KHv7wFGQgcFJ97zJF+ukz+eAMMNlyWuFV2
 y+VaMHaTYTTLCxfclFIq1xbD9AvYwLyQZ3IToasiZAc4JjVCdzHKwTSgTwNeHQn/1qCq
 70rjB3T9GNOh7KWwpJD2cTMX9BV++p6LvTw28IwAMGpY9Lh7jn6d44mOIPSYaFlqhFAx
 cWTw==
X-Gm-Message-State: AOAM5338SN/W04p16Q69H+gvZdGGopFaNbLBK+6vGc1oglAR8NU63dhv
 cWZIh5sKndq1u3Y6kgc7dKi3Gvtu6X0rM1+7qYs4AnVrJKelpJY5NnGarut2Oc1HNUaxXWx2ys+
 0tFLf7whLDFCNtD3QQopYAXFa2HnZ
X-Received: by 2002:a05:6402:31a9:: with SMTP id
 dj9mr41493365edb.164.1624987508254; 
 Tue, 29 Jun 2021 10:25:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU/YhwLaYMTGQNMSd2pgQJxlfGs1UWubtAp8nzGtPKda2VM7Jpw2ZllP8AvwmGwX6cwntukw==
X-Received: by 2002:a05:6402:31a9:: with SMTP id
 dj9mr41493349edb.164.1624987508141; 
 Tue, 29 Jun 2021 10:25:08 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n2sm11450840edi.32.2021.06.29.10.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 10:25:07 -0700 (PDT)
To: Josef Bacik <josef@toxicpanda.com>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "kernel-team@lists.ubuntu.com" <kernel-team@lists.ubuntu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>, Qu Wenruo <wqu@suse.com>,
 Filipe Manana <fdmanana@suse.com>
References: <a3b42abc-6996-ab06-ea9f-238e7c6f08d7@canonical.com>
 <e4c71c01-ed70-10a6-be4d-11966d1fcb75@toxicpanda.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b5c6779b-f11d-661e-18c5-569a07f6fd8e@canonical.com>
Date: Tue, 29 Jun 2021 19:25:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e4c71c01-ed70-10a6-be4d-11966d1fcb75@toxicpanda.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

On 29/06/2021 19:20, Josef Bacik wrote:
> On 6/29/21 1:00 PM, Krzysztof Kozlowski wrote:
>> Dear BTRFS folks,
>>
>> I am hitting a potential regression of btrfs, visible only with
>> fallocate05 test from LTP (Linux Test Project) only on 32+ core Azure
>> instances (x86_64).
>>
>> Tested:
>> v5.8 (Ubuntu with our stable patches): PASS
>> v5.11 (Ubuntu with our stable patches): FAIL
>> v5.13 mainline: FAIL
>>
>> PASS means test passes on all instances
>> FAIL means test passes on other instance types (e.g. 4 or 16 core) but
>> fails on 32 and 64 core instances (did not test higher),
>> e.g.: Standard_F32s_v2, Standard_F64s_v2, Standard_D32s_v3,
>> Standard_E32s_v3
>>
>> Reproduction steps:
>> git clone https://github.com/linux-test-project/ltp.git
>> cd ltp
>> ./build.sh && make install -j8
>> cd ../ltp-install
>> sudo ./runltp -f syscalls -s fallocate05
>>
> 
> This thing keeps trying to test ext2, how do I make it only test btrfs?  Thanks,

It tests all available file systems, just wait till it gets to btrfs. I
don't know how to limit it only to one file system.


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
