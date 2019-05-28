Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B682C948
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:53:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B7833EA503
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:53:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D4E6B3EA19D
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:53:11 +0200 (CEST)
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 212C81A00E49
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:53:11 +0200 (CEST)
Received: by mail-yw1-xc42.google.com with SMTP id r200so4110109ywe.0
 for <ltp@lists.linux.it>; Tue, 28 May 2019 07:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hme3Uw91eChsGk+gTcs4MZZscZbqc7m7kYcuj1FFSyg=;
 b=c70vauW8g+MRWlR4LwLctie5HwClQJy/UjI4idRBuyUzd2PDhFExtSRcy4BKesB1yL
 kHhRR+j0wX0DfiidDMm8qzFxV5DKmx5JbudFWJoH6sdEfTYHtQMg+Ol0OIRz7zdEE26a
 4Kirlw13m2Bg2jzSr8sbGFaBRnNqQndP6hAGPA3ck1iAMslMcJSjJ01iqmO+BaRlwps2
 1rjmIwZtRg0UDF2eV3Iv3gjUNvQAW1jjEfnKKtscDE97lvamRmfRrbbFiQO2S3lhLnRe
 1H0SzNjg3CGJOF0F72o46u0g6P4cXCfOqI8S79zshzyM/c/4btyXEl/V1t+ZXsLE6tbq
 iTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hme3Uw91eChsGk+gTcs4MZZscZbqc7m7kYcuj1FFSyg=;
 b=eEsH1pyqlG1j/L7CGf0pBrt/H9TP2Bhz6YbuQlqrWNfHOsGv4Jl0+/FvD8GmDYd41p
 8zOOzA0hIaWe7gTxHBQQlDKAMROXW85DGMhqeNw+mmtK0IM55qgF4e+9nyrnNIJzJwDi
 ie9yR5+PmgrwA8agbg9fR/HA7y9v/wbAMb5S+P0zbHLX4MYJ+CDOP/2RyYmo1/F9KPxW
 8M8CWmcOHpihjLK6Hrln7iRiJfkdG9wbc8yDsvQsTjW1GKBgwH1BBG7BajNwzpwGaiJH
 pRDULzFVzOmy2H9iA9XuWnYuaCX3fX0FZLgdbGo4Ee3LjLyMWtMEcAKp7/cS/uaTXKmZ
 WYQw==
X-Gm-Message-State: APjAAAUiKgRu836l5wX5O6zUDN2jfO2OrjuduJyZSfOMxoAKcfgSDMJx
 43kNPfgeYeGjWutoTCMu6cMXrgvXEvBbb5rQE60=
X-Google-Smtp-Source: APXvYqyd8ZtDB07Cq77ZZt3n+oWoKRdYbQU1hwWTlvpzngDXoxxsCqy4APO8Yl+18s1zu174CN6v4i1/Lr0ay9o3oQ4=
X-Received: by 2002:a81:3797:: with SMTP id e145mr49672777ywa.25.1559055189969; 
 Tue, 28 May 2019 07:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
 <20190528141214.18752-1-xzhou@redhat.com>
 <20190528141214.18752-2-xzhou@redhat.com>
