Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F4A6ED21
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Mar 2025 10:58:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1742896701; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=Uw6Wt6rmf0zJ2yVjcHdI5Eo22PPGxWVrvhyogVm656I=;
 b=emOrBUZ+0p9NhOxMU2ks4z1cjr2d8m0WYGnxSpabmkdPPH9osG51+LHaJcyaAcq8H5kDQ
 hwkpLWN2JaoNTEghre/XkdGv1QuAQo8y92zFpuzkA8C/KmCWCPw6gnElc3nT8l5b8gXneBi
 5ZQlxcslNl5RqnjRkx2Fmi7fRylmuTg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 091B93C98E7
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Mar 2025 10:58:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B02593C2FC6
 for <ltp@lists.linux.it>; Tue, 25 Mar 2025 10:58:08 +0100 (CET)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C3025600977
 for <ltp@lists.linux.it>; Tue, 25 Mar 2025 10:58:07 +0100 (CET)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso5020111f8f.2
 for <ltp@lists.linux.it>; Tue, 25 Mar 2025 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1742896687; x=1743501487; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1apIEMkinuh/y0m6QRbFE5U3dJxmauzaTHHKzKXa3zI=;
 b=EJMQeHtbED6Rbyz+YCeY9Z493hJIS34Oths5nk/4bs/mNEBXrUCyK0Gj8+dJOeB+bY
 h3/SG+h817fEjwa3SOomAUWa0Q7Dgt2Pytp7p2jd8iyW92drM3wBr8y+gO5zFy39+zDB
 CKq1x+rvZicnJJFUyi1XZ+UJvzWpguskkQ4jSeouevEUAGdI64B2C/G1j5a520WbPpnh
 wVtg0lBHdQyRRui63oap4QlLVhsZplVQP/UYpjk3GqcHmL5MMT6+P8WeqSTFWcVBpSxA
 VZRYb+tfBL1e1vOoWNLAEIe26UpZSRFHz5BlnCsyH9pNe1gtOaSvR1ahNO/aVq9t9/tk
 wmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742896687; x=1743501487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1apIEMkinuh/y0m6QRbFE5U3dJxmauzaTHHKzKXa3zI=;
 b=G41IQCI+IftjdnOzj0XB1KPUTALaKMazAbNjdTZjnL7UsxJtkCLknfFDzKQXQXB0Z6
 PxPSqqMSDbloIGqLJSV4FKa6riKlqCmH8zJqEJqnjMkOL7F4qYMIaKHqvRZBghpMlJNL
 KFnfPNVOuIA/hDJRW+cv8MlRcJUUbPa+UtHar9ZL4g41OcBqF+uq/r/TehtoCOLXuA60
 fBHlpgxDfL9CIX/d7F3bg6gc3vC3uLEBXFs3PTRlGkZFJ5xjWOfVeWpzEeDI8LgP7/97
 bIVlJ7Yb5RQAVkQSvt3H/aUdNFy4AFZV20oqc3mGtfpwvh6wYVICGsyYw+L8Ag6gvfTj
 Ip6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVagiTLlIHzH1dMnjPeArhmKZPJp+Q14Zy9YTXufJGpDHyBBMgTko0tiKVJfqt7wdHGntk=@lists.linux.it
X-Gm-Message-State: AOJu0YzJI1v0FqYbVV6QYMCxlZQZnUtSxMmmX9T+aSqQCLKKf6gzarF1
 uhKrSd+KXICON3sWc76Gjty1pKu1W6f7HW+zZFbw/XkDK+AMvfDAvbYwKS936b1R43cBvpwZoqO
 M2Gz966Ol
