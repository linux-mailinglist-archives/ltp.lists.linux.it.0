Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE317BAE
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 16:38:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE559294AA7
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 16:38:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 49CC63EA046
 for <ltp@lists.linux.it>; Wed,  8 May 2019 16:38:26 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DC5A52013B9
 for <ltp@lists.linux.it>; Wed,  8 May 2019 16:38:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E8BEF550CF;
 Wed,  8 May 2019 14:38:21 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F76E6660B;
 Wed,  8 May 2019 14:38:21 +0000 (UTC)
Date: Wed, 8 May 2019 22:38:19 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190508143819.vbp275hnpf4nhofo@XZHOUW.usersys.redhat.com>
References: <20190430152949.17723-1-xzhou@redhat.com>
 <20190430235915.19512-1-xzhou@redhat.com>
 <CAEemH2f3Dq9tpoD8Cq+vJ5SYoaOfVQdP3FQU-6op52U+1p=Yeg@mail.gmail.com>
 <20190508034331.hc6rssg4mc66k5xc@XZHOUW.usersys.redhat.com>
 <CAOQ4uxjDyx7JFBSmkDe-rHNe=NriT710Ldsva=s+HasaDL0CTw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjDyx7JFBSmkDe-rHNe=NriT710Ldsva=s+HasaDL0CTw@mail.gmail.com>
User-Agent: NeoMutt/20180716-1400-f2a658
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 08 May 2019 14:38:22 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: Li Wang <liwan@redhat.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/swap{on,
 off}: skip if FIBMAP ioctl trial fails
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

