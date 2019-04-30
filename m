Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A86F2E4
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 11:29:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 721EE3EACBF
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 11:29:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 629753EAC9C
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 11:29:44 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4D0481000B08
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 11:29:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 09E30307D963
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 09:29:42 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7491E6F540;
 Tue, 30 Apr 2019 09:29:39 +0000 (UTC)
Date: Tue, 30 Apr 2019 17:29:37 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190430092937.qzmxyainlz6r3mnp@XZHOUW.usersys.redhat.com>
References: <20190430071446.13716-1-xzhou@redhat.com>
 <CAEemH2c0FYg+WoCJfzWmaUiANE3pcpdXT2fHVGXsL_qnRJUn+A@mail.gmail.com>
 <20190430083056.b6q2p6yzqbp2q6fm@XZHOUW.usersys.redhat.com>
 <CAEemH2d-xLCFayr8uCycdYZCtwg1YRHJcpXjdzRCi6zJ6_rMPw@mail.gmail.com>
 <20190430090846.s2ctvbipxgs6nprr@XZHOUW.usersys.redhat.com>
 <CAEemH2dvDqWq7XMS_dNkuKkE31FejY59H+cvX37R8xCeo0uD3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dvDqWq7XMS_dNkuKkE31FejY59H+cvX37R8xCeo0uD3Q@mail.gmail.com>
User-Agent: NeoMutt/20180716-1400-f2a658
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 30 Apr 2019 09:29:42 +0000 (UTC)
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

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDU6MjE6MzRQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
PiBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCA1OjA4IFBNIE11cnBoeSBaaG91IDx4emhvdUByZWRo
YXQuY29tPiB3cm90ZToKPiAKPiA+IC4uLgo+ID4gPiA+ID4gPiArICAgICAgIGlmIChmc190eXBl
ID09IFRTVF9PVkVSTEFZRlNfTUFHSUMgJiYgZXJybm8gPT0gRUlOVkFMKSB7Cj4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICB0c3RfcmVzbShUQ09ORiwgIlN3YXBmaWxlIG9uIG92ZXJsYXlmcyBu
b3QKPiA+ID4gPiBpbXBsZW1ldGVkIik7Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybjsKPiA+ID4gPiA+ID4gKyAgICAgICB9Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gVGhlIGNvZGUgbG9va3MgY29ycmVjdC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBCdXQg
aXQgYWxyZWFkeSBoYXMgYSB0ZXN0IHNraXBwaW5nIGZvciBCVFJGUywgaXMgdGhlcmUgYW55Cj4g
PiBwb3NzaWJpbGl0eSB0bwo+ID4gPiA+ID4gY29tYmluZSB0aGVzZSBmaWxlc3lzdGVtcyBjaGVj
ayB0b2dldGhlcj8KPiA+ID4gPgo+ID4gPiA+IEdvb2QgaWRlYX4gIFNlbmRpbmcgVjIuCj4gPiA+
ID4KPiA+ID4KPiA+ID4gT25lIG1vcmUgY29tbWVudC4KPiA+ID4KPiA+ID4gSSBqdXN0IG5vdGlj
ZWQgdGhhdCBpdCBhbHNvIGhhcyBhbiBGUyBza2lwcGluZyBsaXN0IGluIHNldHVwKCksIGRvIHUK
PiA+IHRoaW5rCj4gPiA+IGNhbiB3ZSBtb3ZlIEJUUkZTIGFuZCBPVkVSTEFZRlMgdG8gdGhlcmU/
Cj4gPgo+ID4gR3JlYXQhIFRoYXQgbWFrZXMgcGVyZmVjdCBzZW5zZS4gQWxzbyBJJ20gdGhpbmtp
bmcgYSBmZXcgb3RoZXIgdHdlYWtzCj4gPiBuZWVkZWQ6Cj4gPgo+ID4gICBORlMgbm93IGFjdHVh
bGx5IHN1cHBvcnQgc3dhcGZpbGVzLiBMZXQncyByZW1vdmUgaXQgZnJvbSBza2lwIGxpc3Q7Cj4g
Pgo+IAo+IEJ1dCBBRkFJSyBzb21lb25lIHN0aWxsIHJ1biBMVFAgb24gb2xkIGRpc3Ryby9rZXJu
ZWwsIHNvIHdlIGNhbid0IGd1YXJhbnRlZQo+IHRoZSB0ZXN0IHdvcmtzIGZpbmUgaW4gdGhhdCBz
aXR1YXRpb24uIFNvLCBteSBvcGluaW9uIGlzIHRvIHJlc2VydmUgdGhlCj4gTkZTLCBvciBkbyB5
b3UgaGF2ZSBhIGJldHRlciB3YXkgdG8gbWFrZSB0ZXN0IG1vcmUgZmxleGlibGU/CgpGYWlyIGVu
b3VnaC4gV2UgY2FuIHJlc2VydmUgTkZTIG9uIHRoZSBza2lwIGxpc3QgdG8gYXZvaWQgbXVjaCBm
YWxzZSBhbGFybXMuCj4gCj4gCj4gPiAgIFNraXAgYWxsIHN3YXBvbi9zd2Fwb2ZmIHRlc3RzIG9u
IFRNUEZTIEJUUkZTIE9WRVJMQVlGUzsKPiA+ICAgQWRkIENJRlNfTUFHSUMsIHRoZW4gc2tpcCBv
biBpdCB0b287Cj4gPiAgIFJlbW92ZSBleGlzdGluZyBCVFJGUyByZXR1cm4gdmFsdWUgdHdlYWtz
Lgo+ID4KPiAKPiBBZ3JlZS4KClRoYW5rcyEKCk0KPiAKPiAtLSAKPiBSZWdhcmRzLAo+IExpIFdh
bmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
