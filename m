Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF2DFC038
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 07:31:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD8653C2431
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 07:31:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 31ADF3C13DF
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 07:31:51 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 457CA637CCF
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 07:31:50 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id D1C7A9F8EB;
 Thu, 14 Nov 2019 06:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1573713109; bh=mKZYeeNsP9MXQp+MgGtIjQmbXjlFaln+rL0FMv7a5cg=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=MIS/0MM9oLwqNFjCxIzAB/ieLpOuI0ADK7YvbgsB8pXOAfCwhTsURd6BLGjEiOJWu
 DLpW1xYENKVw3UhUtj6jvq7Lu9p5tzdaEYX73ZuwOtQreO1Mrwtq+do5V37hU5ZY5J
 dFTkXlxOaDPTnjnsfKqKyCewp2AsTGr8ykA52lxQ=
To: Li Wang <liwang@redhat.com>
References: <20191113104149.42407-1-lkml@jv-coder.de>
 <CAEemH2eP-ibqs=Mc-aMYUxj7CJ-u9CUZnkD8=Ro_2td9StPVZQ@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <e506bf38-f1d9-6f9e-e4cd-6edf24f74cd9@jv-coder.de>
Date: Thu, 14 Nov 2019 07:31:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAEemH2eP-ibqs=Mc-aMYUxj7CJ-u9CUZnkD8=Ro_2td9StPVZQ@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] configure.ac: Fix --with* options
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCgo+IEkgdGhpbmsgdGhpcyBwYXRjaCBtYWtlcyBzZW5zZS4gSXQgZm9sbG93cyB0aGUg
QUNfQVJHX1dJVEggb2ZmaWNpYWwgCj4gdXNhZ2UsIGFuZCBtYWtlIHVzZcKgb2YgdGhlIHNoZWxs
IHZhcmlhYmxlICd3aXRodmFsJyBpcyBhbHNvIGEgd2lzZSBjaG9pY2UuCj4KPiBKdXN0IGEgZmV3
IHF1ZXJpZXMgYmVsb3c6Cj4KPgo+Cj4gICAgIMKgQUNfQVJHX1dJVEgoW2V4cGVjdF0sCj4gICAg
IMKgIMKgW0FDX0hFTFBfU1RSSU5HKFstLXdpdGgtZXhwZWN0XSwKPiAgICAgLcKgIMKgIFtoYXZl
IHRoZSBUY2wvZXhwZWN0IGxpYnJhcnkgKGRlZmF1bHQ9eWVzKV0pXSwKPiAgICAgLcKgIFt3aXRo
X2V4cGVjdD15ZXNdLAo+ICAgICArwqAgwqAgW2hhdmUgdGhlIFRjbC9leHBlY3QgbGlicmFyeV0p
XSwKPiAgICAgK8KgIFt3aXRoX2V4cGVjdD0kd2l0aHZhbF0sCj4gICAgIMKgW3dpdGhfZXhwZWN0
PW5vXQo+Cj4KPiBGcm9tIHRoZSBvcmlnaW5hbCBpbnRlbnRpb24sIGl0IGxpa2VseSB0byBzZXQg
eWVzIGFzIHRoZSBkZWZhdWx0LCBzbyAKPiBtYXliZSB0aGXCoFthY3Rpb24taWYtbm90LWdpdmVu
XSBzaG91bGQgYXMgwqBbd2l0aF9leHBlY3Q9eWVzXT8KTWF5YmUsIGJ1dCBJIGRpZCBub3Qgd2Fu
dCB0byBjaGFuZ2UgdGhlIGN1cnJlbnQgYmVoYXZpb3IgaGVyZS4gVGhpcyAKc2hvdWxkIGJlIGRv
bmUgaW4gYW5vdGhlciBwYXRjaC4KPgo+Cj4gICAgIC0jIHRlc3RjYXNlcy9yZWFsdGltZSByZXF1
aXJlcyBiYXNoIGFuZCBweXRob24uCj4gICAgIC1pZiB0ZXN0ICJ4JHdpdGhfYmFzaCIgPSB4eWVz
ICYmIHRlc3QgIngkd2l0aF9weXRob24iID0geHllczsgdGhlbgo+ICAgICAtwqAgwqAgQUNfQVJH
X1dJVEgoW3JlYWx0aW1lLXRlc3RzdWl0ZV0sCj4gICAgIC3CoCDCoCDCoCBbQUNfSEVMUF9TVFJJ
TkcoWy0td2l0aC1yZWFsdGltZS10ZXN0c3VpdGVdLAo+ICAgICAtwqAgwqAgwqAgwqAgW2NvbXBp
bGUgYW5kIGluc3RhbGwgdGhlIHJlYWx0aW1lIHRlc3RzdWl0ZSAoZGVmYXVsdD1ubyldKV0sCj4g
ICAgIC3CoCDCoCDCoCBbd2l0aF9yZWFsdGltZV90ZXN0c3VpdGU9eWVzXQo+ICAgICAtwqAgwqAg
KQo+ICAgICAtZmkKPiAgICAgKyMgVE9ETzogdGVzdGNhc2VzL3JlYWx0aW1lIHJlcXVpcmVzIGJh
c2ggYW5kIHB5dGhvbi4KPgo+Cj4gV2h5IHJlbW92ZSB0aGUganVkZ21lbnTCoG9mIGJhc2gvcHl0
aG9uIGhlcmU/Ckl0IHNpbXBseSBkb2VzIG5vdCB3b3JrIGFzIGludGVuZGVkLiBTZWUgbGFzdCBw
YXJ0IG9mIG15IHBhdGNoIGRlc2NyaXB0aW9uOgpEZWZpbmluZyBBQ19BUkdfV0lUSCB3aXRoaW4g
YW4gaWYgdG8gZXhwcmVzcyBkZXBlbmRlbmNpZXMgZG9lcyBub3Qgd29yay4KLi9jb25maWd1cmUg
LS13aXRoLXJlYWx0aW1lLXRlc3RzdWl0ZSBzZXQgd2l0aF9yZWFsdGltZV90ZXN0c3VpdGU9eWVz
LApldmVuIGlmIHdpdGhfYmFzaD1ubyBvciB3aXRoX3B5dGhvbj1uby4gVGhlIGNoZWNrIGlzIHJl
bW92ZWQgY29tcGxldGVseS4KCkkgdGhvdWdoIHJlbW92aW5nIGl0IGlzIGJldHRlciB0aGFuIGxl
YXZpbmcgc29tZXRoaW5nIHRoYXQgZG9lcyBub3RoaW5nIAphbnl3YXkKPgpKw7ZyZwoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
