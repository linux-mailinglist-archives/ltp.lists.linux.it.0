Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE20A87AACB
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Mar 2024 16:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1710345362; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=hyojji+QBuDMF970WtnZ6IQjngth8m2+ZRUDHzSQ4a8=;
 b=Ybz452RHDWndukrZfdd2xvZ/F2mJf2hPyzmLgiNpbS4PSQJvOHzoDSMQxjJ+xnlccvjXM
 423L+2jCirFGCavkO+8ZfZTpBM4MQeJdaES54SB0lrCg34XU2iG0DVxhUa8K9mqvHu/p0GL
 InzZYG1rTkubbX9ilNS5d3vAPKyxS1U=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 878793CE972
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Mar 2024 16:56:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E9E353C06AC
 for <ltp@lists.linux.it>; Wed, 13 Mar 2024 16:55:57 +0100 (CET)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E66D12001AF
 for <ltp@lists.linux.it>; Wed, 13 Mar 2024 16:55:55 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d27184197cso89870301fa.1
 for <ltp@lists.linux.it>; Wed, 13 Mar 2024 08:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1710345355; x=1710950155; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5v2iGtEUNH/AWhRSDSYsRgtwiVt0uRW31P+DBl1Dy2U=;
 b=bTlhdw5QVtDoBgz8t6F/86ce8Yor1D8Yhw0xByqSKG/k2srpF8byR4QgjSq3amzikV
 agInNziioxWjcUHjv6tBuSKO0GoFXdjZkHCcTjsv+fqubPBWck9vx1jl1RxQ60JYeI76
 3j2HSNs78wJbebBRvpdtPt5azMqu/DsbzCDDF216S8nmblQRWge2EeuoDllvUp7kQDMg
 Ic1IU2NujVJgW0MVEQWQFmmvC1gU/4pzcH7CrIwRpsZEOHhRTA9xWMHIJ+9l0nDzb6y7
 HTQN7zBP318zclGV9E2YB+khLWOLvg3mLe7CTpwqq+QnQ3usqXQ+0eEbT2T6pvj2hZhk
 hkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710345355; x=1710950155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5v2iGtEUNH/AWhRSDSYsRgtwiVt0uRW31P+DBl1Dy2U=;
 b=VSxqNp/JTqJ3/2l07EJKn9pUb4foG3alA77DnCpps+7unEi4ioumKmdOKL+kX6SkIH
 Y/6k5LldL8f0gl0C3iHFsKH1ZhcYmjo/K1oNULSKRSd6TszmdvIV8B0aXwPt2Ohg7RSQ
 diUicy/WNUFL/jicO6pjmYrt2oyj2VhuXdkeHjsDOe1d2OSHv83gA2uZVqCGJfQM4R2s
 o5/Y/yapYeA85UCihFfZcdEWVIYozOMrJ1MHlxF7hOVlJv3IAAyK7fcP+Q4Dj8EJ0VAF
 B6cT+omLlxeux9VO36/RHOH9d8CZVJ1gj/zPrvu9vUfjhcmZ8ZVOFYZbQazhfXr6l+uF
 /OEw==
X-Gm-Message-State: AOJu0Yye4uNV0BjxP0aw9giGhwASRKj37PD5QfjBAtg1p/ISwX7s+VOo
 4ExbrMcCfIPzNmsRfwavufmtPiewzdtmpqZ58vQFfsmL/Bxu4DUx7fNR7RWkzlE=
X-Google-Smtp-Source: AGHT+IEaRV13BLXLumN/kGTDbqcrUscjyuk7NeWga7XgBgGnaR5t0IQW9pW2e7kO7jEgQwZazvvYJg==
X-Received: by 2002:a2e:9d92:0:b0:2d2:c82c:b822 with SMTP id
 c18-20020a2e9d92000000b002d2c82cb822mr8370600ljj.22.1710345355104; 
 Wed, 13 Mar 2024 08:55:55 -0700 (PDT)
Received: from [10.232.133.97] ([88.128.88.111])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a056402100600b0056850d5ee00sm3840342edu.15.2024.03.13.08.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 08:55:54 -0700 (PDT)
Message-ID: <2b2446d9-b5c4-4160-9523-a6aacea0bb29@suse.com>
Date: Wed, 13 Mar 2024 16:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240313115448.7755-1-andrea.cervesato@suse.de>
 <20240313115448.7755-4-andrea.cervesato@suse.de> <ZfHEyRoZm7g1SHwF@yuki>
In-Reply-To: <ZfHEyRoZm7g1SHwF@yuki>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v6 3/3] Add shmat04 SysV IPC bug reproducer
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

Hi!

Thank you very much for this.

Andrea

On 3/13/24 16:22, Cyril Hrubis wrote:
> Hi!
> Since the fix made it into Linus's tree I've added the git hash to the
> tags and pushed, thanks.
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
