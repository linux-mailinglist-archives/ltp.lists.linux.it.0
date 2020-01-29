Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B4114C55C
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 05:50:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C37EE3C2476
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 05:50:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8621D3C2364
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 05:50:37 +0100 (CET)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 133BB600A7F
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 05:50:37 +0100 (CET)
Received: by mail-lf1-x143.google.com with SMTP id c23so10895200lfi.7
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 20:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wim94widKA03iNuJRk9so3EwVNvjN2LdiRVfz6nHdGg=;
 b=Ut1dDBrReZ+s/c2Hff6XjuKCaDzlAw9J91bOdU7BFhTfc/vBYOqLFZ86XVwda6x4vd
 JyPMXJ529/CgY17ePJ3MN+6xdlCCt9AIvQX8hxxOtby6rDb2vN3hmVfJ3chgOZ0B9qin
 SpAF5PzNOiwA+lAZVoPYAGXQLRwpe8wu2x5VPCUNhKXzfCVkw+6v0DV7/wywrcdYjfe+
 3gRwq7idDemW2u9T3ajMoDB4kAm9eR6mzfcGWbaDeN+8uXIKD8toohKy4i6l1v49NplP
 bQkXF5M9PPfeNuIptYshYiHPe6HPTIPkjqeEyk6lUMadXCUMdLknBvAKlPcRg0Tjfibd
 tJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wim94widKA03iNuJRk9so3EwVNvjN2LdiRVfz6nHdGg=;
 b=lvMEbANMp0iyOw3kyNdycWItuvep8KC6y/TrDYpjGsR6EMeDs00XVsdULqlvdCy+vy
 XxUqTl3aFDLrEMeD4BeD/ZpFIhrMqMr/DZepXpfeXIpmocSqsRRvEqj8QBZOxr3FMl74
 af5O4PQrpnMEG71S6gWEbQMmTSvpGejH92nOi1mN6hnco9gi45WCpI9tj8Z40XrKjby7
 rCRF0fcMvS3020AY30oUgdqqIXY8+W9mgMecWwaSrmJpoLpF8th1748l4E1caKMqK1UC
 jSJ5O03KAWyjfdTMMF4e4Vus+2n3Vev9kPf+7ikk0TyHYfc6zJa3GbpHyGWZo/ZIspOp
 8Qpw==
X-Gm-Message-State: APjAAAW2eOfBgB64xv42Ps2bLWTN26pwGr1rWrSL9njH0qIUgMvijjGs
 cStXUAJWvPEa4RMEtO+ReqaHyVkH/RzEcQevG3trqg==
X-Google-Smtp-Source: APXvYqxFX4aCqNvA5hqlXrgKCF20fYm8bkSYUTXShZmJ31tdAOSiXRf+BHB0BP8xgJ9VKlTZDiZiI4qbyMOtbW5pBLo=
X-Received: by 2002:ac2:5e7a:: with SMTP id a26mr4469755lfr.167.1580273436449; 
 Tue, 28 Jan 2020 20:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20200128135852.449088278@linuxfoundation.org>
In-Reply-To: <20200128135852.449088278@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 29 Jan 2020 10:20:25 +0530
Message-ID: <CA+G9fYs=Fd27J7==VEYc_0=7=xH4sS003EwXMQHCRs0zL3iANw@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4.9 000/271] 4.9.212-stable review
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

