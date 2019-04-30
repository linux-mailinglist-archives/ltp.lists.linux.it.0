Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF74F275
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 11:08:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 832E23EACAD
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 11:08:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 351633EACA3
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 11:08:53 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3B9931001132
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 11:08:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0770630BC654
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 09:08:51 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CC696C509;
 Tue, 30 Apr 2019 09:08:47 +0000 (UTC)
Date: Tue, 30 Apr 2019 17:08:46 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190430090846.s2ctvbipxgs6nprr@XZHOUW.usersys.redhat.com>
References: <20190430071446.13716-1-xzhou@redhat.com>
 <CAEemH2c0FYg+WoCJfzWmaUiANE3pcpdXT2fHVGXsL_qnRJUn+A@mail.gmail.com>
 <20190430083056.b6q2p6yzqbp2q6fm@XZHOUW.usersys.redhat.com>
 <CAEemH2d-xLCFayr8uCycdYZCtwg1YRHJcpXjdzRCi6zJ6_rMPw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2d-xLCFayr8uCycdYZCtwg1YRHJcpXjdzRCi6zJ6_rMPw@mail.gmail.com>
User-Agent: NeoMutt/20180716-1400-f2a658
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 30 Apr 2019 09:08:51 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/swapon02: Do not fail on overlayfs
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

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDQ6NTQ6MjNQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
PiBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCA0OjMxIFBNIE11cnBoeSBaaG91IDx4emhvdUByZWRo
YXQuY29tPiB3cm90ZToKPiAKPiA+IE9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0IDA0OjE0OjIzUE0g
KzA4MDAsIExpIFdhbmcgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0IDM6MjEg
UE0gTXVycGh5IFpob3UgPHh6aG91QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IEN1
cnJlbnRseSBzd2FwZmlsZXMgb24gT3ZlcmxheWZzIGFyZSBub3Qgc3VwcG9ydGVkLgo+ID4gPiA+
Cj4gPiA+ID4gU28gaWYgd2UgYXJlIG9uIG92ZXJsYXlmcyBhbmQgd2UgZ2V0IEVJTlZBTCBmcm9t
IHN3YXBvbigpIHdlIHJldHVybgo+ID4gVENPTkYuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAg
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYyB8IDUgKysrKysKPiA+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4gPiA+Cj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAyLmMKPiA+
ID4gPiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAyLmMKPiA+ID4g
PiBpbmRleCA0YWY1MTA1YzYuLjIxMWNkZmM0ZSAxMDA2NDQKPiA+ID4gPiAtLS0gYS90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMi5jCj4gPiA+ID4gKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYwo+ID4gPiA+IEBAIC04Niw2ICs4
NiwxMSBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfc3dhcG9uKHN0cnVjdCB0ZXN0X2Nhc2VfdCAqdGVz
dCkKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gPiA+ID4gICAgICAg
ICB9Cj4gPiA+ID4KPiA+ID4gPiArICAgICAgIGlmIChmc190eXBlID09IFRTVF9PVkVSTEFZRlNf
TUFHSUMgJiYgZXJybm8gPT0gRUlOVkFMKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIHRzdF9y
ZXNtKFRDT05GLCAiU3dhcGZpbGUgb24gb3ZlcmxheWZzIG5vdAo+ID4gaW1wbGVtZXRlZCIpOwo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gPiArICAgICAgIH0K
PiA+ID4gPgo+ID4gPgo+ID4gPiBUaGUgY29kZSBsb29rcyBjb3JyZWN0Lgo+ID4gPgo+ID4gPiBC
dXQgaXQgYWxyZWFkeSBoYXMgYSB0ZXN0IHNraXBwaW5nIGZvciBCVFJGUywgaXMgdGhlcmUgYW55
IHBvc3NpYmlsaXR5IHRvCj4gPiA+IGNvbWJpbmUgdGhlc2UgZmlsZXN5c3RlbXMgY2hlY2sgdG9n
ZXRoZXI/Cj4gPgo+ID4gR29vZCBpZGVhfiAgU2VuZGluZyBWMi4KPiA+Cj4gCj4gT25lIG1vcmUg
Y29tbWVudC4KPiAKPiBJIGp1c3Qgbm90aWNlZCB0aGF0IGl0IGFsc28gaGFzIGFuIEZTIHNraXBw
aW5nIGxpc3QgaW4gc2V0dXAoKSwgZG8gdSB0aGluawo+IGNhbiB3ZSBtb3ZlIEJUUkZTIGFuZCBP
VkVSTEFZRlMgdG8gdGhlcmU/CgpHcmVhdCEgVGhhdCBtYWtlcyBwZXJmZWN0IHNlbnNlLiBBbHNv
IEknbSB0aGlua2luZyBhIGZldyBvdGhlciB0d2Vha3MKbmVlZGVkOgoKICBORlMgbm93IGFjdHVh
bGx5IHN1cHBvcnQgc3dhcGZpbGVzLiBMZXQncyByZW1vdmUgaXQgZnJvbSBza2lwIGxpc3Q7CiAg
U2tpcCBhbGwgc3dhcG9uL3N3YXBvZmYgdGVzdHMgb24gVE1QRlMgQlRSRlMgT1ZFUkxBWUZTOwog
IEFkZCBDSUZTX01BR0lDLCB0aGVuIHNraXAgb24gaXQgdG9vOwogIFJlbW92ZSBleGlzdGluZyBC
VFJGUyByZXR1cm4gdmFsdWUgdHdlYWtzLgoKVGhhbmtzLApNCgo+IAo+IC0tIAo+IFJlZ2FyZHMs
Cj4gTGkgV2FuZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