SGksCgpPbiBXZWQsIE1heSAwOCwgMjAxOSBhdCAwMToyMjoxNVBNICswMzAwLCBBbWlyIEdvbGRz
dGVpbiB3cm90ZToKPiBPbiBXZWQsIE1heSA4LCAyMDE5IGF0IDY6NDMgQU0gTXVycGh5IFpob3Ug
PHh6aG91QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpLAo+ID4KPiA+IFRoYW5rcyBmb3Ig
cmV2aWV3aW5nIQo+ID4KPiA+IE9uIFR1ZSwgTWF5IDA3LCAyMDE5IGF0IDA0OjUyOjAxUE0gKzA4
MDAsIExpIFdhbmcgd3JvdGU6Cj4gPiA+IEhpIE11cnBoeSwKPiA+ID4KPiA+ID4gT24gV2VkLCBN
YXkgMSwgMjAxOSBhdCA3OjU5IEFNIE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gPiBUaGF0IG1lYW5zIHN3YXBmaWxlIGluIHRoZSB0ZXN0IGZpbGVzeXN0
ZW0gaXMgbm90IHN1cHBvcnRlZC4KPiA+ID4gPiBBZGQgYSB0ZXN0IGhlbHBlciB0byBkbyBhIEZJ
Qk1BUCBpb2N0bCB0ZXN0LiBSZW1vdmUgb2xkIGZzIHR5cGUgd2hpdGVsaXN0Cj4gPiA+ID4gY29k
ZS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE11cnBoeSBaaG91IDx4emhvdUByZWRo
YXQuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+IHYyOgo+ID4gPiA+ICAgIFRlc3QgRklCTUFQIGlu
c3RlYWQgb2YgZnN0eXBlIHdoaXRlbGlzdC4KPiA+ID4gPiB2MzoKPiA+ID4gPiAgICBGaXggZnNf
dHlwZSB1bmRlY2xhcmVkIGluIHN3YXBvZmYwMS5jLgo+ID4gPiA+Cj4gPiA+ID4gIGluY2x1ZGUv
dHN0X2ZzLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrKwo+ID4gPiA+ICBs
aWIvdHN0X2lvY3RsLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0MSArKysrKysr
KysrKysrKysrKysrCj4gPiA+ID4gIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9z
d2Fwb2ZmMDEuYyB8IDEzICsrLS0tLQo+ID4gPiA+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L3N3YXBvZmYvc3dhcG9mZjAyLmMgfCAxMSArKystLQo+ID4gPiA+ICB0ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMS5jICAgfCAxMyArKy0tLS0KPiA+ID4gPiAgdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYyAgIHwgMTYgKystLS0tLS0KPiA+
ID4gPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDMuYyAgIHwgMjAg
KystLS0tLS0tCj4gPiA+ID4gIDcgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgNTQg
ZGVsZXRpb25zKC0pCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdHN0X2lvY3RsLmMK
PiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3RzdF9mcy5oIGIvaW5jbHVkZS90
c3RfZnMuaAo+ID4gPiA+IGluZGV4IGIyYjE5YWRhNi4uY2MzOGIzNTQ3IDEwMDY0NAo+ID4gPiA+
IC0tLSBhL2luY2x1ZGUvdHN0X2ZzLmgKPiA+ID4gPiArKysgYi9pbmNsdWRlL3RzdF9mcy5oCj4g
PiA+ID4gQEAgLTE3Miw2ICsxNzIsMTEgQEAgY29uc3QgY2hhciAqKnRzdF9nZXRfc3VwcG9ydGVk
X2ZzX3R5cGVzKHZvaWQpOwo+ID4gPiA+ICAgKi8KPiA+ID4gPiAgdm9pZCB0c3RfZmlsbF9mcyhj
b25zdCBjaGFyICpwYXRoLCBpbnQgdmVyYm9zZSk7Cj4gPiA+ID4KPiA+ID4gPiArLyoKPiA+ID4g
PiArICogdGVzdCBpZiBGSUJNQVAgaW9jdGwgaXMgc3VwcG9ydGVkCj4gPiA+ID4gKyAqLwo+ID4g
PiA+ICtpbnQgdHN0X2ZpYm1hcCh2b2lkKTsKPiA+ID4gPiArCj4gPiA+ID4gICNpZmRlZiBUU1Rf
VEVTVF9IX18KPiA+ID4gPiAgc3RhdGljIGlubGluZSBsb25nIHRzdF9mc190eXBlKGNvbnN0IGNo
YXIgKnBhdGgpCj4gPiA+ID4gIHsKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3RzdF9pb2N0bC5j
IGIvbGliL3RzdF9pb2N0bC5jCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gPiBp
bmRleCAwMDAwMDAwMDAuLmQ0NjhkNTg5OAo+ID4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gPiAr
KysgYi9saWIvdHN0X2lvY3RsLmMKPiA+ID4gPiBAQCAtMCwwICsxLDQxIEBACj4gPiA+ID4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCj4gPiA+ID4gKwo+ID4g
PiA+ICsjaW5jbHVkZSA8ZXJybm8uaD4KPiA+ID4gPiArI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gPiA+
ID4gKyNpbmNsdWRlIDxzdGRsaWIuaD4KPiA+ID4gPiArI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgo+
ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvZnMuaD4KPiA+ID4gPiArCj4gPiA+ID4gKyNkZWZpbmUg
VFNUX05PX0RFRkFVTFRfTUFJTgo+ID4gPiA+ICsKPiA+ID4gPiArI2luY2x1ZGUgInRzdF90ZXN0
LmgiCj4gPiA+ID4gKwo+ID4gPiA+ICtpbnQgdHN0X2ZpYm1hcCh2b2lkKQo+ID4gPiA+ICt7Cj4g
PiA+ID4gKyAgICAgICAvKiB0ZXN0IGlmIEZJQk1BUCBpb2N0bCBpcyBzdXBwb3J0ZWQgKi8KPiA+
ID4gPiArICAgICAgIGludCBmZCwgYmxvY2sgPSAwOwo+ID4gPiA+ICsgICAgICAgY29uc3QgY2hh
ciAqdG1wZGlyID0gZ2V0ZW52KCJUTVBESVIiKTsKPiA+ID4gPiArICAgICAgIGNoYXIgYnVmWzEy
OF07Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgdHN0X3JlcyhUSU5GTywgIlRlc3RpbmcgaWYg
RklCTUFQIGlvY3RsIGlzIHN1cHBvcnRlZCBpbiAlcyIsCj4gPiA+ID4gdG1wZGlyKTsKPiA+ID4g
PiArCj4gPiA+ID4gKyAgICAgICBzcHJpbnRmKGJ1ZiwgIiVzL3RzdF9maWJtYXAiLCB0bXBkaXIp
Owo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIGZkID0gb3BlbihidWYsIE9fUkRXUiB8IE9fQ1JF
QVQsIDA2NjYpOwo+ID4gPiA+ICsgICAgICAgaWYgKGZkIDwgMCkgewo+ID4gPiA+ICsgICAgICAg
ICAgICAgICB0c3RfcmVzKFRXQVJOIHwgVEVSUk5PLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAib3BlbiglcywgT19SRFdSIHwgT19DUkVBVCwgMDY2NikgZmFpbGVkIiwgYnVmKTsK
PiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gPiA+ID4gKyAgICAgICB9Cj4gPiA+
ID4gKwo+ID4gPiA+ICsgICAgICAgaWYgKGlvY3RsKGZkLCBGSUJNQVAsICZibG9jaykpIHsKPiA+
ID4gPiArICAgICAgICAgICAgICAgY2xvc2UoZmQpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gMTsKPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBpZiAo
Y2xvc2UoZmQpKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIHRzdF9yZXMoVFdBUk4gfCBURVJS
Tk8sICJjbG9zZShmZCkgZmFpbGVkIik7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAx
Owo+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gK30K
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL3N3
YXBvZmYwMS5jCj4gPiA+ID4gYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvc3dh
cG9mZjAxLmMKPiA+ID4gPiBpbmRleCBhNjNlNjYxYTUuLmEzN2NkOWJlMSAxMDA2NDQKPiA+ID4g
PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvc3dhcG9mZjAxLmMKPiA+
ID4gPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvc3dhcG9mZjAxLmMK
PiA+ID4gPiBAQCAtNTUsMTEgKzU1LDYgQEAgaW50IG1haW4oaW50IGFjLCBjaGFyICoqYXYpCj4g
PiA+ID4gIHN0YXRpYyB2b2lkIHZlcmlmeV9zd2Fwb2ZmKHZvaWQpCj4gPiA+ID4gIHsKPiA+ID4g
PiAgICAgICAgIGlmIChsdHBfc3lzY2FsbChfX05SX3N3YXBvbiwgIi4vc3dhcGZpbGUwMSIsIDAp
ICE9IDApIHsKPiA+ID4gPiAtICAgICAgICAgICAgICAgaWYgKGZzX3R5cGUgPT0gVFNUX0JUUkZT
X01BR0lDICYmIGVycm5vID09IEVJTlZBTCkgewo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgIHRzdF9icmttKFRDT05GLCBjbGVhbnVwLAo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJTd2FwZmlsZXMgb24gQlRSRlMgYXJlIG5vdCBpbXBsZW1lbnRlZCIpOwo+
ID4gPiA+IC0gICAgICAgICAgICAgICB9Cj4gPiA+ID4gLQo+ID4gPiA+ICAgICAgICAgICAgICAg
ICB0c3RfcmVzbShUQlJPSywgIkZhaWxlZCB0byB0dXJuIG9uIHRoZSBzd2FwIGZpbGUiCj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICIsIHNraXBwaW5nIHRlc3QgaXRlcmF0aW9uIik7
Cj4gPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gPiBAQCAtODYsMTMgKzgxLDEx
IEBAIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIHRzdF90
bXBkaXIoKTsKPiA+ID4gPgo+ID4gPiA+IC0gICAgICAgc3dpdGNoICgoZnNfdHlwZSA9IHRzdF9m
c190eXBlKGNsZWFudXAsICIuIikpKSB7Cj4gPiA+ID4gLSAgICAgICBjYXNlIFRTVF9ORlNfTUFH
SUM6Cj4gPiA+ID4gLSAgICAgICBjYXNlIFRTVF9UTVBGU19NQUdJQzoKPiA+ID4gPiArICAgICAg
IGZzX3R5cGUgPSB0c3RfZnNfdHlwZShjbGVhbnVwLCAiLiIpOwo+ID4gPiA+ICsgICAgICAgaWYg
KHRzdF9maWJtYXAoKSkgewo+ID4gPiA+ICAgICAgICAgICAgICAgICB0c3RfYnJrbShUQ09ORiwg
Y2xlYW51cCwKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgIkNhbm5vdCBkbyBzd2Fw
b2ZmIG9uIGEgZmlsZSBvbiAlcyBmaWxlc3lzdGVtIiwKPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgIkNhbm5vdCBkbyBGSUJNQVAgaW9jdGwgb24gYSBmaWxlIG9uICVzCj4gPiA+ID4g
ZmlsZXN5c3RlbSIsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHRzdF9mc190eXBl
X25hbWUoZnNfdHlwZSkpOwo+ID4gPiA+IC0gICAgICAgYnJlYWs7Cj4gPiA+ID4gICAgICAgICB9
Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIGlmICghdHN0X2ZzX2hhc19mcmVlKE5VTEwsICIuIiwg
NjQsIFRTVF9NQikpIHsKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9zd2Fwb2ZmL3N3YXBvZmYwMi5jCj4gPiA+ID4gYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL3N3YXBvZmYvc3dhcG9mZjAyLmMKPiA+ID4gPiBpbmRleCBiNWM2MzEyYTEuLjg4OWYzYzgw
MCAxMDA2NDQKPiA+ID4gPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYv
c3dhcG9mZjAyLmMKPiA+ID4gPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBv
ZmYvc3dhcG9mZjAyLmMKPiA+ID4gPiBAQCAtNDMsNiArNDMsNyBAQCBjaGFyICpUQ0lEID0gInN3
YXBvZmYwMiI7Cj4gPiA+ID4gIGludCBUU1RfVE9UQUwgPSAzOwo+ID4gPiA+Cj4gPiA+ID4gIHN0
YXRpYyB1aWRfdCBub2JvZHlfdWlkOwo+ID4gPiA+ICtzdGF0aWMgbG9uZyBmc190eXBlOwo+ID4g
PiA+Cj4gPiA+ID4gIHN0YXRpYyBzdHJ1Y3QgdGVzdF9jYXNlX3Qgewo+ID4gPiA+ICAgICAgICAg
Y2hhciAqZXJyX2Rlc2M7Cj4gPiA+ID4gQEAgLTEzOCwxMyArMTM5LDExIEBAIHN0YXRpYyB2b2lk
IHNldHVwKHZvaWQpCj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIHRzdF90bXBkaXIoKTsKPiA+ID4g
Pgo+ID4gPiA+IC0gICAgICAgc3dpdGNoICgodHlwZSA9IHRzdF9mc190eXBlKGNsZWFudXAsICIu
IikpKSB7Cj4gPiA+ID4gLSAgICAgICBjYXNlIFRTVF9ORlNfTUFHSUM6Cj4gPiA+ID4gLSAgICAg
ICBjYXNlIFRTVF9UTVBGU19NQUdJQzoKPiA+ID4gPiArICAgICAgIGZzX3R5cGUgPSB0c3RfZnNf
dHlwZShjbGVhbnVwLCAiLiIpOwo+ID4gPiA+ICsgICAgICAgaWYgKHRzdF9maWJtYXAoKSkgewo+
ID4gPiA+ICAgICAgICAgICAgICAgICB0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKPiA+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgIkNhbm5vdCBkbyBzd2Fwb2ZmIG9uIGEgZmlsZSBvbiAl
cyBmaWxlc3lzdGVtIiwKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgdHN0X2ZzX3R5
cGVfbmFtZSh0eXBlKSk7Cj4gPiA+ID4gLSAgICAgICBicmVhazsKPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgIkNhbm5vdCBkbyBGSUJNQVAgaW9jdGwgb24gYSBmaWxlIG9uICVzCj4g
PiA+ID4gZmlsZXN5c3RlbSIsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHRzdF9m
c190eXBlX25hbWUoZnNfdHlwZSkpOwo+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+Cj4gPiA+ID4g
ICAgICAgICBpZiAoIXRzdF9mc19oYXNfZnJlZShOVUxMLCAiLiIsIDEsIFRTVF9LQikpIHsKPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9u
MDEuYwo+ID4gPiA+IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDEu
Ywo+ID4gPiA+IGluZGV4IDMyNTM4ZjgyYi4uMGE1YTNkZTg2IDEwMDY0NAo+ID4gPiA+IC0tLSBh
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAxLmMKPiA+ID4gPiArKysg
Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMS5jCj4gPiA+ID4gQEAg
LTM5LDExICszOSw2IEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9zd2Fwb24odm9pZCkKPiA+ID4gPiAg
ICAgICAgIFRFU1QobHRwX3N5c2NhbGwoX19OUl9zd2Fwb24sICIuL3N3YXBmaWxlMDEiLCAwKSk7
Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIGlmIChURVNUX1JFVFVSTiA9PSAtMSkgewo+ID4gPiA+
IC0gICAgICAgICAgICAgICBpZiAoZnNfdHlwZSA9PSBUU1RfQlRSRlNfTUFHSUMgJiYgZXJybm8g
PT0gRUlOVkFMKSB7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgdHN0X2Jya20oVENP
TkYsIGNsZWFudXAsCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlN3
YXBmaWxlIG9uIEJUUkZTIG5vdCBpbXBsZW1ldGVkIik7Cj4gPiA+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuOwo+ID4gPiA+IC0gICAgICAgICAgICAgICB9Cj4gPiA+ID4gICAgICAg
ICAgICAgICAgIHRzdF9yZXNtKFRGQUlMIHwgVFRFUlJOTywgIkZhaWxlZCB0byB0dXJuIG9uIHN3
YXBmaWxlIik7Cj4gPiA+ID4gICAgICAgICB9IGVsc2Ugewo+ID4gPiA+ICAgICAgICAgICAgICAg
ICB0c3RfcmVzbShUUEFTUywgIlN1Y2NlZWRlZCB0byB0dXJuIG9uIHN3YXBmaWxlIik7Cj4gPiA+
ID4gQEAgLTg0LDEzICs3OSwxMSBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+ID4gPiA+Cj4g
PiA+ID4gICAgICAgICB0c3RfdG1wZGlyKCk7Cj4gPiA+ID4KPiA+ID4gPiAtICAgICAgIHN3aXRj
aCAoKGZzX3R5cGUgPSB0c3RfZnNfdHlwZShjbGVhbnVwLCAiLiIpKSkgewo+ID4gPiA+IC0gICAg
ICAgY2FzZSBUU1RfTkZTX01BR0lDOgo+ID4gPiA+IC0gICAgICAgY2FzZSBUU1RfVE1QRlNfTUFH
SUM6Cj4gPiA+ID4gKyAgICAgICBmc190eXBlID0gdHN0X2ZzX3R5cGUoY2xlYW51cCwgIi4iKTsK
PiA+ID4gPiArICAgICAgIGlmICh0c3RfZmlibWFwKCkpIHsKPiA+ID4gPgo+ID4gPgo+ID4gPiBJ
J20gbm90IHN1cmUgd2hldGhlciBGSUJNQVAgaW9jdGwgRkFJTCBtZWFucyB0aGF0IHN3YXBmaWxl
IGlzIHVuc3VwcG9ydHRlZAo+ID4gPiBvbiBhIGZpbGVzeXN0ZW0uCj4gCj4gTGkgaXMgY29ycmVj
dCBoZXJlLiBCVFJGUyBhbmQgTkZTIG9uIHJlY2VudCBrZXJuZWwgc3VwcG9ydCBzd2FwZmlsZSBi
dXQgbm90Cj4gc3VwcG9ydCBGSUJNQVAgaW9jdGwsIHNvIGlmIHlvdSB3YW50IHRvIGFkZCB0ZXN0
IGNvdmVyYWdlIGZvciBORlMgYW5kCj4gQlRSRlMsIEknbSBhZnJhaWQgdGhleSB3b3VsZCBoYXZl
IHRvIGJlIHdoaXRlbGlzdGVkIGFmdGVyIGFsbCwgYnV0IG5vdAo+IGlzIHNldHVwKCkKPiBiZWNh
dXNlIGRlcGVuZGluZyBvbiBrZXJuZWwsIHRoZXkgbWF5IHN1cHBvcnQgc3dhcGZpbGUgYW5kIG1h
eSBub3QuCj4gV29yc2UgZXZlbiwgQlRSRlMgaGFkIEZJQk1BUCBzdXBwb3J0IGZvciBhIHdoaWxl
IGFuZCB0aGVuIHJlbW92ZWQsIHNlZToKPiBlZDQ2ZmYzZDQyMzcgQnRyZnM6IHN1cHBvcnQgc3dh
cCBmaWxlcwo+IDM1MDU0Mzk0YzRiMyBCdHJmczogc3RvcCBwcm92aWRpbmcgYSBibWFwIG9wZXJh
dGlvbiB0byBhdm9pZCBzd2FwZmlsZQo+IGNvcnJ1cHRpb25zCgpHcmVhdCB0byBrbm93ISBUaGFu
a3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0LiBNdWNoIGxlYXJuZWQuIDopCgo+IAo+IFNvcnJ5IEkg
bWlzc2VkIHRoaXMgYmVmb3JlLgoKSXQncyBteSBiYWQgbm90IGNoZWNraW5nIGNhcmVmdWxseS4K
PiAKPiA+ID4gSWYgdGhhdCdzIHRydWUsIHNob3VsZG4ndCB3ZSB2ZXJpZnkgRklCTUFQIGlvY3Rs
IG9uIHRoZSBzd2FwZmlsZT8gIEhlcmUgeW91Cj4gPiA+IGp1c3QgdGVzdCB0aGF0IGluIGEgdG1w
IGZpbGUsIGl0IHByb2JhYmx5IG5vdCBhIGNvcnJlY3Qgd2F5IEkgZ3Vlc3MuCj4gPgo+ID4gV2Ug
ZG9uJ3QgbmVlZCB0byB0ZXN0IG9uIGEgc3dhcGZpbGUuIElmIHRoZSBmaWxlc3lzdGVtIHdlIGFy
ZSB0ZXN0aW5nCj4gPiBzdXBwb3J0cyBGSUJNQVAgaW90Y2wsIHdlIGNhbiBtYWtlIGEgZmlsZSBp
biB0aGlzIGZpbGVzeXN0ZW0gYSBzd2FwZmlsZS4KPiA+Cj4gCj4gSW4gdGhlb3J5LCBGSUJNQVAg
Y2FuIHdvcmsgb24gY2VydGFpbiBmaWxlcyBhbmQgZmFpbCBvbiBjZXJ0YWluIGZpbGVzCj4gKGUu
Zy4gcmVmbGlua2VkIHhmcy9vY2ZzMiBmaWxlKSwgYnV0IHRoYXQgaXMgdW5saWtlbHkgdGhlIGNh
c2UgaW4gdGhpcyB0ZXN0Cj4gYW5kIG5vdCByZWxhdGVkIHRvIGZpbGUgYmVpbmcgYSBzd2FwIGZp
bGUuCgpBZ3JlZWQuIFNvdW5kcyBsaWtlIGEgY29ybmVyIGNhc2UgaW4gdGhlc2UgY29ybmVyIHN3
YXAgcmVzdHMgdG8gbWUgOikKPiAKPiBJbiBjb25jbHVzaW9uCj4gMS4gSWYgZmlsZXN5c3RlbSBz
dXBwb3J0cyBGSUJNQVAgaXRzIGEgdmVyeSBzdHJvbmcgaW5kaWNhdGlvbiB0aGF0Cj4gICAgIGZp
bGVzeXN0ZW0gc3VwcG9ydHMgc3dhcGZpbGUsIGJ1dCBpbiB0aGVvcnkgYSBmdXR1cmUgIGZpbGVz
eXN0ZW0KPiAgICAgY291bGQgZmFpbCB0aGlzIHRlc3QgKGRvbid0IHNlZSBhIHJlYXNvbiBmb3Ig
dGhhdCB0byBoYXBwZW4pLgoKSSBtYWlubHkgdGhvdWdodCBhYm91dCB0aHMgc2l0dWF0aW9uLiBX
ZSBjYW4gbGV0IHRoZSBmb2xsb3dpbmcgc3dhcCogdGVzdApnbyB0byBzZWUgd2hhdCdzIGhhcHBl
bmluZy4KCj4gMi4gSWYgZmlsZXN5c3RlbSBkb2VzIG5vdCBzdXBwb3J0IEZJQk1BUCBpdCBjYW4g
c3VwcG9ydCBzd2FwZmlsZQo+ICAgICBidHJmcyBhbmQgbmZzIGFyZSBleGFtcGxlcyBpbiBjdXJy
ZW50IHVwc3RyZWFtLCBidXQgaW4gZnV0dXJlIGNvdWxkCj4gICAgIGJlIG90aGVyIGZpbGVzeXN0
ZW1zIGFzIHdlbGwKPiAKPiBTdWdnZXN0aW9uOiB0ZXN0IGluIHNldHVwIEZJQk1BUC4gSWYgbm90
IHN1cHBvcnRlZCBkb24ndCBmYWlsIGltbWVkaWF0ZWx5Cj4gYnV0IGRvIHRoZSB0cnkgYW5kIGZh
aWwgc29mdGx5IHdpdGggVENPTkYgdGhhdCBpcyBjdXJyZW50bHkgaW1wbGVtZW50ZWQKPiBmb3Ig
VFNUX0JUUkZTX01BR0lDLgoKUmVhc29uYWJsZSB0byBtZS4gVGhhbmtzIGZvciB0aGUgc3VnZ2Vz
dGlvbi4gV2UgY2FuIGdvIHdvLyB3aGl0ZWxpc3QuCgpUaGFua3MsCk0KPiAKPiBUaGFua3MsCj4g
QW1pci4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
