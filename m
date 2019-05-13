Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920B1B144
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 09:39:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0988294AB1
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 09:39:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8E78E294A36
 for <ltp@lists.linux.it>; Mon, 13 May 2019 09:39:40 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9ED7D1000C66
 for <ltp@lists.linux.it>; Mon, 13 May 2019 09:39:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0550830820E6;
 Mon, 13 May 2019 07:39:38 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 735F068D74;
 Mon, 13 May 2019 07:39:37 +0000 (UTC)
Date: Mon, 13 May 2019 15:39:35 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190513073935.t6pbbvzqlflc42do@XZHOUW.usersys.redhat.com>
References: <CAOQ4uxjDyx7JFBSmkDe-rHNe=NriT710Ldsva=s+HasaDL0CTw@mail.gmail.com>
 <20190510044217.5215-1-xzhou@redhat.com>
 <CAOQ4uxi1=Xj59GvyrJf9HiMgGvRYTC8HGG8UOZKz3B8zgGh52g@mail.gmail.com>
 <20190510081535.ax7th47uyjjkayk6@XZHOUW.usersys.redhat.com>
 <CAOQ4uxjAzTL+aN4SdvD7xEUhuOht0nc70JDUOqAHGoyChOyPbA@mail.gmail.com>
 <20190511042014.xlonuwqpg6owg6a3@XZHOUW.usersys.redhat.com>
 <CAOQ4uxjQ918iCXv3XdzmyKfQjqzBu-=N3Y+-BXDmrEDH-KVfpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjQ918iCXv3XdzmyKfQjqzBu-=N3Y+-BXDmrEDH-KVfpQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-1400-f2a658
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 13 May 2019 07:39:38 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: Li Wang <liwan@redhat.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/swap{on,
 off}: fail softly if FIBMAP ioctl trial fails
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

