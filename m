Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7BA74624
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Mar 2025 10:16:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743153372; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=KCFVbwwZhKphDm2unhK/W/d/TrO17PFkUZrdTpUlddw=;
 b=pL8kFD0I51dJg16TBwixwDei9fQy6Eblt479ejHfCXjIylJeUXsC+Ab978zcD1w0mNTwQ
 ajVuEjWr72HEXqQoVBcZ1mXQVxqz3c2VPEMcPUEUOhHa3w3dqCZNY0pOZAdVBDK3DJUvBja
 wyn3z6nns4pQhNdYiWdzEbB/kURWOOw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5880B3CA25B
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Mar 2025 10:16:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 516D03C1BD3
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 10:15:59 +0100 (CET)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 17B3E600683
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 10:15:58 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso14302215e9.3
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 02:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1743153357; x=1743758157; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0QdUHV2NrP6qVz7AKCpF4hARrwwFw4vKkzEJvRQKHH4=;
 b=Eryy/J0uIxsp2M5jYbg120vOFVBA4Vv35gw/6e75U1wefBuLhk+W3X3PZHxn+DuZtv
 NXlna6i2eaFiZ8wZCH/oZnHEUZUBkjIW+U/AZslUire9YCCGPrLYNYWu4zP/IjTnrb0e
 OTapG1JaTLsQW43Lr/LF+YE18tPxPJx1p1fCaSeF4ZGFM1nVgwPyJ5o613NzBBLB5rje
 Fnhpg8TPATMQGjDKEr+1OSw5ubRbw3hyj4MkHuIiNzI8r0KqRYMFXui6kx9MqVVtwx2H
 /jGnSvhouyAhf6wthrTvN/zkcY0WvXleWSvssfiaeAOSswIYw+Ml9iPpaGo78WjD3VQI
 4Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743153357; x=1743758157;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0QdUHV2NrP6qVz7AKCpF4hARrwwFw4vKkzEJvRQKHH4=;
 b=s3x75ZHei1sfm5HjgrChfbIRPdGPTrbQfgEMScZGIv6rfKRjjBnD1hzwq2MojtzPNJ
 4aeHPIbzEEtiXlAZ8EKhBVm1pgxqNIe1t4rRCylqseUQogUAoqdHa0UH/f3KuV5bnjd7
 0xty7cpyh1Bjgzfu5Rm8QocQ3m9syCv4VU5JErMnc/GaR+7Jz8pM20hMXQEgMDatJzKL
 5DzLZ1n8yE3WeaiUI/8TpB74oz1/nPdzyuX+NUYYPr8G25eftcWSH0NrU1k9sV3AwQAf
 2r6cVIuBEPdzqA7hWTZ4SpiqCqPTPZmTyt3elfbe65rJQL3TyPW9wlIHI1jZCs9Ju7B+
 PEiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOGBtALzUqByLC7oe+27oa62BvOIQFRbC92B6Je/vB5tO99AXU7ujRWBCeXUI5+pP66fU=@lists.linux.it
X-Gm-Message-State: AOJu0Yy25KJICLlDGtRo+qEP0CDXs90nOr2vOyhM7IqTwhNtEdw/jcQQ
 ZQgi0AG4ngXv2oHq66IUD77HHV4p6GgmCDZ6DbXmyVCNbyOpwix2QY1I4XrlxiRa77UlSiAkF2R
 Sd2uu0INi
X-Gm-Gg: ASbGncvHK/Noovx09I0Id53wOclF7Uwpmhhs9+HlcvO9NbKFMBROujYdHwSv3XErIzc
 JSEgzeKYvMx1QJVdt4ItZKDI9WuXvlSoDG+Jfvi0HsZZOKdQECtzYxg4klpsj4Gn+QrH2npuCk8
 FmAa67oVNjf4Z14fdFhezHW76y/ZaRIV9iygsA3J2JbMhwqZpsSTsmDiSwIk74Y8bug0ck6Lvm5
 nTneNHl4E0WOp0j2+Ts6Ybg/GoCx8Ct2YKwptXAIQBAaa9qcCuYdNPcwa2KBWFbL+6syE/2wyCF
 ORAnLGj60VVaLHblLC5xVyWuHUxPghIwBTgN0YXWEZM23jgoBm6C9nSPT+KsXSahJj6BQvuoxHh
 kFGQViyOdT3Ep8/kExR9q0yZr5g1jCeVPV/dFQo0c3cdW3Y20/mhHZzr/oXpf/nAXJF/FTN3+9T
 6PUpPNI6w=
