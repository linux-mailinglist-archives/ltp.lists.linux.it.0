Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 174C4725495
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jun 2023 08:44:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEB493CC9C0
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jun 2023 08:44:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 891713CAEBC
 for <ltp@lists.linux.it>; Wed,  7 Jun 2023 08:44:52 +0200 (CEST)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 06D681A00994
 for <ltp@lists.linux.it>; Wed,  7 Jun 2023 08:44:52 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-bb15165ba06so6157264276.2
 for <ltp@lists.linux.it>; Tue, 06 Jun 2023 23:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686120291; x=1688712291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fC9SzG1Jo8qjlDTqATejRPZaFzA1EFcsPGNeaBVVYeY=;
 b=s4wZyUtcdGEbP9iGON8a+hSmXUVFeLt84/4JidJTM4UxUSbVkw+b6UsKH6Y3ydtQxv
 1x2UqSm2D5oZdQaFIdtXslWPG01xfp00bFSJUYYT1128Dgo9XKtZxEC1HxzrlLwILmgD
 q3Uzck/tCPhOXg8pcW31D43InCPxaXIh3PFS6rkPQDN/RxVB2pj6chsjUAu5QpP3hpPc
 tR2pm7P5dkXet+/kuO70YX3I7w38UMDQhjqPs0xM1DSxuIazjyNTHIivvb/8KFbdRLFV
 PMHaCX0nJuliU4P25QzD/bOxk3WON5dGIxZrnX3/Fw6/BkG+hFa3VkzDCk1fqHcZgQkx
 qRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686120291; x=1688712291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fC9SzG1Jo8qjlDTqATejRPZaFzA1EFcsPGNeaBVVYeY=;
 b=WIlZw6fcYwotmKdy9pZ184jCz7Dk3meYQAmMW2cLbGOfMWCgBVAR4DCOB8+owb7J3C
 6WRpfNiBGuhcLemL7QqxFmEAIZcva5BtZgw2FTKTyQt5JnZQilOC5sL36HtTfKSjPuNP
 d9SQNTbCtwepgB4uxvFYDS13pOdzWWO59yWBTiK+/mSy/IMdZM3NyW7GukNJpigDTrMK
 F0IeJKkrrHqb+fVKnA/hXP+9OC+2vnsop1JN1Nh7dle/R//9pmtQJGKUH88si0e5UZbD
 JoyVZJi+05St0p3N2vi7/R3/K65MhKrn+HaB31B9cEcX1mP64DOy2JDCFWeGPfVFVEJY
 o5gA==
X-Gm-Message-State: AC+VfDyYzSYM+1caR+Psk1K8oSuIYiqSFzHwK0M9mTVlvOXCL6BkOgsq
 WIvbXeG9kWQsNcR5rBuRZpI1eKjrCUA+SwVGIwWyOg==
X-Google-Smtp-Source: ACHHUZ7GutXQbFHKPBbnEZhSxHDelFdRAHkdL659bT3tnP1IThx27uF/5LWXicgUOyfdyOXVzs6nARvomHKEBUYhWsk=
X-Received: by 2002:a25:d056:0:b0:bac:854f:abbd with SMTP id
 h83-20020a25d056000000b00bac854fabbdmr4849436ybg.64.1686120290847; Tue, 06
 Jun 2023 23:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230605044131.798383-1-dlemoal@kernel.org>
 <20230605044131.798383-3-dlemoal@kernel.org>
In-Reply-To: <20230605044131.798383-3-dlemoal@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Jun 2023 08:44:39 +0200
Message-ID: <CACRpkdaBinsAofvQgLZ5u8ScR0+yWPnQCf6E7CPtn598PN0eoQ@mail.gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] ioprio: Use IOPRIO_PRIO_NUM to check prio
 range
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gTW9uLCBKdW4gNSwgMjAyMyBhdCA2OjQx4oCvQU0gRGFtaWVuIExlIE1vYWwgPGRsZW1vYWxA
a2VybmVsLm9yZz4gd3JvdGU6Cgo+IFVzZSB0aGUgbWFjcm8gSU9QUklPX1BSSU9fTlVNIGluIHBy
aW9faW5fcmFuZ2UoKSB0byBjaGVjayB0aGUgdXBwZXIKPiBib3VuZCBvZiB0aGUgdmFsaWQgcmFu
Z2UgZm9yIHByaW9yaXR5IGxldmVscy4gU2ltaWxhcmx5LCBpbiB0aGUgdGVzdAo+IGNhc2UgaW9w
cmlvX3NldDAzLCB1c2UgdGhpcyBtYWNybyB0byBjaGVjayBmb3IgZmFpbHVyZXMgd2hlbiB0aGUg
dXNlcgo+IGF0dGVtcHRzIHVzaW5nIGEgcHJpb3JpdHkgbGV2ZWwgb3V0IG9mIHJhbmdlLgo+Cj4g
U2lnbmVkLW9mZi1ieTogRGFtaWVuIExlIE1vYWwgPGRsZW1vYWxAa2VybmVsLm9yZz4KClJldmll
d2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywK
TGludXMgV2FsbGVpagoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
