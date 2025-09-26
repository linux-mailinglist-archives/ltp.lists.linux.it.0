Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A71BA2ED6
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Sep 2025 10:22:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1758874958; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=vEMc23eb5LPKO053yHtEqlgUmbskd5vTsuU1CAr94Gk=;
 b=WeDeo6IVjGCnEB6vqoVWEagLl09rE66AV+jvlJcHxC6a9dfZI+6X6GmtjqQO0DR5F6HiV
 ww4LQksDCvgQkqXqlUkF4CZGNxsfZaQUGUkomA9lI2DXFC2o0chRCaqzv+Uk+IYif+LK0OX
 cj2x0m5yPmCjVkZLXtmaoiQLEhDMbfo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE5753CE08B
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Sep 2025 10:22:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F0A7D3C2689
 for <ltp@lists.linux.it>; Fri, 26 Sep 2025 10:22:26 +0200 (CEST)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EA1891A00492
 for <ltp@lists.linux.it>; Fri, 26 Sep 2025 10:22:25 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b2fcfef5600so297801166b.3
 for <ltp@lists.linux.it>; Fri, 26 Sep 2025 01:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758874945; x=1759479745; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PAnbGsXOPJXXGcLs8ayKa3uzXCRcSMtcSoHW6kR9SPA=;
 b=CVIIS9h/AdQ7f/Yor0y6Vz9yeGpQZXWofy3aACbNu5m2fJ1riOfaG54LkMQWd1dhyQ
 egRzHfKeSL8MVVAdgPsfeSpv01zjF8cKiovUN6QKRRaQhe3idDBwY7JaOQDU/1+TKaoH
 wSUAZUL+FU66jf8/MgO3m87YGnsK6WzaJlE1Q+Dd3hbLBLNrBuyNlqciafyrddMfMoLq
 +eECx6ty13cufHkOsMkyaOOdi2T12DqQUJPPrhi+VUVjt+GoYnXFKDZDdtPuD7xQHmFv
 zDfhO3CXTJ5Blbh7MV8dmhK2SJ8RtPGws07CIXP0lIVCvARuSdvU+pld/wlT0OQmJ4Tx
 I9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758874945; x=1759479745;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PAnbGsXOPJXXGcLs8ayKa3uzXCRcSMtcSoHW6kR9SPA=;
 b=rSm/lGa68jb0dDBC5eo/j73XXnzt096cEO+1M1zqkeL/P0TUrgqpy5RKWNkCu43VUj
 lM9nAgYGX+lLhnSv9Lu5Q087bG7Gp/ySm+Zax8sLbVxi3yi55T94IfrueJS+TRG7iYYf
 ej2dvK5mSVbKpLrwYMhekRxN6MC5PHzAdU6ysxYO/zJ4BBkkKPlwe7m1jLp4YX4j9RL5
 MnqCBxgRJf2OGYHGS9kiOecFGAHZ/hZg0J8GimaynmMSRdYDRFPlXVqBTYhCayBR/xTa
 PHH1RUR8itvYqgV4XASUknhr5mpTDJdhuyFFn44Js40fD4QXurQk7E29H4bTnFNxTcag
 s3WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG4ofJu27Ip05XxjaQb7KAoTAXexSjF4Jth8zD5X/SHA+qu1vnMvR5FbewQ/eYSFy/9Tw=@lists.linux.it
X-Gm-Message-State: AOJu0YzZwJsO44epJDp9yxWpt+1RZTAKETS5Lg6eGW5wPcAqxLU5uIs4
 +JGVkzEUzunPBly2KHD0LgLgWcRrgyfSmXHvkMVGC+5Su+05cDEs3B9N0jU95efis20=
X-Gm-Gg: ASbGnctqW6tsDVFd+kr6UMs0+Qa+rj21hXSKNx73v+fvLFO+jw+ZrWGPzprKt3x2qrU
 PX/3kprRgHM1JdSO+Vqu1rSY7JAtH/RV7yNRL2H+Zi0SQtsAIrZBZZ9dUyTPTqQhamev4gKF4Hw
 fw0BXh+Ru+3BHHcCIzcx+4ixIKShYVytmHvOyKTjEB++ZFs2JfhZ+MybMGeAPORmwLpNa/++m/r
 B4dF8FPLcAPbatcFJk+RCX/MGYGtu41F4KhYNfX71FMyAALSZ05UqJ/+VuVrbGyPl1brw7oegsY
 Tj4giE0Ewd64IKj5P8IYkUFW1qfDj0csHhogAUvO0sFYL6nAr/6P8MHqrMU0/II2czwT0YhoUks
 zeY9FFMpXTtaq0aY6pfko1xMhp+wTDds2lMaIUBSF0/+LXbD4uJFZHIPZ3Bjt4WDaThZjEY1CFM
 bgY6yac+gs9IAT3Ph+VVw386Ss8NduBIp2hCgZXQvsAlXK0tBo9UhmSZ7ruqEyaaI=
X-Google-Smtp-Source: AGHT+IFx8jY724yMdHoEP38QyruxYqn3zZzXUc38hNW1ja/3cTehz2sgZMiXO7aDs1a6dJB5dsBulg==
X-Received: by 2002:a17:906:c145:b0:b07:88ef:fe1a with SMTP id
 a640c23a62f3a-b34ba93ca8amr794768566b.40.1758874945110; 
 Fri, 26 Sep 2025 01:22:25 -0700 (PDT)
Received: from ?IPV6:2003:ef:2f17:6d00:961b:d261:4569:b9c8?
 (p200300ef2f176d00961bd2614569b9c8.dip0.t-ipconnect.de.
 [2003:ef:2f17:6d00:961b:d261:4569:b9c8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5d566fsm321583266b.11.2025.09.26.01.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 01:22:24 -0700 (PDT)
Message-ID: <f69056a2-1280-4490-9b49-cfcbc0999c6c@suse.com>
Date: Fri, 26 Sep 2025 10:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jack Morgan <jmorgan@naotchy.com>, ltp@lists.linux.it
References: <20250926040707.671282-1-jmorgan@naotchy.com>
 <20250926040707.671282-2-jmorgan@naotchy.com>
 <4d514eb9-cf7e-430e-a0ad-dfffdf947fcc@suse.com>
Content-Language: en-US
In-Reply-To: <4d514eb9-cf7e-430e-a0ad-dfffdf947fcc@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] statmount09.c: Enable mnt_ns_id for
 STATMOUNT_MNT_NS_ID
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

On 9/26/25 9:32 AM, Andrea Cervesato wrote:
> +#ifdef HAVE_STRUCT_STATMOUNT_MNT_NS_ID
> +
According to the follow-up discussion, this is more correct:

#if!defined(HAVE_STRUCT_STATMOUNT) || 
defined(HAVE_STRUCT_STATMOUNT_MNT_NS_ID)

-- 
Andrea Cervesato

andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
