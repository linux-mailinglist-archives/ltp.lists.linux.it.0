Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A76CB1C38E2
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 14:07:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D0543C586D
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 14:07:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0DE013C269E
 for <ltp@lists.linux.it>; Mon,  4 May 2020 14:07:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 98F51200C63
 for <ltp@lists.linux.it>; Mon,  4 May 2020 14:07:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B51CEAD5D;
 Mon,  4 May 2020 12:07:44 +0000 (UTC)
Date: Mon, 4 May 2020 14:07:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200504120740.GA6452@dell5510>
References: <20200502162744.9589-1-amir73il@gmail.com>
 <20200502162744.9589-4-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200502162744.9589-4-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/4] syscalls/fanotify: New test for
 FAN_MODIFY_DIR
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQW1pciwKCndoaWxlIHdhaXRpbmcgZm9yIHlvdSBhbmQgSmFuIHRvIGFncmVlIHdoZXRoZXIg
d2hvbGUgcGF0Y2hzZXQgc2hvdWxkIGJlIG1lcmdlZApJIGhhdmUgMiBmaXhlcyBmb3IgdjIuCgo+
ICtzdGF0aWMgaW5saW5lIHZvaWQgZmFub3RpZnlfc2F2ZV9maWQoY29uc3QgY2hhciAqcGF0aCwK
PiArCQkJCSAgICAgc3RydWN0IGZhbm90aWZ5X2ZpZF90ICpmaWQpCj4gK3sKPiArCWludCAqZmgg
PSAoaW50ICopKGZpZC0+aGFuZGxlLmZfaGFuZGxlKTsKPiArCj4gKwlmaFswXSA9IGZoWzFdID0g
ZmhbMl0gPSAwOwo+ICsJZmlkLT5oYW5kbGUuaGFuZGxlX2J5dGVzID0gTUFYX0hBTkRMRV9TWjsK
PiArCWZhbm90aWZ5X2dldF9maWQocGF0aCwgJmZpZC0+ZnNpZCwgJmZpZC0+aGFuZGxlKTsKPiAr
Cj4gKwl0c3RfcmVzKFRJTkZPLAo+ICsJCSJmaWQoJXMpID0gJXguJXguJXguJXguJXguLi4iLCBw
YXRoLAo+ICsJCUZTSURfVkFMX01FTUJFUihmaWQtPmZzaWQsIDApLCBGU0lEX1ZBTF9NRU1CRVIo
ZmlkLT5mc2lkLCAxKSwKPiArCQlmaFswXSwgZmhbMV0sIGZoWzJdKTsKCldlJ3JlIHVzaW5nIF9f
a2VybmVsX2ZzaWRfdCwgd2hpY2ggaGFzIHZhbCBtZW1iZXIgb24gYm90aCBsaWJjIGFuZCBtdXNs
LAp0aHVzIGl0IG11c3QgYmU6Ci0JCSJmaWQoJXMpID0gJXguJXguJXguJXguJXguLi4iLCBwYXRo
LAotCQlGU0lEX1ZBTF9NRU1CRVIoZmlkLT5mc2lkLCAwKSwgRlNJRF9WQUxfTUVNQkVSKGZpZC0+
ZnNpZCwgMSksCi0JCWZoWzBdLCBmaFsxXSwgZmhbMl0pOworCQkiZmlkKCVzKSA9ICV4LiV4LiV4
LiV4LiV4Li4uIiwgcGF0aCwgZmlkLT5mc2lkLnZhbFswXSwKKwkJZmlkLT5mc2lkLnZhbFsxXSwg
ZmhbMF0sIGZoWzFdLCBmaFsyXSk7CgouLi4KPiArCQl9IGVsc2UgaWYgKG1lbWNtcCgmZXZlbnRf
ZmlkLT5mc2lkLCAmZXhwZWN0ZWQtPmZpZC0+ZnNpZCwKPiArCQkJCSAgc2l6ZW9mKGV2ZW50X2Zp
ZC0+ZnNpZCkpICE9IDApIHsKPiArCQkJdHN0X3JlcyhURkFJTCwKPiArCQkJCSJnb3QgZXZlbnQ6
IG1hc2s9JWxseCBwaWQ9JXUgZmQ9JWQgbmFtZT0nJXMnICIKPiArCQkJCSJsZW49JWQgaW5mb190
eXBlPSVkIGluZm9fbGVuPSVkIGZoX2xlbj0lZCAiCj4gKwkJCQkiZnNpZD0leC4leCAoZXhwZWN0
ZWQgJXguJXgpIiwKPiArCQkJCSh1bnNpZ25lZCBsb25nIGxvbmcpZXZlbnQtPm1hc2ssCj4gKwkJ
CQkodW5zaWduZWQpZXZlbnQtPnBpZCwgZXZlbnQtPmZkLCBmaWxlbmFtZSwKPiArCQkJCWV2ZW50
LT5ldmVudF9sZW4sIGluZm9fdHlwZSwKPiArCQkJCWV2ZW50X2ZpZC0+aGRyLmxlbiwgZmhsZW4s
Cj4gKwkJCQlGU0lEX1ZBTF9NRU1CRVIoZXZlbnRfZmlkLT5mc2lkLCAwKSwKPiArCQkJCUZTSURf
VkFMX01FTUJFUihldmVudF9maWQtPmZzaWQsIDEpLAo+ICsJCQkJRlNJRF9WQUxfTUVNQkVSKGV4
cGVjdGVkLT5maWQtPmZzaWQsIDApLAo+ICsJCQkJRlNJRF9WQUxfTUVNQkVSKGV4cGVjdGVkLT5m
aWQtPmZzaWQsIDEpKTsKCkFsc28gaGVyZSAzcmQgYW5kIDR0aCBhY2Nlc3MgbXVzdCBiZSBkaXJl
Y3QgYXMgaXQgaXMgZXZlbnRfdDoKLQkJCQlGU0lEX1ZBTF9NRU1CRVIoZXhwZWN0ZWQtPmZpZC0+
ZnNpZCwgMCksCi0JCQkJRlNJRF9WQUxfTUVNQkVSKGV4cGVjdGVkLT5maWQtPmZzaWQsIDEpKTsK
KwkJCQlleHBlY3RlZC0+ZmlkLT5mc2lkLnZhbFswXSwKKwkJCQlleHBlY3RlZC0+ZmlkLT5mc2lk
LnZhbFsxXSk7CgpGWUkgRlNJRF9WQUxfTUVNQkVSIGlzIG9ubHkgZm9yIGV2ZW50X2ZpZC4gSSdt
IHNvcnJ5LCBhbHRob3VnaCB0aGVyZSBpcyBhIG5vdGUKaW4gZmFub3RpZnkuaCwgaXQncyBhIGJp
dCBjb25mdXNpbmcgKHNlZSBmMzc3MDRkNmMgZmFub3RpZnk6IEZpeApGU0lEX1ZBTF9NRU1CRVIo
KSB1c2FnZSkuCgpUaGVyZSBpcyBhbHNvIHdhcm5pbmcgb24gYXJyYXkgc2l6ZSBvbiBuZXdlciBj
b21waWxlcnM6CgogIDM3OCB8ICBzcHJpbnRmKGZuYW1lMSwgIiVzLyVzIiwgZG5hbWUxLCBGSUxF
X05BTUUxKTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICBefgpJbiBmaWxlIGluY2x1ZGVk
IGZyb20gL3Vzci9pbmNsdWRlL3N0ZGlvLmg6ODY3LAogICAgICAgICAgICAgICAgIGZyb20gZmFu
b3RpZnkxNi5jOjEzOgovdXNyL2luY2x1ZGUvYml0cy9zdGRpbzIuaDozNjoxMDogbm90ZTog4oCY
X19idWlsdGluX19fc3ByaW50Zl9jaGvigJkgb3V0cHV0IGJldHdlZW4gMTIgYW5kIDI2NyBieXRl
cyBpbnRvIGEgZGVzdGluYXRpb24gb2Ygc2l6ZSAyNTYKICAgMzYgfCAgIHJldHVybiBfX2J1aWx0
aW5fX19zcHJpbnRmX2NoayAoX19zLCBfX1VTRV9GT1JUSUZZX0xFVkVMIC0gMSwKICAgICAgfCAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KICAgMzcgfCAgICAgICBfX2JvcyAoX19zKSwgX19mbXQsIF9fdmFfYXJnX3BhY2sgKCkp
OwogICAgICB8ICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KZmFu
b3RpZnkxNi5jOjM3OToyMjogd2FybmluZzog4oCYJXPigJkgZGlyZWN0aXZlIHdyaXRpbmcgMTAg
Ynl0ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gMCBhbmQgMjU1IFstV2Zvcm1hdC1v
dmVyZmxvdz1dCiAgMzc5IHwgIHNwcmludGYoZm5hbWUyLCAiJXMvJXMiLCBkbmFtZTEsIEZJTEVf
TkFNRTIpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgIF5+CgpJdCBjYW4gYmUgZml4ZWQg
YnkgaW5jcmVhc2luZyB0aGUgc2l6ZSBvZiBmbmFtZTEgYW5kIGZuYW1lMjoKLXN0YXRpYyBjaGFy
IGZuYW1lMVtCVUZfU0laRV0sIGZuYW1lMltCVUZfU0laRV07CitzdGF0aWMgY2hhciBmbmFtZTFb
QlVGX1NJWkUgKyAxMV0sIGZuYW1lMltCVUZfU0laRSArIDExXTsKCkkgZG9uJ3QgbGlrZSB0aGF0
IGNvZGUgYnV0IG9uIHRoZSBvdGhlciBoYW5kIGRvbid0IGxpa2UgaW50cm9kdWNpbmcgd2Fybmlu
Z3MKZWl0aGVyLgoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
