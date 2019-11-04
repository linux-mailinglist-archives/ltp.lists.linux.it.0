Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A00EE3B8
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 16:25:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 500C03C252F
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 16:25:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 781543C2421
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 16:25:27 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id EA15A600BA2
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 16:25:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572881125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QZRirfuUhsdXG9rrswqF3RwKnBGY5m5ab7OcFpaYpA=;
 b=eaXme6/hLcm8WuNtabftvahgtO8J22WDONriK1YqHvn6DQ1wTTV/VWBWycsyLS2YzEafUA
 FHpSzDp9MdZStkzmIQrUPOklrIN8+0z0KU9wfv6GrCzN1qypTilvo8wPoEuQzTnQ83vawN
 weHZl+8TBNYnvfkdin5TvxiHQNk6QVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-0Ejf54GUMYmPnVTUBPnmdw-1; Mon, 04 Nov 2019 10:25:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CA971800D53;
 Mon,  4 Nov 2019 15:25:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D27A100164D;
 Mon,  4 Nov 2019 15:25:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4193C18095FF;
 Mon,  4 Nov 2019 15:25:21 +0000 (UTC)
Date: Mon, 4 Nov 2019 10:25:21 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <251943262.10356408.1572881121044.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191104145947.GA2211991@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
 <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
 <20191104145947.GA2211991@kroah.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.18]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.3.9-rc1-dfe283e.cki (stable)
