Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AB145CE5
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 14:32:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4E223EA6A4
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 14:32:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 4C58E3EA58E
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 14:32:50 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 71C8E1002866
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 14:32:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DE35AD4E;
 Fri, 14 Jun 2019 12:32:49 +0000 (UTC)
Date: Fri, 14 Jun 2019 14:32:48 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190614123248.GB8796@rei.lan>
References: <20190608054550.13744-1-liwang@redhat.com>
 <20190612154855.GA4223@rei>
 <CAEemH2cmBAG1chpYLxN49EYuG9sAehPcgUgHPSa2cxNaEPZW3w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cmBAG1chpYLxN49EYuG9sAehPcgUgHPSa2cxNaEPZW3w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH RFC 1/3] lib: adding tst_on_arch function in
	library
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

SGkhCj4gPiBXaGF0IGlzIHRoZSBwb2ludCBvZiB0aGUgcnVudGltZSBkZXRlY3Rpb24gaGVyZT8K
PiA+Cj4gPiBJdCdzIG5vdCBsaWtlIHdlIGNhbiBydW4gczM5MHggYmluYXJ5IG9uIGkzODYsIGku
ZS4gd2Uga25vdyBmb3Igd2hpY2gKPiA+IGFyY2hpdGVjdHVyZSB3ZSBhcmUgY29tcGlsaW5nIGZv
ciBhdCB0aGUgY29tcGlsZSB0aW1lLgo+ID4KPiAKPiBZb3UgYXJlIHJpZ2h0LiBCdXQgd2Ugc3Rp
bGwgaGF2ZSBzb21lIGNoYW5jZSB0byBkbyBhbmFseXNpcyBhdCBydW50aW1lLCBpZgo+IHlvdSB0
YWtlIGEgbG9vayBhdCBwYXRjaCAyLzMsIGUuZy4gdG8gcGFyc2UgJy9wcm9jLzxwaWQ+L21hcHMn
Cj4gaW4gbWF4X21hcF9jb3VudC5jIGNhbiBiZSBkb25lIGF0IHJ1bnRpbWUgZGV0ZWN0aW9uLiBU
aGF0J3Mgd2hhdCBJIHRob3VnaHQKPiB3ZSBjYW4gZXhwb3J0IHRoZSB0c3Rfb25fYXJjaCgpIGFz
IGEgZ2xvYmFsIGZ1bmN0aW9uLgoKV2VsbCB0aGF0IHBhdGNoIHJlcGxhY2VzIHRoZSBpZmRlZnMg
d2l0aCBpZnMuIEkgZG9uJ3QgdGhpbmsgdGhhdCBpdAptYWtlcyB0aGluZ3Mgc2luZ2lmaWNhbnRs
eSBiZXR0ZXIuCgo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgc3RydWN0IHRzdF90ZXN0
IHRlc3QgPSB7Cj4gPiA+ICsgICAgIC4uLgo+ID4gPiArICAgICAudGVzdF9hbGwgPSBkb190ZXN0
LAo+ID4gPiArICAgICAuLi4KPiA+ID4gK30KPiA+ID4KPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPiA+ICsKPiA+ID4KPiA+ID4gIDIuMyBXcml0aW5nIGEgdGVzdGNhc2UgaW4gc2hlbGwK
PiA+ID4gIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdHN0X2FyY2guaCBiL2luY2x1ZGUvdHN0X2FyY2guaAo+ID4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAwMDAuLjdiZjA0OTNjZQo+ID4gPiAtLS0gL2Rl
di9udWxsCj4gPiA+ICsrKyBiL2luY2x1ZGUvdHN0X2FyY2guaAo+ID4gPiBAQCAtMCwwICsxLDE2
IEBACj4gPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+
ID4gPiArICogQ29weXJpZ2h0IChjKSAyMDE5IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgo+
ID4gPiArICovCj4gPiA+ICsKPiA+ID4gKyNpZm5kZWYgVFNUX0FSQ0hfSF9fCj4gPiA+ICsjZGVm
aW5lIFRTVF9BUkNIX0hfXwo+ID4gPiArCj4gPiA+ICsvKgo+ID4gPiArICogQ2hlY2sgaWYgdGVz
dCBwbGF0Zm9ybSBpcyBpbiB0aGUgZ2l2ZW4gYXJjaCBsaXN0LiBJZiB5ZXMgcmV0dXJuIDEsCj4g
PiA+ICsgKiBvdGhlcndpc2UgcmV0dXJuIDAuCj4gPiA+ICsgKgo+ID4gPiArICogQGFyY2gsIE5V
TEwgb3IgdmxpYWQgYXJjaCBsaXN0Cj4gPiA+ICsgKi8KPiA+ID4gK2ludCB0c3Rfb25fYXJjaChj
b25zdCBjaGFyICphcmNoKTsKPiA+ID4gKwo+ID4gPiArI2VuZGlmIC8qIFRTVF9BUkNIX0hfXyAq
Lwo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS90c3RfdGVzdC5oIGIvaW5jbHVkZS90c3RfdGVz
dC5oCj4gPiA+IGluZGV4IDhiZGYzODQ4Mi4uY2FmY2IxYTg5IDEwMDY0NAo+ID4gPiAtLS0gYS9p
bmNsdWRlL3RzdF90ZXN0LmgKPiA+ID4gKysrIGIvaW5jbHVkZS90c3RfdGVzdC5oCj4gPiA+IEBA
IC0yOCw2ICsyOCw3IEBACj4gPiA+ICAjaW5jbHVkZSAidHN0X2F0b21pYy5oIgo+ID4gPiAgI2lu
Y2x1ZGUgInRzdF9rdmVyY21wLmgiCj4gPiA+ICAjaW5jbHVkZSAidHN0X2Nsb25lLmgiCj4gPiA+
ICsjaW5jbHVkZSAidHN0X2FyY2guaCIKPiA+ID4gICNpbmNsdWRlICJ0c3Rfa2VybmVsLmgiCj4g
PiA+ICAjaW5jbHVkZSAidHN0X21pbm1heC5oIgo+ID4gPiAgI2luY2x1ZGUgInRzdF9nZXRfYmFk
X2FkZHIuaCIKPiA+ID4gQEAgLTExNCw2ICsxMTUsOCBAQCBzdHJ1Y3QgdHN0X3Rlc3Qgewo+ID4g
Pgo+ID4gPiAgICAgICBjb25zdCBjaGFyICptaW5fa3ZlcjsKPiA+ID4KPiA+ID4gKyAgICAgY29u
c3QgY2hhciAqYXJjaDsKPiA+ID4gKwo+ID4gPiAgICAgICAvKiBJZiBzZXQgdGhlIHRlc3QgaXMg
Y29tcGlsZWQgb3V0ICovCj4gPiA+ICAgICAgIGNvbnN0IGNoYXIgKnRjb25mX21zZzsKPiA+ID4K
PiA+ID4gQEAgLTI1Myw3ICsyNTYsNiBAQCBjb25zdCBjaGFyICp0c3Rfc3Ryc3RhdHVzKGludCBz
dGF0dXMpOwo+ID4gPiAgdW5zaWduZWQgaW50IHRzdF90aW1lb3V0X3JlbWFpbmluZyh2b2lkKTsK
PiA+ID4gIHZvaWQgdHN0X3NldF90aW1lb3V0KGludCB0aW1lb3V0KTsKPiA+ID4KPiA+ID4gLQo+
ID4gPiAgLyoKPiA+ID4gICAqIFJldHVybnMgcGF0aCB0byB0aGUgdGVzdCB0ZW1wb3JhcnkgZGly
ZWN0b3J5IGluIGEgbmV3bHkgYWxsb2NhdGVkCj4gPiBidWZmZXIuCj4gPiA+ICAgKi8KPiA+ID4g
QEAgLTI2NSw2ICsyNjcsOSBAQCBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3Q7Cj4gPiA+Cj4g
PiA+ICBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQo+ID4gPiAgewo+ID4gPiArICAg
ICBpZiAoIXRzdF9vbl9hcmNoKHRlc3QuYXJjaCkpCj4gPiA+ICsgICAgICAgICAgICAgdHN0X2Jy
ayhUQ09ORiwgIlRlc3QgbmVlZHMgcnVubmluZyBvbiAlcyBhcmNoISIsCj4gPiB0ZXN0LmFyY2gp
Owo+ID4gPiArCj4gPiA+ICAgICAgIHRzdF9ydW5fdGNhc2VzKGFyZ2MsIGFyZ3YsICZ0ZXN0KTsK
PiA+ID4gIH0KPiA+Cj4gPiBUaGlzIG1heSBiZSBhIGJpdCBjbGVhbmVyIHRoYXQgY29tcGlsaW5n
IHRoZSB0ZXN0IG91dCwgYnV0IHdpbGwgbm90IHNhdmUKPiA+IHVzIGZyb20gYXJjaCBzcGVjaWZp
YyBpZmRlZnMgY29tcGxldGVseSBzbyBJJ20gbm90IHN1cmUgaXQncyB3b3J0aCB0aGUKPiA+IHRy
b3VibGUuCj4gPgo+IAo+IEluZGVlZCwgSSBhbHNvIHJlYWxpemVkIHRoYXQgYWZ0ZXIgc2lnbmlu
ZyBvZmYgdGhpcyBwYXRjaCwgd2UgY2FuJ3QgcmVwbGFjZQo+IGlmZGVmcyBjb21wbGV0ZWx5IHZp
YSBhIHNpbXBsZSBmdW5jdGlvbiwgc2luY2UgaXQgb2NjdXJyaW5nIGluIHRoZQo+IGNvbXBpbGlu
ZyBlYXJseSBwaGFzZS4gQnV0IGFueXdheSBJIHJvbGwgb3V0IHRoaXMgZm9yIGNvbW1lbnRzIGlu
IGNhc2Ugd2UKPiBjb3VsZCBmaW5kIGFuIGltcHJvdmVkIHdheSB0byBkbyBiZXR0ZXIuCgpXZWxs
LCBvbmUgdGhpbmcgSSBsaWtlIGlzIHRoYXQgdGhlIGluZm9ybWF0aW9uIGFib3V0IHN1cHBvcnRl
ZCBhcmNoIGlzCmFjdHVhbGx5IHBhcnQgb2YgdGhlIHRzdF90ZXN0IHN0cnVjdHVyZSwgd2hpY2gg
bW92ZXMgdGhlIGluZm9ybWF0aW9uCmZyb20gYSBjb2RlIHRvIGEgbWV0YWRhdGEuIFRoZSB0c3Rf
b25fYXJjaCgpIGZ1bmN0aW9uIGRvZXMgbm90IHNlZW0gdG8KYmUgdXNlZnVsIHRvIG1lLgoKLS0g
CkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
