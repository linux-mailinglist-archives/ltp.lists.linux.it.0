Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C490C3B91A5
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 14:29:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9908F3C91EF
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 14:29:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 33FAA3C6B08
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 14:29:07 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CC03B14011B0
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 14:29:06 +0200 (CEST)
Received: from mail-ej1-f69.google.com ([209.85.218.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyvoY-0002Q9-4d
 for ltp@lists.linux.it; Thu, 01 Jul 2021 12:29:06 +0000
Received: by mail-ej1-f69.google.com with SMTP id
 bz12-20020a1709070aacb02904cae86564c7so1938575ejc.6
 for <ltp@lists.linux.it>; Thu, 01 Jul 2021 05:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OSaYUZnU9asXn6eTM8vlSDugyrtHWT1xXpThmfVqRRM=;
 b=QYahCL7iISBIAV1aEqyWXFTFpMrEksSsyz8XGfWyzM9e+504ieLF/bfreAsrs2u6G0
 Mn/SPBq/ABG/yvMrnwyVmKowHtALDNaPRci61PPh+WSK8jGjP7WMJeIAFaPvxkXYXBlm
 j/jn1RyP/RmSkSmh9djmxqA7qhWbzh2OcDWFQuYAZCjeQFOkAHr3l7YSLfEivPcuDRjo
 wpcEPlgYmsdPyLGDd9v7lWG0mizm9EB5OmOv7nynxhXFDRm59xyrVKsMuIoO53MlgHnG
 G9znkzym4aD27WyWVp3pmxNkSYvRUCXyKaQiodSIpOiT03LLtk32gtQK1Sqg924kdimI
 BjEw==
X-Gm-Message-State: AOAM532LPaEn0Kxh/cXAx86n7RgcAO0N/TXa5HsxfoFUDUtr7SjU5BJx
 yDCT9mio4WwWsz44nhc1WimGRNncmh8BepQvX7Q/nvJRoPQUleXvCQtV43jY0EI7RQG1XpZGvOU
 CFZos9RXjIQwtUGMRkqz8yS6T3xDI
X-Received: by 2002:a05:6402:1111:: with SMTP id
 u17mr54177101edv.87.1625142545630; 
 Thu, 01 Jul 2021 05:29:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVmAkcwDvl92cYikLH/6Z4TwwR7894IeVyMzvgbf+dPvMsF++iLC+SYUGspgkYSel0xqeuyw==
X-Received: by 2002:a05:6402:1111:: with SMTP id
 u17mr54177098edv.87.1625142545536; 
 Thu, 01 Jul 2021 05:29:05 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id m10sm3047503edc.22.2021.07.01.05.29.04
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 05:29:05 -0700 (PDT)
To: ltp@lists.linux.it
References: <20210701122351.56397-1-krzysztof.kozlowski@canonical.com>
 <20210701122351.56397-2-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b9be0a14-aff3-c38f-18b4-2a20e7b05e09@canonical.com>
Date: Thu, 1 Jul 2021 14:29:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701122351.56397-2-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] proc01: remove unused lsm_should_work
 (-Wunused-const-variable)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMDEvMDcvMjAyMSAxNDoyMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBSZWNlbnQg
cmVmYWN0b3JpbmcgbWFkZSB0aGUgImxzbV9zaG91bGRfd29yayIgdW51c2VkIHdpdGhvdXQKPiBs
aWJzZWxpbnV4LWRldjoKPiAKPiAgICAgcHJvYzAxLmM6MTQyOjE5OiB3YXJuaW5nOiDigJhsc21f
c2hvdWxkX3dvcmvigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlh
YmxlPV0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yu
a296bG93c2tpQGNhbm9uaWNhbC5jb20+Cj4gLS0tCj4gIHRlc3RjYXNlcy9rZXJuZWwvZnMvcHJv
Yy9wcm9jMDEuYyB8IDcgKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvZnMvcHJv
Yy9wcm9jMDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvZnMvcHJvYy9wcm9jMDEuYwo+IGluZGV4IDI4
MmM3MGU5NDg4Mi4uYzkwZTUwOWEzMjQzIDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwv
ZnMvcHJvYy9wcm9jMDEuYwo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvZnMvcHJvYy9wcm9jMDEu
Ywo+IEBAIC0xMzcsMTIgKzEzNyw3IEBAIHN0YXRpYyBjb25zdCBjaGFyIGxzbV9zaG91bGRfd29y
a1tdW1BBVEhfTUFYXSA9IHsKPiAgCSIvcHJvYy9zZWxmL2F0dHIvKiIsCj4gIAkiL3Byb2Mvc2Vs
Zi9hdHRyL3NlbGludXgvKiIsCj4gIAkiL3Byb2Mvc2VsZi90YXNrL1swLTldKi9hdHRyLyoiLAo+
IC0JIiIKPiAtfTsKPiAtCj4gLS8qIFBsYWNlIGhvbGRlciBmb3Igbm9uZSBvZiBMU00gaXMgZGV0
ZWN0ZWQuICovCj4gLSNlbHNlCj4gLXN0YXRpYyBjb25zdCBjaGFyIGxzbV9zaG91bGRfd29ya1td
W1BBVEhfTUFYXSA9IHsKPiArCSIvcHJvYy9zZWxmL3Rhc2svWzAtOV0qL2F0dHIvc2VsaW51eC8q
IiwKClRoaXMgc2hvdWxkIGJlIHBhcnQgb2YgcHJldmlvdXMgcGF0Y2gsIG15IGJhZCB3aXRoIGdp
dCBhZGQgLXAuIEknbGwgc2VuZAphIHYyLgoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
