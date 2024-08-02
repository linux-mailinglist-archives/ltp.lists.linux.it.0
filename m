Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D98945DDD
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2024 14:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1722602353; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=hEZNXZ3yYwHYPc9O3ChscbA48rKSsxACKKYwUPwJIAU=;
 b=Jk2PkipLF1ulX63+NtFdtCL11sfP6HSq2IqGlRRT5dYU9cvMn298x4qar1vk91rdbeRRF
 tOqllyBN+7MVPrmXj3z+CMmqbMAkclB9CFEWPSM/FVJ8GLKPcT8feoHy/3JSaicBNXWO0PT
 Z1EGezAeBZK/AwgRfr6lt8TvK5c50CI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C24A3D1F5C
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2024 14:39:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5F3C13D1F43
 for <ltp@lists.linux.it>; Fri,  2 Aug 2024 14:38:59 +0200 (CEST)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 482761400078
 for <ltp@lists.linux.it>; Fri,  2 Aug 2024 14:38:58 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4266dc7591fso51451105e9.0
 for <ltp@lists.linux.it>; Fri, 02 Aug 2024 05:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1722602337; x=1723207137; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQulJ6MVKW9BqSj4i9jC/dLxYyrYD0uZwwSAJX1AehU=;
 b=fiQVVnUkNJ62XFwNfmRMmHBQsmYA8XWVWjapKNaFZ4iw4ZHFVh3x7aTh80k0qP2Vqc
 ddVqvFj8nkzCs58PBu1RFdrPGP4tezjXJhcKOYj6+8mIN67tlh1Q7ykGL0RKFJIi475Z
 glM9KPrjxggeXBD4fqJfeMWThbt9DO60T/Ry2Ma86qZM51FBhQU/0OaijDkb9FSIX8kA
 R1bTquUAe32E+XCFEzyWyeHSMbGcFLq0Q/8Zko4n132CGeVirYt4wD4wu/9KxIB0wg5W
 NrMawFjBH7WNBQzwAYSCsUAs7W8b8BidF95THTx1J+v6e85OZJ6KsB7GRjn7W/ivYLc9
 7Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722602337; x=1723207137;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQulJ6MVKW9BqSj4i9jC/dLxYyrYD0uZwwSAJX1AehU=;
 b=brEWDS46b3V+yO4Cfii41SGPLOFUPJcmUraL8yyokRNS9QPqi+2x6pFEoQU+Kx7z1B
 ZX+9z5p4Wcy2t10NysauPAoPO2O4FJrj0A7esOnlWUKQy92+K3ILB30TguMyyqrOKC3B
 19gtl/Dr50ZBdUrcYKiW9g4hPLcZxtm0tQrKcVSBqfsvI6zaV904DbsZvGR5i/IWbtNb
 O5zyrVsC5S6xV1PRwYpb4mY/c2tPLBqOI+2CXFg7AqGJkBAj3Z0lfqihGc10YEYaWoR4
 70Ww2f6ufkpfC35e/AH9HDg8H4aYfSPuPD7zea7S3Rqxnxuoks9R6GulD5V3UqQSGOBh
 XwHg==
X-Gm-Message-State: AOJu0YyiB1PJhaB3ac7fyVx3Phh3llofV3G+cZp9Av5SI0RMcR0Vsgle
 jDoawsnQJxxYT2yzNRFQLjCrnMImo1JFQDRG59QwzQxOzjXIFWTVpkjJonR9tl8=
X-Google-Smtp-Source: AGHT+IHmXzp2g3jqIptYdJcaMsESneY890pX7ikr8egvx1iMjBmQsHy5NHguGaPOUA5vIy+ea4B/oQ==
X-Received: by 2002:a05:600c:a0b:b0:427:d8f2:5dee with SMTP id
 5b1f17b1804b1-428e6b00661mr21852595e9.15.1722602337147; 
 Fri, 02 Aug 2024 05:38:57 -0700 (PDT)
Received: from [192.168.1.59] ([151.51.15.217])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb64952sm94350975e9.37.2024.08.02.05.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 05:38:56 -0700 (PDT)
Message-ID: <74484b28-7120-4d3b-aebf-84ba3c43a35f@suse.com>
Date: Fri, 2 Aug 2024 14:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240801-ioctl_ficlone-v5-1-ab44ee1d8709@suse.com>
 <ZquW2q31IpQfd5FD@rei>
Content-Language: en-US
In-Reply-To: <ZquW2q31IpQfd5FD@rei>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5] Add ioctl_ficlone04 test
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

On 8/1/24 16:08, Cyril Hrubis wrote:
> Hi!
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
>
Pushed!

Thanks,
Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
