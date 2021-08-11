Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 616A83E8E02
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:04:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB6043C7002
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:04:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F5133C22F3
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:04:35 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 67C00200246
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:04:34 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 1A8BE3F049
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 10:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628676270;
 bh=3F8sWfRL+ye2+QYsRM/xWu5A43CwFijnG0Ob3c2lsHo=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=hTKvc0UcSH9OpXEvXdUCLZWC7+U2v5vqiSGYxEdboPTYedt+YXEjT1OTiRmJwpCOy
 ZLH1qc9VPT9oXjr4fpB2qvHfklHjIhvt+zb0NqQGGX5KUSGm9TG+FWqzt5zH0dya/b
 ApjuqUmxpvlb8PldEZHV9nT9nHnxD0624EeVGKpWBubTV1xClnw7qpDi+ui/IbzCTf
 34DxD9vWy1IAd0g91HCv9n7oN5eEmFsPs4IpNajRVzZj2gXvMJf6lOY/XDcPGS9r5y
 LtcSmekSD6OJ+CKYI3/SnsEnOiOfXamJzitpNYiyEYvS+mq2knoy5ZWqSE6p07kF+m
 aSXF/rYiNH/Gw==
Received: by mail-ed1-f69.google.com with SMTP id
 y39-20020a50bb2a0000b02903bc05daccbaso969896ede.5
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 03:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3F8sWfRL+ye2+QYsRM/xWu5A43CwFijnG0Ob3c2lsHo=;
 b=KXgbQQncUcQ/NRS+zGwCvFCwhKbmVtbnUkIOi4mSeJKtrF2wM9OeNkhBZpEconh/fO
 DXr5WouuPSN6fBY8gCm3vjctUUPGUGv0Im9bkTK0+OY04cjo7vhUX9t7+LHeDtZwRqBQ
 OUcSlfBi3GrXZ9/Jj9Y2izMt1cbnOr4Xfc1bTDFgDOKgw1+ze1LsyqU8Q0P2+OzeWbRA
 8L6INOzt2/tMw1F6d0B8L4s4dJ2Ye+u9SSfg9wER+df7Uw04RNyJJ/15eOP8VGj1CLyK
 70wyZV++lhrznZLOtiNJUXvdyD+3YIOdtK52fqRFGLZpSa+gmxvL4gK78dKpPVgp2akK
 b/Bg==
X-Gm-Message-State: AOAM533+6MOJ8LAKm7oKUZtLJ6HIGds0i8M3jiXCoYAlwdrCH+N4I2uA
 kKtJalCXokeh/XbYSwWkbkwNxm5jEzDjSVS2vHAZGCF2hT0en0xl0TvcdvcZ2pssZQiH/Y3NYAu
 7/ACdIoEjNHmMyDYZG/FUpVrr74fd
X-Received: by 2002:a17:907:9851:: with SMTP id
 jj17mr2786155ejc.489.1628676267495; 
 Wed, 11 Aug 2021 03:04:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd5U08hbirJd+XBbPd+oYqOaCOsMp7hgV5WctD9/XIbStkTcliGAGcmnDj3aQrEC8BFIcOOA==
X-Received: by 2002:a17:907:9851:: with SMTP id
 jj17mr2785853ejc.489.1628676263713; 
 Wed, 11 Aug 2021 03:04:23 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id l9sm11084760edt.55.2021.08.11.03.04.22
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 03:04:22 -0700 (PDT)
To: ltp@lists.linux.it
References: <20210720150520.17612-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <448ccb00-8499-40a8-4234-52e1e49a0760@canonical.com>
Date: Wed, 11 Aug 2021 12:04:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720150520.17612-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers: detect previous test failure on
 cgroup mounts
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

