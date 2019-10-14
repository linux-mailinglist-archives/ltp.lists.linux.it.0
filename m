Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A5954D688E
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 19:35:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 655B83C235D
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 19:35:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E7FFD3C2290
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 14:54:31 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0D50920098A
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 14:54:31 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id f21so7984774plj.10
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AIhgUFkta4ADnQDSmvlPHrNje3bhbPDGxBtEgxWVXJ4=;
 b=sxwPvAowp55am1warIq3F48oJqsrU47tvCrWx99u5OCXnnudf0lSNLfcn8g9cnMY43
 YRAsstvO2ge3Zoku7PrcvqsyT6FoYDqqq+8i0lR6CdGnz4vi552ZkuSwiy17HR0k6LIi
 rZbCJX8o9ZJWPHr6KaBZzrNpH4gUEmvFZqGs5s26fNl1yHTkiFJgWoOsQXYfC7b0RAi1
 ItYw/4Bg7aw9CHF1fs7i+jgClpq1ynsOv2Rpb9+tRKo7DU/NmUIBCJDCGqxIRtae34bS
 xOQsJOGygp2y+M1HuzGpmMYIdL5mDDR61T70S1RIiJ7cNTMDWpGj2cxcRoE3h6eNA7Dq
 n5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AIhgUFkta4ADnQDSmvlPHrNje3bhbPDGxBtEgxWVXJ4=;
 b=mCPpPb3buYu0OmAY4Q9Cg7xaTyLeulEGksawh6GwYJzTHfDBEYYDSna8Vw/Sbah1PQ
 QI6MvXa4lLKlUUkIhdDmN+SoYlglwpGVq5/FVBUwJfVskaetlgFg9eNEs9W24ZEjX67q
 GArZPqK570WXyA7YOw40HTaD+2nWjpOkYK8rlbx7qrQrJHIAnhvv2amqDYkjrZChEe3C
 m+YGxqq38e2Kct0Tldh23eOe2AyKDBv3BI0Tv6t1Ti1CrJ+l3MMKeESOCrDa+5BQ6OEf
 drgEiouX0zaN0ukAO0k5fMh7fbTsXf8xkebYOh2CJcHX1eyWeWK54/gsT5t1nsppzeVF
 RtHA==
X-Gm-Message-State: APjAAAXnBIUk8p94u6eaAi4HrTODELleTaiGz5pbk2lVywbJXDQI6MT9
 si+aabstcSUxgMGwZEQ9qnYSIOxL78797fsfo5t1JQ==
X-Google-Smtp-Source: APXvYqzGH5R8369OycOOW9pCLKOSpI+swxKckLy78dNGz6hwNIT7AnhJQz0aQRY13rkng04HpMzQeIt3eFMvu6qNTPI=
X-Received: by 2002:a17:902:9696:: with SMTP id
 n22mr28004924plp.252.1571057669076; 
 Mon, 14 Oct 2019 05:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <cki.B4A567748F.PFM8G4WKXI@redhat.com>
 <805988176.6044584.1571038139105.JavaMail.zimbra@redhat.com>
In-Reply-To: <805988176.6044584.1571038139105.JavaMail.zimbra@redhat.com>
Date: Mon, 14 Oct 2019 14:54:17 +0200
Message-ID: <CAAeHK+zxFWvCOgTYrMuD-oHJAFMn5DVYmQ6-RvU8NrapSz01mQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 14 Oct 2019 19:35:39 +0200
Subject: Re: [LTP] 
	=?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
	=?utf-8?q?=2E0-rc2-d6c2c23=2Ecki_=28stable-next=29?=
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
From: Andrey Konovalov via ltp <ltp@lists.linux.it>
Reply-To: Andrey Konovalov <andreyknvl@google.com>
Cc: Linux Stable maillist <stable@vger.kernel.org>,
 Memory Management <mm-qe@redhat.com>, LTP List <ltp@lists.linux.it>,
 CKI Project <cki-project@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgOToyOSBBTSBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPgo+Cj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4K