In-Reply-To: <20190528141214.18752-2-xzhou@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 28 May 2019 17:52:58 +0300
Message-ID: <CAOQ4uxj46qHPmufpCwhAr6z7MaKzvw7ei5R427CbD=3e9he59g@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v6 2/4] swapon/libswapon: add helper
	is_swap_supported
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
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

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNToxMiBQTSBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPiBUbyBjaGVjayBpZiB0aGUgZmlsZXN5c3RlbSB3ZSBhcmUgdGVzdGlu
ZyBvbiBzdXBwb3J0cyBGSUJNQVAsIG1rc3dhcCwKPiBzd2Fwb24gYW5kIHN3YXBvZmYgb3BlcmF0
aW9ucy4KPiBNb2RpZnkgbWFrZV9zd2FwZmlsZSBmdW5jdGlvbiB0byB0ZXN0IG1rc3dhcCBzdXBw
b3J0IHN0YXR1cyBzYWZlbHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8eHpob3VA
cmVkaGF0LmNvbT4KCkxvb2tzIG9rIHRvIG1lCgo+IC0tLQo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24uYyB8IDQ1ICsrKysrKysrKysrKysrKysrKystCj4gIHRl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5oIHwgIDcgKystCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24uYyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5jCj4gaW5kZXggY2Y2YTk4
ODkxLi5mNjZkMTk1NDggMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9z
d2Fwb24vbGlic3dhcG9uLmMKPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBv
bi9saWJzd2Fwb24uYwo+IEBAIC0xOSwxMyArMTksMTUgQEAKPiAgICoKPiAgICovCj4KPiArI2lu
Y2x1ZGUgPGVycm5vLmg+Cj4gKyNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gICNpbmNsdWRl
ICJ0ZXN0LmgiCj4gICNpbmNsdWRlICJsaWJzd2Fwb24uaCIKPgo+ICAvKgo+ICAgKiBNYWtlIGEg
c3dhcCBmaWxlCj4gICAqLwo+IC12b2lkIG1ha2Vfc3dhcGZpbGUodm9pZCAoY2xlYW51cCkodm9p
ZCksIGNvbnN0IGNoYXIgKnN3YXBmaWxlKQo+ICtpbnQgbWFrZV9zd2FwZmlsZSh2b2lkIChjbGVh
bnVwKSh2b2lkKSwgY29uc3QgY2hhciAqc3dhcGZpbGUsIGludCBzYWZlKQo+ICB7Cj4gICAgICAg
ICBpZiAoIXRzdF9mc19oYXNfZnJlZShOVUxMLCAiLiIsIHN5c2NvbmYoX1NDX1BBR0VTSVpFKSAq
IDEwLAo+ICAgICAgICAgICAgIFRTVF9CWVRFUykpIHsKPiBAQCAtNDUsNSArNDcsNDQgQEAgdm9p
ZCBtYWtlX3N3YXBmaWxlKHZvaWQgKGNsZWFudXApKHZvaWQpLCBjb25zdCBjaGFyICpzd2FwZmls
ZSkKPiAgICAgICAgIGFyZ3ZbMV0gPSBzd2FwZmlsZTsKPiAgICAgICAgIGFyZ3ZbMl0gPSBOVUxM
Owo+Cj4gLSAgICAgICB0c3RfcnVuX2NtZChjbGVhbnVwLCBhcmd2LCAiL2Rldi9udWxsIiwgIi9k
ZXYvbnVsbCIsIDApOwo+ICsgICAgICAgcmV0dXJuIHRzdF9ydW5fY21kKGNsZWFudXAsIGFyZ3Ys
ICIvZGV2L251bGwiLCAiL2Rldi9udWxsIiwgc2FmZSk7Cj4gK30KPiArCj4gKy8qCj4gKyAqIENo
ZWNrIHN3YXBvbi9zd2Fwb2ZmIHN1cHBvcnQgc3RhdHVzIG9mIGZpbGVzeXN0ZW1zIG9yIGZpbGVz
Cj4gKyAqIHdlIGFyZSB0ZXN0aW5nIG9uLgo+ICsgKi8KPiArdm9pZCBpc19zd2FwX3N1cHBvcnRl
ZCh2b2lkIChjbGVhbnVwKSh2b2lkKSwgY29uc3QgY2hhciAqZmlsZW5hbWUpCj4gK3sKPiArICAg
ICAgIGludCBmaWJtYXAgPSB0c3RfZmlibWFwKGZpbGVuYW1lKTsKPiArICAgICAgIGxvbmcgZnNf
dHlwZSA9IHRzdF9mc190eXBlKGNsZWFudXAsIGZpbGVuYW1lKTsKPiArICAgICAgIGNvbnN0IGNo
YXIgKmZzdHlwZSA9IHRzdF9mc190eXBlX25hbWUoZnNfdHlwZSk7Cj4gKwo+ICsgICAgICAgaW50
IHJldCA9IG1ha2Vfc3dhcGZpbGUoTlVMTCwgZmlsZW5hbWUsIDEpOwo+ICsgICAgICAgaWYgKHJl
dCAhPSAwKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChmaWJtYXAgIT0gMCkgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHRzdF9icmttKFRDT05GLCBjbGVhbnVwLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIm1rc3dhcCBvbiAlcyBub3Qgc3VwcG9ydGVkIiwgZnN0eXBlKTsK
PiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAgICAgICAgICB0c3Rf
YnJrbShURkFJTCwgY2xlYW51cCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJt
a3N3YXAgb24gJXMgZmFpbGVkIiwgZnN0eXBlKTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAg
ICAgfQo+ICsKPiArICAgICAgIFRFU1QobHRwX3N5c2NhbGwoX19OUl9zd2Fwb24sIGZpbGVuYW1l
LCAwKSk7Cj4gKyAgICAgICBpZiAoVEVTVF9SRVRVUk4gPT0gLTEpIHsKPiArICAgICAgICAgICAg
ICAgaWYgKGZpYm1hcCAhPSAwICYmIGVycm5vID09IEVJTlZBTCkgewo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHRzdF9icmttKFRDT05GLCBjbGVhbnVwLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIlN3YXBmaWxlIG9uICVzIG5vdCBpbXBsZW1lbnRlZCIsIGZzdHlwZSk7Cj4g
KyAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdHN0X2Jy
a20oVEZBSUwgfCBURVJSTk8sIGNsZWFudXAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgInN3YXBvbiBvbiAlcyBmYWlsZWQiLCBmc3R5cGUpOwo+ICsgICAgICAgICAgICAgICB9
Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgVEVTVChsdHBfc3lzY2FsbChfX05SX3N3YXBvZmYs
IGZpbGVuYW1lLCAwKSk7Cj4gKyAgICAgICBpZiAoVEVTVF9SRVRVUk4gPT0gLTEpIHsKPiArICAg
ICAgICAgICAgICAgdHN0X2Jya20oVEZBSUwgfCBURVJSTk8sIGNsZWFudXAsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgInN3YXBvZmYgb24gJXMgZmFpbGVkIiwgZnN0eXBlKTsKPiArICAgICAg
IH0KPiAgfQo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9s
aWJzd2Fwb24uaCBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5o
Cj4gaW5kZXggN2Y3MjExZWI0Li5hNTE4MzNlYzEgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9zd2Fwb24vbGlic3dhcG9uLmgKPiArKysgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24uaAo+IEBAIC0yOSw2ICsyOSwxMSBAQAo+ICAvKgo+
ICAgKiBNYWtlIGEgc3dhcCBmaWxlCj4gICAqLwo+IC12b2lkIG1ha2Vfc3dhcGZpbGUodm9pZCAo
Y2xlYW51cCkodm9pZCksIGNvbnN0IGNoYXIgKnN3YXBmaWxlKTsKPiAraW50IG1ha2Vfc3dhcGZp
bGUodm9pZCAoY2xlYW51cCkodm9pZCksIGNvbnN0IGNoYXIgKnN3YXBmaWxlLCBpbnQgc2FmZSk7
Cj4KPiArLyoKPiArICogQ2hlY2sgc3dhcG9uL3N3YXBvZmYgc3VwcG9ydCBzdGF0dXMgb2YgZmls
ZXN5c3RlbXMgb3IgZmlsZXMKPiArICogd2UgYXJlIHRlc3Rpbmcgb24uCj4gKyAqLwo+ICt2b2lk
IGlzX3N3YXBfc3VwcG9ydGVkKHZvaWQgKGNsZWFudXApKHZvaWQpLCBjb25zdCBjaGFyICpmaWxl
bmFtZSk7Cj4gICNlbmRpZiAvKiBfX0xJQlNXQVBPTl9IX18gKi8KPiAtLQo+IDIuMjEuMAo+Cgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
