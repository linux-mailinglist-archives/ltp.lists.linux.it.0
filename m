Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B01E84E4FC
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Feb 2024 17:25:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1707409526; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=twVBowl8+vyDqSU3vubAjLD7RrDbRmZTFKCZTvdmkGU=;
 b=CTdjWk1+vwmL0L6wzJlSTa6II2lHjuyNyusVwIMwKEtT/E0tM3PBS1Sp8YHPLNmWN9MqO
 hiY8PSlxjzjzauLPQWP9/7MgaVzhRwVqIKlV0AA1ZWy+S6PHP1gaOVaRiXHHufpiBK2lkhn
 xmDtZpQey1FUktrwssbclmYzXS5wayE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55EB73CF54A
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Feb 2024 17:25:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D9183CAB54
 for <ltp@lists.linux.it>; Thu,  8 Feb 2024 17:25:18 +0100 (CET)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 371B01A0237D
 for <ltp@lists.linux.it>; Thu,  8 Feb 2024 17:25:17 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5116643c64eso3723277e87.3
 for <ltp@lists.linux.it>; Thu, 08 Feb 2024 08:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1707409515; x=1708014315; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xaVdKq0xVuOugHVavjeaoZy1ftAgLbGMHHH7LHTYj6Y=;
 b=a7yaSZctr3zuqe92llNIP29qJ95+gCQ8ESUmEfhWd1nvJ23fW2vkY9mK3vZlCzW5oe
 yvL6RaaWC0X209TWT9PTQiZ3lERjoT0YSxsTKe3yGdZ+MoZ86tyW1bVarAyobMMUWdrS
 tCx3StUxR+XHaAA2MLa+IiW28fTOR7crB4A3uOamF5QqIn9ZhaLsEN1Ix5vCfhK4d1B7
 fQE34G2tXc6ARVAGMCHdNi2aAhPnvgTwjBNNeUK/jtgShRrIox+9ZOYsxbyiqKK+M7qh
 RFSKQ9soh936QdJmrKVHb5zXMgrH90Lw/QN6BcUCp7dXo1pOiOFjmnDP09VxUuQWqpLx
 +YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707409515; x=1708014315;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xaVdKq0xVuOugHVavjeaoZy1ftAgLbGMHHH7LHTYj6Y=;
 b=K/9nBgjQRd01TUicgVliLR98dgKjQ4TUKRcuTXB2N6heBBFpldshVf6whmf/XZqXrc
 ctU8lOO8dyC1QWiWf9q92YH+BPC55QSFrkY1WNLGhTWXyvTfQTjesKSk74BF9FdHxgQd
 zQjT5FLkeiF/M692p1xEt6E8Wt0iBMKdBS3C3QGOQ5tSV1+tBinKbFvEIPF5+AbqliAB
 MIJZjzicN9K/9qho+M/vttKjeDYUlPCqE0EgO2lyOAxAlCkjuPHHLw07BLfSlu3wJLWk
 XydmwkDbtGzF17r515Dz7j28o0sWnTnAkYL+dAVICTV/szvT6dxe//SpAWjiEhr8538A
 BC9g==
X-Gm-Message-State: AOJu0Yyhc4tpGXO6rp7R7sSoeOVq5VYPjaojP08qfo//rebG1rQWLPiY
 nqy+/2q3Ct8xzyF2tPFE6Sr1TyUfKSKKcZrRePNc1+gkosTRicOfynz7Rs/ejZod5WOVgNCXAHa
 +5Rw=
X-Google-Smtp-Source: AGHT+IFuYPmibZNgcDRqRFl7e9nA7yJb33l9TPjPVQ/KT7zyu1NcQYMcyM1j2b7L/rk8UE1GfWK74g==
X-Received: by 2002:a05:6512:3707:b0:511:4ba1:b77b with SMTP id
 z7-20020a056512370700b005114ba1b77bmr6164633lfr.27.1707409515390; 
 Thu, 08 Feb 2024 08:25:15 -0800 (PST)
Received: from [10.232.133.56] ([88.128.88.176])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c468900b0040fdd8f5e18sm2081011wmo.34.2024.02.08.08.25.14
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 08:25:15 -0800 (PST)
Message-ID: <2464cf2e-0f67-4c31-be9b-4b11aee3534e@suse.com>
Date: Thu, 8 Feb 2024 17:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ltp@lists.linux.it
References: <20230925112245.30701-1-wegao@suse.com>
 <20231201005902.15630-1-wegao@suse.com>
 <20231201005902.15630-3-wegao@suse.com>
In-Reply-To: <20231201005902.15630-3-wegao@suse.com>
X-Spam-Status: No, score=0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 2/2] ptrace06: Refactor the test using new LTP
 API
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

