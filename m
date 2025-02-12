Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2401A3287E
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2025 15:33:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1739370828; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=Bxkc6h8BzOmsnSAEo9MAG6KrAJ9WRL96jTi1/ZloOO0=;
 b=T9Nc0K/dlhMOrp3cAYMzLklagNjteIys7rF2EoZzKIN1nVSgbfNNjXPKCzAxuqXhvO4/k
 GH4NRxch/Poz7Rs8CN7YIcVSuXx2VSLsJHhbQZUsbnmPd6uLCNlnKaiEKv7zOWaEEnzvL0p
 baGzSXnsT0GSh810+7aSvrZc3kQLz2s=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5287B3C9A26
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2025 15:33:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6F0D53C9A01
 for <ltp@lists.linux.it>; Wed, 12 Feb 2025 15:33:46 +0100 (CET)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 34B3523F980
 for <ltp@lists.linux.it>; Wed, 12 Feb 2025 15:33:45 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-439307d83f0so28844755e9.3
 for <ltp@lists.linux.it>; Wed, 12 Feb 2025 06:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1739370824; x=1739975624; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bWj+iOXnxEi8c1Gdvq4FoHL2aCETvyMRyWGUZuKvvc0=;
 b=JSTKjlQyUEnXJ4+yswTVx3Gq+6v5Fv2UV2Zr41aZdtSGvtcnl5cKab64KO/dh4kBG1
 nzCAfbFj5Y+jH2YKJyyIZzSZ/raCCI2dn4E0bRP1h7hGof0CaQgerla0+wv6L144N/xu
 NANBSnwEMGUICJb1wGhbkLUTRFMuy5tdw/cfaAnzmszl04+MS1XN4S4jQeUSBMEYi5f2
 KafFA9ILCxqrl2BDX6zB4x/6hVOWA0A+QgTjDhY1NDQa15m97y39+sk0ceqP3LAgS6fW
 gVf1GrmKuwfWqdvp1sul8dy3X7J1i8pTaK9vPIxZCq0dnWQAxzT7FjiGIJQFuIg+zlUc
 YssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739370824; x=1739975624;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bWj+iOXnxEi8c1Gdvq4FoHL2aCETvyMRyWGUZuKvvc0=;
 b=o8Qituk142nEjRb+UrjuugEh8cMg71wOyk8JppmidlCGMhsAPqzMABfIqhW+FfMWQO
 wVhwSFHAuFwwJDp6FM2428EWGKzC/Bl67qfMiQ05tyGo2mFU+6my3W1pp++flKFQE8Ip
 wSjeHgUDm5n5bei4rXfNlbWYIT9o4Yc7Le4tBP3w7NPUmAij1KaxK9arCRwfyEgcK9GV
 GudLFXgI67E3YWPAcH7T9+feDcaoah1pL5belxeU0J370/LtJjHzo5zo0mhTs5BG+gZ/
 4ExElThLBIkIsF27tnWU/2o67SUT9yg0NHOHdGG9xWstveVSxyDH7g51cg9sE/+AW35a
 iAPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI5PrIjAb5QkMX1OXrdNNl6X5aw1+3wBgv0k0CNVoMN7V+8HOwCW/Z4OERjrgU40VZJSo=@lists.linux.it
X-Gm-Message-State: AOJu0YyCVtFodsopdz/oDZyPhGd1OELameijT3Yz07d1ShdbMLKjHm+r
 a94bXJn/6+8pCjaCypIxKw5jiCcf9pCRZMvInFy/RCRELCkBJSa3X8C78HUExQA=
X-Gm-Gg: ASbGncsIcIwYJv9TLC2Qlha4b9WCdOmLm8Jqd2IZCCZSaDMHuQdNkosrOKeozA3/+bC
 PXQMvG4N+9QBSEzsKazuUEM0TApe8Fe9zwxfVaJj82HNmzRcGQqbe1rpb7+iTO9OMd2377WrMib
 4idQbk7KBVcbaSI62gT35WsCxo9Fdc48HpZdUqQjkyLf9PSom61Aj1EEKxt9YamHhdiphDG60Qx
 gRXaLYvYQKwXqz530+vYLN1VbC5CR0RCLpL+XLVBcAxSBP6IAcQ/yStEVAalzduyz0c/YrIXU43
 34MkjRNdXxjtAvGlVAN9QxRsiQ==
X-Google-Smtp-Source: AGHT+IFhU1z800bk6dF3KPxdIwa8f7M8PwNQ2sAfOJtJ3jse0VWBYc8fkaJBJWin+gsG6hnjNPPERA==
X-Received: by 2002:a05:600c:1909:b0:439:3e90:c535 with SMTP id
 5b1f17b1804b1-439580dcf25mr39343655e9.0.1739370824479; 
 Wed, 12 Feb 2025 06:33:44 -0800 (PST)
Received: from [10.232.133.38] ([88.128.90.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd7f039sm17961745f8f.59.2025.02.12.06.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 06:33:43 -0800 (PST)
Message-ID: <2aa1b810-2bb8-4f13-abf9-1f75bd89a19e@suse.com>
Date: Wed, 12 Feb 2025 15:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20250212142424.2070774-1-pvorel@suse.cz>
Content-Language: en-US
In-Reply-To: <20250212142424.2070774-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] doc: Sort items in the test catalog
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

On 2/12/25 15:24, Petr Vorel wrote:
> for test_name, conf in sorted(metadata['tests'].items()):

Obviously correct.

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