T24gU2F0LCBNYXkgMTEsIDIwMTkgYXQgMTI6MzA6NTFQTSArMDMwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gU2F0LCBNYXkgMTEsIDIwMTkgYXQgNzoyMCBBTSBNdXJwaHkgWmhvdSA8eHpo
b3VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMTE6
NDg6NDJBTSArMDMwMCwgQW1pciBHb2xkc3RlaW4gd3JvdGU6Cj4gPiA+IE9uIEZyaSwgTWF5IDEw
LCAyMDE5IGF0IDExOjE1IEFNIE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPiB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0IDA4OjI3OjM1QU0gKzAzMDAs
IEFtaXIgR29sZHN0ZWluIHdyb3RlOgo+ID4gPiA+ID4gT24gRnJpLCBNYXkgMTAsIDIwMTkgYXQg
Nzo0MiBBTSBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IEFkZCBhIHRlc3QgaGVscGVyIHRvIGRvIGEgRklCTUFQIGlvY3RsIHRlc3Qu
IFJlbW92ZSBvbGQgZnMgdHlwZSB3aGl0ZWxpc3QgY29kZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJ
ZiB5b3Ugd291bGRuJ3QgaGF2ZSBqdXN0IGRvbmUgdGhhdCBpdCB3b3VsZCBoYXZlIGJlZW4gZ29v
ZC4KPiA+ID4gPiA+IEJ1dCB5b3VyIHBhdGNoIGFsc28gY2hhbmdlcyBhIGxvdCBvZiB0aGUgbG9n
aWMgYW5kIG91dHB1dCBtZXNzYWdlcywKPiA+ID4gPiA+IHdoaWNoIGlzIGxlc3MgZ29vZC4KPiA+
ID4gPgo+ID4gPiA+IEZpcnN0IG9mIGFsbCwgZG9uJ3QgYmUgbWFkIGlmIHlvdSB0aGluayBJJ20g
Y2hhbmdpbmcgdG9vIG11Y2guIDopCj4gPiA+Cj4gPiA+IE5vdCBtYWQuIFNvcnJ5IGlmIGNhbWUg
b2ZmIHRoaXMgd2F5Li4KPiA+ID4gSnVzdCB0cnlpbmcgdG8gZXhwbGFpbiB3aHkgdG9vIG11Y2gg
Y2hhbmdlcyBjYW4gYmUgY291bnRlciBwcm9kdWN0aXZlLgo+ID4gPiBBbmQgSSBhbSB3cml0aW5n
IG15IG9waW5pb24sIHlvdSBhcmUgbm90IG9ibGlnZWQgdG8gYWdyZWUgd2l0aCBpdCA7LSkKPiA+
Cj4gPiBTdGFydCB5b3VyIGRldmVsb3BlciBlbmdpbmUuIEFjdHVhbGx5IF90aGlua18gYWJvdXQg
d2hhdCB5b3VyJ3JlIHdyaXRpbmcuCj4gPiBZb3VyIG9waW5pb24gdmFyaWVzIGV2ZXJ5IHNpbmds
ZSBwb3N0IGluIHRoaXMgdGhyZWFkLgo+ID4KPiAKPiBJIHNlbnNlIHRoYXQgSSBvZmZlbmRlZCB5
b3UuIEkgZGlkIG5vdCBtZWFuIHRvLiBJIGFwb2xvZ2l6ZS4KPiBUaGVyZSBtaWdodCBoYXZlIGJl
ZW4gc29tZSBtaXNjb21tdW5pY2F0aW9uLgoKTmV2ZXJtaW5kLgoKPiBNeSBvcHRpb24gdmFyaWVk
IGFmdGVyIGluY29ycG9yYXRpbmcgZmVlZGJhY2sgZnJvbSBMaSBXYW5nIGFuZCBsb29raW5nCj4g
Y2xvc2VyIGF0IHJlY2VudCBrZXJuZWwgY2hhbmdlcyB0byBidHJmcywgd2hpY2ggSSB3YXMgbm90
IGF3YXJlIG9mLgo+IAo+IFRvIGJlIGNsZWFyLCBteSBjdXJyZW50IG9waW5pb24gaXM6Cj4gLSBB
cyBMaSBzdWdnZXN0ZWQsIGl0IGlzIGJlc3QgdG8gY2hlY2sgZmlsZXN5c3RlbSBzdXBwb3J0IGlu
IHNldHVwKCkKPiB1c2luZyBzd2Fwb24oKQo+ICAgYW5kIHRoZSByZXN0IG9mIHRoZSB0ZXN0IHNo
b3VsZCBub3QgcmVsYXggYW55IGZhaWx1cmUKPiAtIEJ5IGNoZWNraW5nIEZJQk1BUCBiZWZvcmUg
c3dhcG9uKCkgaW4gc2V0dXAoKSB5b3UgY2FuIGRpZmZlcmVudGlhdGUgYmV0d2Vlbgo+ICAgZmFp
bGluZyB0aGUgdGVzdCAoZm9yIGxlZ2FjeSBmcykgb3IgVENPTkYgKEJUUkZTLCBORlMpCj4gLSBU
Q09ORiByZXN1bHQgc2hvdWxkIGJlIGFjY29tcGFuaWVkIHdpdGggIm5vdCBzdXBwb3J0ZWQiIGxh
bmd1YWdlCj4gLSBUYWtlIGNhcmUgbm90IHRvIGNoYW5nZSB0ZXN0IGxvZ2ljIGluIGEgd2F5IHRo
YXQgd2lsbCByZWdyZXNzIHRlc3Qgb24gb2xkZXIKPiAgIGtlcm5lbHMgb3Igc29tZSBmaWxlc3lz
dGVtCgpDcnlzdGFsIGNsZWFyIG5vdyBhbmQgSSBhZ3JlZS4KCj4gCj4gWy4uLl0KPiA+ID4gUHV0
IHlvdXIgdGVzdGVyIGhhdCBvbi4gSW1hZ2luZSB5b3UgZG8gbm90IGtub3cgd2hhdCBzd2FwZmls
ZSBpcyBub3IKPiA+ID4gdGhhdCBmaWxlc3lzdGVtcyBtYXkgc3VwcG9ydCBpdCBvciBub3QuCj4g
PiA+IFdoaWNoIGlzIHRoZSBmb2xsb3dpbmcgbWVzc2FnZXMgY29udmV5IHRoZSB0ZXN0IHJlc3Vs
dCBiZXR0ZXI6Cj4gPiA+Cj4gPiA+IFRDT05GOiBGYWlsZWQgdG8gbWFrZSBzd2FwZmlsZQo+ID4g
Pgo+ID4gPiBPUgo+ID4gPgo+ID4gPiBUQ09ORjogbWtzd2FwIG5vdCBzdXBwb3J0ZWQgb24gYnRy
ZnMgZmlsZXN5c3RlbQo+ID4KPiA+IFlvdSBhcmUgcmFudGluZyBhdCB3cm9uZyBndXkuIEl0IHdh
cyBub3QgbWUgd3JpdGluZyB0aGlzIG1lc3NhZ2UuCj4gPgo+IAo+IENlcnRhaW5seS4gSXQgd2Fz
bid0IG15IGludGVudGlvbiB0byBibGFtZSB5b3UgZm9yIGFueXRoaW5nLgo+IFRoZSBkZXZlbG9w
ZXIgdGhhdCB3cm90ZSB0aGlzIG1lc3NhZ2UgZGlkIG5vdCBleHBlY3QgdG1wZnMgdG8gcmVhY2gg
dGhpcwo+IHBvaW50LCBiZWNhdXNlIGJsYWNrbGlzdCB3YXMgaW4gcGxhY2UuCj4gQnkgY2hhbmdp
bmcgZnJvbSBUQlJPSyB0byBUQ09ORiwgdGhlIG1lc3NhZ2UgbWF5IG5lZWQgdG8gY2hhbmdlCj4g
ZnJvbSBhIGxhbmd1YWdlIG9mICJGYWlsZWQiIHRvIGEgbGFuZ3VhZ2Ugb2YgIm5vdCBzdXBwb3J0
ZWQiLgoKRmFyZSBlbm91Z2guCgo+IAo+ID4gPgo+ID4gPiBJZiB0ZXN0IHNldHVwIGFycml2ZXMg
dG8gYSBjb25jbHVzaW9uIHRoYXQgZmlsZXN5c3RlbSBkb2Vzbid0IHN1cHBvcnQgdGVzdAo+ID4g
PiBhbmQgdGVzdCBzaG91bGQgYmUgc2tpcHBlZCwgdGhhdCBpcyB3aGF0IHNob3VsZCBiZSBjb21t
dW5pY2F0ZWQgdG8gdXNlci4KPiA+ID4KPiA+ID4gVGhlIEJUUkZTX01BR0lDIGNvZGUgdGhhdCB5
b3VyIHBhdGNoIHJlbW92ZXMgZG9lcyB0aGF0IGNvcnJlY3RseS4KPiA+ID4gWW91ciBwYXRjaCBk
b2VzIG5vdC4KPiA+ID4KPiA+ID4gRXZlbiB0aGUgbWVzc2FnZToKPiA+ID4gVENPTkY6ICJXaWxs
IG5vdCByZXBvcnQgRkFJTCBhcyBGSUJNQVAgaW9jdGwgbm90IHN1cHBvcnRlZCIKPiA+ID4gaXMg
InRvbyBtdWNoIGluZm9ybWF0aW9uIiBJTU8uCj4gPiA+IFVzZXJzIHdpdGhvdXQgcHJvcGVyIGJh
Y2tncm91bmQgd29uJ3Qga25vdyB3aGF0IGl0IG1lYW5zLgo+ID4gPiBUaGlzIHdvdWxkIGhhdmUg
YmVlbiBiZXR0ZXIgSU1POgo+ID4gPiBUQ09ORjogIkZJQk1BUCBpb2N0bCBub3Qgc3VwcG9ydGVk
IG9uIFhYWCBmaWxlc3lzdGVtIgo+ID4KPiA+IEkgZ3Vlc3MgTFRQIGlzIG5vdCBhIGRlc2t0b3Ag
YXBwIDopLCBidXQgeWVzIHRoZXNlIG1lc3NhZ2VzIG5lZWQgaW1wcm92ZW1lbnQuCj4gPgo+IAo+
IFRlc3QgZW5naW5lZXJzIGNhbiBzcGVuZCBhIGxvdCBvZiB0aW1lIGZpZ3VyaW5nIG91dCB3aHkg
YSBjZXJ0YWluIHRlc3QKPiAob2YgYSBmZWF0dXJlIHRoZXkKPiBhcmUgbm90IGludGltYXRlbHkg
ZmFtaWxpYXIgd2l0aCkgaGFzIHN0YXJ0ZWQgZmFpbGluZyBvbiBhIGNlcnRhaW4KPiBrZXJuZWwg
dmVyc2lvbiBvciBhZnRlcgo+IGdldHRpbmcgbGF0ZXN0IExUUC4KPiBXZSBzaG91bGQgYmUgc3lt
cGF0aGV0aWMgdG8gb3VyIGVuZCB1c2VycyBhbmQgdHJ5IHRvIG1ha2UgdGhlaXIgbGl2ZXMKPiBl
YXNpZXIgaWYgaXQgaXMKPiBpbiBvdXIgcG93ZXIuCgpDYW4ndCBhZ3JlZSBtb3JlLiA6KQoKVGhh
bmtzLApNCgo+IAo+IFRoYW5rcywKPiBBbWlyLgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
