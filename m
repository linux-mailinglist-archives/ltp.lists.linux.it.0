Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA28232D815
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 17:52:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A5593C6E40
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 17:52:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3F30B3C5669
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 17:52:52 +0100 (CET)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 88A2B1A0113E
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 17:52:51 +0100 (CET)
Received: by mail-oi1-x235.google.com with SMTP id q203so7770589oih.5
 for <ltp@lists.linux.it>; Thu, 04 Mar 2021 08:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=pQ2I+V66AMcAwQfqsnZhOw7PXkTt/5x9hT6p4MnWawA=;
 b=QPJ2DoKh/JAtTcfSaKOck7R6fNv75KA8aT8wZdYjKlfIgvTTCBRRtO/qJ+orj2pv2B
 1H1cyBC/clM4zDEPFuyRafZyDMKWIIsEqgf7KKQOOMIe9rxToUDvomsDy1WPhhkMrf5G
 irFuJqe9h7kRfzlSEwreaOWpN0fWNrRh0s1Yoq1gA/kwkzZfKFk3fKGgeQO2yM9whs9H
 Uvou6okjND23Xx9DJlxfes4dRh/fhxlNOmIQ5EGk5+mFIorNDBuOMRk6wyxRvfo0hh7k
 x0Oo2FtwZri/J2s3eE5uZFWh8+ma0fZMAgnSC2TCO3BDu8jFVm3aAMuqz8Se0BapO4XS
 4hyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=pQ2I+V66AMcAwQfqsnZhOw7PXkTt/5x9hT6p4MnWawA=;
 b=okQDya5/zwRb61I+Bk/b+1eqwfrLjDDlShqpYlm+o0MSxyEjcooxdCZrSW7/OrNek5
 cA/RIc7vLQwg9Ptvzm7/sLvhHjuF8J5rQuaxhaPXQxddloLqTnfMgWE08AfdrSxMKbT0
 0nWAmBT80ZvmjLKpaSWpu84Kb8DBaUtziqq2s5MhpZ0zFesMzBd75Kt56J6EcwJlRySh
 Hr4N988T8Yo1pYo7nk1OwPGDIPT/0xf4nnKPwqZbMfenBqaHTdz27Jq0hKw9SXeHsUM+
 wAjvrong74+crOHnFhe0Ouh5ZQy6Rj/BYpZILUmBj3sfF8gNtGwb2f9hQP7I9JMkuNv/
 iqqQ==
X-Gm-Message-State: AOAM530GDnBUnJCakdK3u3iALtA1MmfVXyN0xVlk1XpK7Pi3O/0id/W5
 3Q49pCEBlDMLLx165zMjEbw=
X-Google-Smtp-Source: ABdhPJxJlftwX9kPs+Ilsz6C+1AZL4ACZVS+3xLZM3+umkgK6VMQBFhXjlQlT3gCTsYt4p6azEk5GA==
X-Received: by 2002:a54:470a:: with SMTP id k10mr3625194oik.80.1614876770334; 
 Thu, 04 Mar 2021 08:52:50 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v3sm592463oix.48.2021.03.04.08.52.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Mar 2021 08:52:49 -0800 (PST)
Date: Thu, 4 Mar 2021 08:52:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20210304165247.GA131220@roeck-us.net>
References: <20210302192719.741064351@linuxfoundation.org>
 <CA+G9fYvkW+84U9e0Cjft_pq9bGnBBqCXST7Hg+gx4pKNyuGPFQ@mail.gmail.com>
 <YEDDIzz32JqSvi1S@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEDDIzz32JqSvi1S@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.11 000/773] 5.11.3-rc3 review
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, linux-stable <stable@vger.kernel.org>, pavel@denx.de,
 Andrew Morton <akpm@linux-foundation.org>, Jon Hunter <jonathanh@nvidia.com>,
 Shuah Khan <shuah@kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCBNYXIgMDQsIDIwMjEgYXQgMTI6MjM6MTVQTSArMDEwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFdlZCwgTWFyIDAzLCAyMDIxIGF0IDAyOjAyOjIwUE0gKzA1MzAsIE5h
