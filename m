Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AE43C30CFE
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 13:01:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 701303EA2FD
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 13:01:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D6D4B3EA028
 for <ltp@lists.linux.it>; Fri, 31 May 2019 13:01:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 66A6D1A01A48
 for <ltp@lists.linux.it>; Fri, 31 May 2019 13:01:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 80CA0AE2E;
 Fri, 31 May 2019 11:01:23 +0000 (UTC)
Date: Fri, 31 May 2019 13:01:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jinhui huang <huangjh.jy@cn.fujitsu.com>
Message-ID: <20190531110122.GA8819@rei.lan>
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02.c: Compatible with new
 and old kernels
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

SGkhCj4gVGhlIHBhdGNoIGFzIGZvbGxvd3M6Cj4gY29tbWl0IDExY2JmYjEwNzc1YSAoInZmczog
ZGVueSBjb3B5X2ZpbGVfcmFuZ2UoKSBmb3Igbm9uIHJlZ3VsYXIgZmlsZXMiKQo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEppbmh1aSBodWFuZyA8aHVhbmdqaC5qeUBjbi5mdWppdHN1LmNvbT4KPiAtLS0K
PiAgLi4uL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jICAgfCAz
MyArKysrKysrKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIuYyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAyLmMKPiBpbmRl
eCAwN2MwMjA3Li45ZTYzNTZjIDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAyLmMKPiArKysgYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jCj4gQEAg
LTU0LDE5ICs1NCwzMiBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfY29weV9maWxlX3JhbmdlKHVuc2ln
bmVkIGludCBuKQo+ICAJVEVTVChzeXNfY29weV9maWxlX3JhbmdlKGZkX3NyYywgMCwgKnRjLT5j
b3B5X3RvX2ZkLAo+ICAJCQkJMCwgQ09OVFNJWkUsIHRjLT5mbGFncykpOwo+ICAKPiAtCWlmIChU
U1RfUkVUID09IC0xKSB7Cj4gLQkJaWYgKHRjLT5leHBfZXJyID09IFRTVF9FUlIpIHsKPiArCWlm
IChUU1RfUkVUICE9IC0xKSB7Cj4gKwkJdHN0X3JlcyhURkFJTCwKPiArCQkJImNvcHlfZmlsZV9y
YW5nZSByZXR1cm5lZCB3cm9uZyB2YWx1ZTogJWxkIiwgVFNUX1JFVCk7Cj4gKwkJcmV0dXJuOwo+
ICsJfQo+ICsKPiArCWlmICh0Yy0+ZXhwX2VyciA9PSBUU1RfRVJSKSB7Cj4gKwkJdHN0X3JlcyhU
UEFTUyB8IFRURVJSTk8sCj4gKwkJCSJjb3B5X2ZpbGVfcmFuZ2UgZmFpbGVkIGFzIGV4cGVjdGVk
Iik7Cj4gKwl9IGVsc2Ugewo+ICsJCS8qIGNvcHlfZmlsZV9yYW5nZSgpIHJldHVybmVkIEVJU0RJ
UiB3aGVuIGNvcHllZCBjb250ZW50cyB0bwo+ICsJCSAqIGRpcmVjdG9yeSBvbiBuZXcga2VybmVs
cywgYnV0IG9uIG9sZCBrZXJuZWxzLCBpdCByZXR1cm5lZAo+ICsJCSAqIEVCQURGLgo+ICsJCSAq
Cj4gKwkJICogdGhlIHBhdGNoIGFzIGZvbGx3czoKPiArCQkgKiBjb21taXQgMTFjYmZiMTA3NzVh
ICgidmZzOiBkZW55IGNvcHlfZmlsZV9yYW5nZSgpIGZvciBub24gcmVndWxhciBmaWxlcyIpCj4g
KwkJICovCj4gKwkJaWYgKHRjLT5leHBfZXJyID09IEVJU0RJUiAmJiBUU1RfRVJSID09IEVCQURG
KSB7Cj4gIAkJCXRzdF9yZXMoVFBBU1MgfCBUVEVSUk5PLAo+IC0JCQkJCSJjb3B5X2ZpbGVfcmFu
Z2UgZmFpbGVkIGFzIGV4cGVjdGVkIik7CgpJZiBub3RoaW5nIGVsc2UgdGhpcyBzaG91bGQgYmUg
Z3VhcmRlZCBieSBrZXJuZWwgdmVyc2lvbiBjaGVjayBiZWNhdXNlCmlmIG5ldyBrZXJuZWwgc3Rh
cnRzIHRvIHJldHVybiBFQkFERkQgYWdhaW4sIHRoYXQgd291bGQgYmUgcmVncmVzc2lvbi4KClNv
IHdlIHNob3VsZCBjaGVjayB0aGUga2VybmVsIHZlcnNpb24gaW4gdGVzdCBzZXR1cCBhbmQgc2V0
IGEgZmxhZyB0aGF0CndvdWxkIGJlIGNoZWNrZWQgaGVyZSBhcyB3ZWxsLgoKLS0gCkN5cmlsIEhy
dWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
