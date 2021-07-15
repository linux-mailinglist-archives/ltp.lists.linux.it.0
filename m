Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A156E3C9C36
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:53:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 287053C8633
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:53:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 732843C65D4
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:53:21 +0200 (CEST)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BF3041001189
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:53:20 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id x25so8779412lfu.13
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wh/Oj+RsGttjnJ56IQbKQ/ghyPRFQqfSpPpcF/Cn+80=;
 b=AuUqnz8mP57PTegRvxT0DfJPJId9z+GpL1VY36C9OJ9panIhXDLx7cWOuW9lO049be
 MdBZJX1i/HOzCkz+prviEGkw0KEFbsf7ev8japQF/Qz5SLeHtmxEDoc2OSpA8cL4Hw72
 uFQ5LA+KZeiHRThY2veLxsfYKrD1/nR5O4rneU0nerfhBqWmhEq63+VfLjUkExS1x1Jo
 Ign/7i/gaplNpEuKGKfmY+SyCd77bn845DnkfwIjGSrkFeSl6clc17kVFnyfeyNLLF8+
 5w9xbDzDbZFW8kSnlBWB0xymG8zx/+f+8GVNNdIJiTuTgF9G5aZJyyq3ZjivAfjmGIGL
 F+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wh/Oj+RsGttjnJ56IQbKQ/ghyPRFQqfSpPpcF/Cn+80=;
 b=JOS8ub0rtI3PM+s4ifEPkvSu4htYtCRR4+gCll1m0PDdW2wnt6h0y6TZc+ZKg9dRBr
 GL2BBgL0q643N0getRuAlCmk7OcVe+d2o86pMvPBxD0XqXgbzjBLlnV0I0T9/Tc+dTuj
 Li7mU3Xttdg6jI6rtvnHcmYXk/EpZPJCIvb2KbRJzZHVuwdlfY9HzQCLcVrUbc2PaOSQ
 0w2JIVELuB5y94Dp9sJM0D6q08DPeGCnGRTAnw+4Gyszz8c2rjsal9N5LTIp6LfQrhWP
 wbHKa4qwE/i+8zxrE4Dv9a2/G0+M/SFiY7RP5fEUsxn4lnKcHJwM6APkFMgaCio9n3aE
 gs3Q==
X-Gm-Message-State: AOAM530ehM5apBDLD1RCwahD4TRGq+Y7gocaeyfGJw4CcoSP+50eZXdK
 XAzZHHyhj39G6NeyEWDvkX7N
X-Google-Smtp-Source: ABdhPJxMPnIlnhZ66+OSBJxYmFmVFbRzEGjWHDKW1oi2G9ZIuXLY4+1oEQZapumV/7iYUJnH+yRNug==
X-Received: by 2002:a19:7514:: with SMTP id y20mr2735029lfe.623.1626342800081; 
 Thu, 15 Jul 2021 02:53:20 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id s12sm403096lfr.60.2021.07.15.02.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:53:19 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210714140716.1568-1-pvorel@suse.cz>
 <20210714140716.1568-3-pvorel@suse.cz>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <57d4c109-d01a-2c7f-39c7-41013e70abf9@bell-sw.com>
Date: Thu, 15 Jul 2021 12:53:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210714140716.1568-3-pvorel@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 14.07.2021 17:07, Petr Vorel wrote:
> net_stress.broken_ip runtest file is correct, but some users try to run
> tests manually.
> 
> Fixes: #843
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/network/stress/broken_ip/broken_ip-checksum | 3 ++-
>  testcases/network/stress/broken_ip/broken_ip-fragment | 3 ++-
>  testcases/network/stress/broken_ip/broken_ip-ihl      | 3 ++-
>  testcases/network/stress/broken_ip/broken_ip-nexthdr  | 3 ++-
>  testcases/network/stress/broken_ip/broken_ip-protcol  | 3 ++-
>  5 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/testcases/network/stress/broken_ip/broken_ip-checksum b/testcases/network/stress/broken_ip/broken_ip-checksum
> index 78f00ce98..707ffcb29 100644
> --- a/testcases/network/stress/broken_ip/broken_ip-checksum
> +++ b/testcases/network/stress/broken_ip/broken_ip-checksum
> @@ -1,11 +1,12 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
> -# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
> +# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
>  # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
>  # Copyright (c) International Business Machines  Corp., 2006
>  # Author: Mitsuru Chinen <mitch@jp.ibm.com>
>  
>  TST_TESTFUNC="do_test"
> +TST_NET_IPV4_ONLY=1
>  . tst_net.sh
>  
>  do_test()
> diff --git a/testcases/network/stress/broken_ip/broken_ip-fragment b/testcases/network/stress/broken_ip/broken_ip-fragment
> index 1f5e5f713..7356bb523 100644
> --- a/testcases/network/stress/broken_ip/broken_ip-fragment
> +++ b/testcases/network/stress/broken_ip/broken_ip-fragment
> @@ -1,11 +1,12 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
> -# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
> +# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
>  # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
>  # Copyright (c) International Business Machines  Corp., 2006
>  # Author: Mitsuru Chinen <mitch@jp.ibm.com>
>  
>  TST_TESTFUNC="do_test"
> +TST_NET_IPV4_ONLY=1
>  . tst_net.sh
>  
>  do_test()
> diff --git a/testcases/network/stress/broken_ip/broken_ip-ihl b/testcases/network/stress/broken_ip/broken_ip-ihl
> index 9f2a42568..e5e41ee8e 100644
> --- a/testcases/network/stress/broken_ip/broken_ip-ihl
> +++ b/testcases/network/stress/broken_ip/broken_ip-ihl
> @@ -1,11 +1,12 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
> -# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
> +# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
>  # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
>  # Copyright (c) International Business Machines  Corp., 2006
>  # Author: Mitsuru Chinen <mitch@jp.ibm.com>
>  
>  TST_TESTFUNC="do_test"
> +TST_NET_IPV4_ONLY=1
>  . tst_net.sh
>  
>  do_test()
> diff --git a/testcases/network/stress/broken_ip/broken_ip-nexthdr b/testcases/network/stress/broken_ip/broken_ip-nexthdr
> index 475b92b16..2ab0601ac 100644
> --- a/testcases/network/stress/broken_ip/broken_ip-nexthdr
> +++ b/testcases/network/stress/broken_ip/broken_ip-nexthdr
> @@ -1,11 +1,12 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
> -# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
> +# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
>  # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
>  # Copyright (c) International Business Machines  Corp., 2006
>  # Author: Mitsuru Chinen <mitch@jp.ibm.com>
>  
>  TST_TESTFUNC="do_test"
> +TST_NET_IPV6_ONLY=1

+TST_IPV6=6 won't work to fix #843?

>  . tst_net.sh
>  
>  do_test()
> diff --git a/testcases/network/stress/broken_ip/broken_ip-protcol b/testcases/network/stress/broken_ip/broken_ip-protcol
> index a91cdaaeb..9f9275f03 100644
> --- a/testcases/network/stress/broken_ip/broken_ip-protcol
> +++ b/testcases/network/stress/broken_ip/broken_ip-protcol
> @@ -1,11 +1,12 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
> -# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
> +# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
>  # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
>  # Copyright (c) International Business Machines  Corp., 2006
>  # Author: Mitsuru Chinen <mitch@jp.ibm.com>
>  
>  TST_TESTFUNC="do_test"
> +TST_NET_IPV4_ONLY=1
>  . tst_net.sh
>  
>  do_test()
> 
The generic version looks fine:

Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
