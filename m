Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4038B9719A4
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2024 14:39:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1725885557; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=E/nk1TE6FpK0Y7rSGie7faLZZeKBvi8ls0Tw+9atx9M=;
 b=nUedqIpehaRJBz8VAQu7qgiqXoAVpVk5GH7S4zTksbcfOiDrB5KgK9ZBxI6kEKJbuwrVh
 27bS3+i/jf7amuZTXuiyASyZ22o2eOaz7Evq0E1PEo7tdjm+dKtLbaBWcamBRY1eemLDXiZ
 K+XQeYGlTwgeXL1+YI6J9NnOq/+WRaw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9CF53C14EE
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2024 14:39:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 342F33C0F6B
 for <ltp@lists.linux.it>; Mon,  9 Sep 2024 14:39:05 +0200 (CEST)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 81B361000972
 for <ltp@lists.linux.it>; Mon,  9 Sep 2024 14:39:04 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso39876266b.1
 for <ltp@lists.linux.it>; Mon, 09 Sep 2024 05:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1725885544; x=1726490344; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IVg3PVh1ebie/QlU5zTzs/5RC1rf1SKS+pT2cJEvnBg=;
 b=OJkJ7MMCfquKbrc+0+KcAzJdKEtetyOM7A6VQGzc3vSI9jN5ka53u+J3RipqkbskYY
 ln8n9gfDx/OkysSqCI0s8XD9X8CoVYL5DCwfOlF6T3Q4d9RjEl4JKHaYNEnT+aTuI1OA
 5PdU4cHQWx5dbbkOXu5Z2xknEjGv5hNtUhjtYgytClSD1qacEl3c/2MIohgHPgyhlOyr
 yVsav7oLf+PaIh6+wcmwcAw6Gbo1eT8HfquKgO0AKkiN/uqNUnM61Zx6QjuyPP1ZjnPi
 SQbqdnIiPQFkISWAFQGrsS/r1Ic/Bp7/o8RZvgjYflAmvOb2ZleT0fMrHfoSx2JvlNGn
 1hiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725885544; x=1726490344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IVg3PVh1ebie/QlU5zTzs/5RC1rf1SKS+pT2cJEvnBg=;
 b=iEfMh/LgvxQ2NCFS1Cp3tb6ffqBOzbIFjh2CeRaSGX5xTqqUwCA2ykAeUIaFE6CWnk
 Gt74lmv76FAO1eVMIcN/jWslLLi6xbNQ36PEckrDwOAgV6HLSg9YopUugd67ZIS57GY7
 JMXdUcfwCkFKkN6euV/ugF8xaRCDj1+zBJ2padJ6A5jjHMSy8LLNBkWKWBChTswYkjUJ
 Sdds79rcohtou3fOy8Bux1SJ14JB1CFozDlBwbLJJqub3lGeXUGSQSd4TPc6At72oIR0
 kTB23LZ9yUT1LR8T5tFBVQLMKkJ5mAgCC9YskpQYD6bgfGHiX3GRx5qPYTv2jeSyo3OM
 cZ7w==
X-Gm-Message-State: AOJu0Yy1D8hNg9oDZch+57c1kzlX2BtW4EKp9gJBN0Up1CzAwzndBHJ+
 SR3X91JiSskf5eXLb+YqqBXg1olY16vodciZz87zP1/gH9PdwPyyU6idI9mG2kj9VGaaWLbH4dl
 GSOI=
X-Google-Smtp-Source: AGHT+IFJZ5T6PXDD7EVZLqGfbJgWmie/IkjCik+31d7/7wTXB0Fj20zIdnFShOCGgoSb7Nps8j5mqg==
X-Received: by 2002:a17:907:980c:b0:a8d:63b5:e795 with SMTP id
 a640c23a62f3a-a8d63b602b3mr195661966b.3.1725885542934; 
 Mon, 09 Sep 2024 05:39:02 -0700 (PDT)
Received: from [172.20.10.3] ([37.162.80.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d2583555csm339171766b.15.2024.09.09.05.39.01
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 05:39:02 -0700 (PDT)
Message-ID: <253d2256-1037-4174-b013-77f596c09eea@suse.com>
Date: Mon, 9 Sep 2024 14:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ltp@lists.linux.it
References: <ZtWLSQSSqmh0tn13@yuki.lan>
Content-Language: en-US
In-Reply-To: <ZtWLSQSSqmh0tn13@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP release preparations
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

Hi Cyril,

I have a few patches which I would like to include in the next release:

- fork05
- rename15
- fcntl14
- process_mrelease testing suite (this is a minor priority for now, but 
it should be ready)

Thanks,
Andrea

On 9/2/24 11:54, Cyril Hrubis wrote:
> Hi!
> It's about the time we start pre-release preparations. So as usual
> please point out patches that should be reviewed before the release. I
> already plan to look at the Hugetlb patches, anything else?
>
> Also it would be nice if anbody else had time to review my shell library
> v3 patchset, I asked Ritchie and he had a look, which is great. However
> I would like to have at least one more person acking it before it gets
> merged.
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
