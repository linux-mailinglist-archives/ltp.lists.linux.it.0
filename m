Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF1EE577
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 18:03:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED6683C255E
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 18:03:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BC3933C2433
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 18:03:06 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id F03876008B5
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 18:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572886983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYvQdBFtAql7wjQ/NHJHVT6A7DR8AMu7gQlsuOtUl1w=;
 b=OdOvUMWRZEU+txaieS2IFbOYBCP0cWIctLUtFrOFtduQWeheFLmLAbz8eqjbDsBIAYpAcy
 cNeekNQ+o9RH214VSUFo6KKPuvSM9HM9YXAympMCSxZhStJrHjnsuNi0YNiKiBlNrkNsma
 TOfhDaeM/5eKaL7cIMG8VteUhtUi9y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-3544PBzdMfCfkWwvvI8HNw-1; Mon, 04 Nov 2019 12:02:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF22E107ACC2;
 Mon,  4 Nov 2019 17:02:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E131A600C6;
 Mon,  4 Nov 2019 17:02:54 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 224BF18095FF;
 Mon,  4 Nov 2019 17:02:54 +0000 (UTC)
Date: Mon, 4 Nov 2019 12:02:53 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <1766459302.10389172.1572886973921.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191104163033.GB2253150@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
 <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
 <20191104145947.GA2211991@kroah.com>
 <251943262.10356408.1572881121044.JavaMail.zimbra@redhat.com>
 <20191104163033.GB2253150@kroah.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.19]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.3.9-rc1-dfe283e.cki (stable)
