Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CBE25D4B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 07:05:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E480F3EA406
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 07:05:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7E3F23EA195
 for <ltp@lists.linux.it>; Wed, 22 May 2019 07:05:36 +0200 (CEST)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B27C214010E2
 for <ltp@lists.linux.it>; Wed, 22 May 2019 07:05:34 +0200 (CEST)
Received: from callcc.thunk.org ([66.31.38.53]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x4M55BVA020853
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 May 2019 01:05:12 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 61574420481; Wed, 22 May 2019 01:05:11 -0400 (EDT)
Date: Wed, 22 May 2019 01:05:11 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20190522050511.GB4943@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Shuah Khan <shuah@kernel.org>,
 patches@kernelci.org, Ben Hutchings <ben.hutchings@codethink.co.uk>,
 lkft-triage@lists.linaro.org,
 linux- stable <stable@vger.kernel.org>, linux-ext4@vger.kernel.org,
 Arthur Marsh <arthur.marsh@internode.on.net>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 ltp@lists.linux.it, Jan Stancek <jstancek@redhat.com>
References: <20190520115247.060821231@linuxfoundation.org>
 <20190520222342.wtsjx227c6qbkuua@xps.therub.org>
 <20190521085956.GC31445@kroah.com>
 <CA+G9fYvHmUimtwszwo=9fDQLn+MNh8Vq3UGPaPUdhH=dEKzqxg@mail.gmail.com>
 <20190521093849.GA9806@kroah.com>
 <CA+G9fYveeg_FMsL31aunJ2A9XLYk908Y1nSFw4kwkFk3h3uEiA@mail.gmail.com>
 <20190521162142.GA2591@mit.edu>
 <CA+G9fYunxonkqmkhz+zmZYuMTfyRMVBxn6PkTFfjd8tTT+bzHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYunxonkqmkhz+zmZYuMTfyRMVBxn6PkTFfjd8tTT+bzHQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ltp@lists.linux.it,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Arthur Marsh <arthur.marsh@internode.on.net>,
 linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [LTP] ext4 regression (was Re: [PATCH 4.19 000/105]
 4.19.45-stable review)
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

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTE6Mjc6MjFQTSArMDUzMCwgTmFyZXNoIEthbWJvanUg
d3JvdGU6Cj4gU3RlcHMgdG8gcmVwcm9kdWNlIGlzLAo+IHJ1bm5pbmcgTFRQIHRocmVlIHRlc3Qg
Y2FzZXMgaW4gc2VxdWVuY2Ugb24geDg2IGRldmljZS4KPiAjIGNkIGx0cC9ydW50ZXN0Cj4gIyBj
YXQgc3lzY2FsbHMgKCBvbmx5IHRocmVlIHRlc3QgY2FzZSkKPiBvcGVuMTIgb3BlbjEyCj4gbWFk
dmlzZTA2IG1hZHZpc2UwNgo+IHBvbGwwMiBwb2xsMDIKPiAjCj4gCj4gYXMgRGFuIHJlZmVycmlu
ZyB0bywKPiAKPiBMVFAgaXMgcnVuIHVzaW5nICcvb3B0L2x0cC9ydW5sdHAgLWQgL3NjcmF0Y2gg
LWYgc3lzY2FsbHMnLCB3aGVyZSB0aGUKPiBzeXNjYWxscyBmaWxlIGhhcyBiZWVuIHJlcGxhY2Vk
IHdpdGggdGhyZWUgdGVzdCBjYXNlIG5hbWVzLCBhbmQKPiAvc2NyYXRjaCBpcyBhbiBleHQ0IFNB
VEEgZHJpdmUuIC9zY3JhdGNoIGlzIGNyZWF0ZWQgdXNpbmcgJ21rZnMgLXQgZXh0NAo+IC9kZXYv
ZGlzay9ieS1pZC9hdGEtVE9TSElCQV9NRzAzQUNBMTAwXzM3TzlLR0tXRicgYW5kIG1vdW50ZWQg
dG8KPiAvc2NyYXRjaC4KCkknbSBzdGlsbCBoYXZpbmcgdHJvdWJsZSByZXByb2R1Y2luZyB0aGUg
cHJvYmxlbS4gIEkndmUgZm9sbG93ZWQgdGhlCmFib3ZlIGV4YWN0bHksIGFuZCBpdCBkb2Vzbid0
IHRyaWdnZXIgb24gbXkgc3lzdGVtLiAgSSB0aGluayBJIGtub3cKd2hhdCBpcyBoYXBwZW5pbmcs
IGJ1dCBldmVuIGdpdmVuIG15IHRoZW9yeSwgSSdtIHN0aWxsIG5vdCBhYmxlIHRvCnRyaWdnZXIg
aXQuICBTbywgSSdtIG5vdCAxMDAlIHN1cmUgdGhpcyBpcyB0aGUgYXBwcm9wcmlhdGUgZml4LiAg
SWYKeW91IGNhbiByZXByb2R1Y2UgaXQsIGNhbiB5b3Ugc2VlIGlmIHRoaXMgcGF0Y2gsIGFwcGxp
ZWQgb24gdG9wIG9mIHRoZQpMaW51cydzIHRpcCwgZml4ZXMgdGhlIHByb2JsZW0gZm9yIHlvdT8K
CgkJCQkJLSBUZWQKCmNvbW1pdCAzYWQ3NjIxYmZmZjM0M2IxNmQ1OWVkNDE4ZjZkNDQyMGQ0ZWMz
ZTYzCkF1dGhvcjogVGhlb2RvcmUgVHMnbyA8dHl0c29AbWl0LmVkdT4KRGF0ZTogICBUdWUgTWF5
IDIxIDE3OjAxOjAxIDIwMTkgLTA0MDAKCiAgICBleHQ0OiBkb24ndCBwZXJmb3JtIGJsb2NrIHZh
bGlkaXR5IGNoZWNrcyBvbiB0aGUgam91cm5hbCBpbm9kZQogICAgCiAgICBTaW5jZSB0aGUgam91
cm5hbCBpbm9kZSBpcyBhbHJlYWR5IGNoZWNrZWQgd2hlbiB3ZSBhZGRlZCBpdCB0byB0aGUKICAg
IGJsb2NrIHZhbGlkaXR5J3Mgc3lzdGVtIHpvbmUsIGlmIHdlIGNoZWNrIGl0IGFnYWluLCB3ZSds
bCBqdXN0IHRyaWdnZXIKICAgIGEgZmFpbHVyZS4KICAgIAogICAgVGhpcyB3YXMgY2F1c2luZyBm
YWlsdXJlcyBsaWtlIHRoaXM6CiAgICAKICAgIFsgICA1My44OTcwMDFdIEVYVDQtZnMgZXJyb3Ig
KGRldmljZSBzZGEpOiBleHQ0X2ZpbmRfZXh0ZW50OjkwOTogaW5vZGUKICAgICM4OiBjb21tIGpi
ZDIvc2RhLTg6IHBibGsgMTIxNjY3NTgzIGJhZCBoZWFkZXIvZXh0ZW50OiBpbnZhbGlkIGV4dGVu
dCBlbnRyaWVzIC0gbWFnaWMgZjMwYSwgZW50cmllcyA4LCBtYXggMzQwKDM0MCksIGRlcHRoIDAo
MCkKICAgIFsgICA1My45MzE0MzBdIGpiZDJfam91cm5hbF9ibWFwOiBqb3VybmFsIGJsb2NrIG5v
dCBmb3VuZCBhdCBvZmZzZXQgNDkgb24gc2RhLTgKICAgIFsgICA1My45Mzg0ODBdIEFib3J0aW5n
IGpvdXJuYWwgb24gZGV2aWNlIHNkYS04LgogICAgCiAgICAuLi4gYnV0IG9ubHkgaWYgdGhlIHN5
c3RlbSB3YXMgdW5kZXIgZW5vdWdoIG1lbW9yeSBwcmVzc3VyZSB0aGF0CiAgICBsb2dpY2FsLT5w
aHlzaWNhbCBtYXBwaW5nIGZvciB0aGUgam91cm5hbCBpbm9kZSBnZXRzIHB1c2hlZCBvdXQgb2Yg
dGhlCiAgICBleHRlbnQgY2FjaGUuICAoVGhpcyBpcyB3aHkgaXQgd2Fzbid0IG5vdGljZWQgZWFy
bGllci4pCiAgICAKICAgIEZpeGVzOiAzNDVjMGRiZjNhMzAgKCJleHQ0OiBwcm90ZWN0IGpvdXJu
YWwgaW5vZGUncyBibG9ja3MgdXNpbmcgYmxvY2tfdmFsaWRpdHkiKQogICAgUmVwb3J0ZWQtYnk6
IERhbiBSdWUgPGRhbi5ydWVAbGluYXJvLm9yZz4KICAgIFNpZ25lZC1vZmYtYnk6IFRoZW9kb3Jl
IFRzJ28gPHR5dHNvQG1pdC5lZHU+CgpkaWZmIC0tZ2l0IGEvZnMvZXh0NC9leHRlbnRzLmMgYi9m
cy9leHQ0L2V4dGVudHMuYwppbmRleCBmMmM2MmUyYTBjOTguLmQ0MGVkOTQwMDAxZSAxMDA2NDQK
LS0tIGEvZnMvZXh0NC9leHRlbnRzLmMKKysrIGIvZnMvZXh0NC9leHRlbnRzLmMKQEAgLTUxOCwx
MCArNTE4LDE0IEBAIF9fcmVhZF9leHRlbnRfdHJlZV9ibG9jayhjb25zdCBjaGFyICpmdW5jdGlv
biwgdW5zaWduZWQgaW50IGxpbmUsCiAJfQogCWlmIChidWZmZXJfdmVyaWZpZWQoYmgpICYmICEo
ZmxhZ3MgJiBFWFQ0X0VYX0ZPUkNFX0NBQ0hFKSkKIAkJcmV0dXJuIGJoOwotCWVyciA9IF9fZXh0
NF9leHRfY2hlY2soZnVuY3Rpb24sIGxpbmUsIGlub2RlLAotCQkJICAgICAgIGV4dF9ibG9ja19o
ZHIoYmgpLCBkZXB0aCwgcGJsayk7Ci0JaWYgKGVycikKLQkJZ290byBlcnJvdXQ7CisJaWYgKCFl
eHQ0X2hhc19mZWF0dXJlX2pvdXJuYWwoaW5vZGUtPmlfc2IpIHx8CisJICAgIChpbm9kZS0+aV9p
bm8gIT0KKwkgICAgIGxlMzJfdG9fY3B1KEVYVDRfU0IoaW5vZGUtPmlfc2IpLT5zX2VzLT5zX2pv
dXJuYWxfaW51bSkpKSB7CisJCWVyciA9IF9fZXh0NF9leHRfY2hlY2soZnVuY3Rpb24sIGxpbmUs
IGlub2RlLAorCQkJCSAgICAgICBleHRfYmxvY2tfaGRyKGJoKSwgZGVwdGgsIHBibGspOworCQlp
ZiAoZXJyKQorCQkJZ290byBlcnJvdXQ7CisJfQogCXNldF9idWZmZXJfdmVyaWZpZWQoYmgpOwog
CS8qCiAJICogSWYgdGhpcyBpcyBhIGxlYWYgYmxvY2ssIGNhY2hlIGFsbCBvZiBpdHMgZW50cmll
cwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
