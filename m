Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7CA383D0
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2025 14:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1739797477; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=nikuI6a4ktGUVivzZLqPxGKmXY1ZqzzEfAIzUCg4xK4=;
 b=gTpWMeFUZwcMP0OoYYmZ0ALS9N9uSfqG6oysROHHfhnuD4JKE+Tt9uVHOCfE5jFITP8b9
 tcbzqtWBOzuVN7qdKSikCyvJBFFKwePrprz/AM/Q/lyU6gcUq4BgKF3nNiA6L15Jw0mIeQY
 h4lCxlvyufROFLzVUssG4h6VINBZdfU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2F143C9C2F
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2025 14:04:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C1CE83C4C99
 for <ltp@lists.linux.it>; Mon, 17 Feb 2025 14:04:21 +0100 (CET)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BD54460D4FE
 for <ltp@lists.linux.it>; Mon, 17 Feb 2025 14:04:20 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-abb86beea8cso279182966b.1
 for <ltp@lists.linux.it>; Mon, 17 Feb 2025 05:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1739797460; x=1740402260; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o/Mg7s5i4SivOEYnK7tPfSO2Y+y5cgQAfh682iHSCAc=;
 b=bcphgtY8K34yCtuFP94e1RrF/9r+qequBV2wqsSt9lXdjC/VrIQ51gHhvECUHr2EEv
 FaAA6X8Ix0q+oEhh60TPQDhIRF4W5voy5xD5rdHNLKmFsi/IlkWj8cCg/mENTNf62hXM
 VNg5Znp9ZTZq4fAfGfHKHTbTMWVvQmC3FbQUPH3FuJTWZClRhRhKwcr1902nsnkyBOEr
 Fv2x/8PWTNC6kt14wN5p9LvfHHDRxFh/bRG44sZnlyvGk3siSF0tyT3me7zGKqzoC64+
 d5syGtNmqQoiUDMV021S+cZNLCETqSrH++EZpr7yLTDa31LPZ7YJgGLbVV2DM/+xpiJU
 xj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739797460; x=1740402260;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o/Mg7s5i4SivOEYnK7tPfSO2Y+y5cgQAfh682iHSCAc=;
 b=Cd+13NUUU+5BzRVh8rXRfD43o27HedSBUdm89OnDZosBDi2rQ7/srcVGHxjLULwHm8
 ef19g7zBtN1/N+bXSVWJBuZgwlI1nqNAu0FaPOb8HELx5eLjpBRcrASsbWw174OpqhyA
 ms/W4NBnyxZMISgKHCZicScp/ag7s2GUJ9lR54O56e3V+FbZlOQcZyd9N+SdV/M/5yzj
 5lDzDRW4xKFfG0+duh1imE8sA/uZ+lwfHtNChvpFMO8ozYFB9In2/5SJ13ONTlLAiuzO
 xizHkEWTW+WptEga0nC045XZhxQy71NH/HP5pdC86gyGCLjsALUlEIym70UFrYCbuq8Y
 qXKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVvih90UEhCQ2MrJT3bB9E/6dsqw6amUXhWDmI6+pqA4ZZaor67t7IcYoyux/vMKYA52M=@lists.linux.it
X-Gm-Message-State: AOJu0YxpHG6zBEN29BxmsGSYspbNLSYO7c22xSON0FlBs3oZkqGYUAJs
 h2PNnmUB2TuebVTGxlTLQ6irlyYyJzNfor/p9ifbG7Mvpsf9eilkJNSVkDRoNdchMV10P6qcife
 V
X-Gm-Gg: ASbGnct8+mOPd9wh/sq9Zw8gkfZix+8rHegyeXGVHQA6zVLQQDp7Wu1ae6jEL+p0huI
 lc3Zt4LnubeA1PCrMtas/66njXBseXEomMjct7WcbmP6RUAlQ2CIgx2HrpKVi/Z7/eEnFpqhV4i
 isP0RG/0elxFzrz50u9ZsCcAOiHW9HBz2BHK7aX+e3i/9TMQY/W5UW8JEdPEfX9DpePNNn7jgNr
 PBeyrzaiFjyxM7fW2wLvQRFrwXK4lWP9mMcRYIZZXwaDb82GQLNgWsj96LqTqcBG9dnKsC+8Tru
 V05isk2ddEXDwvX1N3z3sRPWxqctOoVhxGQ3xgxSmBd0c3w/EupQmclim79JyLaCL4X4hfM5gnK
 /7xTIk3ks8qxjk+KpsR4NbE7Xh2vuTwr6uTRrHZy5ZPIqqHP+QAU=
