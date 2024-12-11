Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EEA9EC647
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2024 09:00:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1733904043; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=bElX6qbbUbYP1uGWdrlOAHk+0RG1YB0XGqWmQIOLGHg=;
 b=hX6y8L5eXlwI/q6QGGk38snwXuRz8HlqBXTTMH7NpkL5mqwV4evmm4geNwIL9G9PxVIq6
 igI5YClm4xjTatOXCc9JFi7wYAce2cFfnabCKtXodo2wZ2zDsSLEuBIxg/r+u9/dt8tMdmf
 svuYsh5Dr8Y7FCW/QKEVvze3avYI4VU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23DE83E531F
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2024 09:00:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BEE3E3E2BDC
 for <ltp@lists.linux.it>; Wed, 11 Dec 2024 09:00:30 +0100 (CET)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DE49E142507B
 for <ltp@lists.linux.it>; Wed, 11 Dec 2024 09:00:29 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso9219465e9.2
 for <ltp@lists.linux.it>; Wed, 11 Dec 2024 00:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1733904029; x=1734508829; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QEPEZsD8FbNS0L6vS9bsVy06uEYBKteHeTtl2hWX4Ac=;
 b=atfQybdZyenGDrLEFq1bIz8AFMDG+pVmH69L5gbIlgKdgp9buV07rzoPrnkAqnxScI
 HQqGKqZ4mETEUkVAiKarzVn+i71YtU6ymY9vuALtsQKAYy6p8p41ya8yu05omzttZl5P
 KutoJtR2OCpIqQKhkmqaMOQCjrEj2xRpyhpVNeYhEKY+sb4+aWY3n7f2XxvB8EBP80Gb
 OxGx8x1lKJQg6qodYu4/P61vd0XUbqr/wb2LDlUa97qGtWoz6wp1077MBoV4Gi2NrJKo
 ZyeHyG7zUO8K3+IzYzWSHk88R3clQdBAMb4ptp7XfxALNyr1gkNB21W9sVCkK1S8IXRV
 Ho9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733904029; x=1734508829;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QEPEZsD8FbNS0L6vS9bsVy06uEYBKteHeTtl2hWX4Ac=;
 b=FMYS95V9D8zQo6WLc/PvkB5/5xC7BLZYseo67GqPKnwTtek6lm2/YBO71MMxcBpITu
 StMBrnAWv+Y3tf3YIdXqLb5kRhy3YWzohZeDsHZ44s7Mri3GrGpC9poXb+A16aj6qxjj
 yoIFwZGb1OyXdk8uYIyC2RMUbAvserbIeXjgq8yfO2sUa+CuIRx8z1xuLjGxGbTXk/DY
 WFfPiePmR3SqaLU2TKTZrkOYSGg+K/L9UUldbn1kN+ex5J/c/8JtdkCk/eMXsWxjNS02
 UlBc6JH9ksiZeAjKk7UhOlUPAQwvulI4RslB0Jt8L3DZzRWviZZqzRbkakM+N3Y1ZHEg
 RDig==
X-Gm-Message-State: AOJu0YzE4mXqJK+f+4n3WVQQtT0fM0kr6o1xF62iiXqCidtzf/c4aFd1
 fayCHECdLw+VfVu+ewZsKdFYBcEEadHWiaX7X/r/s3Nh1Yzg36PwzU84WUYYljo=
X-Gm-Gg: ASbGncuRGZqO2PKxlSruGoNBC7Rlmjp+2oYUvhRYCjUVls2L0ZM9qVzHWZkZNO1CfyX
 njwkl7gYusFq/SKYmMqBFhA9La6JjxK1/2XQ2rVnJNagFwHKVxPrRtoBIeO9GknP69VobnRaJpr
 UxqmWI7BLd/DKZ1/KyDehnfXpCKJG9stSIOxndcXd0kOeTq9JecTFGE//cE+llDkcmJuUKSsK2y
 DJJ2792dhpbl03+iM3xOPxU4eNQ3CWRQDMMqoH7B2kclwIXMcT+2YXc94prjw4hPg==
X-Google-Smtp-Source: AGHT+IEDdzvIcM3mMbcnGwzGovUcYIMbmSoyXxSKOKFJAfADPmC/KAGA9kvKRg8ClR/lPAhoYL7UZQ==
X-Received: by 2002:a5d:598c:0:b0:385:f349:ffe7 with SMTP id
 ffacd0b85a97d-3864ce8959dmr1424694f8f.2.1733904029280; 
 Wed, 11 Dec 2024 00:00:29 -0800 (PST)
Received: from [192.168.42.37] ([193.86.92.181])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef85961f22sm8180034a91.35.2024.12.11.00.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 00:00:28 -0800 (PST)
Message-ID: <97682364-faaa-417d-aeee-c792fd227de7@suse.com>
Date: Wed, 11 Dec 2024 09:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20241210-fix_input_suite-v1-1-f8bb1d80d2fc@suse.com>
 <20241210202231.GA349775@pevik>
Content-Language: en-US
In-Reply-To: <20241210202231.GA349775@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] Verify virtual device availability
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 12/10/24 21:22, Petr Vorel wrote:
> Hi Andrea,
>
> ...
>>   static void setup(void)
>>   {
>>   	fd_send = open_uinput();
>> +	if (fd_send == -1)
>> +		tst_brk(TCONF, "Virtual device is not available");
> Thinking about it twice, how about renaming the function safe_open_uinput()
> and add tst_brk(TCONF, ...) there?
>
> Function is not used in library where tst_brk(TCONF, ...) would be problematic,
> therefore I would not even bother with having SAFE_OPEN_UINPUT() which would
> evaluate open_uinput().
Usually SAFE_* macros just TBROK the tests, so I'm not sure about this 
approach.
Alternatives?
> Kind regards,
> Petr
Andrea

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
