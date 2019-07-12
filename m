Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D2B66AAD
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 12:06:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAE423C1D15
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 12:06:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C33B13C1C86
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 12:06:48 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 581CD603458
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 12:06:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E33D9882EF;
 Fri, 12 Jul 2019 10:06:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9D7D5D71A;
 Fri, 12 Jul 2019 10:06:45 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D091424F19;
 Fri, 12 Jul 2019 10:06:45 +0000 (UTC)
Date: Fri, 12 Jul 2019 06:06:42 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Song Hongzhi <hongzhi.song@windriver.com>
Message-ID: <408284891.32847796.1562926002494.JavaMail.zimbra@redhat.com>
In-Reply-To: <c15e6a0a-34dd-100a-2a42-066a1e23f206@windriver.com>
References: <1562826026-158569-1-git-send-email-hongzhi.song@windriver.com>
 <408194681.32599099.1562831328308.JavaMail.zimbra@redhat.com>
 <c0c07134-f5a8-b4d3-c210-c58c36653423@windriver.com>
 <1691784527.32812965.1562915669160.JavaMail.zimbra@redhat.com>
 <c15e6a0a-34dd-100a-2a42-066a1e23f206@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.15]
Thread-Topic: getrlimit03: adjust a bit of code to compatiable with mips32
Thread-Index: aoA7hNHMhzDGKGBls160YEynVDtDQA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 12 Jul 2019 10:06:45 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gCj4gT24gNy8xMi8xOSAzOjE0IFBNLCBK
YW4gU3RhbmNlayB3cm90ZToKPiA+IC0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiA+PiBP
biA3LzExLzE5IDM6NDggUE0sIEphbiBTdGFuY2VrIHdyb3RlOgo+ID4+PiAtLS0tLSBPcmlnaW5h
bCBNZXNzYWdlIC0tLS0tCj4gPj4+PiBFcnJvciBpbmZvOgo+ID4+Pj4gZ2V0cmxpbWl0MDMuYzox
MDQ6IEZBSUw6IF9fTlJfcHJsaW1pdDY0KDApIGhhZCBybGltX2N1ciA9Cj4gPj4+PiBmZmZmZmZm
ZmZmZmZmZmZmIGJ1dCBfX05SX2dldHJsaW1pdCgwKSBoYWQgcmxpbV9jdXIgPSA3ZmZmZmZmZgo+
ID4+Pj4KPiA+Pj4+IEFjY29yZGluZyB0byBrZXJuZWwgY29kZTogW2FyY2gvbWlwcy9pbmNsdWRl
L3VhcGkvYXNtL3Jlc291cmNlLmhdCj4gPj4+PiBSTElNX0lORklOSVRZIGlzIHNldCB0byAweDdm
ZmZmZmZmVUwgaW5zdGVhZCBvZiBVTE9OR19NQVggb24gbWlwczMyLgo+ID4+Pj4KPiA+Pj4+IC8q
Cj4gPj4+PiAgICAqIFN1UyBzYXlzIGxpbWl0cyBoYXZlIHRvIGJlIHVuc2lnbmVkLgo+ID4+Pj4g
ICAgKiBXaGljaCBtYWtlcyBhIHRvbiBtb3JlIHNlbnNlIGFueXdheSwKPiA+Pj4+ICAgICogYnV0
IHdlIGtlZXAgdGhlIG9sZCB2YWx1ZSBvbiBNSVBTMzIsCj4gPj4+PiAgICAqIGZvciBjb21wYXRp
YmlsaXR5Ogo+ID4+Pj4gICAgKi8KPiA+Pj4+ICNpZm5kZWYgX19taXBzNjQKPiA+Pj4+ICMgZGVm
aW5lIFJMSU1fSU5GSU5JVFkgICAgICAweDdmZmZmZmZmVUwKPiA+Pj4+ICNlbmRpZgo+ID4+Pj4K
PiA+Pj4+IEFkZGluZyBjb25kaXRpb25hbCBzdGF0ZW1lbnQgYWJvdXQgbWlwcyB0byBmaXggdGhp
cy4KPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBIb25nemhpLlNvbmcgPGhvbmd6aGkuc29u
Z0B3aW5kcml2ZXIuY29tPgo+ID4+Pj4gLS0tCj4gPj4+PiAgICB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5jIHwgMTAgKysrKysrKystLQo+ID4+Pj4gICAg
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4+Cj4g
Pj4+PiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXRybGltaXQvZ2V0
cmxpbWl0MDMuYwo+ID4+Pj4gYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJsaW1pdC9n
ZXRybGltaXQwMy5jCj4gPj4+PiBpbmRleCBlNGQ1NmM0Li4xOTAzNTU4IDEwMDY0NAo+ID4+Pj4g
LS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXRybGltaXQvZ2V0cmxpbWl0MDMuYwo+
ID4+Pj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXRybGltaXQvZ2V0cmxpbWl0
MDMuYwo+ID4+Pj4gQEAgLTYxLDcgKzYxLDEzIEBAIHN0cnVjdCBybGltaXRfdWxvbmcgewo+ID4+
Pj4gICAgCXVuc2lnbmVkIGxvbmcgcmxpbV9jdXI7Cj4gPj4+PiAgICAJdW5zaWduZWQgbG9uZyBy
bGltX21heDsKPiA+Pj4+ICAgIH07Cj4gPj4+PiArI2lmZGVmIF9fbWlwcwo+ID4+Pj4gKyNpZm5k
ZWYgX19taXBzNjQKPiA+Pj4+ICtjb25zdCB1bnNpZ25lZCBsb25nIFJMSU1fSU5GSU5JVFlfVUwg
PSAweDdmZmZmZmZmVUw7Cj4gPj4+PiArI2Vsc2UKPiA+Pj4+ICAgIGNvbnN0IHVuc2lnbmVkIGxv
bmcgUkxJTV9JTkZJTklUWV9VTCA9IFVMT05HX01BWDsKPiA+Pj4+ICsjZW5kaWYKPiA+Pj4+ICsj
ZW5kaWYKPiA+Pj4gSGksCj4gPj4+Cj4gPj4+IFRoaXMgd2lsbCBicmVhayBldmVyeSBvdGhlciBh
cmNoLCBiZWNhdXNlIGl0J3Mgbm93IHVuZGVmaW5lZCBldmVyeXdoZXJlCj4gPj4+IGV4Y2VwdCBt
aXBzLgo+ID4+Cj4gPj4gSXMgdGhlcmUgYSBnb29kIHdheSB0byBmaWx0ZXIgbWlwczMyPwo+ID4g
TWF5YmUgc29tZXRoaW5nIGxpa2U6Cj4gPgo+ID4gI2luY2x1ZGUgImxhcGkvYWJpc2l6ZS5oIgo+
ID4KPiA+ICNpZiBkZWZpbmVkKF9fbWlwc19fKSAmJiBkZWZpbmVkKFRTVF9BQkkzMikKPiA+IGNv
bnN0IHVuc2lnbmVkIGxvbmcgUkxJTV9JTkZJTklUWV9VTCA9IDB4N2ZmZmZmZmZVTDsKPiA+ICNl
bHNlCj4gPiBjb25zdCB1bnNpZ25lZCBsb25nIFJMSU1fSU5GSU5JVFlfVUwgPSBVTE9OR19NQVg7
Cj4gPiAjZW5kaWYKPiAKPiAKPiBUU1RfQUJJMzIgbG9va3MgbGlrZSBub3Qgd29yawoKQ2FuIHlv
dSBlbGFib3JhdGU/Cgo+LCBhbmQgSSBzZW50IHBhdGNoLVYzIHVzaW5nIF9fbWlwcyBhbmQgX19t
aXBzNjQuCj4gCj4gLS1Ib25nemhpCj4gCj4gCj4gPgo+ID4+IEkgdHJpZWQKPiA+Pgo+ID4+ICAg
wqA2NSAjaWZkZWYgX19taXBzCj4gPj4gICDCoDY2ICNpZm5kZWYgX19taXBzNjQKPiA+PiAgIMKg
NjcgY29uc3QgdW5zaWduZWQgbG9uZyBSTElNX0lORklOSVRZX1VMID0gMHg3ZmZmZmZmZlVMOwo+
ID4+ICAgwqA2OCAjZW5kaWYKPiA+PiAgIMKgNjkgY29uc3QgdW5zaWduZWQgbG9uZyBSTElNX0lO
RklOSVRZX1VMID0gVUxPTkdfTUFYOwo+ID4+ICAgwqA3MCAjZWxzZQo+ID4+ICAgwqA3MSBjb25z
dCB1bnNpZ25lZCBsb25nIFJMSU1fSU5GSU5JVFlfVUwgPSBVTE9OR19NQVg7Cj4gPj4gICDCoDcy
ICNlbmRpZgo+ID4+Cj4gPj4gYnV0IG1pcHMzMiB0aGlua3MgdGhlIFJMSU1fSU5GSU5JVFlfVUwg
bWljcm8gaXMgcmVkZWZpbmVkLgo+ID4+Cj4gPj4KPiA+Pj4+ICAgIAo+ID4+Pj4gICAgc3RhdGlj
IGludCBnZXRybGltaXRfdWxvbmcoaW50IHJlc291cmNlLCBzdHJ1Y3QgcmxpbWl0X3Vsb25nICpy
bGltKQo+ID4+Pj4gICAgewo+ID4+Pj4gQEAgLTEwMSw4ICsxMDcsOCBAQCBzdGF0aWMgaW50IGNv
bXBhcmVfdTY0X3Vsb25nKGludCByZXNvdXJjZSwgdWludDY0X3QKPiA+Pj4+IHZhbF91NjQsCj4g
Pj4+PiAgICB7Cj4gPj4+PiAgICAJaWYgKCh2YWxfdTY0ID4gUkxJTV9JTkZJTklUWV9VTCAmJiB2
YWxfdWwgIT0gUkxJTV9JTkZJTklUWV9VTCkgfHwKPiA+Pj4+ICAgIAkgICAgKHZhbF91NjQgPD0g
UkxJTV9JTkZJTklUWV9VTCAmJiB2YWxfdWwgIT0gdmFsX3U2NCkpIHsKPiA+Pj4+IC0JCXRzdF9y
ZXMoVEZBSUwsICJfX05SX3BybGltaXQ2NCglZCkgaGFkICVzID0gJSIgUFJJeDY0ICIgYnV0ICIK
PiA+Pj4+IF9fTlJfZ2V0cmxpbWl0X3Vsb25nX3N0ciAiKCVkKSBoYWQgJXMgPSAlbHgiLAo+ID4+
Pj4gLQkJCXJlc291cmNlLCBraW5kLCB2YWxfdTY0LAo+ID4+Pj4gKwkJdHN0X3JlcyhURkFJTCwg
IlNJR05FRF9HRVRSTElNSVQgPSAlZCBfX1dPUkRTSVpFICVkIFVMT05HX01BWCA9ICVsdQo+ID4+
Pj4gUkxJTV9JTkZJTklUWV9VTCA9ICVsdSBfX05SX3BybGltaXQ2NCglZCkgaGFkICVzID0gJSIg
UFJJeDY0ICIgYnV0ICIKPiA+Pj4+IF9fTlJfZ2V0cmxpbWl0X3Vsb25nX3N0ciAiKCVkKSBoYWQg
JXMgPSAlbHgiLAo+ID4+Pj4gKwkJCVNJR05FRF9HRVRSTElNSVQsIF9fV09SRFNJWkUsIFVMT05H
X01BWCwgUkxJTV9JTkZJTklUWV9VTCwgcmVzb3VyY2UsCj4gPj4+IEkgc3VnZ2VzdCB0byBzcGxp
dCBpdCBpbnRvIGFub3RoZXIgdHN0X3JlcygpIG1lc3NhZ2UsIGxpbmUgYWJvdmUgaXMKPiA+Pj4g
bmVhcmx5Cj4gPj4+IDIwMCBjaGFyYWN0ZXJzLgo+ID4+Cj4gPj4gU29ycnksIEkgc2hvdWxkbid0
IGFwcGVuZCBkZWJ1ZyBjb2RlIHRvIHBhdGNoLgo+ID4+Cj4gPj4gLS1Ib25nemhpCj4gPj4KPiA+
Pgo+ID4+PiBSZWdhcmRzLAo+ID4+PiBKYW4KPiA+Pj4KPiA+Pj4+IGtpbmQsIHZhbF91NjQsCj4g
Pj4+PiAgICAJCQlyZXNvdXJjZSwga2luZCwgdmFsX3VsKTsKPiA+Pj4+ICAgIAkJcmV0dXJuIC0x
Owo+ID4+Pj4gICAgCX0KPiA+Pj4+IC0tCj4gPj4+PiAyLjguMQo+ID4+Pj4KPiA+Pj4+Cj4gPj4+
PiAtLQo+ID4+Pj4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCj4gPj4+Pgo+IAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
