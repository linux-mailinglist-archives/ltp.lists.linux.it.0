Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C622C8029
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 09:39:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2DFD3C2C94
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 09:39:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E55FD3C2C16
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 09:39:29 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4A4846001FD
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 09:39:29 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 6B295A0B6B;
 Mon, 30 Nov 2020 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1606725567; bh=xqoUpIMn6d4fNNPIMyy4pgxL/x2JHlzrfV2FvHOa3UQ=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=NilYYh5yfnQhABZLmgq9mg9DlUtDpIUtSqQwNOG7PX76eMpqR7fs7z87C8GVQUqzU
 AoPOPQVpiDaTQ6Xuq3vntLM3AKoZISm8c6TxtxdAQ1VvPN12c/awUjWoURSOeYbyvg
 LCxJmpcQWTcYQ0C3XuoCU7PsQl0Jryrn/N1xwFMY=
To: Li Wang <liwang@redhat.com>
References: <20201125101633.30154-1-liwang@redhat.com>
 <87eekhof3i.fsf@suse.de> <04c4b073-6ad3-836a-7f63-7632a4e6ddb7@suse.cz>
 <87blflo9hx.fsf@suse.de> <f9b2e084-f2e0-1016-f505-6218d7c1853e@jv-coder.de>
 <CAEemH2fXpPXvQVi_UUovp+eB5JeWfdTjv47KXnCBhF=VG0Rsog@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <821eeadf-acd2-0de6-033d-1c3442a20407@jv-coder.de>
