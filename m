Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8242F3D8C9B
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 13:20:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 100C33C9050
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 13:20:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6A6B73C641F
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 13:20:44 +0200 (CEST)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8EBFE200983
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 13:20:43 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id bp1so3276735lfb.3
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 04:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XTBlQ799CMYClrSSSkrHKdECxJww1u9yE3gtiRr2K1U=;
 b=JqE9ZIISS+y6nUoVs4MAEzXIsmSO/3mqarYznDHGq17yI7DYfjgC2cFCnRpMzt+ASl
 LwkTbdFnTtkrGF4vUC3elzc93/bpALG6iH1TAIJBWcymvKNIBVxekn21educdNe9XkWX
 KjOarSGEInXo+xq89nVIbXs9OqdZuIHZQZNf7Y2Ibsc0rQRx0sDQJxoIdanNrEczVwB7
 eNhRrB2XlK7e65fhP38K/Uu4UYUvoGjYUvBUOTJmk0hMkD+LYoSM6ZeApfMidNx91HgW
 TU8OqttpplRQ7zm+Zhh5fa7/Ca2cupQKtytPHGcCXoKPruyWj07vbNNVnspcGl4PQzNS
 DAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XTBlQ799CMYClrSSSkrHKdECxJww1u9yE3gtiRr2K1U=;
 b=E0pzWGojl+flrhC0GyR0inBr8aH1TioDMT/QYG5wIWwQm12bSxNSs1+cdcUHK0k+sT
 x7AJhtPObxCpzIGjLj52oXBuVMzHqIN1JWPIzhenKQ5e9R5r5PBZM6PAyW+A8E0pq5SC
 MtPBPYvj4dPMO/cslSLDDSYfBcMcisqumdHrP9K9ZxIz6mN4o3MzWr1zl4houRegxkEU
 8wbaKXmNdMH1NA7zMNxK6fnzFvZV8TovmURQDJYs9S9tBXWPlp2WiALq+rvaXYD158Ex
 ERgY8EId6oFed4PBWNFqib7mh91yu76wJIxNIhAdeI2fnRpPnOX11nK2kuxP6d5GrOgE
 S56Q==
X-Gm-Message-State: AOAM531HN52GPu2EvBkIdfojkopV524W1gEl2s9NKBr+XA3EJKl/Jz7R
 UV4Naz/t2eY4GLxmEW6KkNHP
X-Google-Smtp-Source: ABdhPJwkdoy2bId0PqGQM+aBggqpfmfkHQ0p3tcvJNZnvNMeDkMzAtBACCbu39R1OaZwKHbJEaJGog==
X-Received: by 2002:ac2:52b4:: with SMTP id r20mr21205305lfm.104.1627471242945; 
 Wed, 28 Jul 2021 04:20:42 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id p21sm566423lfo.199.2021.07.28.04.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 04:20:42 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210714140716.1568-1-pvorel@suse.cz>
 <20210714140716.1568-3-pvorel@suse.cz>
 <57d4c109-d01a-2c7f-39c7-41013e70abf9@bell-sw.com> <YQBD4w2nKwY2G1l+@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <b0638d98-88d5-76d7-78a1-631c801d88ad@bell-sw.com>
Date: Wed, 28 Jul 2021 14:20:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YQBD4w2nKwY2G1l+@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] broken_ip: TCONF when test run on unsupported
 protocol
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

Hi Petr,
On 27.07.2021 20:35, Petr Vorel wrote:
> Hi Alexey,
> 
>> On 14.07.2021 17:07, Petr Vorel wrote:
>>> net_stress.broken_ip runtest file is correct, but some users try to run
>>> tests manually.
> 
>>> Fixes: #843
> 
...
>>>  do_test()
> 
>> The generic version looks fine:
> 
>> Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> 
> I didn't understand whether you'd prefer to add TST_IPV6=6 (or TST_IPV6=) where
> needed or accept this patchset. Both would work.

I think for manual runs it is better to set TST_IPV6=6 in the test
so it will run the test rather the require passing some options.


> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