X-Google-Smtp-Source: AGHT+IFgAEmSFUMwYRN4ZSG+E9Yg/IzrXTQgtPwgWCl9plD2hx4esHaBEWuW+MzzblTLj/J5n2B0wQ==
X-Received: by 2002:a05:6000:2ca:b0:391:487f:282a with SMTP id
 ffacd0b85a97d-39ad178c955mr5772146f8f.50.1743153357309; 
 Fri, 28 Mar 2025 02:15:57 -0700 (PDT)
Received: from ?IPV6:2003:ef:2f1a:ea00:b220:7501:321e:5c31?
 (p200300ef2f1aea00b2207501321e5c31.dip0.t-ipconnect.de.
 [2003:ef:2f1a:ea00:b220:7501:321e:5c31])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b60a9ddsm2071547f8f.0.2025.03.28.02.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 02:15:56 -0700 (PDT)
Message-ID: <422e42ad-fe69-4c52-af9e-35c3b1ebdf67@suse.com>
Date: Fri, 28 Mar 2025 10:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: rbm@suse.com, Linux Test Project <ltp@lists.linux.it>
References: <20250327-conversions-modify_ldt-v2-0-2907d4d3f6c0@suse.com>
 <20250327-conversions-modify_ldt-v2-1-2907d4d3f6c0@suse.com>
Content-Language: en-US
In-Reply-To: <20250327-conversions-modify_ldt-v2-1-2907d4d3f6c0@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/6] syscalls/modify_ldt: Add lapi/ldt.h
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

