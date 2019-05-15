Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E831F2DD
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 14:09:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 757E3294AF0
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 14:09:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 68744294AA6
 for <ltp@lists.linux.it>; Wed, 15 May 2019 14:08:57 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 48CD814012B3
 for <ltp@lists.linux.it>; Wed, 15 May 2019 14:08:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 60F9AABF4;
 Wed, 15 May 2019 12:08:55 +0000 (UTC)
Date: Wed, 15 May 2019 14:08:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20190515120853.GA22992@dell5510>
References: <20190405165225.27216-1-pvorel@suse.cz>
 <20190514121213.GA28655@dell5510>
 <1557889279.4581.14.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557889279.4581.14.camel@linux.ibm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Ignaz Forster <iforster@suse.de>, linux-integrity@vger.kernel.org,
 Marcus Meissner <meissner@suse.com>, ltp@lists.linux.it,
 Fabian Vogt <FVogt@suse.com>
Subject: Re: [LTP] [PATCH v2 0/3] LTP reproducer on broken IMA on overlayfs
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

SGkgTWltaSwKCj4gVGhlIGZpcnN0IHR3byBwYXRjaGVzIGFyZSBmaW5lLiDCoEZyb20gdGhlIHRl
c3QsIEknbSBzZWVpbmcgdGhlCj4gZm9sbG93aW5nIHJlc3VsdHM6ClRoYW5rcyBhIGxvdCBmb3Ig
cmV2aWV3aW5nIGFuZCB0ZXN0aW5nLgoKPiBldm1fb3ZlcmxheSAxIFRJTkZPOiBvdmVyd3JpdGUg
ZmlsZSBpbiBvdmVybGF5Cj4gdHN0X3JvZDogRmFpbGVkIHRvIG9wZW4gJyhudWxsKScgZm9yIHdy
aXRpbmc6IE9wZXJhdGlvbiBub3QgcGVybWl0dGVkCj4gZXZtX292ZXJsYXkgMSBURkFJTDogZWNo
byBvdmVybGF5ID4gbW50cG9pbnQvbWVyZ2VkL2ZvbzEudHh0IGZhaWxlZCB1bmV4cGVjdGVkbHkK
SSd2ZSBmaXhlZCAnKG51bGwpJyBbMV0sIHdpdGggdGhhdCBvbmUgYXBwbGllZCBpdCBzaG91bGQg
YmUgJ21udHBvaW50L21lcmdlZC9mb28xLnR4dCcKQnV0IHdoYXQgaXMgc3RyYW5nZSB0byBtZSBp
cyB0aGF0IGl0IGNvbnRpbnVlcyB0byBleGVjdXRlIHNlY29uZCBsaW5lLiByZXR1cm4gMSBbMl0K
c2hvdWxkIGNhdXNlIFJPRCgpIHRvIHF1aXQgd2l0aCBUQlJPSyBbM10uCk1heWJlIHRoYXQgUk9E
IGluIHRlc3QxKCkgc2hvdWxkIGJlIHJlcGxhY2VkIEVYUEVDVF9QQVNTLgoKPiBldm1fb3Zlcmxh
eSAyIFRJTkZPOiBhcHBlbmQgZmlsZSBpbiBvdmVybGF5OiBtbnRwb2ludC9sb3dlci9mb28yLnR4
dAo+IGV2bV9vdmVybGF5IDIgVFBBU1M6IGVjaG8gb3ZlcmxheSA+PiBtbnRwb2ludC9tZXJnZWQv
Zm9vMi50eHQgcGFzc2VkIGFzIGV4cGVjdGVkCj4gZXZtX292ZXJsYXkgMyBUSU5GTzogY3JlYXRl
IGEgbmV3IGZpbGUgaW4gb3ZlcmxheQo+IGV2bV9vdmVybGF5IDMgVFBBU1M6IGVjaG8gb3Zlcmxh
eSA+IG1udHBvaW50L21lcmdlZC9mb28zLnR4dCBwYXNzZWQgYXMgZXhwZWN0ZWQKPiBldm1fb3Zl
cmxheSA0IFRJTkZPOiByZWFkIGFsbCBjcmVhdGVkIGZpbGVzCj4gZXZtX292ZXJsYXkgNCBURkFJ
TDogY2F0IG1udHBvaW50L21lcmdlZC9mb28xLnR4dCA+IC9kZXYvbnVsbCAyPiAvZGV2L251bGwg
ZmFpbGVkIHVuZXhwZWN0ZWRseQo+IGV2bV9vdmVybGF5IDQgVEZBSUw6IGNhdCBtbnRwb2ludC9t
ZXJnZWQvZm9vMi50eHQgPiAvZGV2L251bGwgMj4gL2Rldi9udWxsIGZhaWxlZCB1bmV4cGVjdGVk
bHkKPiBldm1fb3ZlcmxheSA0IFRGQUlMOiBjYXQgbW50cG9pbnQvbWVyZ2VkL2ZvbzMudHh0ID4g
L2Rldi9udWxsIDI+IC9kZXYvbnVsbCBmYWlsZWQgdW5leHBlY3RlZGx5Cj4gZXZtX292ZXJsYXkg
NSBUSU5GTzogU0VMaW51eCBlbmFibGVkIGluIGVuZm9yY2luZyBtb2RlLCB0aGlzIG1heSBhZmZl
Y3QgdGVzdCByZXN1bHRzCj4gZXZtX292ZXJsYXkgNSBUSU5GTzogWW91IGNhbiB0cnkgdG8gZGlz
YWJsZSBpdCB3aXRoIFRTVF9ESVNBQkxFX1NFTElOVVg9MSAocmVxdWlyZXMgc3VwZXIvcm9vdCkK
PiBldm1fb3ZlcmxheSA1IFRJTkZPOiBsb2FkZWQgU0VMaW51eCBwcm9maWxlczogbm9uZQoKPiBX
aXRoICJldm06IGluc3RlYWQgb2YgdXNpbmcgdGhlIG92ZXJsYXlmcyBpX2lubywgdXNlIHRoZSBy
ZWFsIGlfaW5vIgo+IHBhdGNoLCBJJ20gb25seSBzZWVpbmcgdGhlIGZpcnN0IGZhaWx1cmUuCgo+
IE1pbWkKCktpbmQgcmVnYXJkcywKUGV0cgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10
ZXN0LXByb2plY3QvbHRwL2NvbW1pdC84YTM1ZGFmNmJiMTc1MzkxZmQ0M2NkMjhkOWNhMmQwZDVi
MDYxNTdjClsyXSBodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9ibG9i
L21hc3Rlci90ZXN0Y2FzZXMvbGliL3RzdF9yb2QuYyNMMTE3ClszXSBodHRwczovL2dpdGh1Yi5j
b20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9ibG9iL21hc3Rlci90ZXN0Y2FzZXMvbGliL3RzdF90
ZXN0LnNoI0wxNTAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
