Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F11467BC
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 13:16:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 044AC3C24DE
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 13:16:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A02553C249D
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 13:16:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B14101001276
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 13:16:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4DC03B123;
 Thu, 23 Jan 2020 12:16:24 +0000 (UTC)
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <20200122134239.28844-1-jcronenberg@suse.de>
 <a8618b2e-067c-9a66-02e7-3feceec1ff9c@cn.fujitsu.com>
From: Jorik Cronenberg <jcronenberg@suse.de>
Autocrypt: addr=jcronenberg@suse.de; keydata=
 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
Message-ID: <2cfda6ff-b02f-00c4-b256-eeded0d3edda@suse.de>
Date: Thu, 23 Jan 2020 13:16:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a8618b2e-067c-9a66-02e7-3feceec1ff9c@cn.fujitsu.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Add timeout to TST_PROCESS_STATE_WAIT
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWWFuZywgdGhhbmtzIGZvciB0aGUgcmV2aWV3IQoKPgo+PiBBZGQgdGhlIHBvc3NpYmlsaXR5
IHRvIGFkZCBhIHRpbWVvdXQgdG8gVFNUX1BST0NFU1NfU1RBVEVfV0FJVC4KPj4gTGlrZSBjaGVj
a3BvaW50cyBhZGQgVFNUX1BST0NFU1NfU1RBVEVfV0FJVDIoKQo+PiBmb3Igc3BlY2lmeWluZyBh
IHRpbWVvdXQuIFRoZSBvcmlnaW5hbCBUU1RfUFJPQ0VTU19TVEFURV9XQUlUKCkKPj4gd29ya3Mg
dGhlIHNhbWUgYXMgYmVmb3JlLiBUaW1lb3V0IGNhbiBiZSBzcGVjaWZpZWQgaW4gbWlsbGlzZWNv
bmRzLgo+Pgo+IEhpIEpvcmlrCj4KPiBXZSBoYXZlIHRzdF9wcm9jZXNzX3N0YXRlX3dhaXQyIHNp
bmNlIGNvbW1pdCBkYmYyNzBjNSAoImxpYjogQWRkCj4gdHN0X3Byb2Nlc3Nfc3RhdGVfd2FpdDIo
KSIpLCB0aGlzIGFwaSBoYXMgc2FtZSBmdW5jdGlvbnMgYXMKPiB0c3RfcHJvY2Vzc19zdGF0ZV93
YWl0IGJ1dCBvbmx5IHJldHVybiBlcnJvciBpbnN0ZWFkIG9mIFRCUk9LLgo+Cj4gSSB0aGluayB1
c2luZyBUU1RfUFJPQ0VTU19TVEFURV9XQUlUMiBpcyBjb25mdXNlZCBhbmQgd2UgY2FuIG9ubHkg
ZXhwYW5kCj4gdHN0X3Byb2Nlc3Nfc3RhdGVfd2FpdCBtYWtlIGl0IHN1cHBvcnQgc2xlZXAgc3Bl
Y2lmeWluZyBpbiBtaWxsaXNlY29uZHMuCj4KPiBCZXN0IFJlZ2FyZHMKPiBZYW5nIFh1CgpJIGRv
bid0IHRoaW5rIEkgcXVpdGUgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuLiBJIGNhbiBzZWUgdGhh
dCB1c2luZwpUU1RfUFJPQ0VTU19TVEFURV9XQUlUMiBpcyBjb25mdXNpbmcuIEJ1dCBJIGRpZG4n
dCB3YW50IHRvIHRvdWNoIHRoZQpleGlzdGluZyBUU1RfUFJPQ0VTU19TVEFURV9XQUlUIHRvIGVu
c3VyZSBhbGwgb2xkZXIgdGVzdHMgc3RpbGwgcnVuIHRoZQpzYW1lLiBBcmUgeW91IHNheWluZyBp
IHNob3VsZCBnbyB0aHJvdWdoIGFsbCB0ZXN0cyB0aGF0IHVzZQpUU1RfUFJPQ0VTU19TVEFURV9X
QUlUIGFuZCBzcGVjaWZ5IHRoYXQgdGhleSB1c2UgYSB0aW1lb3V0IG9mIDAod2hpY2gKYWNjb3Jk
aW5nIHRvIGEgZ2l0IGdyZXAgZG9lc24ndCBzZWVtIHRvbyBtYW55LCBzbyBpdCB3b3VsZG4ndCBi
ZSB0b28KbXVjaCBlZmZvcnQpIGFuZCB0aGVuIGNoYW5nZSBUU1RfUFJPQ0VTU19TVEFURV9XQUlU
IHRvIGluY2x1ZGUgYSB0aW1lb3V0Cm9yIHNob3VsZCBJIGp1c3QgcmVuYW1lIFRTVF9QUk9DRVNT
X1NUQVRFX1dBSVQyIHRvIHNvbWV0aGluZyB0aGF0CnNlcGVyYXRlcyBpdCBtb3JlIGZyb20gdHN0
X3Byb2Nlc3Nfc3RhdGVfd2FpdDI/CgpyZWdhcmRzLApKb3JpayBDcm9uZW5iZXJnCj4+IFNpZ25l
ZC1vZmYtYnk6IEpvcmlrIENyb25lbmJlcmcgPGpjcm9uZW5iZXJnQHN1c2UuZGU+Cj4+IC0tLQo+
PiDCoCBpbmNsdWRlL3RzdF9wcm9jZXNzX3N0YXRlLmggfCAxMiArKysrKysrKy0tLS0KPj4gwqAg
bGliL3RzdF9wcm9jZXNzX3N0YXRlLmPCoMKgwqDCoCB8IDE5ICsrKysrKysrKysrKysrLS0tLS0K
Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS90c3RfcHJvY2Vzc19zdGF0ZS5oIGIvaW5jbHVkZS90
c3RfcHJvY2Vzc19zdGF0ZS5oCj4+IGluZGV4IGZhYjA0OTFkOS4uMjdhOGZmYzM2IDEwMDY0NAo+
PiAtLS0gYS9pbmNsdWRlL3RzdF9wcm9jZXNzX3N0YXRlLmgKPj4gKysrIGIvaW5jbHVkZS90c3Rf
cHJvY2Vzc19zdGF0ZS5oCj4+IEBAIC00Nyw5ICs0NywxMyBAQAo+PiDCoMKgICovCj4+IMKgICNp
ZmRlZiBUU1RfVEVTVF9IX18KPj4gwqAgKyNkZWZpbmUgVFNUX1BST0NFU1NfU1RBVEVfV0FJVDIo
cGlkLCBzdGF0ZSwgbXNlY190aW1lb3V0KSBcCj4+ICvCoMKgwqAgdHN0X3Byb2Nlc3Nfc3RhdGVf
d2FpdChfX0ZJTEVfXywgX19MSU5FX18sIE5VTEwsIFwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHBpZCksIChzdGF0ZSksIG1zZWNfdGlt
ZW91dCkKPj4gKwo+PiDCoCAjZGVmaW5lIFRTVF9QUk9DRVNTX1NUQVRFX1dBSVQocGlkLCBzdGF0
ZSkgXAo+PiDCoMKgwqDCoMKgIHRzdF9wcm9jZXNzX3N0YXRlX3dhaXQoX19GSUxFX18sIF9fTElO
RV9fLCBOVUxMLCBcCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIChwaWQpLCAoc3RhdGUpKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAocGlkKSwgKHN0YXRlKSwgMCkKPj4gwqAgI2Vs
c2UKPj4gwqAgLyoKPj4gwqDCoCAqIFRoZSBzYW1lIGFzIGFib3ZlIGJ1dCBkb2VzIG5vdCB1c2Ug
dHN0X2Jya20oKSBpbnRlcmZhY2UuCj4+IEBAIC02NSw4ICs2OSw4IEBAIGludCB0c3RfcHJvY2Vz
c19zdGF0ZV93YWl0MihwaWRfdCBwaWQsIGNvbnN0IGNoYXIKPj4gc3RhdGUpOwo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChwaWQp
LCAoc3RhdGUpKQo+PiDCoCAjZW5kaWYKPj4gwqAgLXZvaWQgdHN0X3Byb2Nlc3Nfc3RhdGVfd2Fp
dChjb25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQgbGluZW5vLAo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQgKCpjbGVhbnVwX2Zu
KSh2b2lkKSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwaWRfdCBwaWQsIGNvbnN0IGNoYXIgc3RhdGUpOwo+PiAraW50IHRzdF9wcm9j
ZXNzX3N0YXRlX3dhaXQoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubywKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lk
ICgqY2xlYW51cF9mbikodm9pZCksIHBpZF90IHBpZCwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb25zdCBjaGFyIHN0YXRlLCB1bnNpZ25lZCBpbnQgbXNlY190aW1lb3V0KTsK
Pj4gwqAgwqAgI2VuZGlmIC8qIFRTVF9QUk9DRVNTX1NUQVRFX18gKi8KPj4gZGlmZiAtLWdpdCBh
L2xpYi90c3RfcHJvY2Vzc19zdGF0ZS5jIGIvbGliL3RzdF9wcm9jZXNzX3N0YXRlLmMKPj4gaW5k
ZXggN2E3ODI0OTU5Li4zMmI0NDk5MmMgMTAwNjQ0Cj4+IC0tLSBhL2xpYi90c3RfcHJvY2Vzc19z
dGF0ZS5jCj4+ICsrKyBiL2xpYi90c3RfcHJvY2Vzc19zdGF0ZS5jCj4+IEBAIC0yOCwxMSArMjgs
MTIgQEAKPj4gwqAgI2luY2x1ZGUgInRlc3QuaCIKPj4gwqAgI2luY2x1ZGUgInRzdF9wcm9jZXNz
X3N0YXRlLmgiCj4+IMKgIC12b2lkIHRzdF9wcm9jZXNzX3N0YXRlX3dhaXQoY29uc3QgY2hhciAq
ZmlsZSwgY29uc3QgaW50IGxpbmVubywKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lkICgqY2xlYW51cF9mbikodm9pZCksCj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGlk
X3QgcGlkLCBjb25zdCBjaGFyIHN0YXRlKQo+PiAraW50IHRzdF9wcm9jZXNzX3N0YXRlX3dhaXQo
Y29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubywKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lkICgqY2xlYW51cF9mbiko
dm9pZCksIHBpZF90IHBpZCwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25z
dCBjaGFyIHN0YXRlLCB1bnNpZ25lZCBpbnQgbXNlY190aW1lb3V0KQo+PiDCoCB7Cj4+IMKgwqDC
oMKgwqAgY2hhciBwcm9jX3BhdGhbMTI4XSwgY3VyX3N0YXRlOwo+PiArwqDCoMKgIHVuc2lnbmVk
IGludCBtc2VjcyA9IDA7Cj4+IMKgIMKgwqDCoMKgwqAgc25wcmludGYocHJvY19wYXRoLCBzaXpl
b2YocHJvY19wYXRoKSwgIi9wcm9jLyVpL3N0YXQiLCBwaWQpOwo+PiDCoCBAQCAtNDEsMTAgKzQy
LDE4IEBAIHZvaWQgdHN0X3Byb2Nlc3Nfc3RhdGVfd2FpdChjb25zdCBjaGFyICpmaWxlLAo+PiBj
b25zdCBpbnQgbGluZW5vLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiJSppICUqcyAlYyIsICZjdXJfc3RhdGUpOwo+PiDCoCDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKHN0YXRlID09IGN1cl9zdGF0ZSkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gwqAgLcKgwqDC
oMKgwqDCoMKgIHVzbGVlcCgxMDAwMCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCB1c2xlZXAoMTAwMCk7
Cj4+ICvCoMKgwqDCoMKgwqDCoCBtc2VjcyArPSAxOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAobXNlY3MgPj0gbXNlY190aW1lb3V0KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVy
cm5vID0gRVRJTUVET1VUOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLTE7Cj4+
ICvCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcmV0dXJu
IDA7Cj4+IMKgIH0KPj4gwqAgwqAgaW50IHRzdF9wcm9jZXNzX3N0YXRlX3dhaXQyKHBpZF90IHBp
ZCwgY29uc3QgY2hhciBzdGF0ZSkKPj4KPgo+CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
