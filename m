Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F5F3C220F
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 12:05:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1472C3C898A
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 12:05:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5DF33C1CE5
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 12:05:36 +0200 (CEST)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CDF371001388
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 12:05:35 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id t30so7189710ljo.5
 for <ltp@lists.linux.it>; Fri, 09 Jul 2021 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qZnM+132Y4oOB9vUGYdfqjmy92j4YSebwZscNASvr68=;
 b=Fsb2vF0Ct4URWVf6KyYW65AO9yEGPwA/EmssTn820iengspJoNYIS6bpQch/BTcpip
 BL5mbp/UiIY0rkvB90Mx3NltqBBBpSkh+NDemdX2hV2M0MRRBRJoeTkUogDSo0CAdC5V
 GT3ljjmS2YrTmYidBkrQXrjLZBg6fHKdh1qSVbVSVwchqv5sbngH1TCpp6mjGYNvpD8p
 W6sGAbcVNRNNBXVXav8airLNuKIsEEfGcOCDzYp9DfIuOuO1/SSJThQqLl33EA1alb5j
 x+B3GqbOPkB3d2vRN+0mmOW33YCkkEaphtF2auCZUh7jLpsLuX0WJWADr6HVfN4oN2/1
 lz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qZnM+132Y4oOB9vUGYdfqjmy92j4YSebwZscNASvr68=;
 b=a1jUqhR+0As8f9zEACWWEaoDH/YZTOq/i17OFj/cKFyOspMiQEghyC+5JcPovbLlgq
 eV1hxIieyXp4QyFgzO5TDitjsElNhIIFFckHez+SoxgwhyJK9mrvBDnvnLH5gO+eoNf5
 ZvD/ffYqK4anwyDgPvhd+SlTPYfn6nIUCSUy/vFfa/WCwKtSKXQZ7XKwGetDe2/ULcn2
 WpliwesXDAwCsR3UfKl2QQGt9y7PUKC9x6vxYBHlRM64tFAGlz5fTzzkSWvr+177r0Tw
 NOid4lTCt9CIe2QqISFUeblqYwN7sR3bGNlx/eFGiiq4Ft7baF58uHaT1fQz5ZAhEWAP
 oNqw==
X-Gm-Message-State: AOAM531FHoUl1iAyHczuMxeF5pPbzNcpLmQ+kFN5ztzRKONcnL6eVUv6
 31gY4SDR4XwuqlcRCNxEI+PINyUaY5XG
X-Google-Smtp-Source: ABdhPJwhFoTWVhQGJcS8x/mCt0nPHJ92eDO96NPjKS1AkCJ4lF7n3DbsizikM/5rRS3wyef5lhLIyw==
X-Received: by 2002:a05:651c:1689:: with SMTP id
 bd9mr27863220ljb.373.1625825135082; 
 Fri, 09 Jul 2021 03:05:35 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.5])
 by smtp.gmail.com with ESMTPSA id u25sm425698lfm.131.2021.07.09.03.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 03:05:34 -0700 (PDT)
To: Yang Xu <xuyang2018.jy@fujitsu.com>
References: <50bca7a2-41f5-3eba-d1da-e8e12c883d22@bell-sw.com>
 <1625733759-30715-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <7d822a0c-451c-4653-23f1-9bbc81bd0842@bell-sw.com>
Date: Fri, 9 Jul 2021 13:05:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1625733759-30715-1-git-send-email-xuyang2018.jy@fujitsu.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] network/tc01.sh: Add a regression test for tc
 qdisc command
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

On 08.07.2021 11:42, Yang Xu wrote:
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
...
> +do_test()
> +{
> +	tst_res TINFO "Use tc qdisc command to trigger a null-pointer dereference"
> +
> +	EXPECT_FAIL tc qdisc add dev teql0 root teql0
> +
> +	dmesg | grep RIP | grep teql_destroy | grep sch_teql > /dev/null

It can be simplified to:

if dmesg | grep -q 'RIP:.*sch_teql'; then

> +	if [ $? -eq 0 ]; then
> +		tst_res TFAIL "This bug is reproduced."
> +	else
> +		tst_res TPASS "This bug is not reproduced."
> +	fi
> +}
> +
> +tst_run
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
