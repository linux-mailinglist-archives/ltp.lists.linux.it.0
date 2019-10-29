Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4846AE81E8
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 08:16:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDA783C233E
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 08:16:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A5BEE3C1CED
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 08:16:07 +0100 (CET)
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 666C71400F9D
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 08:16:06 +0100 (CET)
Received: by mail-lf1-x144.google.com with SMTP id j14so4754110lfb.8
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 00:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l276QuAtSp3Hos0lCYccY4XpvMkVxXX0RdmbHt48ywg=;
 b=srVTGJ8SX+LbAxa40BtUDs13Y5wPHPKaIL9iylymE51cWXq3w8/2T1JdaA+WZoY7i2
 Pcf9WoHywLTu90AwOhYIana1/x+/agZWTTETL3DSWkQwoqWpbMCsLDk0B6KJ+2shrqpU
 2yO3XZmlqhIaIB2gyJlBori2p8JioVw39lGr789iiNrvcu6aI1+r08vTrhXJFPNfPqJi
 L9meNqg/nQLi7KyHMGMCpuN5WCeUs56XDDPd9GFpOe7+BcXC/t6VicPVJ64qMM+hGoLp
 HBqPvrlpbl0Vy5QyccTP/N2TbDAeCm87f5DyE5j/7fr904BjAvJEX/C2+04J2Ahuukwb
 sCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l276QuAtSp3Hos0lCYccY4XpvMkVxXX0RdmbHt48ywg=;
 b=RYDwJ+SkjnJJq9fRR54Vv7Cs78X6c59Kp25Ahc7v+OZVncdJdm+mNjsaDmYrUsAQ8B
 W/k3yNyWmZ0StV9lSvlcR95TJ5JBF7d6EUn9M1Ui4+YfukE6PTSdDgWfc+kGNW2OdbHX
 0JpqGv0meHbyDcVzuej2t56jclZbX1fiWi0/2DFUpcNgZpe6mbthqr7Kani0N/qeOdks
 mwHMC18u1JRX8N87ILZZ3kOS45C8epOQBF8vkmMEr+fRIwKEVoZAGN+cxgd6uUd0Z7v9
 X5z1wJheY7gsd04q4R8+ljYtpDSXE9yH+HhRgHNx1/WkOC3XWzKaSFYtqD+YsGJYpUBz
 YOPg==
X-Gm-Message-State: APjAAAXYurAc+YLUBcooQ/mDuy1VEavQFOkGh68Q4v1mJ9fIYgUYC0SC
 2NEfUajcNMHWwLoVdPixz4G00yKs2/9o04fUhooBJA==
X-Google-Smtp-Source: APXvYqy2HqUmOhrSFK6XoAgiSK7lUkNA4wd7unmVEpk6hCNXL0NUfVT1uiGWkDmVmSXlEcoiiWS8xddMLzDzX+2okcI=
X-Received: by 2002:a19:3f0a:: with SMTP id m10mr1245555lfa.67.1572333365605; 
 Tue, 29 Oct 2019 00:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191027203259.948006506@linuxfoundation.org>
In-Reply-To: <20191027203259.948006506@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 29 Oct 2019 12:45:53 +0530
Message-ID: <CA+G9fYvGEEjnf0paJLS7UDJt0hJg8G+MOD+7hPdyyORVnGkoDw@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4.14 000/119] 4.14.151-stable review
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
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, patches@kernelci.org,
 lkft-triage@lists.linaro.org, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gTW9uLCAyOCBPY3QgMjAxOSBhdCAwMjozOCwgR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGlzIHRoZSBzdGFydCBvZiB0aGUg
