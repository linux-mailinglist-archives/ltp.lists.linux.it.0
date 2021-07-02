Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAAA3B9F5F
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 12:55:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BDBF3C8CD6
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 12:55:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 09BFE3C6AE0
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 12:55:35 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 71CC86018AD
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 12:55:35 +0200 (CEST)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lzGpa-0001uF-9N
 for ltp@lists.linux.it; Fri, 02 Jul 2021 10:55:34 +0000
Received: by mail-ed1-f71.google.com with SMTP id
 u13-20020aa7d88d0000b0290397eb800ae3so905220edq.9
 for <ltp@lists.linux.it>; Fri, 02 Jul 2021 03:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/MarIlo4RrFi9+5T4JIM0LnwHuwHDBebPKcQisgcA8I=;
 b=qaIDc0pK8lUAvbQdrHjciRs12POxKIpPlfmBtJ7M7npM/8kTfrjrGL39BZ+XhhnKxr
 BqrnzKGJ1VAEXUQbHHntEIhmS1joZ9wmM/3jeI0ARDr5WpCM7rwJ2cpOP4L0ope3b2Ot
 v2vaUt/cYws4R/V0lER7cyZFumJOvCJI2rUGKudOp1tdPoiWit42ycnHUN+Br0jKWDPK
 pOZppNqmo4sT8zI9u5FznDTqBjjFbbUo8+ANjb1QYC9gE+sc+GeYVX6eCvNfsxpN+0LH
 SWmoVVZB4ZQVT/yIuWhIugBOinn3ULWO9M1tH63z5dWgRGZ4lZna+7uY1qhc5A+izb8V
 OZCQ==
X-Gm-Message-State: AOAM5337/F6j5wL2+4iFMEEBSty1Bof8k5RCQKux1HV+idG4ADUMej1H
 oIim26OCKayMc7pRQ8EWd93VUo8aTNF8KowdNG8zK3ZBKm6RuNj5/xh/RsuKRuOtzii5gnzRQFV
 +oEQsTDkqkzzndL2ExHbjZdVLo/kI
X-Received: by 2002:a05:6402:2749:: with SMTP id
 z9mr5838828edd.300.1625222949233; 
 Fri, 02 Jul 2021 03:49:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdUTqbSPW1wv6K6vdAAjvMKdYGeQ4TsDiwCXOU7sIU3+4n4l5mkj7k5gTztv4Fv0C0+JCFfg==
X-Received: by 2002:a05:6402:2749:: with SMTP id
 z9mr5838813edd.300.1625222949049; 
 Fri, 02 Jul 2021 03:49:09 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id r17sm1156565edt.33.2021.07.02.03.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 03:49:08 -0700 (PDT)
To: Li Wang <liwang@redhat.com>
References: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
 <bd56facc-55a3-4e8a-4e9d-304d5177462d@canonical.com>
 <CAEemH2dqM29Y5s5U2QbeONH30h6aR1B4DZxSnSdowWKSXzfgYQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ced1d406-97f4-286a-656b-671a333ba46a@canonical.com>
Date: Fri, 2 Jul 2021 12:49:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2dqM29Y5s5U2QbeONH30h6aR1B4DZxSnSdowWKSXzfgYQ@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/3] controllers/memcg: fixes for newer kernels
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

