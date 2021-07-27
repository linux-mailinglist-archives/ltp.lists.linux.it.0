Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33A3D7165
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 10:44:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77DD33C910A
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 10:44:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A30D93C653D
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 10:44:28 +0200 (CEST)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DBFD8600845
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 10:44:27 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id m9so14908942ljp.7
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=16xtV5rrXtFduEHA2VsHT9sy/6E0MZpmBscsPUCJkPo=;
 b=1s/U+U4y72GP8Xxd3S/h74wazTWBXDqxb9Ajpaf5C3Ex7D4kJQAVPnm/l4miELMh+Q
 EuVpiZ31jJWR0Xpkqfb0dECSHEd+dZR5v61OLhmMVAK4FYMYz7L9lAYvT33D/khyIQyu
 IWvpsuvCLmg8XRjGbOr1selyuMVgjGxVpTRNTrGQF/DuUvpTokPpE4/QlJr0F1AKDOLm
 giTk5IrVpoeHqCzLx3Y58oa8bW2+hSQ07WVYx2V0WI0sxnZTP0xqEJqkSogrPuL8mTw8
 6NkBWUaphEcpxbcQr/mJ8B6A4zV61sDwFkbIclYsw8gJuOuNSCarTi1jwvQKfGOMm7C+
 VcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=16xtV5rrXtFduEHA2VsHT9sy/6E0MZpmBscsPUCJkPo=;
 b=JFLtAqEA/F1kGSMyxmzfynA73npKK+238qzxeXXPQsEzjZ3QKyfxorWiEts/HB4N08
 zueq5K0R3XjnZZlKcIwZuQ1QULzI0pn4FwhlKfWFrhKxb6ORMDXuJQOKdV4t1IUv0S7J
 R4mv2smz0+LfdpOgbNmAkADDTWtQL7zxlAq00FJR7oi68YksU0KnxKjNlouVYLdr7Zy3
 +8QneqRZL6/Tc0vGrKtauxQIGre78ZVzJyE9ex1vdX3TMM/u2kBu0cyOua+O1FQzdLbY
 aeH0tYOi5PxToogFnZV06dCKutz7cp8bHxdw2cft9lO3p8d+4fIYev0KwX7/w3MXc4C7
 QEaQ==
X-Gm-Message-State: AOAM533wJTEPwnIsIqiGmyex03lKm1HsHnet2qdvICL60rWj/z/q+7np
 m+TPRS2J4WlY4akOddFDp23bKnB3qMTL
X-Google-Smtp-Source: ABdhPJyf+4z9HJ1TcLMH2FOlMa4Vka8N4AjxOywvillUbxjK7x53GMvtyHReiF5QbDkk87HVDu7ZRQ==
X-Received: by 2002:a2e:8547:: with SMTP id u7mr14508497ljj.26.1627375467056; 
 Tue, 27 Jul 2021 01:44:27 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id s12sm213943ljg.60.2021.07.27.01.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 01:44:26 -0700 (PDT)
To: Radoslav Kolev <radoslav.kolev@suse.com>, Petr Vorel <pvorel@suse.cz>
References: <20210722063422.18059-1-radoslav.kolev@suse.com>
 <YPkjE3KHHnhYklp/@pevik> <8b564e10-d87e-aaf0-03a4-1af347f02d4b@suse.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <8cc8d5bc-b651-8e15-6389-69f36cf6bb49@bell-sw.com>
Date: Tue, 27 Jul 2021 11:44:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8b564e10-d87e-aaf0-03a4-1af347f02d4b@suse.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

Hi Radoslav,
On 27.07.2021 11:20, Radoslav Kolev wrote:
> On 7/22/21 10:49 AM, Petr Vorel wrote:
>> Hi Radoslav,
>>
>>> In network stress test groups there are tests expecting
>>> CONFIG_NET_IPVTI to be enabled in the kernel, and if it's not they
>>> fail. There is a check for VTI support in the ip utility, but not
>>> for the kernel. Skip these tests if vti device type is not known by
>>> the kernel.
>> LGTM.
>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Thanks for the review, Petr!
> 
> Alexey, please let me know if you have any comments.
> 
> 

What about checking vti drivers in stress/ipsec/ipsec_lib.sh:tst_ipsec_setup_vti()
Similar to the checks for xfrm_user driver there...

For example:

tst_net_run -q "tst_check_drivers ip_vti ip6_vti" || \
    tst_brk TCONF "vti driver not available on lhost or rhost"


I think this should work for wireguard02 test as well.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
