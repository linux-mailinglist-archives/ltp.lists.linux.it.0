Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F09669CF
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 11:20:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D453D3C1CF7
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 11:20:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 54CC63C1C9A
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 11:20:49 +0200 (CEST)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E8C45100277F
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 11:20:40 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6C9KgJB016820
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Fri, 12 Jul 2019 02:20:42 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Fri, 12 Jul 2019 02:20:41 -0700
To: Jan Stancek <jstancek@redhat.com>
References: <1562826026-158569-1-git-send-email-hongzhi.song@windriver.com>
 <408194681.32599099.1562831328308.JavaMail.zimbra@redhat.com>
 <c0c07134-f5a8-b4d3-c210-c58c36653423@windriver.com>
 <1691784527.32812965.1562915669160.JavaMail.zimbra@redhat.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <c15e6a0a-34dd-100a-2a42-066a1e23f206@windriver.com>
Date: Fri, 12 Jul 2019 17:20:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1691784527.32812965.1562915669160.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] getrlimit03: adjust a bit of code to
 compatiable with mips32
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

Ck9uIDcvMTIvMTkgMzoxNCBQTSwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4gLS0tLS0gT3JpZ2luYWwg
TWVzc2FnZSAtLS0tLQo+PiBPbiA3LzExLzE5IDM6NDggUE0sIEphbiBTdGFuY2VrIHdyb3RlOgo+
Pj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+Pj4+IEVycm9yIGluZm86Cj4+Pj4gZ2V0
cmxpbWl0MDMuYzoxMDQ6IEZBSUw6IF9fTlJfcHJsaW1pdDY0KDApIGhhZCBybGltX2N1ciA9Cj4+
Pj4gZmZmZmZmZmZmZmZmZmZmZiBidXQgX19OUl9nZXRybGltaXQoMCkgaGFkIHJsaW1fY3VyID0g
N2ZmZmZmZmYKPj4+Pgo+Pj4+IEFjY29yZGluZyB0byBrZXJuZWwgY29kZTogW2FyY2gvbWlwcy9p
bmNsdWRlL3VhcGkvYXNtL3Jlc291cmNlLmhdCj4+Pj4gUkxJTV9JTkZJTklUWSBpcyBzZXQgdG8g
MHg3ZmZmZmZmZlVMIGluc3RlYWQgb2YgVUxPTkdfTUFYIG9uIG1pcHMzMi4KPj4+Pgo+Pj4+IC8q
Cj4+Pj4gICAgKiBTdVMgc2F5cyBsaW1pdHMgaGF2ZSB0byBiZSB1bnNpZ25lZC4KPj4+PiAgICAq
IFdoaWNoIG1ha2VzIGEgdG9uIG1vcmUgc2Vuc2UgYW55d2F5LAo+Pj4+ICAgICogYnV0IHdlIGtl
ZXAgdGhlIG9sZCB2YWx1ZSBvbiBNSVBTMzIsCj4+Pj4gICAgKiBmb3IgY29tcGF0aWJpbGl0eToK
Pj4+PiAgICAqLwo+Pj4+ICNpZm5kZWYgX19taXBzNjQKPj4+PiAjIGRlZmluZSBSTElNX0lORklO
SVRZICAgICAgMHg3ZmZmZmZmZlVMCj4+Pj4gI2VuZGlmCj4+Pj4KPj4+PiBBZGRpbmcgY29uZGl0
aW9uYWwgc3RhdGVtZW50IGFib3V0IG1pcHMgdG8gZml4IHRoaXMuCj4+Pj4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBIb25nemhpLlNvbmcgPGhvbmd6aGkuc29uZ0B3aW5kcml2ZXIuY29tPgo+Pj4+IC0t
LQo+Pj4+ICAgIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0cmxpbWl0L2dldHJsaW1pdDAz
LmMgfCAxMCArKysrKysrKy0tCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5jCj4+Pj4gYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5jCj4+Pj4gaW5kZXggZTRkNTZjNC4uMTkw
MzU1OCAxMDA2NDQKPj4+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJsaW1p
dC9nZXRybGltaXQwMy5jCj4+Pj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXRy
bGltaXQvZ2V0cmxpbWl0MDMuYwo+Pj4+IEBAIC02MSw3ICs2MSwxMyBAQCBzdHJ1Y3QgcmxpbWl0
X3Vsb25nIHsKPj4+PiAgICAJdW5zaWduZWQgbG9uZyBybGltX2N1cjsKPj4+PiAgICAJdW5zaWdu
ZWQgbG9uZyBybGltX21heDsKPj4+PiAgICB9Owo+Pj4+ICsjaWZkZWYgX19taXBzCj4+Pj4gKyNp
Zm5kZWYgX19taXBzNjQKPj4+PiArY29uc3QgdW5zaWduZWQgbG9uZyBSTElNX0lORklOSVRZX1VM
ID0gMHg3ZmZmZmZmZlVMOwo+Pj4+ICsjZWxzZQo+Pj4+ICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcg
UkxJTV9JTkZJTklUWV9VTCA9IFVMT05HX01BWDsKPj4+PiArI2VuZGlmCj4+Pj4gKyNlbmRpZgo+
Pj4gSGksCj4+Pgo+Pj4gVGhpcyB3aWxsIGJyZWFrIGV2ZXJ5IG90aGVyIGFyY2gsIGJlY2F1c2Ug
aXQncyBub3cgdW5kZWZpbmVkIGV2ZXJ5d2hlcmUKPj4+IGV4Y2VwdCBtaXBzLgo+Pgo+PiBJcyB0
aGVyZSBhIGdvb2Qgd2F5IHRvIGZpbHRlciBtaXBzMzI/Cj4gTWF5YmUgc29tZXRoaW5nIGxpa2U6
Cj4KPiAjaW5jbHVkZSAibGFwaS9hYmlzaXplLmgiCj4KPiAjaWYgZGVmaW5lZChfX21pcHNfXykg
JiYgZGVmaW5lZChUU1RfQUJJMzIpCj4gY29uc3QgdW5zaWduZWQgbG9uZyBSTElNX0lORklOSVRZ
X1VMID0gMHg3ZmZmZmZmZlVMOwo+ICNlbHNlCj4gY29uc3QgdW5zaWduZWQgbG9uZyBSTElNX0lO
RklOSVRZX1VMID0gVUxPTkdfTUFYOwo+ICNlbmRpZgoKClRTVF9BQkkzMiBsb29rcyBsaWtlIG5v
dCB3b3JrLCBhbmQgSSBzZW50IHBhdGNoLVYzIHVzaW5nIF9fbWlwcyBhbmQgX19taXBzNjQuCgot
LUhvbmd6aGkKCgo+Cj4+IEkgdHJpZWQKPj4KPj4gICDCoDY1ICNpZmRlZiBfX21pcHMKPj4gICDC
oDY2ICNpZm5kZWYgX19taXBzNjQKPj4gICDCoDY3IGNvbnN0IHVuc2lnbmVkIGxvbmcgUkxJTV9J
TkZJTklUWV9VTCA9IDB4N2ZmZmZmZmZVTDsKPj4gICDCoDY4ICNlbmRpZgo+PiAgIMKgNjkgY29u
c3QgdW5zaWduZWQgbG9uZyBSTElNX0lORklOSVRZX1VMID0gVUxPTkdfTUFYOwo+PiAgIMKgNzAg
I2Vsc2UKPj4gICDCoDcxIGNvbnN0IHVuc2lnbmVkIGxvbmcgUkxJTV9JTkZJTklUWV9VTCA9IFVM
T05HX01BWDsKPj4gICDCoDcyICNlbmRpZgo+Pgo+PiBidXQgbWlwczMyIHRoaW5rcyB0aGUgUkxJ
TV9JTkZJTklUWV9VTCBtaWNybyBpcyByZWRlZmluZWQuCj4+Cj4+Cj4+Pj4gICAgCj4+Pj4gICAg
c3RhdGljIGludCBnZXRybGltaXRfdWxvbmcoaW50IHJlc291cmNlLCBzdHJ1Y3QgcmxpbWl0X3Vs
b25nICpybGltKQo+Pj4+ICAgIHsKPj4+PiBAQCAtMTAxLDggKzEwNyw4IEBAIHN0YXRpYyBpbnQg
Y29tcGFyZV91NjRfdWxvbmcoaW50IHJlc291cmNlLCB1aW50NjRfdAo+Pj4+IHZhbF91NjQsCj4+
Pj4gICAgewo+Pj4+ICAgIAlpZiAoKHZhbF91NjQgPiBSTElNX0lORklOSVRZX1VMICYmIHZhbF91
bCAhPSBSTElNX0lORklOSVRZX1VMKSB8fAo+Pj4+ICAgIAkgICAgKHZhbF91NjQgPD0gUkxJTV9J
TkZJTklUWV9VTCAmJiB2YWxfdWwgIT0gdmFsX3U2NCkpIHsKPj4+PiAtCQl0c3RfcmVzKFRGQUlM
LCAiX19OUl9wcmxpbWl0NjQoJWQpIGhhZCAlcyA9ICUiIFBSSXg2NCAiIGJ1dCAiCj4+Pj4gX19O
Ul9nZXRybGltaXRfdWxvbmdfc3RyICIoJWQpIGhhZCAlcyA9ICVseCIsCj4+Pj4gLQkJCXJlc291
cmNlLCBraW5kLCB2YWxfdTY0LAo+Pj4+ICsJCXRzdF9yZXMoVEZBSUwsICJTSUdORURfR0VUUkxJ
TUlUID0gJWQgX19XT1JEU0laRSAlZCBVTE9OR19NQVggPSAlbHUKPj4+PiBSTElNX0lORklOSVRZ
X1VMID0gJWx1IF9fTlJfcHJsaW1pdDY0KCVkKSBoYWQgJXMgPSAlIiBQUkl4NjQgIiBidXQgIgo+
Pj4+IF9fTlJfZ2V0cmxpbWl0X3Vsb25nX3N0ciAiKCVkKSBoYWQgJXMgPSAlbHgiLAo+Pj4+ICsJ
CQlTSUdORURfR0VUUkxJTUlULCBfX1dPUkRTSVpFLCBVTE9OR19NQVgsIFJMSU1fSU5GSU5JVFlf
VUwsIHJlc291cmNlLAo+Pj4gSSBzdWdnZXN0IHRvIHNwbGl0IGl0IGludG8gYW5vdGhlciB0c3Rf
cmVzKCkgbWVzc2FnZSwgbGluZSBhYm92ZSBpcyBuZWFybHkKPj4+IDIwMCBjaGFyYWN0ZXJzLgo+
Pgo+PiBTb3JyeSwgSSBzaG91bGRuJ3QgYXBwZW5kIGRlYnVnIGNvZGUgdG8gcGF0Y2guCj4+Cj4+
IC0tSG9uZ3poaQo+Pgo+Pgo+Pj4gUmVnYXJkcywKPj4+IEphbgo+Pj4KPj4+PiBraW5kLCB2YWxf
dTY0LAo+Pj4+ICAgIAkJCXJlc291cmNlLCBraW5kLCB2YWxfdWwpOwo+Pj4+ICAgIAkJcmV0dXJu
IC0xOwo+Pj4+ICAgIAl9Cj4+Pj4gLS0KPj4+PiAyLjguMQo+Pj4+Cj4+Pj4KPj4+PiAtLQo+Pj4+
IE1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo+
Pj4+CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