X-Google-Smtp-Source: AGHT+IFudrfLzkWSaJTWgR/+SLnR6KNBFOJZ9H+FtF/UdPAfBPfFIQPoVQkbyxrllvoVOtbAIMGA1w==
X-Received: by 2002:a17:906:3290:b0:aba:f6ff:d38a with SMTP id
 a640c23a62f3a-abb70dce3bbmr941289166b.29.1739797460043; 
 Mon, 17 Feb 2025 05:04:20 -0800 (PST)
Received: from ?IPV6:2003:ef:2f02:800:9162:c8ad:3b21:a399?
 (p200300ef2f0208009162c8ad3b21a399.dip0.t-ipconnect.de.
 [2003:ef:2f02:800:9162:c8ad:3b21:a399])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53376adcsm888512766b.95.2025.02.17.05.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 05:04:19 -0800 (PST)
Message-ID: <97e5e4c6-c1f4-477d-9865-9716b31a0124@suse.com>
Date: Mon, 17 Feb 2025 14:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>,
 Linux Test Project <ltp@lists.linux.it>
References: <20250217-clear_descriptions-v1-0-90e8229d52b4@marliere.net>
 <20250217-clear_descriptions-v1-2-90e8229d52b4@marliere.net>
Content-Language: en-US
In-Reply-To: <20250217-clear_descriptions-v1-2-90e8229d52b4@marliere.net>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] syscalls/fork01: Improve test description
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpSZXZpZXdlZC1ieTogQW5kcmVhIENlcnZlc2F0byA8YW5kcmVhLmNlcnZlc2F0b0BzdXNl
LmNvbT4KCk9uIDIvMTcvMjUgMTM6NTksIFJpY2FyZG8gQi4gTWFybGnDqHJlIHdyb3RlOgo+IEFk
ZCBhIHByb3BlciBkZXNjcmlwdGlvbiBpbnN0ZWFkIG9mIHVzaW5nIGJ1bGxldCBwb2ludHMuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIEIuIE1hcmxpw6hyZSA8cmljYXJkb0BtYXJsaWVyZS5u
ZXQ+Cj4gLS0tCj4gICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZvcmsvZm9yazAxLmMgfCA0
ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mb3JrL2ZvcmswMS5j
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mb3JrL2ZvcmswMS5jCj4gaW5kZXggZDZmNmJj
ZmI3YmM1YWIwMjRiY2MwM2QyNGM1MWM5NThjNTg3Y2ExZC4uYjAzMGM3M2EwMThjYTkwNTcwMDkz
ZDk1NzJiMjZmNTVlMGUwZTg0MiAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2ZvcmsvZm9yazAxLmMKPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zvcmsv
Zm9yazAxLmMKPiBAQCAtNiw4ICs2LDggQEAKPiAgICAqLwo+ICAgCj4gICAvKlwKPiAtICogLSBm
b3JrIHJldHVybnMgd2l0aG91dCBlcnJvcgo+IC0gKiAtIGZvcmsgcmV0dXJucyB0aGUgcGlkIG9m
IHRoZSBjaGlsZAo+ICsgKiBUaGlzIHRlc3QgdmVyaWZpZXMgdGhhdCBmb3JrIHJldHVybnMgd2l0
aG91dCBlcnJvciBhbmQgdGhhdCBpdCByZXR1cm5zIHRoZQo+ICsgKiBwaWQgb2YgdGhlIGNoaWxk
Lgo+ICAgICovCj4gICAKPiAgICNpbmNsdWRlIDxlcnJuby5oPgo+CgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
