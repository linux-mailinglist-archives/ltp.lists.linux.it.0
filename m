Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36504341DAC
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 14:05:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E97093C5FBD
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 14:05:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 13D653C5FB1
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 14:05:50 +0100 (CET)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EADAE1A009AA
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 14:05:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=N2chU
 VE7mlGRXqI1HHs5afixuFvqy9coAvlXDcsGS2Q=; b=k+YQ+D9s05SpgPKwuZZXZ
 yRABm3u4Dcq3nH91LxFfLVfF9kcrEd273guflart1Ub7p0gonFNmD4MQHxGrtbvY
 zB23X9NY/ZFTF8DwK2a0FnrMyrEM726TY9mYknSpA8n1HhuPnNOlmRXbzP8mItbR
 9RJwlVzjg3WGzUBMWbugkc=
Received: from [172.20.10.7] (unknown [117.136.66.83])
 by smtp8 (Coremail) with SMTP id DMCowABnbrJ9oVRgyLgZVg--.11764S2;
 Fri, 19 Mar 2021 21:05:02 +0800 (CST)
To: QI Fuli <fukuri.sai@gmail.com>, ltp@lists.linux.it
References: <20210319115934.1801692-1-qi.fuli@fujitsu.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <05259ae9-4687-028d-48f0-929a43c2feec@163.com>
Date: Fri, 19 Mar 2021 21:05:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210319115934.1801692-1-qi.fuli@fujitsu.com>
Content-Language: en-US
X-CM-TRANSID: DMCowABnbrJ9oVRgyLgZVg--.11764S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxArW5AF13Aw1rGFyUtF17trb_yoWrJFy5pr
 13JrnxtFs7J3W8JFyxXr1DGFy8XwsFyry5Wan0vrs5uF1kAr98JF10ga1rX34jgFWDKFW5
 KF48XrWqyw1qqFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jZTmhUUUUU=
