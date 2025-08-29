Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 04530B3B093
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Aug 2025 03:45:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1756431910; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=CsFZ8ZYEWatocPNB1GB9z2ed5T0AZ3b0mWncR1y09ns=;
 b=EhuuKP39mQiXNur7t/Xl3JEB/NB+QQC8znofNZ5Ek+KjIaDsWMm2zuzVa/z7SCQT6zW9R
 CC+nEfCr2EAZhRGOusOCruHjWaX48gKi4HG8EOR4s8q0zMvzzhKECWE9r4qREWZWxEPnnUK
 i12oI7o51h747yD6dj3qxKY6U1NZpxs=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A603D3CD09B
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Aug 2025 03:45:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E1EF3C6BA8
 for <ltp@lists.linux.it>; Fri, 29 Aug 2025 03:44:58 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8D0EB1400217
 for <ltp@lists.linux.it>; Fri, 29 Aug 2025 03:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756431894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5X40XG07YkqqI/3gFit4Gf+judv4Ri1Q3cynyXfFqwQ=;
 b=TBXl9fCmqIwihdPJYAKugtOI+CIgUgUr29cvELhoBo7t/Jjm+a3VMVYNGHp9p1ZC7LinGr
 G4GvMLC7d1ObCBtXuZu5EwfkqtBeXAcWOmooPbR7u/dRoa8ZeaupcCS1Qn0wWYlRF0FXhN
 JjRWgk+Dt2Atz6RE1nDNQE+3K3i6xRQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-uLQBMtfbNuOdCumShjKMfQ-1; Thu, 28 Aug 2025 21:44:52 -0400
X-MC-Unique: uLQBMtfbNuOdCumShjKMfQ-1
X-Mimecast-MFC-AGG-ID: uLQBMtfbNuOdCumShjKMfQ_1756431891
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24895637fe1so17769515ad.2
 for <ltp@lists.linux.it>; Thu, 28 Aug 2025 18:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756431891; x=1757036691;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5X40XG07YkqqI/3gFit4Gf+judv4Ri1Q3cynyXfFqwQ=;
 b=DEPOHTJ08kVrbzczs0MGJHGHZqqWedt2ica9834Mzl5MXeEnwu5JFWSb9ryanFk4ks
 6Rf1UOtFFsmErS19QYyhf6krxMesnRWjuQaDz3sE276wh/V1xn2iVsNp/QfqtQYKFJ7X
 lGth7v0fflPW2UfPV0BxGHO1kLxBQJdbBIRoUNsnvkVd9GupYU6vjcgiGw0O64N1aM+4
 zCAsmdVsufJYvD/YD9jdgf+BIy9fvdIhZwW0o1e5laNzslMsBdp5uex9HQZVFA3hG13p
 f1Pj9m4sAiBGudxv1PjrXWTmSrcXsSoWZ0OssEjrV+rxGYDyX9eyPIEujFcyAwrAXRoC
 7lhA==
X-Gm-Message-State: AOJu0YyxErncDrrkys22tdnFTxQ6Pi+sNjsV3j2vz28vgs9ko82Ha0uj
 Eu1c9zt/fdrosB72Ss4zFC+7HyhV2IQfE3SQ/AXOqqJ3NFKIwhCM067qsFLxJ/tVuZAqE/edlBk
 4cIrRbvTMwnWiWWr8zMfRzIgvEzuwDNRucGEd9JtFyXPseZJbsyEbZEOB+lvv/gaegPOeWxfFKV
 f0lEUnFBWIMNQeKqoyt5kvZgP/2xw=
X-Gm-Gg: ASbGncv+zsyD7XGtrxNZBKD54QrETuL7z/9N+0B7aSA+ITM3ZwR+UUo0qdL+jdkKhNx
 DhaVreqHgIKCflGFS/S86dsd28xzDdOPZO4HxczgvGr5Iba7sX0AMZh2fnzZdqpB4Rs0zPzu0vZ
 NwWpaJF2etKQTeMBeVMe5YHA==
