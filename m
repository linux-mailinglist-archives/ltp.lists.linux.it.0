Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59957DDB
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2019 10:04:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 896233C1C8C
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2019 10:04:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B0C623C02C3
 for <ltp@lists.linux.it>; Thu, 27 Jun 2019 10:04:44 +0200 (CEST)
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 70C311A014A6
 for <ltp@lists.linux.it>; Thu, 27 Jun 2019 10:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=dLUJE
 O1dfpp05hhDj3INOc0wpTD6i+IK6K81lH/Z84k=; b=m9X3UYJGDaddZiwOY4gBF
 RfCwtqljmnweJx4jazjJhO+Z6y/IaouUmlDdb0r+zZMkNWND90JkwHIHIUn/gSWJ
 WxF3FNmIZ7+f/ZSmoZlVNPOd55en2DnxBbKAvpvk/Ic5AcDt5JHYsTJp0lVlLpyA
 EH970DQ80Am92Fw1qe6Fzg=
Received: from [172.20.10.4] (unknown [122.194.3.91])
 by smtp5 (Coremail) with SMTP id HdxpCgA3vfWReBRdiyfPAw--.1S2;
 Thu, 27 Jun 2019 16:04:35 +0800 (CST)
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
References: <20190625100351.19800-1-po-hsu.lin@canonical.com>
 <5D11FEA7.1000104@cn.fujitsu.com>
 <CAMy_GT-BOitiVB6vJCno6=M5d+iz6+RxKMxsiXHH0TYbiZS7+w@mail.gmail.com>
 <e8ca7807-4d4d-8bd5-dc8f-ed9989ba0f01@163.com>
 <CAMy_GT9s4DXdaA66GcdUVY2Xx2r9R-6EwN0Uo1cmXHA-KM0HLQ@mail.gmail.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <fbbbac1f-6e0d-4be8-7c07-759c39d61f1e@163.com>
Date: Thu, 27 Jun 2019 16:04:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMy_GT9s4DXdaA66GcdUVY2Xx2r9R-6EwN0Uo1cmXHA-KM0HLQ@mail.gmail.com>
Content-Language: en-US
X-CM-TRANSID: HdxpCgA3vfWReBRdiyfPAw--.1S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW5Ww15ArykCw15WryDWrg_yoW5ZFWkpF
 W7Ja17Kr48XryUGw12y3W2yr10qws3Kr4rWryUXr13Xa1qqr1rtry0gr45Ga4j9w4UCFy0
 yrWUJFy3Ww18AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jGfOwUUUUU=
