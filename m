Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AABEA14C566
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 05:53:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70B8C3C2476
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 05:53:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 26A6D3C2364
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 05:53:29 +0100 (CET)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0BE0C201080
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 05:53:29 +0100 (CET)
Received: by mail-lj1-x244.google.com with SMTP id q8so16971487ljj.11
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 20:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1lFwndVHov/RzOPqSUZJ9434t/t6x+foxuiqxo1V074=;
 b=rhBjnpU8ZwkReW/Curtm6+L+FYqh24nsm55yJeCFqog437bJfv0rtrR0yoLLUCQEQ1
 5348icdydLu2aFLvVgVUJ9Wz6d2v55RN6II3u/hUU1yNUm2clBgPBhM75pyz5/ds4r5A
 u/wCovtZ+wOKSzKAuQY1Zy79amQMtjCY0N1eC2LM4YTciidqP9gSiNTlO6W8vaEcjF76
 +32fdFkFGJ0T7Uk96oqVBpWN+kZBICIl03VPTs8tOLyzg0CD99/SUXMAZoO2V6X8MFoY
 0aURTQ2tlzc4gzqPx42JbXXjiuJNl72prAdSts+wrVL2udRt9LIPNR966K5Jaxr0crxa
 1AWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1lFwndVHov/RzOPqSUZJ9434t/t6x+foxuiqxo1V074=;
 b=M8rMOOz3i0Dwb40GcOq0/XVmYrLgHvNfmzhyvsTKbLIv9OXt1Lk6QZ/VsJekzkEw3b
 eyTTOy8j/TvD19rEbYF+/kEUzZmlEw2M3qvuc3gEEiFeeF9w/2tPT0ciGnKl1hM52FMf
 7xUVsnWnGQ+lJeaiJtkIghBD38eqKkanNvkvFMZY3rfGW72mcD+Ml6mjQKMOsRpWUWMv
 +X2BO3W9v/4MrA7HpfdRXDTZAYVVKnjfL/zfUTnowMFQ6Z9SUc3iAmun+ut4lwpEwrHl
 GK5FRIWfSMNNv80dLshFEM8hHC9A+pd7vbqhGMHkjdNf7//lYwT37g/63LugQuv+6oFS
 cmdQ==
X-Gm-Message-State: APjAAAV1Dhu/hYshnWVg1377vVUYptHtZym0/j8ljU2PAFu4mIu7u0BA
 +knSiBqXU2d1YCypRdG6z6okQuVO3eL25GLbhpba3w==
X-Google-Smtp-Source: APXvYqx6hyZDnWHUWsmUyXDTjzJUvLvBG7avnM2nt2EqMTfGe7bn+nDEXOwN/BdWmS0lmPoXm/5L4iPkzqLb3gXpMpM=
X-Received: by 2002:a2e:8e70:: with SMTP id t16mr11200922ljk.73.1580273608316; 
 Tue, 28 Jan 2020 20:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20200128135749.822297911@linuxfoundation.org>
In-Reply-To: <20200128135749.822297911@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 29 Jan 2020 10:23:17 +0530
Message-ID: <CA+G9fYsnSGw0NmV5hWwZSs5OYu18YRam3jYCsg4Sn+KUQJSMWw@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4.14 00/46] 4.14.169-stable review
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

