Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1A73D8CDC
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 13:38:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CD1E3C9050
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 13:38:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A2F513C6436
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 13:38:14 +0200 (CEST)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 237BD1A01144
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 13:38:14 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id h2so3337767lfu.4
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZaK2Rr6RiTqkscRyAZZXPoYKH+nBwe1JKMc+H0hl3Vs=;
 b=WPyQ+d3YLzFMqpKXrOETvrLscgE0e5ZnJ85ejU2erKRkLuuaVyYZWuB+UE993KdeA8
 hdUhSOccSpa8rrJ7q0dmgMVD1+B7X6NrsXdsYXOGirXPrc0ApYu4KmXA3RMaldEV3nwf
 b98VOGEuMBgW5Q3wI3uS1asQt05YoSgbrTI+an8MKd1ydnz6ZpJ3DzeovgDSqXvkuN6Q
 8unOYQVCxN7RkCWNyfm8HzTt6sgakw51WQkThfE7SZNjA90DTlVT7ElDfRSN30Lf8EBb
 jEJydkVGu30JUTrgiYYfCISP8al6vlE0uWslKBmsucRft0YO2Jxk4Bp0mrDM36IiRfyL
 SdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZaK2Rr6RiTqkscRyAZZXPoYKH+nBwe1JKMc+H0hl3Vs=;
 b=o5JrkqWzLBBbNtMf/oXuGmYfer1oiSVL5On5V/bX+Pz1ykDWUHhVMNc1FJA382uwjo
 pTVMwAmllnUENTn/0zgeD1GT1OuSrO72VpffZOYrSz9B2gqsdvEfR5T7po/LT8gBXTfw
 WLRX2vvTMGtTmR2uxas52CFN/xWBXmdPrWW+WAgiijY+PEWiIjUL/wKLiyUFNzUrvhNO
 xbzvEcGc8+OayhzMMUMRaLeZjer6IDK5luibbe+QAtp+XgGMuCEz6ZhG27CQCVimeOCB
 PybmVlDnCtMVlyEuVJUhlc3itSy8hiMt4zfglpD79HXO9j84hihnbADZ0w2H6KUtUUC2
 Q3lQ==
X-Gm-Message-State: AOAM53267xNEYUKMuqydEVu2Y2InCeFpYe0eWeGRE/2GirwDhFsi6dDx
 jSYS7a8z5xsd1MCcZCq2lVsIJBV7v3XV
X-Google-Smtp-Source: ABdhPJx6luKhKqE5rMZZCHKstUxtSkRRPUnqa8WCkoIpwjkj91+86WQAxB49FrrVUFoT2XpEhRS3Ww==
X-Received: by 2002:a05:6512:942:: with SMTP id
 u2mr19998317lft.501.1627472293348; 
 Wed, 28 Jul 2021 04:38:13 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id f14sm493123ljk.42.2021.07.28.04.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 04:38:13 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210722063422.18059-1-radoslav.kolev@suse.com>
 <YPkjE3KHHnhYklp/@pevik> <8b564e10-d87e-aaf0-03a4-1af347f02d4b@suse.com>
 <8cc8d5bc-b651-8e15-6389-69f36cf6bb49@bell-sw.com> <YP/ZxhYSZb/NusUs@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <c94e1459-07d5-ceb0-f113-9d3f57343983@bell-sw.com>
Date: Wed, 28 Jul 2021 14:38:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YP/ZxhYSZb/NusUs@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] lib/tst_test.sh: skip test if ip returns
 "Error: Unknown device type"
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
Cc: radosla.kolev@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 27.07.2021 13:02, Petr Vorel wrote:
> Hi Alexey, Radoslav,
> 
>> Hi Radoslav,
> 
>> On 27.07.2021 11:20, Radoslav Kolev wrote:
>>> On 7/22/21 10:49 AM, Petr Vorel wrote:
>>>> Hi Radoslav,
> 
>>>>> In network stress test groups there are tests expecting
>>>>> CONFIG_NET_IPVTI to be enabled in the kernel, and if it's not they
>>>>> fail. There is a check for VTI support in the ip utility, but not
>>>>> for the kernel. Skip these tests if vti device type is not known by
>>>>> the kernel.
>>>> LGTM.
>>>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
>>> Thanks for the review, Petr!
> 
>>> Alexey, please let me know if you have any comments.
> 
> 
> 
>> What about checking vti drivers in stress/ipsec/ipsec_lib.sh:tst_ipsec_setup_vti()
>> Similar to the checks for xfrm_user driver there...
> 
>> For example:
> 
>> tst_net_run -q "tst_check_drivers ip_vti ip6_vti" || \
>>     tst_brk TCONF "vti driver not available on lhost or rhost"
> 
> 
>> I think this should work for wireguard02 test as well.
> 
> The above LGTM, Radoslav, do you have time to look into it?
> Alexey, do we also accept this patch? IMHO this error should be mostly TCONF and
> it'd work for other possible drivers.
> 

Not sure if we really want to add the new patterns every time the
error message from ip changes. For example depending on the ip/libc
the error can be "Error: Unknown device type." or "RTNETLINK answers:
Not supported".

We could also save the error message in setup by passing the wrong
type and then compare it during the test:

no_dev_msg="$(ip link add ltp0 type ltp0 2>&1)"

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