SGkhCgpPbiAxMi8xLzIzIDAxOjU5LCBXZWkgR2FvIHZpYSBsdHAgd3JvdGU6Cj4gU2lnbmVkLW9m
Zi1ieTogV2VpIEdhbyA8d2VnYW9Ac3VzZS5jb20+Cj4gLS0tCj4gdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9wdHJhY2UvcHRyYWNlMDYuY8KgwqAgfCAzMjYgKysrKysrKysrKy0tLS0tLS0tCj4g
Li4uL2tlcm5lbC9zeXNjYWxscy9wdHJhY2UvcHRyYWNlMDZfY2hpbGQuY8KgwqAgfMKgIDE2ICsK
PiAyIGZpbGVzIGNoYW5nZWQsIDIwMiBpbnNlcnRpb25zKCspLCAxNDAgZGVsZXRpb25zKC0pCj4g
Y3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHRyYWNlL3B0cmFj
ZTA2X2NoaWxkLmMKPgo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3B0
cmFjZS9wdHJhY2UwNi5jIAo+IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wdHJhY2UvcHRy
YWNlMDYuYwo+IGluZGV4IGExZGIzYmFiOC4uMjI1ZDlkNDY2IDEwMDY0NAo+IC0tLSBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvcHRyYWNlL3B0cmFjZTA2LmMKPiArKysgYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3B0cmFjZS9wdHJhY2UwNi5jCj4gQEAgLTEsMjkgKzEsMjggQEAKPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPiAvKgo+ICsgKiBD
b3B5cmlnaHQgKGMpIDIwMDggQW5hbG9nIERldmljZXMgSW5jLgo+ICsgKiBDb3B5cmlnaHQgKGMp
IExpbnV4IFRlc3QgUHJvamVjdCwgMjAwOS0yMDIyCj4gKyAqIENvcHlyaWdodCAoYykgMjAyMyBX
ZWkgR2FvIDx3ZWdhb0BzdXNlLmNvbT4KPiArICovCj4gKwo+ICsvKlwKPiArICogW0Rlc2NyaXB0
aW9uXQo+ICsgKgo+IMKgKiBjaGVjayBvdXQtb2YtYm91bmQvdW5hbGlnbmVkIGFkZHJlc3NlcyBn
aXZlbiB0bwo+ICsgKgo+IMKgKsKgIC0ge1BFRUssUE9LRX17REFUQSxURVhULFVTRVJ9Cj4gwqAq
wqAgLSB7R0VULFNFVH17LEZHfVJFR1MKPiDCoCrCoCAtIHtHRVQsU0VUfVNJR0lORk8KPiAtICoK
PiAtICogQ29weXJpZ2h0IChjKSAyMDA4IEFuYWxvZyBEZXZpY2VzIEluYy4KPiAtICoKPiAtICog
TGljZW5zZWQgdW5kZXIgdGhlIEdQTC0yIG9yIGxhdGVyCj4gwqAqLwo+Cj4gLSNkZWZpbmUgX0dO
VV9TT1VSQ0UKPiAtCj4gLSNpbmNsdWRlIDxlcnJuby5oPgo+IC0jaW5jbHVkZSA8c3RkYm9vbC5o
Pgo+IC0jaW5jbHVkZSA8c3RkaW8uaD4KPiAjaW5jbHVkZSA8c3RkbGliLmg+Cj4gLSNpbmNsdWRl
IDx1bmlzdGQuaD4KPiAjaW5jbHVkZSA8c3lzL3B0cmFjZS5oPgo+IC0KPiAtI2luY2x1ZGUgInRl
c3QuaCIKPiAtI2luY2x1ZGUgInNwYXduX3B0cmFjZV9jaGlsZC5oIgo+ICsjaW5jbHVkZSAidHN0
X3Rlc3QuaCIKPgo+IC8qIHRoaXMgc2hvdWxkIGJlIHNpemVvZihzdHJ1Y3QgdXNlciksIGJ1dCB0
aGF0IGluZm8gaXMgb25seSBmb3VuZAo+IMKgKiBpbiB0aGUga2VybmVsIGFzbS91c2VyLmggd2hp
Y2ggaXMgbm90IGV4cG9ydGVkIHRvIHVzZXJzcGFjZS4KPiDCoCovCj4gKwo+ICNpZiBkZWZpbmVk
KF9faTM4Nl9fKQo+ICNkZWZpbmUgU0laRU9GX1VTRVIgMjg0Cj4gI2VsaWYgZGVmaW5lZChfX3g4
Nl82NF9fKQo+IEBAIC0zMiwxNjggKzMxLDIxNSBAQAo+ICNkZWZpbmUgU0laRU9GX1VTRVIgMHgx
MDAwwqDCoMKgIC8qIGp1c3QgcGljayBhIGJpZyBudW1iZXIgKi8KPiAjZW5kaWYKPgo+IC1jaGFy
ICpUQ0lEID0gInB0cmFjZTA2IjsKPiAtCj4gLXN0cnVjdCB0ZXN0X2Nhc2VfdCB7Cj4gK3N0YXRp
YyBzdHJ1Y3QgdGVzdF9jYXNlX3Qgewo+IMKgwqDCoMKgaW50IHJlcXVlc3Q7Cj4gwqDCoMKgwqBs
b25nIGFkZHI7Cj4gwqDCoMKgwqBsb25nIGRhdGE7Cj4gfSB0ZXN0X2Nhc2VzW10gPSB7Cj4gLcKg
wqDCoCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUEVFS0RBVEEsLmFkZHIgPSAwfSwgewo+IC3CoMKgwqAg
UFRSQUNFX1BFRUtEQVRBLC5hZGRyID0gMX0sIHsKPiAtwqDCoMKgIFBUUkFDRV9QRUVLREFUQSwu
YWRkciA9IDJ9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUEVFS0RBVEEsLmFkZHIgPSAzfSwgewo+IC3C
oMKgwqAgUFRSQUNFX1BFRUtEQVRBLC5hZGRyID0gLTF9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUEVF
S0RBVEEsLmFkZHIgPSAtMn0sIHsKPiAtwqDCoMKgIFBUUkFDRV9QRUVLREFUQSwuYWRkciA9IC0z
fSwgewo+IC3CoMKgwqAgUFRSQUNFX1BFRUtEQVRBLC5hZGRyID0gLTR9LCB7Cj4gLcKgwqDCoCBQ
VFJBQ0VfUEVFS1RFWFQsLmFkZHIgPSAwfSwgewo+IC3CoMKgwqAgUFRSQUNFX1BFRUtURVhULC5h
ZGRyID0gMX0sIHsKPiAtwqDCoMKgIFBUUkFDRV9QRUVLVEVYVCwuYWRkciA9IDJ9LCB7Cj4gLcKg
wqDCoCBQVFJBQ0VfUEVFS1RFWFQsLmFkZHIgPSAzfSwgewo+IC3CoMKgwqAgUFRSQUNFX1BFRUtU
RVhULC5hZGRyID0gLTF9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUEVFS1RFWFQsLmFkZHIgPSAtMn0s
IHsKPiAtwqDCoMKgIFBUUkFDRV9QRUVLVEVYVCwuYWRkciA9IC0zfSwgewo+IC3CoMKgwqAgUFRS
QUNFX1BFRUtURVhULC5hZGRyID0gLTR9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUEVFS1VTRVIsLmFk
ZHIgPSBTSVpFT0ZfVVNFUiArIDF9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUEVFS1VTRVIsLmFkZHIg
PSBTSVpFT0ZfVVNFUiArIDJ9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUEVFS1VTRVIsLmFkZHIgPSBT
SVpFT0ZfVVNFUiArIDN9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUEVFS1VTRVIsLmFkZHIgPSBTSVpF
T0ZfVVNFUiArIDR9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUEVFS1VTRVIsLmFkZHIgPSAtMX0sIHsK
PiAtwqDCoMKgIFBUUkFDRV9QRUVLVVNFUiwuYWRkciA9IC0yfSwgewo+IC3CoMKgwqAgUFRSQUNF
X1BFRUtVU0VSLC5hZGRyID0gLTN9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUEVFS1VTRVIsLmFkZHIg
PSAtNH0sIHsKPiAtwqDCoMKgIFBUUkFDRV9QT0tFREFUQSwuYWRkciA9IDB9LCB7Cj4gLcKgwqDC
oCBQVFJBQ0VfUE9LRURBVEEsLmFkZHIgPSAxfSwgewo+IC3CoMKgwqAgUFRSQUNFX1BPS0VEQVRB
LC5hZGRyID0gMn0sIHsKPiAtwqDCoMKgIFBUUkFDRV9QT0tFREFUQSwuYWRkciA9IDN9LCB7Cj4g
LcKgwqDCoCBQVFJBQ0VfUE9LRURBVEEsLmFkZHIgPSAtMX0sIHsKPiAtwqDCoMKgIFBUUkFDRV9Q
T0tFREFUQSwuYWRkciA9IC0yfSwgewo+IC3CoMKgwqAgUFRSQUNFX1BPS0VEQVRBLC5hZGRyID0g
LTN9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUE9LRURBVEEsLmFkZHIgPSAtNH0sIHsKPiAtwqDCoMKg
IFBUUkFDRV9QT0tFVEVYVCwuYWRkciA9IDB9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUE9LRVRFWFQs
LmFkZHIgPSAxfSwgewo+IC3CoMKgwqAgUFRSQUNFX1BPS0VURVhULC5hZGRyID0gMn0sIHsKPiAt
wqDCoMKgIFBUUkFDRV9QT0tFVEVYVCwuYWRkciA9IDN9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfUE9L
RVRFWFQsLmFkZHIgPSAtMX0sIHsKPiAtwqDCoMKgIFBUUkFDRV9QT0tFVEVYVCwuYWRkciA9IC0y
fSwgewo+IC3CoMKgwqAgUFRSQUNFX1BPS0VURVhULC5hZGRyID0gLTN9LCB7Cj4gLcKgwqDCoCBQ
VFJBQ0VfUE9LRVRFWFQsLmFkZHIgPSAtNH0sIHsKPiAtwqDCoMKgIFBUUkFDRV9QT0tFVVNFUiwu
YWRkciA9IFNJWkVPRl9VU0VSICsgMX0sIHsKPiAtwqDCoMKgIFBUUkFDRV9QT0tFVVNFUiwuYWRk
ciA9IFNJWkVPRl9VU0VSICsgMn0sIHsKPiAtwqDCoMKgIFBUUkFDRV9QT0tFVVNFUiwuYWRkciA9
IFNJWkVPRl9VU0VSICsgM30sIHsKPiAtwqDCoMKgIFBUUkFDRV9QT0tFVVNFUiwuYWRkciA9IFNJ
WkVPRl9VU0VSICsgNH0sIHsKPiAtwqDCoMKgIFBUUkFDRV9QT0tFVVNFUiwuYWRkciA9IC0xfSwg
ewo+IC3CoMKgwqAgUFRSQUNFX1BPS0VVU0VSLC5hZGRyID0gLTJ9LCB7Cj4gLcKgwqDCoCBQVFJB
Q0VfUE9LRVVTRVIsLmFkZHIgPSAtM30sIHsKPiAtwqDCoMKgIFBUUkFDRV9QT0tFVVNFUiwuYWRk
ciA9IC00fSwKPiArwqDCoMKgIHtQVFJBQ0VfUEVFS0RBVEEsIC5hZGRyID0gMH0sCj4gK8KgwqDC
oCB7UFRSQUNFX1BFRUtEQVRBLCAuYWRkciA9IDF9LAo+ICvCoMKgwqAge1BUUkFDRV9QRUVLREFU
QSwgLmFkZHIgPSAyfSwKPiArwqDCoMKgIHtQVFJBQ0VfUEVFS0RBVEEsIC5hZGRyID0gM30sCj4g
K8KgwqDCoCB7UFRSQUNFX1BFRUtEQVRBLCAuYWRkciA9IC0xfSwKPiArwqDCoMKgIHtQVFJBQ0Vf
UEVFS0RBVEEsIC5hZGRyID0gLTJ9LAo+ICvCoMKgwqAge1BUUkFDRV9QRUVLREFUQSwgLmFkZHIg
PSAtM30sCj4gK8KgwqDCoCB7UFRSQUNFX1BFRUtEQVRBLCAuYWRkciA9IC00fSwKPiArwqDCoMKg
IHtQVFJBQ0VfUEVFS1RFWFQsIC5hZGRyID0gMH0sCj4gK8KgwqDCoCB7UFRSQUNFX1BFRUtURVhU
LCAuYWRkciA9IDF9LAo+ICvCoMKgwqAge1BUUkFDRV9QRUVLVEVYVCwgLmFkZHIgPSAyfSwKPiAr
wqDCoMKgIHtQVFJBQ0VfUEVFS1RFWFQsIC5hZGRyID0gM30sCj4gK8KgwqDCoCB7UFRSQUNFX1BF
RUtURVhULCAuYWRkciA9IC0xfSwKPiArwqDCoMKgIHtQVFJBQ0VfUEVFS1RFWFQsIC5hZGRyID0g
LTJ9LAo+ICvCoMKgwqAge1BUUkFDRV9QRUVLVEVYVCwgLmFkZHIgPSAtM30sCj4gK8KgwqDCoCB7
UFRSQUNFX1BFRUtURVhULCAuYWRkciA9IC00fSwKPiArwqDCoMKgIHtQVFJBQ0VfUEVFS1VTRVIs
IC5hZGRyID0gU0laRU9GX1VTRVIgKyAxfSwKPiArwqDCoMKgIHtQVFJBQ0VfUEVFS1VTRVIsIC5h
ZGRyID0gU0laRU9GX1VTRVIgKyAyfSwKPiArwqDCoMKgIHtQVFJBQ0VfUEVFS1VTRVIsIC5hZGRy
ID0gU0laRU9GX1VTRVIgKyAzfSwKPiArwqDCoMKgIHtQVFJBQ0VfUEVFS1VTRVIsIC5hZGRyID0g
U0laRU9GX1VTRVIgKyA0fSwKPiArwqDCoMKgIHtQVFJBQ0VfUEVFS1VTRVIsIC5hZGRyID0gLTF9
LAo+ICvCoMKgwqAge1BUUkFDRV9QRUVLVVNFUiwgLmFkZHIgPSAtMn0sCj4gK8KgwqDCoCB7UFRS
QUNFX1BFRUtVU0VSLCAuYWRkciA9IC0zfSwKPiArwqDCoMKgIHtQVFJBQ0VfUEVFS1VTRVIsIC5h
ZGRyID0gLTR9LAo+ICvCoMKgwqAge1BUUkFDRV9QT0tFREFUQSwgLmFkZHIgPSAwfSwKPiArwqDC
oMKgIHtQVFJBQ0VfUE9LRURBVEEsIC5hZGRyID0gMX0sCj4gK8KgwqDCoCB7UFRSQUNFX1BPS0VE
QVRBLCAuYWRkciA9IDJ9LAo+ICvCoMKgwqAge1BUUkFDRV9QT0tFREFUQSwgLmFkZHIgPSAzfSwK
PiArwqDCoMKgIHtQVFJBQ0VfUE9LRURBVEEsIC5hZGRyID0gLTF9LAo+ICvCoMKgwqAge1BUUkFD
RV9QT0tFREFUQSwgLmFkZHIgPSAtMn0sCj4gK8KgwqDCoCB7UFRSQUNFX1BPS0VEQVRBLCAuYWRk
ciA9IC0zfSwKPiArwqDCoMKgIHtQVFJBQ0VfUE9LRURBVEEsIC5hZGRyID0gLTR9LAo+ICvCoMKg
wqAge1BUUkFDRV9QT0tFVEVYVCwgLmFkZHIgPSAwfSwKPiArwqDCoMKgIHtQVFJBQ0VfUE9LRVRF
WFQsIC5hZGRyID0gMX0sCj4gK8KgwqDCoCB7UFRSQUNFX1BPS0VURVhULCAuYWRkciA9IDJ9LAo+
ICvCoMKgwqAge1BUUkFDRV9QT0tFVEVYVCwgLmFkZHIgPSAzfSwKPiArwqDCoMKgIHtQVFJBQ0Vf
UE9LRVRFWFQsIC5hZGRyID0gLTF9LAo+ICvCoMKgwqAge1BUUkFDRV9QT0tFVEVYVCwgLmFkZHIg
PSAtMn0sCj4gK8KgwqDCoCB7UFRSQUNFX1BPS0VURVhULCAuYWRkciA9IC0zfSwKPiArwqDCoMKg
IHtQVFJBQ0VfUE9LRVRFWFQsIC5hZGRyID0gLTR9LAo+ICvCoMKgwqAge1BUUkFDRV9QT0tFVVNF
UiwgLmFkZHIgPSBTSVpFT0ZfVVNFUiArIDF9LAo+ICvCoMKgwqAge1BUUkFDRV9QT0tFVVNFUiwg
LmFkZHIgPSBTSVpFT0ZfVVNFUiArIDJ9LAo+ICvCoMKgwqAge1BUUkFDRV9QT0tFVVNFUiwgLmFk
ZHIgPSBTSVpFT0ZfVVNFUiArIDN9LAo+ICvCoMKgwqAge1BUUkFDRV9QT0tFVVNFUiwgLmFkZHIg
PSBTSVpFT0ZfVVNFUiArIDR9LAo+ICvCoMKgwqAge1BUUkFDRV9QT0tFVVNFUiwgLmFkZHIgPSAt
MX0sCj4gK8KgwqDCoCB7UFRSQUNFX1BPS0VVU0VSLCAuYWRkciA9IC0yfSwKPiArwqDCoMKgIHtQ
VFJBQ0VfUE9LRVVTRVIsIC5hZGRyID0gLTN9LAo+ICvCoMKgwqAge1BUUkFDRV9QT0tFVVNFUiwg
LmFkZHIgPSAtNH0sCj4gI2lmZGVmIFBUUkFDRV9HRVRSRUdTCj4gLcKgwqDCoCB7Cj4gLcKgwqDC
oCBQVFJBQ0VfR0VUUkVHUywuZGF0YSA9IDB9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfR0VUUkVHUywu
ZGF0YSA9IDF9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfR0VUUkVHUywuZGF0YSA9IDJ9LCB7Cj4gLcKg
wqDCoCBQVFJBQ0VfR0VUUkVHUywuZGF0YSA9IDN9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfR0VUUkVH
UywuZGF0YSA9IC0xfSwgewo+IC3CoMKgwqAgUFRSQUNFX0dFVFJFR1MsLmRhdGEgPSAtMn0sIHsK
PiAtwqDCoMKgIFBUUkFDRV9HRVRSRUdTLC5kYXRhID0gLTN9LCB7Cj4gLcKgwqDCoCBQVFJBQ0Vf
R0VUUkVHUywuZGF0YSA9IC00fSwKPiArwqDCoMKgIHtQVFJBQ0VfR0VUUkVHUywgLmRhdGEgPSAw
fSwKPiArwqDCoMKgIHtQVFJBQ0VfR0VUUkVHUywgLmRhdGEgPSAxfSwKPiArwqDCoMKgIHtQVFJB
Q0VfR0VUUkVHUywgLmRhdGEgPSAyfSwKPiArwqDCoMKgIHtQVFJBQ0VfR0VUUkVHUywgLmRhdGEg
PSAzfSwKPiArwqDCoMKgIHtQVFJBQ0VfR0VUUkVHUywgLmRhdGEgPSAtMX0sCj4gK8KgwqDCoCB7
UFRSQUNFX0dFVFJFR1MsIC5kYXRhID0gLTJ9LAo+ICvCoMKgwqAge1BUUkFDRV9HRVRSRUdTLCAu
ZGF0YSA9IC0zfSwKPiArwqDCoMKgIHtQVFJBQ0VfR0VUUkVHUywgLmRhdGEgPSAtNH0sCj4gI2Vu
ZGlmCj4gI2lmZGVmIFBUUkFDRV9HRVRGR1JFR1MKPiAtwqDCoMKgIHsKPiAtwqDCoMKgIFBUUkFD
RV9HRVRGR1JFR1MsLmRhdGEgPSAwfSwgewo+IC3CoMKgwqAgUFRSQUNFX0dFVEZHUkVHUywuZGF0
YSA9IDF9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfR0VURkdSRUdTLC5kYXRhID0gMn0sIHsKPiAtwqDC
oMKgIFBUUkFDRV9HRVRGR1JFR1MsLmRhdGEgPSAzfSwgewo+IC3CoMKgwqAgUFRSQUNFX0dFVEZH
UkVHUywuZGF0YSA9IC0xfSwgewo+IC3CoMKgwqAgUFRSQUNFX0dFVEZHUkVHUywuZGF0YSA9IC0y
fSwgewo+IC3CoMKgwqAgUFRSQUNFX0dFVEZHUkVHUywuZGF0YSA9IC0zfSwgewo+IC3CoMKgwqAg
UFRSQUNFX0dFVEZHUkVHUywuZGF0YSA9IC00fSwKPiArwqDCoMKgIHtQVFJBQ0VfR0VURkdSRUdT
LCAuZGF0YSA9IDB9LAo+ICvCoMKgwqAge1BUUkFDRV9HRVRGR1JFR1MsIC5kYXRhID0gMX0sCj4g
K8KgwqDCoCB7UFRSQUNFX0dFVEZHUkVHUywgLmRhdGEgPSAyfSwKPiArwqDCoMKgIHtQVFJBQ0Vf
R0VURkdSRUdTLCAuZGF0YSA9IDN9LAo+ICvCoMKgwqAge1BUUkFDRV9HRVRGR1JFR1MsIC5kYXRh
ID0gLTF9LAo+ICvCoMKgwqAge1BUUkFDRV9HRVRGR1JFR1MsIC5kYXRhID0gLTJ9LAo+ICvCoMKg
wqAge1BUUkFDRV9HRVRGR1JFR1MsIC5kYXRhID0gLTN9LAo+ICvCoMKgwqAge1BUUkFDRV9HRVRG
R1JFR1MsIC5kYXRhID0gLTR9LAo+ICNlbmRpZgo+ICNpZmRlZiBQVFJBQ0VfU0VUUkVHUwo+IC3C
oMKgwqAgewo+IC3CoMKgwqAgUFRSQUNFX1NFVFJFR1MsLmRhdGEgPSAwfSwgewo+IC3CoMKgwqAg
UFRSQUNFX1NFVFJFR1MsLmRhdGEgPSAxfSwgewo+IC3CoMKgwqAgUFRSQUNFX1NFVFJFR1MsLmRh
dGEgPSAyfSwgewo+IC3CoMKgwqAgUFRSQUNFX1NFVFJFR1MsLmRhdGEgPSAzfSwgewo+IC3CoMKg
wqAgUFRSQUNFX1NFVFJFR1MsLmRhdGEgPSAtMX0sIHsKPiAtwqDCoMKgIFBUUkFDRV9TRVRSRUdT
LC5kYXRhID0gLTJ9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfU0VUUkVHUywuZGF0YSA9IC0zfSwgewo+
IC3CoMKgwqAgUFRSQUNFX1NFVFJFR1MsLmRhdGEgPSAtNH0sCj4gK8KgwqDCoCB7UFRSQUNFX1NF
VFJFR1MsIC5kYXRhID0gMH0sCj4gK8KgwqDCoCB7UFRSQUNFX1NFVFJFR1MsIC5kYXRhID0gMX0s
Cj4gK8KgwqDCoCB7UFRSQUNFX1NFVFJFR1MsIC5kYXRhID0gMn0sCj4gK8KgwqDCoCB7UFRSQUNF
X1NFVFJFR1MsIC5kYXRhID0gM30sCj4gK8KgwqDCoCB7UFRSQUNFX1NFVFJFR1MsIC5kYXRhID0g
LTF9LAo+ICvCoMKgwqAge1BUUkFDRV9TRVRSRUdTLCAuZGF0YSA9IC0yfSwKPiArwqDCoMKgIHtQ
VFJBQ0VfU0VUUkVHUywgLmRhdGEgPSAtM30sCj4gK8KgwqDCoCB7UFRSQUNFX1NFVFJFR1MsIC5k
YXRhID0gLTR9LAo+ICNlbmRpZgo+ICNpZmRlZiBQVFJBQ0VfU0VURkdSRUdTCj4gLcKgwqDCoCB7
Cj4gLcKgwqDCoCBQVFJBQ0VfU0VURkdSRUdTLC5kYXRhID0gMH0sIHsKPiAtwqDCoMKgIFBUUkFD
RV9TRVRGR1JFR1MsLmRhdGEgPSAxfSwgewo+IC3CoMKgwqAgUFRSQUNFX1NFVEZHUkVHUywuZGF0
YSA9IDJ9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfU0VURkdSRUdTLC5kYXRhID0gM30sIHsKPiAtwqDC
oMKgIFBUUkFDRV9TRVRGR1JFR1MsLmRhdGEgPSAtMX0sIHsKPiAtwqDCoMKgIFBUUkFDRV9TRVRG
R1JFR1MsLmRhdGEgPSAtMn0sIHsKPiAtwqDCoMKgIFBUUkFDRV9TRVRGR1JFR1MsLmRhdGEgPSAt
M30sIHsKPiAtwqDCoMKgIFBUUkFDRV9TRVRGR1JFR1MsLmRhdGEgPSAtNH0sCj4gK8KgwqDCoCB7
UFRSQUNFX1NFVEZHUkVHUywgLmRhdGEgPSAwfSwKPiArwqDCoMKgIHtQVFJBQ0VfU0VURkdSRUdT
LCAuZGF0YSA9IDF9LAo+ICvCoMKgwqAge1BUUkFDRV9TRVRGR1JFR1MsIC5kYXRhID0gMn0sCj4g
K8KgwqDCoCB7UFRSQUNFX1NFVEZHUkVHUywgLmRhdGEgPSAzfSwKPiArwqDCoMKgIHtQVFJBQ0Vf
U0VURkdSRUdTLCAuZGF0YSA9IC0xfSwKPiArwqDCoMKgIHtQVFJBQ0VfU0VURkdSRUdTLCAuZGF0
YSA9IC0yfSwKPiArwqDCoMKgIHtQVFJBQ0VfU0VURkdSRUdTLCAuZGF0YSA9IC0zfSwKPiArwqDC
oMKgIHtQVFJBQ0VfU0VURkdSRUdTLCAuZGF0YSA9IC00fSwKPiAjZW5kaWYKPiAjaWYgSEFWRV9E
RUNMX1BUUkFDRV9HRVRTSUdJTkZPCj4gLcKgwqDCoCB7Cj4gLcKgwqDCoCBQVFJBQ0VfR0VUU0lH
SU5GTywuZGF0YSA9IDB9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfR0VUU0lHSU5GTywuZGF0YSA9IDF9
LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfR0VUU0lHSU5GTywuZGF0YSA9IDJ9LCB7Cj4gLcKgwqDCoCBQ
VFJBQ0VfR0VUU0lHSU5GTywuZGF0YSA9IDN9LCB7Cj4gLcKgwqDCoCBQVFJBQ0VfR0VUU0lHSU5G
TywuZGF0YSA9IC0xfSwgewo+IC3CoMKgwqAgUFRSQUNFX0dFVFNJR0lORk8sLmRhdGEgPSAtMn0s
IHsKPiAtwqDCoMKgIFBUUkFDRV9HRVRTSUdJTkZPLC5kYXRhID0gLTN9LCB7Cj4gLcKgwqDCoCBQ
VFJBQ0VfR0VUU0lHSU5GTywuZGF0YSA9IC00fSwKPiArwqDCoMKgIHtQVFJBQ0VfR0VUU0lHSU5G
TywgLmRhdGEgPSAwfSwKPiArwqDCoMKgIHtQVFJBQ0VfR0VUU0lHSU5GTywgLmRhdGEgPSAxfSwK
PiArwqDCoMKgIHtQVFJBQ0VfR0VUU0lHSU5GTywgLmRhdGEgPSAyfSwKPiArwqDCoMKgIHtQVFJB
Q0VfR0VUU0lHSU5GTywgLmRhdGEgPSAzfSwKPiArwqDCoMKgIHtQVFJBQ0VfR0VUU0lHSU5GTywg
LmRhdGEgPSAtMX0sCj4gK8KgwqDCoCB7UFRSQUNFX0dFVFNJR0lORk8sIC5kYXRhID0gLTJ9LAo+
ICvCoMKgwqAge1BUUkFDRV9HRVRTSUdJTkZPLCAuZGF0YSA9IC0zfSwKPiArwqDCoMKgIHtQVFJB
Q0VfR0VUU0lHSU5GTywgLmRhdGEgPSAtNH0sCj4gI2VuZGlmCj4gI2lmIEhBVkVfREVDTF9QVFJB
Q0VfU0VUU0lHSU5GTwo+IC3CoMKgwqAgewo+IC3CoMKgwqAgUFRSQUNFX1NFVFNJR0lORk8sLmRh
dGEgPSAwfSwgewo+IC3CoMKgwqAgUFRSQUNFX1NFVFNJR0lORk8sLmRhdGEgPSAxfSwgewo+IC3C
oMKgwqAgUFRSQUNFX1NFVFNJR0lORk8sLmRhdGEgPSAyfSwgewo+IC3CoMKgwqAgUFRSQUNFX1NF
VFNJR0lORk8sLmRhdGEgPSAzfSwgewo+IC3CoMKgwqAgUFRSQUNFX1NFVFNJR0lORk8sLmRhdGEg
PSAtMX0sIHsKPiAtwqDCoMKgIFBUUkFDRV9TRVRTSUdJTkZPLC5kYXRhID0gLTJ9LCB7Cj4gLcKg
wqDCoCBQVFJBQ0VfU0VUU0lHSU5GTywuZGF0YSA9IC0zfSwgewo+IC3CoMKgwqAgUFRSQUNFX1NF
VFNJR0lORk8sLmRhdGEgPSAtNH0sCj4gK8KgwqDCoCB7UFRSQUNFX1NFVFNJR0lORk8sIC5kYXRh
ID0gMH0sCj4gK8KgwqDCoCB7UFRSQUNFX1NFVFNJR0lORk8sIC5kYXRhID0gMX0sCj4gK8KgwqDC
oCB7UFRSQUNFX1NFVFNJR0lORk8sIC5kYXRhID0gMn0sCj4gK8KgwqDCoCB7UFRSQUNFX1NFVFNJ
R0lORk8sIC5kYXRhID0gM30sCj4gK8KgwqDCoCB7UFRSQUNFX1NFVFNJR0lORk8sIC5kYXRhID0g
LTF9LAo+ICvCoMKgwqAge1BUUkFDRV9TRVRTSUdJTkZPLCAuZGF0YSA9IC0yfSwKPiArwqDCoMKg
IHtQVFJBQ0VfU0VUU0lHSU5GTywgLmRhdGEgPSAtM30sCj4gK8KgwqDCoCB7UFRSQUNFX1NFVFNJ
R0lORk8sIC5kYXRhID0gLTR9LAo+ICNlbmRpZgo+IH07Cj4KPiAtaW50IFRTVF9UT1RBTCA9IEFS
UkFZX1NJWkUodGVzdF9jYXNlcyk7Cj4gKyNkZWZpbmUgU1BUKHgpIFtQVFJBQ0VfIyN4XSA9ICN4
LAo+ICtzdGF0aWMgY2hhciAqc3RyaW5nc1tdID0gewo+ICvCoMKgwqAgU1BUKFRSQUNFTUUpCj4g
K8KgwqDCoCBTUFQoUEVFS1RFWFQpCj4gK8KgwqDCoCBTUFQoUEVFS0RBVEEpCj4gK8KgwqDCoCBT
UFQoUEVFS1VTRVIpCj4gK8KgwqDCoCBTUFQoUE9LRVRFWFQpCj4gK8KgwqDCoCBTUFQoUE9LRURB
VEEpCj4gK8KgwqDCoCBTUFQoUE9LRVVTRVIpCj4gKyNpZmRlZiBQVFJBQ0VfR0VUUkVHUwo+ICvC
oMKgwqAgU1BUKEdFVFJFR1MpCj4gKyNlbmRpZgo+ICsjaWZkZWYgUFRSQUNFX1NFVFJFR1MKPiAr
wqDCoMKgIFNQVChTRVRSRUdTKQo+ICsjZW5kaWYKPiArI2lmZGVmIFBUUkFDRV9HRVRTSUdJTkZP
Cj4gK8KgwqDCoCBTUFQoR0VUU0lHSU5GTykKPiArI2VuZGlmCj4gKyNpZmRlZiBQVFJBQ0VfU0VU
U0lHSU5GTwo+ICvCoMKgwqAgU1BUKFNFVFNJR0lORk8pCj4gKyNlbmRpZgo+ICsjaWZkZWYgUFRS
QUNFX0dFVEZHUkVHUwo+ICvCoMKgwqAgU1BUKEdFVEZHUkVHUykKPiArI2VuZGlmCj4gKyNpZmRl
ZiBQVFJBQ0VfU0VURkdSRUdTCj4gK8KgwqDCoCBTUFQoU0VURkdSRUdTKQo+ICsjZW5kaWYKPiAr
wqDCoMKgIFNQVChLSUxMKQo+ICvCoMKgwqAgU1BUKFNJTkdMRVNURVApCj4gK307Cj4gKwo+ICtz
dGF0aWMgaW5saW5lIGNoYXIgKnN0cnB0cmFjZShpbnQgcmVxdWVzdCkKPiArewo+ICvCoMKgwqAg
cmV0dXJuIHN0cmluZ3NbcmVxdWVzdF07Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGNoaWxkKHZv
aWQpCj4gK3sKPgo+IC1pbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQo+ICvCoMKgwqAg
Y2hhciBwYXRoWzUxMl07Cj4gKwo+ICvCoMKgwqAgU0FGRV9QVFJBQ0UoUFRSQUNFX1RSQUNFTUUs
IDAsIE5VTEwsIE5VTEwpOwo+ICsKPiArwqDCoMKgIGlmICh0c3RfZ2V0X3BhdGgoInB0cmFjZTA2
X2NoaWxkIiwgcGF0aCwgc2l6ZW9mKHBhdGgpKSkKPiArwqDCoMKgwqDCoMKgwqAgdHN0X2JyayhU
Q09ORiwgIkNvdWxkbid0IGZpbmQgcHRyYWNlMDZfY2hpbGQgaW4gJFBBVEgiKTsKPiArCj4gK8Kg
wqDCoCBURVNUKGV4ZWNsKHBhdGgsICJwdHJhY2UwNl9jaGlsZCIsICIiLCBOVUxMKSk7Cj4gK8Kg
wqDCoCB0c3RfYnJrKFRGQUlMIHwgVFRFUlJOTywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAi
RmFpbGVkIHRvIGV4ZWN1dGUgZXhlY2wwMV9jaGlsZCIpOwo+ICvCoMKgwqAgZXhpdCgwKTsKPiAr
fQo+ICsKPiArc3RhdGljIHZvaWQgcnVuKHZvaWQpCj4gewo+IMKgwqDCoMKgc2l6ZV90IGk7Cj4g
LcKgwqDCoCBsb25nIHJldDsKPiAtwqDCoMKgIGludCBzYXZlZF9lcnJubzsKPiArwqDCoMKgIGlu
dCBwaWQ7Cj4gK8KgwqDCoCBpbnQgc3RhdHVzOwo+Cj4gLcKgwqDCoCB0c3RfcGFyc2Vfb3B0cyhh
cmdjLCBhcmd2LCBOVUxMLCBOVUxMKTsKPiArwqDCoMKgIHBpZCA9IFNBRkVfRk9SSygpOwo+Cj4g
LcKgwqDCoCBtYWtlX2FfYmFieShhcmdjLCBhcmd2KTsKPiArwqDCoMKgIGlmICghcGlkKQo+ICvC
oMKgwqDCoMKgwqDCoCBjaGlsZCgpOwo+ICsKPiArwqDCoMKgIFNBRkVfV0FJVCgmc3RhdHVzKTsK
PiArCj4gK8KgwqDCoCBpZiAoIVdJRlNUT1BQRUQoc3RhdHVzKSkKPiArwqDCoMKgwqDCoMKgwqAg
dHN0X2JyayhUQlJPSywgImNoaWxkICVkIHdhcyBub3Qgc3RvcHBlZCIsIHBpZCk7Cj4KPiDCoMKg
wqDCoGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHRlc3RfY2FzZXMpOyArK2kpIHsKPiDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgdGVzdF9jYXNlX3QgKnRjID0gJnRlc3RfY2FzZXNbaV07Cj4KPiAt
wqDCoMKgwqDCoMKgwqAgZXJybm8gPSAwOwo+IC3CoMKgwqDCoMKgwqDCoCByZXQgPQo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHB0cmFjZSh0Yy0+cmVxdWVzdCwgcGlkLCAodm9pZCAqKXRjLT5h
ZGRyLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh2b2lkICopdGMtPmRhdGEpOwo+
IC3CoMKgwqDCoMKgwqDCoCBzYXZlZF9lcnJubyA9IGVycm5vOwo+IC3CoMKgwqDCoMKgwqDCoCBp
ZiAocmV0ICE9IC0xKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9yZXNtKFRGQUlMLAo+
ICvCoMKgwqDCoMKgwqDCoCBURVNUKHB0cmFjZSh0Yy0+cmVxdWVzdCwgcGlkLCAodm9pZCAqKXRj
LT5hZGRyLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodm9pZCAq
KXRjLT5kYXRhKSk7Cj4gK8KgwqDCoMKgwqDCoMKgIGlmIChUU1RfUkVUICE9IC0xKQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9icmsoVEZBSUwgfCBURVJSTk8sCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgInB0cmFjZSglcywgLi4uLCAlbGksICVsaSkgcmV0dXJuZWQg
JWxpIGluc3RlYWQgb2YgLTEiLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnB0cmFjZSh0Yy0+cmVxdWVzdCksIHRjLT5hZGRyLCB0Yy0+ZGF0YSwKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0KTsKPiAtwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoc2F2
ZWRfZXJybm8gIT0gRUlPICYmIHNhdmVkX2Vycm5vICE9IEVGQVVMVCkKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB0c3RfcmVzbShURkFJTCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgVFNUX1JFVCk7Cj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKFRTVF9FUlIgIT0gRUlP
ICYmIFRTVF9FUlIgIT0gRUZBVUxUKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9icmso
VEZBSUwgfCBURVJSTk8sCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInB0cmFj
ZSglcywgLi4uLCAlbGksICVsaSkgZXhwZWN0ZWQgZXJybm8gRUlPIG9yIAo+IEVGQVVMVDsgYWN0
dWFsOiAlaSAoJXMpIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJwdHJh
Y2UodGMtPnJlcXVlc3QpLCB0Yy0+YWRkciwgdGMtPmRhdGEsCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNhdmVkX2Vycm5vLCBzdHJlcnJvcihzYXZlZF9lcnJubykpOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUU1RfRVJSLCBzdHJlcnJvcihUU1RfRVJS
KSk7Cj4gwqDCoMKgwqDCoMKgwqAgZWxzZQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9y
ZXNtKFRQQVNTLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVFBBU1MsCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInB0cmFjZSglcywgLi4uLCAlbGksICVsaSkg
ZmFpbGVkIGFzIGV4cGVjdGVkIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJwdHJhY2UodGMtPnJlcXVlc3QpLCB0Yy0+YWRkciwgdGMtPmRhdGEpOwo+IMKgwqDCoMKgfQo+
Cj4gLcKgwqDCoCAvKiBob3BlZnVsbHkgdGhpcyB3b3JrZWQgKi8KPiAtwqDCoMKgIHB0cmFjZShQ
VFJBQ0VfS0lMTCwgcGlkLCBOVUxMLCBOVUxMKTsKPiArwqDCoMKgIFNBRkVfUFRSQUNFKFBUUkFD
RV9DT05ULCBwaWQsIE5VTEwsIE5VTEwpOwo+Cj4gLcKgwqDCoCB0c3RfZXhpdCgpOwo+IH0KPiAr
Cj4gK3N0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPiArwqDCoMKgIC50ZXN0X2FsbCA9
IHJ1biwKPiArwqDCoMKgIC5mb3Jrc19jaGlsZCA9IDEsCj4gK307Cj4gZGlmZiAtLWdpdCBhL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHRyYWNlL3B0cmFjZTA2X2NoaWxkLmMgCj4gYi90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3B0cmFjZS9wdHJhY2UwNl9jaGlsZC5jCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAuLjM1MGIwZThkZgo+IC0tLSAvZGV2L251bGwK
PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3B0cmFjZS9wdHJhY2UwNl9jaGlsZC5j
Cj4gQEAgLTAsMCArMSwxNiBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vci1sYXRlcgo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTggTGludXggVGVzdCBQcm9q
ZWN0Cj4gKyAqIENvcHlyaWdodCAoQykgMjAxNSBDeXJpbCBIcnViaXMgY2hydWJpc0BzdXNlLmN6
Cj4gKyAqLwo+ICsKPiArI2RlZmluZSBUU1RfTk9fREVGQVVMVF9NQUlOCj4gKyNpbmNsdWRlICJ0
c3RfdGVzdC5oIgo+ICsKPiAraW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiArewo+
ICsKPiArwqDCoMKgIHRzdF9yZXMoVFBBU1MsICIlcyBleGVjdXRlZCIsIGFyZ3ZbMF0pOwo+ICsK
PiArwqDCoMKgIHJldHVybiAwOwo+ICt9CgpQbGVhc2UgcnVuICJtYWtlIGNoZWNrIiBiZWZvcmUg
c2VuZGluZyB0aGUgcGF0Y2ggYW5kIGZpeCB0aGUgaXNzdWVzLiAKT3RoZXJ3aXNlIExHVE0uCgpS
ZWdhcmRzLApBbmRyZWEgQ2VydmVzYXRvCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
