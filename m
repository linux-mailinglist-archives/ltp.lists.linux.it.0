Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 673DA24E1B
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 13:40:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C1943EA76C
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 13:40:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id ACB963EA70E
 for <ltp@lists.linux.it>; Tue, 21 May 2019 13:40:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A9EF5201098
 for <ltp@lists.linux.it>; Tue, 21 May 2019 13:40:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5485AE82;
 Tue, 21 May 2019 11:40:41 +0000 (UTC)
Date: Tue, 21 May 2019 13:40:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190521114040.GB13910@rei>
References: <20190506105457.22350-1-camann@suse.com>
 <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
 <20190506201948.GA9828@dell5510> <20190520143135.GA27341@dell5510>
 <20190520144645.GD28976@rei.lan> <20190520152400.GA11845@dell5510>
 <CAOQ4uxivgpoMeUUxm-fboFfiXLXn+QXNzKJWSHAZhidwUsuvng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxivgpoMeUUxm-fboFfiXLXn+QXNzKJWSHAZhidwUsuvng@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/copy_file_range: add/restructured
	tests
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

SGkhCj4gPiA+ID4gMikgR2xpYmMgYWRkcyBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBvZiBjb3B5
X2ZpbGVfcmFuZ2UoKSwgdXNlZCBhcyBmYWxsYmFjawo+ID4gPiA+IHdoZW4ga2VybmVsIDwgNC41
ICh3aGljaCBicm91Z2h0IGNvcHlfZmlsZV9yYW5nZSgpKSBbMV0uIEkgZ3Vlc3MgdGhlcmUgaXMg
bm8gd2F5Cj4gPiA+ID4gdG8gdXNlIGl0IGV4cGxpY2l0bHkgOiguCj4gPgo+ID4gPiBXZWxsIHdl
IGNhbiBhbHdheXMgdXNlIGZpbGVzeXN0ZW0gdGhhdCBkb2VzIG5vdCBzdXBwb3J0IHRoZSBvcGVy
YXRpb24sCj4gPiA+IHNvIHJ1bm5pbmcgdGhlIHRlc3QgZm9yIGFsbCBmaWxlc3lzdGVtcyBzaG91
bGQgZ2V0IHRoZSBlbXVsYXRpb24gY292ZXJlZAo+ID4gPiBmb3Igc3VyZS4uLgo+ID4gT2gsIHRo
YXQncyB0aGUgd2F5IDopLgo+IAo+IEFjdHVhbGx5LCB0aGVyZSBpcyBubyBzdWNoIHRoaW5nIGFz
IGZpbGVzeXN0ZW0gdGhhdCBkb2VzIG5vdCBzdXBwb3J0Cj4gY29weV9maWxlX3JhbmdlKCkgYmVj
YXVzZSB0aGUga2VybmVsIHByb3ZpZGVzIGEgZmFsbGJhY2sgZGVmYXVsdCBpbXBsZW1lbnRhdGlv
bgo+IChpbi1rZXJuZWwgY29weSkuCgpTbyB0aGUgZ2xpYmMgZmFsbGJhY2sgY29kZSBpcyBwcm9i
YWJseSBzb21ldGhpbmcgdGhhdCB3aWxsIGVuZCB1cCBiZWluZwp1c2VkIGlmIHNvbWVvbmUgd2Fu
dHMgdG8gcnVuIGFwcGxpY2F0aW9uIHRoYXQgdXNlcyB0aGlzIHN5c2NhbGwgb24gQlNECm9yIG90
aGVyIGNvcm5lciBjYXNlcy4gSSBndWVzcyB0aGF0IHdlIGRvIG5vdCBjYXJlIHRoYXQgbXVjaCBh
Ym91dAp0ZXN0aW5nIHRoZSBnbGliYyBmYWxsYmFjayBjb2RlIHRoZW4uCgotLSAKQ3lyaWwgSHJ1
YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
