Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7F306DB6
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 07:41:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74CF03C3169
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 07:41:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id DE81D3C3051
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 07:41:42 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A30C31000951
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 07:41:41 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="103928524"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 14:41:39 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 596FE4CE6782
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 14:41:36 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 14:41:36 +0800
Message-ID: <60125C9E.9020101@cn.fujitsu.com>
Date: Thu, 28 Jan 2021 14:41:34 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Ruan Shiyang <ruansy.fnst@cn.fujitsu.com>
References: <20210127102234.1282037-1-ruansy.fnst@cn.fujitsu.com>
 <601227EF.4080105@cn.fujitsu.com>
 <05e9d284-407a-9c42-afcc-6200363d419a@cn.fujitsu.com>
In-Reply-To: <05e9d284-407a-9c42-afcc-6200363d419a@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 596FE4CE6782.AAC86
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/time{01,
 02}: Convert to new API and merge them
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

T24gMjAyMS8xLzI4IDEzOjMwLCBSdWFuIFNoaXlhbmcgd3JvdGU6Cj4KPgo+IE9uIDIwMjEvMS8y
OCDkuIrljYgxMDo1NiwgWGlhbyBZYW5nIHdyb3RlOgo+PiBPbiAyMDIxLzEvMjcgMTg6MjIsIFNo
aXlhbmcgUnVhbiB3cm90ZToKPj4+IE1lcmdlIHRoZSB0d28gY2FzZXMgYmVjYXVzZSBlYWNoIG9m
IHRoZW0gaXMgdmVyeSBzaW1wbGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU2hpeWFuZyBSdWFu
PHJ1YW5zeS5mbnN0QGNuLmZ1aml0c3UuY29tPgo+Pj4gLS0tCj4+PiAgIHRlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvdGltZS90aW1lMDEuYyB8IDIwNCAKPj4+ICsrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLQo+Pj4gICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3RpbWUvdGltZTAyLmMgfCAxNDcg
LS0tLS0tLS0tLS0tLS0tLS0KPj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCsp
LCAzMDQgZGVsZXRpb25zKC0pCj4+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL3RpbWUvdGltZTAyLmMKPj4gSGkgUnVhbiwKPj4KPj4gWW91IGFsc28gbmVl
ZCB0byByZW1vdmUgYWxsIGVudHJpZXMgcmVsZWF0ZWQgdG8gdGltZTAyLCBmb3IgZXhhbXBsZToK
Pj4gcnVudGVzdC9zeXNjYWxsczp0aW1lMDIgdGltZTAyCj4+IHRlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvdGltZS8uZ2l0aWdub3JlOi90aW1lMDIgPgo+Cj4gWWVzLCBJIGZvcmdvdCB0aGF0Lgo+
Cj4gLi4uCj4KPj4+ICsvKlwKPj4+ICsgKiBbREVTQ1JJUFRJT05dCj4+PiArICogMSkgQmFzaWMg
dGVzdCBmb3IgdGhlIHRpbWUoMikgc3lzdGVtIGNhbGwuIEl0IGlzIGludGVuZGVkIHRvIAo+Pj4g
cHJvdmlkZSBhCj4+PiArICogbGltaXRlZCBleHBvc3VyZSBvZiB0aGUgc3lzdGVtIGNhbGwuCj4+
PiArICogMikgVmVyaWZ5IHRoYXQgdGltZSgyKSByZXR1cm5zIHRoZSB2YWx1ZSBvZiB0aW1lIGlu
IHNlY29uZHMgCj4+PiBzaW5jZSB0aGUgRXBvY2gKPj4+ICsgKiBhbmQgc3RvcmVzIHRoaXMgdmFs
dWUgaW4gdGhlIG1lbW9yeSBwb2ludGVkIHRvIGJ5IHRoZSBwYXJhbWV0ZXIuCj4+PiArXCovCj4+
Cj4+IEl0IGlzIGJldHRlciB0byByZXBsYWNlIHRoZSBudW1iZXIgd2l0aCAnLScgc28gdGhhdCBp
dCBmb2xsb3dzIHRoZSAKPj4gbWFya2Rvd24gbGlzdC4KPj4KPgo+IE9LLgo+Cj4+Pgo+Pj4gLXZv
aWQgc2V0dXAoKTsKPj4+IC12b2lkIGNsZWFudXAoKTsKPj4+ICsjaW5jbHVkZTx0aW1lLmg+Cj4+
PiArI2luY2x1ZGU8ZXJybm8uaD4KPj4+Cj4+PiAtY2hhciAqVENJRCA9ICJ0aW1lMDEiOwo+Pj4g
LWludCBUU1RfVE9UQUwgPSAxOwo+Pj4gKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgo+Pj4KPj4+IC1p
bnQgbWFpbihpbnQgYWMsIGNoYXIgKiphdikKPj4+ICtzdGF0aWMgdm9pZCB2ZXJpZnlfdGltZSh2
b2lkKQo+Pj4gICB7Cj4+PiAtICAgIGludCBsYzsKPj4+IC0KPj4+IC0gICAgdHN0X3BhcnNlX29w
dHMoYWMsIGF2LCBOVUxMLCBOVUxMKTsKPj4+IC0KPj4+IC0gICAgc2V0dXAoKTsKPj4+IC0KPj4+
IC0gICAgZm9yIChsYyA9IDA7IFRFU1RfTE9PUElORyhsYyk7IGxjKyspIHsKPj4+ICsgICAgVEVT
VCh0aW1lKDApKTsKPj4+Cj4+PiAtICAgICAgICB0c3RfY291bnQgPSAwOwo+Pj4gLQo+Pj4gLSAg
ICAgICAgLyoKPj4+IC0gICAgICAgICAqIENhbGwgdGltZSgyKQo+Pj4gLSAgICAgICAgICovCj4+
PiAtICAgICAgICBURVNUKHRpbWUoMCkpOwo+Pj4gLQo+Pj4gLSAgICAgICAgLyogY2hlY2sgcmV0
dXJuIGNvZGUgKi8KPj4+IC0gICAgICAgIGlmIChURVNUX1JFVFVSTiA9PSAtMSkgewo+Pj4gLSAg
ICAgICAgICAgIHRzdF9yZXNtKFRGQUlMLCAidGltZSgwKSBGYWlsZWQsIGVycm5vPSVkIDogJXMi
LAo+Pj4gLSAgICAgICAgICAgICAgICAgVEVTVF9FUlJOTywgc3RyZXJyb3IoVEVTVF9FUlJOTykp
Owo+Pj4gLSAgICAgICAgfSBlbHNlIHsKPj4+IC0gICAgICAgICAgICB0c3RfcmVzbShUUEFTUywg
InRpbWUoMCkgcmV0dXJuZWQgJWxkIiwKPj4+IC0gICAgICAgICAgICAgICAgIFRFU1RfUkVUVVJO
KTsKPj4+IC0gICAgICAgIH0KPj4+IC0gICAgfQo+Pj4gLQo+Pj4gLSAgICBjbGVhbnVwKCk7Cj4+
PiAtICAgIHRzdF9leGl0KCk7Cj4+PiArICAgIGlmIChUU1RfUkVUID09IC0xKQo+Pj4gKyAgICAg
ICAgdHN0X3JlcyhURkFJTCB8IFRURVJSTk8sICJ0aW1lKDApIik7Cj4+PiArICAgIGVsc2UKPj4+
ICsgICAgICAgIHRzdF9yZXMoVFBBU1MsICJ0aW1lKDApIHJldHVybmVkICVsZCIsIFRTVF9SRVQp
Owo+Pj4gICB9Cj4+Pgo+Pj4gLS8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioKPj4+IC0gKiBzZXR1cCgpIC0gcGVyZm9ybXMgYWxs
IE9ORSBUSU1FIHNldHVwIGZvciB0aGlzIHRlc3QuCj4+PiAtICoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KPj4+IC12b2lkIHNl
dHVwKHZvaWQpCj4+PiArc3RhdGljIHZvaWQgdmVyaWZ5X3RpbWVfc3RvcmUodm9pZCkKPj4+ICAg
ewo+Pj4gLSAgICB2b2lkIHRyYXBwZXIoKTsKPj4+IC0KPj4+IC0gICAgdHN0X3NpZyhOT0ZPUkss
IERFRl9IQU5ETEVSLCBjbGVhbnVwKTsKPj4+IC0KPj4+IC0gICAgVEVTVF9QQVVTRTsKPj4+ICsg
ICAgdGltZV90IHRsb2M7Cj4+PiArCj4+PiArICAgIFRFU1QodGltZSgmdGxvYykpOwo+Pj4gKwo+
Pj4gKyAgICBpZiAoVFNUX1JFVCA9PSAtMSkKPj4+ICsgICAgICAgIHRzdF9yZXMoVEZBSUwgfCBU
VEVSUk5PLCAidGltZSgmdGxvYykiKTsKPj4+ICsgICAgZWxzZQo+Pj4gKyAgICAgICAgaWYgKHRs
b2MgPT0gVFNUX1JFVCkKPj4+ICsgICAgICAgICAgICB0c3RfcmVzKFRQQVNTLCAidGltZSgmdGxv
YykgcmV0dXJuZWQgdmFsdWUgJWxkLCAiCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAic3Rv
cmVkIHZhbHVlICVqZCBhcmUgc2FtZSIsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICBUU1Rf
UkVULCAoaW50bWF4X3QpIHRsb2MpOwo+Pj4gKyAgICAgICAgZWxzZQo+Pj4gKyAgICAgICAgICAg
IHRzdF9yZXMoVEZBSUwsICJ0aW1lKCZ0bG9jKSByZXR1cm5lZCB2YWx1ZSAlbGQsICIKPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICJzdG9yZWQgdmFsdWUgJWpkIGFyZSBkaWZmZXJlbnQiLAo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgVFNUX1JFVCwgKGludG1heF90KSB0bG9jKTsKPj4+
ICAgfQo+Pj4KPj4+IC0vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqCj4+PiAtICogY2xlYW51cCgpIC0gcGVyZm9ybXMgYWxsIE9O
RSBUSU1FIGNsZWFudXAgZm9yIHRoaXMgdGVzdCBhdAo+Pj4gLSAqICAgICAgICBjb21wbGV0aW9u
IG9yIHByZW1hdHVyZSBleGl0Lgo+Pj4gLSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovCj4+PiAtdm9pZCBjbGVhbnVwKHZvaWQp
Cj4+PiArc3RydWN0IHRjYXNlIHsKPj4+ICsgICAgdm9pZCAoKnZlcmlmeSkodm9pZCk7Cj4+PiAr
fSB0Y2FzZXNbXSA9IHsKPj4+ICsgICAgeyZ2ZXJpZnlfdGltZSB9LAo+Pj4gKyAgICB7JnZlcmlm
eV90aW1lX3N0b3JlIH0sCj4+PiArfTsKPj4+ICsKPj4+ICtzdGF0aWMgdm9pZCBydW4odW5zaWdu
ZWQgaW50IGkpCj4+PiAgIHsKPj4+ICsgICAgdGNhc2VzW2ldLnZlcmlmeSgpOwo+Pj4gICB9Cj4+
IEkgdGhpbmsgd2UgZG9uJ3QgbmVlZCB0byBkZWZpbmUgdHdvIGRpZmZlcmVudCBmdW5jdGlvbnMu
Cj4+IEhvdyBhYm91dCBkZWZpbmluZyBkaWZmZXJlbnQgYXJndW1lbnRzIGFuZCB0aGVuIHBhc3Mg
dGhlbSB0byB0aW1lKCk/IAo+PiBmb3IgZXhhbXBsZToKPj4gc3RydWN0IHRpbWVfdCAqYXJnc1sy
XT0ge05VTEwsICZ0bG9jfTsKPj4KPj4gc3RhdGljIHZvaWQgdmVyaWZ5X3RpbWVfc3RvcmUodW5z
aWduZWQgaW50IGkpCj4+IHsKPj4gICAgICBURVNUKHRpbWUoYXJnc1tpXSkpOwo+PiAgICAgICAu
Li4uLi4KPj4gfQo+Cj4gSSB0aGluayB0aGVzZSB0d28gYXJlIGRpZmZlcmVudC4KPgo+IEluIGB2
ZXJpZnlfdGltZV9zdG9yZSgpYCwgd2UgY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBvZiBgdGltZSgm
dGxvYylgIAo+IGFuZCBqdWRnZSB3aGV0aGVyIGl0IGlzIGVxdWFsIHRvIHRoZSBhcmd1bWVudCBg
dGxvY2AuICBCdXQgaW4gCj4gYHZlcmlmeV90aW1lKClgLCB0aGUganVkZ21lbnQgb2Ygd2hldGhl
ciB0aGV5IGFyZSBlcXVhbCBvciBub3QgaXMgbm90IAo+IG5lY2Vzc2FyeS4gIFNvLCBJIHRoaW5r
IHRoZSB0d28gZnVuY3Rpb25zIGFyZSBuZWVkZWQgYmVjYXVzZSBvZiB0aGUgCj4gZGlmZmVyZW50
IGxvZ2ljLgpIaSBSdWFuLAoKSG93IGFib3V0IHRoZSBmb2xsb3dpbmcgbG9naWM/Ci0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzdGF0aWMgdm9pZCB2ZXJpZnlf
dGltZSh1bnNpZ25lZCBpbnQgaSkKewogICAgIFRFU1QodGltZShhcmdzW2ldKSk7CiAgICAgaWYg
KFRTVF9SRVQgPT0gLTEpIHsKICAgICAgICAgdHN0X3JlcyhURkFJTCB8IFRURVJSTk8sICJ0aW1l
KCZ0bG9jKSIpOwogICAgICAgICByZXR1cm47CiAgICAgfQoKICAgICBpZiAoYXJnW2ldICYmICph
cmdzW2ldICE9IFRTVF9SRVQpIHsKICAgICAgICAgdHN0X3JlcyhURkFJTCwgIi4uLiIpOwogICAg
ICAgICByZXR1cm47CiAgICAgfQoKICAgICB0c3RfcmVzKFRQQVNTLCAiLi4uIik7Cn0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClNvbWUgc2FtZSBzdGVwcyBj
YW4gYmUgcmVtb3ZlZCBpbiBvcmlnaW5hbCB2ZXJpZnlfdGltZV9zdG9yZSgpIGFuZCAKdmVyaWZ5
X3RpbWUoKS4gIElzIGl0IHNpbXBsZXI/CkJ5IHRoZSB3YXksIEkgaGF2ZSBubyBvYmplY3Rpb24g
dG8gdXNlIGRpZmZlcmVudCBmdW5jdGlvbnMuCgpCZXN0IFJlZ2FyZHMsClhpYW8gWWFuZwo+Cj4K
PiAtLSAKPiBUaGFua3MsCj4gUnVhbiBTaGl5YW5nLgo+Cj4+Cj4+IEJlc3QgUmVnYXJkcywKPj4g
WGlhbyBZYW5nCj4+PiArCj4+PiArc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+Pj4g
KyAgICAudGVzdCA9IHJ1biwKPj4+ICsgICAgLnRjbnQgPSBBUlJBWV9TSVpFKHRjYXNlcyksCj4+
PiArfTsKPiAuCj4KCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