cmVzaCBLYW1ib2p1IHdyb3RlOgo+ID4gT24gV2VkLCAzIE1hciAyMDIxIGF0IDAwOjU5LCBHcmVn
IEtyb2FoLUhhcnRtYW4KPiA+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IFRoaXMgaXMgdGhlIHN0YXJ0IG9mIHRoZSBzdGFibGUgcmV2aWV3IGN5Y2xlIGZv
ciB0aGUgNS4xMS4zIHJlbGVhc2UuCj4gPiA+IFRoZXJlIGFyZSA3NzMgcGF0Y2hlcyBpbiB0aGlz
IHNlcmllcywgYWxsIHdpbGwgYmUgcG9zdGVkIGFzIGEgcmVzcG9uc2UKPiA+ID4gdG8gdGhpcyBv
bmUuICBJZiBhbnlvbmUgaGFzIGFueSBpc3N1ZXMgd2l0aCB0aGVzZSBiZWluZyBhcHBsaWVkLCBw
bGVhc2UKPiA+ID4gbGV0IG1lIGtub3cuCj4gPiA+Cj4gPiA+IFJlc3BvbnNlcyBzaG91bGQgYmUg
bWFkZSBieSBUaHUsIDA0IE1hciAyMDIxIDE5OjI1OjA3ICswMDAwLgo+ID4gPiBBbnl0aGluZyBy
ZWNlaXZlZCBhZnRlciB0aGF0IHRpbWUgbWlnaHQgYmUgdG9vIGxhdGUuCj4gPiA+Cj4gPiA+IFRo
ZSB3aG9sZSBwYXRjaCBzZXJpZXMgY2FuIGJlIGZvdW5kIGluIG9uZSBwYXRjaCBhdDoKPiA+ID4g
ICAgICAgICBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjUueC9zdGFi
bGUtcmV2aWV3L3BhdGNoLTUuMTEuMy1yYzMuZ3oKPiA+ID4gb3IgaW4gdGhlIGdpdCB0cmVlIGFu
ZCBicmFuY2ggYXQ6Cj4gPiA+ICAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0IGxpbnV4LTUuMTEueQo+
ID4gPiBhbmQgdGhlIGRpZmZzdGF0IGNhbiBiZSBmb3VuZCBiZWxvdy4KPiA+ID4KPiA+ID4gdGhh
bmtzLAo+ID4gPgo+ID4gPiBncmVnIGstaAo+ID4gCj4gPiAKPiA+IFJlc3VsdHMgZnJvbSBMaW5h
cm/igJlzIHRlc3QgZmFybS4KPiA+IEFsbCBvdXIgYnVpbGRzIGFyZSBnZXR0aW5nIFBBU1Mgbm93
Lgo+ID4gQnV0LAo+ID4gUmVncmVzc2lvbnMgZGV0ZWN0ZWQgb24gYWxsIGRldmljZXMgKGFybTY0
LCBhcm0sIHg4Nl82NCBhbmQgaTM4NikuCj4gPiBMVFAgcHR5IHRlc3QgY2FzZSBoYW5ndXAwMSBm
YWlsZWQgb24gYWxsIGRldmljZXMKPiA+IAo+ID4gaGFuZ3VwMDEgICAgMSAgVEZBSUwgIDogIGhh
bmd1cDAxLmM6MTMzOiB1bmV4cGVjdGVkIG1lc3NhZ2UgMwo+ID4gCj4gPiBSZXBvcnRlZC1ieTog
TGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5hcm8ub3JnPgo+ID4gCj4g
PiBUaGlzIGZhaWx1cmUgaXMgc3BlY2lmaWMgdG8gc3RhYmxlLXJjIHY1LjEwLjIwLXJjNCBhbmQg
djUuMTEuMy1yYzMKPiA+IFRlc3QgUEFTUyBvbiB0aGUgdjUuMTItcmMxIG1haW5saW5lIGFuZCBM
aW51eCBuZXh0IGtlcm5lbC4KPiA+IAo+ID4gRm9sbG93aW5nIHR3byBjb21taXRzIGNhdXNlZCB0
aGlzIHRlc3QgZmFpbHVyZSwKPiA+IAo+ID4gICAgTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxp
bnV4LWZvdW5kYXRpb24ub3JnPgo+ID4gICAgICAgIHR0eTogaW1wbGVtZW50IHJlYWRfaXRlcgo+
ID4gCj4gPiAgICBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+
Cj4gPiAgICAgICAgdHR5OiBjb252ZXJ0IHR0eV9sZGlzY19vcHMgJ3JlYWQoKScgZnVuY3Rpb24g
dG8gdGFrZSBhIGtlcm5lbCBwb2ludGVyCj4gPiAKPiA+IFRlc3QgY2FzZSBmYWlsZWQgbGluaywK
PiA+IGh0dHBzOi8vcWEtcmVwb3J0cy5saW5hcm8ub3JnL2xrZnQvbGludXgtc3RhYmxlLXJjLWxp
bnV4LTUuMTEueS9idWlsZC92NS4xMS4yLTc3NC1nNmNhNTJkYmM1OGRmL3Rlc3RydW4vNDA3MDE0
My9zdWl0ZS9sdHAtcHR5LXRlc3RzL3Rlc3QvaGFuZ3VwMDEvbG9nCj4gPiAKPiAKPiBUaGFua3Mg
Zm9yIHRlc3RpbmcgdGhlbSBhbGwsIEknbGwgdHJ5IHRvIGRlYnVnIHRoaXMgbGF0ZXIgdG9kYXku
Li4KPiAKCkRpZCB5b3Ugc2VlIG15IHJlc3BvbnNlIHRvIHY1LjEwLnkgPyBJdCBsb29rcyBsaWtl
IHR3byByZWxhdGVkIHBhdGNoZXMKbWF5IGJlIG1pc3NpbmcgZnJvbSB2NS4xMC55IGFuZCB2NS4x
MS55LgoKR3VlbnRlcgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