c3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDQuMTQuMTUxIHJlbGVhc2UuCj4gVGhlcmUgYXJl
IDExOSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzLCBhbGwgd2lsbCBiZSBwb3N0ZWQgYXMgYSByZXNw
b25zZQo+IHRvIHRoaXMgb25lLiAgSWYgYW55b25lIGhhcyBhbnkgaXNzdWVzIHdpdGggdGhlc2Ug
YmVpbmcgYXBwbGllZCwgcGxlYXNlCj4gbGV0IG1lIGtub3cuCj4KPiBSZXNwb25zZXMgc2hvdWxk
IGJlIG1hZGUgYnkgVHVlIDI5IE9jdCAyMDE5IDA4OjI3OjAyIFBNIFVUQy4KPiBBbnl0aGluZyBy
ZWNlaXZlZCBhZnRlciB0aGF0IHRpbWUgbWlnaHQgYmUgdG9vIGxhdGUuCj4KPiBUaGUgd2hvbGUg
cGF0Y2ggc2VyaWVzIGNhbiBiZSBmb3VuZCBpbiBvbmUgcGF0Y2ggYXQ6Cj4gICAgICAgICBodHRw
czovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjQueC9zdGFibGUtcmV2aWV3L3Bh
dGNoLTQuMTQuMTUxLXJjMS5nego+IG9yIGluIHRoZSBnaXQgdHJlZSBhbmQgYnJhbmNoIGF0Ogo+
ICAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0
YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0IGxpbnV4LTQuMTQueQo+IGFuZCB0aGUgZGlmZnN0YXQg
Y2FuIGJlIGZvdW5kIGJlbG93Lgo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKClJlc3VsdHMgZnJv
bSBMaW5hcm/igJlzIHRlc3QgZmFybS4KTm8gcmVncmVzc2lvbnMgb24gYXJtNjQsIGFybSwgeDg2
XzY0LCBhbmQgaTM4Ni4KCk5vdGU6ClRoZSBuZXcgdGVzdCBjYXNlICBmcm9tIExUUCB2ZXJzaW9u
IHVwZ3JhZGUgc3lzY2FsbHMgc3luY19maWxlX3JhbmdlMDIgaXMgYW4KaW50ZXJtaXR0ZW50IGZh
aWx1cmUuIFdlIGFyZSBpbnZlc3RpZ2F0aW5nIHRoaXMgY2FzZS4KVGhlIGxpc3RlZCBmaXhlcyBp
biB0aGUgYmVsb3cgc2VjdGlvbiBhcmUgZHVlIHRvIExUUCB1cGdyYWRlIHRvIHYyMDE5MDkzMC4K
ClN1bW1hcnkKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgprZXJuZWw6IDQuMTQuMTUxLXJjMgpnaXQgcmVwbzog
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xp
bnV4LXN0YWJsZS1yYy5naXQKZ2l0IGJyYW5jaDogbGludXgtNC4xNC55CmdpdCBjb21taXQ6IDgw
MTE3OTg1ZGUwNjM1YzhkN2ZhNThmYTE5OGI3YmJiZDQ2NTU0MmQKZ2l0IGRlc2NyaWJlOiB2NC4x
NC4xNTAtMTE4LWc4MDExNzk4NWRlMDYKVGVzdCBkZXRhaWxzOiBodHRwczovL3FhLXJlcG9ydHMu
bGluYXJvLm9yZy9sa2Z0L2xpbnV4LXN0YWJsZS1yYy00LjE0LW9lL2J1aWxkL3Y0LjE0LjE1MC0x
MTgtZzgwMTE3OTg1ZGUwNgoKTm8gcmVncmVzc2lvbnMgKGNvbXBhcmVkIHRvIGJ1aWxkIHY0LjE0
LjE0OS02Ni1nNjZmNjkxODRkNzIyKQoKCkZpeGVzIChjb21wYXJlZCB0byBidWlsZCB2NC4xNC4x
NDktNjYtZzY2ZjY5MTg0ZDcyMikKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpsdHAtc3lzY2FsbHMtdGVzdHM6
CiAgICAqIHVzdGF0MDIKICAgICogaW9jdGxfbnMwNQogICAgKiBpb2N0bF9uczA2CgpSYW4gMTcz
NjQgdG90YWwgdGVzdHMgaW4gdGhlIGZvbGxvd2luZyBlbnZpcm9ubWVudHMgYW5kIHRlc3Qgc3Vp
dGVzLgoKRW52aXJvbm1lbnRzCi0tLS0tLS0tLS0tLS0tCi0gZHJhZ29uYm9hcmQtNDEwYyAtIGFy
bTY0Ci0gaGk2MjIwLWhpa2V5IC0gYXJtNjQKLSBpMzg2Ci0ganVuby1yMiAtIGFybTY0Ci0gcWVt
dV9hcm0KLSBxZW11X2FybTY0Ci0gcWVtdV9pMzg2Ci0gcWVtdV94ODZfNjQKLSB4MTUgLSBhcm0K
LSB4ODZfNjQKClRlc3QgU3VpdGVzCi0tLS0tLS0tLS0tCiogYnVpbGQKKiBpbnN0YWxsLWFuZHJv
aWQtcGxhdGZvcm0tdG9vbHMtcjI2MDAKKiBrc2VsZnRlc3QKKiBsaWJodWdldGxiZnMKKiBsdHAt
Y2FwX2JvdW5kcy10ZXN0cwoqIGx0cC1jb21tYW5kcy10ZXN0cwoqIGx0cC1jb250YWluZXJzLXRl
c3RzCiogbHRwLWNwdWhvdHBsdWctdGVzdHMKKiBsdHAtY3ZlLXRlc3RzCiogbHRwLWRpby10ZXN0
cwoqIGx0cC1mY250bC1sb2NrdGVzdHMtdGVzdHMKKiBsdHAtZmlsZWNhcHMtdGVzdHMKKiBsdHAt
ZnMtdGVzdHMKKiBsdHAtZnNfYmluZC10ZXN0cwoqIGx0cC1mc19wZXJtc19zaW1wbGUtdGVzdHMK
KiBsdHAtZnN4LXRlc3RzCiogbHRwLWh1Z2V0bGItdGVzdHMKKiBsdHAtaW8tdGVzdHMKKiBsdHAt
aXBjLXRlc3RzCiogbHRwLW1hdGgtdGVzdHMKKiBsdHAtbW0tdGVzdHMKKiBsdHAtbnB0bC10ZXN0
cwoqIGx0cC1wdHktdGVzdHMKKiBsdHAtc2NoZWQtdGVzdHMKKiBsdHAtc2VjdXJlYml0cy10ZXN0
cwoqIGx0cC1zeXNjYWxscy10ZXN0cwoqIHBlcmYKKiBzcGVjdHJlLW1lbHRkb3duLWNoZWNrZXIt
dGVzdAoqIHY0bDItY29tcGxpYW5jZQoqIG5ldHdvcmstYmFzaWMtdGVzdHMKKiBsdHAtb3Blbi1w
b3NpeC10ZXN0cwoqIHNzdWl0ZQoqIGtzZWxmdGVzdC12c3lzY2FsbC1tb2RlLW5hdGl2ZQoqIGtz
ZWxmdGVzdC12c3lzY2FsbC1tb2RlLW5vbmUKKiBrdm0tdW5pdC10ZXN0cwoKLS0gCkxpbmFybyBM
S0ZUCmh0dHBzOi8vbGtmdC5saW5hcm8ub3JnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
