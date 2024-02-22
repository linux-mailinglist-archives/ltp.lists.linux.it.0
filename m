Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FFA85F7C2
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Feb 2024 13:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1708603724; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=OmEyZhR/Woy3zzaf+vHM0kTFVcqHS8z1iTpSB1POfDs=;
 b=exmDaeTwNv2zwxf5Rs7WURJxRmfX9mBzO2d64yn2eyETzsRrAd8g9NPeX4e3e6kYV6ZSs
 +fnBdHqzs+yzafNP3kgzB1MFnql9F0t8BJq2xRs7vTKk+dEiWaTaz5fS/9Jo9DIcqf8j36q
 Y4FqSPkGj1vTbeK7BEs7pT+waMIaWb4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 565D13CF17D
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Feb 2024 13:08:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6DF0C3CEFB9
 for <ltp@lists.linux.it>; Thu, 22 Feb 2024 13:08:41 +0100 (CET)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 444261401124
 for <ltp@lists.linux.it>; Thu, 22 Feb 2024 13:08:41 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a3e891b5e4eso517951066b.0
 for <ltp@lists.linux.it>; Thu, 22 Feb 2024 04:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1708603719; x=1709208519; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yDjURYv7lXs86C1wC8frEz9j582mOIBqhZ5TUO59KCE=;
 b=FfGdPCTTEwqO+wgAS+G3qHZY5TfFM+se1nlgybCw81uwzLw9LsqMomwWWssHClnWsn
 Ewh29JhCMCHzq8IwtDjHkrsT/R6GeJGG1E4urcjdCYrerzhsWi6dndmgyWEJhvqaD64m
 94mw0HzOASM8u5f5zoDw/exqG1L9ncuOybeR1I50NcF6o62Mw8LxYbl0cnO9Zp3GRViu
 R/2oxT7qEt2qgLxJo+Xd3FlUy1w6Vyi/p5+tkKiW0x9dLuv1T5P6gmHuNCQZKSoov1Og
 JvUotd8Clob1afGM/hgqsMThPRxEm9Dje+/S5t1Zks550wBcn+an9rKj0YvX88um+ils
 EXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708603719; x=1709208519;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yDjURYv7lXs86C1wC8frEz9j582mOIBqhZ5TUO59KCE=;
 b=jwaFZ8JLB5zqQrQnlmy4ZI48qU1R5eybzs6PX8md2Nk2ZKI7HeV/C7JZEa6F9TVOx0
 3FUR1fIk5fZk7GTGbLqxJcGtBAjxycU0r4bEU4NInM0/Sjk6nZ33a/3uRLxSaU0mICBE
 6ZHU83f7cp2lJapudxh8T/GPZU4ra0Ri8/pbkf66ABL3NpaAfbnZecrwOV4tW0Ii3X3U
 xjKQ+8/eHFAfFqAjq9vlTMBYDIMiQEbsSEGKVuoOaVoiHRjpXJE2oCiunkw+2Z3zR84M
 TDBWTBHlSVj6lNmbt+Pkv4XpE9eHOg4JMutNMjRx1wc8UAg28lNrymhRCoSM2ZPAUljA
 /Ckw==
X-Gm-Message-State: AOJu0YzE+ylBHyvqLk6PJeAjby0AC9pOQLgRrw3lSxfj9hEsAWP3uJ8p
 4niIXjxBuEXpOoXnERUEU1uuLEl3kk/u3TRHMGDJ+H+lyohN2OryEiMtMmOWra5x2pOT/4chHyp
 wUjU=
X-Google-Smtp-Source: AGHT+IFotqCZGusuUoZ9eG5wUfDUJmF0sr+RsCImB8A68k+PFmpE5xQWrYGiRtJXr0yT9G0dL8TPSw==
X-Received: by 2002:a17:906:2c4e:b0:a3f:a3aa:40f8 with SMTP id
 f14-20020a1709062c4e00b00a3fa3aa40f8mr233314ejh.27.1708603719419; 
 Thu, 22 Feb 2024 04:08:39 -0800 (PST)
Received: from [192.168.178.40] ([79.140.125.203])
 by smtp.gmail.com with ESMTPSA id
 kf16-20020a17090776d000b00a3ef85f0bf7sm2573820ejc.85.2024.02.22.04.08.38
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 04:08:39 -0800 (PST)
Message-ID: <ae31794b-df8e-4b0a-8083-746172f7fe52@suse.com>
Date: Thu, 22 Feb 2024 13:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
References: <07b542ef-1c14-4011-915e-48f07c7776aa@suse.com>
In-Reply-To: <07b542ef-1c14-4011-915e-48f07c7776aa@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] Open monthly meeting 6th of March 09:00 UTC
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

Please share any topics that you want to discuss here.

I have a couple:
- refactoring status
- .reboots_machine flag
- maybe reviewing status?

Regards,
Andrea

On 2/22/24 13:02, Andrea Cervesato wrote:
> Hello everyone,
>
> this is a friendly reminder for the LTP mailing list about monthly 
> meeting.
> As previously discussed.
>
> Time and date: First Wednesday each month at 09:00 UTC.
>
> Next meeting will be on the 6th of March 09:00 UTC.
> Platform: https://meet.google.com/hrv-hbpj-ird
>
> Thank you,
> Andrea
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
