Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 955273BBABE
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jul 2021 12:03:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC33B3C8A74
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jul 2021 12:03:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DD5DA3C2E3C
 for <ltp@lists.linux.it>; Mon,  5 Jul 2021 12:03:36 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0146460055A
 for <ltp@lists.linux.it>; Mon,  5 Jul 2021 12:03:35 +0200 (CEST)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1m0LRu-0003CO-Tf
 for ltp@lists.linux.it; Mon, 05 Jul 2021 10:03:34 +0000
Received: by mail-ed1-f71.google.com with SMTP id
 s6-20020a0564020146b029039578926b8cso5945070edu.20
 for <ltp@lists.linux.it>; Mon, 05 Jul 2021 03:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xfthnHoq9UxE/gG3OE+cBMLPbnlwAo1SD+1oLsL5R+c=;
 b=qUDWEwAfiGzEIDKJHIvY79PEB4aCWXxUTtUA1Okwz+DPDzIQHvl2y+lNfZQ8pi+eLb
 VCZgqvVaAZgAY3MutmzUDV69pLqeRGNHu3T6+AfqD5pLF8ZIrdzJ/0Xqgf/JymVSvlAC
 RY51WAhxe3czrb/ycMjguFUtpEUS+pWl9/8a0NP12ZVn30wGmooE++dHovVdaKKauDx6
 8d/qRhNDCv2t/YLO5Lk9iR4pxyVvSbvx5Y2RpxDe6iZWrwI5Vdipldlnaa9t6uQZrotT
 u0wio3udfT+wnMDLMXVlvxUv04fcDMsvzV3fbboVzw6fgn9JLiOD9GJ2zZCS2fuNcAp6
 zPyw==
X-Gm-Message-State: AOAM531SN+m6dJPpr7ikGUCLibqkdYRFDbu3lykoDW3+uU2OsgF6esgZ
 RBjHwkRo3rsr0zkkb/oYK1F8MnKkYbuT/OGv1HFwiE2/DD9a/NWf3k9lPCQHYo53uF4vjendIJF
 U4xkBIW21iq92OxxC8TGb4bTCKyqs
X-Received: by 2002:aa7:df0a:: with SMTP id c10mr2849288edy.301.1625479414682; 
 Mon, 05 Jul 2021 03:03:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbXKJtxW/4J9mW4PYbrAp8o6cXS+bK6fJaAQWLtEGvy41ffGB5u/yDQhVSJYOJijK9fdWtMw==
X-Received: by 2002:aa7:df0a:: with SMTP id c10mr2849275edy.301.1625479414531; 
 Mon, 05 Jul 2021 03:03:34 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id eg32sm557560edb.58.2021.07.05.03.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 03:03:34 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>, Yang Xu <xuyang2018.jy@fujitsu.com>
References: <YNM4rlDJLzb4xk6v@yuki>
 <1624512827-3256-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1624512827-3256-3-git-send-email-xuyang2018.jy@fujitsu.com>
 <YNnlIVB9M4/11JmT@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <98a17ec4-3697-d5ba-583b-ce539782f18c@canonical.com>
Date: Mon, 5 Jul 2021 12:03:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNnlIVB9M4/11JmT@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/shmget*: Convert into new api
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 28/06/2021 17:05, Cyril Hrubis wrote:
> Hi!
> Pushed with a minor changes, thanks.
> 

It looks like this commit not only converted into new API but also
changed the test. We started noticing shmget02 and shmget03 test
failures on several systems.

https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1934432

Reverting the commit helps and tests pass.

Since it is one big patch doing multiple things at the same time, it is
difficult to bisect it more and find the cause.  Any ideas what went
different here comparing to previous version of these tests?


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
