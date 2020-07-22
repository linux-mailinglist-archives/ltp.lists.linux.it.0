Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BE7229BD3
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 17:52:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D49473C7718
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 17:52:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9081F3C76EC
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 17:52:44 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 695C21401702
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 17:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595433161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqgnXTA7KA3AB/kBauaY7z/HO65G5ljqkDqtFrNhRng=;
 b=B+gpgPG9fij1Q4hK8aiPFRAKnJL24Idw6e+mEQ6fiHKzBUEua9EhGWPNhlCLXAebdiNSK5
 4kpQgdUERE9WgDfvhH4TXJiL9duK8mPsRAjXDDjHv8OCdYbpoVRVgB78It6jj/exYZ9dHQ
 +jkyXU0oduF5RC1NldRVw/pPlyu6iOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-v3LPwnCOOEum0sS5RUhF2g-1; Wed, 22 Jul 2020 11:52:40 -0400
X-MC-Unique: v3LPwnCOOEum0sS5RUhF2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1183A107ACCA;
 Wed, 22 Jul 2020 15:52:39 +0000 (UTC)
Received: from centennial.enunes.eu (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48BFA1992D;
 Wed, 22 Jul 2020 15:52:35 +0000 (UTC)
To: Li Wang <liwang@redhat.com>
References: <20200720194920.22784-1-ernunes@redhat.com>
 <CAEemH2c1Sz+pkcLnCoWWCaMCte7QsmUTOoUxU6fzCF32nrrG+w@mail.gmail.com>
 <98eaa723-1349-272d-3021-d2fef6e1abdd@redhat.com>
 <CAEemH2e0nwt_aOytJz0WzB3CYSirxa4myOZoQqCPTAVBL11gbQ@mail.gmail.com>
From: Erico Nunes <ernunes@redhat.com>
Message-ID: <8c72fb72-c7aa-f21f-e08c-d97c28e4c375@redhat.com>
Date: Wed, 22 Jul 2020 17:52:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2e0nwt_aOytJz0WzB3CYSirxa4myOZoQqCPTAVBL11gbQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: add function to check for kernel lockdown
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gNy8yMS8yMCAzOjE5IFBNLCBMaSBXYW5nIHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDIxLCAyMDIw
IGF0IDQ6NTcgUE0gRXJpY28gTnVuZXMgPGVybnVuZXNAcmVkaGF0LmNvbQo+IDxtYWlsdG86ZXJu
dW5lc0ByZWRoYXQuY29tPj4gd3JvdGU6Cj4gCj4gICAgIC4uLgo+IAo+ICAgICA+IE1heWJlIHJl
bmFtaW5nIHRoZSBmdW5jdGlvbiB0byB0c3RfbG9ja2Rvd25fZW5hYmxlZCgpIGlzIGJldHRlcj8K
PiAgICAgVGhlbiB3ZQo+ICAgICA+IGNhbiByZXR1cm7CoDEgaWYgY29uZmlybSBrZXJuZWwgdW5k
ZXIgbG9ja2Rvd24gbW9kZSBvdGhlcndpc2UgMC4KPiAKPiAKPiBIb3cgZG8geW91IHRoaW5rIGFi
b3V0IHRoaXMgc3VnZ2VzdGlvbj8gXl4KPiAKPiBBbm90aGVyIHJlYXNvbsKgdG8gbmFtZSBpdCBh
cyB0c3RfbG9ja2Rvd25fZW5hYmxlZCgpIGlzLCB3ZSBjYW4gZ2l2ZSBtb3JlCj4gZmxleGlibGUK
PiB0byB0ZXN0IGNhc2UsIGJlY2F1c2XCoG5vdCBhbGwgdGVzdHMgbmVlZCBhIHNpbXBsZSBza2lw
IGluIGxvY2tkb3duCj4gbW9kZShpbiBmdXR1cmUpLgo+IAo+IGkuZS4KPiBpZiAodHN0X2xvY2tk
b3duX2VuYWJsZWQoKSkgewo+IMKgIMKgLy8gc2tpcCBvciBub3QsCj4gwqAgwqAvLyBkbyB3aGF0
IHRoZXkgd2FudGVkIGluIHRoaXMgbW9kZQo+IH0KCkkgbGlrZSB0aGlzIHN1Z2dlc3Rpb24sIEkn
bGwgc2VuZCB2MiB3aXRoIHRoaXMuCgo+ICAgICBJZiAvc3lzL2tlcm5lbC9zZWN1cml0eS9sb2Nr
ZG93biBkb2Vzbid0IGV4aXN0LCBJJ20gbm90IHN1cmUgdGhlcmUgaXMKPiAgICAgbXVjaCB3ZSBj
YW4gZG8gZWFzaWx5LCBvciB0aGF0IGlzIHdvcnRoIGRvaW5nIG5vdy4gSSB0aGluayBpdCBpcyBv
ayB0bwo+ICAgICBmYWxsIGJhY2sgYW5kIGZhaWwgbGlrZSBpdCBoYXMgYmVlbiBoYXBwZW5pbmcg
c2luY2UgdGhlIGZlYXR1cmUgd2FzCj4gICAgIG1lcmdlZCB1cHN0cmVhbS4KPiAKPiAKPiBZZXMs
IGl0IGxvb2tzIGEgYml0IHRyaWNreS4KPiDCoAo+IAo+ICAgICBJIGNhbid0IHNlZSBhIHR3ZWFr
IHRoYXQgd291bGQgZW5hYmxlIHRoZSBmZWF0dXJlIGJ1dCBub3QgdGhlIHN5c2ZzIGZpbGUKPiAg
ICAgaW4gdGhlIGtlcm5lbCBzb3VyY2UuIE1heWJlIHRoYXQga2VybmVsIG9ubHkgaGFkIHBhcnRp
YWwgc3VwcG9ydD8KPiAKPiAKPiBTZWVtcyB5b3UncmUgcmlnaHQsIHRoZXJlIGFyZSBtYW55IGRp
ZmZlcmVuY2VzIGJldHdlZW4gbWFpbmxpbmUta2VybmVsCj4gYW5kIHNvbWUgZGlzdHJvcyBpbiBs
b2NrZG93biBjb2RlLiBUaGUgcmVhc29uIHRoYXQgc29tZSBkaXN0cmlidXRpb24KPiAoaS5lIFJI
RUwsIFVidW50dSkgcGFydGx5IGN1c3RvbWl6ZXMgdGhlIExTTSBmZWF0dXJlLMKgaXQgZG9lcyBu
b3Qgc3VwcG9ydAo+IGxvY2tkb3duIGZlYXR1cmVzIGNvbXBsZXRlbHkgc28gZmFyLgo+IAo+IEJ1
dCBvbmUgcG9pbnQgd2UncmUgc3VyZSBpcyB0aGF0IHRoZSAvc3lzL2tlcm5lbC8uLi9sb2NrZG93
biBmaWxlIHdhcwo+IGludHJvZHVjZWQgZnJvbSBrZXJuZWwtdjUuNC4KPiAKPiBTbyBtYXliZSB3
ZSBjb3VsZCBzaW1wbHkgZG8gZGV0ZWN0IHRoZSAvc3lzL2tlcm5lbC8uLi9sb2Fja2Rvd24gZmls
ZSBhcwo+IHlvdXIgcGF0Y2gsCj4gYnV0IGFkZGluZyBhbiBleHRyYSB3YXJuaW5nIHByaW50IHdo
ZW4gdGVzdCBmYWlsZWQgb24gb2xkZXIgdGhhbgo+IGtlcm5lbC12NS40LgoKSSBsaWtlIHRoZSBp
ZGVhIG9mIHRoZSB3YXJuaW5nLiBUaGUgb25seSB0aGluZyB0byBjb25zaWRlciBpcyB0aGF0IHRo
ZQp3YXJuaW5nIHdvdWxkIGFsc28gc2hvdyB1cCBvbiBhbGwgb2xkIGtlcm5lbHMgdGhhdCBkb24n
dCBldmVuIHN1cHBvcnQKbG9ja2Rvd24gYW5kIHRoZW4gZG9uJ3QgaGF2ZSB0aGUgZmlsZS4gU28g
d291bGQgeW91IHN1Z2dlc3QgdGhpcyBtZXNzYWdlCnRvIGJlIHNvbWV0aGluZyBsaWtlIGEgdHN0
X3JlcyhUV0FSTiwgLi4uKSBvciBUSU5GTyBvciBzb21lIG90aGVyIGxlc3MKbm9pc3kgd2F5PwoK
SSBhbHNvIHRob3VnaHQgYWJvdXQgbGltaXRpbmcgdG8gc29tZSBrZXJuZWwgdmVyc2lvbiBidXQg
dGhhdCB3b3VsZG4ndAp3b3JrIHdpdGggZGlzdHJpYnV0aW9uIGtlcm5lbHMgbGlrZSBSSEVMIHdo
aWNoIGhhdmUgYW4gZWFybGllciB2ZXJzaW9uCm51bWJlciBidXQgYWxzbyBoYXZlIHRoZSBmZWF0
dXJlLi4uCgpFcmljbwoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
