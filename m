Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C461FE802E
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 07:21:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7152D3C2306
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 07:21:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id BAF943C1CE5
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 07:21:39 +0100 (CET)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AC86D200C62
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 07:21:38 +0100 (CET)
Received: by mail-lj1-x243.google.com with SMTP id q78so13940333lje.5
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 23:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3mjDtFuttkWnacbQtxejyUKqELdseg1f4u1cMomtOQU=;
 b=x6H8nr6RaPjU0pdJ4CmKUdVK6ZL5SLBfcd0R2tv1CQxAF0Yo0jTq9r41P0iD8CYDY2
 4/HL/a+XspY+/FBql+UjpezlJO8jblELv13f5f1M1AQ/aEysQkcfKVKcYRNNSd3RfOzD
 u8RaWq0Ll01ts7CVQ4BMpVR1Iay4f6lW0Km5GYyxcQ4FWRZehBzrN47roEuuvXd1zrhU
 utmgBH1DuFfYBiFgWF32tGKaqykP1L0SEeaKjbOVDd93069DdvP1odQ67jWnIwuf+518
 JePsfRHggeG0stlHsaTLKQZHZPXTdUu7RnnkCDJuM4OoDpn1YSU8r+b4f7YssSSSCO/U
 r8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3mjDtFuttkWnacbQtxejyUKqELdseg1f4u1cMomtOQU=;
 b=Z/QIpBTrNTY2xo8EEHkTELNc27GLLto46DvKYAGbR/1OPDvmOIekTkr881hl+rL5M5
 viz/Y3hAr0omN8yJp6YL+ysA5u4cyKfkCFibMM/V6vFUZFbeOUXeXMBbFdSOI6qEd87+
 TtN/QTuzCPcJemiyJSK31e65xmdoiu9uaWjPuzjx/Y6G5cqQLGNZ3Bei2QMSsvFjr0Y1
 Gv9+5ruRBXOwq4il7kHDZwO0OX6YEoqgdCJ3n6Ft0e4qBX+qOPmUyd4eqKWfr2shFSoO
 MKljx6riUDEM+TJAo1fuVBaxoRzPOihT67L8EjsAJIoEnydXSOfpewQdXpX/JXYH5saQ
 ZLIA==
X-Gm-Message-State: APjAAAXuluf5nlzjO6jLC0fiL5XBsVycYyOD4Cq/rqu3yW9NZnsWkkI+
 XdExw3Yzb7wHQJ4qIY0kbFmHw/IlNTcgui48Yjqh+86wVC0=
X-Google-Smtp-Source: APXvYqwJL+KLsfQm4IBRUbyByU7cwJcmEttvyhwfzpWaxoQurPFLYDtWXtVKibJEVkwicul6oWTd4moOAlkjjtXOUXs=
X-Received: by 2002:a05:651c:1ae:: with SMTP id
 c14mr1021867ljn.135.1572330097959; 
 Mon, 28 Oct 2019 23:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191027203251.029297948@linuxfoundation.org>
