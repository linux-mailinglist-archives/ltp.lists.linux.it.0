Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30696F163
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 09:35:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB3CC3EACAB
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 09:35:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 00D253EACA0
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 09:35:00 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3CCED60193D
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 09:34:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 36EB8E1F0A
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 07:34:57 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0CD71001E63;
 Tue, 30 Apr 2019 07:34:54 +0000 (UTC)
Date: Tue, 30 Apr 2019 15:34:53 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190430073453.45cblrgmxh3a44hd@XZHOUW.usersys.redhat.com>
References: <20190430045746.1332-1-xzhou@redhat.com>
 <CAEemH2diyxXisD=f2DX7ptq3c_+XhNe3=xjXU+KXS2BPohaT0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2diyxXisD=f2DX7ptq3c_+XhNe3=xjXU+KXS2BPohaT0A@mail.gmail.com>
User-Agent: NeoMutt/20180716-1400-f2a658
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 30 Apr 2019 07:34:57 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] fcntl33: weakup child before exit if fail in
	parent
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

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDM6MTg6MzJQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
PiBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCAxMjo1OCBQTSBNdXJwaHkgWmhvdSA8eHpob3VAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gCj4gPiBOb3cgaXQgZmFpbGlzIG9uIG92ZXJsYXlmcyB0aGlzIHdh
eToKPiA+IGZjbnRsMzMuYzoxMjA6IElORk86IC4uLi4gZmFpbGVkIG9uIG92ZXJsYXBmcyBhcyBl
eHBlY3RlZDoKPiA+IEVBR0FJTi9FV09VTERCTE9DSwo+ID4gdHN0X2NoZWNrcG9pbnQuYzoxNDk6
IEJST0s6IGZjbnRsMzMuYzoxNzg6IHRzdF9jaGVja3BvaW50X3dhaXQoMCwgMTAwMDApOgo+ID4g
RVRJTUVET1VUCj4gPiB0c3RfdGVzdC5jOjM1NzogQlJPSzogUmVwb3J0ZWQgYnkgY2hpbGQgKDEy
MDY2KQo+ID4KPiAKPiBJJ20gd29uZGVyaW5nIHRoYXQgaWYgdGhlIHBhcmVudCBmYWlsZWQgdG8g
c2V0IGxlYXNlLCBzaG91bGQgY2hpbGQKPiBzdGlsbCB2YWx1YWJsZSB0byBydW4gdGhlIHJlbWFp
bmluZyB0ZXN0IGFmdGVyIGl0IGJlaW5nIHdha2VuZWQ/CgpJbiBkb19jaGlsZCBpdCBqdXN0IG9w
ZW4gZmlsZSBhbmQgY2FsY3VsYXRlIHRoZSB0aW1lIHNwZW50IG9uIGl0LiBBbHNvCnBhcmVudCB3
aWxsIHJlYXAgdGhlIGNoaWxkIGJlZm9yZSBleGl0IGFueXdheS4gVGhhdCBjaGVja3BvaW50IGlz
IG5lZWRlZAp3aGlsZSBldmVyeXRoaW5nIGdvZXMgZmluZSwgc28gZXZlbiBpdCdzIG5vdCB0aGF0
IHZhbHVhYmxlIHRvIHJ1biB0aGUKcmVtYWluaW5nIHRlc3RzIGluIGNoaWxkLCBpdCdzIG5vdCBo
dXJ0aW5nIHRob3VnaCwgOikKClRoYW5rcyBmb3IgcmV2aWV3aW5nIQotLQpNCj4gCj4gCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogTXVycGh5IFpob3UgPHh6aG91QHJlZGhhdC5jb20+Cj4gPiAtLS0K
PiA+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzMuYyB8IDEgKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzMuYwo+ID4gYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzMuYwo+ID4gaW5kZXggNDNkYzVhMmFmLi5jZTI3ZTEw
MDYgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRs
MzMuYwo+ID4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMK
PiA+IEBAIC0xMjEsNiArMTIxLDcgQEAgc3RhdGljIHZvaWQgZG9fdGVzdCh1bnNpZ25lZCBpbnQg
aSkKPiA+ICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgdHN0X3JlcyhURkFJTCB8IFRURVJSTk8sICJmY250bCgpIGZhaWxlZCB0byBzZXQKPiA+IGxl
YXNlIik7Cj4gPiAgICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICAgIFRTVF9DSEVD
S1BPSU5UX1dBS0UoMCk7Cj4gPiAgICAgICAgICAgICAgICAgZ290byBleGl0Owo+ID4gICAgICAg
ICB9Cj4gPgo+ID4gLS0KPiA+IDIuMjEuMAo+ID4KPiA+Cj4gPiAtLQo+ID4gTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCj4gPgo+IAo+IAo+IC0t
IAo+IFJlZ2FyZHMsCj4gTGkgV2FuZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