Thread-Index: efHF9Qv+rDzWei/mHs7JnJR0U0OTsg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 3544PBzdMfCfkWwvvI8HNw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E3?=
 =?utf-8?q?=2E9-rc1-dfe283e=2Ecki_=28stable=29?=
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
Cc: alsa-devel@alsa-project.org, Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 Jaroslav Kysela <jkysela@redhat.com>, CKI Project <cki-project@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBhdCAx
MDoyNToyMUFNIC0wNTAwLCBKYW4gU3RhbmNlayB3cm90ZToKPiA+IAo+ID4gLS0tLS0gT3JpZ2lu
YWwgTWVzc2FnZSAtLS0tLQo+ID4gPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBhdCAwOToyODoxMEFN
IC0wNTAwLCBKYW4gU3RhbmNlayB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiAtLS0t
LSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiA+ID4gPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBh
dCAwODozNTo1MUFNIC0wNTAwLCBKYW4gU3RhbmNlayB3cm90ZToKPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiA+ID4g
PiA+ID4gCj4gPiA+ID4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4g
V2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5l
bCB0cmVlOgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ICAgICAgICBLZXJuZWwgcmVwbzoK
PiA+ID4gPiA+ID4gPiAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0Cj4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgQ29tbWl0OiBkZmUyODNlOWZkYWMgLSBMaW51eCA1LjMuOS1yYzEKPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiBUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJl
IHByb3ZpZGVkIGJlbG93Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ICAgICBPdmVyYWxs
IHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiA+ID4gPiA+ID4gPiAgICAgICAg
ICAgICAgTWVyZ2U6IE9LCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICBDb21waWxlOiBPSwo+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAgICBUZXN0czogRkFJTEVECj4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQgbG9ncyBhcmUg
YXZhaWxhYmxlIGZvcgo+ID4gPiA+ID4gPiA+IGRvd25sb2FkCj4gPiA+ID4gPiA+ID4gaGVyZToK
PiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAgIGh0dHBzOi8vYXJ0aWZhY3RzLmNraS1wcm9q
ZWN0Lm9yZy9waXBlbGluZXMvMjYyMzgwCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gT25l
IG9yIG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
PiAgICAgeDg2XzY0Ogo+ID4gPiA+ID4gPiA+ICAgICAg4p2MIExUUCBsaXRlCj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IE5vdCBhIDUuMyAtc3RhYmxlIHJlZ3Jlc3Npb24u
Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBGYWlsdXJlIGNvbWVzIGZyb20gdGVzdCB0aGF0IHNh
bml0eSBjaGVja3MgYWxsIC9wcm9jIGZpbGVzIGJ5IGRvaW5nCj4gPiA+ID4gPiA+IDFrIHJlYWQg
ZnJvbSBlYWNoLiBUaGVyZSBhcmUgY291cGxlIGlzc3VlcyBpdCBoaXRzIHdydC4gc25kX2hkYV8q
Lgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gRXhhbXBsZSByZXByb2R1Y2VyOgo+ID4gPiA+ID4g
PiAgIGRkIGlmPS9zeXMva2VybmVsL2RlYnVnL3JlZ21hcC9oZGF1ZGlvQzBEMy1oZGF1ZGlvL2Fj
Y2Vzcwo+ID4gPiA+ID4gPiAgIG9mPW91dC50eHQKPiA+ID4gPiA+ID4gICBjb3VudD0xIGJzPTEw
MjQgaWZsYWc9bm9uYmxvY2sKPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhhdCdzIG5vdCBhIHByb2Mg
ZmlsZSA6KQo+ID4gPiA+IAo+ID4gPiA+IFJpZ2h0LiBJdCdzIHNhbWUgdGVzdCB0aGF0J3MgdXNl
ZCBmb3IgL3Byb2MgdG9vLgo+ID4gPiA+IAo+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEl0J3Mgc2xv
dyBhbmQgdHJpZ2dlcnMgc29mdCBsb2NrdXBzIFsxXS4gQW5kIGl0IGFsc28gcmVxdWlyZXMgbG90
Cj4gPiA+ID4gPiA+IG9mIG1lbW9yeSwgdHJpZ2dlcmluZyBPT01zIG9uIHNtYWxsZXIgVk1zOgo+
ID4gPiA+ID4gPiAweDAwMDAwMDAwMjRmMDQzN2ItMHgwMDAwMDAwMDFhMzJiMWM4IDEwNzM3NDU5
MjAKPiA+ID4gPiA+ID4gc2VxX3JlYWQrMHgxMzEvMHg0MDAKPiA+ID4gPiA+ID4gcGFnZXM9MjYy
MTQ0IHZtYWxsb2MgdnBhZ2VzIE4wPTI2MjE0NAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSSdt
IGxlYW5pbmcgdG93YXJkcyBza2lwcGluZyBhbGwgcmVnbWFwIGVudHJpZXMgaW4gdGhpcyB0ZXN0
Lgo+ID4gPiA+ID4gPiBDb21tZW50cyBhcmUgd2VsY29tZWQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IFJhbmRvbWx5IHBva2luZyBhcm91bmQgaW4gZGVidWdmcyBpcyBhIHN1cmUgd2F5IHRvIGNhdXNl
IGNyYXNoZXMgYW5kCj4gPiA+ID4gPiBtYWpvciBwcm9ibGVtcy4gIEFsc28sIGRlYnVnZnMgZmls
ZXMgYXJlIE5PVCBzdGFibGUgYW5kIG9ubHkgZm9yCj4gPiA+ID4gPiBkZWJ1Z2dpbmcgYW5kIHNo
b3VsZCBuZXZlciBiZSBlbmFibGVkIG9uICJyZWFsIiBzeXN0ZW1zLgo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBTbyB3aGF0IGV4YWN0bHkgaXMgdGhlIHRlc3QgdHJ5aW5nIHRvIGRvIGhlcmU/Cj4gPiA+
ID4gCj4gPiA+ID4gSXQncyAodW5wcml2aWxlZ2VkKSB1c2VyIHRyeWluZyB0byBvcGVuL3JlYWQg
YW55dGhpbmcgaXQgY2FuICgvcHJvYywKPiA+ID4gPiAvc3lzKQo+ID4gPiA+IHRvIHNlZSBpZiB0
aGF0IHRyaWdnZXJzIGFueXRoaW5nIGJhZC4KPiA+ID4gPiAKPiA+ID4gPiBJdCBjYW4gcnVuIGFz
IHByaXZpbGVnZWQgdXNlciB0b28sIHdoaWNoIHdhcyB0aGUgY2FzZSBhYm92ZS4KPiA+ID4gCj4g
PiA+IFN1cmUsIHlvdSBjYW4gZG8gdG9ucyBvZiBiYWQgdGhpbmdzIGFzIHJvb3QgcG9raW5nIGFy
b3VuZCBpbiBzeXNmcywKPiA+ID4gZGVidWdmcywgYW5kIHByb2Nmcy4gIFdoYXQgZXhhY3RseSBh
cmUgeW91IHRyeWluZyB0byBkbywgYnJlYWsgdGhlCj4gPiA+IHN5c3RlbT8KPiA+IAo+ID4gV2Ug
YXJlIHRhbGtpbmcgYWJvdXQgcmVhZC1vbmx5IGhlcmUuIElzIGl0IHVucmVhc29uYWJsZSB0byBl
eHBlY3QKPiA+IHRoYXQgcm9vdCBjYW4gcmVhZCBhbGwgL3Byb2MgZW50cmllcyB3aXRob3V0IGNy
YXNoaW5nIHRoZSBzeXN0ZW0/Cj4gCj4gWW91IGFyZSBOT1QgcmVhZGluZyAvcHJvYy8gaGVyZS4K
Ck5vLiBUaGF0IHdhcyBhIGdlbmVyYWwgcXVlc3Rpb24gdG8gdXNlZnVsbmVzcyBvZiBwcml2aWxl
Z2VkIHJlYWQsCnVzaW5nIC9wcm9jIGFzIGV4YW1wbGUgd2hlcmUgaXQgY29tbW9ubHkgaGFwcGVu
cy4KCj4gWW91IGFyZSByZWFkaW5nIGRlYnVnZnMgd2hpY2ggeW91Cj4gcmVhbGx5IGhhdmUgTk9U
IGlkZWEgd2hhdCBpcyBpbiB0aGVyZS4gIEFzIHlvdSBzYXcsIHlvdSBhcmUgcmVhZGluZyBmcm9t
Cj4gaGFyZHdhcmUgdGhhdCBpcyBzbG93IGFuZCBkb2luZyBvZGQgdGhpbmdzIHdoZW4geW91IHJl
YWQgZnJvbSBpdC4KCkFncmVlZCwgSSBhbHJlYWR5IHNlbnQgYSBwYXRjaCB0byBMVFAgdG8gYmxh
Y2tsaXN0IGl0LgoKPiBBbmQgeWVzLCB0aGVyZSBhcmUgc29tZSAvcHJvYy8gZmlsZXMgdGhhdCB5
b3Ugc2hvdWxkIG5vdCByZWFkIGZyb20gYXMKPiByb290IGFuZCBleHBlY3QgdGhpbmdzIHRvIGFs
d2F5cyB3b3JrLiAgUENJIGRldmljZXMgYXJlIG5vdG9yaW91cyBmb3IKPiB0aGlzLCBhbmQgaWYg
eW91IGFyZSByZWFkaW5nIHRob3NlIGZpbGVzIGFzIHJvb3QsIHlvdSAia25vdyIgeW91IGtub3cK
PiB3aGF0IHlvdSBhcmUgZG9pbmcgYW5kIGNhbiBhY2NlcHQgdGhlIHJpc2sgZm9yIHdoZW4gdGhp
bmdzIGdvIHdyb25nLgo+IAo+IEl0IGlzIGZpbmUgdG8gd3JpdGUgdGVzdHMgdG8gcmVhZCBzcGVj
aWZpYyAvcHJvYy8gZmlsZXMgdGhhdCB5b3Uga25vdwo+IHdoYXQgaXMgaGFwcGVuaW5nIGluIHRo
ZW0uICBUbyBwaWNrIHJhbmRvbSBvbmVzIGlzIG5ldmVyIGEgZ29vZCBpZGVhLgoKVGhhbmtzIGZv
ciBleGFtcGxlLiAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