In-Reply-To: <20191027203251.029297948@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 29 Oct 2019 11:51:26 +0530
Message-ID: <CA+G9fYuA+kLqLo1_ev0=QRvYtMrVhwRvm+QO-tOCVYca2Mt97Q@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4.19 00/93] 4.19.81-stable review
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
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gTW9uLCAyOCBPY3QgMjAxOSBhdCAwMjo0NCwgR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGlzIHRoZSBzdGFydCBvZiB0aGUg
c3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDQuMTkuODEgcmVsZWFzZS4KPiBUaGVyZSBhcmUg
OTMgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcywgYWxsIHdpbGwgYmUgcG9zdGVkIGFzIGEgcmVzcG9u
c2UKPiB0byB0aGlzIG9uZS4gIElmIGFueW9uZSBoYXMgYW55IGlzc3VlcyB3aXRoIHRoZXNlIGJl
aW5nIGFwcGxpZWQsIHBsZWFzZQo+IGxldCBtZSBrbm93Lgo+Cj4gUmVzcG9uc2VzIHNob3VsZCBi
ZSBtYWRlIGJ5IFR1ZSAyOSBPY3QgMjAxOSAwODoyNzowMiBQTSBVVEMuCj4gQW55dGhpbmcgcmVj
ZWl2ZWQgYWZ0ZXIgdGhhdCB0aW1lIG1pZ2h0IGJlIHRvbyBsYXRlLgo+Cj4gVGhlIHdob2xlIHBh
dGNoIHNlcmllcyBjYW4gYmUgZm91bmQgaW4gb25lIHBhdGNoIGF0Ogo+ICAgICAgICAgaHR0cHM6
Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y0Lngvc3RhYmxlLXJldmlldy9wYXRj
aC00LjE5LjgxLXJjMS5nego+IG9yIGluIHRoZSBnaXQgdHJlZSBhbmQgYnJhbmNoIGF0Ogo+ICAg
ICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJs
ZS9saW51eC1zdGFibGUtcmMuZ2l0IGxpbnV4LTQuMTkueQo+IGFuZCB0aGUgZGlmZnN0YXQgY2Fu
IGJlIGZvdW5kIGJlbG93Lgo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKPgoKUmVzdWx0cyBmcm9t
IExpbmFyb+KAmXMgdGVzdCBmYXJtLgpObyByZWdyZXNzaW9ucyBvbiBhcm02NCwgYXJtLCB4ODZf
NjQsIGFuZCBpMzg2LgoKTm90ZToKVGhlIG5ldyB0ZXN0IGNhc2UgIGZyb20gTFRQIHZlcnNpb24g
dXBncmFkZSBzeXNjYWxscyBzeW5jX2ZpbGVfcmFuZ2UwMiBpcyBhbgppbnRlcm1pdHRlbnQgZmFp
bHVyZS4gV2UgYXJlIGludmVzdGlnYXRpbmcgdGhpcyBjYXNlLgpUaGUgbGlzdGVkIGZpeGVzIGlu
IHRoZSBiZWxvdyBzZWN0aW9uIGFyZSBkdWUgdG8gTFRQIHVwZ3JhZGUgdG8gdjIwMTkwOTMwLgoK
U3VtbWFyeQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCmtlcm5lbDogNC4xOS44MS1yYzEKZ2l0IHJlcG86IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51
eC1zdGFibGUtcmMuZ2l0CmdpdCBicmFuY2g6IGxpbnV4LTQuMTkueQpnaXQgY29tbWl0OiBiNzQ4
NjlmNzUyYmZhN2FkNTBjNTUzNDllZTJmMGJiZDYxYTQ1ZjBjCmdpdCBkZXNjcmliZTogdjQuMTku
ODAtOTQtZ2I3NDg2OWY3NTJiZgpUZXN0IGRldGFpbHM6IGh0dHBzOi8vcWEtcmVwb3J0cy5saW5h
cm8ub3JnL2xrZnQvbGludXgtc3RhYmxlLXJjLTQuMTktb2UvYnVpbGQvdjQuMTkuODAtOTQtZ2I3
NDg2OWY3NTJiZgoKTm8gcmVncmVzc2lvbnMgKGNvbXBhcmVkIHRvIGJ1aWxkIHY0LjE5Ljc5LTgy
LWc5OTY2MWU5Y2NmOTIpCgpGaXhlcyAoY29tcGFyZWQgdG8gYnVpbGQgdjQuMTkuNzktODItZzk5
NjYxZTljY2Y5MikKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpsdHAtc3lzY2FsbHMtdGVzdHM6CiAgICAqIGlv
Y3RsX25zMDUKICAgICogaW9jdGxfbnMwNgogICAgKiB1c3RhdDAyCgpSYW4gMjA0OTEgdG90YWwg
dGVzdHMgaW4gdGhlIGZvbGxvd2luZyBlbnZpcm9ubWVudHMgYW5kIHRlc3Qgc3VpdGVzLgoKRW52
aXJvbm1lbnRzCi0tLS0tLS0tLS0tLS0tCi0gZHJhZ29uYm9hcmQtNDEwYyAtIGFybTY0Ci0gaGk2
MjIwLWhpa2V5IC0gYXJtNjQKLSBpMzg2Ci0ganVuby1yMiAtIGFybTY0Ci0gcWVtdV9hcm0KLSBx
ZW11X2FybTY0Ci0gcWVtdV9pMzg2Ci0gcWVtdV94ODZfNjQKLSB4MTUgLSBhcm0KLSB4ODZfNjQK
ClRlc3QgU3VpdGVzCi0tLS0tLS0tLS0tCiogYnVpbGQKKiBpbnN0YWxsLWFuZHJvaWQtcGxhdGZv
cm0tdG9vbHMtcjI2MDAKKiBrc2VsZnRlc3QKKiBsaWJodWdldGxiZnMKKiBsdHAtY2FwX2JvdW5k
cy10ZXN0cwoqIGx0cC1jb21tYW5kcy10ZXN0cwoqIGx0cC1jb250YWluZXJzLXRlc3RzCiogbHRw
LWNwdWhvdHBsdWctdGVzdHMKKiBsdHAtY3ZlLXRlc3RzCiogbHRwLWRpby10ZXN0cwoqIGx0cC1m
Y250bC1sb2NrdGVzdHMtdGVzdHMKKiBsdHAtZmlsZWNhcHMtdGVzdHMKKiBsdHAtZnNfYmluZC10
ZXN0cwoqIGx0cC1mc19wZXJtc19zaW1wbGUtdGVzdHMKKiBsdHAtZnN4LXRlc3RzCiogbHRwLWh1
Z2V0bGItdGVzdHMKKiBsdHAtaW8tdGVzdHMKKiBsdHAtaXBjLXRlc3RzCiogbHRwLW1hdGgtdGVz
dHMKKiBsdHAtbW0tdGVzdHMKKiBsdHAtbnB0bC10ZXN0cwoqIGx0cC1wdHktdGVzdHMKKiBsdHAt
c2NoZWQtdGVzdHMKKiBsdHAtc2VjdXJlYml0cy10ZXN0cwoqIGx0cC1zeXNjYWxscy10ZXN0cwoq
IHBlcmYKKiBzcGVjdHJlLW1lbHRkb3duLWNoZWNrZXItdGVzdAoqIHY0bDItY29tcGxpYW5jZQoq
IGx0cC1mcy10ZXN0cwoqIG5ldHdvcmstYmFzaWMtdGVzdHMKKiBsdHAtb3Blbi1wb3NpeC10ZXN0
cwoqIGt2bS11bml0LXRlc3RzCiogc3N1aXRlCioga3NlbGZ0ZXN0LXZzeXNjYWxsLW1vZGUtbmF0
aXZlCioga3NlbGZ0ZXN0LXZzeXNjYWxsLW1vZGUtbm9uZQoKLS0gCkxpbmFybyBMS0ZUCmh0dHBz
Oi8vbGtmdC5saW5hcm8ub3JnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
