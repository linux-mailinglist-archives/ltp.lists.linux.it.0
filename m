Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA1D7DE48C
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Nov 2023 17:25:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 107B03CE9C8
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Nov 2023 17:25:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ADA823C31BB
 for <ltp@lists.linux.it>; Wed,  1 Nov 2023 17:25:51 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BB2FA1A00155
 for <ltp@lists.linux.it>; Wed,  1 Nov 2023 17:25:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 802381F74A;
 Wed,  1 Nov 2023 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1698855949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fhDjP08EHUuiH7whX2eucF8PZND9jiU4snM6JFkrtMQ=;
 b=CNx66wW9KIjhW1XPrg/vy9GQ0QKEsOPvJTUST6vo2OUCsQYfx4gA1Qxv1YCRf8L5+iQvIM
 ZRX8aDXYpdlHcH8d/Y4YTU2jVDeFwpk7cA4BIdhg56RlVDIyfigDKYDd9hI4FeMYf5TA03
 n9KJEvivjEMwJqywb25I+P8SX09SFwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1698855949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fhDjP08EHUuiH7whX2eucF8PZND9jiU4snM6JFkrtMQ=;
 b=bFWRiD4xl+auJ3UCTUk5sPCx8fGdG2pzI3r5nuQDIvtyXgRYhr1No7wno9/MCa8d/le6AI
 rXsD9MTb7yrc57AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F12313460;
 Wed,  1 Nov 2023 16:25:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NbSXAg18QmUnQAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 01 Nov 2023 16:25:49 +0000
