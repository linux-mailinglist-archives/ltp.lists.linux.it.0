Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF13B702C
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 11:38:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 488543C6CB1
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 11:38:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF6E73C1A2B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 11:38:30 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A3FF81000A56
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 11:38:29 +0200 (CEST)
Received: from mail-ej1-f70.google.com ([209.85.218.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyACK-0005NL-Ln
 for ltp@lists.linux.it; Tue, 29 Jun 2021 09:38:28 +0000
Received: by mail-ej1-f70.google.com with SMTP id
 f1-20020a1709064941b02903f6b5ef17bfso5462015ejt.20
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 02:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RlngaNc3atOxDjzx29yMCULml8DPEyBpANTqTJc89hI=;
 b=lRmHgxsupQ+k5cjvbcFBEF55JE0hh3GuTv4YmS0IoFLQiDu6MHsPRBw8gV2IhC2ico
 gp3dfa7Pei7gfqVU7XPKhGmqDJCKPIyi/Me5L9/oJ8RO9YDSql3h1te2rXF7ukX2jvCe
 f0Ttzz13u56NNe3MzjsVEsMlXMBwMKLm1E/K9k1BlLY+Iz7lK9PtmNRiUXNn1C3b72bz
 Z48dJowgfgUERwsNMCF8PzKL45jijk1Xvwl5CcPTyBGzI69P9nYX08d8VRdS8l6g8B89
 HYEs94FVtfd+6KK8fuQYLemUQhs1RzhSy+jse/BrJY5lBDJcigQ4poRqOpvBMwl0BgZ2
 YTQw==
X-Gm-Message-State: AOAM530RXHZutd3v+O7Oc17SY4Lg/znHJfntKOp6b9sIVFMlGTYCwuV+
 zyBISG3jq1BjGWcPMQ2uNq9kZYh++/9YtUj3wDtg5HlFKQn57jTHcy4yqwSs5Ds1HHmVUXhyizq
 L6bRUlWcKYImvQ5NAKUhAkzj+0wTf
X-Received: by 2002:a17:907:9841:: with SMTP id
 jj1mr29013600ejc.94.1624959508124; 
 Tue, 29 Jun 2021 02:38:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIwkxMDqaIsgApmZYsMxildpISj5HG6khdtpFBkl0RDi92UrVYYXNcrke3OSbunvkZpJysJA==
X-Received: by 2002:a17:907:9841:: with SMTP id
 jj1mr29013588ejc.94.1624959507972; 
 Tue, 29 Jun 2021 02:38:27 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id gv20sm8118240ejc.23.2021.06.29.02.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 02:38:27 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, Wang Xin <wangxin410@huawei.com>
References: <20210401125127.45600-1-wangxin410@huawei.com>
 <YNoxKg+Hm0qa3Z70@pevik>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fd26cf45-7dd8-004f-3d41-422ce4d9bbdb@canonical.com>
Date: Tue, 29 Jun 2021 11:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNoxKg+Hm0qa3Z70@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

On 28/06/2021 22:29, Petr Vorel wrote:
> Hi Xin,
> 
>> When we run the test case, the following results will be obtained:
>> test_pci  283  TPASS  :  PCI bus 7d slot 00 : Test-case '11'
>> test_pci  284  TFAIL  :  tpci.c:74: PCI bus 7d slot 00 : Test-case '12'
>> ...
>> test_pci  300  TFAIL  :  tpci.c:74: PCI bus 7d slot 01 : Test-case '12'
>> test_pci  301  TPASS  :  PCI bus 7d slot 01 : Test-case '13'
> 
>> The analysis is that the space allocated by the bios is insufficient.
>> The solution to this problem can be in add pci_release_resource(dev, i)
>> before system resources are reallocated.Because the resources have been
>> allocated when the system is initialized.If it is redistributed, it
>> should be released and then allocated.
> 
> I wonder if this is the same issue as the one described by Krzysztof in his
> patch:
> https://patchwork.ozlabs.org/project/ltp/patch/20210401125127.45600-1-wangxin410@huawei.com/
> 
> Could you please share what HW and kernel you use and post dmesg?

This solves my problem. It seems that could be the root cause - early
configuration allocated too small resource? It might be also some
specific BIOS issue (wrong resource allocated?) because in case of
resource assignment failure, the kernel should try to get the original
FW address from BIOS (pcibios_retrieve_fw_addr()) and this apparently
returns NULL translated to -ENOMEM.

I am fine with going with this patch instead of mine.

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
