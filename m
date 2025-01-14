Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85EA10892
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2025 15:07:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1736863660; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=qwBwYGd8+ACleV9DpXaA+m+TZ2NvWaDOh/CzUhnowN0=;
 b=cYswJAaKYtvZuR3MzqYnmKvHC6sUn8Ou//ZmgRteyRchmHZg1oy8X8qdUhxgkxHxAW9+d
 XXwMh2yM8K8W5AkJpX2mV1l0W+ZRNEAgKKUAd6AtZxMAkshY9J2jyunbiYN2t1e2PhLTQgW
 P+vGnuY2NEgBQU7wMHBGJfZeg2MIS9I=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 351163C7AE1
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2025 15:07:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6020C3C7AC2
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 15:07:37 +0100 (CET)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 91F5C7D45A5
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 15:07:36 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaeef97ff02so902066166b.1
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 06:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1736863656; x=1737468456; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4mYk8OYID3RhBP6pBiYEiMrELd2401vgL9kRTEEHySc=;
 b=Ns1k7Mk644MFq1Z50LeKtHzdkIBX76j308lVLkoUDFtzth0SH3DsEjVfhz3IrqsWaK
 t7Lh5XrMQ3yjjBE4Q63Tbk7smO3ICfdr/YWzkkFAURVoMJZLVbmUTFcJHqUbF2sYW1zX
 4gwzDwJSyud8gc3kt2FSwqlAoTUREqW4zAzlNpt8tsfrje1TPDZbxsuXZifJcFaScqtR
 WOvs90evyOjFKnVnM3i+TDpnIQheRozV+OVDmdkGaMoGvQOGZxcRoeMcu3hrOrEul9M8
 hdHqi9DdECjRcTO9aiRyk7iFea7ylT3pwD298V530nK3XmyGBa+pzNbvfZAapU+BpnfY
 5dQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736863656; x=1737468456;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4mYk8OYID3RhBP6pBiYEiMrELd2401vgL9kRTEEHySc=;
 b=xIkjo0/WGatfz2RymV67hQJIxne1ngUduNryCaMjg7878Ke2PGbPIoCdxpArxq9Gxm
 /4iiKaDZzLVD+6jKlgrk022dphWNVtmBMPUlVO1M/UyS/RP2luaFYswymBCYEeidU0p2
 k+U7v8g3GYCvI0vNxoaW3OjOAljGLkU/8LTvoSSFv8JzIdo0uUjUc0uYMPmDvywEB5wB
 fKr0eJlD+0GV0K3sl449sGrBrl+ZkLwZ0YtQIxTQoXLWPDNUrofd5oI8ZTgp/PePe/86
 /7+9l5H9MoW5uRsHzX+LO55jJNQouLWl+bheKmwS1ZOg3BrRRsuAYn+PfPLcz2BLwECx
 mzTA==
X-Gm-Message-State: AOJu0YwA6AZCdyhPjznbZutV8ZH6w2u5OTIiH9yl6gKfBhq9oTxuer9f
 BDWQHmK0dtwmwyTB+pX3HUYNladuOB1RrdWLGY+lI9mFnsLok8xyfoskI8yOE249is4G1mocGid
 Eg6M=
X-Gm-Gg: ASbGncumphFyw0F+NM9D+ftvTqbc/WwAoY3EIZBfiU3po0vGZ4VGpHywG9F8mF+0qVy
 DlX7/2LqSu+Ik46kjVwv+WIaFXv8DeOpw9kwbfI0o3nNdVCcRROeSrHgOEc59ps3OXlsTEAxo7A
 CJRd0riEIPqbWzRRnbeFnb0ihrb9QG9Bm2F9OZ1zeXsYTagKGJLgfoN5cycjc3kvfYkANVTh7dW
 Nmjm1bngtSvKc4MnHhxmczkm9zO9garvUEijtpm4idscimEQH1db+7i1hst3hy5jPs=
X-Google-Smtp-Source: AGHT+IHPRHsnBS8nH6jmIOa/T7O+mfKgFbk6IpxfS6T3LQCS6WWE0FpBMSWBNGuTYI0IhRqdoE1czg==
X-Received: by 2002:a17:907:998c:b0:ab2:c2f1:4578 with SMTP id
 a640c23a62f3a-ab2c2f145fdmr1979532666b.4.1736863655436; 
 Tue, 14 Jan 2025 06:07:35 -0800 (PST)
Received: from [10.232.133.36] ([88.128.90.43])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab33d62550esm70651666b.166.2025.01.14.06.07.34
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 06:07:35 -0800 (PST)
Message-ID: <82292c41-8d77-4f1c-b58d-fa842760c09e@suse.com>
Date: Tue, 14 Jan 2025 15:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ltp@lists.linux.it
References: <20240528034718.31798-1-wegao@suse.com>
Content-Language: en-US
In-Reply-To: <20240528034718.31798-1-wegao@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] pwritev201.c: Add check for RWF_APPEND flag
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

Hi Wei,

