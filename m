Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2365966698
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 07:47:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4FCD3C1CE6
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 07:47:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D72B63C1C7F
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 07:47:01 +0200 (CEST)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 41C441A00EB2
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 07:46:57 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6C5kqUa010344
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Thu, 11 Jul 2019 22:46:52 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Thu, 11 Jul 2019 22:46:51 -0700
To: Jan Stancek <jstancek@redhat.com>
References: <1562826026-158569-1-git-send-email-hongzhi.song@windriver.com>
 <408194681.32599099.1562831328308.JavaMail.zimbra@redhat.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <c0c07134-f5a8-b4d3-c210-c58c36653423@windriver.com>
Date: Fri, 12 Jul 2019 13:46:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <408194681.32599099.1562831328308.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

Ck9uIDcvMTEvMTkgMzo0OCBQTSwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4KPiAtLS0tLSBPcmlnaW5h
bCBNZXNzYWdlIC0tLS0tCj4+IEVycm9yIGluZm86Cj4+IGdldHJsaW1pdDAzLmM6MTA0OiBGQUlM
OiBfX05SX3BybGltaXQ2NCgwKSBoYWQgcmxpbV9jdXIgPQo+PiBmZmZmZmZmZmZmZmZmZmZmIGJ1
dCBfX05SX2dldHJsaW1pdCgwKSBoYWQgcmxpbV9jdXIgPSA3ZmZmZmZmZgo+Pgo+PiBBY2NvcmRp
bmcgdG8ga2VybmVsIGNvZGU6IFthcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9yZXNvdXJjZS5o
XQo+PiBSTElNX0lORklOSVRZIGlzIHNldCB0byAweDdmZmZmZmZmVUwgaW5zdGVhZCBvZiBVTE9O
R19NQVggb24gbWlwczMyLgo+Pgo+PiAvKgo+PiAgICogU3VTIHNheXMgbGltaXRzIGhhdmUgdG8g
YmUgdW5zaWduZWQuCj4+ICAgKiBXaGljaCBtYWtlcyBhIHRvbiBtb3JlIHNlbnNlIGFueXdheSwK
Pj4gICAqIGJ1dCB3ZSBrZWVwIHRoZSBvbGQgdmFsdWUgb24gTUlQUzMyLAo+PiAgICogZm9yIGNv
bXBhdGliaWxpdHk6Cj4+ICAgKi8KPj4gI2lmbmRlZiBfX21pcHM2NAo+PiAjIGRlZmluZSBSTElN
X0lORklOSVRZICAgICAgMHg3ZmZmZmZmZlVMCj4+ICNlbmRpZgo+Pgo+PiBBZGRpbmcgY29uZGl0
aW9uYWwgc3RhdGVtZW50IGFib3V0IG1pcHMgdG8gZml4IHRoaXMuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEhvbmd6aGkuU29uZyA8aG9uZ3poaS5zb25nQHdpbmRyaXZlci5jb20+Cj4+IC0tLQo+PiAg
IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0cmxpbWl0L2dldHJsaW1pdDAzLmMgfCAxMCAr
KysrKysrKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0cmxp
bWl0L2dldHJsaW1pdDAzLmMKPj4gYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJsaW1p
dC9nZXRybGltaXQwMy5jCj4+IGluZGV4IGU0ZDU2YzQuLjE5MDM1NTggMTAwNjQ0Cj4+IC0tLSBh
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0cmxpbWl0L2dldHJsaW1pdDAzLmMKPj4gKysr
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXRybGltaXQvZ2V0cmxpbWl0MDMuYwo+PiBA
QCAtNjEsNyArNjEsMTMgQEAgc3RydWN0IHJsaW1pdF91bG9uZyB7Cj4+ICAgCXVuc2lnbmVkIGxv
bmcgcmxpbV9jdXI7Cj4+ICAgCXVuc2lnbmVkIGxvbmcgcmxpbV9tYXg7Cj4+ICAgfTsKPj4gKyNp
ZmRlZiBfX21pcHMKPj4gKyNpZm5kZWYgX19taXBzNjQKPj4gK2NvbnN0IHVuc2lnbmVkIGxvbmcg
UkxJTV9JTkZJTklUWV9VTCA9IDB4N2ZmZmZmZmZVTDsKPj4gKyNlbHNlCj4+ICAgY29uc3QgdW5z
aWduZWQgbG9uZyBSTElNX0lORklOSVRZX1VMID0gVUxPTkdfTUFYOwo+PiArI2VuZGlmCj4+ICsj
ZW5kaWYKPiBIaSwKPgo+IFRoaXMgd2lsbCBicmVhayBldmVyeSBvdGhlciBhcmNoLCBiZWNhdXNl
IGl0J3Mgbm93IHVuZGVmaW5lZCBldmVyeXdoZXJlIGV4Y2VwdCBtaXBzLgoKCklzIHRoZXJlIGEg
Z29vZCB3YXkgdG8gZmlsdGVyIG1pcHMzMj8KCkkgdHJpZWQKCiDCoDY1ICNpZmRlZiBfX21pcHMK
IMKgNjYgI2lmbmRlZiBfX21pcHM2NAogwqA2NyBjb25zdCB1bnNpZ25lZCBsb25nIFJMSU1fSU5G
SU5JVFlfVUwgPSAweDdmZmZmZmZmVUw7CiDCoDY4ICNlbmRpZgogwqA2OSBjb25zdCB1bnNpZ25l
ZCBsb25nIFJMSU1fSU5GSU5JVFlfVUwgPSBVTE9OR19NQVg7CiDCoDcwICNlbHNlCiDCoDcxIGNv
bnN0IHVuc2lnbmVkIGxvbmcgUkxJTV9JTkZJTklUWV9VTCA9IFVMT05HX01BWDsKIMKgNzIgI2Vu
ZGlmCgpidXQgbWlwczMyIHRoaW5rcyB0aGUgUkxJTV9JTkZJTklUWV9VTCBtaWNybyBpcyByZWRl
ZmluZWQuCgoKPgo+PiAgIAo+PiAgIHN0YXRpYyBpbnQgZ2V0cmxpbWl0X3Vsb25nKGludCByZXNv
dXJjZSwgc3RydWN0IHJsaW1pdF91bG9uZyAqcmxpbSkKPj4gICB7Cj4+IEBAIC0xMDEsOCArMTA3
LDggQEAgc3RhdGljIGludCBjb21wYXJlX3U2NF91bG9uZyhpbnQgcmVzb3VyY2UsIHVpbnQ2NF90
Cj4+IHZhbF91NjQsCj4+ICAgewo+PiAgIAlpZiAoKHZhbF91NjQgPiBSTElNX0lORklOSVRZX1VM
ICYmIHZhbF91bCAhPSBSTElNX0lORklOSVRZX1VMKSB8fAo+PiAgIAkgICAgKHZhbF91NjQgPD0g
UkxJTV9JTkZJTklUWV9VTCAmJiB2YWxfdWwgIT0gdmFsX3U2NCkpIHsKPj4gLQkJdHN0X3JlcyhU
RkFJTCwgIl9fTlJfcHJsaW1pdDY0KCVkKSBoYWQgJXMgPSAlIiBQUkl4NjQgIiBidXQgIgo+PiBf
X05SX2dldHJsaW1pdF91bG9uZ19zdHIgIiglZCkgaGFkICVzID0gJWx4IiwKPj4gLQkJCXJlc291
cmNlLCBraW5kLCB2YWxfdTY0LAo+PiArCQl0c3RfcmVzKFRGQUlMLCAiU0lHTkVEX0dFVFJMSU1J
VCA9ICVkIF9fV09SRFNJWkUgJWQgVUxPTkdfTUFYID0gJWx1Cj4+IFJMSU1fSU5GSU5JVFlfVUwg
PSAlbHUgX19OUl9wcmxpbWl0NjQoJWQpIGhhZCAlcyA9ICUiIFBSSXg2NCAiIGJ1dCAiCj4+IF9f
TlJfZ2V0cmxpbWl0X3Vsb25nX3N0ciAiKCVkKSBoYWQgJXMgPSAlbHgiLAo+PiArCQkJU0lHTkVE
X0dFVFJMSU1JVCwgX19XT1JEU0laRSwgVUxPTkdfTUFYLCBSTElNX0lORklOSVRZX1VMLCByZXNv
dXJjZSwKPiBJIHN1Z2dlc3QgdG8gc3BsaXQgaXQgaW50byBhbm90aGVyIHRzdF9yZXMoKSBtZXNz
YWdlLCBsaW5lIGFib3ZlIGlzIG5lYXJseSAyMDAgY2hhcmFjdGVycy4KCgpTb3JyeSwgSSBzaG91
bGRuJ3QgYXBwZW5kIGRlYnVnIGNvZGUgdG8gcGF0Y2guCgotLUhvbmd6aGkKCgo+Cj4gUmVnYXJk
cywKPiBKYW4KPgo+PiBraW5kLCB2YWxfdTY0LAo+PiAgIAkJCXJlc291cmNlLCBraW5kLCB2YWxf
dWwpOwo+PiAgIAkJcmV0dXJuIC0xOwo+PiAgIAl9Cj4+IC0tCj4+IDIuOC4xCj4+Cj4+Cj4+IC0t
Cj4+IE1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo+PgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