T24gMjAvMDcvMjAyMSAxNzowNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBUaGUgZmFp
bHVyZSBvZiBtZW1jZ19zdHJlc3NfdGVzdC5zaCBjbGVhbnVwIHdlbnQgdW5ub3RpY2VkIChleGNl
cHQKPiBlY2hvIG1lc3NhZ2UpIGFuZCBjYXVzZWQgZnVydGhlciBjZ3JvdXBfZmogYW5kIG1lbWNn
X2NvbnRyb2xfdGVzdAo+IGZhaWx1cmVzIGJlY2F1c2Ugb2YgdW5jbGVhbiBjZ3JvdXBzLiBGbG93
IGlzIHVzdWFsbHkgbGlrZToKPiAKPiAxLiBtZW1jZ19zdHJlc3NfdGVzdCBzdWNjZWVkcyBidXQg
YWN0dWFsbHkgdGhlIC9kZXYvbWVtY2cgd2FzIG5vdAo+ICAgIGNsZWFuZWQgdXAuIE5vdGljZSBs
YWNrIG9mIGFueSBlcnJvciBtZXNzYWdlIGR1ZSB0byAyPi9kZXYvbnVsbC4KPiAKPiAgICAgIG1l
bWNnX3N0cmVzc190ZXN0IDEgVElORk86IFRlc3RpbmcgMTUwIGNncm91cHMsIHVzaW5nIDEyNzMg
TUIsIGludGVydmFsIDUKPiAgICAgIG1lbWNnX3N0cmVzc190ZXN0IDEgVElORk86IFN0YXJ0aW5n
IGNncm91cHMKPiAgICAgIG1lbWNnX3N0cmVzc190ZXN0IDEgVElORk86IFRlc3RpbmcgY2dyb3Vw
cyBmb3IgOTAwcwo+ICAgICAgbWVtY2dfc3RyZXNzX3Rlc3QgMSBUSU5GTzogS2lsbGluZyBncm91
cHMKPiAgICAgIHRhZz1tZW1jZ19zdHJlc3Mgc3RpbWU9MTYyNjc3MDc4NyBkdXI9OTAzIGV4aXQ9
ZXhpdGVkIHN0YXQ9MiBjb3JlPW5vIGN1PTE5IGNzPTEyCj4gCj4gMi4gbWVtY2dfY29udHJvbF90
ZXN0IGhhcyBmYWxzZS1wb3NpdGl2ZS4gSXQgc3VjY2VlZHMgYnV0IGFjdHVhbGx5IG5vCj4gICAg
dGVzdCB3YXMgZG9uZSBkdWUgdG8gL2Rldi9tZW1jZyBwb2xsdXRpb24gZnJvbSBwcmV2aW91cyB0
ZXN0Ogo+IAo+ICAgICAgbWtkaXI6IGNhbm5vdCBjcmVhdGUgZGlyZWN0b3J5IOKAmC90bXAvbHRw
LXE4RGpTaFBKZUIvbW50LzHigJk6IEZpbGUgZXhpc3RzCj4gICAgICBtZW1jZ19jb250cm9sICAg
IDAgIFRJTkZPICA6ICBUZXN0ICMxOiBDaGVja2luZyBpZiB0aGUgbWVtb3J5IHVzYWdlIGxpbWl0
IGltcG9zZWQgYnkgdGhlIHRvcG1vc3QgZ3JvdXAgaXMgZW5mb3JjZWQKPiAgICAgIHNoOiBlY2hv
OiBJL08gZXJyb3IKPiAgICAgIC9vcHQvbHRwL3Rlc3RjYXNlcy9iaW4vbWVtY2dfY29udHJvbF90
ZXN0LnNoOiA4NjogL29wdC9sdHAvdGVzdGNhc2VzL2Jpbi9tZW1jZ19jb250cm9sX3Rlc3Quc2g6
IGNhbm5vdCBjcmVhdGUgL3RtcC9sdHAtcThEalNoUEplQi9tbnQvMS9tZW1vcnkubWVtc3cubGlt
aXRfaW5fYnl0ZXM6Cj4gICAgICBQZXJtaXNzaW9uIGRlbmllZAo+ICAgICAgcm1kaXI6IGZhaWxl
ZCB0byByZW1vdmUgJ3N1Yic6IERldmljZSBvciByZXNvdXJjZSBidXN5Cj4gICAgICBybWRpcjog
ZmFpbGVkIHRvIHJlbW92ZSAnL3RtcC9sdHAtcThEalNoUEplQi9tbnQvMSc6IERldmljZSBvciBy
ZXNvdXJjZSBidXN5Cj4gICAgICBtZW1jZ19jb250cm9sICAgIDEgIFRQQVNTICA6ICBtZW1jZ19j
b250cm9sOiBwYXNzZWQKPiAgICAgIHRhZz1tZW1jZ19jb250cm9sIHN0aW1lPTE2MjY3NzE2OTUg
ZHVyPTYgZXhpdD1leGl0ZWQgc3RhdD0wIGNvcmU9bm8gY3U9MiBjcz0xCj4gCj4gMy4gY2dyb3Vw
X2ZqX2Z1bmN0aW9uMl9tZW1vcnkgZmFpbHMgd2l0aCBhIGNyeXB0aWMgbWVzc2FnZSBvZiBtb3Vu
dGluZyBhCj4gICAgcGF0aCB3aXRoIG5ldyBsaW5lIChiZWNhdXNlIC9kZXYvbWVtY2cgd2FzIG5v
dCBjbGVhbmVkIHVwIGJlZm9yZSk6Cj4gCj4gICAgICBjZ3JvdXBfZmpfZnVuY3Rpb24yX21lbW9y
eSAxIFRJTkZPOiBTdWJzeXN0ZW0gbWVtb3J5IGlzIG1vdW50ZWQgYXQgL3N5cy9mcy9jZ3JvdXAv
bWVtb3J5Cj4gICAgICAvZGV2L21lbWNnCj4gICAgICBta2RpcjogY2Fubm90IGNyZWF0ZSBkaXJl
Y3Rvcnkg4oCYL3N5cy9mcy9jZ3JvdXAvbWVtb3J54oCZOiBGaWxlIGV4aXN0cwo+ICAgICAgY2dy
b3VwX2ZqX2Z1bmN0aW9uMl9tZW1vcnkgMSBUQlJPSzogbWtkaXIgL3N5cy9mcy9jZ3JvdXAvbWVt
b3J5Cj4gICAgICAvZGV2L21lbWNnL2x0cCBmYWlsZWQKPiAgICAgIGNncm91cF9mal9mdW5jdGlv
bjJfbWVtb3J5IDEgVElORk86IFJlbW92aW5nIGFsbCBsdHAgc3ViZ3JvdXBzLi4uCj4gICAgICBm
aW5kOiDigJgvc3lzL2ZzL2Nncm91cC9tZW1vcnlcbi9kZXYvbWVtY2cvbHRwL+KAmTogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQo+IAo+IFRoZSBhY3R1YWwgZmFpbHVyZSB3YXMgaW4gbWVtY2df
c3RyZXNzX3Rlc3QgZXhlY3V0ZWQgYmVmb3JlIG90aGVyIHRlc3RzLAo+IGhvd2V2ZXIgaXQgd2Vu
dCB1bm5vdGljZWQuICBEZWJ1Z2dpbmcgc3VjaCBmYWlsdXJlcyBpcyBkaWZmaWN1bHQgYXMKPiBy
ZXN1bHQgb2YgZmFpbGluZyB0ZXN0IGRlcGVuZHMgb24gcnVubmluZyBhbm90aGVyIHdoaWNoIGRp
ZCBub3QgZmFpbC4KPiBJbnN0ZWFkLCBkZXRlY3QgdW5jbGVhbiBjZ3JvdXBzIG1vdW50cyBhbmQg
ZXhwbGljaXRseSB0ZXN0IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4KPiAtLS0KPiAgLi4uL2tlcm5l
bC9jb250cm9sbGVycy9jZ3JvdXBfZmovY2dyb3VwX2ZqX2NvbW1vbi5zaCAgIHwgIDQgKystLQo+
ICAuLi4vY29udHJvbGxlcnMvbWVtY2cvY29udHJvbC9tZW1jZ19jb250cm9sX3Rlc3Quc2ggICAg
fCAxMCArKysrKystLS0tCj4gIC4uLi9jb250cm9sbGVycy9tZW1jZy9zdHJlc3MvbWVtY2dfc3Ry
ZXNzX3Rlc3Quc2ggICAgICB8ICA4ICsrKystLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCgpIaSBhbGwsCgpBbnkgY29tbWVudHMgaGVy
ZT8KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
