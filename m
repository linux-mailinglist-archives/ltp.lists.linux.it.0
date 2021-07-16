Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 275463CB7EC
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 15:35:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4A133C861F
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 15:35:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AB963C65C0
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 15:35:10 +0200 (CEST)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BAF01601205
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 15:35:09 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id u13so16019058lfs.11
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 06:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DtRzzshyxk4X68R3c376RX4m+cZuiqC25gpBZTBSxfs=;
 b=p7gDMuezcAk2n/XS3NxR/gZ6mQyKGHrvz/P34Whb6ujCeKW1IqvFseCzuu4jCkWzYv
 oO7rxPiJsWYhQQ05tA8fu/tFbdmXG/FP+2N1a0s1XvZC24gelQ+AUZ8bBH+fNpBAbJ0f
 Nsynrp7lxPx43NeJC/2pLL2NKlZMFq9uOPFni+UzsPZs/vQhYiFaQZqv0hLS5VejydLA
 ggQHRgjjcNnyk7xEMPS/2f++L1X4d0aaCgtOyRN7gJtwYV3pajSwEBJL/LHGI+vayjfu
 WgCEgQvJ9MKN+vLypuz+OyaxsPm6tqRD4jYUGFZVjRz41hkEJu+s3Kq0hXgkoBr2jWqN
 6JWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DtRzzshyxk4X68R3c376RX4m+cZuiqC25gpBZTBSxfs=;
 b=i/a8DRz3honHk9vI6XM6prdY6HBn+BYFbjLafbKYvkZV+BJ2fDfpcDZZrLZc6UMyu9
 hO3AIC9osHo8nX/u/WJVFn+yCtokFWagQ0aOBDEzuigOFfC4/CJSOrVQXDEAmO1jr/Cp
 jvlsfg/ANFxbWFEj0WsMvfTJszmKIc/oAgYQyEDePXpbSQoVnouZNZJfxJt6otZop+I+
 ZY2hvQCYG3KgtxwDwRI9c1ufKx/TjD+y1cgjqiuCMRX/Vym8c2/OwU4LB0g4nkf3Fx+M
 LA26rRAAW+nn8K7d+GS4YqX33lBlMlzKLYIy7FgY5Om6Lh2tIOMFpMvPzfq1FF3/aBdC
 w5PQ==
X-Gm-Message-State: AOAM532pfls4pwvlUVFAjsh9vTb5XATt8TiN3oQlRbYIrzVKtkSANeHr
 m5HuuKnEh4MzVd0Iq8aSsuXBjmgjBGbm
X-Google-Smtp-Source: ABdhPJwI3XqJe5k5dM64ReMw+v62Xm2LGXAXfydHXyYXSReHE51cUaBQa4ymVg5OBeyyB5yli2YE4A==
X-Received: by 2002:a05:6512:ba8:: with SMTP id
 b40mr8147690lfv.588.1626442508966; 
 Fri, 16 Jul 2021 06:35:08 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id t24sm649675lfb.76.2021.07.16.06.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 06:35:08 -0700 (PDT)
To: Li Wang <liwang@redhat.com>
References: <20210715102813.106843-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cXAY8KSFNNv8_23uSs-wRaResAkTPmPyZQNN6UwcMcgA@mail.gmail.com>
 <6e1a3663-59ea-5286-5c36-558b077184aa@bell-sw.com>
 <CAEemH2fdJ_N2PpdCvH8M06U-ov9G0g-tcCdCDV2wZTVWCwCR2g@mail.gmail.com>
 <CAEemH2c7q8yTC94WvJW61=YtUHBz0_saVM+H=HPysJ0TR-ieVg@mail.gmail.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <f434cb9f-f8bb-d35c-124d-f469f26d8e6b@bell-sw.com>
Date: Fri, 16 Jul 2021 16:35:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2c7q8yTC94WvJW61=YtUHBz0_saVM+H=HPysJ0TR-ieVg@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] crypto/af_alg02: use pthread_tryjoin_np() instead
 of pthread_kill()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTYuMDcuMjAyMSAxNjoyMSwgTGkgV2FuZyB3cm90ZToKPiAKPiAgICAgICAgIMKgI2RlZmlu
ZSBTQUxTQTIwX0lWX1NJWkXCoCDCoCDCoCDCoDgKPiAgICAgICAgIMKgI2RlZmluZSBTQUxTQTIw
X01JTl9LRVlfU0laRcKgIDE2Cj4gICAgICAgICArc3RhdGljIGludCBjb21wbGV0ZWQ7Cj4gCj4g
ICAgICAgICDCoHN0YXRpYyB2b2lkICp2ZXJpZnlfZW5jcnlwdCh2b2lkICphcmcpCj4gICAgICAg
ICDCoHsKPiAKPiAKPiBCdXQgd2Ugc3RpbGwgbmVlZCB0byBpbml0aWFsaXplwqAnMCcgYXQgdGhl
IHN0YXJ0IG9mIHRocmVhZF9CLAo+IGluIGNhc2Ugb2YgdGVzdMKgcnVubmluZyB3aXRoICctaSB4
eCcgcGFyYW1ldGVyLiBJc24ndCBpdD8KPiAKPiDCoCDCoMKgwqB0c3RfYXRvbWljX3N0b3JlKDAs
ICZjb21wbGV0ZWQpOwo+IAoKWWVhaCwgcmlnaHQsIGFuZCB0aGF0J3MgYW5vdGhlciByZWFzb24g
dG8gdXNlIHB0aHJlYWRfdHJ5am9pbl9ucCgpIDopCgpCZWNhdXNlIG90aGVyd2lzZSB0aGUgdGhy
ZWFkIHJlc291cmNlcyBub3QgcmVsZWFzZWQuLi4gYW55d2F5IHdlCmNvdWxkIGFkZCBwdGhyZWFk
X2pvaW4gaW4gdGhlIGVuZCBvZiB0aGUgcnVuKCkuLi4KCgo+IC0tIAo+IFJlZ2FyZHMsCj4gTGkg
V2FuZwoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