X-Gm-Gg: ASbGncsQBE7ilZMP3QMpzp/ohAc2oAoyX+nb/CxUVLV+dIxNz54GFHOp0+WYCwhk+BW
 92BqTZMrzOndYNjoTEq/uuEz45g1RYpGu1bcvNKedHYS53BmAI958BqOtkmCS6IYaVxuy9dGYIi
 uMmzUOPELA6lw10yWzC8UMLLnCJhQnQjeq23+h9QoQbAGntg/ub3nj0BkFMRqYW1g3gVJmelv2J
 57ijHX7E9aQHt2vzIOFh2Gzb1mPgnBSpbAcsY6rUwHzQ0kWSdJl/E+tykPLJN/a9a5JjPWYumBi
 L5crc26BEwyHn8FSJ23ObzPQ9gU0cRGpT0hLpc1Fx0ZRLryZLLRXW8+072rjpbkNCg==
X-Google-Smtp-Source: AGHT+IHv/UQ0l3oUh1GFX/CQwuLTMvodgHL/DCPWtOyspqVW78TuFTnRAcjm6mWvL/PQ8gzaSsgF+g==
X-Received: by 2002:a05:6000:1acf:b0:391:487f:280b with SMTP id
 ffacd0b85a97d-3997f8f9e6bmr14535723f8f.10.1742896687117; 
 Tue, 25 Mar 2025 02:58:07 -0700 (PDT)
Received: from [10.232.133.75] ([88.128.90.56])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e65f0sm13365894f8f.74.2025.03.25.02.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 02:58:06 -0700 (PDT)
Message-ID: <d2421a65-bdc8-4ccf-9614-c08afbda42f2@suse.com>
Date: Tue, 25 Mar 2025 10:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: rbm@suse.com, Linux Test Project <ltp@lists.linux.it>
References: <20250324-conversions-modify_ldt-v1-0-8d6d82f10768@suse.com>
 <20250324-conversions-modify_ldt-v1-1-8d6d82f10768@suse.com>
Content-Language: en-US
In-Reply-To: <20250324-conversions-modify_ldt-v1-1-8d6d82f10768@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/4] modify_ldt: Add lapi/ldt.h
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

