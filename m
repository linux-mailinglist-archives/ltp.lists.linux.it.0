Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B9886D95
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Mar 2024 14:43:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1711115008; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=T/ofIlyfQdvio2lnk0NRJvTK2b8wF8zqSQnsfe56ndo=;
 b=cUirN0yZYvxs7YpaiP0iWyYorfVurgit6vHXqyU4M6tuOMwfvSUaApK3DvpOCvb0bntUf
 25WxOjr9hjiuR9jkMs9wC6ci75dzru/YcOMwq0lL4Le35NbLIOb/F6npSiE4yc9VPEaxV5X
 84OktQHQ1qcyBf84nWw690AdRFsBGdc=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 297883CE733
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Mar 2024 14:43:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF0FE3CA710
 for <ltp@lists.linux.it>; Fri, 22 Mar 2024 14:43:25 +0100 (CET)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D4D94208D3D
 for <ltp@lists.linux.it>; Fri, 22 Mar 2024 14:43:24 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a46dec5d00cso285802166b.0
 for <ltp@lists.linux.it>; Fri, 22 Mar 2024 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1711115004; x=1711719804; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vxMhaVXnW3NYoAHIWeHHjbqrtoxoXD+bQkUxhNhIrL0=;
 b=P/lyl/FMnwWN8zPnPhYA/Mq7FqvOrsRzHbYNBCPviVlwCaqFMmL7NNo9BSxSx0Dyu9
 Iq00djncicDtEq5Q9ksSVgTB6zStUECyUXg6e7wSqGia/ZCnokBZ71DC3AnKXl4x/YnE
 zwCZV3xUwC4E24+bXT3Mfg87wqdcueaC87cA4KvDMD9dp3i7Mot8Klk24XnXXqvhkeDL
 0u1mIznLgmgtxV3i+pznEaiZdYMaoPvhmwawuy0NW7tnH0ARIAXBYMjg+J1ICnxI2xnR
 I5Oe/+JGfUtEYkz92t+Q6NHHGYaQSLi7agcLnwD2JvKpcuAAsPiNa20kB62cCuxwZ++c
 jtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711115004; x=1711719804;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vxMhaVXnW3NYoAHIWeHHjbqrtoxoXD+bQkUxhNhIrL0=;
 b=MtwzIcIrEcKU3eDhOK7f9pzGbCz4x1hRkUXLa5yTwdPAHJtmqSJGgxv+3l1QW5sQIr
 JbsiBcvuoGR7woiH6gF5FlsQjX7eIU91dA2+PnaPUvj1NgCx6CBIleKYCFUDec6AtPqU
 xfO3cWtMyOYz63QM8a7n1qiFWXpcHvYfc5TZUXmHPm/XhV8KlO9Ky5fyGVdv9PbnlVhC
 u3WdJw1iKcf7zbX/C2f+Y4z216CbNQsVZivhO+eWFUKHsZaDocP6OIl3fufMq4CTFH6i
 nC0lqMEjEhqkr7AI4JlCE/J/PSKXy/F74X1vlf7cIn42qrhUycEkPVaE2vrS3H+4qvLN
 77zQ==
X-Gm-Message-State: AOJu0YwBkR9sswdodjdSfRLLTwnrpEEb5swNZ0IIj5Y0UJ6L2HB0RrUa
 qA+HTAzTOXp16XCKTEIr4jRMoUcMb9sKFO+GiO55Obi8XgFIL4P5j7cyRk1Gg3DWaPoMCaHv0O0
 VGxzsSyYH
X-Google-Smtp-Source: AGHT+IG+M870WD2cV8PFE+rrB2LiLgB6nVg0L91bvcGWCqketwcUmiqywXF+kiA6IbotyHVs4EQeZw==
X-Received: by 2002:a17:906:abc1:b0:a47:1b7f:f4fa with SMTP id
 kq1-20020a170906abc100b00a471b7ff4famr1594409ejb.20.1711115004289; 
 Fri, 22 Mar 2024 06:43:24 -0700 (PDT)
Received: from [10.232.133.97] ([88.128.88.144])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a1709061e8500b00a46da83f7fdsm1044672ejj.145.2024.03.22.06.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 06:43:24 -0700 (PDT)
Message-ID: <00c5cb3e-6b58-4192-9159-1825a05ac657@suse.com>
Date: Fri, 22 Mar 2024 14:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <75b59f47-5e94-4293-8f9d-746aab4ef7d5@suse.com>
 <Zf18fSP0uQoFOpl6@yuki>
In-Reply-To: <Zf18fSP0uQoFOpl6@yuki>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] Next open monthly meeting request
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

I'm also away that week :-(
Maybe friday?

On 3/22/24 13:41, Cyril Hrubis wrote:
> Hi!
> Unfortunatelly Thursdays does not work for me at all. Can we rather than
> that move the meeting to second week of April?
>
Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
