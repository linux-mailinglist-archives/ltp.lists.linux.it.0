Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA71C992
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 15:48:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F8D92987A0
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 15:48:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id ACAA53EA20A
 for <ltp@lists.linux.it>; Tue, 14 May 2019 15:48:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7D6631401449
 for <ltp@lists.linux.it>; Tue, 14 May 2019 15:48:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D8DC5AF48
 for <ltp@lists.linux.it>; Tue, 14 May 2019 13:48:40 +0000 (UTC)
Date: Tue, 14 May 2019 15:48:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190514134838.GA1516@rei>
References: <20190508071636.13804-1-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508071636.13804-1-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] crypto/af_alg02: fixed read() being stuck
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

PiAtc3RhdGljIHZvaWQgcnVuKHZvaWQpCj4gK3ZvaWQgKnZlcmlmeV9lbmNyeXB0KHZvaWQgKmFy
ZyBMVFBfQVRUUklCVVRFX1VOVVNFRCkKPiAgewo+ICAJY2hhciBidWZbMTZdOwo+ICAJaW50IHJl
cWZkID0gdHN0X2FsZ19zZXR1cF9yZXFmZCgic2tjaXBoZXIiLCAic2Fsc2EyMCIsIE5VTEwsIDE2
KTsKPiAgCj4gKwlUU1RfQ0hFQ0tQT0lOVF9XQUtFKDApOwo+ICsKPiAgCS8qIFdpdGggdGhlIGJ1
ZyB0aGUga2VybmVsIGNyYXNoZWQgaGVyZSAqLwo+ICAJaWYgKHJlYWQocmVxZmQsIGJ1ZiwgMTYp
ID09IDApCj4gIAkJdHN0X3JlcyhUUEFTUywgIlN1Y2Nlc3NmdWxseSBcImVuY3J5cHRlZFwiIGFu
IGVtcHR5IG1lc3NhZ2UiKTsKPiAgCWVsc2UKPiAtCQl0c3RfcmVzKFRCUk9LLCAicmVhZCgpIGRp
ZG4ndCByZXR1cm4gMCIpOwo+ICsJCXRzdF9yZXMoVEZBSUwsICJyZWFkKCkgZGlkbid0IHJldHVy
biAwIik7Cj4gKwlyZXR1cm4gYXJnOwoKQWN0dWFsbHkgdGhlcmUgaXMgbm8gcG9pbnQgaW4gYWRk
aW5nIHRoZSBMVFBfQVRUUklCVVRFX1VOVVNFRCBzaW5jZSB5b3UKZG8gcmV0dXJuIGFyZzsgYXQg
dGhlIGVuZCBvZiB0aGUgZnVuY3Rpb24uCgpTbyBJJ3ZlIHJlbW92ZWQgdGhlIExUUF9BVFRSSUJV
VEVfVU5VU0VELCBjaGFuZ2VkIHRoZSBmdW5jdGlvbiB0byBiZQpzdGF0aWMgYW5kIHB1c2hlZC4g
dGhhbmtzLgoKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgcnVuKHZvaWQpCj4gK3sKPiArCXB0aHJl
YWRfdCB0aHI7Cj4gKwo+ICsJcHRocmVhZF9zZXRjYW5jZWxzdGF0ZShQVEhSRUFEX0NBTkNFTF9F
TkFCTEUsIE5VTEwpOwo+ICsJU0FGRV9QVEhSRUFEX0NSRUFURSgmdGhyLCBOVUxMLCB2ZXJpZnlf
ZW5jcnlwdCwgTlVMTCk7Cj4gKwo+ICsJVFNUX0NIRUNLUE9JTlRfV0FJVCgwKTsKPiArCj4gKwl3
aGlsZSAocHRocmVhZF9raWxsKHRociwgMCkgIT0gRVNSQ0gpIHsKPiArCQlpZiAodHN0X3RpbWVv
dXRfcmVtYWluaW5nKCkgPD0gMTApIHsKPiArCQkJcHRocmVhZF9jYW5jZWwodGhyKTsKPiArCQkJ
dHN0X2JyayhUQlJPSywKPiArCQkJCSJUaW1lZCBvdXQgd2hpbGUgcmVhZGluZyBmcm9tIHJlcXVl
c3Qgc29ja2V0LiIpOwo+ICsJCX0KPiArCQl1c2xlZXAoMTAwMCk7Cj4gKwl9Cj4gIH0KPiAgCj4g
IHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPiAgCS50ZXN0X2FsbCA9IHJ1biwKPiAr
CS50aW1lb3V0ID0gMjAsCj4gKwkubmVlZHNfY2hlY2twb2ludHMgPSAxLAo+ICB9Owo+IC0tIAo+
IDIuMTYuNAo+IAo+IAo+IC0tIAo+IE1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
