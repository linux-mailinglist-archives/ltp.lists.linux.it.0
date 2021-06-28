Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B24103B5B97
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 11:48:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B6FB3C86C6
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 11:48:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F1BAC3C015C
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 11:47:59 +0200 (CEST)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 557CD1A009B0
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 11:47:59 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id bp27so6414740lfb.9
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 02:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aOjb4fbEMTeN09gpQJK2YyxtK1wyNuzzb2Qp1MAAHHI=;
 b=fMWMftjSzyJQEr/c0bAU1MeVDeFXUbBSKeqbJlCpv2veZ8q6+Px7xjKYPdcpj2Xe1p
 HzxuWAS+zs1MtyoOH6n1B6I+OYSTjC2KLhJZdKPM16q9v7bwJnMTMBsohx5Ph3EI5LRm
 McvEKZlNsjE7l6f/Fqz7Qvmhn4yv4Ad/Zfi5NmQODtX5iNQ9lIO3dETgIrfDpuZA6BT3
 mSkIpFhczglkbeDOernQQY8m+aCio6Vuoh2bHPNef+N8Y2tldCNVvr8fIQGgnfrXXunh
 2iwqC8GwAH6aRNCLaiJrXcWZEos2U8iemGTOb4vNw4LL5HpiZXYdiWI8STv1nB68u1OE
 9gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aOjb4fbEMTeN09gpQJK2YyxtK1wyNuzzb2Qp1MAAHHI=;
 b=k6CvotfmNu2jHg5s3FXocnimJ8NmJ3gXsFMWYmOPV6mPs2ySzKft7dAAiKJBVCLwQ7
 E3v1+RWRdcA6Yi8qtMGTrkHMipfE9RzogprmFUkpYs/1mkW1b7DK/eAz1d8mrYw5DxO5
 e3DpoaHkDYx2Utuhwe5GNhSRJmElnTSooJEoQoSEtqq2YkC/be2LyqH/GNDprUcK1LrK
 6ao1+z01s9xt9Wq5XtpjkL38tWmWyO6LP3uFriYhxstYxGzuTt9FcUB515/FG4JSCXCg
 OETHhyhRhnmYtOAEhVLbLv7t9cGJKlOiJn43q2eXPqVAGGxUte0fP/VEPnjoi4nm7k8V
 LJ1Q==
X-Gm-Message-State: AOAM531bR79RewHpreFmo6/RDurAinIW2dv9XPFIA6P2SJDJAvI5GFwC
 gDoHyv5Z733HsAXL1JpVJoxJulSC5pdY
X-Google-Smtp-Source: ABdhPJztIwvcvLFLEGb/8b2mghAS2DOIx7zsh4xY404AvUOmawaw99TjWtBkmJ19O1s3BBh7DkrH/g==
X-Received: by 2002:a05:6512:4c5:: with SMTP id
 w5mr18290283lfq.192.1624873678186; 
 Mon, 28 Jun 2021 02:47:58 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.3])
 by smtp.gmail.com with ESMTPSA id s12sm1276092lfg.44.2021.06.28.02.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 02:47:57 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
References: <20210624081500.11715-1-aleksei.kodanev@bell-sw.com>
 <YNWhdgAUp5e/hNwx@yuki>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <e65771c9-709e-e6a6-977b-90c6ca194d08@bell-sw.com>
Date: Mon, 28 Jun 2021 12:47:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNWhdgAUp5e/hNwx@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_test: setup TCID earlier in do_setup()
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

Hi Li, Cyril,
On 25.06.2021 12:27, Cyril Hrubis wrote:
> Hi!
>> TCID can be NULL in tst_tmpdir() because it is set after do_setup():
>>
>>     tst_run_tcases()
>>         do_setup()
>>             ...
>>             tid = get_tid();
>>             ...
>>             tst_tmpdir()  /* using TCID here */
>>         TCID = tid;
> 
> Good catch, I wonder how we missed this for so long...

Ran into this with musl, it pastes "(null)" to the tmpdir path if
TCID is NULL, so the final template looked like "/tmp/(nuXXXXXX".
But glibc skips it because the same string doesn't fit in 3 chars
template in snprintf(..., "%s/%.3sXXXXXX",...).

Applied the patch. Thanks for review!

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
