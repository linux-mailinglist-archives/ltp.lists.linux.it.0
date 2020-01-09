Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC08135991
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 13:56:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2A683C24A7
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 13:56:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8D6BC3C2387
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 13:56:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0F9E91000C0B
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 13:56:19 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B7417B2387;
 Thu,  9 Jan 2020 12:56:16 +0000 (UTC)
Date: Thu, 9 Jan 2020 13:56:15 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200109125615.GA11609@dell5510>
References: <20200109071510.11223-1-liwang@redhat.com>
 <20200109095239.GB31981@rei.lan>
 <CAEemH2eBO5WywEvBJKyEpVCky05CHp-JpwpFUSgAUjTx8GAKtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eBO5WywEvBJKyEpVCky05CHp-JpwpFUSgAUjTx8GAKtQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: use raw syscall in the tst_device.h
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+ID4gPiArI2RlZmluZSBfR05VX1NPVVJDRQo+ID4gPiAgI2luY2x1ZGUgPHVuaXN0ZC5o
Pgo+ID4gPiArI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+Cgo+ID4gRGVmaW5pbmcgX0dOVV9TT1VS
Q0UgYW55d2hlcmUgYnV0IGF0IHRoZSB0b3Agb2YgdGhlIHRlc3Qgc291cmNlIGlzCj4gPiBtZWFu
aW5nbGVzcy4gSXQgaGFzIHRvIGJlIGRlZmluZWQgYmVmb3JlIHdlIGluY2x1ZGUgYW55IGxpYmMg
aGVhZGVycwo+ID4gb3RoZXJ3aXNlIGl0J3MgaWdub3JlZC4KCgo+IEkgZ290IHRoZSBwb2ludC4g
QW5kIHllcywgdGhhdCBtZWFucyB0aGUgZGVmaW5pdGlvbiBzaG91bGQgYmUgcmVtb3ZlZCBmcm9t
Cj4gdGhlIHRzdF9kZXZpY2UuaCBoZWFkZXIgZmlsZS4KCgo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYWR2aXNlL3Bvc2l4X2ZhZHZpc2UwMS5jCi4uLgo+ID4g
PiArI2RlZmluZSBfR05VX1NPVVJDRQo+ID4gPiAgI2RlZmluZSBfWE9QRU5fU09VUkNFIDYwMAo+
ID4gPiAgI2luY2x1ZGUgPGZjbnRsLmg+Cgo+ID4gV2h5IGRvIHdlIG5lZWQgdGhlIF9HTlVfU09V
UkNFIGhlcmU/IFdlIHN3aXRjaGVkIHRvIGEgc3lzY2FsbCgpIGluIHRoZQo+ID4gaGVhZGVyLCBo
ZW5jZSB3ZSBkbyBub3QgbmVlZCB0aGUgc3luY2ZzKCkgcHJvdG90eXBlIGFueW1vcmUuCgoKPiBC
dXQgc2hvdWxkbid0IHdlIGRlZmluZSB0aGUgX0dOVV9TT1VSQ0UgZm9yIHN5c2NhbGwoKT8gIE90
aGVyd2lzZSwKPiB0aGUgX1hPUEVOX1NPVVJDRSA2MDAgZGVmaW5pdGlvbnMgd2lsbCB0YWtlIGVm
ZmVjdCBhbmQgbWFrZXMgdGhlIGNvbXBpbGVyCj4gcHJpbnQgbmV3IGVycm9yc1sxXS4KQ29ycmVj
dCwgc3lzY2FsbCgpIHJlcXVpcmVzIF9HTlVfU09VUkNFIGFuZCA8dW5pc3RkLmg+LgorIE5vdCBz
dXJlIGlmIDxzeXMvc3lzY2FsbC5oPiBzaG91bGQgYmUgdXNlZCAoYXMgaXQncyBpbiB5b3VyIHBh
dGNoIG9yCmxhcGkvc3lzY2FsbHMuaC4KCj4gSGVyZSBJIGZlZWwgYSBsaXR0bGUgY29uZnVzZWQs
IG9yIGRvIHdlIG5lZWQgdG8gZGVsZXRlIHRoZSBfWE9QRU5fU09VUkNFCj4gZGVmaW5pdGlvbiBk
aXJlY3RseSBmb3IgdGhlIHRlc3QgcG9zaXhfZmFkdmlzZTAxLmM/Cgo+IFsxXToKPiBnY2MgLVdl
cnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbiAtZyAtTzIgLWZuby1zdHJpY3QtYWxp
YXNpbmcgLXBpcGUKPiAtV2FsbCAtVyAtV29sZC1zdHlsZS1kZWZpbml0aW9uCj4gIC1JL3Jvb3Qv
bHRwMi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZhZHZpc2UKPiAtSS9yb290L2x0cDIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYWR2aXNlLy4uL3V0aWxzCj4gLUkuLi8uLi8uLi8uLi9p
bmNsdWRlIC1JLi4vLi4vLi4vLi4vaW5jbHVkZSAtSS4uLy4uLy4uLy4uL2luY2x1ZGUvb2xkLwo+
IC1MLi4vLi4vLi4vLi4vbGliICBwb3NpeF9mYWR2aXNlMDEuYyAgIC1sbHRwIC1vIHBvc2l4X2Zh
ZHZpc2UwMQo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi8uLi8uLi8uLi9pbmNsdWRlL3RzdF90
ZXN0Lmg6MjIsCj4gICAgICAgICAgICAgICAgICBmcm9tIHBvc2l4X2ZhZHZpc2UwMS5jOjMxOgo+
IC4uLy4uLy4uLy4uL2luY2x1ZGUvdHN0X2RldmljZS5oOiBJbiBmdW5jdGlvbiDigJh0c3RfZGV2
X3N5bmPigJk6Cj4gLi4vLi4vLi4vLi4vaW5jbHVkZS90c3RfZGV2aWNlLmg6ODI6OTogZXJyb3I6
IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mCj4gZnVuY3Rpb24g4oCYc3lzY2FsbOKAmTsgZGlkIHlv
dSBtZWFuIOKAmHN0cmNvbGzigJk/Cj4gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCj4gICByZXR1cm4gc3lzY2FsbChfX05SX3N5bmNmcywgZmQpOwo+ICAgICAgICAgIF5+
fn5+fn4KPiAgICAgICAgICBzdHJjb2xsCgorIE91ciBzeXNjYWxsIG51bWJlcnMgaW4gaW5jbHVk
ZS9sYXBpL3N5c2NhbGxzLyBhcmUgb3V0ZGF0ZWQgKHN5bmNmcyBpcyBub3QgYXQKbGVhc3QgaW4g
aW5jbHVkZS9sYXBpL3N5c2NhbGxzL3NwYXJjezY0LH0uaW4gYW5kCmluY2x1ZGUvbGFwaS9zeXNj
YWxscy94ODZfNjQuaW4pLgoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
