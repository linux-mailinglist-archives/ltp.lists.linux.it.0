Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FCA37EB5
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2025 10:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1739784982; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=ha/l/CfSU2+WBLrkIdfSAXklT5RnJE2OVz7KsqlRzKg=;
 b=BuOdx4IxcNZqsItR5t6zVDpp7qiONz9Lt1CBfjgxgxmgpvB6AAKmm2iaJWS3bgbiolJWy
 xH47/wR/UKLFXZYPt/+qb+I0mG/t+8sWmE0fo6ZnXZdd0PTRc4nc2Ic55NfaiGcV1dqq7vd
 CGdso5/rNCXqbB06nDqthM6o30+7DEQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 936AF3C9BBE
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2025 10:36:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 11A313C926D
 for <ltp@lists.linux.it>; Mon, 17 Feb 2025 10:36:20 +0100 (CET)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9193A1A0043E
 for <ltp@lists.linux.it>; Mon, 17 Feb 2025 10:36:19 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-abb90f68f8cso194245766b.3
 for <ltp@lists.linux.it>; Mon, 17 Feb 2025 01:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1739784979; x=1740389779; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r0Yr3vZvwaTnNNiIJYRJUJP/jbS2cd/qCzvhmr5HqPU=;
 b=CGdElh9+JC/J10jJvutBiO8cChGDzC8qJAGiWYeE6ZMSMzUze5/N7tHozD5Fsyo0wb
 OTN5bxRdOCNfHHBYrTTxtoDW+G1/iQgOmhRcZFpj6cPaLhAVyspGJHNSWiJ/iJfI6mRt
 2Qb01n8a1F7gNQob6FqjOyb4pc3GKt7PPDsRYnFX9+LTi0+6Jy24pjl4uRjckvI5tfw7
 cp51iynCy/SJMUcrtCRkCFPZh5EJo6YeBlrjbZZ3oTrLbyF4aF8Jst5s5Do2UCKjnyhY
 Ih+vKBfRji2i8ubRxwdvW/yVTRGzRbhwfCge+anMIBe1L+NKIjc6Li/6IopJxSGc8TIj
 vUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739784979; x=1740389779;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r0Yr3vZvwaTnNNiIJYRJUJP/jbS2cd/qCzvhmr5HqPU=;
 b=wR/FzaFHdBwJ6XlnjVcEjcc0XXsm4ZYLVjGwCD5+dIQs7fppG/6bORznaT+0BaexFf
 +68gB7ttDlXgCqUJGT5pb9mjfdfmgKHdVsV8PPxmsx4q8J+V7NpFqZwIB5vjliXw0uoJ
 dKCylJXXY+SMNu9ILgHZfyL3nPBnYk6zs+gfkJLOVrrtZpV32PUsyrsB9GExv3Wj3/uF
 /qVAFu2i4+8cFrCJc6iy5ki5hLX0IJDlasxTIkWEVdCl524qK0MZcRH1Rt1F/rErMnUs
 p7TaAnf8DRdzXp+Pvcd+DnkpvJKvu94NkhKUeuleV5yIYDoPT0TbPAFUEzg8zWWFow0w
 lNyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgU5lRZLpXySUtjEiSehQcxzSVn5vIIhjF1eIQxQpTW2+tQ5oa0ajnJxaRmsXRJq1ojzo=@lists.linux.it
X-Gm-Message-State: AOJu0YyYA4DTAC+SCQrSKfc96Ngsx5Bf2LLyhvhSL9O1qASOeXfGwX7e
 h8GW5DwJTBq+i822yOgcYCli/qsaKz3Bdedmt1j0RlT+0I5ILvbIKaixUih+bO0=
