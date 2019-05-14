Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A52111CB58
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 17:06:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 810C53EA0A1
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 17:06:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 97EB23EA0A1
 for <ltp@lists.linux.it>; Tue, 14 May 2019 17:06:22 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 891471A01170
 for <ltp@lists.linux.it>; Tue, 14 May 2019 17:06:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F2624AE8D;
 Tue, 14 May 2019 15:06:20 +0000 (UTC)
Date: Tue, 14 May 2019 17:06:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190514150619.GA4394@rei.lan>
References: <20190508084447.18191-1-liwang@redhat.com>
 <20190509071605.GB6096@dhcp-9-109-247-167.in.ibm.com>
 <CAEemH2e=9eRgj_1H50dY_=fEsL3vsZbxexxUceJhW24ebsQ1Kg@mail.gmail.com>
 <20190509091911.GA8751@dhcp-9-109-247-167.in.ibm.com>
 <CAEemH2e6WURWFkMneL6vdEwPpbwxj0Lt=HjpfSYdyzxnhGdODQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2e6WURWFkMneL6vdEwPpbwxj0Lt=HjpfSYdyzxnhGdODQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] numa: fix numa test error with
 non-continuous nodes
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

SGkhCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9udW1hL251bWEwMS5zaAo+ID4g
Yi90ZXN0Y2FzZXMva2VybmVsL251bWEvbnVtYTAxLnNoCj4gPiBpbmRleCAzMzM5M2FjOGQuLjQ3
YzE4ZWRkNiAxMDA3NTUKPiA+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvbnVtYS9udW1hMDEuc2gK
PiA+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvbnVtYS9udW1hMDEuc2gKPiA+IEBAIC05NCw2ICs5
NCw3IEBAIHNldHVwKCkKPiA+ICB0ZXN0MSgpCj4gPiAgewo+ID4gICAgICAgICBNZW1fY3Vycj0w
Cj4gPiArICAgICAgIG5vZGVfaW5kZXg9MAo+ID4KPiA+ICAgICAgICAgZm9yIG5vZGUgaW4gJG5v
ZGVzX2xpc3Q7IGRvCj4gPiAgICAgICAgICAgICAgICAgbnVtYWN0bCAtLWNwdW5vZGViaW5kPSRu
b2RlIC0tbWVtYmluZD0kbm9kZSBzdXBwb3J0X251bWEKPiA+IGFsbG9jXzFNQiAmCj4gPiBAQCAt
MTAxLDcgKzEwMiw4IEBAIHRlc3QxKCkKPiA+Cj4gPiAgICAgICAgICAgICAgICAgVFNUX1JFVFJZ
X0ZVTkMgImNoZWNrX2Zvcl9zdXBwb3J0X251bWEgJHBpZCIgMAo+ID4KPiA+IC0gICAgICAgICAg
ICAgICBNZW1fY3Vycj0kKGVjaG8gIiQoZXh0cmFjdF9udW1hc3RhdF9wICRwaWQgJG5vZGUpICog
JE1CIgo+ID4gfGJjKQo+ID4gKyAgICAgICAgICAgICAgIE1lbV9jdXJyPSQoZWNobyAiJChleHRy
YWN0X251bWFzdGF0X3AgJHBpZCAkbm9kZV9pbmRleCkgKgo+ID4gJE1CIiB8YmMpCj4gPiArICAg
ICAgICAgICAgICAgbGV0IG5vZGVfaW5kZXgrKwo+ID4KPiAKPiBJIGd1ZXNzIGl0IGNhbiBiZSB3
b3JrLCBidXQgdGhlIGRpc2FkdmFudGFnZSBvZiB0aGF0IGlzIHdlIGhhdmUgdG8gaW52b2x2ZQo+
IGEgbmV3IHZhcmlhYmxlKG5vZGVfaW5kZXgpIGluIGVhY2ggb2YgdGhlIHRlc3RzIChmcm9tIHRl
c3QxIHRvIHRlc3QxMCkuCj4gSGVuY2UgSSBkb24ndCB0aGluayBpdCBpcyBtdWNoIGJldHRlciB0
aGFuIG15IHBhdGNoLiBGb3Igd2hpY2ggd2F5IHRvIGdvLAo+IEknZCBsZWF2ZSB0aGlzIHRvIEN5
cmlsIHRvIG1ha2UgYSBjaG9pY2UuIE9yLCBtYXliZSBoZSBoYXMgZGlmZmVyZW50Cj4gdGhvdWdo
dHMgb24gdGhpczopLgoKSSBhY3R1YWxseSBkbyBub3QgY2FyZSB0aGF0IG11Y2ggYWJvdXQgdGhl
IG51bWEwMS5zaCB0ZXN0cywgYmVjYXVzZQp0aGVzZSBhcmUgYnJva2VuIGluIG1vcmUgd2F5cyB0
aGFuIHRoaXMgYW5kIHdlcmUgbmV2ZXIgY29ycmVjdCB0byBiZWdpbgp3aXRoLgoKSSd2ZSBzdGFy
dGVkIHRvIHJld3JpdGUgdGhlc2UgaW50byBwcm9wZXIgdGVzdHMsIHRoZSBzZXRfbWVtcG9saWN5
KCkgd2FzCmZpcnN0IHBhcnQgb2YgdGhhdCBlZmZvcnQsIHRoZSBtYmluZCgpIHRlc3RzIGFyZSBj
b250aW51YXRpb24gb2YgdGhhdAphbmQgdGhlIGVuZCBnb2FsIGlzIHRvIGdldCByaWQgb2YgdGhl
c2UgYnJva2VuIHRlc3RzIGV2ZW50dWFsbHkuCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3Vz
ZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
