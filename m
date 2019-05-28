Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE1B2BEC0
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 07:56:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF19D294AC4
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 07:56:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 5C4EE3EA4D8
 for <ltp@lists.linux.it>; Tue, 28 May 2019 07:56:19 +0200 (CEST)
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 58F58140171F
 for <ltp@lists.linux.it>; Tue, 28 May 2019 07:56:18 +0200 (CEST)
Received: by mail-yw1-xc42.google.com with SMTP id b74so7443938ywe.5
 for <ltp@lists.linux.it>; Mon, 27 May 2019 22:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YQTuSUPoMpApu61MTz/3FTtTWsPlWwfCFXlC5wmP+FA=;
 b=kjk8oDvFYeXIw0feddY4PkWTPQM1XgbGUHbQTif2gLuhnLstLDHAUD9ESnnLXNIne+
 QOVIGU7G6gey2vKd/hBnlA/abUUl7tq21fP34KT2o0AsFrdp4fjG0zuFyZ7+9o5Wz5oF
 2lWWFILZ+L1ZgfigwSd4Zs0eXqzMu2w6v/dD05ova8MchWKe9D8sGdsKBV3KjBnciMP+
 SgfH6Q3MyYtLQa1SU/LPMsL3KN5CEqqYEhp47jKvQwvbE63wBjBg6YiTxDyNn8Wl0S06
 meG/vWazpEdviGAIOT6JnOxq20jY33RJMAe9xGHWbgnMfVTDkyylSQ3ttWBHnHsb9hmE
 a9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YQTuSUPoMpApu61MTz/3FTtTWsPlWwfCFXlC5wmP+FA=;
 b=Sqep6/THowp82p0bZUPOfZt+r8xzpdV59UaalHsJ21iCXFmJn6JE+NilSOrPtFu6Uk
 n14aEDBMphYDJ3rO0z/M7qAQZtI+exGskRhaVpwzHzz4pb2d68NLnoVwnMFY+LRbPZ+P
 WBWzAtvq3zC/9ceXXf4fClaTck0D3tygUj6rY78cFcNIJLfh4ApTsVzuQ8Fo91rwnm7h
 DZI5e8cqEge2Qp9Kaa5rWaFDIz4r+GhDEKGhlko1mxV2v9Fz9SqERRRNOm4O8JzvtjMe
 fhL9eGuDYkwGCwFXmBQjp2pQ3zhZZtlt5j19mbu/97B/rzRxt4G4p19JGMCjokCMcm08
 yNEw==
X-Gm-Message-State: APjAAAXI2ne9rHAhIKSQ0cAwvMhtYRssqXK4JzUSoCohvGqh+2Y23Nt0
 L5xYri1dop67RuZkXRFLU6rwA4Cs27zAug/x/V8=
X-Google-Smtp-Source: APXvYqyNqMqxaV0oLgthafFtRmv2GBvDNsWaRGXBS1hKmsn3Ie7K6hdLDPdUbc31PatT6fnYsctFcTSLZpX+9/Gv6gs=
X-Received: by 2002:a81:4f06:: with SMTP id d6mr43423500ywb.379.1559022977208; 
 Mon, 27 May 2019 22:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190523135518.GF30616@rei.lan>
 <20190528043929.19671-1-xzhou@redhat.com>
 <20190528043929.19671-2-xzhou@redhat.com>