SGkhCgpUaGUgbW9kaWZ5X2xkdCBzeXNjYWxsIGV4aXN0cyBmb3IgYSBsb25nIHRpbWUgYmVmb3Jl
IHRoZSBtaW5pbXVtIGtlcm5lbCAKdmVyc2lvbiA0LjQgdGhhdCB3ZSBzdXBwb3J0IGluIExUUC4K
U28gd2UgY2FuIGhhcHBpbHkgaWdub3JlIGFueSBmYWxsYmFjayBkZWZpbml0aW9uIGFuZCB0byBy
ZW1vdmUgYXNtL2xkdC5oIApjaGVjayBmcm9tIGNvbmZpZ3VyZS5hYy4KCk1vcmUgY29tbWVudHMg
YmVsb3cuCgpPbiAzLzI0LzI1IDIxOjQ1LCBSaWNhcmRvIEIuIE1hcmxpZXJlIHZpYSBsdHAgd3Jv
dGU6Cj4gRnJvbTogUmljYXJkbyBCLiBNYXJsacOocmUgPHJibUBzdXNlLmNvbT4KPgo+IEFkZCBh
IHdyYXBwZXIgdG8gbW9kaWZ5X2xkdCBhbmQgYSBmYWxsYmFjayB0byB0aGUgdXNlcl9kZXNjIHN0
cnVjdHVyZSB3aGljaAo+IGlzIHVzZWQgaW4gYSBmZXcgdGVzdHMgYW5kIHNob3VsZCBiZSByZXVz
ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIEIuIE1hcmxpw6hyZSA8cmJtQHN1c2UuY29t
Pgo+IC0tLQo+ICAgaW5jbHVkZS9sYXBpL2xkdC5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCA1MyArKysrKysrKysrKysrKysrKysrKysrCj4gICB0ZXN0Y2FzZXMvY3ZlL2N2ZS0y
MDE1LTMyOTAuYyAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKy0tLQo+ICAgdGVzdGNhc2Vz
L2N2ZS9jdmUtMjAxNy0xNzA1My5jICAgICAgICAgICAgICAgICAgICAgfCAxMCArKy0tCj4gICB0
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZvcmsvZm9yazA1LmMgICAgICAgICAgICB8ICA0ICst
Cj4gICAuLi4vc3lzY2FsbHMvc2V0X3RocmVhZF9hcmVhL3NldF90aHJlYWRfYXJlYS5oICAgICB8
IDMxIC0tLS0tLS0tLS0tLS0KPiAgIC4uLi9zeXNjYWxscy9zZXRfdGhyZWFkX2FyZWEvc2V0X3Ro
cmVhZF9hcmVhMDEuYyAgIHwgMTQgKysrLS0tCj4gICA2IGZpbGVzIGNoYW5nZWQsIDc0IGluc2Vy
dGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGFwaS9s
ZHQuaCBiL2luY2x1ZGUvbGFwaS9sZHQuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMDExMTM4YTFkMjJhZGZk
OTRiY2RhOWIzMWNhZmQzNzQ2MjcyNTU2Ygo+IC0tLSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRl
L2xhcGkvbGR0LmgKPiBAQCAtMCwwICsxLDUzIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9yLWxhdGVyCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoYykgMjAyNSBTVVNF
IExMQyBSaWNhcmRvIEIuIE1hcmxpw6hyZSA8cmJtQHN1c2UuY29tPgo+ICsgKi8KPiArCj4gKyNp
ZiAhKGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykpCj4gKyNlcnJvciAi
bGR0Lmggc2hvdWxkIG9ubHkgYmUgaW5jbHVkZWQgb24geDg2Igo+ICsjZW5kaWYKPiArCj4gKyNp
Zm5kZWYgTEFQSV9MRFRfSF9fCj4gKyNkZWZpbmUgTEFQSV9MRFRfSF9fCj4gKwo+ICsjaW5jbHVk
ZSAiY29uZmlnLmgiCj4gKyNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gKwo+ICsjaWZkZWYg
SEFWRV9BU01fTERUX0gKPiArI2luY2x1ZGUgPGFzbS9sZHQuaD4KPiArI2Vsc2UKPiArc3RydWN0
IHVzZXJfZGVzYyB7Cj4gKwl1bnNpZ25lZCBpbnQgZW50cnlfbnVtYmVyOwo+ICsJdW5zaWduZWQg
aW50IGJhc2VfYWRkcjsKPiArCXVuc2lnbmVkIGludCBsaW1pdDsKPiArCXVuc2lnbmVkIGludCBz
ZWdfMzJiaXQgOiAxOwo+ICsJdW5zaWduZWQgaW50IGNvbnRlbnRzIDogMjsKPiArCXVuc2lnbmVk
IGludCByZWFkX2V4ZWNfb25seSA6IDE7Cj4gKwl1bnNpZ25lZCBpbnQgbGltaXRfaW5fcGFnZXMg
OiAxOwo+ICsJdW5zaWduZWQgaW50IHNlZ19ub3RfcHJlc2VudCA6IDE7Cj4gKwl1bnNpZ25lZCBp
bnQgdXNlYWJsZSA6IDE7Cj4gKyNpZmRlZiBfX3g4Nl82NF9fCj4gKwl1bnNpZ25lZCBpbnQgbG0g
OiAxOwo+ICsjZW5kaWYgLyogX194ODZfNjRfXyAqLwo+ICt9Owo+ICsjZW5kaWYgLyogSEFWRV9B
U01fTERUX0ggKi8KPiArCj4gKyNpZmRlZiBIQVZFX1NUUlVDVF9NT0RJRllfTERUX0xEVF9TCj4g
Ky8qCj4gKyAqIEZyb20gbWFuIDIgbW9kaWZ5X2xkdDoKPiArICogSW4gTGludXggMi40IGFuZCBl
YXJsaWVyLCB0aGlzIHN0cnVjdHVyZSB3YXMgbmFtZWQgbW9kaWZ5X2xkdF9sZHRfcy4KPiArICov
Cj4gK3R5cGVkZWYgc3RydWN0IG1vZGlmeV9sZHRfbGR0X3MgdXNlcl9kZXNjOwo+ICsjZW5kaWYg
LyogSEFWRV9TVFJVQ1RfTU9ESUZZX0xEVF9MRFRfUyAqLwo+ICsKPiArLyoKPiArICogRnJvbSBt
YW4gMiBtb2RpZnlfbGR0Ogo+ICsgKiBOb3RlOiBnbGliYyBwcm92aWRlcyBubyB3cmFwcGVyIGZv
ciBtb2RpZnlfbGR0KCksIG5lY2Vzc2l0YXRpbmcgdGhlIHVzZSBvZgo+ICsgKiBzeXNjYWxsKDIp
Lgo+ICsgKi8KPiArc3RhdGljIGludCBtb2RpZnlfbGR0KGludCBmdW5jLCB2b2lkICpwdHIsIHVu
c2lnbmVkIGxvbmcgYnl0ZWNvdW50KQo+ICt7Cj4gKwlyZXR1cm4gc3lzY2FsbChfX05SX21vZGlm
eV9sZHQsIGZ1bmMsIHB0ciwgYnl0ZWNvdW50KTsKSWYgd2Ugd2FudCB0byBkZWZpbmUgYW55IHdy
YXBwZXIgYXJvdW5kIGEgc3lzY2FsbCwgd2UgbmVlZCB0byB1c2UgCnRzdF9zeXNjYWxsLiBJdCdz
IGEgc2FmZXIgd2F5IHRvIGhhbmRsZSBzeXNjYWxscyBlcnJvcnMgZHVlIHRvIEVOT1NZUy4KCldl
IGFyZSBhbHNvIGNoZWNraW5nIGZvciBtb2RpZnlfbGR0KDIpIHN5c2NhbGwgaW4gdGhlIGNvbmZp
Z3VyZS5hYyBmaWxlLCAKc28gd2UgY2FuIHVzZSBIQVZFX01PRElGWV9MRFQgdG8gdmVyaWZ5IHRo
YXQgbm8gd3JhcHBlcnMgaGF2ZSBiZWVuIApkZWZpbmVkIGJlZm9yZS4KClRoZW4gd2UgY2FuIGFk
ZCBhIFNBRkVfTU9ESUZZX0xEVCgpIG1hY3JvIGluIG9yZGVyIHRvIHVzZSBzeXNjYWxsIGlzIGEg
CnNhZmUgd2F5LgoKPiArfQo+ICsKPiArI2VuZGlmIC8qIExBUElfTERUX0hfXyAqLwo+IGRpZmYg
LS1naXQgYS90ZXN0Y2FzZXMvY3ZlL2N2ZS0yMDE1LTMyOTAuYyBiL3Rlc3RjYXNlcy9jdmUvY3Zl
LTIwMTUtMzI5MC5jCj4gaW5kZXggNjNlNWQ5MmM5MWI4MzBjZDgwNjZhNmE2YzMyOTQ2MWI3Mjcz
MWYzMi4uY2U5MGM5MDk0MmU1NzgwZDhmODZhZGM1YmQxODcxOGE5NmMxYTk1ZSAxMDA2NDQKPiAt
LS0gYS90ZXN0Y2FzZXMvY3ZlL2N2ZS0yMDE1LTMyOTAuYwo+ICsrKyBiL3Rlc3RjYXNlcy9jdmUv
Y3ZlLTIwMTUtMzI5MC5jCj4gQEAgLTExOCwxMiArMTE4LDEwIEBAIHBlcmhhcHMgdW5zdXJwcmlz
aW5nbHkuKQo+ICAgI2luY2x1ZGUgInRzdF90ZXN0LmgiCj4gICAjaW5jbHVkZSAidHN0X3RpbWVy
LmgiCj4gICAKPiAtI2lmIGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfX2kzODZfXykK
PiAtCj4gKyNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18pCj4gICAj
aW5jbHVkZSA8c3RkbGliLmg+Cj4gICAjaW5jbHVkZSA8c3RkaW8uaD4KPiAgICNpbmNsdWRlIDxp
bnR0eXBlcy5oPgo+IC0jaW5jbHVkZSA8YXNtL2xkdC5oPgo+ICAgI2luY2x1ZGUgPHVuaXN0ZC5o
Pgo+ICAgI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+Cj4gICAjaW5jbHVkZSA8c2V0am1wLmg+Cj4g
QEAgLTEzMiw2ICsxMzAsNyBAQCBwZXJoYXBzIHVuc3VycHJpc2luZ2x5LikKPiAgICNpbmNsdWRl
IDxzeXMvd2FpdC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3BlcmZfZXZlbnQuaD4KPiAgIAo+ICsj
aW5jbHVkZSAibGFwaS9sZHQuaCIKPiAgICNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gICAj
aW5jbHVkZSAidHN0X3NhZmVfcHRocmVhZC5oIgo+ICAgCj4gQEAgLTE5OSw3ICsxOTgsNyBAQCBz
dGF0aWMgdm9pZCBzZXRfbGR0KHZvaWQpCj4gICAJCS51c2VhYmxlCSA9IDAKPiAgIAl9Owo+ICAg
Cj4gLQlURVNUKHRzdF9zeXNjYWxsKF9fTlJfbW9kaWZ5X2xkdCwgMSwgJmRhdGFfZGVzYywgc2l6
ZW9mKGRhdGFfZGVzYykpKTsKPiArCVRFU1QobW9kaWZ5X2xkdCgxLCAmZGF0YV9kZXNjLCBzaXpl
b2YoZGF0YV9kZXNjKSkpOwpUaGlzIHRlc3QgY2FuIHVzZSBTQUZFX01PRElGX0xEVAo+ICAgCj4g
ICAJLyoKPiAgIAkgKiBUaGUga2VybmVsIGludGVudGlvbmFsbHkgY2FzdHMgbW9kaWZ5X2xkdCgp
IHJldHVybiB2YWx1ZQo+IEBAIC01MjgsOCArNTI3LDYgQEAgc3RhdGljIHN0cnVjdCB0c3RfdGVz
dCB0ZXN0ID0gewo+ICAgCX0KPiAgIH07Cj4gICAKPiAtI2Vsc2UgLyogZGVmaW5lZChfX3g4Nl82
NF9fKSB8fCBkZWZpbmVkKF9faTM4Nl9fKSAqLwo+IC0KPiAtVFNUX1RFU1RfVENPTkYoIm5vdCAo
aTM4NiBvciB4ODZfNjQpIik7Cj4gLQo+IC0jZW5kaWYKPiArI2Vsc2UKPiArVFNUX1RFU1RfVENP
TkYoIlRlc3Qgc3VwcG9ydGVkIG9ubHkgb24geDg2Iik7Cj4gKyNlbmRpZiAvKiBkZWZpbmVkKF9f
aTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18pICovCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNl
cy9jdmUvY3ZlLTIwMTctMTcwNTMuYyBiL3Rlc3RjYXNlcy9jdmUvY3ZlLTIwMTctMTcwNTMuYwo+
IGluZGV4IGZlN2I2ZDY5NGQ2ZmZiYmNlODYzYWJjMTY3MmUwM2FlNWY0MTlkZjEuLjEyNTg1NDhk
ZThmNjgwM2YzNDdhYTZkMTlkY2JhZWFjYWZmZWMzMGQgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2Vz
L2N2ZS9jdmUtMjAxNy0xNzA1My5jCj4gKysrIGIvdGVzdGNhc2VzL2N2ZS9jdmUtMjAxNy0xNzA1
My5jCj4gQEAgLTE2LDggKzE2LDcgQEAKPiAgICNpbmNsdWRlICJjb25maWcuaCIKPiAgICNpbmNs
dWRlICJ0c3RfdGVzdC5oIgo+ICAgCj4gLSNpZmRlZiBIQVZFX0FTTV9MRFRfSAo+IC0jaW5jbHVk
ZSA8YXNtL2xkdC5oPgo+ICsjaWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82
NF9fKQo+ICAgI2luY2x1ZGUgPHB0aHJlYWQuaD4KPiAgICNpbmNsdWRlIDxzaWduYWwuaD4KPiAg
ICNpbmNsdWRlIDxzdGRsaWIuaD4KPiBAQCAtMjYsNiArMjUsNyBAQAo+ICAgI2luY2x1ZGUgPHVu
aXN0ZC5oPgo+ICAgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gICAKPiArI2luY2x1ZGUgImxhcGkvbGR0
LmgiCj4gICAjaW5jbHVkZSAibGFwaS9zeXNjYWxscy5oIgo+ICAgCj4gICAjZGVmaW5lIEVYRUNf
VVNFQyAgIDUwMDAwMDAKPiBAQCAtMTA5LDcgKzEwOSw3IEBAIHZvaWQgcnVuX3Rlc3Qodm9pZCkK
PiAgIAlzdHJ1Y3QgdXNlcl9kZXNjIGRlc2MgPSB7IC5lbnRyeV9udW1iZXIgPSA4MTkxIH07Cj4g
ICAKPiAgIAlpbnN0YWxsX3NpZ2hhbmRsZXIoKTsKPiAtCXN5c2NhbGwoX19OUl9tb2RpZnlfbGR0
LCAxLCAmZGVzYywgc2l6ZW9mKGRlc2MpKTsKPiArCW1vZGlmeV9sZHQoMSwgJmRlc2MsIHNpemVv
ZihkZXNjKSk7ClRoaXMgdGVzdCBjYW4gdXNlIFNBRkVfTU9ESUZfTERUCj4gICAKPiAgIAlmb3Ig
KDs7KSB7Cj4gICAJCWlmIChzaG0tPmRvX2V4aXQpCj4gQEAgLTE2NCw1ICsxNjQsNSBAQCBzdGF0
aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Cj4gICB9Owo+ICAgCj4gICAjZWxzZQo+IC1UU1Rf
VEVTVF9UQ09ORigibm8gYXNtL2xkdC5oIGhlYWRlciAob25seSBmb3IgaTM4NiBvciB4ODZfNjQp
Iik7Cj4gLSNlbmRpZgo+ICtUU1RfVEVTVF9UQ09ORigiVGVzdCBzdXBwb3J0ZWQgb25seSBvbiB4
ODYiKTsKPiArI2VuZGlmIC8qIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRf
XykgKi8KPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mb3JrL2Zvcmsw
NS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mb3JrL2ZvcmswNS5jCj4gaW5kZXggMjJl
ZGVmYzM2ODY5NzhmYmI5NDUzZGZmYWJmY2JjY2I3ZWE2YmIxMi4uMTIyM2FhZmY3ZDM4MTUyZDUx
MTZiOTAxMWEzNGZmNGM3NjJjYzk4NyAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL2ZvcmsvZm9yazA1LmMKPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zv
cmsvZm9yazA1LmMKPiBAQCAtNTUsOCArNTUsOCBAQAo+ICAgCj4gICAjaWYgZGVmaW5lZChfX2kz
ODZfXykKPiAgIAo+ICsjaW5jbHVkZSAibGFwaS9sZHQuaCIKPiAgICNpbmNsdWRlICJsYXBpL3N5
c2NhbGxzLmgiCj4gLSNpbmNsdWRlIDxhc20vbGR0Lmg+Cj4gICAKPiAgIHN0YXRpYyB2b2lkIHJ1
bih2b2lkKQo+ICAgewo+IEBAIC03Niw3ICs3Niw3IEBAIHN0YXRpYyB2b2lkIHJ1bih2b2lkKQo+
ICAgCWxkdDAuc2VnX25vdF9wcmVzZW50ID0gMDsKPiAgIAlsZHQwLnVzZWFibGUgPSAxOwo+ICAg
Cj4gLQl0c3Rfc3lzY2FsbChfX05SX21vZGlmeV9sZHQsIDEsICZsZHQwLCBzaXplb2YobGR0MCkp
Owo+ICsJbW9kaWZ5X2xkdCgxLCAmbGR0MCwgc2l6ZW9mKGxkdDApKTsKPiAgIApUaGlzIHRlc3Qg
Y2FuIHVzZSBTQUZFX01PRElGX0xEVAo+ICAgCWFzbSB2b2xhdGlsZSAoIm1vdncgJXcwLCAlJWZz
Ijo6InEiICg3KSk7Cj4gICAJYXNtIHZvbGF0aWxlICgibW92bCAlJWZzOjAsICUwIjoiPXIiIChs
bykpOwo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3NldF90aHJlYWRf
YXJlYS9zZXRfdGhyZWFkX2FyZWEuaCBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc2V0X3Ro
cmVhZF9hcmVhL3NldF90aHJlYWRfYXJlYS5oCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMmJkMjQ2OWQ1NDllY2Y4YzVjNTg5YTBhOTQ4NWY4ODZkMDQzZjdlZC4uMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvc2V0X3RocmVhZF9hcmVhL3NldF90aHJlYWRfYXJlYS5oCj4gKysrIC9kZXYvbnVs
bAo+IEBAIC0xLDMxICswLDAgQEAKPiAtI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gLSNpbmNsdWRlIDxl
cnJuby5oPgo+IC0KPiAtLyogSGFybmVzcyBTcGVjaWZpYyBJbmNsdWRlIEZpbGVzLiAqLwo+IC0j
aW5jbHVkZSAidGVzdC5oIgo+IC0jaW5jbHVkZSAibGFwaS9zeXNjYWxscy5oIgo+IC0jaW5jbHVk
ZSAiY29uZmlnLmgiCj4gLQo+IC0jaWYgZGVmaW5lZCBIQVZFX0FTTV9MRFRfSAo+IC0jaW5jbHVk
ZSA8bGludXgvdW5pc3RkLmg+Cj4gLSNpbmNsdWRlIDxhc20vbGR0Lmg+Cj4gLQo+IC0jaWYgZGVm
aW5lZCBIQVZFX1NUUlVDVF9VU0VSX0RFU0MKPiAtdHlwZWRlZiBzdHJ1Y3QgdXNlcl9kZXNjIHRo
cmVhZF9hcmVhX3M7Cj4gLSNlbGlmIGRlZmluZWQgSEFWRV9TVFJVQ1RfTU9ESUZZX0xEVF9MRFRf
Uwo+IC10eXBlZGVmIHN0cnVjdCBtb2RpZnlfbGR0X2xkdF9zIHRocmVhZF9hcmVhX3M7Cj4gLSNl
bHNlCj4gLXR5cGVkZWYgc3RydWN0IHVzZXJfZGVzYyB7Cj4gLQl1bnNpZ25lZCBpbnQgZW50cnlf
bnVtYmVyOwo+IC0JdW5zaWduZWQgbG9uZyBpbnQgYmFzZV9hZGRyOwo+IC0JdW5zaWduZWQgaW50
IGxpbWl0Owo+IC0JdW5zaWduZWQgaW50IHNlZ18zMmJpdDoxOwo+IC0JdW5zaWduZWQgaW50IGNv
bnRlbnRzOjI7Cj4gLQl1bnNpZ25lZCBpbnQgcmVhZF9leGVjX29ubHk6MTsKPiAtCXVuc2lnbmVk
IGludCBsaW1pdF9pbl9wYWdlczoxOwo+IC0JdW5zaWduZWQgaW50IHNlZ19ub3RfcHJlc2VudDox
Owo+IC0JdW5zaWduZWQgaW50IHVzZWFibGU6MTsKPiAtCXVuc2lnbmVkIGludCBlbXB0eToyNTsK
PiAtfSB0aHJlYWRfYXJlYV9zOwo+IC0jZW5kaWYgLyogSEFWRV9TVFJVQ1RfVVNFUl9ERVNDICov
Cj4gLSNlbmRpZiAvKiBIQVZFX0FTTV9MRFRfSCAqLwo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3NldF90aHJlYWRfYXJlYS9zZXRfdGhyZWFkX2FyZWEwMS5jIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zZXRfdGhyZWFkX2FyZWEvc2V0X3RocmVhZF9hcmVhMDEu
Ywo+IGluZGV4IDMwNjI2ZDVlOTBlYmY4ZTIwNjI0YzM3MGNjNDQ3NGNiNTFhNmIxMDIuLjZjNmZk
NTIyY2IxNTNhY2MzNjkzNzE4MDk3YTBjMzNhNjU2YWQ3NDcgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9zZXRfdGhyZWFkX2FyZWEvc2V0X3RocmVhZF9hcmVhMDEuYwo+
ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc2V0X3RocmVhZF9hcmVhL3NldF90aHJl
YWRfYXJlYTAxLmMKPiBAQCAtMTksMTMgKzE5LDE2IEBACj4gICAgKgo+ICAgICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKi8KPiAgIAo+IC0jaW5jbHVkZSAic2V0X3RocmVhZF9hcmVhLmgiCj4gKyNpbmNsdWRlICJj
b25maWcuaCIKPiArI2luY2x1ZGUgInRlc3QuaCIKPiArCj4gKyNpZiBkZWZpbmVkKF9faTM4Nl9f
KSB8fCBkZWZpbmVkKF9feDg2XzY0X18pCj4gKyNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4g
KyNpbmNsdWRlICJsYXBpL2xkdC5oIgo+ICAgCj4gICBjaGFyICpUQ0lEID0gInNldF90aHJlYWRf
YXJlYV8wMSI7Cj4gICBpbnQgVFNUX1RPVEFMID0gNjsKPiAgIAo+IC0jaWYgZGVmaW5lZChIQVZF
X0FTTV9MRFRfSCkgJiYgZGVmaW5lZChIQVZFX1NUUlVDVF9VU0VSX0RFU0MpCj4gLQo+ICAgc3Rh
dGljIHZvaWQgY2xlYW51cCh2b2lkKQo+ICAgewo+ICAgfQo+IEBAIC0zOCw3ICs0MSw3IEBAIHN0
YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gICBzdHJ1Y3QgdGVzdCB7Cj4gICAJaW50IHN5c2NhbGw7
Cj4gICAJY29uc3QgY2hhciAqY29uc3Qgc3lzY2FsbF9uYW1lOwo+IC0JdGhyZWFkX2FyZWFfcyAq
dV9pbmZvOwo+ICsJc3RydWN0IHVzZXJfZGVzYyAqdV9pbmZvOwpJbiBnZW5lcmFsIHdlIGRvbid0
IGJvdGggdG9vIG11Y2ggd2l0aCBvbGQgdGVzdHMsIHVubGVzcyB0aGVyZSdzIGEgYmlnIAppc3N1
ZS4gSSB3b3VsZG4ndCB0byB0b3VjaCBpdCBhdCB0aGUgbW9tZW50LCB1bmxlc3Mgd2Ugd2FudCB0
byByZWZhY3RvciBpdC4KPiAgIAlpbnQgZXhwX3JldDsKPiAgIAlpbnQgZXhwX2Vycm5vOwo+ICAg
fTsKPiBAQCAtMTA1LDcgKzEwOCw2IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10p
Cj4gICAjZWxzZQo+ICAgaW50IG1haW4odm9pZCkKPiAgIHsKPiAtCXRzdF9icmttKFRDT05GLCBO
VUxMLAo+IC0JCSAic2V0X3RocmVhZF9hcmVhIGlzbid0IGF2YWlsYWJsZSBmb3IgdGhpcyBhcmNo
aXRlY3R1cmUiKTsKPiArCXRzdF9icmttKFRDT05GLCBOVUxMLCAiVGVzdCBzdXBwb3J0ZWQgb25s
eSBpbiB4ODYiKTsKPiAgIH0KPiAgICNlbmRpZgoKS2luZCByZWdhcmRzLApBbmRyZWEgQ2VydmVz
YXRvCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