SGkgUmljYXJkbywKCk9uIDMvMjcvMjUgMTU6MjgsIFJpY2FyZG8gQi4gTWFybGllcmUgdmlhIGx0
cCB3cm90ZToKPiBGcm9tOiBSaWNhcmRvIEIuIE1hcmxpw6hyZSA8cmJtQHN1c2UuY29tPgo+Cj4g
QWRkIGEgd3JhcHBlciB0byBtb2RpZnlfbGR0IGFuZCBhIGZhbGxiYWNrIHRvIHRoZSB1c2VyX2Rl
c2Mgc3RydWN0dXJlIHdoaWNoCj4gaXMgdXNlZCBpbiBhIGZldyB0ZXN0cyBhbmQgc2hvdWxkIGJl
IHJldXNlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gQi4gTWFybGnDqHJlIDxyYm1Ac3Vz
ZS5jb20+Cj4gLS0tCj4gICBjb25maWd1cmUuYWMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMSAtCj4gICBpbmNsdWRlL2xhcGkvbGR0LmggICAgICAgICAgICAgICAgICAgICAgfCA2MSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIHRlc3RjYXNlcy9jdmUvY3ZlLTIw
MTUtMzI5MC5jICAgICAgICAgICB8IDM1ICsrKystLS0tLS0tLS0tLS0tLS0KPiAgIHRlc3RjYXNl
cy9jdmUvY3ZlLTIwMTctMTcwNTMuYyAgICAgICAgICB8IDEwICsrKy0tLQo+ICAgdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9mb3JrL2ZvcmswNS5jIHwgIDUgKystCj4gICA1IGZpbGVzIGNoYW5n
ZWQsIDc0IGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Nv
bmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwo+IGluZGV4IDY3MTA3OWYzYWE0OGM3Mjg2NmY2OWU3
YzU0NWQzNDI4YmE4N2Y5MzEuLmIyMmYzZWFjZGIxY2NiNzY0ZWFlNDQzYWIxZmI3MGFmZDk3MWEx
NGMgMTAwNjQ0Cj4gLS0tIGEvY29uZmlndXJlLmFjCj4gKysrIGIvY29uZmlndXJlLmFjCj4gQEAg
LTQ2LDcgKzQ2LDYgQEAgQUNfQ0hFQ0tfREVDTFMoW1BSX0NBUEJTRVRfRFJPUCwgUFJfQ0FQQlNF
VF9SRUFEXSwsLFsjaW5jbHVkZSA8c3lzL3ByY3RsLmg+XSkKPiAgIEFDX0NIRUNLX0RFQ0xTKFtT
RU1fU1RBVF9BTlldLCwsWyNpbmNsdWRlIDxzeXMvc2VtLmg+XSkKPiAgIAo+ICAgQUNfQ0hFQ0tf
SEVBREVSU19PTkNFKFsgXAo+IC0gICAgYXNtL2xkdC5oIFwKPiAgICAgICBhc20vcHJjdGwuaCBc
Cj4gICAgICAgY3B1aWQuaCBcCj4gICAgICAgZW1taW50cmluLmggXAo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xhcGkvbGR0LmggYi9pbmNsdWRlL2xhcGkvbGR0LmgKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjA1
ZGVmMTk1YmQ4NGI5YmFkNDcyNTUyNWU5ZmVkZTM4ZGY1YWU3YmUKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvaW5jbHVkZS9sYXBpL2xkdC5oCj4gQEAgLTAsMCArMSw2MSBAQAo+ICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+ICsvKgo+ICsgKiBDb3B5cmlnaHQg
KGMpIDIwMjUgU1VTRSBMTEMgUmljYXJkbyBCLiBNYXJsacOocmUgPHJibUBzdXNlLmNvbT4KPiAr
ICovCj4gKwo+ICsjaWYgIShkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18p
KQo+ICsjZXJyb3IgImxkdC5oIHNob3VsZCBvbmx5IGJlIGluY2x1ZGVkIG9uIHg4NiIKPiArI2Vu
ZGlmCj4gKwo+ICsjaWZuZGVmIExBUElfTERUX0hfXwo+ICsjZGVmaW5lIExBUElfTERUX0hfXwo+
ICsKPiArI2luY2x1ZGUgImNvbmZpZy5oIgo+ICsjaW5jbHVkZSAibGFwaS9zeXNjYWxscy5oIgo+
ICsKPiArI2lmZGVmIEhBVkVfU1RSVUNUX1VTRVJfREVTQwo+ICsjaW5jbHVkZSA8YXNtL2xkdC5o
Pgo+ICsjZWxzZQo+ICtzdHJ1Y3QgdXNlcl9kZXNjIHsKPiArCXVuc2lnbmVkIGludCBlbnRyeV9u
dW1iZXI7Cj4gKwl1bnNpZ25lZCBpbnQgYmFzZV9hZGRyOwo+ICsJdW5zaWduZWQgaW50IGxpbWl0
Owo+ICsJdW5zaWduZWQgaW50IHNlZ18zMmJpdCA6IDE7Cj4gKwl1bnNpZ25lZCBpbnQgY29udGVu
dHMgOiAyOwo+ICsJdW5zaWduZWQgaW50IHJlYWRfZXhlY19vbmx5IDogMTsKPiArCXVuc2lnbmVk
IGludCBsaW1pdF9pbl9wYWdlcyA6IDE7Cj4gKwl1bnNpZ25lZCBpbnQgc2VnX25vdF9wcmVzZW50
IDogMTsKPiArCXVuc2lnbmVkIGludCB1c2VhYmxlIDogMTsKPiArI2lmZGVmIF9feDg2XzY0X18K
PiArCXVuc2lnbmVkIGludCBsbSA6IDE7Cj4gKyNlbmRpZiAvKiBfX3g4Nl82NF9fICovCj4gK307
Cj4gKyNlbmRpZiAvKiBIQVZFX1NUUlVDVF9VU0VSX0RFU0MgKi8KPiArCj4gKyNpZmRlZiBIQVZF
X1NUUlVDVF9NT0RJRllfTERUX0xEVF9TCj4gKy8qIEluIExpbnV4IDIuNCBhbmQgZWFybGllciwg
dGhpcyBzdHJ1Y3R1cmUgd2FzIG5hbWVkIG1vZGlmeV9sZHRfbGR0X3MuICovCj4gK3R5cGVkZWYg
c3RydWN0IG1vZGlmeV9sZHRfbGR0X3MgdXNlcl9kZXNjOwo+ICsjZW5kaWYgLyogSEFWRV9TVFJV
Q1RfTU9ESUZZX0xEVF9MRFRfUyAqLwpBbGwgdGhlIGFib3ZlIGlzIG5vdCBuZWVkZWQsIGJlY2F1
c2Ugd2UgYWx3YXlzIHN1cHBvcnQgYXNtL2xkdC5oIApmdW5jdGlvbmFsaXRpZXMuIFRoZSByZWFz
b24gaXMgdGhhdCBvdXIgbWluaW11bSBzdXBwb3J0ZWQga2VybmVsIGlzIDQuNCwgCndoaWxlIGZl
YXR1cmUgd2FzIHN0aWxsIHByZXNlbnQgaW4gMi54LgpZb3UgY2FuIHNhZmVseSByZW1vdmUgSEFW
RV9TVFJVQ1RfVVNFUl9ERVNDIGFuZCB0aGUgZmFsbGJhY2sgZGVmaW5pdGlvbnMgCm9mIHVzZXJf
ZGVzYy4KPiArCj4gK3N0YXRpYyBpbnQgbW9kaWZ5X2xkdChpbnQgZnVuYywgdm9pZCAqcHRyLCB1
bnNpZ25lZCBsb25nIGJ5dGVjb3VudCkKPiArewo+ICsJcmV0dXJuIHRzdF9zeXNjYWxsKF9fTlJf
bW9kaWZ5X2xkdCwgZnVuYywgcHRyLCBieXRlY291bnQpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50
IHNhZmVfbW9kaWZ5X2xkdChjb25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQgbGluZW5vLCBpbnQg
ZnVuYywKPiArCQkJICAgdm9pZCAqcHRyLCB1bnNpZ25lZCBsb25nIGJ5dGVjb3VudCkKPiArewo+
ICsJaW50IHJ2YWw7Cj4gKwo+ICsJcnZhbCA9IG1vZGlmeV9sZHQoZnVuYywgcHRyLCBieXRlY291
bnQpOwo+ICsJaWYgKHJ2YWwgPT0gLTEpCj4gKwkJdHN0X2Jya18oZmlsZSwgbGluZW5vLCBUQlJP
SyB8IFRFUlJOTywKPiArCQkJICJtb2RpZnlfbGR0KCVkLCAlcCwgJWx1KSIsIGZ1bmMsIHB0ciwg
Ynl0ZWNvdW50KTsKPiArCj4gKwlyZXR1cm4gcnZhbDsKPiArfQo+ICsKPiArI2RlZmluZSBTQUZF
X01PRElGWV9MRFQoZnVuYywgcHRyLCBieXRlY291bnQpIFwKPiArCXNhZmVfbW9kaWZ5X2xkdChf
X0ZJTEVfXywgX19MSU5FX18sIChmdW5jKSwgKHB0ciksIChieXRlY291bnQpKQo+ICsKPiArI2Vu
ZGlmIC8qIExBUElfTERUX0hfXyAqLwo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvY3ZlL2N2ZS0y
MDE1LTMyOTAuYyBiL3Rlc3RjYXNlcy9jdmUvY3ZlLTIwMTUtMzI5MC5jCj4gaW5kZXggNjNlNWQ5
MmM5MWI4MzBjZDgwNjZhNmE2YzMyOTQ2MWI3MjczMWYzMi4uZDFiZDFkOTQxNTM1OWQyNTY4YzY2
OTRmMTVmZmU4YWZlMmExZjY5MCAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMvY3ZlL2N2ZS0yMDE1
LTMyOTAuYwo+ICsrKyBiL3Rlc3RjYXNlcy9jdmUvY3ZlLTIwMTUtMzI5MC5jCj4gQEAgLTExOCwx
MiArMTE4LDEwIEBAIHBlcmhhcHMgdW5zdXJwcmlzaW5nbHkuKQo+ICAgI2luY2x1ZGUgInRzdF90
ZXN0LmgiCj4gICAjaW5jbHVkZSAidHN0X3RpbWVyLmgiCj4gICAKPiAtI2lmIGRlZmluZWQoX194
ODZfNjRfXykgfHwgZGVmaW5lZChfX2kzODZfXykKPiAtCj4gKyNpZiBkZWZpbmVkKF9faTM4Nl9f
KSB8fCBkZWZpbmVkKF9feDg2XzY0X18pCj4gICAjaW5jbHVkZSA8c3RkbGliLmg+Cj4gICAjaW5j
bHVkZSA8c3RkaW8uaD4KPiAgICNpbmNsdWRlIDxpbnR0eXBlcy5oPgo+IC0jaW5jbHVkZSA8YXNt
L2xkdC5oPgo+ICAgI2luY2x1ZGUgPHVuaXN0ZC5oPgo+ICAgI2luY2x1ZGUgPHN5cy9zeXNjYWxs
Lmg+Cj4gICAjaW5jbHVkZSA8c2V0am1wLmg+Cj4gQEAgLTEzMiw2ICsxMzAsNyBAQCBwZXJoYXBz
IHVuc3VycHJpc2luZ2x5LikKPiAgICNpbmNsdWRlIDxzeXMvd2FpdC5oPgo+ICAgI2luY2x1ZGUg
PGxpbnV4L3BlcmZfZXZlbnQuaD4KPiAgIAo+ICsjaW5jbHVkZSAibGFwaS9sZHQuaCIKPiAgICNp
bmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gICAjaW5jbHVkZSAidHN0X3NhZmVfcHRocmVhZC5o
Igo+ICAgCj4gQEAgLTE5OSwyNyArMTk4LDcgQEAgc3RhdGljIHZvaWQgc2V0X2xkdCh2b2lkKQo+
ICAgCQkudXNlYWJsZQkgPSAwCj4gICAJfTsKPiAgIAo+IC0JVEVTVCh0c3Rfc3lzY2FsbChfX05S
X21vZGlmeV9sZHQsIDEsICZkYXRhX2Rlc2MsIHNpemVvZihkYXRhX2Rlc2MpKSk7Cj4gLQo+IC0J
LyoKPiAtCSAqIFRoZSBrZXJuZWwgaW50ZW50aW9uYWxseSBjYXN0cyBtb2RpZnlfbGR0KCkgcmV0
dXJuIHZhbHVlCj4gLQkgKiB0byB1bnNpZ25lZCBpbnQgdG8gcHJldmVudCBzaWduIGV4dGVuc2lv
biB0byA2NCBiaXRzLiBUaGlzIG1heQo+IC0JICogcmVzdWx0IGluIHN5c2NhbGwoKSByZXR1cm5p
bmcgdGhlIHZhbHVlIGFzIGlzIGluc3RlYWQgb2Ygc2V0dGluZwo+IC0JICogZXJybm8gYW5kIHJl
dHVybmluZyAtMS4KPiAtCSAqLwo+IC0JaWYgKFRTVF9SRVQgPiAwICYmICgoaW50KVRTVF9SRVQp
IDwgMCkgewo+IC0JCXRzdF9yZXMoVElORk8sCj4gLQkJCSJXQVJOSU5HOiBMaWJjIG1pc2hhbmRs
ZWQgbW9kaWZ5X2xkdCgpIHJldHVybiB2YWx1ZSIpOwo+IC0JCVRTVF9FUlIgPSAtKGludClUU1Rf
UkVUOwo+IC0JCVRTVF9SRVQgPSAtMTsKPiAtCX0KU29ycnkgYnV0IEkgbWlzc2VkIHRoaXMuIEl0
IHNlZW1zIHRvIGJlIHJpZ2h0Li4ua2VybmVsIGNvZGUgaW4gCmFyY2gveDg2L2tlcm5lbC9sZHQu
Yzo2ODcKRXZlbiBrc2VsZnRlc3RzIGFyZSBub3QgdGFraW5nIGNhcmUgb2YgdGhpcyBhbmQgd2Ug
c2hvdWxkIGZvbGxvdyAKZG9jdW1lbnRhdGlvbiwgd2hpY2ggc2F5cyAtMSByZXR1cm4gdmFsdWUg
aXMgdGhlIGRlZmF1bHQgdmFsdWUgZm9yIGVycm9yLgoKSSBoYXZlIHRoZSBmZWVsaW5nIHRoaXMg
Y29kZSB3YXMgd3JvbmcuIEBDeXJpbCB3aGF0IGRvIHlvdSB0aGluaz8KCj4gLQo+IC0JaWYgKFRT
VF9SRVQgPT0gLTEgJiYgVFNUX0VSUiA9PSBFSU5WQUwpIHsKPiAtCQl0c3RfYnJrKFRDT05GIHwg
VFRFUlJOTywKPiAtCQkJIm1vZGlmeV9sZHQ6IDE2LWJpdCBkYXRhIHNlZ21lbnRzIGFyZSBwcm9i
YWJseSBkaXNhYmxlZCIpOwo+IC0JfSBlbHNlIGlmIChUU1RfUkVUICE9IDApIHsKPiAtCQl0c3Rf
YnJrKFRCUk9LIHwgVFRFUlJOTywgIm1vZGlmeV9sZHQiKTsKPiAtCX0KPiArCVNBRkVfTU9ESUZZ
X0xEVCgxLCAmZGF0YV9kZXNjLCBzaXplb2YoZGF0YV9kZXNjKSk7Cj4gICB9Cj4gICAKPiAgIHN0
YXRpYyB2b2lkIHRyeV9jb3JydXB0X3N0YWNrKHVuc2lnbmVkIHNob3J0ICpvcmlnX3NzKQo+IEBA
IC01MjgsOCArNTA3LDYgQEAgc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+ICAgCX0K
PiAgIH07Cj4gICAKPiAtI2Vsc2UgLyogZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBkZWZpbmVkKF9f
aTM4Nl9fKSAqLwo+IC0KPiAtVFNUX1RFU1RfVENPTkYoIm5vdCAoaTM4NiBvciB4ODZfNjQpIik7
Cj4gLQo+IC0jZW5kaWYKPiArI2Vsc2UKPiArVFNUX1RFU1RfVENPTkYoIlRlc3Qgc3VwcG9ydGVk
IG9ubHkgb24geDg2Iik7Cj4gKyNlbmRpZiAvKiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVk
KF9feDg2XzY0X18pICovCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9jdmUvY3ZlLTIwMTctMTcw
NTMuYyBiL3Rlc3RjYXNlcy9jdmUvY3ZlLTIwMTctMTcwNTMuYwo+IGluZGV4IGZlN2I2ZDY5NGQ2
ZmZiYmNlODYzYWJjMTY3MmUwM2FlNWY0MTlkZjEuLjdiYTIyZmE5NGNlZTU3ZmNiMGIwYjYwYzI0
NjJkMDM2Y2I0YTQwYzUgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2N2ZS9jdmUtMjAxNy0xNzA1
My5jCj4gKysrIGIvdGVzdGNhc2VzL2N2ZS9jdmUtMjAxNy0xNzA1My5jCj4gQEAgLTE2LDggKzE2
LDcgQEAKPiAgICNpbmNsdWRlICJjb25maWcuaCIKPiAgICNpbmNsdWRlICJ0c3RfdGVzdC5oIgo+
ICAgCj4gLSNpZmRlZiBIQVZFX0FTTV9MRFRfSAo+IC0jaW5jbHVkZSA8YXNtL2xkdC5oPgo+ICsj
aWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKQo+ICAgI2luY2x1ZGUg
PHB0aHJlYWQuaD4KPiAgICNpbmNsdWRlIDxzaWduYWwuaD4KPiAgICNpbmNsdWRlIDxzdGRsaWIu
aD4KPiBAQCAtMjYsNiArMjUsNyBAQAo+ICAgI2luY2x1ZGUgPHVuaXN0ZC5oPgo+ICAgI2luY2x1
ZGUgPHN0ZGlvLmg+Cj4gICAKPiArI2luY2x1ZGUgImxhcGkvbGR0LmgiCj4gICAjaW5jbHVkZSAi
bGFwaS9zeXNjYWxscy5oIgo+ICAgCj4gICAjZGVmaW5lIEVYRUNfVVNFQyAgIDUwMDAwMDAKPiBA
QCAtMTA5LDcgKzEwOSw3IEBAIHZvaWQgcnVuX3Rlc3Qodm9pZCkKPiAgIAlzdHJ1Y3QgdXNlcl9k
ZXNjIGRlc2MgPSB7IC5lbnRyeV9udW1iZXIgPSA4MTkxIH07Cj4gICAKPiAgIAlpbnN0YWxsX3Np
Z2hhbmRsZXIoKTsKPiAtCXN5c2NhbGwoX19OUl9tb2RpZnlfbGR0LCAxLCAmZGVzYywgc2l6ZW9m
KGRlc2MpKTsKPiArCVNBRkVfTU9ESUZZX0xEVCgxLCAmZGVzYywgc2l6ZW9mKGRlc2MpKTsKPiAg
IAo+ICAgCWZvciAoOzspIHsKPiAgIAkJaWYgKHNobS0+ZG9fZXhpdCkKPiBAQCAtMTY0LDUgKzE2
NCw1IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPiAgIH07Cj4gICAKPiAgICNl
bHNlCj4gLVRTVF9URVNUX1RDT05GKCJubyBhc20vbGR0LmggaGVhZGVyIChvbmx5IGZvciBpMzg2
IG9yIHg4Nl82NCkiKTsKPiAtI2VuZGlmCj4gK1RTVF9URVNUX1RDT05GKCJUZXN0IHN1cHBvcnRl
ZCBvbmx5IG9uIHg4NiIpOwo+ICsjZW5kaWYgLyogZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5l
ZChfX3g4Nl82NF9fKSAqLwo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2ZvcmsvZm9yazA1LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZvcmsvZm9yazA1LmMK
PiBpbmRleCAyMmVkZWZjMzY4Njk3OGZiYjk0NTNkZmZhYmZjYmNjYjdlYTZiYjEyLi45YWExMmUx
NjIwMWRlYzhmM2QyYTRjOTlkZjgzYzRlNWUyNWVmODU3IDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvZm9yay9mb3JrMDUuYwo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvZm9yay9mb3JrMDUuYwo+IEBAIC01NSw4ICs1NSw3IEBACj4gICAKPiAgICNpZiBk
ZWZpbmVkKF9faTM4Nl9fKQo+ICAgCj4gLSNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gLSNp
bmNsdWRlIDxhc20vbGR0Lmg+Cj4gKyNpbmNsdWRlICJsYXBpL2xkdC5oIgo+ICAgCj4gICBzdGF0
aWMgdm9pZCBydW4odm9pZCkKPiAgIHsKPiBAQCAtNzYsNyArNzUsNyBAQCBzdGF0aWMgdm9pZCBy
dW4odm9pZCkKPiAgIAlsZHQwLnNlZ19ub3RfcHJlc2VudCA9IDA7Cj4gICAJbGR0MC51c2VhYmxl
ID0gMTsKPiAgIAo+IC0JdHN0X3N5c2NhbGwoX19OUl9tb2RpZnlfbGR0LCAxLCAmbGR0MCwgc2l6
ZW9mKGxkdDApKTsKPiArCVNBRkVfTU9ESUZZX0xEVCgxLCAmbGR0MCwgc2l6ZW9mKGxkdDApKTsK
PiAgIAo+ICAgCWFzbSB2b2xhdGlsZSAoIm1vdncgJXcwLCAlJWZzIjo6InEiICg3KSk7Cj4gICAJ
YXNtIHZvbGF0aWxlICgibW92bCAlJWZzOjAsICUwIjoiPXIiIChsbykpOwo+ClRoZSByZXN0IGxv
b2tzIG9rLAoKQW5kcmVhCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