In-Reply-To: <20190528043929.19671-2-xzhou@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 28 May 2019 08:56:06 +0300
Message-ID: <CAOQ4uxj_0F3pWGCLA4Fxcq54TVViid_8G3fpJw89Un8UfCo87g@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v5 2/4] swapon/libswapon: add helper
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

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNzo0MCBBTSBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPiBUbyBjaGVjayBpZiB0aGUgZmlsZXN5c3RlbSB3ZSBhcmUgdGVzdGlu
ZyBvbiBzdXBwb3J0cyBzd2Fwb24vc3dhcG9mZgo+IG9wZXJhdGlvbnMuIEtlZXAgTkZTIGFuZCBU
TVBGUyBvbiB0aGUgd2hpdGUgbGlzdC4gRG9uJ3QgcmVwb3J0IGZhaWwKPiBpZiBCVFJGUyBmYWls
cyB3aXRoIEVJTlZBTC4KCkNoYW5nZXMgbG9vayB2ZXJ5IGdvb2QsIGJ1dCBJIGRvbid0IHRoaW5r
IHlvdSBuZWVkIHRoZSB3aGl0ZWxpc3QgYW55bW9yZS4uLgoKPgo+IFNpZ25lZC1vZmYtYnk6IE11
cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPgo+IC0tLQo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24uYyB8IDU2ICsrKysrKysrKysrKysrKysrKysrCj4gIHRl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5oIHwgIDYgKysrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zd2Fwb24vbGlic3dhcG9uLmMKPiBpbmRleCBjZjZhOTg4OTEuLmUwMmZkZDRhZCAx
MDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24u
Ywo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5jCj4g
QEAgLTE5LDYgKzE5LDggQEAKPiAgICoKPiAgICovCj4KPiArI2luY2x1ZGUgPGVycm5vLmg+Cj4g
KyNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gICNpbmNsdWRlICJ0ZXN0LmgiCj4gICNpbmNs
dWRlICJsaWJzd2Fwb24uaCIKPgo+IEBAIC00NywzICs0OSw1NyBAQCB2b2lkIG1ha2Vfc3dhcGZp
bGUodm9pZCAoY2xlYW51cCkodm9pZCksIGNvbnN0IGNoYXIgKnN3YXBmaWxlKQo+Cj4gICAgICAg
ICB0c3RfcnVuX2NtZChjbGVhbnVwLCBhcmd2LCAiL2Rldi9udWxsIiwgIi9kZXYvbnVsbCIsIDAp
Owo+ICB9Cj4gKwo+ICsvKgo+ICsgKiBDaGVjayBzd2Fwb24vc3dhcG9mZiBzdXBwb3J0IHN0YXR1
cyBvZiBmaWxlc3lzdGVtcyBvciBmaWxlcwo+ICsgKiB3ZSBhcmUgdGVzdGluZyBvbi4KPiArICov
Cj4gK3ZvaWQgaXNfc3dhcF9zdXBwb3J0ZWQodm9pZCAoY2xlYW51cCkodm9pZCksIGNvbnN0IGNo
YXIgKm9wcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmZp
bGVuYW1lKQo+ICt7Cj4gKyAgICAgICBpbnQgZmlibWFwID0gdHN0X2ZpYm1hcChmaWxlbmFtZSk7
Cj4gKyAgICAgICBsb25nIGZzX3R5cGUgPSB0c3RfZnNfdHlwZShjbGVhbnVwLCBmaWxlbmFtZSk7
Cj4gKyAgICAgICBjb25zdCBjaGFyICpmc3R5cGUgPSB0c3RfZnNfdHlwZV9uYW1lKGZzX3R5cGUp
Owo+ICsKPiArICAgICAgIC8qIHdoaXRlbGlzdCBsZWdhY3kgZnMgKi8KPiArICAgICAgIHN3aXRj
aCAoZnNfdHlwZSkgewo+ICsgICAgICAgY2FzZSBUU1RfTkZTX01BR0lDOgo+ICsgICAgICAgY2Fz
ZSBUU1RfVE1QRlNfTUFHSUM6Cj4gKyAgICAgICAgICAgICAgIHRzdF9icmttKFRDT05GLCBjbGVh
bnVwLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAiQ2Fubm90IGRvICVzIG9uIGEgZmlsZSBv
biAlcyBmaWxlc3lzdGVtIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgb3BzLCBmc3R5cGUp
Owo+ICsgICAgICAgYnJlYWs7Cj4gKyAgICAgICB9CgpJZiB5b3UgcmVtb3ZlIHRoaXMgd2hpdGVs
aXN0LCB0aGVuIE5GUyx0bXBmcyB3aWxsIHJlYWNoIHRoZSBmaWVtYXAgIT0gMCBjYXNlCmFuZCBy
ZXN1bHQgaW4gdHN0X2Jya20oVENPTkYgYW55d2F5LgoKPiArCj4gKyAgICAgICBtYWtlX3N3YXBm
aWxlKE5VTEwsIGZpbGVuYW1lKTsKPiArCj4gKyAgICAgICBURVNUKGx0cF9zeXNjYWxsKF9fTlJf
c3dhcG9uLCBmaWxlbmFtZSwgMCkpOwo+ICsKPiArICAgICAgIGlmIChURVNUX1JFVFVSTiA9PSAt
MSkgewo+ICsgICAgICAgICAgICAgICBpZiAoZnNfdHlwZSA9PSBUU1RfQlRSRlNfTUFHSUMgJiYg
ZXJybm8gPT0gRUlOVkFMKSB7CgpJZiB5b3UgcmVwbGFjZSAoZnNfdHlwZSA9PSBUU1RfQlRSRlNf
TUFHSUMpIHdpdGggKGZpYm1hcCAhPSAwKQp0aGVuIE5GUyBzd2FwZmlsZSBzdXBwb3J0IGNvdWxk
IGJlIHRlc3RlZCBhcyB3ZWxsIGFuZCB5b3UgZG8gbm90CnNwZWNpYWwgY2FzZSBhbnkgZmlsZXN5
c3RlbS4KCgo+ICsgICAgICAgICAgICAgICAgICAgICAgIHRzdF9icmttKFRDT05GLCBjbGVhbnVw
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlN3YXBmaWxlIG9uIEJUUkZTIG5v
dCBpbXBsZW1lbnRlZCIpOwo+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChmaWJtYXAgPT0gMCkgewoKYW5kIHRoZW4geW91IGRvbid0IG5lZWQg
dGhpcyBleHRyYSB0ZXN0LgoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRzdF9i
cmttKFRGQUlMIHwgVEVSUk5PLCBjbGVhbnVwLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgInN3YXBvbiBvbiAlcyBmYWlsZWQiLCBmc3R5cGUpOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJzd2Fwb24gb24gJXMgaXMgbm90IHN1cHBvcnRlZCIsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnN0eXBlKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiArCj4g
KyAgICAgICBURVNUKGx0cF9zeXNjYWxsKF9fTlJfc3dhcG9mZiwgZmlsZW5hbWUsIDApKTsKPiAr
Cj4gKyAgICAgICBpZiAoVEVTVF9SRVRVUk4gPT0gLTEpIHsKPiArICAgICAgICAgICAgICAgaWYg
KGZpYm1hcCA9PSAwKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdHN0X2Jya20oVEZBSUwg
fCBURVJSTk8sIGNsZWFudXAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAic3dh
cG9mZiBvbiAlcyBmYWlsZWQiLCBmc3R5cGUpOwo+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+
ICsgICAgICAgICAgICAgICAgICAgICAgIHRzdF9icmttKFRDT05GLCBjbGVhbnVwLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzd2Fwb2ZmIG9uICVzIGlzIG5vdCBzdXBwb3J0
ZWQiLCBmc3R5cGUpOwo+ICsgICAgICAgICAgICAgICB9CgpJIGRvbid0IHRoaW5rIHRoZXJlIHNo
b3VsZCBiZSBhbnkgVENPTkYgaGVyZS4KSWYgd2UgcmVhY2hlZCBoZXJlIHRoZW4gc3dhcG9uIGlz
IHN1cHBvcnRlZCAtIGluIHRoYXQgY2FzZQpmYWlsdXJlIHRvIHN3YXBvZmYgaXMgYSByZWFsIGZh
aWx1cmUuCgpUaGFua3MsCkFtaXIuCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