PiA+IEhlbGxvLAo+ID4KPiA+IFdlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSByZWNlbnQgY29t
bWl0IGZyb20gdGhpcyBrZXJuZWwgdHJlZToKPiA+Cj4gPiAgICAgICAgS2VybmVsIHJlcG86Cj4g
PiAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Nh
c2hhbC9saW51eC1zdGFibGUuZ2l0Cj4gPiAgICAgICAgICAgICBDb21taXQ6IGQ2YzJjMjNhMjlm
NCAtIE1lcmdlIGJyYW5jaCAnc3RhYmxlLW5leHQnIG9mCj4gPiAgICAgICAgICAgICBzc2g6Ly9j
aHViYnlib3g6L2hvbWUvc2FzaGEvZGF0YS9uZXh0IGludG8gc3RhYmxlLW5leHQKPiA+Cj4gPiBU
aGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93Lgo+
ID4KPiA+ICAgICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiA+
ICAgICAgICAgICAgICBNZXJnZTogT0sKPiA+ICAgICAgICAgICAgQ29tcGlsZTogT0sKPiA+ICAg
ICAgICAgICAgICBUZXN0czogRkFJTEVECj4gPgo+ID4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29u
ZmlnIGZpbGVzLCBhbmQgbG9ncyBhcmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZCBoZXJlOgo+ID4K
PiA+ICAgaHR0cHM6Ly9hcnRpZmFjdHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8yMjM1NjMK
PiA+Cj4gPiBPbmUgb3IgbW9yZSBrZXJuZWwgdGVzdHMgZmFpbGVkOgo+ID4KPiA+ICAgICBhYXJj
aDY0Ogo+ID4gICAgICAg4p2MIExUUDogb3BlbnBvc2l4IHRlc3Qgc3VpdGUKPiA+Cj4KPiBUZXN0
IFsxXSBpcyBwYXNzaW5nIHZhbHVlIGNsb3NlIHRvIExPTkdfTUFYLCB3aGljaCBvbiBhcm02NCBp
cyBub3cgdHJlYXRlZCBhcyB0YWdnZWQgdXNlcnNwYWNlIHB0cjoKPiAgIDA1N2QzMzg5MTA4ZSAo
Im1tOiB1bnRhZyB1c2VyIHBvaW50ZXJzIHBhc3NlZCB0byBtZW1vcnkgc3lzY2FsbHMiKQo+Cj4g
QW5kIG5vdyBzZWVtcyB0byBoaXQgb3ZlcmZsb3cgY2hlY2sgYWZ0ZXIgc2lnbiBleHRlbnNpb24g
KEVJTlZBTCkuCj4gVGVzdCBzaG91bGQgcHJvYmFibHkgZmluZCBkaWZmZXJlbnQgd2F5IHRvIGNo
b29zZSBpbnZhbGlkIHBvaW50ZXIuCj4KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRl
c3QtcHJvamVjdC9sdHAvYmxvYi9tYXN0ZXIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRl
L2NvbmZvcm1hbmNlL2ludGVyZmFjZXMvbWxvY2svOC0xLmMKCitDYXRhbGluIGFuZCBWaW5jZW56
bwoKUGVyIERvY3VtZW50YXRpb24vYXJtNjQvdGFnZ2VkLWFkZHJlc3MtYWJpLnJzdCB3ZSBub3cg
aGF2ZToKClVzZXIgYWRkcmVzc2VzIG5vdCBhY2Nlc3NlZCBieSB0aGUga2VybmVsIGJ1dCB1c2Vk
IGZvciBhZGRyZXNzIHNwYWNlCm1hbmFnZW1lbnQgKGUuZy4gYGBtbWFwKClgYCwgYGBtcHJvdGVj
dCgpYGAsIGBgbWFkdmlzZSgpYGApLiBUaGUgdXNlCm9mIHZhbGlkIHRhZ2dlZCBwb2ludGVycyBp
biB0aGlzIGNvbnRleHQgaXMgYWx3YXlzIGFsbG93ZWQuCgpIb3dldmVyIHRoaXMgYnJlYWtzIHRo
ZSB0ZXN0IGFib3ZlLgoKV2hhdCBkbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIGRvIGhlcmU/CgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