Date: Mon, 30 Nov 2020 09:39:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2fXpPXvQVi_UUovp+eB5JeWfdTjv47KXnCBhF=VG0Rsog@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] fzsync: skip test when avaliable CPUs less than 2
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
Cc: LTP List <ltp@lists.linux.it>, Richard Palethorpe <rpalethorpe@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCgpPbiAxMS8zMC8yMDIwIDk6MTQgQU0sIExpIFdhbmcgd3JvdGU6Cj4gSGkgSm9lcmcs
Cj4KPiBPbiBNb24sIE5vdiAzMCwgMjAyMCBhdCAzOjUzIFBNIEpvZXJnIFZlaGxvdyA8bGttbEBq
di1jb2Rlci5kZSAKPiA8bWFpbHRvOmxrbWxAanYtY29kZXIuZGU+PiB3cm90ZToKPgo+ICAgICBI
aSwKPiAgICAgPj4gTm8sIGFmX2FsZzA3IHJlcXVpcmVzIDIgQ1BVcywgb3RoZXJ3aXNlIGl0J2xs
IHJlcG9ydCBmYWxzZQo+ICAgICBwb3NpdGl2ZXMuCj4gICAgID4+IFRoZSB0ZXN0IHdpbGwgcGFz
cyBvbmx5IGlmIGZjaG93bmF0KCkgaGl0cyBhIGhhbGYtY2xvc2VkIHNvY2tldCBhbmQKPiAgICAg
Pj4gcmV0dXJucyBlcnJvci4gQnV0IElJUkMgdGhlIGhhbGYtY2xvc2VkIHNvY2tldCB3aWxsIGJl
Cj4gICAgIGRlc3Ryb3llZCBkdXJpbmcKPiAgICAgPj4gcmVzY2hlZHVsZSB3aGljaCBtZWFucyB0
aGVyZSdzIG5vIHJhY2Ugd2luZG93IHRvIGhpdCBhbnltb3JlLgo+ICAgICBCdXQgaXQKPiAgICAg
Pj4gd291bGQgYmUgYmV0dGVyIHRvIHB1dCB0aGUgVENPTkYgY29uZGl0aW9uIGludG8gdGhlIHRl
c3QgaXRzZWxmLgo+ICAgICA+IEludGVyZXN0aW5nLCBJIHdvbmRlciBpZiB0aGlzIGlzIGFsc28g
dHJ1ZSBmb3IgdGhlIHJlYWwtdGltZQo+ICAgICBrZXJuZWwgd2l0aAo+ICAgICA+IHRoZSB0aHJl
YWRzIHNldCB0byBSVCBwcmlvcml0eT8KPiAgICAgSXQgbG9va3MgbGlrZSB0aGUgdGVzdCBjYW4g
ZmFpbCBldmVuIHdpdGggbW9yZSB0aGFuIG9uZSBjcHUuIEkndmUKPiAgICAgc2Vlbgo+ICAgICB0
aGlzIHNwb3JhZGljIGZhaWx1cmUgb24gZGlmZmVyZW50IGhhcmR3YXJlIHdpdGggbW9yZSB0aGFu
IHR3bwo+ICAgICBjb3JlcywgYXQKPiAgICAgbGVhc3Qgb24gaW50ZWwgZGVudmVydG9uICh4ODZf
NjQpIGFuZCByZW5lc2FzIHItY2FyIChhYXJjaDY0KQo+ICAgICBzeXN0ZW1zLgo+ICAgICBCb3Ro
IHdpdGgga2VybmVsIDQuMTkgd2l0aCB0aGUgZml4IGluY2x1ZGVkLCBvbiB0aGUgZGVudmVydG9u
Cj4gICAgIHN5c3RlbSB0aGUKPiAgICAgcnQgcGFyY2hlcyB3ZXJlIGluY2x1ZGVkIGFuZCBvbiB0
aGUgci1jYXIgbm90LiBUaGUgdGVzdCBwYXNzZXMKPiAgICAgbW9zdCBvZgo+ICAgICB0aGUgdGlt
ZSwgYnV0IHNvbWV0aW1lcyBmYWlscyB3aXRoIHRoZSBtZXNzYWdlIExpIHBvc3RlZC4KPgo+ICAg
ICBJdCBhbHNvIHNlZW1zIHRvIGZhaWwgc3BvcmFkaWNhbGx5IG9uIG90aGVyIHN5c3RlbXMgYXMg
d2VsbDoKPiAgICAgaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1LWtlcm5lbC10ZXN0
cy8rYnVnLzE4OTI4NjAKPiAgICAgPGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L3VidW50dS1r
ZXJuZWwtdGVzdHMvK2J1Zy8xODkyODYwPgo+Cj4gICAgIEFkZGl0aW9uYWxseSBJIHRlc3RlZCBv
biBxZW11LXg4NiB3aXRoIDQuMTkgd2l0aCBhbmQgd2l0aG91dCBydAo+ICAgICBwYXRjaGVzLgo+
ICAgICBUaGUgdGVzdCBzdWNjZWVkcyBldmVuIHdpdGggb25seSBvbmUgdmlydHVhbGl6ZWQgY3B1
LiBTbyBlaXRoZXIKPiAgICAgTWFydGluJ3MKPiAgICAgYXNzdW1wdGlvbiBpcyB3cm9uZyBvciBp
dCBob2xkcyBvbmx5IGZvciBuZXdlciBrZXJuZWwgdmVyc2lvbnM/Cj4KPgo+IE5vLCBNZXJ0aW4g
aXMgbm90IHdyb25nLCBhbmQgeW91IGFyZSBhbHNvIHJpZ2h0Lgo+Cj4gVGhleSBhcmUgdG90YWxs
eSB0d28gZGlmZmVyZW50IGlzc3VlcyBvZiBhZl9hbGcwNywgdGhlIHRlc3Qgb24gMUNQVQo+IHNo
b3VsZMKgYmUgZml4ZWQgd2l0aCBUQ09ORi4gQnV0IHRoZSBmYWlsIHdpdGggYWFyY2g2NCBpcyBt
b3JlIGxpa2UgYQo+IGhhcmR3YXJlIGlzc3VlLCBDaHVueXUgaGFzIGEgZHJhZnRlZCBwYXRjaCB0
byBhZGQgaW5pdCBkZWxheSB2YWx1ZSBmb3IKPiBzdWNoIGEgc3lzdGVtLgpJIHRoaW5rIHlvdSBt
aXN1bmRlcnN0b29kIHNvbWV0aGluZy4gSSBzZWUgcmFuZG9tIGZhaWxzIHdpdGggIlRGQUlMOiAK
ZmNob3duYXQoKSBmYWlsZWQgdG8gZmFpbCwga2VybmVsIG1heSBiZSB2dWxuZXJhYmxlIiBvbiBi
b3RoIHg4Nl82NCBhbmQgCmFhcmNoNjQgd2l0aCBtb3JlIHRoYW4gb25lIGNwdSBjb3JlICg0IGZv
ciB4ODZfNjQgYW5kIDIgb3IgNCBmb3IgYWFyY2g2NCkuCgpJIHNlZSBubyBlcnJvciAoIlRQQVNT
OiBmY2hvd25hdCgpIGZhaWxlZCBzdWNjZXNzZnVsbHk6IEVOT0VOVCAoMikiKSBvbiAKc2luZ2xl
IGNvcmUgcWVtdS14ODYuIFRoaXMgaXMgd2h5IEkgdGhpbmsgTWFydGluJ3MgYXNzdW1wdGlvbiBt
YXkgYmUgCndyb25nLiBJZiBpdCB3YXMgcmlnaHQsIGl0IHNob3VsZCBuZXZlciBzdWNjZWVkIG9u
IGEgc2luZ2xlIGNvcmUgc3lzdGVtIApyaWdodD8KCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
