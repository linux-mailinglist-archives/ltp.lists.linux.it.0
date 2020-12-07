Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C9D2D0E2F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 11:41:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62F213C6274
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 11:41:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C0AB53C04C3
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 11:41:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 400451400544
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 11:41:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3FBC2AC90;
 Mon,  7 Dec 2020 10:41:34 +0000 (UTC)
References: <20191115101039.43386-1-lkml@jv-coder.de>
 <a42725d1-1469-e71f-e28d-1eff42e3e86d@jv-coder.de>
 <87blfxpdf8.fsf@suse.de>
 <c9d59aa0-3589-0dff-8dc1-b4792b1bfaa6@jv-coder.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <c9d59aa0-3589-0dff-8dc1-b4792b1bfaa6@jv-coder.de>
Date: Mon, 07 Dec 2020 10:41:33 +0000
Message-ID: <877dptj3tu.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gSm9lcmcsCgpKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdyaXRlczoKCj4g
SGksCj4gT24gMTEvMTYvMjAyMCAzOjQ2IFBNLCBSaWNoYXJkIFBhbGV0aG9ycGUgd3JvdGU6Cj4+
IElmIHRoZSBzeXN0ZW0gaGFzIGFscmVhZHkgc2V0IGV4Y2x1c2l2ZSBjcHVzIHRoZW4gaXQgaXMg
dW5saWtlbHkgdGhpcwo+PiByZWdyZXNzaW9uIGVmZmVjdHMgaXQuIEVpdGhlciB0aGUga2VybmVs
IGhhcyBiZWVuIHBhdGNoZWQgb3IgdGhlIHN5c3RlbQo+PiBtYW5hZ2VyIGNvbmZpZ3VyZXMgdGhl
IGNwdXMgZmlyc3QgYmVmb3JlIHNldHRpbmcgdGhlIGV4Y2x1c2l2ZSBrbm9iLgo+IFllcyAiZWl0
aGVyIG9yIi4gSWYgdGhlIHN5c3RlbSBtYW5hZ2VyIG9yIHdoYXRldmVyIGNvbmZpZ3VyZWQgdGhl
Cj4gY2dyb3VwcyBkaWQgaXQgaW4gdGhlCj4gInJpZ2h0IiBvcmRlciwgdGhhdCBjYW5ub3QgdHJp
Z2dlciB0aGUgYnVnLCB3ZSBkbyBub3Qga25vdywgaWYgdGhlIGJ1Zwo+IHN0aWxsIGV4aXN0cy4K
ClllcyBhbmQgdGhpcyBpcyB3aHkgSSB3b3VsZCBub3JtYWxseSBzYXkgd2Ugc2hvdWxkIHN0aWxs
IHRyeSB0byBmaW5kIHRoZQpidWcuCgo+Cj4+IE5vcm1hbGx5IEkgd291bGQgc2F5IHRoZSB0ZXN0
IHNob3VsZCB0cnkgdG8gcnVuIGFueXdheSwgYnV0IHlvdSBhcmUKPj4gaGF2aW5nIHRvIG1ha2Ug
c29tZSBpbnRydXNpdmUgY2hhbmdlcyB0byB0aGUgY2dyb3VwIHNldHVwIHdoaWNoIGNvdWxkCj4+
IGxlYWQgdG8gb3RoZXIgcHJvYmxlbXMuCj4+Cj4+IFNvIHdoeSBub3QganVzdCBjYWxsICd0c3Rf
YnJrIFRDT05GJyBpZiB0aGUgc3lzdGVtIGFscmVhZHkgaGFzIGV4Y2x1c2l2ZQo+PiBjcHVzIGNv
bmZpZ3VyZWQ/Cj4gVGhlIHF1ZXN0aW9uIGlzLCBzaG91bGQgbHRwIHRyeSBoYXJkIHRvIHJ1biBh
IHRlc3Qgb3Igbm90LiBZb3UgbWF5IGJlIHJpZ2h0LAo+IHRoYXQgdGhpcyBjb3VsZCBoYXZlIG90
aGVyIGVmZmVjdHMsIGJ1dCBsdHAgdGVzdHMgY2FuIGNyYXNoIGEgc3lzdGVtIGFueXdheSwKPiBz
byBJIHdvdWxkbid0IHdvcnJ5IGFib3V0IHRoYXQuIE9mIGNvdXJzZSBUQ09ORiB3b3VsZCBiZSBz
aW1wbGVyLCBidXQKPiBpdCB3b3VsZAo+IGFsc28gc2tpcCB0aGUgdGVzdC4uLgoKSW4gZ2VuZXJh
bCB3ZSBoYXZlIHRoZSBydWxlIHRoYXQgdGVzdHMgc2hvdWxkIHRyeSB0byBsZWF2ZSB0aGUgc3lz
dGVtIGluCmEgd29ya2luZyBzdGF0ZS4gU29tZXRpbWVzIHRoYXQgaXMgbm90IHBvc3NpYmxlLCBi
dXQgdGhhdCBpcyB1c3VhbGx5Cm9ubHkgaWYgYSB0ZXN0IHRyaWdnZXJzIGEgc2VyaW91cyBpc3N1
ZS4KCj4KPiBEbyB5b3UgaGF2ZSBhIHNjZW5hcmlvIGluIG1pbmQsIHdoZXJlIGNoYW5naW5nIHRo
ZSBjcHVzZXRzIGNvdWxkIHBvdGVudGlhbGx5Cj4gY2F1c2UgcHJvYmxlbXM/IFRoaXMgd291bGQg
cmVxdWlyZSBhIHN5c3RlbSwgd2hlcmUgc29tZXRoaW5nIG1lYW5pbmdmdWwgaXMKPiBydW5uaW5n
LCB0aGF0IHJlcXVpcmVzIHNwZWNpZmljIGNwdSB0aW1lIG9yIGEgc3BlY2lmaWMgY3B1LiBCdXQg
aWYKPiB0aGF0IHdvdWxkCj4gYmUgdGhlIGNhc2UsIGFsbCBsdHAgdGVzdHMgY291bGQgaW50ZXJm
ZXJlIHdpdGggaXQgcmlnaHQ/Cj4KPiBKw7ZyZwoKSWYgd2UgYXNzdW1lIHRoZXJlIGlzIGEgZ29v
ZCByZWFzb24gZm9yIGhhdmluZyBleGNsdXNpdmUgY3B1c2V0cywgZXZlbgppZiB3ZSBkb24ndCBr
bm93IHRoYXQgcmVhc29uLCB0aGVuIHdlIGNhbid0IGp1c3QgcmVtb3ZlIHRoZW0gYW5kIGV4cGVj
dAp0aGUgc3lzdGVtIHRvIGNvbnRpbnVlIHdvcmtpbmcuIFBvc3NpYmx5IGl0IHdpbGwgZXZlbiBj
YXVzZSBlcnJvcnMgaW4KbGF0ZXIgdW5yZWxhdGVkIHRlc3RzIGFuZCBpdCB3aWxsIHRha2Ugc29t
ZSB0aW1lIGZvciBzb21lYm9keSB0byBmaWd1cmUKb3V0IHRoYXQgaXQgaXMgZHVlIHRvIGEgcHJv
Y2VzcyBydW5uaW5nIG9uIHRoZSB3cm9uZyBDUFUuCgpJIGFzc3VtZSB0aGF0IGlmIGEgcGFydGlj
dWxhciBDR3JvdXAgaGFzIGV4Y2x1c2l2ZSBDUFUgYWNjZXNzIHRoZW4KcHJvY2Vzc2VzIGluIHRo
ZSByb290IENHcm91cCB3aWxsIG5vdCBydW4gaW4gaXQuIEhvd2V2ZXIgaWYgdGhleSBkbyB0aGVu
CnRoZSB1c2VyIG1heSBydW4gTFRQIHRlc3RzIGluIGEgbGVhZiBDR3JvdXAuIFNvIHlvdSBjYW4n
dCBhc3N1bWUgYWxsCnRlc3RzIHdvdWxkIGJyZWFrIHN1Y2ggYSBzeXN0ZW0uCgpPVE9IIFRDT05G
IGlzIG9mdGVuIGlnbm9yZWQsIGJ1dCB0aGlzIHNlZW1zIGxpa2UgcXVpdGUgYSBzbWFsbCBhbmQK
dHJpY2t5IGNvcm5lciBjYXNlIHRoYXQgd2UgYXJlIGFkZGluZyBjb21wbGV4aXR5IGZvci4KCi0t
IApUaGFuayB5b3UsClJpY2hhcmQuCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
