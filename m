Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC98666BC
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 08:07:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D18843C1D17
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 08:07:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 617063C1C97
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 08:07:41 +0200 (CEST)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4CD5060264D
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 08:07:41 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6C67VWb017711
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Thu, 11 Jul 2019 23:07:31 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Thu, 11 Jul 2019 23:07:30 -0700
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <1562826026-158569-1-git-send-email-hongzhi.song@windriver.com>
 <408194681.32599099.1562831328308.JavaMail.zimbra@redhat.com>
 <c0c07134-f5a8-b4d3-c210-c58c36653423@windriver.com>
 <5D2821EB.6070807@cn.fujitsu.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <ec56cf78-fb3d-4fc2-a35f-387041c8ccea@windriver.com>
Date: Fri, 12 Jul 2019 14:07:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5D2821EB.6070807@cn.fujitsu.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

Ck9uIDcvMTIvMTkgMjowMCBQTSwgWWFuZyBYdSB3cm90ZToKPiBvbiAyMDE5LzA3LzEyIDEzOjQ2
LCBIb25nemhpLCBTb25nIHdyb3RlOgo+Pgo+PiBPbiA3LzExLzE5IDM6NDggUE0sIEphbiBTdGFu
Y2VrIHdyb3RlOgo+Pj4KPj4+IC0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPj4+PiBFcnJv
ciBpbmZvOgo+Pj4+IGdldHJsaW1pdDAzLmM6MTA0OiBGQUlMOiBfX05SX3BybGltaXQ2NCgwKSBo
YWQgcmxpbV9jdXIgPQo+Pj4+IGZmZmZmZmZmZmZmZmZmZmYgYnV0IF9fTlJfZ2V0cmxpbWl0KDAp
IGhhZCBybGltX2N1ciA9IDdmZmZmZmZmCj4+Pj4KPj4+PiBBY2NvcmRpbmcgdG8ga2VybmVsIGNv
ZGU6IFthcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9yZXNvdXJjZS5oXQo+Pj4+IFJMSU1fSU5G
SU5JVFkgaXMgc2V0IHRvIDB4N2ZmZmZmZmZVTCBpbnN0ZWFkIG9mIFVMT05HX01BWCBvbiBtaXBz
MzIuCj4+Pj4KPj4+PiAvKgo+Pj4+IMKgICogU3VTIHNheXMgbGltaXRzIGhhdmUgdG8gYmUgdW5z
aWduZWQuCj4+Pj4gwqAgKiBXaGljaCBtYWtlcyBhIHRvbiBtb3JlIHNlbnNlIGFueXdheSwKPj4+
PiDCoCAqIGJ1dCB3ZSBrZWVwIHRoZSBvbGQgdmFsdWUgb24gTUlQUzMyLAo+Pj4+IMKgICogZm9y
IGNvbXBhdGliaWxpdHk6Cj4+Pj4gwqAgKi8KPj4+PiAjaWZuZGVmIF9fbWlwczY0Cj4+Pj4gIyBk
ZWZpbmUgUkxJTV9JTkZJTklUWcKgwqDCoMKgwqAgMHg3ZmZmZmZmZlVMCj4+Pj4gI2VuZGlmCj4+
Pj4KPj4+PiBBZGRpbmcgY29uZGl0aW9uYWwgc3RhdGVtZW50IGFib3V0IG1pcHMgdG8gZml4IHRo
aXMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBIb25nemhpLlNvbmcgPGhvbmd6aGkuc29uZ0B3
aW5kcml2ZXIuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
Z2V0cmxpbWl0L2dldHJsaW1pdDAzLmMgfCAxMCArKysrKysrKy0tCj4+Pj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1n
aXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5jCj4+
Pj4gYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5jCj4+
Pj4gaW5kZXggZTRkNTZjNC4uMTkwMzU1OCAxMDA2NDQKPj4+PiAtLS0gYS90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5jCj4+Pj4gKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9nZXRybGltaXQvZ2V0cmxpbWl0MDMuYwo+Pj4+IEBAIC02MSw3ICs2
MSwxMyBAQCBzdHJ1Y3QgcmxpbWl0X3Vsb25nIHsKPj4+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGxv
bmcgcmxpbV9jdXI7Cj4+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHJsaW1fbWF4Owo+Pj4+
IMKgIH07Cj4+Pj4gKyNpZmRlZiBfX21pcHMKPj4+PiArI2lmbmRlZiBfX21pcHM2NAo+Pj4+ICtj
b25zdCB1bnNpZ25lZCBsb25nIFJMSU1fSU5GSU5JVFlfVUwgPSAweDdmZmZmZmZmVUw7Cj4+Pj4g
KyNlbHNlCj4+Pj4gwqAgY29uc3QgdW5zaWduZWQgbG9uZyBSTElNX0lORklOSVRZX1VMID0gVUxP
TkdfTUFYOwo+Pj4+ICsjZW5kaWYKPj4+PiArI2VuZGlmCj4+PiBIaSwKPj4+Cj4+PiBUaGlzIHdp
bGwgYnJlYWsgZXZlcnkgb3RoZXIgYXJjaCwgYmVjYXVzZSBpdCdzIG5vdyB1bmRlZmluZWQgCj4+
PiBldmVyeXdoZXJlIGV4Y2VwdCBtaXBzLgo+Pgo+Pgo+PiBJcyB0aGVyZSBhIGdvb2Qgd2F5IHRv
IGZpbHRlciBtaXBzMzI/Cj4+Cj4+IEkgdHJpZWQKPj4KPj4gwqA2NSAjaWZkZWYgX19taXBzCj4+
IMKgNjYgI2lmbmRlZiBfX21pcHM2NAo+PiDCoDY3IGNvbnN0IHVuc2lnbmVkIGxvbmcgUkxJTV9J
TkZJTklUWV9VTCA9IDB4N2ZmZmZmZmZVTDsKPj4gwqA2OCAjZW5kaWYKPj4gwqA2OSBjb25zdCB1
bnNpZ25lZCBsb25nIFJMSU1fSU5GSU5JVFlfVUwgPSBVTE9OR19NQVg7Cj4+IMKgNzAgI2Vsc2UK
Pj4gwqA3MSBjb25zdCB1bnNpZ25lZCBsb25nIFJMSU1fSU5GSU5JVFlfVUwgPSBVTE9OR19NQVg7
Cj4+IMKgNzIgI2VuZGlmCj4+Cj4+IGJ1dCBtaXBzMzIgdGhpbmtzIHRoZSBSTElNX0lORklOSVRZ
X1VMIG1pY3JvIGlzIHJlZGVmaW5lZC4KPgo+IEhpIGhvbmd6aGkKPgo+IFlvdSByZWRlZmluZSBS
TElNX0lORklOSVRZX1VMIG1hY3JvIGluZGVlZCB3aGVuIG9uIG1pcHMzMiBiZWNhdXNlIGxpbmUg
Cj4gNjcgYW5kIDY5Lgo+Cj4gSXQgc2hvdWxkIGJlIGFzIGJlbG93Ogo+ICsjaWZkZWYgX19taXBz
Cj4gKyNpZm5kZWYgX19taXBzNjQKPiArY29uc3QgdW5zaWduZWQgbG9uZyBSTElNX0lORklOSVRZ
X1VMID0gMHg3ZmZmZmZmZlVMOwo+ICNlbmRpZgo+ICsjZWxzZQo+ICtjb25zdCB1bnNpZ25lZCBs
b25nIFJMSU1fSU5GSU5JVFlfVUwgPSBVTE9OR19NQVg7Cj4gKyNlbmRpZgo+CgpUaGFua3MgZm9y
IHlvdXIgcmVwbHkuCgpCdXQgdGhpcyB3aWxsIGV4Y2x1ZGUgbWlwczY0LgoKLS1Ib25nemhpCgoK
Pgo+Cj4+Cj4+Cj4+Pgo+Pj4+IMKgwqDCoCBzdGF0aWMgaW50IGdldHJsaW1pdF91bG9uZyhpbnQg
cmVzb3VyY2UsIHN0cnVjdCBybGltaXRfdWxvbmcgCj4+Pj4gKnJsaW0pCj4+Pj4gwqAgewo+Pj4+
IEBAIC0xMDEsOCArMTA3LDggQEAgc3RhdGljIGludCBjb21wYXJlX3U2NF91bG9uZyhpbnQgcmVz
b3VyY2UsIAo+Pj4+IHVpbnQ2NF90Cj4+Pj4gdmFsX3U2NCwKPj4+PiDCoCB7Cj4+Pj4gwqDCoMKg
wqDCoCBpZiAoKHZhbF91NjQgPiBSTElNX0lORklOSVRZX1VMICYmIHZhbF91bCAhPSAKPj4+PiBS
TElNX0lORklOSVRZX1VMKSB8fAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAodmFsX3U2NCA8PSBS
TElNX0lORklOSVRZX1VMICYmIHZhbF91bCAhPSB2YWxfdTY0KSkgewo+Pj4+IC3CoMKgwqDCoMKg
wqDCoCB0c3RfcmVzKFRGQUlMLCAiX19OUl9wcmxpbWl0NjQoJWQpIGhhZCAlcyA9ICUiIFBSSXg2
NCAiIGJ1dCAiCj4+Pj4gX19OUl9nZXRybGltaXRfdWxvbmdfc3RyICIoJWQpIGhhZCAlcyA9ICVs
eCIsCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzb3VyY2UsIGtpbmQsIHZhbF91NjQs
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVEZBSUwsICJTSUdORURfR0VUUkxJTUlUID0g
JWQgX19XT1JEU0laRSAlZCAKPj4+PiBVTE9OR19NQVggPSAlbHUKPj4+PiBSTElNX0lORklOSVRZ
X1VMID0gJWx1IF9fTlJfcHJsaW1pdDY0KCVkKSBoYWQgJXMgPSAlIiBQUkl4NjQgIiBidXQgIgo+
Pj4+IF9fTlJfZ2V0cmxpbWl0X3Vsb25nX3N0ciAiKCVkKSBoYWQgJXMgPSAlbHgiLAo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNJR05FRF9HRVRSTElNSVQsIF9fV09SRFNJWkUsIFVMT05H
X01BWCwgCj4+Pj4gUkxJTV9JTkZJTklUWV9VTCwgcmVzb3VyY2UsCj4+PiBJIHN1Z2dlc3QgdG8g
c3BsaXQgaXQgaW50byBhbm90aGVyIHRzdF9yZXMoKSBtZXNzYWdlLCBsaW5lIGFib3ZlIGlzIAo+
Pj4gbmVhcmx5IDIwMCBjaGFyYWN0ZXJzLgo+Pgo+Pgo+PiBTb3JyeSwgSSBzaG91bGRuJ3QgYXBw
ZW5kIGRlYnVnIGNvZGUgdG8gcGF0Y2guCj4+Cj4+IC0tSG9uZ3poaQo+Pgo+Pgo+Pj4KPj4+IFJl
Z2FyZHMsCj4+PiBKYW4KPj4+Cj4+Pj4ga2luZCwgdmFsX3U2NCwKPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXNvdXJjZSwga2luZCwgdmFsX3VsKTsKPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC0xOwo+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+IC0tIAo+Pj4+IDIuOC4xCj4+
Pj4KPj4+Pgo+Pj4+IC0tIAo+Pj4+IE1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo+Pj4+Cj4+Cj4KPgo+Cj4KCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
