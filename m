Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F620B3BAD5
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Aug 2025 14:06:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1756469203; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=B1WhcIgysrlDavDmUSvibpM1ZquF7Y5IkDd6+BAPK84=;
 b=et/iq+dbL7/Hav46Dz6Ei2x8zUQ+MePnuCSMWk5W1IS3kAHYN0xFMfmHVE6GtPogO8jwM
 viOv8FHU/qT2jSDPJo9a5mqh8YgEOjQNFLtbwSOqJNoONQQ92eEtAzMSxCm7y6g6QduvDM3
 wry1W0JKaa1q/TDPP48cWv1XEUVzIZw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02A383CD0CF
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Aug 2025 14:06:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E57E83C4B63
 for <ltp@lists.linux.it>; Fri, 29 Aug 2025 14:06:40 +0200 (CEST)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7D5BE1000923
 for <ltp@lists.linux.it>; Fri, 29 Aug 2025 14:06:40 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ce772ce0dbso1114160f8f.0
 for <ltp@lists.linux.it>; Fri, 29 Aug 2025 05:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1756469200; x=1757074000; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RmLFsjuAYA5zzuYGy5bAjji9IxtJ6oPPk3aBHUWlI84=;
 b=YmNaL9wOS3ATW6m3Jpe68x2tUrewCre9ihG+vpo//yGJjsFALBr0bgEl6NdivN9HiE
 A1Fyhe+OEIl+PsodHYFuQy8Zncw09SzUh+8xPhwc99Wt3ABqtZA7Y36KlGb2S+6cFu3J
 KgLeTxXpPsMKQ4LFjWTXVD/CaZxHd95PW2+vWMPMltPDRRw+K53mGsutblzMLLiwKZD6
 qe8mFZFAENsS1UREU1HilQYPNgxGDYdgjxnQ6j50GvE1JXzj38JK7W9RGeQBJnqm7gOR
 iq+QSYZJcyEWBMlSCX7Vy6UTDoT4r+R7TpcymdDZmqxFb39XBHVRSOISs83o79ht3em/
 qajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756469200; x=1757074000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RmLFsjuAYA5zzuYGy5bAjji9IxtJ6oPPk3aBHUWlI84=;
 b=ZrNN9ZlcexiewVkFGDfKFd5sJIzpOvy4NC+avG0DU23fiVP7hZdD9F8RaqQyieY/5n
 QQA3yvIuDwjLaxLJwbg5ekvHQNXCo9eEKyvkH/oftwVCfSie1Bz6CYhfwWEqQg4sW28W
 XLQm1/G3q+N2mAtC6UNJ6DHMGsO/OSvgu/N0r2NOiFNF+Ol0h1l3CapoUB4xCTPiUAID
 lpzK51KulpuFqJYttbVmGgzAUw9XqvhzBRDu8jBe73HgYzhU4nB+yAIX3SXu4d1x5gn/
 KnoZUzT8xPwLdv4V+XG1Avg1VBU4QG4kxwCrGRFZe7o9++WWAhUpZ9KOBDB1sNwVGOaY
 2Qvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVmrkLQ/ARwlidHt2cM+1LUXv2jgD4SmT3jgVKrXleikq8gXvFEdujdaiMlOBEP6Zktp0=@lists.linux.it
X-Gm-Message-State: AOJu0Yw/tDW2AhemYE8lLa/+cf/4kCUF++FLpA23hKbec5QTEUF+heXV
 IdfXHhDAaPEsX37hkeAWeQu577dDZ+qeGSlnVt35WzENcaWs3/dm/GYF/p3fYa5hAL0=
X-Gm-Gg: ASbGncsrB72s1iYmZ35kFBu20/cSIImGEASqml/z2YXEyaOTmRHVIwMRAK0hMvH8yxs
 PiTOyoToZgvHfsK4Kd6q9NZYJTAZ8GHE5g33BbDBF5+Q5VypUI5/BsTIQ47FhuF/PIjVZLZxemP
 Yiggzu44PLe4jO0A+hREnGKEAwvZ/NKjrQ47+GSFWUp+mNTDPVAZhzIOwMhXF/24Hfn8XHrSUFT
 NZon2vpB6jZko+VLJFpXGQwkSBaEV2sZXCPl4J1OV5JF6jHjbCu3qrZDzrZWd24M4sSXsKUJrtr
 UDPOmec3318MEIP0vot/KJ5XwYxBXthZXbytAMhLAzGFracenrcmtxK/pvqF7/aQO83H/PrkiuF
 ktJIzl6vPaQUNW1gi5UaX3/JupPcUK2a5Ukc=
X-Google-Smtp-Source: AGHT+IFsYHghHZNbvwtty57LbXEEFxu7RLzuUkjagavGhczkjPT/A0td2EDGFsVIvcjgL+YhAhpDPg==
X-Received: by 2002:a05:6000:2505:b0:3cb:5e64:afb with SMTP id
 ffacd0b85a97d-3cb5e640e84mr10296120f8f.32.1756469199817; 
 Fri, 29 Aug 2025 05:06:39 -0700 (PDT)
Received: from [192.168.1.91] ([151.51.145.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b838ddbe5sm3385985e9.16.2025.08.29.05.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 05:06:39 -0700 (PDT)
Message-ID: <9f626db7-5bf0-4376-8b4a-a643569f41ab@suse.com>
Date: Fri, 29 Aug 2025 14:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>, Wei Gao <wegao@suse.com>
References: <20250828-open_tree_attr-v1-0-f339a0e51e22@suse.com>
 <20250828-open_tree_attr-v1-2-f339a0e51e22@suse.com>
 <aLDhgFRA8ppAmYlH@localhost> <aLFzZ6xGsZh3CO64@yuki.lan>
Content-Language: en-US
In-Reply-To: <aLFzZ6xGsZh3CO64@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] mount_setattr01: add open_tree_attr variant
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

On 8/29/25 11:31 AM, Cyril Hrubis wrote:
> The tst_variant was implemented exactly for the case where we have
> different syscalls doing the same job. In this case a shortcut was added
> that does open_tree + mount_setattr in a single syscall, so using
> variants is very reasonable choice.

Is it a free for all to merge the patch?

- Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
