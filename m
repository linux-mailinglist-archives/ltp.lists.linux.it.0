Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C5239B8BA
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 14:07:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED9153C556F
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 14:07:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 207543C27EC
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 14:07:26 +0200 (CEST)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7558D1000676
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 14:07:25 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id a4so11223190ljq.9
 for <ltp@lists.linux.it>; Fri, 04 Jun 2021 05:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=C52MelninKGaioRDMHXFpJfzJ/sE5UqYYU8+7Hynrg0=;
 b=pLz3MmQhmV0COpQYBXKPoM045CxDIOE15lvvbzUrMRQJK8fmQnYxOHNnA4UDZM9HI3
 PMWbvwUDlT3KRHUzFgFYaPTslT/l4Hi/pFv8Iv8wr6pa7zRuikzAJP5ekondGuHpeDIa
 AWHyHK3mgNbEq5glNSoo/N6fa/m/NfxRwLZVY/7r44NdYYA98WTGJ4kmlfVI2qgDiG6S
 vKxfAQLnIxjHFHJlr0VWNerr6O00M20EBPO4CQAOT5n8GqVhGSVu/82ut1MyHfpspft5
 osphS8P4N2pCLwKVvk3v7EF3dPweRZN6MgBvFTrOjbMB9V2P/21oYyvms/a6qOwsYPAq
 yUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C52MelninKGaioRDMHXFpJfzJ/sE5UqYYU8+7Hynrg0=;
 b=hzg/11pIKi0AZGZS1rQUYgXNJQ4IfJ8yK04nf+SOJZmFIsbNH54JqUzSxary875nAe
 ty038znX8At8HKpBAj/FrVhODp7SNRkEvw7b0vteDlG3tO27yK04yjaYdijid1t3Nwvz
 lIAcPWWZuTBg05geIeorQ8HC4cozy/Jo9IG9Nj4fbEc204bQUvFr6bJuS7dk5zF/cl+d
 9v8TSRlHRx2C5qyLA7Y3hLGdTpsy5mhqlUI8qwyVXQZCaosJNG+px45Ui4nsqGEg1Rxl
 D5Ssomvfep/w6CL1xQrgbCXYXWVOnSRZyUts0PUYJ4d2K+ojNijQa+gSrYpUyp8KxNSP
 qhGQ==
X-Gm-Message-State: AOAM5333A032MNKwYdD6zbmGG6r9gFvJKs83BHtt3MIGp+D9Lo+b+11o
 y7+vfJ9emmGx3upZPCrRzY6tkwRCEV/g7V0=
X-Google-Smtp-Source: ABdhPJxF1aAoL4DGuFYSUukg4VlsqjGkxjKbtOUoNDdkqbo8POUtXxijCpZwpG2ZlMzIXFM4LE9UAQ==
X-Received: by 2002:a2e:8056:: with SMTP id p22mr3196635ljg.341.1622808444662; 
 Fri, 04 Jun 2021 05:07:24 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id z203sm648526lfa.30.2021.06.04.05.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 05:07:24 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210603151012.14760-1-pvorel@suse.cz>
 <20210603151012.14760-2-pvorel@suse.cz>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <40cd7b4a-2988-963f-ead0-6f8ffea01692@bell-sw.com>
Date: Fri, 4 Jun 2021 15:07:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603151012.14760-2-pvorel@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_ipaddr_un.sh: Properly disable netns
 initialization
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

Hi Petr,
On 03.06.2021 18:10, Petr Vorel wrote:
> It stopped working due 40110018e, but even before there were issues:
> 
> tst_ipaddr_un 1 TINFO: 10.0.0.2/24 -- 10.0.0.1/24
> tst_ipaddr_un 1 TINFO: fd00:1:1:1::2/64 -- fd00:1:1:1::1/64
> cat: /sys/class/net/eth0/mtu: No such file or directory
> cat: /sys/class/net/eth0/address: No such file or directory
> 
> Fixes: 807d60628 ("net: Add tst_ipaddr_un.sh test")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  lib/newlib_tests/shell/net/tst_ipaddr_un.sh | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/newlib_tests/shell/net/tst_ipaddr_un.sh b/lib/newlib_tests/shell/net/tst_ipaddr_un.sh
> index 512d6d880..e7730b8d0 100755
> --- a/lib/newlib_tests/shell/net/tst_ipaddr_un.sh
> +++ b/lib/newlib_tests/shell/net/tst_ipaddr_un.sh
> @@ -7,8 +7,11 @@ TST_CNT=2
>  
>  PATH="$(dirname $0)/../../../../testcases/lib/:$PATH"
>  
> -# workaround to disable netns initialization
> -RHOST="foo"

Could be TST_INIT_NETNS="no"

> +TST_NET_SKIP_VARIABLE_INIT=1
> +

OK, I think it's better than setting TST_INIT_NETNS and other vars
(e.g. private _tst_net_parse_variables) here to actually skip init.


> +# from tst_net_vars.c
> +IPV4_NET16_UNUSED="10.23"
> +IPV6_NET32_UNUSED="fd00:23"
>  
>  . tst_net.sh
>  
> 

Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
