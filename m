Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D43EE45E1C
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 15:27:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 966573EA6FD
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 15:27:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2D65F3EA620
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 15:26:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 28586601BDF
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 15:26:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 166BFAF90;
 Fri, 14 Jun 2019 13:26:57 +0000 (UTC)
Date: Fri, 14 Jun 2019 15:26:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: xuyang <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190614132655.GA10082@rei.lan>
References: <5CDD3FB4.50502@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDD3FB4.50502@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] increase quotactl01.c coverage
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

SGkhCj4gU2lnbmVkLW9mZi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNv
bT4KPiAtLS0KPiAgbTQvbHRwLXF1b3RhLm00ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMjkgKystLS0tLS0tLQo+ICAuLi4va2VybmVsL3N5c2NhbGxzL3F1b3RhY3RsL3F1b3RhY3Rs
MDEuYyAgICAgfCA1NCArKysrKysrKy0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjcg
aW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL200L2x0cC1x
dW90YS5tNCBiL200L2x0cC1xdW90YS5tNAo+IGluZGV4IGEyNWUzNGE4My4uNTYxOGM3NjllIDEw
MDY0NAo+IC0tLSBhL200L2x0cC1xdW90YS5tNAo+ICsrKyBiL200L2x0cC1xdW90YS5tNAo+IEBA
IC0yMCw5ICsyMCwxMCBAQCBkbmwKPiAgZG5sIExUUF9DSEVDS19TWVNDQUxMX1FVT1RBQ1RMCj4g
IGRubCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRubAo+IC1BQ19ERUZVTihbTFRQ
X0NIRUNLX1NZU0NBTExfUVVPVEFDVExdLFtkbmwKPiArQUNfREVGVU4oW0xUUF9DSEVDS19TWVND
QUxMX1FVT1RBQ1RMXSxbCj4gK0FDX0NIRUNLX0hFQURFUlMoW3N5cy9xdW90YS5oXSxbcXVvdGFf
aGVhZGVyX3ByZWZpeD0ic3lzIl0pCj4gK2lmIHRlc3QgIngkcXVvdGFfaGVhZGVyX3ByZWZpeCIg
IT0geDsgdGhlbgo+ICAJQUNfTElOS19JRkVMU0UoW0FDX0xBTkdfU09VUkNFKFsKPiAtI2RlZmlu
ZSBfTElOVVhfUVVPVEFfVkVSU0lPTiAyCj4gICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KPiAgI2lu
Y2x1ZGUgPHN5cy9xdW90YS5oPgo+ICAjaW5jbHVkZSA8dW5pc3RkLmg+Cj4gQEAgLTMxLDI4ICsz
Miw4IEBAIGludCBtYWluKHZvaWQpIHsKPiAgCXJldHVybiBxdW90YWN0bChRQ01EKFFfR0VUSU5G
TywgVVNSUVVPVEEpLCAoY29uc3QgY2hhciAqKSAiL2Rldi9udWxsIiwKPiAgCQkJZ2V0ZXVpZCgp
LCAoY2FkZHJfdCkgJmRxKTsKPiAgfV0pXSxbaGFzX3F1b3RhdjI9InllcyJdKQo+IC0KPiArZmkK
PiAgaWYgdGVzdCAieCRoYXNfcXVvdGF2MiIgPSB4eWVzOyB0aGVuCj4gLQlBQ19ERUZJTkUoSEFW
RV9RVU9UQVYyLDEsW0RlZmluZSB0byAxIGlmIHlvdSBoYXZlIHF1b3RhIHYyXSkKPiAtZWxzZQo+
IC0KPiAtCSMgZ290IHF1b3RhIHYxPwo+IC0JQUNfTElOS19JRkVMU0UoW0FDX0xBTkdfU09VUkNF
KFsKPiAtI2RlZmluZSBfTElOVVhfUVVPVEFfVkVSU0lPTiAxCj4gLSNpbmNsdWRlIDxzeXMvdHlw
ZXMuaD4KPiAtI2luY2x1ZGUgPHN5cy9xdW90YS5oPgo+IC0jaW5jbHVkZSA8dW5pc3RkLmg+Cj4g
LWludCBtYWluKHZvaWQpIHsKPiAtCXN0cnVjdCBkcWJsayBkcTsKPiAtCXJldHVybiBxdW90YWN0
bChRQ01EKFFfR0VUUVVPVEEsIFVTUlFVT1RBKSwgKGNvbnN0IGNoYXIgKikgIi9kZXYvbnVsbCIs
Cj4gLQkJCWdldGV1aWQoKSwgKGNhZGRyX3QpICZkcSk7Cj4gLX1dKV0sW2hhc19xdW90YXYxPSJ5
ZXMiXSkKPiAtCj4gLQlpZiB0ZXN0ICJ4JGhhc19xdW90YXYxIiA9IHh5ZXM7IHRoZW4KPiAtCQlB
Q19ERUZJTkUoSEFWRV9RVU9UQVYxLDEsW0RlZmluZSB0byAxIGlmIHlvdSBoYXZlIHF1b3RhIHYx
XSkKPiAtCWVsc2UKPiAtCQlBQ19NU0dfV0FSTihDb3VsZG4ndCBkZXRlcm1pbmUgcXVvdGEgdmVy
c2lvbiAocGxlYXNlIHN1Ym1pdCBjb25maWcubG9nIGFuZCBtYW5wYWdlIHRvIGx0cEBsaXN0cy5s
aW51eC5pdCkpCj4gLQlmaQo+IC0KPiArCUFDX0RFRklORShIQVZFX1FVT1RBX1FfR0VUSU5GTywx
LFtEZWZpbmUgdG8gMSBpZiB5b3UgaGF2ZSBxdW90YSBRX0dFVElORk9dKQo+ICBmaQo+ICBdKQo+
IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3F1b3RhY3RsL3F1b3RhY3Rs
MDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcXVvdGFjdGwvcXVvdGFjdGwwMS5jCj4g
aW5kZXggOTJiNjU0ZWJhLi43YzVhMWM0MDEgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9xdW90YWN0bC9xdW90YWN0bDAxLmMKPiArKysgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3F1b3RhY3RsL3F1b3RhY3RsMDEuYwo+IEBAIC01NSw0NCArNTUsMjkgQEAKPiAg
Cj4gICNpbmNsdWRlICJ0c3RfdGVzdC5oIgo+ICAKPiAtI2lmIGRlZmluZWQoSEFWRV9RVU9UQVYy
KSB8fCBkZWZpbmVkKEhBVkVfUVVPVEFWMSkKPiAtIyBpbmNsdWRlIDxzeXMvcXVvdGEuaD4KPiAt
Cj4gLSMgaWYgZGVmaW5lZChIQVZFX1FVT1RBVjIpCj4gLSMgIGRlZmluZSBfTElOVVhfUVVPVEFf
VkVSU0lPTiAgMgo+IC0jICBpZm5kZWYgUUZNVF9WRlNfVjAKPiAtIyAgIGRlZmluZSBRRk1UX1ZG
U19WMCAgICAgMgo+IC0jICBlbmRpZgo+IC0jICBkZWZpbmUgVVNSUEFUSCBNTlRQT0lOVCAiL2Fx
dW90YS51c2VyIgo+IC0jICBkZWZpbmUgR1JQUEFUSCBNTlRQT0lOVCAiL2FxdW90YS5ncm91cCIK
PiAtIyAgZGVmaW5lIEZNVElECVFGTVRfVkZTX1YwCj4gLSMgZWxzZQo+IC0jICBkZWZpbmUgX0xJ
TlVYX1FVT1RBX1ZFUlNJT04gIDEKPiAtIyAgaWZuZGVmIFFGTVRfVkZTX09MRAo+IC0jICAgZGVm
aW5lIFFGTVRfVkZTX09MRCAgICAxCj4gLSMgIGVuZGlmCj4gLSMgIGRlZmluZSBVU1JQQVRIIE1O
VFBPSU5UICIvcXVvdGEudXNlciIKPiAtIyAgZGVmaW5lIEdSUFBBVEggTU5UUE9JTlQgIi9xdW90
YS5ncm91cCIKPiAtIyAgZGVmaW5lIEZNVElECVFGTVRfVkZTX09MRAo+IC0jIGVuZGlmCj4gKyNp
ZiBIQVZFX1NZU19RVU9UQV9ICj4gKyNpbmNsdWRlIDxzeXMvcXVvdGEuaD4KPiAgCj4gLSMgZGVm
aW5lIE1OVFBPSU5UCSJtbnRwb2ludCIKPiArI2RlZmluZSBNTlRQT0lOVCAibW50cG9pbnQiCj4g
IAo+IC1zdGF0aWMgaW50MzJfdCBmbXRfaWQgPSBGTVRJRDsKPiArY2hhciBVU1JQQVRIWzMyXTsK
PiArY2hhciBHUlBQQVRIWzMyXTsKPiArc3RhdGljIGludDMyX3QgZm10X2lkOwo+ICBzdGF0aWMg
aW50IHRlc3RfaWQ7Cj4gIHN0YXRpYyBzdHJ1Y3QgZHFibGsgc2V0X2RxID0gewo+ICAJLmRxYl9i
c29mdGxpbWl0ID0gMTAwLAo+ICAJLmRxYl92YWxpZCA9IFFJRl9CTElNSVRTCj4gIH07Cj4gIHN0
YXRpYyBzdHJ1Y3QgZHFibGsgcmVzX2RxOwo+IC0jIGlmIGRlZmluZWQoSEFWRV9RVU9UQVYyKQo+
ICsKPiArIyBpZiBIQVZFX1FVT1RBX1FfR0VUSU5GTwo+ICBzdGF0aWMgc3RydWN0IGRxaW5mbyBz
ZXRfcWYgPSB7Cj4gIAkuZHFpX2JncmFjZSA9IDgwLAo+ICAJLmRxaV92YWxpZCA9IElJRl9CR1JB
Q0UKPiAgfTsKPiAgc3RhdGljIHN0cnVjdCBkcWluZm8gcmVzX3FmOwo+ICBzdGF0aWMgaW50MzJf
dCBmbXRfYnVmOwo+IC0jIGVuZGlmCj4gKyNlbmRpZgo+ICAKPiAgc3RhdGljIHN0cnVjdCB0Y2Fz
ZSB7Cj4gIAlpbnQgY21kOwo+IEBAIC0xMTIsNyArOTcsNyBAQCBzdGF0aWMgc3RydWN0IHRjYXNl
IHsKPiAgCXtRQ01EKFFfR0VUUVVPVEEsIFVTUlFVT1RBKSwgJnRlc3RfaWQsICZyZXNfZHEsCj4g
IAkmc2V0X2RxLmRxYl9ic29mdGxpbWl0LCAmcmVzX2RxLmRxYl9ic29mdGxpbWl0LAo+ICAJc2l6
ZW9mKHJlc19kcS5kcWJfYnNvZnRsaW1pdCksICJnZXQgZGlzayBxdW90YSBsaW1pdCBmb3IgdXNl
ciJ9LAo+IC0jIGlmIGRlZmluZWQoSEFWRV9RVU9UQVYyKQo+ICsjIGlmIEhBVkVfUVVPVEFfUV9H
RVRJTkZPCj4gIAl7UUNNRChRX1NFVElORk8sIFVTUlFVT1RBKSwgJnRlc3RfaWQsICZzZXRfcWYs
Cj4gIAlOVUxMLCBOVUxMLCAwLCAic2V0IGluZm9ybWF0aW9uIGFib3V0IHF1b3RhZmlsZSBmb3Ig
dXNlciJ9LAo+ICAKPiBAQCAtMTM5LDcgKzEyNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgdGNhc2Ugewo+
ICAJe1FDTUQoUV9HRVRRVU9UQSwgR1JQUVVPVEEpLCAmdGVzdF9pZCwgJnJlc19kcSwgJnNldF9k
cS5kcWJfYnNvZnRsaW1pdCwKPiAgCSZyZXNfZHEuZHFiX2Jzb2Z0bGltaXQsIHNpemVvZihyZXNf
ZHEuZHFiX2Jzb2Z0bGltaXQpLAo+ICAJInNldCBkaXNrIHF1b3RhIGxpbWl0IGZvciBncm91cCJ9
LAo+IC0jIGlmIGRlZmluZWQoSEFWRV9RVU9UQVYyKQo+ICsjIGlmICBIQVZFX1FVT1RBX1FfR0VU
SU5GTwo+ICAJe1FDTUQoUV9TRVRJTkZPLCBHUlBRVU9UQSksICZ0ZXN0X2lkLCAmc2V0X3FmLAo+
ICAJTlVMTCwgTlVMTCwgMCwgInNldCBpbmZvcm1hdGlvbiBhYm91dCBxdW90YWZpbGUgZm9yIGdy
b3VwIn0sCj4gIAo+IEBAIC0xNTksMTggKzE0NCwyMiBAQCBzdGF0aWMgc3RydWN0IHRjYXNlIHsK
PiAgCj4gIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gIHsKPiAtCWNvbnN0IGNoYXIgKmNvbnN0
IGNtZFtdID0geyJxdW90YWNoZWNrIiwgIi11ZyIsIE1OVFBPSU5ULCBOVUxMfTsKPiArCWNvbnN0
IGNoYXIgKmNvbnN0IGNtZFtdID0geyJxdW90YWNoZWNrIiwgIi11ZyIsICItLWZvcm1hdD12ZnN2
MCIsIE1OVFBPSU5ULCBOVUxMfTsKPiAgCWludCByZXQ7Cj4gIAo+IC0KPiAgCXJldCA9IHRzdF9y
dW5fY21kKGNtZCwgTlVMTCwgTlVMTCwgMSk7Cj4gIAlzd2l0Y2ggKHJldCkgewo+ICAJY2FzZSAy
NTU6Cj4gLQkJdHN0X2JyayhUQ09ORiwgInF1b3RhY2hlY2sgYmluYXJ5IG5vdCBpbnN0YWxsZWQi
KTsKPiArCQl0c3RfYnJrKFRCUk9LLCAicXVvdGFjaGVjayBiaW5hcnkgbm90IGluc3RhbGxlZCIp
OwoKV2h5IGhhdmUgeW91IGNoYW5nZWQgdGhpcyB0byBUQlJPSz8gVGhpcyBpcyBub3QgYSBmYXRh
bCBidWcganVzdCBtaXNzaW5nCmJpbmFyeS4KCj4gKwljYXNlIDA6Cj4gKwkJc3ByaW50ZihVU1JQ
QVRILCAiJXMvYXF1b3RhLnVzZXIiLCBNTlRQT0lOVCk7Cj4gKwkJc3ByaW50ZihHUlBQQVRILCAi
JXMvYXF1b3RhLmdyb3VwIiwgTU5UUE9JTlQpOwo+ICsJCWZtdF9pZCA9IDI7Cj4gKwkJdHN0X3Jl
cyhUSU5GTywgIiVzICVzICVkIiwgVVNSUEFUSCwgR1JQUEFUSCwgZm10X2lkKTsKCldoeSBkbyB5
b3Ugc3ByaW50ZigpIHRoZSBwYXRoIGhlcmU/IFlvdSBkb2VzIG5vdCBzZWVtIHRvIGNoYW5nZSBp
dAphbnl3aGVyZSBlbHNlLCBzbyBpdCdzIGNvbnN0YW50IGFmdGVyIGFsbC4KCkhvdyBpcyB0aGlz
IGV4YWN0bHkgaW5jcmVhc2luZyB0aGUgY292ZXJhZ2U/Cgo+ICsJCWJyZWFrOwo+ICAJZGVmYXVs
dDoKPiAgCQl0c3RfYnJrKFRCUk9LLCAicXVvdGFjaGVjayBleGl0ZWQgd2l0aCAlaSIsIHJldCk7
Cj4gLQljYXNlIDA6Cj4gLQlicmVhazsKPiArCQlicmVhazsKPiAgCX0KPiAgCj4gIAl0ZXN0X2lk
ID0gZ2V0ZXVpZCgpOwo+IEBAIC0xODcsOSArMTc2LDEwIEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9x
dW90YSh1bnNpZ25lZCBpbnQgbikKPiAgCXN0cnVjdCB0Y2FzZSAqdGMgPSAmdGNhc2VzW25dOwo+
ICAKPiAgCXJlc19kcS5kcWJfYnNvZnRsaW1pdCA9IDA7Cj4gKyMgaWYgSEFWRV9RVU9UQV9RX0dF
VElORk8KPiAgCXJlc19xZi5kcWlfaWdyYWNlID0gMDsKPiAgCWZtdF9idWYgPSAwOwo+IC0KPiAr
I2VuZGlmCj4gIAlURVNUKHF1b3RhY3RsKHRjLT5jbWQsIHRzdF9kZXZpY2UtPmRldiwgKnRjLT5p
ZCwgdGMtPmFkZHIpKTsKPiAgCWlmIChUU1RfUkVUID09IC0xKSB7Cj4gIAkJdHN0X3JlcyhURkFJ
TCB8IFRURVJSTk8sICJxdW90YWN0bCBmYWlsZWQgdG8gJXMiLCB0Yy0+ZGVzKTsKPiAtLSAKPiAy
LjE4LjEKPiAKCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
