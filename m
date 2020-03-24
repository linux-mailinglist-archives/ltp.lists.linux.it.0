Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 855BF190DD9
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 13:42:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C72873C4D2F
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 13:42:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id CCA933C0431
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 13:42:42 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id EEE181401153
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 13:42:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585053760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IX+Nz+MNQtPX04L2tuoWum1Q05QumdhIxM/Q00/W7bk=;
 b=S1p8mKJn2yf2bCn7MWN/vVkzPl6b76QRB9wMHGsvot9oZ28UM8shzdoELQSBSs2O6Vb4si
 g2LyPt2J5YzN495CSAgqsbUbcutBzFmOscA8IjGryx14b9XgtmyHkaRbLFkDerQJQEblOv
 838O5lcp0e9piRB8U8h0NjCwp4QfmBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-k41eMl4xOhaQCvJsG31YlQ-1; Tue, 24 Mar 2020 08:42:37 -0400
X-MC-Unique: k41eMl4xOhaQCvJsG31YlQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B7A800D54;
 Tue, 24 Mar 2020 12:42:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F358BBBBCE;
 Tue, 24 Mar 2020 12:42:35 +0000 (UTC)
Received: from zmail19.collab.prod.int.phx2.redhat.com
 (zmail19.collab.prod.int.phx2.redhat.com [10.5.83.22])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E207286FF7;
 Tue, 24 Mar 2020 12:42:35 +0000 (UTC)
Date: Tue, 24 Mar 2020 08:42:35 -0400 (EDT)
From: Veronika Kabatova <vkabatov@redhat.com>
To: Greg KH <greg@kroah.com>
Message-ID: <290791291.15199861.1585053755727.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200324114727.GA2333047@kroah.com>
References: <cki.936A32626F.M0L95JS69X@redhat.com>
 <20200324062213.GA1961100@kroah.com>
 <970614328.15180583.1585048327050.JavaMail.zimbra@redhat.com>
 <20200324111819.GA2234211@kroah.com>
 <1768018191.15186361.1585050272846.JavaMail.zimbra@redhat.com>
 <20200324114727.GA2333047@kroah.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.195.245, 10.4.195.29]
Thread-Topic: ? PANICKED: Test report?for?kernel 5.5.12-rc1-8b841eb.cki
 (stable)
Thread-Index: qdNWa0HLE9U5eSKYBaowC67tjwEF0w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?b?8J+SpSBQQU5JQ0tFRDogVGVzdAlyZXBvcnQ/Zm9yP2tlcm5l?=
 =?utf-8?q?l_5=2E5=2E12-rc1-8b841eb=2Ecki_=28stable=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gRnJvbTogIkdyZWcgS0giIDxncmVnQGty