T24gVHVlLCAyOCBKYW4gMjAyMCBhdCAxOTo0NiwgR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGlzIHRoZSBzdGFydCBvZiB0aGUg
c3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDQuOS4yMTIgcmVsZWFzZS4KPiBUaGVyZSBhcmUg
MjcxIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIGFsbCB3aWxsIGJlIHBvc3RlZCBhcyBhIHJlc3Bv
bnNlCj4gdG8gdGhpcyBvbmUuICBJZiBhbnlvbmUgaGFzIGFueSBpc3N1ZXMgd2l0aCB0aGVzZSBi
ZWluZyBhcHBsaWVkLCBwbGVhc2UKPiBsZXQgbWUga25vdy4KPgo+IFJlc3BvbnNlcyBzaG91bGQg
YmUgbWFkZSBieSBUaHUsIDMwIEphbiAyMDIwIDEzOjU3OjA5ICswMDAwLgo+IEFueXRoaW5nIHJl
Y2VpdmVkIGFmdGVyIHRoYXQgdGltZSBtaWdodCBiZSB0b28gbGF0ZS4KPgo+IFRoZSB3aG9sZSBw
YXRjaCBzZXJpZXMgY2FuIGJlIGZvdW5kIGluIG9uZSBwYXRjaCBhdDoKPiAgICAgICAgIGh0dHBz
Oi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5lbC92NC54L3N0YWJsZS1yZXZpZXcvcGF0
Y2gtNC45LjIxMi1yYzEuZ3oKPiBvciBpbiB0aGUgZ2l0IHRyZWUgYW5kIGJyYW5jaCBhdDoKPiAg
ICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFi
bGUvbGludXgtc3RhYmxlLXJjLmdpdCBsaW51eC00LjkueQo+IGFuZCB0aGUgZGlmZnN0YXQgY2Fu
IGJlIGZvdW5kIGJlbG93Lgo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKClRoaXMgaXMgNC45LjIx
Mi1yYzIgdGVzdCByZXBvcnQuCgpSZXN1bHRzIGZyb20gTGluYXJv4oCZcyB0ZXN0IGZhcm0uCk5v
IHJlZ3Jlc3Npb25zIG9uIGFybTY0LCBhcm0sIHg4Nl82NCwgYW5kIGkzODYuCgoKTk9URToKTFRQ
IGZzIHRlc3QgcmVhZF9hbGxfcHJvYyBmYWlscyBpbnRlcm1pdHRlbnRseSBvbiA0LjkgYW5kIDQu
MTQgYnJhbmNoZXMuCgpTdW1tYXJ5Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKa2VybmVsOiA0LjkuMjEyLXJj
MgpnaXQgcmVwbzogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQKZ2l0IGJyYW5jaDogbGludXgtNC45LnkKZ2l0
IGNvbW1pdDogOTFmZjgyMjZhMDc0NDQ5ZmNkMmI5NjIxNGQxOTI3ZmQzZThkODExNApnaXQgZGVz
Y3JpYmU6IHY0LjkuMjExLTI3Mi1nOTFmZjgyMjZhMDc0ClRlc3QgZGV0YWlsczogaHR0cHM6Ly9x
YS1yZXBvcnRzLmxpbmFyby5vcmcvbGtmdC9saW51eC1zdGFibGUtcmMtNC45LW9lL2J1aWxkL3Y0
LjkuMjExLTI3Mi1nOTFmZjgyMjZhMDc0CgpObyByZWdyZXNzaW9ucyAoY29tcGFyZWQgdG8gYnVp
bGQgdjQuOS4yMTEpCgpObyBmaXhlcyAoY29tcGFyZWQgdG8gYnVpbGQgdjQuOS4yMTEpCgpSYW4g
MjM1NjAgdG90YWwgdGVzdHMgaW4gdGhlIGZvbGxvd2luZyBlbnZpcm9ubWVudHMgYW5kIHRlc3Qg
c3VpdGVzLgoKRW52aXJvbm1lbnRzCi0tLS0tLS0tLS0tLS0tCi0gZHJhZ29uYm9hcmQtNDEwYyAt
IGFybTY0Ci0gaGk2MjIwLWhpa2V5IC0gYXJtNjQKLSBpMzg2Ci0ganVuby1yMiAtIGFybTY0Ci0g
cWVtdV9hcm0KLSBxZW11X2FybTY0Ci0gcWVtdV9pMzg2Ci0gcWVtdV94ODZfNjQKLSB4MTUgLSBh
cm0KLSB4ODZfNjQKClRlc3QgU3VpdGVzCi0tLS0tLS0tLS0tCiogYnVpbGQKKiBpbnN0YWxsLWFu
ZHJvaWQtcGxhdGZvcm0tdG9vbHMtcjI2MDAKKiBrc2VsZnRlc3QKKiBsaWJodWdldGxiZnMKKiBs
aW51eC1sb2ctcGFyc2VyCiogbHRwLWNhcF9ib3VuZHMtdGVzdHMKKiBsdHAtY29tbWFuZHMtdGVz
dHMKKiBsdHAtY29udGFpbmVycy10ZXN0cwoqIGx0cC1jcHVob3RwbHVnLXRlc3RzCiogbHRwLWN2
ZS10ZXN0cwoqIGx0cC1kaW8tdGVzdHMKKiBsdHAtZmNudGwtbG9ja3Rlc3RzLXRlc3RzCiogbHRw
LWZpbGVjYXBzLXRlc3RzCiogbHRwLWZzLXRlc3RzCiogbHRwLWZzX2JpbmQtdGVzdHMKKiBsdHAt
ZnNfcGVybXNfc2ltcGxlLXRlc3RzCiogbHRwLWZzeC10ZXN0cwoqIGx0cC1odWdldGxiLXRlc3Rz
CiogbHRwLWlvLXRlc3RzCiogbHRwLWlwYy10ZXN0cwoqIGx0cC1tYXRoLXRlc3RzCiogbHRwLW1t
LXRlc3RzCiogbHRwLW5wdGwtdGVzdHMKKiBsdHAtcHR5LXRlc3RzCiogbHRwLXNjaGVkLXRlc3Rz
CiogbHRwLXNlY3VyZWJpdHMtdGVzdHMKKiBsdHAtc3lzY2FsbHMtdGVzdHMKKiBwZXJmCiogc3Bl
Y3RyZS1tZWx0ZG93bi1jaGVja2VyLXRlc3QKKiB2NGwyLWNvbXBsaWFuY2UKKiBuZXR3b3JrLWJh
c2ljLXRlc3RzCiogbHRwLW9wZW4tcG9zaXgtdGVzdHMKKiBwcmVwLXRtcC1kaXNrCioga3ZtLXVu
aXQtdGVzdHMKKiBrc2VsZnRlc3QtdnN5c2NhbGwtbW9kZS1uYXRpdmUKKiBrc2VsZnRlc3QtdnN5
c2NhbGwtbW9kZS1ub25lCiogc3N1aXRlCgotLSAKTGluYXJvIExLRlQKaHR0cHM6Ly9sa2Z0Lmxp
bmFyby5vcmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
