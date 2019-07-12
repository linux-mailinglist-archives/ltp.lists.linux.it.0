Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A210266789
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 09:14:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6013C3C1CF4
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 09:14:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7D9DF3C1C91
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 09:14:36 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6038F602666
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 09:14:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ACD7786679;
 Fri, 12 Jul 2019 07:14:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 909A25C69A;
 Fri, 12 Jul 2019 07:14:32 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87E5B18184A5;
 Fri, 12 Jul 2019 07:14:32 +0000 (UTC)
Date: Fri, 12 Jul 2019 03:14:29 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Song Hongzhi <hongzhi.song@windriver.com>
Message-ID: <1691784527.32812965.1562915669160.JavaMail.zimbra@redhat.com>
In-Reply-To: <c0c07134-f5a8-b4d3-c210-c58c36653423@windriver.com>
References: <1562826026-158569-1-git-send-email-hongzhi.song@windriver.com>
 <408194681.32599099.1562831328308.JavaMail.zimbra@redhat.com>
 <c0c07134-f5a8-b4d3-c210-c58c36653423@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.12]
Thread-Topic: getrlimit03: adjust a bit of code to compatiable with mips32
Thread-Index: z65Zfmy3BaO5TwL1keMkNS06YUOTAQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 12 Jul 2019 07:14:32 +0000 (UTC)
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiAKPiBPbiA3LzExLzE5IDM6NDggUE0sIEph
biBTdGFuY2VrIHdyb3RlOgo+ID4KPiA+IC0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiA+
PiBFcnJvciBpbmZvOgo+ID4+IGdldHJsaW1pdDAzLmM6MTA0OiBGQUlMOiBfX05SX3BybGltaXQ2
NCgwKSBoYWQgcmxpbV9jdXIgPQo+ID4+IGZmZmZmZmZmZmZmZmZmZmYgYnV0IF9fTlJfZ2V0cmxp
bWl0KDApIGhhZCBybGltX2N1ciA9IDdmZmZmZmZmCj4gPj4KPiA+PiBBY2NvcmRpbmcgdG8ga2Vy
bmVsIGNvZGU6IFthcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9yZXNvdXJjZS5oXQo+ID4+IFJM
SU1fSU5GSU5JVFkgaXMgc2V0IHRvIDB4N2ZmZmZmZmZVTCBpbnN0ZWFkIG9mIFVMT05HX01BWCBv
biBtaXBzMzIuCj4gPj4KPiA+PiAvKgo+ID4+ICAgKiBTdVMgc2F5cyBsaW1pdHMgaGF2ZSB0byBi
ZSB1bnNpZ25lZC4KPiA+PiAgICogV2hpY2ggbWFrZXMgYSB0b24gbW9yZSBzZW5zZSBhbnl3YXks
Cj4gPj4gICAqIGJ1dCB3ZSBrZWVwIHRoZSBvbGQgdmFsdWUgb24gTUlQUzMyLAo+ID4+ICAgKiBm
b3IgY29tcGF0aWJpbGl0eToKPiA+PiAgICovCj4gPj4gI2lmbmRlZiBfX21pcHM2NAo+ID4+ICMg
ZGVmaW5lIFJMSU1fSU5GSU5JVFkgICAgICAweDdmZmZmZmZmVUwKPiA+PiAjZW5kaWYKPiA+Pgo+
ID4+IEFkZGluZyBjb25kaXRpb25hbCBzdGF0ZW1lbnQgYWJvdXQgbWlwcyB0byBmaXggdGhpcy4K
PiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEhvbmd6aGkuU29uZyA8aG9uZ3poaS5zb25nQHdpbmRy
aXZlci5jb20+Cj4gPj4gLS0tCj4gPj4gICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJs
aW1pdC9nZXRybGltaXQwMy5jIHwgMTAgKysrKysrKystLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5jCj4gPj4gYi90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5jCj4gPj4gaW5k
ZXggZTRkNTZjNC4uMTkwMzU1OCAxMDA2NDQKPiA+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5jCj4gPj4gKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9nZXRybGltaXQvZ2V0cmxpbWl0MDMuYwo+ID4+IEBAIC02MSw3ICs2MSwxMyBA
QCBzdHJ1Y3QgcmxpbWl0X3Vsb25nIHsKPiA+PiAgIAl1bnNpZ25lZCBsb25nIHJsaW1fY3VyOwo+
ID4+ICAgCXVuc2lnbmVkIGxvbmcgcmxpbV9tYXg7Cj4gPj4gICB9Owo+ID4+ICsjaWZkZWYgX19t
aXBzCj4gPj4gKyNpZm5kZWYgX19taXBzNjQKPiA+PiArY29uc3QgdW5zaWduZWQgbG9uZyBSTElN
X0lORklOSVRZX1VMID0gMHg3ZmZmZmZmZlVMOwo+ID4+ICsjZWxzZQo+ID4+ICAgY29uc3QgdW5z
aWduZWQgbG9uZyBSTElNX0lORklOSVRZX1VMID0gVUxPTkdfTUFYOwo+ID4+ICsjZW5kaWYKPiA+
PiArI2VuZGlmCj4gPiBIaSwKPiA+Cj4gPiBUaGlzIHdpbGwgYnJlYWsgZXZlcnkgb3RoZXIgYXJj
aCwgYmVjYXVzZSBpdCdzIG5vdyB1bmRlZmluZWQgZXZlcnl3aGVyZQo+ID4gZXhjZXB0IG1pcHMu
Cj4gCj4gCj4gSXMgdGhlcmUgYSBnb29kIHdheSB0byBmaWx0ZXIgbWlwczMyPwoKTWF5YmUgc29t
ZXRoaW5nIGxpa2U6CgojaW5jbHVkZSAibGFwaS9hYmlzaXplLmgiCgojaWYgZGVmaW5lZChfX21p
cHNfXykgJiYgZGVmaW5lZChUU1RfQUJJMzIpCmNvbnN0IHVuc2lnbmVkIGxvbmcgUkxJTV9JTkZJ
TklUWV9VTCA9IDB4N2ZmZmZmZmZVTDsKI2Vsc2UKY29uc3QgdW5zaWduZWQgbG9uZyBSTElNX0lO
RklOSVRZX1VMID0gVUxPTkdfTUFYOwojZW5kaWYKCgo+IAo+IEkgdHJpZWQKPiAKPiAgwqA2NSAj
aWZkZWYgX19taXBzCj4gIMKgNjYgI2lmbmRlZiBfX21pcHM2NAo+ICDCoDY3IGNvbnN0IHVuc2ln
bmVkIGxvbmcgUkxJTV9JTkZJTklUWV9VTCA9IDB4N2ZmZmZmZmZVTDsKPiAgwqA2OCAjZW5kaWYK
PiAgwqA2OSBjb25zdCB1bnNpZ25lZCBsb25nIFJMSU1fSU5GSU5JVFlfVUwgPSBVTE9OR19NQVg7
Cj4gIMKgNzAgI2Vsc2UKPiAgwqA3MSBjb25zdCB1bnNpZ25lZCBsb25nIFJMSU1fSU5GSU5JVFlf
VUwgPSBVTE9OR19NQVg7Cj4gIMKgNzIgI2VuZGlmCj4gCj4gYnV0IG1pcHMzMiB0aGlua3MgdGhl
IFJMSU1fSU5GSU5JVFlfVUwgbWljcm8gaXMgcmVkZWZpbmVkLgo+IAo+IAo+ID4KPiA+PiAgIAo+
ID4+ICAgc3RhdGljIGludCBnZXRybGltaXRfdWxvbmcoaW50IHJlc291cmNlLCBzdHJ1Y3Qgcmxp
bWl0X3Vsb25nICpybGltKQo+ID4+ICAgewo+ID4+IEBAIC0xMDEsOCArMTA3LDggQEAgc3RhdGlj
IGludCBjb21wYXJlX3U2NF91bG9uZyhpbnQgcmVzb3VyY2UsIHVpbnQ2NF90Cj4gPj4gdmFsX3U2
NCwKPiA+PiAgIHsKPiA+PiAgIAlpZiAoKHZhbF91NjQgPiBSTElNX0lORklOSVRZX1VMICYmIHZh
bF91bCAhPSBSTElNX0lORklOSVRZX1VMKSB8fAo+ID4+ICAgCSAgICAodmFsX3U2NCA8PSBSTElN
X0lORklOSVRZX1VMICYmIHZhbF91bCAhPSB2YWxfdTY0KSkgewo+ID4+IC0JCXRzdF9yZXMoVEZB
SUwsICJfX05SX3BybGltaXQ2NCglZCkgaGFkICVzID0gJSIgUFJJeDY0ICIgYnV0ICIKPiA+PiBf
X05SX2dldHJsaW1pdF91bG9uZ19zdHIgIiglZCkgaGFkICVzID0gJWx4IiwKPiA+PiAtCQkJcmVz
b3VyY2UsIGtpbmQsIHZhbF91NjQsCj4gPj4gKwkJdHN0X3JlcyhURkFJTCwgIlNJR05FRF9HRVRS
TElNSVQgPSAlZCBfX1dPUkRTSVpFICVkIFVMT05HX01BWCA9ICVsdQo+ID4+IFJMSU1fSU5GSU5J
VFlfVUwgPSAlbHUgX19OUl9wcmxpbWl0NjQoJWQpIGhhZCAlcyA9ICUiIFBSSXg2NCAiIGJ1dCAi
Cj4gPj4gX19OUl9nZXRybGltaXRfdWxvbmdfc3RyICIoJWQpIGhhZCAlcyA9ICVseCIsCj4gPj4g
KwkJCVNJR05FRF9HRVRSTElNSVQsIF9fV09SRFNJWkUsIFVMT05HX01BWCwgUkxJTV9JTkZJTklU
WV9VTCwgcmVzb3VyY2UsCj4gPiBJIHN1Z2dlc3QgdG8gc3BsaXQgaXQgaW50byBhbm90aGVyIHRz
dF9yZXMoKSBtZXNzYWdlLCBsaW5lIGFib3ZlIGlzIG5lYXJseQo+ID4gMjAwIGNoYXJhY3RlcnMu
Cj4gCj4gCj4gU29ycnksIEkgc2hvdWxkbid0IGFwcGVuZCBkZWJ1ZyBjb2RlIHRvIHBhdGNoLgo+
IAo+IC0tSG9uZ3poaQo+IAo+IAo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBKYW4KPiA+Cj4gPj4ga2lu
ZCwgdmFsX3U2NCwKPiA+PiAgIAkJCXJlc291cmNlLCBraW5kLCB2YWxfdWwpOwo+ID4+ICAgCQly
ZXR1cm4gLTE7Cj4gPj4gICAJfQo+ID4+IC0tCj4gPj4gMi44LjEKPiA+Pgo+ID4+Cj4gPj4gLS0K
PiA+PiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAKPiA+Pgo+IAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
