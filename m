Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3B637321
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 13:41:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDE683EAA41
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 13:41:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A30E43EA9C7
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 13:41:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2BED31001547
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 13:41:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1FE45AE67;
 Thu,  6 Jun 2019 11:41:35 +0000 (UTC)
Date: Thu, 6 Jun 2019 13:41:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190606114134.GB13068@rei.lan>
References: <1559817080-2991-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1559817930-2299-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559817930-2299-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] sysctl/sysctl02: Add new regression test for
 overflow file-max
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

SGkhCj4gVW5mb3J0dW5hdGVseSwgY29tbWl0WzJdIGludHJvZHVjZWQgYSBuZXcgYnVnIGJlY2F1
c2UgdGhlIG1pbmltdW0gdmFsdWUgcG9pbnRzIGF0Cj4gdGhlIGdsb2JhbCAnemVybycgdmFyaWFi
bGUgd2hpY2ggaXMgYW4gaW50LiBJdCBtYXkgY3Jhc2ggc3lzdGVtLiBUaGlzIGJ1ZyBoYXMgYmVl
biBmaXhlZAo+IGJ0IGNvbW1pdFszXS4KPiAKPiBJIHdpbGwgc2V0IDJeNjQgLDJeNjQtMSwyXjYz
IGFuZCAwIHRvIGZpbGUtbWF4IGluIGNhc2UgYW5kIHRlc3QgaXQuCj4gCj4gWzFdaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L2NvbW1pdC8/aWQ9N2YyOTIzYzRmNzNmMjFjZmQ3MTRkMTJhMmQ0OGRlOGMyMWYxMWNmZQo+IFsy
XWh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC9jb21taXQvP2lkPTMyYTVhZDljMjI4NTJlNmJkOWU3NGJkZWM1OTM0ZWY5ZDE0
ODBiYzUKPiBbM11odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD05MDAyYjIxNDY1ZmE0ZDgyOWVkZmM5NGE1
YTQ0MTAwNWNmZmFhOTcyCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5q
eUBjbi5mdWppdHN1LmNvbT4KPiAtLS0KPiAgcnVudGVzdC9jb21tYW5kcyAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKPiAgdGVzdGNhc2VzL2NvbW1hbmRzL3N5c2N0bC9zeXNjdGwwMi5zaCB8
IDg4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDg5IGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNzU1IHRlc3RjYXNlcy9jb21tYW5kcy9zeXNj
dGwvc3lzY3RsMDIuc2gKPiAKPiBkaWZmIC0tZ2l0IGEvcnVudGVzdC9jb21tYW5kcyBiL3J1bnRl
c3QvY29tbWFuZHMKPiBpbmRleCBhYzE1ZThiMjMuLjE4NzBjNDIwOSAxMDA2NDQKPiAtLS0gYS9y
dW50ZXN0L2NvbW1hbmRzCj4gKysrIGIvcnVudGVzdC9jb21tYW5kcwo+IEBAIC00MCwzICs0MCw0
IEBAIGtleWN0bDAxX3NoIGtleWN0bDAxLnNoCj4gIGdkYjAxX3NoIGdkYjAxLnNoCj4gIHVuc2hh
cmUwMV9zaCB1bnNoYXJlMDEuc2gKPiAgc3lzY3RsMDFfc2ggc3lzY3RsMDEuc2gKPiArc3lzY3Rs
MDJfc2ggc3lzY3RsMDIuc2gKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2NvbW1hbmRzL3N5c2N0
bC9zeXNjdGwwMi5zaCBiL3Rlc3RjYXNlcy9jb21tYW5kcy9zeXNjdGwvc3lzY3RsMDIuc2gKPiBu
ZXcgZmlsZSBtb2RlIDEwMDc1NQo+IGluZGV4IDAwMDAwMDAwMC4uOWNhOWQwNjA5Cj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3Rlc3RjYXNlcy9jb21tYW5kcy9zeXNjdGwvc3lzY3RsMDIuc2gKPiBA
QCAtMCwwICsxLDg4IEBACj4gKyMhL2Jpbi9zaAo+ICsKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vci1sYXRlcgo+ICsjIENvcHlyaWdodCAoYykgMjAxOSBGVUpJVFNVIExJ
TUlURUQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4gKyMgQXV0aG9yOiBZYW5nIFh1PHh1eWFuZzIw
MTguanlAY24uZnVqaXRzdS5jb20+Cj4gKyMKPiArIyBEZXNjcmlwdGlvbjoKPiArIyBUaGlzIGlz
IGEgcmVncmVzc2lvbiB0ZXN0IGZvciBoYW5kbGluZyBvdmVyZmxvdyBmb3IgZmlsZS1tYXguCj4g
KyMKPiArIyB3aGVuIHdyaXRpbmcgMl42NCB0byAvcHJvYy9zeXMvZnMvZmlsZS1tYXguIEl0IHdp
bGwgb3ZlcmZsb3cKPiArIyBhbmQgYmUgc2V0IHRvIDAuIEl0IGNyYXNoIHN5c3RlbSBxdWlja2x5
Lgo+ICsjCj4gKyMgVGhlIGtlcm5lbCBidWcgaGFzIGJlZW4gZml4ZWQgaW4ga2VybmVsOgo+ICsj
ICc3ZjI5MjNjNGYnIChzeXNjdGw6IGhhbmRsZSBvdmVyZmxvdyBpbiBwcm9jX2dldF9sb25nKQo+
ICsjIHRoZSBwZXJtaXR0ZWQgbWF4IHZhbHVlIGlzICAyXjY0LTEuCj4gKyMgJzMyYTVhZDljMicg
KHN5c2N0bDogaGFuZGxlIG92ZXJmbG93IGZvciBmaWxlLW1heCkKPiArIyB0aGUgcGVybWl0dGVk
IG1heCB2YWx1ZSBpcyAyXjYzLTEKPiArIwo+ICsjIEFmdGVyIG1lcmdlZCB0aGlzIHBhdGNoc2V0
LCBpZiB3ZSBleGNlZWQgdGhlIG1heCB2YWx1ZSwgaXQgd2lsbAo+ICsjIGtlZXAgb2xkIHZhbHVl
LiBVbmZvcnR1bmF0ZWx5LCBpdCBpbnRyb3VkY2VkIGEgbmV3IGJ1ZyB3aGVuIHNldCBpdAo+ICsj
IHRvIDAgYW5kIGl0IHdpbGwgbGVhZCB0byBzeXN0ZW0gY3Jhc2guCj4gKyMgVGhpcyBidWcgaGFz
IGJlZW4gZml4ZWQgYnkgY29tbWl0IDkwMDJiMjE0Ngo+ICsjIChrZXJuZWwvc3lzY3RsLmM6IGZp
eCBvdXQtb2YtYm91bmRzIGFjY2VzcyB3aGVuIHNldHRpbmcgZmlsZS1tYXgpCj4gKwo+ICtUU1Rf
VEVTVEZVTkM9ZG9fdGVzdAo+ICtUU1RfU0VUVVA9c2V0dXAKPiArVFNUX0NMRUFOVVA9Y2xlYW51
cAo+ICtUU1RfQ05UPTQKPiArVFNUX05FRURTX1JPT1Q9MQo+ICtUU1RfTkVFRFNfQ01EUz0ic3lz
Y3RsIgo+ICtkaXI9Ii9wcm9jL3N5cy9mcy8iCj4gK25hbWU9ImZpbGUtbWF4Igo+ICtvcmlnX3Zh
bHVlPTIwMDAwMAo+ICtjaGVjazE9MTg0NDY3NDQwNzM3MDk1NTE2MTYKPiArY2hlY2syPTE4NDQ2
NzQ0MDczNzA5NTUxNjE1Cj4gK2NoZWNrMz05MjIzMzcyMDM2ODU0Nzc1ODA4Cj4gK2NoZWNrND0w
Cj4gKwo+ICsuIHRzdF90ZXN0LnNoCj4gKwo+ICtzZXR1cCgpCj4gK3sKPiArCVsgISAtZiAiJGRp
ciIiJG5hbWUiIF0gJiYgdHN0X2JyayBUQ09ORiBcCj4gKwkJIiRuYW1lIHdhcyBub3Qgc3VwcG9y
dGVkIgo+ICsJb3JpZ192YWx1ZT0kKGNhdCAiJGRpciIiJG5hbWUiKQo+ICt9Cj4gKwo+ICtkb190
ZXN0KCkKPiArewo+ICsJY2FzZSAkMSBpbgo+ICsJMSlzeXNjdGxfdGVzdF9vdmVyZmxvdyAke2No
ZWNrMX07Owo+ICsJMilzeXNjdGxfdGVzdF9vdmVyZmxvdyAke2NoZWNrMn07Owo+ICsJMylzeXNj
dGxfdGVzdF9vdmVyZmxvdyAke2NoZWNrM307Owo+ICsJNClzeXNjdGxfdGVzdF96ZXJvICR7Y2hl
Y2s0fTs7CgpUaGVyZSBpcyBubyBwb2ludCBpbiBoYXZpbmcgdGhlIG51bWJlcnMgaW4gY2hlY2sg
dmFyaWFibGVzIGlmIHdlIGRvIGNhc2UKaGVyZSwgd2UgY2FuIGp1c3QgcGFzcyBpdCBoZXJlLgoK
PiArCWVzYWMKPiArfQo+ICsKPiArc3lzY3RsX3Rlc3Rfb3ZlcmZsb3coKQo+ICt7Cj4gKwlsb2Nh
bCBvbGRfdmFsdWU9JChjYXQgIiRkaXIiIiRuYW1lIikKPiArCj4gKwlzeXNjdGwgLXcgImZzLmZp
bGUtbWF4Ij0kMSA+L2Rldi9udWxsIDI+JjEKPiArCj4gKwlsb2NhbCB0ZXN0X3ZhbHVlPSQoY2F0
ICIkZGlyIiIkbmFtZSIpCj4gKwo+ICsJZWNobyAke3Rlc3RfdmFsdWV9IHxncmVwIC1xICR7b2xk
X3ZhbHVlfQo+ICsJaWYgWyAkPyAtZXEgMCBdOyB0aGVuCj4gKwkJdHN0X3JlcyBUUEFTUyAiZmls
ZS1tYXggb3ZlcmZsb3csIHJlamVjdCBpdCBhbmQga2VlcCBvbGQgdmFsdWUuIgo+ICsJZWxzZQo+
ICsJCXRzdF9yZXMgVEZBSUwgImZpbGUtbWF4IG92ZXJmbG93IGFuZCBzZXQgaXQgdG8gJHt0ZXN0
X3ZhbHVlfS4iCj4gKwlmaQo+ICsJY2xlYW51cAo+ICt9Cj4gKwo+ICtzeXNjdGxfdGVzdF96ZXJv
KCkKPiArewo+ICsJc3lzY3RsIC13ICJmcy5maWxlLW1heCI9JDEgPi9kZXYvbnVsbCAyPiYxCj4g
Kwl0c3RfcmVzIFRJTkZPICJpZiBpdCBkb2Vzbid0IHJlcG9ydCBUUEFTUyBhZnRlciA2MHMgc2xl
ZXAsIHN5c3RlbSBjcmFzaGVzIgo+ICsJc2xlZXAgNjAKCldoYXQgaGFwcGVucyBvbiB0aGUgYnVn
Z3kga2VybmVsIGhlcmU/CgpEb2VzIGl0IGNyYXNoIHJlbGlhYmx5PwoKSXQgbG9va3MgdG8gbWUg
dGhhdCByZXByb2R1Y2luZyB0aGlzIGJ1ZyB3aXRob3V0IEtBU0FOIGVuYWJsZWQga2VybmVsCndv
dWxkIGJlIHJlYWxseSBoYXJkIG9yIGV2ZW4gaW1wb3NzaWJsZSwgdGhlcmVmb3JlIHRoZSBzbGVl
cCBoZXJlIGRvZXMKbm90IG1hdHRlciBhdCBhbGwuCgo+ICsJdHN0X3JlcyBUUEFTUyAiZmlsZS1t
YXggaXMgc2V0IDAgYW5kIGRvZXNuJ3QgY3Jhc2giCj4gK30KPiArCj4gK2NsZWFudXAoKQo+ICt7
Cj4gKwlzeXNjdGwgLXcgImZzLiIiJG5hbWUiPSR7b3JpZ192YWx1ZX0gPi9kZXYvbnVsbCAyPiYx
Cj4gK30KPiArCj4gK3RzdF9ydW4KPiAtLSAKPiAyLjE4LjEKPiAKPiAKPiAKPiAKPiAtLSAKPiBN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKCi0t
IApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
