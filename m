Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3FD1BE68E
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 20:47:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D7A73C5ECD
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 20:47:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 565603C27EE
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 20:47:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C8E27601A0C
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 20:47:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A1625AD41;
 Wed, 29 Apr 2020 18:47:41 +0000 (UTC)
Date: Wed, 29 Apr 2020 20:47:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200429184740.GA26302@dell5510>
References: <20200423131632.20525-1-pvorel@suse.cz>
 <20200423131632.20525-3-pvorel@suse.cz>
 <8b3ae56d-1c28-e43b-abea-963a32fff8f6@oracle.com>
 <20200429104129.GA685@dell5510>
 <638d88f6-d140-8982-1555-c83c5adb83e9@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <638d88f6-d140-8982-1555-c83c5adb83e9@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/2] net/route: Add netlink based route change
 tests
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQWxleGV5LAoKPiBQZXJoYXBzIGJya19vbl9yb3V0ZV9lcnJvcigpIGFzIGl0IGhhcyB0c3Rf
YnJrKCk/Cgo+ID4gCWNoYXIgZHN0X3N0cltJTkVUNl9BRERSU1RSTEVOXSwgZ3dfc3RyW0lORVQ2
X0FERFJTVFJMRU5dOwo+ID4gCXRzdF9zb2NrX2FkZHIoZHN0LCBzaXplb2YoZHN0KSwgZHN0X3N0
ciwgc2l6ZW9mKGRzdF9zdHIpKTsKPiA+IAlpZiAoZ3cpCj4gPiAJCXRzdF9zb2NrX2FkZHIoZ3cs
IHNpemVvZihndyksIGd3X3N0ciwgc2l6ZW9mKGd3X3N0cikpOwoKPiA+IAl0c3RfcmVzKFRJTkZP
LCAidHlwZTogJXMsIGlmYWNlOiAlZCwgZHN0OiAlcywgZ3c6ICVzIiwKPiA+IAkJdHlwZSA9PSBS
VE1fTkVXUk9VVEUgPyAiUlRNX05FV1JPVVRFIiA6ICJSVE1fREVMUk9VVEUiLAo+ID4gCQlpZmFj
ZSwgZHN0X3N0ciwgZ3cgPyBnd19zdHIgOiAibnVsbCIpOwo+ID4gCXRzdF9icmsoVEJST0ssICJm
YWlsZWQgZHVlIHByZXZpb3VzIG5ldGxpbmsgZXJyb3JzIik7Cgo+ICJmYWlsZWQgZHVlIHRvIHRo
ZSBwcmV2aW91cy4uLiIKCgo+IEFsc28sIHdoYXQgYWJvdXQgcGFzc2luZyB0aGUgZXJyb3IgbWVz
c2FnZSB0eXBlIGFuZCBlcnJubyB0byB0aGlzCj4gZnVuY3Rpb24sIGkuZS4gY2hhbmdpbmcgIlRG
QUlMLCBUSU5GTywgVEJST0siIHRvICJUSU5GTywgVEZBSUwiPwoKPiBzdGF0aWMgdm9pZCBicmtf
b25fcm91dGVfZXJyb3IoY29uc3QgY2hhciAqbXNnLCBpbnQgZXJybm8sIGludCBpZmFjZSwgLi4u
Cj4gewo+IC4uLgo+ICAgICAgICAgdHN0X3JlcyhUSU5GTywgIi4uLiIpOwo+IAl0c3RfYnJrKFRG
QUlMLCAiJXMgZmFpbGVkIChlcnJubz0lZCk6ICVzIiwgbXNnLCBlcnJubywgc3RyZXJyb3IoZXJy
bm8pKTsKCi4uLgo+IFRoZW46Cj4gCQlicmtfb25fcm91dGVfZXJyb3IoIm1ubF9zb2NrZXRfb3Bl
biIsIGVycm5vLCBpZmFjZSwgZHN0LCBndywgdHlwZSk7CgpUaGFua3MgZm9yIGEgc3VnZ2VzdGlv
biwgdGhhdCdzIG11Y2ggYmV0dGVyLgoKSSd2ZSBqdXN0IHJlbW92ZWQgZXJybm8gYXMgYSBwYXJh
bWV0ZXIgYW5kIHVzZWQgaXQgZGlyZWN0bHksIGJlY2F1c2UgZ2NjIGNvbXBsYWluZWQ6Cgpyb3V0
ZS1jaGFuZ2UtbmV0bGluay5jOjI0ODo0MTogd2FybmluZzogcGFzc2luZyBhcmd1bWVudCAyIG9m
IOKAmGJya19vbl9yb3V0ZV9lcnJvcuKAmSBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRo
b3V0IGEgY2FzdCBbLVdpbnQtY29udmVyc2lvbl0KICAyNDggfCAgIGJya19vbl9yb3V0ZV9lcnJv
cigibW5sX3NvY2tldF9vcGVuIiwgZXJybm8sIGlmYWNlLAogICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fgogICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGludApJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vLi4vLi4vLi4vaW5j
bHVkZS90c3RfdGVzdC5oOjE3LAogICAgICAgICAgICAgICAgIGZyb20gcm91dGUtY2hhbmdlLW5l
dGxpbmsuYzo3Ogpyb3V0ZS1jaGFuZ2UtbmV0bGluay5jOjE4MDo1Mzogbm90ZTogZXhwZWN0ZWQg
4oCYaW50ICogKCopKCnigJkgYnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUg4oCYaW504oCZCiAgMTgw
IHwgc3RhdGljIHZvaWQgYnJrX29uX3JvdXRlX2Vycm9yKGNvbnN0IGNoYXIgKm1zZywgaW50IGVy
cm5vLCBpbnQgaWZhY2UsCgpJJ2xsIHNlbmQgdjYsIHdoaWNoIGhvcGVmdWxseSBjb3VsZCBiZSBm
aW5hbCB2ZXJzaW9uLgoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