X-Gm-Gg: ASbGncvBqOcDid8p2iTUsbngbylJYXMqctWxu/oT/D5iIgbM2M4S4ZM09QUU3g8x2hU
 Lqdlwi3Pqbi52iahbWuiC8NBFiTta/aEb0StgAkgTVMCQu35aBmOdX6rtpb6tOLXkuSDF6jN4cw
 6WSl2quj4yVo8M5hTH5DoT1arJvxXnpxwkK0dhfnWHW0BKVhDzzmfP1pCOWQJADan0NsFOeQbjz
 DalRjT9M9uRqMxPWziinv8ZZtgNmjfiElOWnyj8Fn9U9Bf5oS+IPHvOYIqIj2V6VncRYYsJMYZI
 qM7ySlY/Gf0syguRS3bolXTlDHCzfDfLtunSICqKWjZlcTWIS+lrqGdyDaFVOMf7iOIg9h6UZ2J
 d0xiIN5wU3PRPDN3AAlHi3is6ckhKA2SLHblZZkLrl9CNu6yspKU=
X-Google-Smtp-Source: AGHT+IH/4o3aj9PlKONsfJuZMN/D2uvzUx51gU0sBAbknk3u6BhomBBm+qgqDqwrXjHRUwCIjieLFA==
X-Received: by 2002:a17:906:4786:b0:aa6:9503:aa73 with SMTP id
 a640c23a62f3a-abb70df5273mr811201266b.51.1739784978902; 
 Mon, 17 Feb 2025 01:36:18 -0800 (PST)
Received: from ?IPV6:2003:ef:2f02:800:9162:c8ad:3b21:a399?
 (p200300ef2f0208009162c8ad3b21a399.dip0.t-ipconnect.de.
 [2003:ef:2f02:800:9162:c8ad:3b21:a399])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb74534a70sm446633366b.82.2025.02.17.01.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:36:18 -0800 (PST)
Message-ID: <db9ee8a7-c6b2-4edf-8758-13f923d68f7d@suse.com>
Date: Mon, 17 Feb 2025 10:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Xinjian <maxj.fnst@fujitsu.com>, ltp@lists.linux.it
References: <20250210084310.357516-1-maxj.fnst@fujitsu.com>
 <20250217091144.827361-1-maxj.fnst@fujitsu.com>
Content-Language: en-US
In-Reply-To: <20250217091144.827361-1-maxj.fnst@fujitsu.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] fsync03: Convert docs to docparse
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

Hi Ma,

we are currently moving from docparse to RST format [1], so if you want, 
you can already update to it.
Thanks,

Andrea


[1] https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html

On 2/17/25 10:11, Ma Xinjian via ltp wrote:
> Signed-off-by: Ma Xinjian <maxj.fnst@fujitsu.com>
> ---
>   testcases/kernel/syscalls/fsync/fsync03.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fsync/fsync03.c b/testcases/kernel/syscalls/fsync/fsync03.c
> index d32c4a3e7..d8c321b85 100644
> --- a/testcases/kernel/syscalls/fsync/fsync03.c
> +++ b/testcases/kernel/syscalls/fsync/fsync03.c
> @@ -4,14 +4,13 @@
>    *   Copyright (c) 2019 SUSE LLC <mdoucha@suse.cz>
>    */
>   
> -/*
> - * Test Description:
> - *  Testcase to check that fsync(2) sets errno correctly.
> - *  1. Call fsync() on a pipe(fd), and expect EINVAL.
> - *  2. Call fsync() on a socket(fd), and expect EINVAL.
> - *  3. Call fsync() on a closed fd, and test for EBADF.
> - *  4. Call fsync() on an invalid fd, and test for EBADF.
> - *  5. Call fsync() on a fifo(fd), and expect EINVAL.
> +/*\
> + * Verify that fsync(2) sets errno to:
> + * 1. EINVAL if calling fsync() on a pipe(fd).
> + * 2. EINVAL if calling fsync() on a socket(fd).
> + * 3. EBADF if calling fsync() on a closed fd.
> + * 4. EBADF if calling fsync() on an invalid fd.
> + * 5. EINVAL if calling fsync() on a fifo(fd).
>    */
>   
>   #include <unistd.h>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
