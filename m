Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D02C338A21
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 14:25:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 973393EA6F2
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 14:25:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 888C63EA603
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 14:25:11 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B385F60117E
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 14:25:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A1E64AD47
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 12:25:08 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
References: <20190604072228.17513-1-camann@suse.com>
 <20190606121436.GB27083@rei> <7c7bf785-adbd-d69b-c17b-bc65c2228d11@suse.com>
 <20190607113537.GA13869@rei.lan>
 <7824ed12-432a-4a02-395f-a0a2afbb0134@suse.com>
 <20190607121212.GC13869@rei.lan>
 <619a244a-cb0a-6dd9-fdb4-7c4a2fca6640@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=camann@suse.com; keydata=
 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
 du2mz1Q=
Message-ID: <cfb154f3-aa67-d148-208c-4f3cf760904e@suse.com>
Date: Fri, 7 Jun 2019 14:25:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <619a244a-cb0a-6dd9-fdb4-7c4a2fca6640@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/acct02: add functional testcase
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

T24gMDcvMDYvMjAxOSAxNDoxMiwgQ3lyaWwgSHJ1YmlzIHdyb3RlOgo+PiBIaSEKPj4+Pj4geWVz
LCBJIGhhdmUgdGVzdGVkIGl0IG9uIGEgc3lzdGVtIGxpa2UgeW91IGRlc2NyaWJlIGJ1dCBJIHJl
Y2VpdmUgYQo+Pj4+PiBwb3NpdGl2ZSBvdXRwdXQ6Cj4+Pj4+Cj4+Pj4+IHRzdF9rY29uZmlnLmM6
NjI6IElORk86IFBhcnNpbmcga2VybmVsIGNvbmZpZyAnL3Byb2MvY29uZmlnLmd6Jwo+Pj4+PiB0
c3RfdGVzdC5jOjExMTE6IElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAwaCAwNW0gMDBzCj4+Pj4+
IHRzdF9rY29uZmlnLmM6NjI6IElORk86IFBhcnNpbmcga2VybmVsIGNvbmZpZyAnL3Byb2MvY29u
ZmlnLmd6Jwo+Pj4+PiBhY2N0MDIuYzoxNTk6IElORk86IFZlcmlmeWluZyB1c2luZyAnc3RydWN0
IGFjY3QnCj4+Pj4+IGFjY3QwMi5jOjEzNzogSU5GTzogTnVtYmVyIG9mIGFjY291bnRpbmcgZmls
ZSBlbnRyaWVzIHRlc3RlZDogMQo+Pj4+PiBhY2N0MDIuYzoxNDA6IFBBU1M6IGFjY3QoKSB3cm90
ZSBjb3JyZWN0IGZpbGUgY29udGVudHMhCj4+Pj4+Cj4+Pj4+IFRoZXJlIHNlZW1zIHRvIGJlIHNv
bWV0aGluZyBlbHNlIGdvaW5nIHdyb25nLiBJIHdpbGwgaW52ZXN0aWdhdGUgdGhpcy4KPj4+PiBN
YXkgYmUgc29tZXRoaW5nIHdyb25nIGF0IG15IGVuZCBhcyB3ZWxsLCB3aGF0IGtlcm5lbCB2ZXJz
aW9ucyBoYXZlIHlvdQo+Pj4+IHRlc3RlZD8gQXQgbXkgZW5kIEkgdGVzdGVkIDQuMjAuCj4+Pj4K
Pj4+IEkgaGF2ZSBhIDQuMTkga2VybmVsIHg4Nl82NCBtYWNoaW5lIHJ1bm5pbmcgYW5kIEkgZG91
YmxlIGNoZWNrZWQgdGhhdCBJCj4+PiBoYXZlIHRoZSBzYW1lIGNvbmZpZ3MgYXMgeW91IGhhdmUg
cHJvdmlkZWQuCj4+Pgo+Pj4gU3RpbGwsIEkgaGF2ZSBhIGhhcmQgdGltZSByZXByb2R1Y2luZyB0
aGUgZXJyb3IuCj4+IExvb2tzIGxpa2UgdGhpcyBpcyB2ZXJ5IHNwZWNpZmljIGVycm9yIHRoYXQg
aGFwcGVucyBmb3IgbWUgc2luY2UgSSBoYXZlCj4+IC9tbnQgb24gbXkgcm9vdGZzLCBpdCB3b3Jr
cyBmb3IgYW55IG90aGVyIGZpbGVzeXN0ZW0gSSd2ZSB0cmllZCB0aG91Z2guCj4+Cj4+IEkgZ3Vl
c3MgdGhhdCB3ZSBjYW4gZ28gYWhlYWQgYW5kIHB1c2ggdGhlIHRlc3QgdGhlbi4KPiBNYXliZSB3
ZSBzaG91bGQgaW52ZXN0aWdhdGUgdGhpcyBhIGxpdHRsZSBtb3JlLCBmaXJzdC4gSSBoYXZlIG1h
bmFnZWQgdG8KPiByZXByb2R1Y2UgdGhlIGVycm9yIG9uIHR3byBvZiBteSBzeXN0ZW1zLiBCb3Ro
IG9mIHRoZW0gaGF2ZcKgCj4gQ09ORklHX0JTRF9QUk9DRVNTX0FDQ1RfVjMgZW5hYmxlZCBhbmQg
bm8gcm9vdGZzIG1vdW50cy4KPgo+IEtlcm5lbCBpcyA0LjIgaW4gYm90aCBjYXNlcy4KPgo+IE9u
ZSBvZiB0aGVtIGlzIHg4NiwgdGhlIG90aGVyIHg4Nl82NAo+Cj4gUmVhbGx5IHN0cmFuZ2UuLi4K
Pgo+CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
