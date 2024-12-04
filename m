Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F3B9E33F8
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2024 08:18:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1733296693; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=aTprEnrv3NJ7GkYBUi2BAFi0D28VegWgCfh3FWI7MHU=;
 b=kA26ePXBfAJZ5AoELbsOqXS360qAG3U0AXgEd7rhNzu8b1k8NDnLu44O5wjpaPHI+EdV4
 fTIXZNlyuRsXgAtqbJKyaSKli0HE7Y03u0EdjzMSrCaKYPq3G9SQsgw2x3dliHH+Yo8Dyj5
 6XrW0kON8D/hDQEZynMExqSuEXf/70w=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6C073DECE6
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2024 08:18:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D6AF33DECE3
 for <ltp@lists.linux.it>; Wed,  4 Dec 2024 08:17:42 +0100 (CET)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A9C52656306
 for <ltp@lists.linux.it>; Wed,  4 Dec 2024 08:17:41 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53de880c77eso7575889e87.1
 for <ltp@lists.linux.it>; Tue, 03 Dec 2024 23:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1733296660; x=1733901460; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zy1Zsst6ECOhhHv2xZCzSWEOGBApQkwxoyExw0lzB9c=;
 b=RhIGqv6RjiTNM508GdMnayR2G1Xrjj2uhYVZi63huT1QGiWA6t8xh/kNHqi7yM7PtV
 Fn/u3iqhEcID8DNxqZSJ763w4UBy6Yu01VICmD+m2n45LIhW6hS6Sk/LlfCjmonIo2gm
 Ghhe9H7V7ERKEHjPUwVHHFpuhAjg8yXt35wn04ZORgquHWh7mD4UmDJI6N9zYbUYW+AD
 oCuwMh6QU17yq7t7uEK8hQalwjv6rUD0mOvUAtAl9BoYsHcfPfsY082Tm4FP6JAG8Lej
 GzEh5fLxnoWDQjQzun429yEUPsnJTYlwSfxTu2SZ+G20LC651k2jXUt41p2QDFqTFvKF
 xQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733296660; x=1733901460;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zy1Zsst6ECOhhHv2xZCzSWEOGBApQkwxoyExw0lzB9c=;
 b=h3EJDOZGVB7xfUkQiQ545nM9STGLo6uPGTDr3F9oW9+mbSaM4o4lG6YdUl0gg+n2y7
 Wz9sBrTKC8aSRDvkquQOC3tUHCwYGvRHvv5r/lO1MqEOYyQ3arSp7F8Gu2w2IXO99mlE
 A3sZO79U8IiOz0Q0yHRj1B+fLbPgjv2pZxFwjzl6r0Yrl9uTrJg/0QgVsnoTqOdl2Neh
 z9HPCbD25thhOz4UYjuOWihH5d4GzyOKhz2I59JRYD6grn/x2/Fj0WwtIUmuGoAgdgUD
 Itm4EueUEwt2ruDmmHw/ByT8bf/aKriLlOFOLGgca8yTrYImN/SuWies9gpqi6Eg44OB
 Nlkw==
X-Gm-Message-State: AOJu0Yxh283aA/wAa/w9JhhFtzSOD26aDX/mzMztNS5tU2a8/6ziOEiJ
 Jxb5cni+BbkpLC2sjHq+J6fRbJNYG7+aRWhA68erwyL1x2tkh0Nu64WImpeSizXe7fXgiGS1kyM
 W8Sk=
X-Gm-Gg: ASbGncvainFFKM6qky/yj/hjZaJvPVk97aSRUur/OEgMszd70NefGgrtkW7prBO1cEw
 4TQkxrMQW8PBK5x0tGrVtMSCn5PACuiJDn8L6kXDqX7Blxeguhk9f2bKTKk9SrvlEWHByv1I3WH
 oIKLiERLEcvzxslc5SSC8CG6LcCJuzZ99dSpliIQibp2KVHBxOHHAZ//zIHC5SZdwlQlDmhiQRF
 iCuBVGg6KUzt4xq5aqYyOGfgQqHvEnScaIxYWUGuEqxYscGfrJMbmfRwZUca4yg3JqXFddVgKMO
 t8wRCYvMNNLQl5hhx6/Bh17qL3xU5pZ4SUD4zoA2opSwIEv9NNH6+snYeoWPFdX7//HYLGXRM2G
 5oz8FHbUobI55
X-Google-Smtp-Source: AGHT+IHkU5043P5Zuc8XF8i/BwAGVlZS8BxOck9+1DYS2iCRbm2yXKDmED1gpR011GZ58q4kyyhZ9Q==
X-Received: by 2002:a05:6512:128e:b0:53d:e88b:ebd with SMTP id
 2adb3069b0e04-53e129f28f6mr2448066e87.19.1733296660444; 
 Tue, 03 Dec 2024 23:17:40 -0800 (PST)
Received: from ?IPV6:2003:ef:2f40:8100:6dd4:7858:e1d3:156c?
 (p200300ef2f4081006dd47858e1d3156c.dip0.t-ipconnect.de.
 [2003:ef:2f40:8100:6dd4:7858:e1d3:156c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c1945sm692347166b.19.2024.12.03.23.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 23:17:40 -0800 (PST)
Message-ID: <b2bd0a57-b6f7-4bb7-8c15-d8be0dd37bf3@suse.com>
Date: Wed, 4 Dec 2024 08:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>
References: <20241203151530.16882-1-chrubis@suse.cz>
 <20241203151530.16882-6-chrubis@suse.cz>
Content-Language: en-US
In-Reply-To: <20241203151530.16882-6-chrubis@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 5/5] mem/vma05.sh: Convert to the new shell library
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

On 12/3/24 16:15, Cyril Hrubis wrote:
> PATH=$PATH:$PWD/../../../lib/:$PWD/testcases/lib/:: ./vma05.sh
Is this an error? It doesn't look like a correct commit message.
> Signed-off-by: Cyril Hrubis<chrubis@suse.cz>
> ---
>   testcases/kernel/mem/vma/vma05.sh | 97 ++++++++++++++++---------------
>   1 file changed, 50 insertions(+), 47 deletions(-)
Andrea

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
