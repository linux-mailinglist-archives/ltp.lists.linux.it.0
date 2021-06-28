Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 350AB3B59D9
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 09:36:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04EA13C6D34
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 09:36:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2A53E3C149E
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 09:36:16 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 65F7C20096B
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 09:36:15 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 784B69FB86;
 Mon, 28 Jun 2021 07:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1624865773; bh=wvDGnMBOwnzy+cEm3s7jzPYfEkbbur9TR3c5DNDDLbU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=Il0iSG/8sba3za7xZv8L6EQpc2gku+176k8EYN/Vpzbu9rJiUs2kTm504cI9w+x/l
 FhzUO9u1R8vE/JNl4gCCupDnyNXo6nZEI620ahpb8f89xDq4PuLfHuwiZrj9efWSm/
 KIYq9zPAutj9cHzXJZM418be8LfcEREwm+Q1YkEE=
To: Leo Liang <ycliang@andestech.com>, ltp@lists.linux.it
References: <20210628033002.GA1469@andestech.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <caf1bb46-5212-3c3d-f180-e722ef2cf8dd@jv-coder.de>
Date: Mon, 28 Jun 2021 09:36:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628033002.GA1469@andestech.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount
 failure
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
Cc: richiejp@f-m.fm, metan@ucw.cz, alankao@andestech.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpPbiA2LzI4LzIwMjEgNTozMCBBTSwgTGVvIExpYW5nIHdyb3RlOgo+ICBGcm9tIGExNTFk
NDgyMzU2MjlhMTI1ZDVkYjU3ZGQ3NmM5NmZkOTUxZDUyOTMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gRnJvbTogTGVvIFl1LUNoaSBMaWFuZyA8eWNsaWFuZ0BhbmRlc3RlY2guY29tPgo+IERh
dGU6IE1vbiwgMjggSnVuIDIwMjEgMTE6MDU6NTQgKzA4MDAKPiBTdWJqZWN0OiBbUEFUQ0ggMS8x
XSBjZ3JvdXAvY2dyb3VwX3JlZ3Jlc3Npb25fdGVzdDogRml4IHVtb3VudCBmYWlsdXJlCj4KPiBU
aGUgdGVzdCBzZXF1ZW5jZQo+IAltb3VudCAtdCBjZ3JvdXAgLW8gPGNvbnRyb2xsZXJzPiA8cGF0
aD4KPiAJbWtkaXIgPHBhdGg+LzxkaXI+Cj4gCXJtZGlyIDxwYXRoPi88ZGlyPgo+IAl1bW91bnQg
PHBhdGg+Cj4gCW1vdW50IC10IGNncm91cCAtbyA8Y29udHJvbGxlcnM+IDxwYXRoPgo+IHdvdWxk
IGVhc2lseSBmYWlsIGF0IHRoZSBsYXN0IG1vdW50IHdpdGggLUVCVVNZLgo+Cj4gVGhlIHJlYXNv
biBpcyB0aGF0IHRoaXMgdGVzdCBzZXF1ZW5jZSBoYXZlIHRoZSBjaGFuY2Ugb2YKPiBtaXNzaW5n
IGEgcmVsZWFzZSBjb2RlIHBhdGggd2hlbiBkb2luZyBybWRpciBhbmQgdW1vdW50Lgo+Cj4gQWRk
IHN5bmMgYmV0d2VlbiBldmVyeSAicm1kaXIsIHVtb3VudCIgcGFpciB0byBmaXggdGhlIHByb2Js
ZW0uCj4KPiBGaXhlczogIzgzOQo+Cj4gU2lnbmVkLW9mZi1ieTogTGVvIFl1LUNoaSBMaWFuZyA8
eWNsaWFuZ0BhbmRlc3RlY2guY29tPgo+IC0tLQo+ICAgLi4uL2tlcm5lbC9jb250cm9sbGVycy9j
Z3JvdXAvY2dyb3VwX3JlZ3Jlc3Npb25fdGVzdC5zaCAgICB8IDcgKysrKysrKwo+ICAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvY29udHJvbGxlcnMvY2dyb3VwL2Nncm91cF9yZWdyZXNzaW9uX3Rlc3Quc2ggYi90ZXN0Y2Fz
ZXMva2VybmVsL2NvbnRyb2xsZXJzL2Nncm91cC9jZ3JvdXBfcmVncmVzc2lvbl90ZXN0LnNoCj4g
aW5kZXggMWY3ZjM4MjBlLi45YTAwZGYxMDEgMTAwNzU1Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9jb250cm9sbGVycy9jZ3JvdXAvY2dyb3VwX3JlZ3Jlc3Npb25fdGVzdC5zaAo+ICsrKyBiL3Rl
c3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY2dyb3VwL2Nncm91cF9yZWdyZXNzaW9uX3Rlc3Qu
c2gKPiBAQCAtMTQ1LDYgKzE0NSw3IEBAIHRlc3QyKCkKPiAgIAlmaQo+ICAgCj4gICAJcm1kaXIg
Y2dyb3VwLzAgY2dyb3VwLzEKPiArCXN5bmMKPiAgIAl1bW91bnQgY2dyb3VwLwo+ICAgfQo+ICAg
Cj4gQEAgLTE5Myw2ICsxOTQsNyBAQCB0ZXN0MygpCj4gICAJd2FpdCAkcGlkMiAyPi9kZXYvbnVs
bAo+ICAgCj4gICAJcm1kaXIgJGNwdV9zdWJzeXNfcGF0aC8wIDI+IC9kZXYvbnVsbAo+ICsJc3lu
Ywo+ICAgCXVtb3VudCBjZ3JvdXAvIDI+IC9kZXYvbnVsbAo+ICAgCWNoZWNrX2tlcm5lbF9idWcK
PiAgIH0KPiBAQCAtMjIyLDYgKzIyNCw3IEBAIHRlc3Q0KCkKPiAgIAltb3VudCAtdCBjZ3JvdXAg
LW8gbm9uZSxuYW1lPWZvbyBjZ3JvdXAgY2dyb3VwLwo+ICAgCW1rZGlyIGNncm91cC8wCj4gICAJ
cm1kaXIgY2dyb3VwLzAKPiArCXN5bmMKPiAgIAl1bW91bnQgY2dyb3VwLwo+ICAgCj4gICAJaWYg
ZG1lc2cgfCBncmVwIC1xICJNQVhfTE9DS0RFUF9TVUJDTEFTU0VTIHRvbyBsb3ciOyB0aGVuCj4g
QEAgLTI1NCw2ICsyNTcsNyBAQCB0ZXN0NSgpCj4gICAJbW91bnQgLXQgY2dyb3VwIG5vbmUgY2dy
b3VwIDI+IC9kZXYvbnVsbAo+ICAgCW1rZGlyIGNncm91cC8wCj4gICAJcm1kaXIgY2dyb3VwLzAK
PiArCXN5bmMKPiAgIAl1bW91bnQgY2dyb3VwLyAyPiAvZGV2L251bGwKPiAgIAljaGVja19rZXJu
ZWxfYnVnCj4gICB9Cj4gQEAgLTI5MCw2ICsyOTQsNyBAQCB0ZXN0NigpCj4gICAKPiAgIAltb3Vu
dCAtdCBjZ3JvdXAgLW8gbnMgeHh4IGNncm91cC8gPiAvZGV2L251bGwgMj4mMQo+ICAgCXJtZGly
IGNncm91cC9bMS05XSogPiAvZGV2L251bGwgMj4mMQo+ICsJc3luYwo+ICAgCXVtb3VudCBjZ3Jv
dXAvCj4gICAJY2hlY2tfa2VybmVsX2J1Zwo+ICAgfQo+IEBAIC0zMjQsNiArMzI5LDcgQEAgdGVz
dF83XzEoKQo+ICAgCW1rZGlyICRzdWJzeXNfcGF0aC8wCj4gICAJc2xlZXAgMTAwIDwgJHN1YnN5
c19wYXRoLzAgJgkjIGFkZCByZWZjbnQgdG8gdGhpcyBkaXIKPiAgIAlybWRpciAkc3Vic3lzX3Bh
dGgvMAo+ICsJc3luYwo+ICAgCj4gICAJIyByZW1vdW50IHdpdGggbmV3IHN1YnN5c3RlbXMgYWRk
ZWQKPiAgIAkjIHNpbmNlIDIuNi4yOCwgdGhpcyByZW1vdW50IHdpbGwgZmFpbAo+IEBAIC0zNDks
NiArMzU1LDcgQEAgdGVzdF83XzIoKQo+ICAgCW1rZGlyIGNncm91cC8wCj4gICAJc2xlZXAgMTAw
IDwgY2dyb3VwLzAgJgkjIGFkZCByZWZjbnQgdG8gdGhpcyBkaXIKPiAgIAlybWRpciBjZ3JvdXAv
MAo+ICsJc3luYwo+ICAgCj4gICAJIyByZW1vdW50IHdpdGggc29tZSBzdWJzeXN0ZW1zIHJlbW92
ZWQKPiAgIAkjIHNpbmNlIDIuNi4yOCwgdGhpcyByZW1vdW50IHdpbGwgZmFpbApJIHdvdWxkIGxp
a2UgYSBzaG9ydCBjb21tZW50IGNsb3NlIHRvIHRoZSBzeW5jcy4gV2hlbiBJIGNvbnZlcnRlZCAK
Y3B1c2V0X3JlZ3Jlc3Npb25fdGVzdC5zaCwgSSB3b3VsZCBoYXZlIHJlbW92ZWQgdGhlIHN5bmMg
aW4gdGhlcmUsIGlmIAp0aGVyZSB3b3VsZG4ndCBoYXZlIGJlZW4gYW55IGNvbW1lbnQuCk1vc3Qg
b2YgdGhlIHRpbWUgc3luY3MgYXJlIG5vdCByZXF1aXJlZCBhbmQganVzdCBhZGRlZCBieSBwYXJh
bm9pZCAKZGV2ZWxvcGVycywgYnV0IGlmIHRoZXJlIGlzIGEgcmVhbCByZWFzb24sIEkgdGhpbmsg
aXQgc2hvdWxkIGJlIHN0YXRlZCAKaW4gYSBjb21tZW50LgoKSsO2cmcKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
