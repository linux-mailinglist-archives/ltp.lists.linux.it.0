Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EE63EA600
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 15:51:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C90D3C6DE4
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 15:51:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7379C3C5A51
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 15:51:45 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E76581A0089C
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 15:51:44 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id r9so4140421lfn.3
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/7CtSTL0rBFYe9IhMSwFfEyI5jXl5LP0dgLLBozDFhw=;
 b=PNKnF94TtjTHK7FAPkFeNmUAftpkaTxIS6V181xlJHbDkX4uifLBDYzkL0NRx7sKzl
 jEi3gI+7fykrmpYVQEaua7cN6oS3UeRX5Kvv8oeyoDZPJ1KGErIAA+IFN4VUgpHC9Wik
 3pMl//8ozV7/aeU36QmhUWN+SkGdpUKmCme+5qG+3l0bdDh/0H8Kwk3huzffCVmzZaY+
 Mh6MOJ/dS3YwSk/GqlJmjz874z8n1eG0dQEkI7zl6xsd0Bg2LVzVkDa4PZoI8D6cqKPV
 KLycxvjnqw2afFL+u/2NwNfhM81OM/YuL0WnTBV7dWECvd0iv6BIYUahLGjd6N1beocz
 kI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/7CtSTL0rBFYe9IhMSwFfEyI5jXl5LP0dgLLBozDFhw=;
 b=JkSoIpWY6+Yj8+JFOVRQE39mxJVHUKiu3AhBqyk2U/J/Z16mW8cVDxM+Pj86qC8/hQ
 ILIPIQuV8BKM9dr6gQxLv+eugbLJ2KR2scvbPMpxSTKGbWQyGwj4sCCEhelVyRDnGxAU
 lDoKTeFSPI9jQ1xwo23TNuR92hFzaJg2GJfOyF4ECSE5l8G3PGhsEkhc6/O5U7oL7IGZ
 ek6jM6i7supZs7Ki0MpIrudXw84lMAwcE52ugxrl1UAs7p1jBfOfSJKChjURWDcY67Ch
 +QBH2R8UX/6CdgQMR6YdOZ0P2abHBSa3LEvnYXF3yoJmrfFGNSS9rnrCX1LfoHH5alho
 PfCg==
X-Gm-Message-State: AOAM531cIvR3nCMxa0awzgxI+ded28hjpmM3ndgVzcFSd+1nikLvtl4A
 je3i7NmWZzIkF6ZfJTclxHutJiqoAIwg
X-Google-Smtp-Source: ABdhPJxxqZUdExZOBF9nKZgfkHR278HkWlUXdCfyqaAnqC5YzB03zZrXdDteNmCeLLwKC9z1MjDeXA==
X-Received: by 2002:a05:6512:60d:: with SMTP id
 b13mr2627829lfe.135.1628776304119; 
 Thu, 12 Aug 2021 06:51:44 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.4])
 by smtp.gmail.com with ESMTPSA id z8sm296073lfb.30.2021.08.12.06.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 06:51:43 -0700 (PDT)
To: Li Wang <liwang@redhat.com>, Cyril Hrubis <chrubis@suse.cz>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <35db9a29-b5fd-8b90-2649-cfbdfad502e7@bell-sw.com>
Date: Thu, 12 Aug 2021 16:51:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 00/16] syscalls/sched_*: convert to new API and
 handle ENOSYS errno
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

On 06.08.2021 19:47, Alexey Kodanev wrote:
> The patch-set adds new libc/sys_sched_* wrappers to test libc
> and syscall variants of sched_*() functions seperately.
> 
> This is needed because musl libc returns ENOSYS for those
> functions [1], and the tests just fails with it.
> 
> [1]: https://git.musl-libc.org/cgit/musl/commit/?id=1e21e78bf7a5
> 
> v2: Using test variants
> 

Hi Li and Cyril,

Thanks for the great review! Applied the patches with all your suggestions.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
