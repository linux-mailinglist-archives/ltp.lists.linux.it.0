Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 698D52851F
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 19:41:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E86A294ABC
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 19:41:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5EA8F3EA2F8
 for <ltp@lists.linux.it>; Thu, 23 May 2019 19:41:02 +0200 (CEST)
Received: from fieldses.org (fieldses.org [173.255.197.46])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 83F2714013A4
 for <ltp@lists.linux.it>; Thu, 23 May 2019 19:41:01 +0200 (CEST)
Received: by fieldses.org (Postfix, from userid 2815)
 id 35C4A1C9E; Thu, 23 May 2019 13:40:30 -0400 (EDT)
Date: Thu, 23 May 2019 13:40:30 -0400
From: "J. Bruce Fields" <bfields@fieldses.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190523174030.GB11083@fieldses.org>
References: <20190523134549.23103-1-chrubis@suse.cz>
 <CAOQ4uxhHVG9f1njmPgei8-QO4UEivXbxoHkqKi4f50XN6Gup9A@mail.gmail.com>
 <20190523164612.GA11083@fieldses.org>
 <CAOQ4uxg04H6_3ZsoKZwiVFt3LatjWhT8XWJSiMfFK_tCu5G-ww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxg04H6_3ZsoKZwiVFt3LatjWhT8XWJSiMfFK_tCu5G-ww@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Miklos Szeredi <miklos@szeredi.hu>, ltp@lists.linux.it,
 overlayfs <linux-unionfs@vger.kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDg6MjY6MjRQTSArMDMwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgNzo0NiBQTSBKLiBCcnVjZSBGaWVsZHMg
