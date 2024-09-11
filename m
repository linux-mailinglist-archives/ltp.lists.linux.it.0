Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F85974F14
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2024 11:53:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1726048389; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=yketYcP0U4W7ww4Xgo1EVGliZlrJ488MUB+CjPEBKCk=;
 b=ngb+Co2XDu3byHbdiBeyApHBq40cQh1KA5qhAXbw/dHN6lTwVRDWHQK4+ziMOKzwTbgBV
 TKTkaq3i5K8jsAMQlLk6rIvs8QCRsHFzKyLL2la/mLJM0YGlxaMPDnB3+K/7zTOG9ZgOVq5
 VkU1xJiQamih2W1uoWchf2RdeJsDx84=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CFBE3C1C91
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2024 11:53:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6FC343C0E6C
 for <ltp@lists.linux.it>; Wed, 11 Sep 2024 11:53:06 +0200 (CEST)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7E88F14098AD
 for <ltp@lists.linux.it>; Wed, 11 Sep 2024 11:53:05 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so248265066b.2
 for <ltp@lists.linux.it>; Wed, 11 Sep 2024 02:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1726048384; x=1726653184; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OtX69hdzG9ZdbdO7qYjePk7hxmQ7QBsEG6W/mP55OHQ=;
 b=F7GzORPUZbHDZuhEumQUx8+UbCshgYVvyQqPs8D6djlMfyeygnGfLZzx/Oz6Ei/QqW
 X8+Li70Vf4JgK8hHKMGAl9rA25jPRBZMNDUkoWacRkzdYxZUyeQUErFjDNiIaOWmYQBU
 KxEbARMtuX4d1YCvmRWkaT2qJtGzH7H4/aqUUv6Rew2P+BgXNfQZyj2lTic9ZMPqRONS
 TSyvYkE3e9anPPvfF3szuO6JxjgZH1QyDrq7vcVlICEigL+pcl+o+Pxb/VLa4lacvoMt
 2ZUwgwhU5IsicumHr7iDpOO5z+GFiZhz8QHiuON498RIguBiX36NgO44MKtE5gJO7wsy
 fd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726048384; x=1726653184;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OtX69hdzG9ZdbdO7qYjePk7hxmQ7QBsEG6W/mP55OHQ=;
 b=CzA28Da77K8sFHxuRpGNEK+ElKDJJTnI45vNIvvRF1c9BhSyagh3tRncU1Y34p0Z2f
 5Gb5Swetu3x7A8gMC0cKC1zHPsmsoAju9slB7jyv2UFMItem5xaZaL+s6/N3IOLtQoPn
 TjPORQAU8a5wrFHcOJx6OdR4y8iK8qVpOyntMFH7hs19yWQql3pywEO/zu6McBq9iaqJ
 s+QGuuuFcIR0p0PFfWIzExqCRMcPM5WQFEACTXopWGmHSXbXyoEwhRiKepUIsas5DWhD
 1nt7teNCxkNYk4VzNuhR+bVZhB9Fzus32B2NQA1mhfhvySbuy1+BuHq7GiPT+WnIWvKO
 oT0g==
X-Gm-Message-State: AOJu0Yy79jDKz7qCamoJvwpstpjr9OvZ0rpVnHTmsX6w0cgf6452Sy+f
 sUQUzE/2+noLavp6gDe2liwGPtg4laFgAy2nTteLFo2jtKpoYrvquyzDDGUkSWF+SnSWB+eIKnn
 EHvs=
X-Google-Smtp-Source: AGHT+IEeUrWagEQFv8/qwOASRT4HjJbvo5jThIE/N+uWtBPUMVmk1X+S2UYNUYny207ZfT9mSnLCNA==
X-Received: by 2002:a17:906:d7e1:b0:a86:97e5:8d4e with SMTP id
 a640c23a62f3a-a9004834bb0mr250147066b.23.1726048383489; 
 Wed, 11 Sep 2024 02:53:03 -0700 (PDT)
Received: from [192.168.178.49] ([79.140.118.7])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835b0bsm602843266b.12.2024.09.11.02.53.03
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 02:53:03 -0700 (PDT)
Message-ID: <e0d17028-51e9-465b-92c0-cdeb9a9a2a93@suse.com>
Date: Wed, 11 Sep 2024 11:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ltp@lists.linux.it
References: <228e56c2-5bfb-4f96-a494-cdf98f96cb1e@suse.com>
Content-Language: en-US
In-Reply-To: <228e56c2-5bfb-4f96-a494-cdf98f96cb1e@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] Open LTP meeting 11st of September 09:00 UTC
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

Thanks to everyone for joining the LTP monthly meeting. Small recap will 
follow:

- kirk is going to be used by RedHat that will migrate to the JSON 
format report. There are a couple of bugs which need to be fixed
- LTX has a couple of bugs which need to be fixed in order to properly 
work with VMs
- shell library is going to be merged in the next release. After that, 
shell tests will start to be slowly ported into it
- kernel testing coverage will require a manual approach
- tests timeouts are sometimes to small and they cause random failures. 
RPi Zero can be considered a minimal hardware when we decide a test timeout

See you the next month.

Best regards,
Andrea

On 9/9/24 10:49, Andrea Cervesato wrote:
> Hello everyone,
>
> this is a friendly reminder for the LTP mailing list about the next 
> LTP meeting.
> As previously discussed.
>
> Next meeting will be on the 11st of September 09:00 UTC.
> Platform: https://meet.google.com/jon-gytf-uei
>
> Thank you,
> Andrea
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
