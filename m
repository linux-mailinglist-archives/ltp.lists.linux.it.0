Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DA328B30
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 22:01:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AA233EA7BE
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 22:01:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 63ACA3EA17E
 for <ltp@lists.linux.it>; Thu, 23 May 2019 22:01:31 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5BE5F201483
 for <ltp@lists.linux.it>; Thu, 23 May 2019 22:01:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F579AD9C;
 Thu, 23 May 2019 20:01:28 +0000 (UTC)
Date: Thu, 23 May 2019 22:01:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190523200125.GA20104@dell5510>
References: <20190523134549.23103-1-chrubis@suse.cz>
 <CAOQ4uxhHVG9f1njmPgei8-QO4UEivXbxoHkqKi4f50XN6Gup9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhHVG9f1njmPgei8-QO4UEivXbxoHkqKi4f50XN6Gup9A@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: Miklos Szeredi <miklos@szeredi.hu>,
 overlayfs <linux-unionfs@vger.kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] [COMMITTED] syscalls/fcntl33: Fix typo overlapfs
 -> overlayfs
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+IE9uIFRodSwgTWF5IDIzLCAyMDE5IGF0IDQ6NDUgUE0gQ3lyaWwgSHJ1YmlzIDxjaHJ1
YmlzQHN1c2UuY3o+IHdyb3RlOgoKPiA+IFNpZ25lZC1vZmYtYnk6IEN5cmlsIEhydWJpcyA8Y2hy
dWJpc0BzdXNlLmN6Pgo+ID4gLS0tCj4gPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250
bC9mY250bDMzLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
ZmNudGwvZmNudGwzMy5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMz
LmMKPiA+IGluZGV4IDQzZGM1YTJhZi4uNjI3ODIzYzVjIDEwMDY0NAo+ID4gLS0tIGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMKPiA+ICsrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzMy5jCj4gPiBAQCAtMTE3LDcgKzExNyw3IEBAIHN0
YXRpYyB2b2lkIGRvX3Rlc3QodW5zaWduZWQgaW50IGkpCj4gPiAgICAgICAgIGlmIChUU1RfUkVU
ID09IC0xKSB7Cj4gPiAgICAgICAgICAgICAgICAgaWYgKHR5cGUgPT0gVFNUX09WRVJMQVlGU19N
QUdJQyAmJiBUU1RfRVJSID09IEVBR0FJTikgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
dHN0X3JlcyhUSU5GTyB8IFRURVJSTk8sCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJmY250bChGX1NFVExFQVNFLCBGX1dSTENLKSBmYWlsZWQgb24gb3ZlcmxhcGZzIGFzIGV4
cGVjdGVkIik7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmY250bChGX1NF
VExFQVNFLCBGX1dSTENLKSBmYWlsZWQgb24gb3ZlcmxheWZzIGFzIGV4cGVjdGVkIik7Cgo+IFlv
dSBoYXZlIDMgbW9yZSBvZiB0aGlzIHR5cG8gaW4gZmNudGwgdGVzdHMuClRoYW5rcyBmb3IgcmVw
b3J0LCBBbWlyLiBDeXJpbCB3aWxsIGZpeCBpdCB0b21vcnJvdyBJIGd1ZXNzLgoKPiBJZiB5b3Ug
YXNrIG1lLCBzaWxlbmNpbmcgdGhpcyBlcnJvciBzZWVtcyB3cm9uZy4KPiBXaGlsZSB0aGUgZXJy
b3IgaXMgKmV4cGVjdGVkKiBpdCBpcyBzdGlsbCBhIGJyb2tlbiBpbnRlcmZhY2UuCj4gSXQgbWF5
IGJlIGp1c3QgYSBtYXR0ZXIgb2YgdGVybWlub2xvZ3ksIGJ1dCBJIGFtIHJlYWRpbmcgdGhpcyBt
ZXNzYWdlIGFzOgoKPiBURVNUIFBBU1NFRDogT3ZlcmxheWZzIGZhaWxlZCBhcyBleHBlY3RlZAoK
PiBXaGlsZSBpdCByZWFsbHkgc2hvdWxkIGJlIG1vcmUgYWxvbmcgdGhlIGxpbmVzIG9mOgoKPiBU
RVNUIFNLSVBQRUQ6IE92ZXJsYXlmcyBkb2Vzbid0IHN1cHBvcnQgd3JpdGUgbGVhc2VkCisxLCBz
byBiZXNpZGVzIGNoYW5nZWQgcGhyYXNpbmcgdXNlIFRDT05GIGluc3RlYWQgb2YgVElORk8gaW4g
dGhlIGVycm9yIG1lc3NhZ2UuCgo+IEJlc2lkZXMsIHRoaXMgcHJvYmxlbSBsb29rcyBxdWl0ZSBl
YXN5IHRvIGZpeC4KPiBJIHRoaW5rIEJydWNlIHdhcyBhbHJlYWR5IGxvb2tpbmcgYXQgY2hhbmdp
bmcgdGhlIGltcGxlbWVudGF0aW9uIG9mCj4gY2hlY2tfY29uZmxpY3Rpbmdfb3BlbigpLCBzbyBp
ZiB0aGUgdGVzdCBpcyBub3QgZmFpbGluZywgbm9ib2R5IGlzIGdvaW5nIHRvCj4gbnVkZ2UgZm9y
IGEgZml4Li4uCgo+IFRoYW5rcywKPiBBbWlyLgoKCktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