T24gVHVlLCAyOCBKYW4gMjAyMCBhdCAxOToyOCwgR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGlzIHRoZSBzdGFydCBvZiB0aGUg
c3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDQuMTQuMTY5IHJlbGVhc2UuCj4gVGhlcmUgYXJl
IDQ2IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIGFsbCB3aWxsIGJlIHBvc3RlZCBhcyBhIHJlc3Bv
bnNlCj4gdG8gdGhpcyBvbmUuICBJZiBhbnlvbmUgaGFzIGFueSBpc3N1ZXMgd2l0aCB0aGVzZSBi
ZWluZyBhcHBsaWVkLCBwbGVhc2UKPiBsZXQgbWUga25vdy4KPgo+IFJlc3BvbnNlcyBzaG91bGQg
YmUgbWFkZSBieSBUaHUsIDMwIEphbiAyMDIwIDEzOjU3OjA5ICswMDAwLgo+IEFueXRoaW5nIHJl
Y2VpdmVkIGFmdGVyIHRoYXQgdGltZSBtaWdodCBiZSB0b28gbGF0ZS4KPgo+IFRoZSB3aG9sZSBw
YXRjaCBzZXJpZXMgY2FuIGJlIGZvdW5kIGluIG9uZSBwYXRjaCBhdDoKPiAgICAgICAgIGh0dHBz
Oi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5lbC92NC54L3N0YWJsZS1yZXZpZXcvcGF0
Y2gtNC4xNC4xNjktcmMxLmd6Cj4gb3IgaW4gdGhlIGdpdCB0cmVlIGFuZCBicmFuY2ggYXQ6Cj4g
ICAgICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3Rh
YmxlL2xpbnV4LXN0YWJsZS1yYy5naXQgbGludXgtNC4xNC55Cj4gYW5kIHRoZSBkaWZmc3RhdCBj
YW4gYmUgZm91bmQgYmVsb3cuCj4KPiB0aGFua3MsCj4KPiBncmVnIGstaAoKUmVzdWx0cyBmcm9t
IExpbmFyb+KAmXMgdGVzdCBmYXJtLgpObyByZWdyZXNzaW9ucyBvbiBhcm02NCwgYXJtLCB4ODZf
NjQsIGFuZCBpMzg2LgoKTk9URToKTFRQIGZzIHRlc3QgcmVhZF9hbGxfcHJvYyBmYWlscyBpbnRl
cm1pdHRlbnRseSBvbiA0LjkgYW5kIDQuMTQgYnJhbmNoZXMuCgpTdW1tYXJ5Ci0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQoKa2VybmVsOiA0LjE0LjE2OS1yYzEKZ2l0IHJlcG86IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0Cmdp
dCBicmFuY2g6IGxpbnV4LTQuMTQueQpnaXQgY29tbWl0OiA1OTg2YTc5YWUyODQyMWQ3MDI3Y2I0
YWI3OGZiYTdkNzg3YTlmMDZlCmdpdCBkZXNjcmliZTogdjQuMTQuMTY4LTQ3LWc1OTg2YTc5YWUy
ODQKVGVzdCBkZXRhaWxzOiBodHRwczovL3FhLXJlcG9ydHMubGluYXJvLm9yZy9sa2Z0L2xpbnV4
LXN0YWJsZS1yYy00LjE0LW9lL2J1aWxkL3Y0LjE0LjE2OC00Ny1nNTk4NmE3OWFlMjg0CgpObyBy
ZWdyZXNzaW9ucyAoY29tcGFyZWQgdG8gYnVpbGQgdjQuMTQuMTY4KQoKTm8gZml4ZXMgKGNvbXBh
cmVkIHRvIGJ1aWxkIHY0LjE0LjE2OCkKClJhbiAyNDIyMSB0b3RhbCB0ZXN0cyBpbiB0aGUgZm9s
bG93aW5nIGVudmlyb25tZW50cyBhbmQgdGVzdCBzdWl0ZXMuCgpFbnZpcm9ubWVudHMKLS0tLS0t
LS0tLS0tLS0KLSBkcmFnb25ib2FyZC00MTBjIC0gYXJtNjQKLSBoaTYyMjAtaGlrZXkgLSBhcm02
NAotIGkzODYKLSBqdW5vLXIyIC0gYXJtNjQKLSBxZW11X2FybQotIHFlbXVfYXJtNjQKLSBxZW11
X2kzODYKLSBxZW11X3g4Nl82NAotIHgxNSAtIGFybQotIHg4Nl82NAoKVGVzdCBTdWl0ZXMKLS0t
LS0tLS0tLS0KKiBidWlsZAoqIGluc3RhbGwtYW5kcm9pZC1wbGF0Zm9ybS10b29scy1yMjYwMAoq
IGtzZWxmdGVzdAoqIGxpYmh1Z2V0bGJmcwoqIGxpbnV4LWxvZy1wYXJzZXIKKiBsdHAtY2FwX2Jv
dW5kcy10ZXN0cwoqIGx0cC1jb21tYW5kcy10ZXN0cwoqIGx0cC1jb250YWluZXJzLXRlc3RzCiog
bHRwLWNwdWhvdHBsdWctdGVzdHMKKiBsdHAtY3ZlLXRlc3RzCiogbHRwLWRpby10ZXN0cwoqIGx0
cC1mY250bC1sb2NrdGVzdHMtdGVzdHMKKiBsdHAtZmlsZWNhcHMtdGVzdHMKKiBsdHAtZnMtdGVz
dHMKKiBsdHAtZnNfYmluZC10ZXN0cwoqIGx0cC1mc19wZXJtc19zaW1wbGUtdGVzdHMKKiBsdHAt
ZnN4LXRlc3RzCiogbHRwLWh1Z2V0bGItdGVzdHMKKiBsdHAtaW8tdGVzdHMKKiBsdHAtaXBjLXRl
c3RzCiogbHRwLW1hdGgtdGVzdHMKKiBsdHAtbW0tdGVzdHMKKiBsdHAtbnB0bC10ZXN0cwoqIGx0
cC1wdHktdGVzdHMKKiBsdHAtc2NoZWQtdGVzdHMKKiBsdHAtc2VjdXJlYml0cy10ZXN0cwoqIGx0
cC1zeXNjYWxscy10ZXN0cwoqIHBlcmYKKiBzcGVjdHJlLW1lbHRkb3duLWNoZWNrZXItdGVzdAoq
IHY0bDItY29tcGxpYW5jZQoqIG5ldHdvcmstYmFzaWMtdGVzdHMKKiBsdHAtb3Blbi1wb3NpeC10
ZXN0cwoqIGt2bS11bml0LXRlc3RzCiogc3N1aXRlCioga3NlbGZ0ZXN0LXZzeXNjYWxsLW1vZGUt
bmF0aXZlCioga3NlbGZ0ZXN0LXZzeXNjYWxsLW1vZGUtbm9uZQoKLS0gCkxpbmFybyBMS0ZUCmh0
dHBzOi8vbGtmdC5saW5hcm8ub3JnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