b2FoLmNvbT4KPiBUbzogIlZlcm9uaWthIEthYmF0b3ZhIiA8dmthYmF0b3ZAcmVkaGF0LmNvbT4K
PiBDYzogIk1lbW9yeSBNYW5hZ2VtZW50IiA8bW0tcWVAcmVkaGF0LmNvbT4sICJPbmRyZWogTW9z
bmFjZWsiIDxvbW9zbmFjZUByZWRoYXQuY29tPiwgIkxpbnV4IFN0YWJsZSBtYWlsbGlzdCIKPiA8
c3RhYmxlQHZnZXIua2VybmVsLm9yZz4sICJDS0kgUHJvamVjdCIgPGNraS1wcm9qZWN0QHJlZGhh
dC5jb20+LCAiSmFuIFN0YW5jZWsiIDxqc3RhbmNla0ByZWRoYXQuY29tPiwgIkxUUCBNYWlsaW5n
Cj4gTGlzdCIgPGx0cEBsaXN0cy5saW51eC5pdD4KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAyNCwg
MjAyMCAxMjo0NzoyNyBQTQo+IFN1YmplY3Q6IFJlOiDwn5KlIFBBTklDS0VEOiBUZXN0CXJlcG9y
dD9mb3I/a2VybmVsIDUuNS4xMi1yYzEtOGI4NDFlYi5ja2kgKHN0YWJsZSkKPiAKPiBPbiBUdWUs
IE1hciAyNCwgMjAyMCBhdCAwNzo0NDozMkFNIC0wNDAwLCBWZXJvbmlrYSBLYWJhdG92YSB3cm90
ZToKPiA+IAo+ID4gCj4gPiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiA+IEZyb206
ICJHcmVnIEtIIiA8Z3JlZ0Brcm9haC5jb20+Cj4gPiA+IFRvOiAiVmVyb25pa2EgS2FiYXRvdmEi
IDx2a2FiYXRvdkByZWRoYXQuY29tPgo+ID4gPiBDYzogIk1lbW9yeSBNYW5hZ2VtZW50IiA8bW0t
cWVAcmVkaGF0LmNvbT4sICJPbmRyZWogTW9zbmFjZWsiCj4gPiA+IDxvbW9zbmFjZUByZWRoYXQu
Y29tPiwgIkxpbnV4IFN0YWJsZSBtYWlsbGlzdCIKPiA+ID4gPHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc+LCAiQ0tJIFByb2plY3QiIDxja2ktcHJvamVjdEByZWRoYXQuY29tPiwgIkphbgo+ID4gPiBT
dGFuY2VrIiA8anN0YW5jZWtAcmVkaGF0LmNvbT4sICJMVFAgTWFpbGluZwo+ID4gPiBMaXN0IiA8
bHRwQGxpc3RzLmxpbnV4Lml0Pgo+ID4gPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAyNCwgMjAyMCAx
MjoxODoxOSBQTQo+ID4gPiBTdWJqZWN0OiBSZTog8J+SpSBQQU5JQ0tFRDogVGVzdCByZXBvcnQJ
Zm9yP2tlcm5lbCA1LjUuMTItcmMxLThiODQxZWIuY2tpCj4gPiA+IChzdGFibGUpCj4gPiA+IAo+
ID4gPiBPbiBUdWUsIE1hciAyNCwgMjAyMCBhdCAwNzoxMjowN0FNIC0wNDAwLCBWZXJvbmlrYSBL
YWJhdG92YSB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiAtLS0tLSBPcmlnaW5hbCBN
ZXNzYWdlIC0tLS0tCj4gPiA+ID4gPiBGcm9tOiAiR3JlZyBLSCIgPGdyZWdAa3JvYWguY29tPgo+
ID4gPiA+ID4gVG86ICJDS0kgUHJvamVjdCIgPGNraS1wcm9qZWN0QHJlZGhhdC5jb20+Cj4gPiA+
ID4gPiBDYzogIk1lbW9yeSBNYW5hZ2VtZW50IiA8bW0tcWVAcmVkaGF0LmNvbT4sICJPbmRyZWog
TW9zbmFjZWsiCj4gPiA+ID4gPiA8b21vc25hY2VAcmVkaGF0LmNvbT4sICJMaW51eCBTdGFibGUg
bWFpbGxpc3QiCj4gPiA+ID4gPiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4sICJKYW4gU3RhbmNl
ayIgPGpzdGFuY2VrQHJlZGhhdC5jb20+LCAiTFRQCj4gPiA+ID4gPiBNYWlsaW5nIExpc3QiIDxs
dHBAbGlzdHMubGludXguaXQ+Cj4gPiA+ID4gPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAyNCwgMjAy
MCA3OjIyOjEzIEFNCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTog8J+SpSBQQU5JQ0tFRDogVGVzdCBy
ZXBvcnQgZm9yCWtlcm5lbAo+ID4gPiA+ID4gNS41LjEyLXJjMS04Yjg0MWViLmNraQo+ID4gPiA+
ID4gKHN0YWJsZSkKPiA+ID4gPiA+IAo+ID4gPiA+ID4gT24gVHVlLCBNYXIgMjQsIDIwMjAgYXQg
MDU6NDI6MzhBTSAtMDAwMCwgQ0tJIFByb2plY3Qgd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiBIZWxsbywKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFdlIHJhbiBhdXRvbWF0ZWQgdGVz
dHMgb24gYSByZWNlbnQgY29tbWl0IGZyb20gdGhpcyBrZXJuZWwgdHJlZToKPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ICAgICAgICBLZXJuZWwgcmVwbzoKPiA+ID4gPiA+ID4gICAgICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1z
dGFibGUtcmMuZ2l0Cj4gPiA+ID4gPiA+ICAgICAgICAgICAgIENvbW1pdDogOGI4NDFlYjY5N2Ux
IC0gTGludXggNS41LjEyLXJjMQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhlIHJlc3VsdHMg
b2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxvdy4KPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ICAgICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxv
dykKPiA+ID4gPiA+ID4gICAgICAgICAgICAgIE1lcmdlOiBPSwo+ID4gPiA+ID4gPiAgICAgICAg
ICAgIENvbXBpbGU6IE9LCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICBUZXN0czogUEFOSUNLRUQK
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEFsbCBrZXJuZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxl
cywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IKPiA+ID4gPiA+ID4gZG93bmxvYWQKPiA+ID4g
PiA+ID4gaGVyZToKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ICAgaHR0cHM6Ly9ja2ktYXJ0aWZh
Y3RzLnMzLnVzLWVhc3QtMi5hbWF6b25hd3MuY29tL2luZGV4Lmh0bWw/cHJlZml4PWRhdGF3YXJl
aG91c2UvMjAyMC8wMy8yMy81MDIwMzkKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IE9uZSBvciBt
b3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAgICAgcHBj
NjRsZToKPiA+ID4gPiA+ID4gICAgICDwn5KlIHhmc3Rlc3RzIC0gZXh0NAo+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gICAgIGFhcmNoNjQ6Cj4gPiA+ID4gPiA+ICAgICAg4p2MIExUUAo+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gICAgIHg4Nl82NDoKPiA+ID4gPiA+ID4gICAgICDwn5KlIHhmc3Rl
c3RzIC0gZXh0NAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBPaywgaXQncyB0aW1lIEkgc3RhcnQganVz
dCBibGFja2xpc3RpbmcgdGhpcyByZXBvcnQgYWdhaW4sIGl0J3Mgbm90Cj4gPiA+ID4gPiBiZWlu
ZyBoZWxwZnVsIGluIGFueSB3YXkgOigKPiA+ID4gPiA+IAo+ID4gPiA+ID4gUmVtZW1iZXIsIGlm
IHNvbWV0aGluZyBzdGFydHMgYnJlYWtpbmcsIEkgbmVlZCBzb21lIHdheSB0byBmaW5kIG91dAo+
ID4gPiA+ID4gd2hhdAo+ID4gPiA+ID4gY2F1c2VkIGl0IHRvIGJyZWFrLi4uCj4gPiA+ID4gPiAK
PiA+ID4gPiAKPiA+ID4gPiBIaSBHcmVnLAo+ID4gPiA+IAo+ID4gPiA+IGRvIHlvdSBoYXZlIGFu
eSBzcGVjaWZpYyBzdWdnZXN0aW9ucyBhYm91dCB3aGF0IHRvIGluY2x1ZGUgdG8gaGVscCB5b3UK
PiA+ID4gPiBvdXQ/Cj4gPiA+ID4gVGhlIGxpbmtlZCBjb25zb2xlIGxvZ3MgY29udGFpbiBjYWxs
IHRyYWNlcyBmb3IgdGhlIHBhbmljcyBbMF0uIElzCj4gPiA+ID4gdGhlcmUKPiA+ID4gPiBhbnl0
aGluZyBlbHNlIHRoYXQgd291bGQgaGVscCB5b3Ugd2l0aCBkZWJ1Z2dpbmcgdGhvc2U/IFdlJ3Jl
IHBsYW5uaW5nCj4gPiA+ID4gb24KPiA+ID4gPiByZWxlYXNpbmcgY29yZSBkdW1wcywgd291bGQg
dGhvc2UgYmUgaGVscGZ1bD8KPiA+ID4gCj4gPiA+IEJpc2VjdGlvbiB0byBmaW5kIHRoZSBvZmZl
bmRpbmcgY29tbWl0IHdvdWxkIGJlIGJlc3QuCj4gPiA+IAo+ID4gCj4gPiBUaGlzIGlzIGdvaW5n
IHRvIGJlIHJlYWxseSB0cmlja3kgZm9yIGhhcmQgdG8gcmVwcm9kdWNlIGJ1Z3MgYnV0IHdlJ2xs
IGRvCj4gPiBzb21lIHJlc2VhcmNoIG9uIGl0LCB0aGFua3MhCj4gCj4gSSBnb3QgYWJvdXQgOCAi
ZmFpbGVkIiBlbWFpbHMgdG9kYXksIGl0IGRvZXNuJ3Qgc291bmQgbGlrZSBpdCBpcyBoYXJkIHRv
Cj4gcmVwcm9kdWNlLgoKSSBtZWFudCBpbiBnZW5lcmFsLCBhcyB3ZSBkbyBjYXRjaCBhIGJ1bmNo
IG9mIHN1Y2ggcHJvYmxlbXMuIFRob3NlIHVzdWFsbHkKcmVxdWlyZSBzb21lIGlucHV0IGFuZCB0
ZXN0aW5nIGZyb20gcGVvcGxlIHdobyB1bmRlcnN0YW5kIHRoZSBzdWJzeXN0ZW0gdG8KY3JlYXRl
IGEgcmVsaWFibGUgcmVwcm9kdWNlci4KCkZvciB0aGlzIHBhcnRpY3VsYXIgZmFpbHVyZSwgZG8g
eW91IHdhbnQgdG8gdHJ5IG91dCB0aGUgcGF0Y2hlcyBJIGxpbmtlZAppbiB0aGUgZmlyc3QgZW1h
aWwgb3Igc2hvdWxkIHdlIHdhaXZlIHRoZW0gZm9yIG5vdz8KCj4gCj4gQW5kIGlmIHlvdSBjYW4n
dCByZXByb2R1Y2UgaXQsIHdoeSB3b3VsZCB5b3UgZXhwZWN0IG1lIHRvIGtub3cgd2hhdCBpcwo+
IGdvaW5nIG9uPyAgOikKPiAKCldlbGwgeW91IGRvIGtub3cgdGhlIGtlcm5lbCBwcmV0dHkgd2Vs
bCA6KSBXZSBhbHNvIGNjIHRoZSB0ZXN0IG1haW50YWluZXJzCnRvIGhlbHAgb3V0IGlmIGl0J3Mg
bmVlZGVkIHNpbmNlIHRoZXkgdW5kZXJzdGFuZCB0aGUgZmFpbGVkIGFyZWEsIHRob3VnaApnaXZl
biB0aGUgY3VycmVudCBzaXR1YXRpb24gYXJvdW5kIHRoZSB3b3JsZCBwZW9wbGUncyByZWFjdGlv
bnMgbWlnaHQKdW5kZXJzdGFuZGFibHkgYmUgc2xvd2VyLgoKClZlcm9uaWthCgo+IHRoYW5rcywK
PiAKPiBncmVnIGstaAo+IAo+IAo+IAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