PGJmaWVsZHNAZmllbGRzZXMub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIE1heSAyMywgMjAx
OSBhdCAwNjo0MjoxMlBNICswMzAwLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiA+ID4gT24gVGh1
LCBNYXkgMjMsIDIwMTkgYXQgNDo0NSBQTSBDeXJpbCBIcnViaXMgPGNocnViaXNAc3VzZS5jej4g
d3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDeXJpbCBIcnViaXMgPGNocnVi
aXNAc3VzZS5jej4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9mY250bC9mY250bDMzLmMgfCAyICstCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzMy5jIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9mY250bC9mY250bDMzLmMKPiA+ID4gPiBpbmRleCA0M2RjNWEyYWYuLjYyNzgyM2M1
YyAxMDA2NDQKPiA+ID4gPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2Zj
bnRsMzMuYwo+ID4gPiA+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNu
dGwzMy5jCj4gPiA+ID4gQEAgLTExNyw3ICsxMTcsNyBAQCBzdGF0aWMgdm9pZCBkb190ZXN0KHVu
c2lnbmVkIGludCBpKQo+ID4gPiA+ICAgICAgICAgaWYgKFRTVF9SRVQgPT0gLTEpIHsKPiA+ID4g
PiAgICAgICAgICAgICAgICAgaWYgKHR5cGUgPT0gVFNUX09WRVJMQVlGU19NQUdJQyAmJiBUU1Rf
RVJSID09IEVBR0FJTikgewo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHRzdF9yZXMo
VElORk8gfCBUVEVSUk5PLAo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ImZjbnRsKEZfU0VUTEVBU0UsIEZfV1JMQ0spIGZhaWxlZCBvbiBvdmVybGFwZnMgYXMgZXhwZWN0
ZWQiKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmY250bChGX1NF
VExFQVNFLCBGX1dSTENLKSBmYWlsZWQgb24gb3ZlcmxheWZzIGFzIGV4cGVjdGVkIik7Cj4gPiA+
Cj4gPiA+IFlvdSBoYXZlIDMgbW9yZSBvZiB0aGlzIHR5cG8gaW4gZmNudGwgdGVzdHMuCj4gPiA+
Cj4gPiA+IElmIHlvdSBhc2sgbWUsIHNpbGVuY2luZyB0aGlzIGVycm9yIHNlZW1zIHdyb25nLgo+
ID4gPiBXaGlsZSB0aGUgZXJyb3IgaXMgKmV4cGVjdGVkKiBpdCBpcyBzdGlsbCBhIGJyb2tlbiBp
bnRlcmZhY2UuCj4gPiA+IEl0IG1heSBiZSBqdXN0IGEgbWF0dGVyIG9mIHRlcm1pbm9sb2d5LCBi
dXQgSSBhbSByZWFkaW5nIHRoaXMgbWVzc2FnZSBhczoKPiA+ID4KPiA+ID4gVEVTVCBQQVNTRUQ6
IE92ZXJsYXlmcyBmYWlsZWQgYXMgZXhwZWN0ZWQKPiA+ID4KPiA+ID4gV2hpbGUgaXQgcmVhbGx5
IHNob3VsZCBiZSBtb3JlIGFsb25nIHRoZSBsaW5lcyBvZjoKPiA+ID4KPiA+ID4gVEVTVCBTS0lQ
UEVEOiBPdmVybGF5ZnMgZG9lc24ndCBzdXBwb3J0IHdyaXRlIGxlYXNlZAo+ID4gPgo+ID4gPiBC
ZXNpZGVzLCB0aGlzIHByb2JsZW0gbG9va3MgcXVpdGUgZWFzeSB0byBmaXguCj4gPiA+IEkgdGhp
bmsgQnJ1Y2Ugd2FzIGFscmVhZHkgbG9va2luZyBhdCBjaGFuZ2luZyB0aGUgaW1wbGVtZW50YXRp
b24gb2YKPiA+ID4gY2hlY2tfY29uZmxpY3Rpbmdfb3BlbigpLCBzbyBpZiB0aGUgdGVzdCBpcyBu
b3QgZmFpbGluZywgbm9ib2R5IGlzIGdvaW5nIHRvCj4gPiA+IG51ZGdlIGZvciBhIGZpeC4uLgo+
ID4KPiA+IFVtLCBJIHJlbWVtYmVyIHRoYXQgZGlzY3Vzc2lvbiBidXQgSSBjYW4ndCByZW1lbWJl
ciB3aGF0IHRoZSBvYnN0YWNsZXMKPiA+IHdlcmUgaW4gdGhlIGVuZC4gIFRyeWluZyB0byBmaW5k
IHRoYXQgdGhyZWFkLi4uLgo+ID4KPiAKPiBpX3JlYWRjb3VudCBleGlzdHMsIGJ1dCBpdHMgd2l0
aCAjaWZkZWYgQ09ORklHX0lNQSBhbmQgaXQgY291bnRzCj4gb25seSBPX1JET05MWSB1c2Vycy4K
PiAKPiBJdCB3b3VsZG4ndCBpbmNyZWFzZSBzdHJ1Y3QgaW5vZGUgaWYgd2UgYWx3YXlzIGhhdmUg
aV9yZWFkY291bnQgZm9yCj4gNjRiaXQgYXJjaC4KPiAKPiBJIHRoaW5rIEZfV1JMQ0sgc2hvdWxk
IHJlcXVpcmUgaV9yZWFkY291bnQgPT0gMCAmJiBpX3dyaXRlY291bnQgPT0gMS4KPiAKPiBDYW4n
dCByZW1lbWJlciBpZiBhbmQgd2h5IHlvdSBuZWVkZWQgdGhlIHJlYWRlcnMgY291bnQ/CgpXZSBk
b24ndCB3YW50IHRvIGdyYW50IGEgd3JpdGUgbGVhc2Ugd2hpbGUgc29tZWJvZHkgaG9sZHMgYSBy
ZWFkIG9wZW4uCgpUaGlzIGlzIHRoZSBsYXN0IG1lc3NhZ2Ugb24gdGhlIHByZXZpb3VzIHRocmVh
ZCB0aGF0IEkgd2FzIHRoaW5raW5nIG9mOgoKCWh0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LWZz
ZGV2ZWwmbT0xNTUwMjYxMzg3MTM5Njkmdz0yCgpJIGhhdmVuJ3QgZ290dGVuIGJhY2sgdG8gaXQg
c2luY2UgdGhlbi4KCi0tYi4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
