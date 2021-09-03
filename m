Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8813FFBB0
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 10:17:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8F483C28E2
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 10:17:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 052FD3C27DB
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 10:17:27 +0200 (CEST)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3F65D20102B
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 10:17:27 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id f18so10183510lfk.12
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 01:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=IeFbDeksMdacJSwRVj3VDhTJV4SQHvsqoK072k2yJH4=;
 b=y1nkt49Rcoy/1dmMF+VxLzMjhjIWksBVqYT1aYD8qE5IbQjRVbXRtSsNt949yj5pDN
 i5m3yj5VN73lnG4hqNqSfV/7hV6nejvmRGIFLLTNvohHmobEVHwjV7L3UEngS0KggqAu
 M1o8GOQSjTEzsg90DpikEeuZzrFSjya6esacnCmk/tEsJXkKCjqrqROC7UDTZeDVkbq1
 64mIKmRtQawhBdsF7rIy96ICW9r0KjtyUagQ9W5uyQHiF7K57dsxA9/utELFQo5v4c2X
 f/0Mrg46cD10Y5V9hD2dzNtGiGnXf9j2X6OP3CkREWKORvtPH0y9n1akLGArGcsunMco
 eS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IeFbDeksMdacJSwRVj3VDhTJV4SQHvsqoK072k2yJH4=;
 b=XcnJR0ngsdOG8Pc4QeNu/SdTq92RjBb7D8DAAqzSHMJd9kNIDO26fGP3XFezZS0KGJ
 mx4dOOo/x4kC5Qnsg23s3LPSbZkq+W+zC6N7DHxz6F3PmIRJ7dS5KI6FvnJb9O/pB/Ys
 MED0PjH6HZlN8a6q3SG5L3OfM+dYZlB+36tT7rlS8cNEH5MCCG4Ll68UEyASoar+qUzK
 PZhJtlc4NGjYl5AHMObFNX4XBlqHpXCQyET61v6Hhy5nwsKkooQxX9cEJFLy3FWEdKBA
 Euahtu/jVVDjR0VrZJWJtJMqfyso1tSwVZdwE9/99Z8kBHSQQqbTI79fHH/pbo38cf6d
 0BcQ==
X-Gm-Message-State: AOAM532lqfOpY+UiY8qyfNvMJkgC3nb+MlC9BuhMndDz0FuL/JTMi8zx
 4riqC6mTHUbSv85bvIYEv+Xb9zvdISIc
X-Google-Smtp-Source: ABdhPJwDzn4gk7vDWlfI730QNCZ8jbdJ+s+Q3Lr2XK7AKKJuzIAsubocrJuGu2tKwqbN8TqFNr4t/g==
X-Received: by 2002:a05:6512:3b28:: with SMTP id
 f40mr1834652lfv.303.1630657046419; 
 Fri, 03 Sep 2021 01:17:26 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id 10sm194042lft.233.2021.09.03.01.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 01:17:26 -0700 (PDT)
To: Naresh Kamboju <naresh.kamboju@linaro.org>, LTP List <ltp@lists.linux.it>
References: <CA+G9fYtJYK4C4q7v2VBgyHe1EdOeZ=auEytoKJr0gYThj8gS5w@mail.gmail.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <cab131c0-877e-4781-6d0e-07a6e528b329@bell-sw.com>
Date: Fri, 3 Sep 2021 11:17:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYtJYK4C4q7v2VBgyHe1EdOeZ=auEytoKJr0gYThj8gS5w@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP: smoketest: route4-change-dst fails intermittently
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

On 03.09.2021 09:33, Naresh Kamboju wrote:
> LTP smoketest  "route4-change-dst" fails intermittently on various
> devices and qemu.
> We do not want any intermittent failures on LTP smoketest.
> Shall i send a patch to delete this test case from runtest/smoketest ?
> 

route4-change-dst is a stress test, perhaps replacing it with more
simple like ping01.sh or ping02.sh that still triggers LTP/tst_net
library check?

BTW, such tests may overlap with existed network setup on a test
machine, by default they are using 10.0.0.0/24. Changing defaults
is done via IPV4_LHOST and IPV4_RHOST environment variables.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
