Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 417572CEC45
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 11:32:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC3CB3C58F0
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 11:32:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E30EA3C2A0C
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 11:32:06 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 53F9C1A0154D
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 11:32:06 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 8E5049F763;
 Fri,  4 Dec 2020 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1607077924; bh=MxvPvgtuV1ke2p/69lh1Vd+s4LXsSbWPKksJ2+sUI6o=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=QJMVSCgT3Vj3lFD7enOL5G3q/jwwpVvwXTt/OUr44iLyCzbK57fE/cl87mfTDjNB0
 G4tMNMIAbbk1nTRaRRXig6QBtnujsjvcu+7eME7UiITAIAy9sqkN7AiONuaIOeDKVT
 QuSGDNk+8gePm88HCX3+TA1q67xVuVAL6TTpRj1w=
To: rpalethorpe@suse.de
References: <20191115101039.43386-1-lkml@jv-coder.de>
 <a42725d1-1469-e71f-e28d-1eff42e3e86d@jv-coder.de> <87blfxpdf8.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <c9d59aa0-3589-0dff-8dc1-b4792b1bfaa6@jv-coder.de>
Date: Fri, 4 Dec 2020 11:32:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <87blfxpdf8.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] cpuset_regression_test: Fix for already existing
 cpusets
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCk9uIDExLzE2LzIwMjAgMzo0NiBQTSwgUmljaGFyZCBQYWxldGhvcnBlIHdyb3RlOgo+IElm
IHRoZSBzeXN0ZW0gaGFzIGFscmVhZHkgc2V0IGV4Y2x1c2l2ZSBjcHVzIHRoZW4gaXQgaXMgdW5s
aWtlbHkgdGhpcwo+IHJlZ3Jlc3Npb24gZWZmZWN0cyBpdC4gRWl0aGVyIHRoZSBrZXJuZWwgaGFz
IGJlZW4gcGF0Y2hlZCBvciB0aGUgc3lzdGVtCj4gbWFuYWdlciBjb25maWd1cmVzIHRoZSBjcHVz
IGZpcnN0IGJlZm9yZSBzZXR0aW5nIHRoZSBleGNsdXNpdmUga25vYi4KWWVzICJlaXRoZXIgb3Ii
LiBJZiB0aGUgc3lzdGVtIG1hbmFnZXIgb3Igd2hhdGV2ZXIgY29uZmlndXJlZCB0aGUgCmNncm91
cHMgZGlkIGl0IGluIHRoZQoicmlnaHQiIG9yZGVyLCB0aGF0IGNhbm5vdCB0cmlnZ2VyIHRoZSBi
dWcsIHdlIGRvIG5vdCBrbm93LCBpZiB0aGUgYnVnIApzdGlsbCBleGlzdHMuCgo+IE5vcm1hbGx5
IEkgd291bGQgc2F5IHRoZSB0ZXN0IHNob3VsZCB0cnkgdG8gcnVuIGFueXdheSwgYnV0IHlvdSBh
cmUKPiBoYXZpbmcgdG8gbWFrZSBzb21lIGludHJ1c2l2ZSBjaGFuZ2VzIHRvIHRoZSBjZ3JvdXAg
c2V0dXAgd2hpY2ggY291bGQKPiBsZWFkIHRvIG90aGVyIHByb2JsZW1zLgo+Cj4gU28gd2h5IG5v
dCBqdXN0IGNhbGwgJ3RzdF9icmsgVENPTkYnIGlmIHRoZSBzeXN0ZW0gYWxyZWFkeSBoYXMgZXhj
bHVzaXZlCj4gY3B1cyBjb25maWd1cmVkPwpUaGUgcXVlc3Rpb24gaXMsIHNob3VsZCBsdHAgdHJ5
IGhhcmQgdG8gcnVuIGEgdGVzdCBvciBub3QuIFlvdSBtYXkgYmUgcmlnaHQsCnRoYXQgdGhpcyBj
b3VsZCBoYXZlIG90aGVyIGVmZmVjdHMsIGJ1dCBsdHAgdGVzdHMgY2FuIGNyYXNoIGEgc3lzdGVt
IGFueXdheSwKc28gSSB3b3VsZG4ndCB3b3JyeSBhYm91dCB0aGF0LiBPZiBjb3Vyc2UgVENPTkYg
d291bGQgYmUgc2ltcGxlciwgYnV0IGl0IAp3b3VsZAphbHNvIHNraXAgdGhlIHRlc3QuLi4KCkRv
IHlvdSBoYXZlIGEgc2NlbmFyaW8gaW4gbWluZCwgd2hlcmUgY2hhbmdpbmcgdGhlIGNwdXNldHMg
Y291bGQgcG90ZW50aWFsbHkKY2F1c2UgcHJvYmxlbXM/IFRoaXMgd291bGQgcmVxdWlyZSBhIHN5
c3RlbSwgd2hlcmUgc29tZXRoaW5nIG1lYW5pbmdmdWwgaXMKcnVubmluZywgdGhhdCByZXF1aXJl
cyBzcGVjaWZpYyBjcHUgdGltZSBvciBhIHNwZWNpZmljIGNwdS4gQnV0IGlmIHRoYXQgCndvdWxk
CmJlIHRoZSBjYXNlLCBhbGwgbHRwIHRlc3RzIGNvdWxkIGludGVyZmVyZSB3aXRoIGl0IHJpZ2h0
PwoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
