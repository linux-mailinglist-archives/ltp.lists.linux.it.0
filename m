Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C8F389E9
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 14:12:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 428A93EA65F
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 14:12:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 95E333EA5E4
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 14:12:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8A64D1A011F9
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 14:12:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D3F72AFA9
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 12:12:13 +0000 (UTC)
Date: Fri, 7 Jun 2019 14:12:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190607121212.GC13869@rei.lan>
References: <20190604072228.17513-1-camann@suse.com>
 <20190606121436.GB27083@rei>
 <7c7bf785-adbd-d69b-c17b-bc65c2228d11@suse.com>
 <20190607113537.GA13869@rei.lan>
 <7824ed12-432a-4a02-395f-a0a2afbb0134@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7824ed12-432a-4a02-395f-a0a2afbb0134@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
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

SGkhCj4gPj4geWVzLCBJIGhhdmUgdGVzdGVkIGl0IG9uIGEgc3lzdGVtIGxpa2UgeW91IGRlc2Ny
aWJlIGJ1dCBJIHJlY2VpdmUgYQo+ID4+IHBvc2l0aXZlIG91dHB1dDoKPiA+Pgo+ID4+IHRzdF9r
Y29uZmlnLmM6NjI6IElORk86IFBhcnNpbmcga2VybmVsIGNvbmZpZyAnL3Byb2MvY29uZmlnLmd6
Jwo+ID4+IHRzdF90ZXN0LmM6MTExMTogSU5GTzogVGltZW91dCBwZXIgcnVuIGlzIDBoIDA1bSAw
MHMKPiA+PiB0c3Rfa2NvbmZpZy5jOjYyOiBJTkZPOiBQYXJzaW5nIGtlcm5lbCBjb25maWcgJy9w
cm9jL2NvbmZpZy5neicKPiA+PiBhY2N0MDIuYzoxNTk6IElORk86IFZlcmlmeWluZyB1c2luZyAn
c3RydWN0IGFjY3QnCj4gPj4gYWNjdDAyLmM6MTM3OiBJTkZPOiBOdW1iZXIgb2YgYWNjb3VudGlu
ZyBmaWxlIGVudHJpZXMgdGVzdGVkOiAxCj4gPj4gYWNjdDAyLmM6MTQwOiBQQVNTOiBhY2N0KCkg
d3JvdGUgY29ycmVjdCBmaWxlIGNvbnRlbnRzIQo+ID4+Cj4gPj4gVGhlcmUgc2VlbXMgdG8gYmUg
c29tZXRoaW5nIGVsc2UgZ29pbmcgd3JvbmcuIEkgd2lsbCBpbnZlc3RpZ2F0ZSB0aGlzLgo+ID4g
TWF5IGJlIHNvbWV0aGluZyB3cm9uZyBhdCBteSBlbmQgYXMgd2VsbCwgd2hhdCBrZXJuZWwgdmVy
c2lvbnMgaGF2ZSB5b3UKPiA+IHRlc3RlZD8gQXQgbXkgZW5kIEkgdGVzdGVkIDQuMjAuCj4gPgo+
IEkgaGF2ZSBhIDQuMTkga2VybmVsIHg4Nl82NCBtYWNoaW5lIHJ1bm5pbmcgYW5kIEkgZG91Ymxl
IGNoZWNrZWQgdGhhdCBJCj4gaGF2ZSB0aGUgc2FtZSBjb25maWdzIGFzIHlvdSBoYXZlIHByb3Zp
ZGVkLgo+IAo+IFN0aWxsLCBJIGhhdmUgYSBoYXJkIHRpbWUgcmVwcm9kdWNpbmcgdGhlIGVycm9y
LgoKTG9va3MgbGlrZSB0aGlzIGlzIHZlcnkgc3BlY2lmaWMgZXJyb3IgdGhhdCBoYXBwZW5zIGZv
ciBtZSBzaW5jZSBJIGhhdmUKL21udCBvbiBteSByb290ZnMsIGl0IHdvcmtzIGZvciBhbnkgb3Ro
ZXIgZmlsZXN5c3RlbSBJJ3ZlIHRyaWVkIHRob3VnaC4KCkkgZ3Vlc3MgdGhhdCB3ZSBjYW4gZ28g
YWhlYWQgYW5kIHB1c2ggdGhlIHRlc3QgdGhlbi4KCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0Bz
dXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
