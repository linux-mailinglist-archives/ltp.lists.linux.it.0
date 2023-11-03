Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B39067E05CC
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Nov 2023 16:54:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55AA03CC806
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Nov 2023 16:54:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A0EA93CA26E
 for <ltp@lists.linux.it>; Fri,  3 Nov 2023 16:54:54 +0100 (CET)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0A712610213
 for <ltp@lists.linux.it>; Fri,  3 Nov 2023 16:54:53 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-54357417e81so15353a12.0
 for <ltp@lists.linux.it>; Fri, 03 Nov 2023 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699026893; x=1699631693; darn=lists.linux.it;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAN5Bpg6o7aHYcDmSgPI4tDt6dPAck0LAfS83BEwifg=;
 b=as0QEEm+6iT7br2FfN0JMZRcxIbEZcVjeAl7jiUT3IZgYQ+eCVFTU3JIfFmMad9gj3
 qgntXQjxFuQjo6s74F2OQHgOz15P6fvEs+NWTL3IBOaoARqd93Y9sIhVe/Ky0UA/PmUf
 PE3RL8zpdhoCptMr0paEWj1RMvzfGI77OHIAMZ7dmZhL+3ZLfKHT/dW9RpOwKaWpVmRQ
 JsGG0NIT1msqOvKc0EKETTmug6AoDkZTTNUuQYZw6HAHaNsF94k6Dr6yJZbLGBSR7wj5
 WxaTQLAB+khv67RT46kwcS/sDw59iy02SmxJDK2e0misa4I26klNiaZiVITC0yN3408F
 2Q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699026893; x=1699631693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAN5Bpg6o7aHYcDmSgPI4tDt6dPAck0LAfS83BEwifg=;
 b=kpLCYRsKTDQGce8KL3uN8Ybe/fOAXKc3TPQe/SBjH/8J/sLqUStaXPfj2s2DYQ1bF8
 V7IUKB12vWYrV5Clo247HgWTVXXAWTyKIjaOBce/yshhfZYy8j3Yq9jjzRPs6hlAWaHY
 ocFwVIgUPirQE2T2LdIGUQppnhHeO2e2S0ePUMGM/x4nB8bj5AL/9rLdAE+yhjzbWr5U
 rhHmbydeFvT68KAgKrDiSBQL4DoKu4P4AOKxmYVMzbAE8RsS/sHlww8P97AlvRJEvmI8
 ArO/xk6bwhcGMTLvhTmLjd0a5WP08DZ1CGxHCDaanomLe0UxAYuKMkRESj32OWtqSVEA
 GnZA==
X-Gm-Message-State: AOJu0YxlkozjSJoRNZFB6Okv+8eKAm0KTeS2+eGm9/YEQBJQDkL1Ildz
 lgg2SYBf58MJvoMmkFhPt+m/C8dbTf46zdnMeYta5w==
X-Google-Smtp-Source: AGHT+IEj692s6sHHH68Z2z0Xg6tfYluHXBIT0/xynIuQXg1gcgFQDr5yhDk0r/MMzeglAYkU3a58MopmdrH31fABf9c=
X-Received: by 2002:a50:d50f:0:b0:542:d737:dc7e with SMTP id
 u15-20020a50d50f000000b00542d737dc7emr241432edi.0.1699026893314; Fri, 03 Nov
 2023 08:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231102230054.3195864-1-edliaw@google.com>
 <ZUTP3YcexuyOd3ye@yuki>
In-Reply-To: <ZUTP3YcexuyOd3ye@yuki>
Date: Fri, 3 Nov 2023 08:54:26 -0700
Message-ID: <CAG4es9XLK89HOXVOqZyYTD4cW1VQxVet645s=f-o9p9zTYYpPg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] madvise11: Allow test to skip if
 MADV_SOFT_OFFLINE is not supported
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ3lyaWwsCgpPbiBGcmksIE5vdiAzLCAyMDIzIGF0IDM6NDfigK9BTSBDeXJpbCBIcnViaXMg
PGNocnViaXNAc3VzZS5jej4gd3JvdGU6Cj4KPiBIaSEKPiA+IG1hZHZpc2UxMSB3aWxsIGV4aXQg
d2l0aCBURkFJTCBpZiBDT05GSUdfTUVNT1JZX0ZBSUxVUkUgaXMgbm90Cj4gPiBjb25maWd1cmVk
LiAgU2tpcCB0aGUgVEZBSUwgaWYgRUlOVkFMIGlzIHJldHVybmVkIGJ5IG1hZHZpc2UuCj4KPiBE
b2VzIGl0IG1ha2Ugc2Vuc2UgdG8ga2VlcCB0aGUgdGVzdCBydW5uaW5nIGlmIHRoZSBjb25maWcg
b3B0aW9uIGlzIG5vdAo+IHByZXNlbnQ/IEFzIGZhciBhcyBJIGNhbiB0ZWxsIHdlIGFyZSB0cnlp
bmcgdG8gcmVwcm9kdWNlIGEgcmFjZSB0aGVyZQo+IHRoYXQgZGVwZW5kcyBvbiB0aGUgbWFkdmlz
ZSBiZWluZyBhYmxlIHRvIHNvZnQgb2ZmbGluZSB0aGUgcGFnZXMuCj4KPiBXaGF0IGFib3V0IHRo
aXMgdGhlbj8KPgo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21hZHZp
c2UvbWFkdmlzZTExLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21hZHZpc2UvbWFkdmlz
ZTExLmMKPiBpbmRleCA3NGNhYWRjNDQuLjUwYWI5MzVjOSAxMDA2NDQKPiAtLS0gYS90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL21hZHZpc2UvbWFkdmlzZTExLmMKPiArKysgYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL21hZHZpc2UvbWFkdmlzZTExLmMKPiBAQCAtNDI2LDYgKzQyNiwxMCBA
QCBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Cj4gICAgICAgICAgICAgICAgICJybW1v
ZCIsCj4gICAgICAgICAgICAgICAgIE5VTEwKPiAgICAgICAgIH0sCj4gKyAgICAgICAubmVlZHNf
a2NvbmZpZ3MgPSAoY29uc3QgY2hhciAqW10pIHsKPiArICAgICAgICAgICAgICAgICJDT05GSUdf
TUVNT1JZX0ZBSUxVUkU9eSIsCj4gKyAgICAgICAgICAgICAgICBOVUxMCj4gKyAgICAgICAgfSwK
PiAgICAgICAgIC5tYXhfcnVudGltZSA9IDMwLAo+ICAgICAgICAgLm5lZWRzX2NoZWNrcG9pbnRz
ID0gMSwKPiAgICAgICAgIC5zZXR1cCA9IHNldHVwLAo+Cj4KPiAtLQoKWWVhaCwgdGhhdCBtYWtl
cyBtb3JlIHNlbnNlIHRvIG1lLgoKPiBDeXJpbCBIcnViaXMKPiBjaHJ1YmlzQHN1c2UuY3oKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