T24gMjUvMDYvMjAyMSAxMDoyMSwgTGkgV2FuZyB3cm90ZToKPiAKPiAKPiBPbiBGcmksIEp1biAy
NSwgMjAyMSBhdCAzOjMxIEFNIEtyenlzenRvZiBLb3psb3dza2kKPiA8a3J6eXN6dG9mLmtvemxv
d3NraUBjYW5vbmljYWwuY29tCj4gPG1haWx0bzprcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNh
bC5jb20+PiB3cm90ZToKPiAKPiAgICAgT24gMTcvMDYvMjAyMSAwOTowNywgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZToKPiAgICAgPiBIaSwKPiAgICAgPgo+ICAgICA+IFRoaXMgaXMgYSByZXNl
bmQgb2YgcHJldmlvdXMgR2l0aHViIHB1bGw6Cj4gICAgID4gaHR0cHM6Ly9naXRodWIuY29tL2xp
bnV4LXRlc3QtcHJvamVjdC9sdHAvcHVsbC84MzAKPiAgICAgPGh0dHBzOi8vZ2l0aHViLmNvbS9s
aW51eC10ZXN0LXByb2plY3QvbHRwL3B1bGwvODMwPgo+ICAgICA+Cj4gICAgID4gVGhlIHBhdGNo
ZXMgZml4IHNldmVyYWwgdGVzdCBmYWlsdXJlcyB3ZSBhcmUgaGl0dGluZyBzaW5jZSBtb250aHMs
Cj4gICAgIHNlZToKPiAgICAgPiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE4Mjk5
NzkKPiAgICAgPGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTgyOTk3OT4KPiAgICAg
PiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE4Mjk5ODQKPiAgICAgPGh0dHBzOi8v
YnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTgyOTk4ND4KPiAgICAgPgo+ICAgICA+IEJlc3QgcmVn
YXJkcywKPiAgICAgPiBLcnp5c3p0b2YKPiAgICAgPgo+ICAgICA+Cj4gICAgID4gS3J6eXN6dG9m
IEtvemxvd3NraSAoMyk6Cj4gICAgID7CoCDCoGNvbnRyb2xsZXJzL21lbWNnOiBhY2NlcHQgcmFu
Z2Ugb2YgbWF4X3VzYWdlX2luX2J5dGVzCj4gICAgID7CoCDCoGNvbnRyb2xsZXJzL21lbWNnOiBh
Y2NlcHQgcmFuZ2Ugb2YgdXNhZ2VfaW5fYnl0ZXMKPiAgICAgPsKgIMKgY29udHJvbGxlcnMvbWVt
Y2c6IGFjY2VwdCBub24temVybyBtYXhfdXNhZ2VfaW5fYnl0ZXMgYWZ0ZXIgcmVzZXQKPiAKPiAK
PiAgICAgSGkgZXZlcnlvbmUsCj4gCj4gICAgIFRoZSBwYXRjaHNldCBnb3QgcG9zaXRpdmUgTEdU
TSBvbiB0aGUgR2l0aHViLiBBbnkgZnVydGhlciBjb21tZW50cyBmb3IKPiAgICAgaXQgb3IgY2Fu
IGl0IGJlIGFwcGxpZWQ/Cj4gCj4gCj4gSSBzbGlnaHRseSBhZ3JlZSB3aXRoIFJpY2hhcmQgdGhh
dCB3ZSBuZWVkIGFuIGV4cGxhbmF0aW9uL2ludmVzdGlnYXRpb24KPiBvbiB3aGVyZSB0aGUgMzIq
UEFHRV9TSVpFIGNvbWVzIGZyb20uIE90aGVyd2lzZSwgd2UgYXJlIHZlcnkgcG9zc2libGUKPiB0
byBtYXNrIGEgY291bnRlciBidWcgaWYgb25seSB0byBtYWtlIHRoZSB0ZXN0IGhhcHB5LgoKT24g
bmV3ZXIgdjUuMTEgdGhlIG1heF91c2FnZV9pbl9ieXRlcyBnbyBldmVuIGFib3ZlIDMyIHBhZ2Vz
IHVwIHRvIDM0LgoKSSBnb3Qgc29tZSBleHBsYW5hdGlvbiBmcm9tIE1pY2hhbCBIb2NrbyBbMV0g
ZnJvbSB3aGljaCBvbmUgY2FuIHRyeSB0bwpjb25jbHVkZToKMS4gVGhlcmUgaXMgc2lnbmlmaWNh
bnQgY2FjaGluZyBpbiBtZW1vcnkgYWNjb3VudGluZy4gTm90IG9ubHkgY2hhcmdpbmcKb2YgY2dy
b3VwIGlzIG9uY2UgcGVyIE1FTUNHX0NIQVJHRV9CQVRDSCBiYXRjaCAodHJ5X2NoYXJnZSgpKSwg
YnV0IGFsc28Kc3RhdGlzdGljcyBhcmUgZ2F0aGVyZWQgZnJvbSBwZXItY3B1IGlmIHRocmVzaG9s
ZCBleGNlZWQKTUVNQ0dfQ0hBUkdFX0JBVENIIChfX21vZF9tZW1jZ19zdGF0ZSgpKS4KCjIuIERl
cGVuZGluZyBvbiBtYWNoaW5lIChkaWZmZXJlbnQgYW1vdW50IG9mIENQVXMpLCB0aGUgbWVtb3J5
IGdyb3VwCmNoYXJnaW5nIGJlIGxlc3Mgb3IgbW9yZSBhY2N1cmF0ZS4KCjMuIFRoZSBhY2N1cmFj
eSBvZiBncm91cCBtZW1vcnkgYWNjb3VudGluZyBpcyBub3QgY29uc2lkZXJlZCBhcwppbXBvcnRh
bnQgdGh1cyB0ZXN0IHJlbHlpbmcgb24gaXQsIHdpbGwgYmUgZmFpbGluZyBmcm9tIHRpbWUgdG8g
dGltZS4KCgpJJ2xsIHNlbmQgYSB2MyB3aXRoIHNpZ25pZmljYW50bHkgaW5jcmVhc2VkIGxpbWl0
cyBhbmQgc29tZSBleHBsYW5hdGlvbi4KClsxXQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tbS84NWI4YTRmOS1iOWU5LWE2Y2EtNWQwYy1jMWVjYjhjMTFlZjNAY2Fub25pY2FsLmNvbS9U
LyNtNjQ1OWIzYmUzYTg2ZjVlYWYyY2ZjNDhkZDU4NmI2ZmFmOTQ5ZTQ0MAoKCkJlc3QgcmVnYXJk
cywKS3J6eXN6dG9mCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