On 5/28/24 05:47, Wei Gao via ltp wrote:
> Signed-off-by: Wei Gao <wegao@suse.com>
> ---
>   .../kernel/syscalls/pwritev2/pwritev201.c     | 35 ++++++++++++-------
>   1 file changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/pwritev2/pwritev201.c b/testcases/kernel/syscalls/pwritev2/pwritev201.c
> index 987412ba8..cb329d8fc 100644
> --- a/testcases/kernel/syscalls/pwritev2/pwritev201.c
> +++ b/testcases/kernel/syscalls/pwritev2/pwritev201.c
> @@ -2,6 +2,7 @@
>   /*
>    * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
>    * Author: Jinhui Huang <huangjh.jy@cn.fujitsu.com>
> + * Copyright (c) 2024 SUSE LLC <wegao@suse.com>
>    */
>   
>   /*\
> @@ -15,6 +16,9 @@
>    * - If the file offset argument is -1, pwritev2() should succeed in
>    *   writing the expected content of data and the current file offset
>    *   is used and changed after writing.
> + * - If the file flag argument is RWF_APPEND, pwritev2() should succeed in
> + *   writing the expected content to end of file. The offset argument does
> + *   not changed after writing except offset argument is -1.
"If flags argument is RWF_APPEND, pwritev2() should write the expected 
content to the end of the file. If offset is -1, verify that current 
file offset is updated."
>    */
>   
>   #define _GNU_SOURCE
> @@ -42,13 +46,16 @@ static struct tcase {
>   	off_t write_off;
>   	ssize_t size;
>   	off_t exp_off;
> +	int flag;
>   } tcases[] = {
> -	{0,     1, 0,          CHUNK, 0},
> -	{CHUNK, 2, 0,          CHUNK, CHUNK},
> -	{0,     1, CHUNK / 2,  CHUNK, 0},
> -	{0,     1, -1,         CHUNK, CHUNK},
> -	{0,     2, -1,         CHUNK, CHUNK},
> -	{CHUNK, 1, -1,         CHUNK, CHUNK * 2},
> +	{0,     1, 0,          CHUNK, 0, 0},
> +	{CHUNK, 2, 0,          CHUNK, CHUNK, 0},
> +	{0,     1, CHUNK / 2,  CHUNK, 0, 0},
> +	{0,     1, -1,         CHUNK, CHUNK, 0},
> +	{0,     2, -1,         CHUNK, CHUNK, 0},
> +	{CHUNK, 1, -1,         CHUNK, CHUNK * 2, 0},
> +	{CHUNK, 1, CHUNK,      CHUNK, CHUNK, RWF_APPEND},
> +	{CHUNK, 1, -1,         CHUNK, CHUNK * 2, RWF_APPEND},
>   };
>   
>   static void verify_pwritev2(unsigned int n)
> @@ -60,7 +67,7 @@ static void verify_pwritev2(unsigned int n)
>   	SAFE_PWRITE(1, fd, initbuf, sizeof(initbuf), 0);
>   	SAFE_LSEEK(fd, tc->seek_off, SEEK_SET);
>   
> -	TEST(pwritev2(fd, wr_iovec, tc->count, tc->write_off, 0));
> +	TEST(pwritev2(fd, wr_iovec, tc->count, tc->write_off, tc->flag));
>   	if (TST_RET < 0) {
>   		tst_res(TFAIL | TTERRNO, "pwritev2() failed");
>   		return;
> @@ -72,17 +79,21 @@ static void verify_pwritev2(unsigned int n)
>   		return;
>   	}
>   
> -	if (SAFE_LSEEK(fd, 0, SEEK_CUR) != tc->exp_off) {
> +	if (SAFE_LSEEK(fd, 0, SEEK_CUR) != tc->exp_off && !(tc->flag == RWF_APPEND && tc->write_off == -1)) {
>   		tst_res(TFAIL, "pwritev2() had changed file offset");
"pwritev2() changed the file offset"
>   		return;
>   	}
>   
>   	memset(preadbuf, 0, CHUNK);
>   
> -	if (tc->write_off != -1)
> -		SAFE_PREAD(1, fd, preadbuf, tc->size, tc->write_off);
> -	else
> -		SAFE_PREAD(1, fd, preadbuf, tc->size, tc->seek_off);
> +	if (tc->flag == RWF_APPEND)
> +		SAFE_PREAD(1, fd, preadbuf, tc->size, sizeof(initbuf));
> +	else {
> +		if (tc->write_off != -1)
> +			SAFE_PREAD(1, fd, preadbuf, tc->size, tc->write_off);
> +		else
> +			SAFE_PREAD(1, fd, preadbuf, tc->size, tc->seek_off);
> +	}
>   
>   	for (i = 0; i < tc->size; i++) {
>   		if (preadbuf[i] != 0x61)

Probably RWF_APPEND test should stay in a different file since 
verify_pwritev2() has a more complex logic and we don't want to 
over-engineer code with too many if statements.

Kind regards,
Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
