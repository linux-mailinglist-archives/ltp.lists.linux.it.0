Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 753171B10C
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 09:16:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C3BF294AAB
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 09:16:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 76E98294A36
 for <ltp@lists.linux.it>; Mon, 13 May 2019 09:16:19 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 76DC31A01062
 for <ltp@lists.linux.it>; Mon, 13 May 2019 09:16:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F3B359468;
 Mon, 13 May 2019 07:16:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 422346A97C;
 Mon, 13 May 2019 07:16:14 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DF474A460;
 Mon, 13 May 2019 07:16:14 +0000 (UTC)
Date: Mon, 13 May 2019 03:16:11 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <1723398651.22256606.1557731771283.JavaMail.zimbra@redhat.com>
In-Reply-To: <CA+G9fYuLXPnCmpnnLqBf5qinV6wrFx=HBH2KrB8s1HmCxLM=Zw@mail.gmail.com>
References: <CA+G9fYuLXPnCmpnnLqBf5qinV6wrFx=HBH2KrB8s1HmCxLM=Zw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.10]
Thread-Topic: Syscalls: 274 failures: EROFS(30): Read-only file system
Thread-Index: Ri+tISUlAesZ3Gqs2tjZJaP6m7aQdg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 13 May 2019 07:16:14 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: lkft-triage@lists.linaro.org, ltp@lists.linux.it
Subject: Re: [LTP] LTP: Syscalls: 274 failures: EROFS(30): Read-only file
	system
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gV2UgaGF2ZSBub3RpY2VkIDI3NCBzeXNj
YWxsIHRlc3QgZmFpbHVyZXMgb24geDg2XzY0IGFuZCBpMzg2IGR1ZSB0bwo+IE1ha2UgdGhlIHRl
bXBvcmFyeSBkaXJlY3RvcnkgaW4gb25lIHNob3QgdXNpbmcgbWtkdGVtcCBmYWlsZWQuCj4gdHN0
X3RtcGRpci5jOjI2NDogQlJPSzogdHN0X3RtcGRpcjoKPiBta2R0ZW1wKC9zY3JhdGNoL2x0cC03
RDh2QWNZZUZHL09YdXF1SikgZmFpbGVkOiBFUk9GUwoKTG9va3MgbGlrZSBleHQ0IGJ1ZzoKClsg
MTkxNi4wMzIwODddIEVYVDQtZnMgZXJyb3IgKGRldmljZSBzZGEpOiBleHQ0X2ZpbmRfZXh0ZW50
OjkwOTogaW5vZGUgIzg6IGNvbW0gamJkMi9zZGEtODogcGJsayAxMjE2Njc1ODMgYmFkIGhlYWRl
ci9leHRlbnQ6IGludmFsaWQgZXh0ZW50IGVudHJpZXMgLSBtYWdpYyBmMzBhLCBlbnRyaWVzIDgs
IG1heCAzNDAoMzQwKSwgZGVwdGggMCgwKQpbIDE5MTYuMDczODQwXSBqYmQyX2pvdXJuYWxfYm1h
cDogam91cm5hbCBibG9jayBub3QgZm91bmQgYXQgb2Zmc2V0IDQ0NTUgb24gc2RhLTgKWyAxOTE2
LjA4MTA3MV0gQWJvcnRpbmcgam91cm5hbCBvbiBkZXZpY2Ugc2RhLTguClsgMTkxNi4zNDg2NTJd
IEVYVDQtZnMgZXJyb3IgKGRldmljZSBzZGEpOiBleHQ0X2pvdXJuYWxfY2hlY2tfc3RhcnQ6NjE6
IERldGVjdGVkIGFib3J0ZWQgam91cm5hbApbIDE5MTYuMzU3MjIyXSBFWFQ0LWZzIChzZGEpOiBS
ZW1vdW50aW5nIGZpbGVzeXN0ZW0gcmVhZC1vbmx5CgpTbyBiZXN0IHBsYWNlIGZvciByZXBvcnQg
aXMgbGlrZWx5IGxpbnV4LWV4dDRAdmdlci5rZXJuZWwub3JnCgo+IAo+IEZhaWxlZCBsb2c6Cj4g
LS0tLS0tLS0tLS0tCj4gcHJlYWQwMSAgICAgMSAgVEJST0sgIDogIHRzdF90bXBkaXIuYzoyNjQ6
IHRzdF90bXBkaXI6Cj4gbWtkdGVtcCgvc2NyYXRjaC9sdHAtN0Q4dkFjWWVGRy9wcmVBVXZYQUUp
IGZhaWxlZDogZXJybm89RVJPRlMoMzApOgo+IFJlYWQtb25seSBmaWxlIHN5c3RlbQo+IHByZWFk
MDEgICAgIDIgIFRCUk9LICA6ICB0c3RfdG1wZGlyLmM6MjY0OiBSZW1haW5pbmcgY2FzZXMgYnJv
a2VuCj4gCj4gZnVsbCB0ZXN0IGxvZywKPiAtLS0tLS0tLS0tLS0tLQo+IGh0dHBzOi8vbGtmdC52
YWxpZGF0aW9uLmxpbmFyby5vcmcvc2NoZWR1bGVyL2pvYi83MTE4MjYjTDc4MzQKPiAKPiBMVFAg
VmVyc2lvbjogMjAxOTAxMTUKPiAKPiBLZXJuZWwgYmFkIGNvbW1pdDoKPiAtLS0tLS0tLS0tLS0K
PiBnaXQgYnJhbmNoIG1hc3Rlcgo+IGdpdCBjb21taXQgZGQ1MDAxZTIxYTk5MWI3MzFkNjU5ODU3
Y2QwN2FjYzdhMTNlNjc4OQo+IGdpdCBkZXNjcmliZSB2NS4xLTM0ODYtZ2RkNTAwMWUyMWE5OQo+
IGdpdCByZXBvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdAo+IAo+IEtlcm5lbCBnb29kIGNvbW1pdDoKPiAtLS0tLS0tLS0t
LS0KPiBnaXQgYnJhbmNoIG1hc3Rlcgo+IGdpdCBjb21taXQgZDM1MTFmNTNiYjI0NzVmMmE0ZTg0
NjBiZWU1YTFhZTZkZWEyYTQzMwo+IGdpdCBkZXNjcmliZSB2NS4xLTMzODUtZ2QzNTExZjUzYmIy
NAo+IGdpdCByZXBvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdAo+IAo+IEJlc3QgcmVnYXJkcwo+IE5hcmVzaCBLYW1ib2p1
Cj4gCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