X-Received: by 2002:a17:903:11c5:b0:240:3239:21c7 with SMTP id
 d9443c01a7336-2462ef1f6f0mr309271145ad.37.1756431890937; 
 Thu, 28 Aug 2025 18:44:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXCDWix16K9bOCIbOD6B5xZuqhHWlMT00TYDervcnyNRgxfD3hh+GqcSVEAgVpA/zPe/1YPJ8nnGir57Re0f0=
X-Received: by 2002:a17:903:11c5:b0:240:3239:21c7 with SMTP id
 d9443c01a7336-2462ef1f6f0mr309270955ad.37.1756431890515; Thu, 28 Aug 2025
 18:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250828225157.982-1-wegao@suse.com>
In-Reply-To: <20250828225157.982-1-wegao@suse.com>
Date: Fri, 29 Aug 2025 09:44:38 +0800
X-Gm-Features: Ac12FXzg0VICztnTNAW-vwT3H0eeYUb0pXA9P-WISLtbIPn-i-jriCnlpEgNqq4
Message-ID: <CAEemH2eBF=a+huC=s-=EdytZnNNjGOFG74Cds7V89G4xZ6He9A@mail.gmail.com>
To: Wei Gao <wegao@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EAjkJ1UaGlYhHgFoIIOYnRxBGveawhGXMAh3u71KPns_1756431891
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v1] fsmount01: Add test if MOUNT_ATTR_* have
 expected effect on the mount
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCBBdWcgMjksIDIwMjUgYXQgNjo1MuKAr0FNIFdlaSBHYW8gdmlhIGx0cCA8bHRwQGxp
c3RzLmxpbnV4Lml0PiB3cm90ZToKCj4gVGhlIGZzbW91bnQwMSB0ZXN0IGRvZXMgbm90IHRlc3Qg
aWYgTU9VTlRfQVRUUl8qIGhhdmUgZXhwZWN0ZWQgZWZmZWN0Cj4gb24gdGhlIG1vdW50LCBlLmcu
IGlmIE1PVU5UX0FUVFJfUkRPTkxZIG1vdW50cyB0aGUgRlMgcmVhZCBvbmx5IGV0Yy4KPgo+IEZp
eGVzOiAjMTE3MAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBHYW8gPHdlZ2FvQHN1c2UuY29tPgo+IC0t
LQo+ICBpbmNsdWRlL3RzdF9kZXZpY2UuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
Cj4gIGxpYi90c3RfZGV2aWNlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
Cj4gIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnNtb3VudC9mc21vdW50MDEuYyB8IDI3ICsr
KysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS90c3RfZGV2aWNlLmggYi9pbmNs
dWRlL3RzdF9kZXZpY2UuaAo+IGluZGV4IGUwNjI3YTI0ZC4uMjRiNTIwMWM1IDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvdHN0X2RldmljZS5oCj4gKysrIGIvaW5jbHVkZS90c3RfZGV2aWNlLmgKPgoK
Cj4gQEAgLTM1LDYgKzM1LDcgQEAgaW50IHRzdF91bW91bnQoY29uc3QgY2hhciAqcGF0aCk7Cj4g
IGludCB0c3RfaXNfbW91bnRlZChjb25zdCBjaGFyICpwYXRoKTsKPiAgaW50IHRzdF9pc19tb3Vu
dGVkX3JvKGNvbnN0IGNoYXIgKnBhdGgpOwo+ICBpbnQgdHN0X2lzX21vdW50ZWRfcncoY29uc3Qg
Y2hhciAqcGF0aCk7Cj4KCgo+ICtpbnQgdHN0X21vdW50X2hhc19vcHQoY29uc3QgY2hhciAqcGF0
aCwgY29uc3QgY2hhciAqb3B0KTsKPgoKR29vZCBwb2ludCwgSSByZW9yZGVyZWQgdGhpcyB0byB0
aGUgdG9wIGFib3ZlIHRoZSB0aHJlZSBtb3VudHMgYW5kIHB1c2hlZC4KVGhhbmtzIGZvciB0aGUg
ZW5oYW5jZW1lbnQuCgotLSAKUmVnYXJkcywKTGkgV2FuZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