X-Originating-IP: [117.136.66.83]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEh5aXl6ibSP+kwABsW
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/swapon/swapon0{1..3}: remove checking if
 fs type is BTRFS
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUWksCgpDYW4gd2UgcmVuYW1lIHN1YmplY3QgdG8gJ1JlbW92ZSB0aGUgY2hlY2sgZm9yIEJU
UkZTJz8KCk9uIDMvMTkvMjEgNzo1OSBQTSwgUUkgRnVsaSB3cm90ZToKPiByZW1vdmUgcmVkdW5k
YW50IHRhc2tzIGFzIEJUUkZTIGlzIGNoZWNrZWQgaW4gaXNfc3dhcF9zdXBwb3J0ZWQoKQo+IEZp
eGVzOiBjYWY0NTM1MzIoInN5c2NhbGxzL3N3YXBvbi9zd2Fwb24wezEuLjN9OiB1c2UgaGVscGVy
cyB0byBjaGVjawo+IAlzdXBwb3J0IHN0YXR1cyIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBRSSBGdWxp
IDxxaS5mdWxpQGZ1aml0c3UuY29tPgo+IC0tLQo+ICAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9zd2Fwb24vc3dhcG9uMDEuYyB8ICA3IC0tLS0tLS0KPiAgIHRlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvc3dhcG9uL3N3YXBvbjAyLmMgfCAgNSAtLS0tLQo+ICAgdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zd2Fwb24vc3dhcG9uMDMuYyB8IDE1ICstLS0tLS0tLS0tLS0tLQo+ICAgMyBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMjYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDEuYyBiL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAxLmMKPiBpbmRleCBmOTVjZTBhYjIuLmFm
Zjg0MmU0YyAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9z
d2Fwb24wMS5jCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9u
MDEuYwo+IEBAIC0zMiwxOCArMzIsMTEgQEAgc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKTsKPiAg
IGNoYXIgKlRDSUQgPSAic3dhcG9uMDEiOwo+ICAgaW50IFRTVF9UT1RBTCA9IDE7Cj4KPiAtc3Rh
dGljIGxvbmcgZnNfdHlwZTsKPiAtCj4gICBzdGF0aWMgdm9pZCB2ZXJpZnlfc3dhcG9uKHZvaWQp
Cj4gICB7Cj4gICAJVEVTVChsdHBfc3lzY2FsbChfX05SX3N3YXBvbiwgIi4vc3dhcGZpbGUwMSIs
IDApKTsKPgo+ICAgCWlmIChURVNUX1JFVFVSTiA9PSAtMSkgewo+IC0JCWlmIChmc190eXBlID09
IFRTVF9CVFJGU19NQUdJQyAmJiBlcnJubyA9PSBFSU5WQUwpIHsKPiAtCQkJdHN0X2Jya20oVENP
TkYsIGNsZWFudXAsCj4gLQkJCSAgICAgICAgICJTd2FwZmlsZSBvbiBCVFJGUyBub3QgaW1wbGVt
ZXRlZCIpOwo+IC0JCQlyZXR1cm47Cj4gLQkJfQo+ICAgCQl0c3RfcmVzbShURkFJTCB8IFRURVJS
Tk8sICJGYWlsZWQgdG8gdHVybiBvbiBzd2FwZmlsZSIpOwo+ICAgCX0gZWxzZSB7Cj4gICAJCXRz
dF9yZXNtKFRQQVNTLCAiU3VjY2VlZGVkIHRvIHR1cm4gb24gc3dhcGZpbGUiKTsKPiBkaWZmIC0t
Z2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYyBiL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAyLmMKPiBpbmRleCAzZDQ5ZDBjNmIu
LjY1M2IxZjMzZSAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBv
bi9zd2Fwb24wMi5jCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dh
cG9uMDIuYwo+IEBAIC04MSwxMSArODEsNiBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfc3dhcG9uKHN0
cnVjdCB0ZXN0X2Nhc2VfdCAqdGVzdCkKPiAgIAkJcmV0dXJuOwo+ICAgCX0KPgo+IC0JaWYgKGZz
X3R5cGUgPT0gVFNUX0JUUkZTX01BR0lDICYmIGVycm5vID09IEVJTlZBTCkgewo+IC0JCXRzdF9y
ZXNtKFRDT05GLCAiU3dhcGZpbGUgb24gQlRSRlMgbm90IGltcGxlbWV0ZWQiKTsKPiAtCQkJcmV0
dXJuOwo+IC0JfQo+IC0KCkhpIFFpLAoKVGhlIGZvbGxvd2luZyBjaGVjayBmb3IgYnRyZnMgY2Fu
IGJlIHJlbW92ZWQgYXMgd2VsbDoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCnN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCnsKLi4u
CiDCoMKgwqDCoMKgwqDCoCBpZiAobHRwX3N5c2NhbGwoX19OUl9zd2Fwb24sICJhbHJlYWR5dXNl
ZCIsIDApKSB7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGZzX3R5cGUgIT0g
VFNUX0JUUkZTX01BR0lDIHx8IGVycm5vICE9IEVJTlZBTCkKIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHN0X3Jlc20oVFdBUk4gfCBURVJSTk8sICJzd2Fw
b24oYWxyZWFkeXVzZWQpIApmYWlsZWQiKTsKLi4uCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpOb3RlOiBhbHNvIHJlbW92ZSBm
c190eXBlIHZhcmlhYmxlLgoKT3RoZXIgdGhhbiB0aGVzZSwgaXQgbG9va3MgZ29vZCB0byBtZS4K
CkJlc3QgUmVnYXJkcywKClhpYW8gWWFuZwoKPiAgIAl0c3RfcmVzbShURkFJTCwgInN3YXBvbigy
KSBmYWlsZWQgdG8gcHJvZHVjZSBleHBlY3RlZCBlcnJvcjoiCj4gICAJICAgICAgICAgIiAlZCwg
ZXJybm86ICVzIGFuZCBnb3QgJWQuIiwgdGVzdC0+ZXhwX2Vycm5vLAo+ICAgCSAgICAgICAgIHRl
c3QtPmV4cF9lcnJ2YWwsIFRFU1RfRVJSTk8pOwo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMy5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9zd2Fwb24vc3dhcG9uMDMuYwo+IGluZGV4IGNlZjU3MTUwYy4uMTk0NTViZmU2IDEwMDY0NAo+
IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAzLmMKPiArKysg
Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMy5jCj4gQEAgLTUyLDgg
KzUyLDYgQEAgaW50IFRTVF9UT1RBTCA9IDE7Cj4KPiAgIHN0YXRpYyBpbnQgc3dhcGZpbGVzOwo+
Cj4gLXN0YXRpYyBsb25nIGZzX3R5cGU7Cj4gLQo+ICAgaW50IHRlc3RmaWxlcyA9IDM7Cj4gICBz
dGF0aWMgc3RydWN0IHN3YXBfdGVzdGZpbGVfdCB7Cj4gICAJY2hhciAqZmlsZW5hbWU7Cj4gQEAg
LTIxNSw5ICsyMTMsNiBAQCBzdGF0aWMgaW50IHNldHVwX3N3YXAodm9pZCkKPiAgIAkJCS8qIHR1
cm4gb24gdGhlIHN3YXAgZmlsZSAqLwo+ICAgCQkJcmVzID0gbHRwX3N5c2NhbGwoX19OUl9zd2Fw
b24sIGZpbGVuYW1lLCAwKTsKPiAgIAkJCWlmIChyZXMgIT0gMCkgewo+IC0JCQkJaWYgKGZzX3R5
cGUgPT0gVFNUX0JUUkZTX01BR0lDICYmIGVycm5vID09IEVJTlZBTCkKPiAtCQkJCQlleGl0KDIp
Owo+IC0KPiAgIAkJCQlpZiAoZXJybm8gPT0gRVBFUk0pIHsKPiAgIAkJCQkJcHJpbnRmKCJTdWNj
ZXNzZnVsbHkgY3JlYXRlZCAlZCAiCj4gICAJCQkJCSAgICAgICAic3dhcGZpbGVzXG4iLCBqKTsK
PiBAQCAtMjMzLDE2ICsyMjgsOCBAQCBzdGF0aWMgaW50IHNldHVwX3N3YXAodm9pZCkKPiAgIAl9
IGVsc2UKPiAgIAkJd2FpdHBpZChwaWQsICZzdGF0dXMsIDApOwo+Cj4gLQlzd2l0Y2ggKFdFWElU
U1RBVFVTKHN0YXR1cykpIHsKPiAtCWNhc2UgMDoKPiAtCWJyZWFrOwo+IC0JY2FzZSAyOgo+IC0J
CXRzdF9icmttKFRDT05GLCBjbGVhbnVwLCAiU3dhcGZpbGUgb24gQlRSRlMgbm90IGltcGxlbWV0
ZWQiKTsKPiAtCWJyZWFrOwo+IC0JZGVmYXVsdDoKPiArCWlmIChXRVhJVFNUQVRVUyhzdGF0dXMp
ID09IDEpCj4gICAJCXRzdF9icmttKFRGQUlMLCBjbGVhbnVwLCAiRmFpbGVkIHRvIHNldHVwIHN3
YXBzIik7Cj4gLQlicmVhazsKPiAtCX0KPgo+ICAgCS8qIENyZWF0ZSBhbGwgbmVlZGVkIGV4dHJh
IHN3YXBmaWxlcyBmb3IgdGVzdGluZyAqLwo+ICAgCWZvciAoaiA9IDA7IGogPCB0ZXN0ZmlsZXM7
IGorKykKPiAtLQo+IDIuMjkuMgo+Cj4KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
