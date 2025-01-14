Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F4A10626
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2025 13:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1736856329; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=y4Ul6GtxzUo5xS1iUKY8cdw4OvsHh60L3Z5ssxTtf0I=;
 b=n3yzUt2iTQ6VlmQGFueUMC+0ZXiweThGzTFSZZRU5WZs1G5NmJyceT8edT7qn7sopzQ9Z
 QjtAVF85J7IVntiQjbZ+dbOu2tpIbqaXy2AiTZ97/njXjONLgBhV59cQOId26ArSJnUQ+IO
 jQoIKVdp9Mj+y6RKm5cDuxVRL9ynLv8=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D1493C13D0
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2025 13:05:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C32E43C13D0
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 13:05:16 +0100 (CET)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 494FC1402F86
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 13:05:16 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38a8b35e168so3341054f8f.1
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 04:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1736856316; x=1737461116; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7uIGJGidSrDXuOd5iVbJGn4CMRoZXnL5di5OwXC8w4g=;
 b=EW1mnuxaIZnbmNHFX/Lteyk9stgOo/4enY/lZKg42A/SmleTL8GC53UNY1eBF43OR+
 lI8T+PY11ts42+Yn+j2wrwQUkvk9fYCkFID4KA7STW4LHfBo9WsCyDl1SeXcyIIzlr9n
 V2bktZ5OpLLm1zcn/ob9mKbDZ1UNFlTkgLZvYOA1bNFpV0iJHVT5Po5zpjUQayHpmya7
 Blvfa2mOxp7VJVxJ83/a6GeOsK2XZS88suxsCOFjVpD4WVTNVrNkrlP1Ha36rCrZP9iv
 kPhOzEEi2KNXtodt4hxuYIG1rHvFwOL8QyFcfZZ6e2WAyYABhWpcNGu4Mq6pkcU26q2x
 zqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736856316; x=1737461116;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7uIGJGidSrDXuOd5iVbJGn4CMRoZXnL5di5OwXC8w4g=;
 b=N4yrkqPIYDfXTtV29yuTy7oNkOVpuaIwGSLIgCD9anMu191i4WbxV3I8zUCdu6byq7
 lKu9O5+/cCgwPe6tcUyhHWnTRhFF7401E4v4sj7e5lRkH/5/G+C03oMVaJz/7hKXBjAY
 lSRhfWxQbJxUsbsEVa6e8n9Doj76s/1bT5/myb2ux1Zqye0rZbWzC91aPd2ItEcbtYph
 ge7HXQChorHNmR+Kz2BK8r8bjWXOrbPhs8vJw5cg9JQq4Poy37zT8jPBLOyYSbs1rZ+j
 k/49xjsAnVtj9n2Wbpb7xMSb//sDbPVaER/Aw4hpbmb+nfAPaKRRnzlluFkVRJ5TZcAN
 uB2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPv4QzIaBZ8ffptYhqSqNb0kZXZ6fPH2uaIUmCuGZchBLMapTWviTE1ASwnftHWpS2Jf0=@lists.linux.it
X-Gm-Message-State: AOJu0YxCV9yTmQ8PmRDBYuZZiBfAQToCz3Iyc5UCUm2eYYxMvjm0ddz7
 EEZTiLTcRusyIeLXubYqjMK/5nHSour35sHlFkmgwBplcNuG2L8g66K5C8Aicvg=
X-Gm-Gg: ASbGnctcc78aidPJP/+KM+Fwjn4UZah2c4JHHl+I6Wk9hOTlXsrEPhTNeM7Zmdlv6Su
 9hMq1SthfzzGQe9UJi6LbW49moqsrPcMJ0OeoNMBDGcXP+6NWgZZCl8PY7nglTXM69HpURcpJno
 YxmuZBSR/vzsWZXDuePwfs0+haTBEvA4Y6A+OV8bZBtc/1hcWEwHsmIjLWgJ8Cc+HKOTCdr4PS3
 jgsoDEu6CQlvZucUfIuWJtx7nSbmywi7uRGG2XI0M3qTrvLhvkrnRNGFgMNOAcMpF8=
X-Google-Smtp-Source: AGHT+IFn414+h6F8/e3jwuyMbcNcsoz+HRXw8EXukE059bIo7w0AMLpYtH9UjZ2KHHk1oxO1EJFdog==
X-Received: by 2002:a05:6000:1864:b0:38a:4df5:a08 with SMTP id
 ffacd0b85a97d-38a8b0f3163mr17379228f8f.22.1736856315669; 
 Tue, 14 Jan 2025 04:05:15 -0800 (PST)
Received: from [10.232.133.36] ([88.128.90.43])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436ed48f4b2sm160487565e9.24.2025.01.14.04.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 04:05:15 -0800 (PST)
Message-ID: <13232b25-41fa-4e4a-9c14-fb90acddc1b7@suse.com>
Date: Tue, 14 Jan 2025 13:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20240516112016.309145-1-pvorel@suse.cz>
Content-Language: en-US
In-Reply-To: <20240516112016.309145-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] lapi/mount.h: Document reason for not
 including <linux/mount.h>
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

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

On 5/16/24 13:20, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>   include/lapi/mount.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/include/lapi/mount.h b/include/lapi/mount.h
> index c1af944fe..e3e639965 100644
> --- a/include/lapi/mount.h
> +++ b/include/lapi/mount.h
> @@ -1,12 +1,16 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   /*
> - * Copyright (c) Linux Test Project, 2015-2022
> + * Copyright (c) Linux Test Project, 2015-2024
>    * Copyright (c) 2015 Cui Bixuan <cuibixuan@huawei.com>
>    */
>   
>   #ifndef LAPI_MOUNT_H__
>   #define LAPI_MOUNT_H__
>   
> +/*
> + * NOTE: <sys/mount.h> conflicts with <linux/mount.h>, therefore not added
> + * although some defintions from it are used.
> + */
>   #include <sys/mount.h>
>   
>   #ifndef MS_REC

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