Date: Wed, 1 Nov 2023 17:26:19 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZUJ8K9nna0Poa9FS@yuki>
References: <20231013074748.702214-1-pvorel@suse.cz>
 <20231013074748.702214-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231013074748.702214-3-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] lib: Add .modprobe
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhCj4gZGlmZiAtLWdpdCBhL2RvYy9DLVRlc3QtQVBJLmFzY2lpZG9jIGIvZG9jL0MtVGVzdC1B
UEkuYXNjaWlkb2MKPiBpbmRleCBkYWI4MTE1NjQuLmYyYmEzMDJlMiAxMDA2NDQKPiAtLS0gYS9k
b2MvQy1UZXN0LUFQSS5hc2NpaWRvYwo+ICsrKyBiL2RvYy9DLVRlc3QtQVBJLmFzY2lpZG9jCj4g
QEAgLTE2MDksNiArMTYwOSwxMSBAQCBmaXJzdCBtaXNzaW5nIGRyaXZlci4KPiAgVGhlIGRldGVj
dGlvbiBpcyBiYXNlZCBvbiByZWFkaW5nICdtb2R1bGVzLmRlcCcgYW5kICdtb2R1bGVzLmJ1aWx0
aW4nIGZpbGVzCj4gIGdlbmVyYXRlZCBieSBrbW9kLiBUaGUgY2hlY2sgaXMgc2tpcHBlZCBvbiBB
bmRyb2lkLgo+ICAKPiArTlVMTCB0ZXJtaW5hdGVkIGFycmF5ICcubW9kcHJvYmUnIG9mIGtlcm5l
bCBtb2R1bGUgbmFtZXMgYXJlIHRyaWVkIHRvIGJlIGxvYWRlZAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgkJCQkJCQkg
ICAgICBhdHRlbXB0ZWQKPiArd2l0aCAnbW9kcHJvYmUnIHVubGVzcyB0aGV5IGFyZSBidWlsdGlu
IG9yIGFscmVhZHkgbG9hZGVkLiBUZXN0IGV4aXRzIHdpdGgKPiArJ1RDT05GJyBvbiBmaXJzdCAn
bW9kcHJvYmUnIG5vbi16ZXJvIGV4aXQuIER1cmluZyBjbGVhbnVwIGFyZSB0aGUgbW9kdWxlcwog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gICAgIF4KCQkgICAgICAgICAgICAg
ICAgICAgZmFpbHVyZQo+ICtsb2FkZWQgYnkgdGhlIHRlc3QgdW5sb2FkZWQgd2l0aCAncm1tb2Qn
LgoKRHVyaW5nIHRoZSBjbGVhbnVwIG1vZHVsZXMgdGhhdCBoYXZlIGJlZW4gbG9hZGVkIGFyZSB1
bmxvYWRlZCBieSAnbW9kcHJvYmUgLXInLgoKPiAgMS4yNyBTYXZpbmcgJiByZXN0b3JpbmcgL3By
b2N8c3lzIHZhbHVlcwo+ICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
Cj4gIAo+IGRpZmYgLS1naXQgYS9kb2MvVGVzdC1Xcml0aW5nLUd1aWRlbGluZXMuYXNjaWlkb2Mg
Yi9kb2MvVGVzdC1Xcml0aW5nLUd1aWRlbGluZXMuYXNjaWlkb2MKPiBpbmRleCAwZGI4NTJhZTYu
LjE5NDg3ODE2ZSAxMDA2NDQKPiAtLS0gYS9kb2MvVGVzdC1Xcml0aW5nLUd1aWRlbGluZXMuYXNj
aWlkb2MKPiArKysgYi9kb2MvVGVzdC1Xcml0aW5nLUd1aWRlbGluZXMuYXNjaWlkb2MKPiBAQCAt
MzcxLDYgKzM3MSw3IEBAIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRw
L3dpa2kvU2hlbGwtVGVzdC1BUElbU2hlbGwgVGVzdCBBUEldLgo+ICB8ICcubWluX21lbV9hdmFp
bCcgfCBub3QgYXBwbGljYWJsZQo+ICB8ICcubW50X2ZsYWdzJyB8ICdUU1RfTU5UX1BBUkFNUycK
PiAgfCAnLm1pbl9zd2FwX2F2YWlsJyB8IG5vdCBhcHBsaWNhYmxlCj4gK3wgJy5tb2Rwcm9iZScg
fCDigJMKPiAgfCAnLm1udHBvaW50JywgJy5tbnRfZGF0YScgfCAnVFNUX01OVFBPSU5UJwo+ICB8
ICcubW91bnRfZGV2aWNlJyB8ICdUU1RfTU9VTlRfREVWSUNFJwo+ICB8ICcubmVlZHNfY2dyb3Vw
X2N0cmxzJyB8IOKAkwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3RzdF90ZXN0LmggYi9pbmNsdWRl
L3RzdF90ZXN0LmgKPiBpbmRleCA3NWMyMTA5YjkuLjZiNGZhYzk4NSAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL3RzdF90ZXN0LmgKPiArKysgYi9pbmNsdWRlL3RzdF90ZXN0LmgKPiBAQCAtMjk3LDkg
KzI5NywxMiBAQCBzdHJ1Y3QgdHN0X3Rlc3Qgewo+ICAJLyogTlVMTCB0ZXJtaW5hdGVkIGFycmF5
IG9mIHJlc291cmNlIGZpbGUgbmFtZXMgKi8KPiAgCWNvbnN0IGNoYXIgKmNvbnN0ICpyZXNvdXJj
ZV9maWxlczsKPiAgCj4gLQkvKiBOVUxMIHRlcm1pbmF0ZWQgYXJyYXkgb2YgbmVlZGVkIGtlcm5l
bCBkcml2ZXJzICovCj4gKwkvKiBOVUxMIHRlcm1pbmF0ZWQgYXJyYXkgb2YgbmVlZGVkIGtlcm5l
bCBkcml2ZXJzIHRvIGJlIGNoZWNrZWQgKi8KPiAgCWNvbnN0IGNoYXIgKiBjb25zdCAqbmVlZHNf
ZHJpdmVyczsKCkRvIHdlIG5lZWQgdGhpcyBhcnJheT8gQXJlIHRoZXJlIHRlc3RzIHRoYXQgbmVl
ZHMgdG8gY2hlY2sgZm9yIGEgbW9kdWxlCmJ1dCBkb2VzIG5vdCB3YW50IHRoZSBsaWJyYXJ5IHRv
IGxvYWQgdGhlbT8KCj4gKwkvKiBOVUxMIHRlcm1pbmF0ZWQgYXJyYXkgb2YgbmVlZGVkIGtlcm5l
bCBkcml2ZXJzIHRvIGJlIGxvYWRlZCB3aXRoIG1vZHByb2JlICovCj4gKwljb25zdCBjaGFyICog
Y29uc3QgKm1vZHByb2JlOwo+ICsKPiAgCS8qCj4gIAkgKiB7TlVMTCwgTlVMTH0gdGVybWluYXRl
ZCBhcnJheSBvZiAoL3Byb2MsIC9zeXMpIGZpbGVzIHRvIHNhdmUKPiAgCSAqIGJlZm9yZSBzZXR1
cCBhbmQgcmVzdG9yZSBhZnRlciBjbGVhbnVwCj4gZGlmZiAtLWdpdCBhL2xpYi90c3RfdGVzdC5j
IGIvbGliL3RzdF90ZXN0LmMKPiBpbmRleCAwODdjNjJhMTYuLmNjYmFhNGMwMiAxMDA2NDQKPiAt
LS0gYS9saWIvdHN0X3Rlc3QuYwo+ICsrKyBiL2xpYi90c3RfdGVzdC5jCj4gQEAgLTQ5LDYgKzQ5
LDcgQEAgY29uc3QgY2hhciAqVENJRCBfX2F0dHJpYnV0ZV9fKCh3ZWFrKSk7Cj4gICNkZWZpbmUg
Q1ZFX0RCX1VSTCAiaHR0cHM6Ly9jdmUubWl0cmUub3JnL2NnaS1iaW4vY3ZlbmFtZS5jZ2k/bmFt
ZT1DVkUtIgo+ICAKPiAgI2RlZmluZSBERUZBVUxUX1RJTUVPVVQgMzAKPiArI2RlZmluZSBNT0RV
TEVTX01BWF9MRU4gMTAKPiAgCj4gIHN0cnVjdCB0c3RfdGVzdCAqdHN0X3Rlc3Q7Cj4gIAo+IEBA
IC04Myw2ICs4NCw4IEBAIGNvbnN0IGNoYXIgKnRzdF9pcGNfcGF0aCA9IGlwY19wYXRoOwo+ICAK
PiAgc3RhdGljIGNoYXIgc2htX3BhdGhbMTAyNF07Cj4gIAo+ICtzdGF0aWMgaW50IG1vZHVsZXNf
bG9hZGVkW01PRFVMRVNfTUFYX0xFTl07Cj4gKwo+ICBpbnQgVFNUX0VSUjsKPiAgaW50IFRTVF9Q
QVNTOwo+ICBsb25nIFRTVF9SRVQ7Cj4gQEAgLTExMzUsNiArMTEzOCwyOSBAQCBzdGF0aWMgdm9p
ZCBkb19jZ3JvdXBfcmVxdWlyZXModm9pZCkKPiAgCXRzdF9jZ19pbml0KCk7Cj4gIH0KPiAgCj4g
Ky8qCj4gKyAqIFNlYXJjaCBrZXJuZWwgZHJpdmVyIGluIC9wcm9jL21vZHVsZXMuCj4gKyAqCj4g
KyAqIEBwYXJhbSBkcml2ZXIgVGhlIG5hbWUgb2YgdGhlIGRyaXZlci4KPiArICogQHJldHVybiAx
IGlmIGRyaXZlciBpcyBmb3VuZCwgb3RoZXJ3aXNlIDAuCj4gKyAqLwo+ICtzdGF0aWMgaW50IG1v
ZHVsZV9sb2FkZWQoY29uc3QgY2hhciAqZHJpdmVyKQo+ICt7Cj4gKwljaGFyIGxpbmVbNDA5Nl07
Cj4gKwlpbnQgZm91bmQgPSAwOwo+ICsJRklMRSAqZmlsZSA9IFNBRkVfRk9QRU4oIi9wcm9jL21v
ZHVsZXMiLCAiciIpOwo+ICsKPiArCXdoaWxlIChmZ2V0cyhsaW5lLCBzaXplb2YobGluZSksIGZp
bGUpKSB7Cj4gKwkJaWYgKHN0cnN0cihsaW5lLCBkcml2ZXIpKSB7CgpJcyB0aGlzIHJlYWx5IG9r
YXk/IFdoYXQgaWYgYSBtb2R1bGUgbmFtZSBpcyBhIHN1YnN0cmluZyBvZiBvdGhlcgptb2R1bGU/
IFdlIGhhdmUgbW9kdWxlIG5hbWVzIHRoYXQgYXIgYXMgc2hvcnQgYXMgdHdvIGxldHRlcnMsIGZv
cgppbnN0YW5jZSB3aXRoICdzZycgb3IgJ2FjJyB0aGVyZSBxdWl0ZSBhIGJpdCBvZiByb29tIGZv
ciBlcnJvci4KCldlIHJlYWxseSBuZWVkIHRvIGZpbmQgZmlyc3Qgd2hpdGVzcGFjZSBpbiB0aGUg
bGluZSBhbmQgcmVwbGFjZSBpdCB3aXRoCidcMCcgdGhlbiBkbyBzdHJjbXAoKS4KCkFuZCB3ZSBo
YXZlIHRvIGRvIHRoZSAnXycgYW5kICctJyBwZXJtdXRhdGlvbnMgYXMgd2VsbCwgYXMgd2UgZG8g
aW4gdGhlCmNvZGUgdGhhdCBjaGVja3MgZm9yIGJ1aWxkaW4gbW9kdWxlcy4KCk1heWJlIHdlIG5l
ZWQgbW9kdWxlX3N0cmNtcCgpLCB0aGF0IHdvdWxkIHdvcmsgbGlrZSBzdHJjbXAoKSBidXQgd291
bGQKaGFuZGxlIHRoZSAnLScgYW5kICdfJyBhcyB0aGUgc2FtZSBsZXR0ZXIuCgo+ICsJCQlmb3Vu
ZCA9IDE7Cj4gKwkJCWJyZWFrOwo+ICsJCX0KPiArCX0KPiArCVNBRkVfRkNMT1NFKGZpbGUpOwo+
ICsKPiArCXJldHVybiBmb3VuZDsKPiArfQo+ICsKPiAgc3RhdGljIHZvaWQgZG9fc2V0dXAoaW50
IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiAgewo+ICAJaWYgKCF0c3RfdGVzdCkKPiBAQCAtMTE5NCw2
ICsxMjIwLDIwIEBAIHN0YXRpYyB2b2lkIGRvX3NldHVwKGludCBhcmdjLCBjaGFyICphcmd2W10p
Cj4gIAkJCXNhZmVfY2hlY2tfZHJpdmVyKG5hbWUpOwo+ICAJfQo+ICAKPiArCWlmICh0c3RfdGVz
dC0+bW9kcHJvYmUpIHsKPiArCQljb25zdCBjaGFyICpuYW1lOwo+ICsJCWludCBpOwo+ICsKPiAr
CQlmb3IgKGkgPSAwOyAobmFtZSA9IHRzdF90ZXN0LT5tb2Rwcm9iZVtpXSk7ICsraSkgewo+ICsJ
CQkvKiBvbmx5IGxvYWQgbW9kdWxlIGlmIG5vdCBhbHJlYWR5IGxvYWRlZCAqLwo+ICsJCQlpZiAo
IW1vZHVsZV9sb2FkZWQobmFtZSkgJiYgdHN0X2NoZWNrX2J1aWx0aW5fZHJpdmVyKG5hbWUpKSB7
Cj4gKwkJCQljb25zdCBjaGFyICpjb25zdCBjbWRfbW9kcHJvYmVbXSA9IHsibW9kcHJvYmUiLCBu
YW1lLCBOVUxMfTsKPiArCQkJCVNBRkVfQ01EKGNtZF9tb2Rwcm9iZSwgTlVMTCwgTlVMTCk7CgpX
ZSBhcmUgc3VwcG9zZWQgdG8gVENPTkYgaGVyZSBpZiBtb2Rwcm9iZSBmYWlsZWQsIHNvIHdlIGhh
dmUgdG8gY2hlY2sKdGhlIHJldHVybiB2YWx1ZSBhbmQgdHN0X2JyayhUQ09ORiwgIi4uLiIpIHdo
ZW4gaXQncyBub24temVybywgcmlnaHQ/Cgo+ICsJCQkJbW9kdWxlc19sb2FkZWRbaV0gPSAxOwo+
ICsJCQl9Cj4gKwkJfQo+ICsJfQo+ICsKPiAgCWlmICh0c3RfdGVzdC0+bW91bnRfZGV2aWNlKQo+
ICAJCXRzdF90ZXN0LT5mb3JtYXRfZGV2aWNlID0gMTsKPiAgCj4gQEAgLTEzNjIsNiArMTQwMiwx
OSBAQCBzdGF0aWMgdm9pZCBkb19jbGVhbnVwKHZvaWQpCj4gIAo+ICAJdHN0X3N5c19jb25mX3Jl
c3RvcmUoMCk7Cj4gIAo+ICsJaWYgKHRzdF90ZXN0LT5tb2Rwcm9iZSkgewo+ICsJCWNvbnN0IGNo
YXIgKm5hbWU7Cj4gKwkJaW50IGk7Cj4gKwo+ICsJCWZvciAoaSA9IDA7IChuYW1lID0gdHN0X3Rl
c3QtPm1vZHByb2JlW2ldKTsgKytpKSB7Cj4gKwkJCWlmICghbW9kdWxlc19sb2FkZWRbaV0pCj4g
KwkJCQljb250aW51ZTsKPiArCj4gKwkJCWNvbnN0IGNoYXIgKmNvbnN0IGNtZF9ybW1vZFtdID0g
eyJybW1vZCIsIG5hbWUsIE5VTEx9OwoKbW9kcHJvYmUgLXIgcGxlYXNlLCBybW1vZCBoYXMgYmVl
biBkZXByZWNhdGVkIGZvciBhZ2VzLgoKPiArCQkJU0FGRV9DTUQoY21kX3JtbW9kLCBOVUxMLCBO
VUxMKTsKPiArCQl9Cj4gKwl9Cj4gKwo+ICAJaWYgKHRzdF90ZXN0LT5yZXN0b3JlX3dhbGxjbG9j
aykKPiAgCQl0c3Rfd2FsbGNsb2NrX3Jlc3RvcmUoKTsKPiAgCj4gLS0gCj4gMi40Mi4wCj4gCj4g
Cj4gLS0gCj4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