Thread-Index: h70YfNCWRy5RPDBYtaoKLKwlyBv/kg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 0Ejf54GUMYmPnVTUBPnmdw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBhdCAw
OToyODoxMEFNIC0wNTAwLCBKYW4gU3RhbmNlayB3cm90ZToKPiA+IAo+ID4gCj4gPiAtLS0tLSBP
cmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiA+IE9uIE1vbiwgTm92IDA0LCAyMDE5IGF0IDA4OjM1
OjUxQU0gLTA1MDAsIEphbiBTdGFuY2VrIHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+
IC0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSGVsbG8s
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFdlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSByZWNlbnQg
Y29tbWl0IGZyb20gdGhpcyBrZXJuZWwgdHJlZToKPiA+ID4gPiA+IAo+ID4gPiA+ID4gICAgICAg
IEtlcm5lbCByZXBvOgo+ID4gPiA+ID4gICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdAo+ID4gPiA+ID4g
ICAgICAgICAgICAgQ29tbWl0OiBkZmUyODNlOWZkYWMgLSBMaW51eCA1LjMuOS1yYzEKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBw
cm92aWRlZCBiZWxvdy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gICAgIE92ZXJhbGwgcmVzdWx0OiBG
QUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQo+ID4gPiA+ID4gICAgICAgICAgICAgIE1lcmdlOiBP
Swo+ID4gPiA+ID4gICAgICAgICAgICBDb21waWxlOiBPSwo+ID4gPiA+ID4gICAgICAgICAgICAg
IFRlc3RzOiBGQUlMRUQKPiA+ID4gPiA+IAo+ID4gPiA+ID4gQWxsIGtlcm5lbCBiaW5hcmllcywg
Y29uZmlnIGZpbGVzLCBhbmQgbG9ncyBhcmUgYXZhaWxhYmxlIGZvcgo+ID4gPiA+ID4gZG93bmxv
YWQKPiA+ID4gPiA+IGhlcmU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ICAgaHR0cHM6Ly9hcnRpZmFj
dHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8yNjIzODAKPiA+ID4gPiA+IAo+ID4gPiA+ID4g
T25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPiA+ID4gPiA+IAo+ID4gPiA+ID4gICAg
IHg4Nl82NDoKPiA+ID4gPiA+ICAgICAg4p2MIExUUCBsaXRlCj4gPiA+ID4gPgo+ID4gPiA+IAo+
ID4gPiA+IE5vdCBhIDUuMyAtc3RhYmxlIHJlZ3Jlc3Npb24uCj4gPiA+ID4gCj4gPiA+ID4gRmFp
bHVyZSBjb21lcyBmcm9tIHRlc3QgdGhhdCBzYW5pdHkgY2hlY2tzIGFsbCAvcHJvYyBmaWxlcyBi
eSBkb2luZwo+ID4gPiA+IDFrIHJlYWQgZnJvbSBlYWNoLiBUaGVyZSBhcmUgY291cGxlIGlzc3Vl
cyBpdCBoaXRzIHdydC4gc25kX2hkYV8qLgo+ID4gPiA+IAo+ID4gPiA+IEV4YW1wbGUgcmVwcm9k
dWNlcjoKPiA+ID4gPiAgIGRkIGlmPS9zeXMva2VybmVsL2RlYnVnL3JlZ21hcC9oZGF1ZGlvQzBE
My1oZGF1ZGlvL2FjY2VzcyBvZj1vdXQudHh0Cj4gPiA+ID4gICBjb3VudD0xIGJzPTEwMjQgaWZs
YWc9bm9uYmxvY2sKPiA+ID4gCj4gPiA+IFRoYXQncyBub3QgYSBwcm9jIGZpbGUgOikKPiA+IAo+
ID4gUmlnaHQuIEl0J3Mgc2FtZSB0ZXN0IHRoYXQncyB1c2VkIGZvciAvcHJvYyB0b28uCj4gPiAK
PiA+ID4gCj4gPiA+ID4gSXQncyBzbG93IGFuZCB0cmlnZ2VycyBzb2Z0IGxvY2t1cHMgWzFdLiBB
bmQgaXQgYWxzbyByZXF1aXJlcyBsb3QKPiA+ID4gPiBvZiBtZW1vcnksIHRyaWdnZXJpbmcgT09N
cyBvbiBzbWFsbGVyIFZNczoKPiA+ID4gPiAweDAwMDAwMDAwMjRmMDQzN2ItMHgwMDAwMDAwMDFh
MzJiMWM4IDEwNzM3NDU5MjAgc2VxX3JlYWQrMHgxMzEvMHg0MDAKPiA+ID4gPiBwYWdlcz0yNjIx
NDQgdm1hbGxvYyB2cGFnZXMgTjA9MjYyMTQ0Cj4gPiA+ID4gCj4gPiA+ID4gSSdtIGxlYW5pbmcg
dG93YXJkcyBza2lwcGluZyBhbGwgcmVnbWFwIGVudHJpZXMgaW4gdGhpcyB0ZXN0Lgo+ID4gPiA+
IENvbW1lbnRzIGFyZSB3ZWxjb21lZC4KPiA+ID4gCj4gPiA+IFJhbmRvbWx5IHBva2luZyBhcm91
bmQgaW4gZGVidWdmcyBpcyBhIHN1cmUgd2F5IHRvIGNhdXNlIGNyYXNoZXMgYW5kCj4gPiA+IG1h
am9yIHByb2JsZW1zLiAgQWxzbywgZGVidWdmcyBmaWxlcyBhcmUgTk9UIHN0YWJsZSBhbmQgb25s
eSBmb3IKPiA+ID4gZGVidWdnaW5nIGFuZCBzaG91bGQgbmV2ZXIgYmUgZW5hYmxlZCBvbiAicmVh
bCIgc3lzdGVtcy4KPiA+ID4gCj4gPiA+IFNvIHdoYXQgZXhhY3RseSBpcyB0aGUgdGVzdCB0cnlp
bmcgdG8gZG8gaGVyZT8KPiA+IAo+ID4gSXQncyAodW5wcml2aWxlZ2VkKSB1c2VyIHRyeWluZyB0
byBvcGVuL3JlYWQgYW55dGhpbmcgaXQgY2FuICgvcHJvYywgL3N5cykKPiA+IHRvIHNlZSBpZiB0
aGF0IHRyaWdnZXJzIGFueXRoaW5nIGJhZC4KPiA+IAo+ID4gSXQgY2FuIHJ1biBhcyBwcml2aWxl
Z2VkIHVzZXIgdG9vLCB3aGljaCB3YXMgdGhlIGNhc2UgYWJvdmUuCj4gCj4gU3VyZSwgeW91IGNh
biBkbyB0b25zIG9mIGJhZCB0aGluZ3MgYXMgcm9vdCBwb2tpbmcgYXJvdW5kIGluIHN5c2ZzLAo+
IGRlYnVnZnMsIGFuZCBwcm9jZnMuICBXaGF0IGV4YWN0bHkgYXJlIHlvdSB0cnlpbmcgdG8gZG8s
IGJyZWFrIHRoZQo+IHN5c3RlbT8KCldlIGFyZSB0YWxraW5nIGFib3V0IHJlYWQtb25seSBoZXJl
LiBJcyBpdCB1bnJlYXNvbmFibGUgdG8gZXhwZWN0CnRoYXQgcm9vdCBjYW4gcmVhZCBhbGwgL3By
b2MgZW50cmllcyB3aXRob3V0IGNyYXNoaW5nIHRoZSBzeXN0ZW0/CgpTb21lIGVudHJpZXMgYXJl
IHJlYWRhYmxlIG9ubHkgYnkgcm9vdC4gU28gYW4gdW5wcml2aWxlZ2VkIHVzZXIKd2lsbCBza2lw
IGNvbnNpZGVyYWJsZSBudW1iZXIgb2YgZW50cmllczoKLXItLS0tLS0tLS4gMSByb290IHJvb3Qg
MCBOb3YgIDQgMTY6MTMgL3Byb2Mvc2xhYmluZm8KCj4gVGhhdCBzb3VuZHMgbGlrZSBhIGhvcnJp
YmxlIHRlc3QgdGhhdCBpcyBqdXN0IHNldHRpbmcgaXRzZWxmIHVwIHRvIGxvY2sKPiB0aGUgc3lz
dGVtIHVwLCB5b3Ugc2hvdWxkIHJldmlzaXQgaXQuLi4KCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
