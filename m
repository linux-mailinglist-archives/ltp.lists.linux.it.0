Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B3A3BE360
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 09:04:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AABF43C6874
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 09:04:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D3EA23C678C
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 09:04:42 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DC964200968
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 09:04:41 +0200 (CEST)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1m11bs-00035G-Ns
 for ltp@lists.linux.it; Wed, 07 Jul 2021 07:04:40 +0000
Received: by mail-wm1-f72.google.com with SMTP id
 n17-20020a05600c4f91b0290209ebf81aabso598264wmq.2
 for <ltp@lists.linux.it>; Wed, 07 Jul 2021 00:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AmocC53sNG8kN/42gm7zP1t+Wi4TtKRnpYLTSg86n1g=;
 b=VDGupyPG3VOgwdMI1X8azrpMk2Rpsed1U17VFUDF/lqAMvPpf8u5vu9nDFuKcwL3g7
 XscjwuNioH8+uuR3T3k11uBf1bvrAJknvkth4lDMi1D53PHE58OyOe6GmOQygWflwaKJ
 JA6eDFm37SUSU9+u9dEHgMbJhBLHcWurm7ULNMygkgT6GxHh0xOOrai0RC5dstJ7Q8mc
 g0tW2Jn1+A5JI+MmsUyns/wT0utz1gHuBjbDkOgUKzJHu17++BtUK5Hft+ohXNdlHWwo
 h3jC7F7i6gQ74mRSEUm40oNAX4/rs2CrKDPnKYGwUUbdI/vHeGwr/GMMwFGdB0qNVce+
 YgkA==
X-Gm-Message-State: AOAM533swjawIF94f5l8IizigKQM2RdEWkVld4v3J+e7gKjmgf1iZpHE
 vMp0XjAf6lvjGS171LZVMl2tFM4doHyR7o2fVJ5o28DL/anPwfTM7hS/xWk2VrB0X6X8874Zink
 eDJysdm+yp6Kn0xZan+7GZyBXWk1l
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr25676093wrn.398.1625641479852; 
 Wed, 07 Jul 2021 00:04:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6jN40/QKRgThgclI44R6auuDiAJyNEfHe6fHWURrKc/KklJp1VFm8KYrBJe4nQN/fVJgc6g==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr25676076wrn.398.1625641479714; 
 Wed, 07 Jul 2021 00:04:39 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id x21sm5047834wmj.6.2021.07.07.00.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 00:04:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Petr Vorel <pvorel@suse.cz>, Wang Xin <wangxin410@huawei.com>
References: <20210401125127.45600-1-wangxin410@huawei.com>
 <YNoxKg+Hm0qa3Z70@pevik> <fd26cf45-7dd8-004f-3d41-422ce4d9bbdb@canonical.com>
Message-ID: <34bbe196-515c-f4f3-6d1c-5c9f1221e52a@canonical.com>
Date: Wed, 7 Jul 2021 09:04:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fd26cf45-7dd8-004f-3d41-422ce4d9bbdb@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp_tpci.c: Add release operation before
 allocation
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

On 29/06/2021 11:38, Krzysztof Kozlowski wrote:
> On 28/06/2021 22:29, Petr Vorel wrote:
>> Hi Xin,
>>
>>> When we run the test case, the following results will be obtained:
>>> test_pci  283  TPASS  :  PCI bus 7d slot 00 : Test-case '11'
>>> test_pci  284  TFAIL  :  tpci.c:74: PCI bus 7d slot 00 : Test-case '12'
>>> ...
>>> test_pci  300  TFAIL  :  tpci.c:74: PCI bus 7d slot 01 : Test-case '12'
>>> test_pci  301  TPASS  :  PCI bus 7d slot 01 : Test-case '13'
>>
>>> The analysis is that the space allocated by the bios is insufficient.
>>> The solution to this problem can be in add pci_release_resource(dev, i)
>>> before system resources are reallocated.Because the resources have been
>>> allocated when the system is initialized.If it is redistributed, it
>>> should be released and then allocated.
>>
>> I wonder if this is the same issue as the one described by Krzysztof in his
>> patch:
>> https://patchwork.ozlabs.org/project/ltp/patch/20210401125127.45600-1-wangxin410@huawei.com/
>>
>> Could you please share what HW and kernel you use and post dmesg?
> 
> This solves my problem. It seems that could be the root cause - early
> configuration allocated too small resource? It might be also some
> specific BIOS issue (wrong resource allocated?) because in case of
> resource assignment failure, the kernel should try to get the original
> FW address from BIOS (pcibios_retrieve_fw_addr()) and this apparently
> returns NULL translated to -ENOMEM.
> 
> I am fine with going with this patch instead of mine.
> 

Is there anything stopping Xin's patch from being applied? LGTM:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
