Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E7DF385
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 11:54:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDE813EACAB
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 11:54:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 73F463EAC9C
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 11:54:11 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CCC1514012C9
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 11:54:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4CDFB307C945;
 Tue, 30 Apr 2019 09:54:09 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88545100164A;
 Tue, 30 Apr 2019 09:54:06 +0000 (UTC)
Date: Tue, 30 Apr 2019 17:54:04 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190430095404.ipt3tuhyfd4hqz6w@XZHOUW.usersys.redhat.com>
References: <20190430071446.13716-1-xzhou@redhat.com>
 <CAEemH2c0FYg+WoCJfzWmaUiANE3pcpdXT2fHVGXsL_qnRJUn+A@mail.gmail.com>
 <20190430083056.b6q2p6yzqbp2q6fm@XZHOUW.usersys.redhat.com>
 <CAEemH2d-xLCFayr8uCycdYZCtwg1YRHJcpXjdzRCi6zJ6_rMPw@mail.gmail.com>
 <20190430090846.s2ctvbipxgs6nprr@XZHOUW.usersys.redhat.com>
 <CAEemH2dvDqWq7XMS_dNkuKkE31FejY59H+cvX37R8xCeo0uD3Q@mail.gmail.com>
 <CAOQ4uxjD-YmwOt6v9s1MoXBCk2cdPrseLgDkHAaSWiVYH9SwDw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjD-YmwOt6v9s1MoXBCk2cdPrseLgDkHAaSWiVYH9SwDw@mail.gmail.com>
User-Agent: NeoMutt/20180716-1400-f2a658
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 30 Apr 2019 09:54:09 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDU6Mzc6MzZBTSAtMDQwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgNToyMSBBTSBMaSBXYW5nIDxsaXdhbmdA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4KPiA+Cj4gPiBPbiBUdWUsIEFwciAzMCwgMjAxOSBh
dCA1OjA4IFBNIE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPiB3cm90ZToKPiA+Pgo+ID4+
IC4uLgo+ID4+ID4gPiA+ID4gKyAgICAgICBpZiAoZnNfdHlwZSA9PSBUU1RfT1ZFUkxBWUZTX01B
R0lDICYmIGVycm5vID09IEVJTlZBTCkgewo+ID4+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHRz
dF9yZXNtKFRDT05GLCAiU3dhcGZpbGUgb24gb3ZlcmxheWZzIG5vdAo+ID4+ID4gPiBpbXBsZW1l
dGVkIik7Cj4gPj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gPj4g
PiA+ID4gPiArICAgICAgIH0KPiA+PiA+ID4gPiA+Cj4gPj4gPiA+ID4KPiA+PiA+ID4gPiBUaGUg
Y29kZSBsb29rcyBjb3JyZWN0Lgo+ID4+ID4gPiA+Cj4gPj4gPiA+ID4gQnV0IGl0IGFscmVhZHkg
aGFzIGEgdGVzdCBza2lwcGluZyBmb3IgQlRSRlMsIGlzIHRoZXJlIGFueSBwb3NzaWJpbGl0eSB0
bwo+ID4+ID4gPiA+IGNvbWJpbmUgdGhlc2UgZmlsZXN5c3RlbXMgY2hlY2sgdG9nZXRoZXI/Cj4g
Pj4gPiA+Cj4gPj4gPiA+IEdvb2QgaWRlYX4gIFNlbmRpbmcgVjIuCj4gPj4gPiA+Cj4gPj4gPgo+
ID4+ID4gT25lIG1vcmUgY29tbWVudC4KPiA+PiA+Cj4gPj4gPiBJIGp1c3Qgbm90aWNlZCB0aGF0
IGl0IGFsc28gaGFzIGFuIEZTIHNraXBwaW5nIGxpc3QgaW4gc2V0dXAoKSwgZG8gdSB0aGluawo+
ID4+ID4gY2FuIHdlIG1vdmUgQlRSRlMgYW5kIE9WRVJMQVlGUyB0byB0aGVyZT8KPiA+Pgo+ID4+
IEdyZWF0ISBUaGF0IG1ha2VzIHBlcmZlY3Qgc2Vuc2UuIEFsc28gSSdtIHRoaW5raW5nIGEgZmV3
IG90aGVyIHR3ZWFrcwo+ID4+IG5lZWRlZDoKPiA+Pgo+ID4+ICAgTkZTIG5vdyBhY3R1YWxseSBz
dXBwb3J0IHN3YXBmaWxlcy4gTGV0J3MgcmVtb3ZlIGl0IGZyb20gc2tpcCBsaXN0Owo+ID4KPiA+
Cj4gPiBCdXQgQUZBSUsgc29tZW9uZSBzdGlsbCBydW4gTFRQIG9uIG9sZCBkaXN0cm8va2VybmVs
LCBzbyB3ZSBjYW4ndCBndWFyYW50ZWUgdGhlIHRlc3Qgd29ya3MgZmluZSBpbiB0aGF0IHNpdHVh
dGlvbi4gU28sIG15IG9waW5pb24gaXMgdG8gcmVzZXJ2ZSB0aGUgTkZTLCBvciBkbyB5b3UgaGF2
ZSBhIGJldHRlciB3YXkgdG8gbWFrZSB0ZXN0IG1vcmUgZmxleGlibGU/Cj4gCj4gQXZvaWQgd2hp
dGVsaXN0Lgo+IFRlc3QgZm9yIEZJQk1BUCBpb2N0bCBzdXBwb3J0LgoKSG1tLi4gVGhpcyBpcyBi
ZXR0ZXIuIEknbGwgdHJ5LgoKVGhhbmtzIQpNCgo+IAo+IFRoYW5rcywKPiBBbWlyLgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
