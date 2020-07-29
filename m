Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C98231D04
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 12:56:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55AF83C268F
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 12:56:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 063563C0515
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 12:55:57 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id CC19960096E
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 12:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596020155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WLQtd8MwjFVUpRBGVhTjvqNJHU07Gf0258F4G2paKw=;
 b=d7S76wAQbiQyL43A6JtRLbLlmY6ov71YCGyLHtJ5nV9GbEzJqisk7TL/CQTNbGtIrcseB4
 Vmd64nW8jz8fe9etvS1UH4ZsZTgA0exoOSDyxZDpqMW/6pk9FU4GiqP9Gjq8xftZKYOQuN
 GTC+jykqv4MB4UObOIrcHs1E9twIpNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-flUopxrEPiuyMRKdEqD8FQ-1; Wed, 29 Jul 2020 06:55:53 -0400
X-MC-Unique: flUopxrEPiuyMRKdEqD8FQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3BEE800597
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 10:55:52 +0000 (UTC)
Received: from centennial.enunes.eu (unknown [10.40.195.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 206C85D9E8;
 Wed, 29 Jul 2020 10:55:48 +0000 (UTC)
To: Li Wang <liwang@redhat.com>
References: <20200728162207.332109-1-ernunes@redhat.com>
 <CAEemH2d+EOzF8aKAkpsnUO1GqgPh3J40RBDXyBg0E5NC8nrSuw@mail.gmail.com>
From: Erico Nunes <ernunes@redhat.com>
Message-ID: <678ed5c9-d678-6673-666b-05b999567977@redhat.com>
Date: Wed, 29 Jul 2020 12:55:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2d+EOzF8aKAkpsnUO1GqgPh3J40RBDXyBg0E5NC8nrSuw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.7 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] lib: add function to check for kernel
 lockdown
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

CgpPbiA3LzI5LzIwIDU6MTQgQU0sIExpIFdhbmcgd3JvdGU6Cj4gVGhhbmtzIEVyaWNvIGZvciBw
YXRjaCBWMi4KPiAKPiBPbiBXZWQsIEp1bCAyOSwgMjAyMCBhdCAxMjoyMyBBTSBFcmljbyBOdW5l
cyA8ZXJudW5lc0ByZWRoYXQuY29tCj4gPG1haWx0bzplcm51bmVzQHJlZGhhdC5jb20+PiB3cm90
ZToKPiAKPiAgICAgU29tZSBzeXNjYWxscyBhcmUgbm90IGF2YWlsYWJsZSBpZiB0aGUga2VybmVs
IGlzIGJvb3RlZCB1c2luZyB0aGUKPiAgICAgJ2xvY2tkb3duJyBmZWF0dXJlLiBUaGF0IGNhbiBj
YXVzZSBzb21lIHRlc3RzIHRvIHJlcG9ydCBmYWlsLCBzaG93aW5nCj4gICAgIGEgbWVzc2FnZSBs
aWtlOgo+IAo+ICAgICDCoCBMb2NrZG93bjogaW9wbDAxOiBpb3BsIGlzIHJlc3RyaWN0ZWQ7IHNl
ZSBtYW4ga2VybmVsX2xvY2tkb3duLjcKPiAKPiAgICAgVGhpcyBwYXRjaCBhZGRzIGEgZnVuY3Rp
b24gdGhhdCBjYW4gYmUgdXNlZCBieSB0ZXN0cyB0byBjaGVjayBmb3IgdGhpcwo+ICAgICBjYXNl
LCBzbyBpdCBjYW4gYmUgaGFuZGxlZCBhY2NvcmRpbmdseS4KPiAKPiAgICAgU2lnbmVkLW9mZi1i
eTogRXJpY28gTnVuZXMgPGVybnVuZXNAcmVkaGF0LmNvbQo+ICAgICA8bWFpbHRvOmVybnVuZXNA
cmVkaGF0LmNvbT4+Cj4gICAgIC0tLQo+ICAgICAuLi4KPiAgICAgK2ludCB0c3RfbG9ja2Rvd25f
ZW5hYmxlZCh2b2lkKQo+ICAgICArewo+ICAgICArwqAgwqAgwqAgwqBjaGFyIGxpbmVbQlVGU0la
XTsKPiAgICAgK8KgIMKgIMKgIMKgY29uc3QgY2hhciAqbG9ja2Rvd25fcGF0aCA9ICIvc3lzL2tl
cm5lbC9zZWN1cml0eS9sb2NrZG93biI7Cj4gCj4gCj4gSSBwcmVmZXIgdG8gYWRkIGEgbWFjcm8g
ZGVmaW5pdGlvbiBpbiB0aGUgaGVhZGVyIGZpbGUgaW5zdGVhZCBvZiB0aGlzIF4uCj4gwqAgwqAg
I2RlZmluZSBQQVRIX0xPQ0tET1dOwqAgIi9zeXMva2VybmVsL3NlY3VyaXR5L2xvY2tkb3duIgoK
SSdtIG9rIHdpdGggdGhhdCwgZG8geW91IHdhbnQgbWUgdG8gc3VibWl0IGFub3RoZXIgdmVyc2lv
biBsaWtlIHRoaXMgb3IKY2FuIHlvdSBjaGFuZ2Ugd2hpbGUgYXBwbHlpbmc/CgpUaGFuayB5b3UK
CkVyaWNvCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