X-Originating-IP: [122.194.3.91]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbB0hPgXlUMP9RVagAAsy
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runpwtests03: use expr to calculate total_cpus
 for runpwtests03
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpEb24ndCBuZWVkLsKgIEl0J3MgZmluZSB0byBtZSBhcyB3ZWxsLgoKUHVzaGVkLCB0aGFu
a3MgZm9yIHlvdXIgcGF0Y2guCgpCZXN0IFJlYWdyZHMsCgpYaWFvIFlhbmcKCk9uIDA2LzI2LzIw
MTkgMTE6NDUgQU0sIFBvLUhzdSBMaW4gd3JvdGU6Cj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LAo+
Cj4gVGhleSBhcmUgYm90aCBmaW5lIHdpdGggbWUsIGlmIHlvdSB3YW50IHRvIHNlZSB0aGlzIHRv
IGJlIGNoYW5nZWQgaW50bwo+IHRoZSBkb3VibGUgcGFyZW50aGVzZXMgZm9ybSwgSSBjYW4gc2Vu
ZCBhIFYyIGZvciB0aGF0Lgo+Cj4gQ2hlZXJzCj4gUEhMaW4KPgo+IE9uIFdlZCwgSnVuIDI2LCAy
MDE5IGF0IDEwOjU1IEFNIFhpYW8gWWFuZyA8aWNlX3lhbmd4aWFvQDE2My5jb20+IHdyb3RlOgo+
PiBIaSwKPj4KPj4gU29ycnksIEkgbWlzc2VkIHRoZSBmYWN0IHRoYXQgdHN0X25jcHVzIGlzIGV4
ZWN1dGFibGUgYmluYXJ5Lgo+Pgo+PiBJdCdzIGdvb2QgdG8gbWUuCj4+Cj4+IFJldmlld2VkLWJ5
OiBYaWFvIFlhbmcgPGljZV95YW5neGlhb0AxNjMuY29tPgo+Pgo+PiBCVFc6IGlmIHlvdSBkb24n
dCB3YW50IHRvIGRlcGVuZCBleHByIGNvbW1hbmQsIHdlIGNhbiBmaXggaXQgYnkgdXNpbmcKPj4g
dG90YWxfY3B1cz0kKCh0b3RhbF9jcHVzIC0gMSkpIGluc3RlYWQuCj4+Cj4+IEJlc3QgUmVnYXJk
cywKPj4gWGlhbyBZYW5nCj4+Cj4+IE9uIDA2LzI2LzIwMTkgMTI6MTMgQU0sIFBvLUhzdSBMaW4g
d3JvdGU6Cj4+PiBIZWxsbyEKPj4+Cj4+PiBUaGUgJCgpIGhlcmUgaXMgZm9yIHRoZSB0c3RfbmNw
dXMgZXhlY3V0YWJsZSwgd2hpY2ggd2lsbCByZXR1cm4gdGhlCj4+PiB0b3RhbCBjcHUgbnVtYmVy
Lgo+Pj4KPj4+IFRoYW5rcwo+Pj4gUEhMaW4KPj4+Cj4+PiBPbiBUdWUsIEp1biAyNSwgMjAxOSBh
dCA2OjU5IFBNIFhpYW8gWWFuZyA8eWFuZ3guanlAY24uZnVqaXRzdS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDIwMTkvMDYvMjUgMTg6MDMsIFBvLUhzdSBMaW4gd3JvdGU6Cj4+Pj4+IFRoZSBhcml0aG1l
dGljIG9wZXJhdGlvbiAoKCB0b3RhbF9jcHVzLT0xICkpIGRvZXMgbm90IHdvcmsgZm9yIGRhc2gs
Cj4+Pj4+IHdoaWNoIHdhcyBzeW1ib2xpYyBsaW5rZWQgdG8gL2Jpbi9zaCBvbiBzb21lIE9TIGxp
a2UgVWJ1bnR1Lgo+Pj4+Pgo+Pj4+PiBJbiBzdWNoIGNhc2UsIHBlb3BsZSB3aWxsIHNlZSBlcnJv
ciBsaWtlOgo+Pj4+PiAgICAgIHJ1bnB3dGVzdHMwMy5zaDogdG90YWxfY3B1cy09MTogbm90IGZv
dW5kCj4+Pj4+Cj4+Pj4+IEFuZCB0aGlzIGZ1cnRoZXIgbGVhZHMgdG8gYWNjZXNzIGZvciBhIG5v
bi1leGlzdGluZyBmaWxlIGFuZCBjYXVzZQo+Pj4+PiBmYWxzZS1wb3NpdGl2ZSByZXN1bHQgaW4g
dGhlIGVuZDoKPj4+Pj4gICAgICBydW5wd3Rlc3RzMDMuc2g6IGNhbm5vdCBjcmVhdGUKPj4+Pj4g
ICAgICAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cjogRGlyZWN0b3J5IG5vbmV4aXN0ZW50Cj4+Pj4+ICAgICAgcnVucHd0ZXN0czAzLnNoOiBGQUlM
OiBVbmFibGUgdG8gc2V0IGdvdmVybm9yIC0tIHBvd2Vyc2F2ZSBmb3IgY3B1OAo+Pj4+PiAgICAg
IFBvd2VyX01hbmFnZW1lbnQwMyAyIFRGQUlMOiBDaGFuZ2luZyBnb3Zlcm5vcnMKPj4+Pj4KPj4+
Pj4gVXNlIGV4cHIgaW5zdGVhZCBmb3IgZml4IHRoaXMgaXNzdWUuCj4+Pj4+Cj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFBvLUhzdSBMaW48cG8taHN1LmxpbkBjYW5vbmljYWwuY29tPgo+Pj4+PiAtLS0K
Pj4+Pj4gICAgIHRlc3RjYXNlcy9rZXJuZWwvcG93ZXJfbWFuYWdlbWVudC9ydW5wd3Rlc3RzMDMu
c2ggfCA5ICsrKy0tLS0tLQo+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvcG93ZXJfbWFuYWdlbWVudC9ydW5wd3Rlc3RzMDMuc2ggYi90ZXN0Y2FzZXMva2VybmVsL3Bv
d2VyX21hbmFnZW1lbnQvcnVucHd0ZXN0czAzLnNoCj4+Pj4+IGluZGV4IDExMTk3OTM3Zi4uM2Zi
ODVkMjczIDEwMDc1NQo+Pj4+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3Bvd2VyX21hbmFnZW1l
bnQvcnVucHd0ZXN0czAzLnNoCj4+Pj4+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvcG93ZXJfbWFu
YWdlbWVudC9ydW5wd3Rlc3RzMDMuc2gKPj4+Pj4gQEAgLTI1LDggKzI1LDcgQEAgZXhwb3J0IFRT
VF9UT1RBTD00Cj4+Pj4+ICAgICAuIHBtX2luY2x1ZGUuc2gKPj4+Pj4KPj4+Pj4gICAgIGNoZWNr
X2NwdWZyZXFfc3lzZnNfZmlsZXMoKSB7Cj4+Pj4+IC0gICAgIHRvdGFsX2NwdXM9JCh0c3RfbmNw
dXMpCj4+Pj4+IC0gICAgICgoIHRvdGFsX2NwdXMtPTEgKSkKPj4+Pj4gKyAgICAgdG90YWxfY3B1
cz1gZXhwciAkKHRzdF9uY3B1cykgLSAxYAo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gSXQncyB3cm9uZyBm
b3Igc2luZ2xlIHZhcmlhYmxlIHRvIHVzZSAkKCksIGRpZCB5b3UgbWVhbiAke3RzdF9uY3B1c30/
Cj4+Pj4KPj4+PiBCZXN0IFJlZ2FyZHMsCj4+Pj4gWGlhbyBZYW5nCj4+Pj4+ICAgICAgICAgUkM9
MAo+Pj4+Pgo+Pj4+PiAgICAgICAgIGZvciBjcHUgaW4gJChzZXEgMCAiJHt0b3RhbF9jcHVzfSIg
KQo+Pj4+PiBAQCAtNTEsOCArNTAsNyBAQCBjaGVja19jcHVmcmVxX3N5c2ZzX2ZpbGVzKCkgewo+
Pj4+PiAgICAgY2hhbmdlX2dvdnIoKSB7Cj4+Pj4+ICAgICAgICAgYXZhaWxhYmxlX2dvdnI9JChn
ZXRfc3VwcG9ydGluZ19nb3ZyKQo+Pj4+Pgo+Pj4+PiAtICAgICB0b3RhbF9jcHVzPSQodHN0X25j
cHVzKQo+Pj4+PiAtICAgICAoKCB0b3RhbF9jcHVzLT0xICkpCj4+Pj4+ICsgICAgIHRvdGFsX2Nw
dXM9YGV4cHIgJCh0c3RfbmNwdXMpIC0gMWAKPj4+Pj4gICAgICAgICBSQz0wCj4+Pj4+Cj4+Pj4+
ICAgICAgICAgZm9yIGNwdSBpbiAkKHNlcSAwICIke3RvdGFsX2NwdXN9IiApCj4+Pj4+IEBAIC03
OSw4ICs3Nyw3IEBAIGNoYW5nZV9mcmVxKCkgewo+Pj4+PiAgICAgICAgIGF2YWlsYWJsZV9nb3Zy
PSQoZ2V0X3N1cHBvcnRpbmdfZ292cikKPj4+Pj4gICAgICAgICBSQz0wCj4+Pj4+Cj4+Pj4+IC0g
ICAgIHRvdGFsX2NwdXM9JCh0c3RfbmNwdXMpCj4+Pj4+IC0gICAgICgoIHRvdGFsX2NwdXMtPTEg
KSkKPj4+Pj4gKyAgICAgdG90YWxfY3B1cz1gZXhwciAkKHRzdF9uY3B1cykgLSAxYAo+Pj4+Pgo+
Pj4+PiAgICAgICAgIGlmICggZWNobyAke2F2YWlsYWJsZV9nb3ZyfSB8IGdyZXAgLWkgInVzZXJz
cGFjZSIgXAo+Pj4+PiAgICAgICAgICAgICAgICAgPi9kZXYvbnVsbCAyPiYxICk7IHRoZW4KPj4+
PgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
