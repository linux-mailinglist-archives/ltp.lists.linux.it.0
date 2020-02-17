Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBA1160F63
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:58:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E25C23C23C3
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:58:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2182A3C23CB
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:58:12 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 779B26000F4
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:58:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A5F8CAC46;
 Mon, 17 Feb 2020 09:58:11 +0000 (UTC)
Date: Mon, 17 Feb 2020 10:58:10 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200217095810.GC13398@dell5510>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <1c61c673a02152c30edac0e25438257c23c3322e.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2f2pR1KhLAoKKphzh9fP++yyALbv4TiAh=4Vyv0M3SEdw@mail.gmail.com>
 <20200217082931.vbjkg2f53lek4uf3@vireshk-i7>
 <CAEemH2c28zj-+pec+sgoLzCq6iV627YvyH2hRpQN98eYZ_8geg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c28zj-+pec+sgoLzCq6iV627YvyH2hRpQN98eYZ_8geg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/7] syscalls/fsmount: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCgo+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDQ6MjkgUE0gVmlyZXNoIEt1bWFyIDx2
aXJlc2gua3VtYXJAbGluYXJvLm9yZz4KPiB3cm90ZToKCj4gPiAuLi4KPiA+ID4gQWRkaW5nICNp
bmNsdWRlICJsYXBpL2ZjbnRsLmgiIGluIGNhc2Ugb2Yg4oCYQVRfRkRDV0TigJkgdW5kZWNsYXJl
ZC4gSXQgc2VlbXMKPiA+ID4gd2UgaGF2ZSB0byBkbyB0aGlzIGZvciBhbGwgdGhlIHRlc3RzIGlu
dm9sdmVzICDigJhBVF9GRENXROKAmS4KCj4gPiBteSBmc21vdW50LmggaGVhZGVyIGluY2x1ZGVz
IDxmY250bC5oPiwgd29uJ3QgdGhhdCBiZSBlbm91Z2ggPwoKCj4gSSdtIGFmcmFpZCBpdCdzIG5v
dCBlbm91Z2guCgo+IEFmdGVyIGhhdmluZyBhIGNsb3NlciBsb29rLCB0aGUgcmVhc29uIGlzIHRo
YXQgdGhlIEFUX0ZEQ1dEIGlzIGRlZmluZWQgd2l0aAo+IGNvbmRpdGlvbiBfX1VTRV9BVEZJTEUs
ICB0aGUgX19VU0VfQVRGSUxFIGRlcGVuZHMgb24gX0FURklMRV9TT1VSQ0UKPiBkZWZpbmVkLCBh
bmQgX0FURklMRV9TT1VSQ0UgbmVlZHMgZW5hYmxlIF9HTlVfU09VUkNFLgoKPiBTbyBhbm90aGVy
IGVmZmVjdGl2ZSB3YXkgaXMgdG8gYWRkICcjZGVmaW5lIF9HTlVfU09VUkNFJyBpbiBmcm9udCBv
ZiB5b3VyCj4gdGVzdCB0aGVuIHRoYXQgPGZjbnRsLmg+IHdpbGwgYmUgd29yayBmb3IgeW91LgoK
T0ssIHdlIGNhbiBhZGQgI2RlZmluZSBfR05VX1NPVVJDRSB0byBmc21vdW50MDEuYywgd2hpY2gg
YWN0dWFsbHkgbmVlZHMgaXQKKyBrZWVwIDxmY250bC5oPiB0aGVyZSBhbmQgbG9hZCBsYXBpL2Zz
bW91bnQuaCBsYXRlciAoc2VlIGJlbG93KS4KQnV0IGdlbmVyYWxseSB0aGlzIHdpbGwgYmUgdGhl
IGFwcHJvYWNoIGZvciBhbGwgdXNlcyBvZiA8ZmNudGwuaD4gKGFuZCBwcm9iYWJseQpzb21lIG90
aGVyIGhlYWRlcnMpIGZvciBvbGQgZGlzdHJvcy4gSU1ITyB0aGlzIGNoYW5nZSBpcyBjYXVzZWQg
Ynk6CgpjOTQxNzM2YzkyIFJlbW92ZSBfQlNEX1NPVVJDRSBhbmQgX1NWSURfU09VUkNFLiAoZ2xp
YmMtMi4yMCkKYzY4OGI0MTk2MCBBZGQgX0RFRkFVTFRfU09VUkNFIGZlYXR1cmUgdGVzdCBtYWNy
by4gKGdsaWJjLTIuMTkpCgpTbyB3ZSBjYW4gZWl0aGVyIGFkZCBpdCB0byBtYW55IHBsYWNlcyBv
ciBkZXRlY3QgdGhpcyBvbGQgZ2xpYmMgYW5kIGNvbXBpbGUgd2l0aAotRF9HTlVfU09VUkNFIChi
dXQgdGhpcyBtaWdodCBicmVhayBvdGhlciB0aGluZ3MpLgpCdXQgdGhhdCdzIGFub3RoZXIgc3Rv
cnkuCgo+ICMgcnBtIC1xYSBnbGliYy1oZWFkZXJzCj4gZ2xpYmMtaGVhZGVycy0yLjUtMTIzCgo+
ICMgY2F0IC91c3IvaW5jbHVkZS9mY250bC5oIHxncmVwIEFUX0ZEQ1dEIC1CIDIgLUEgMgo+ICNp
ZmRlZiBfX1VTRV9BVEZJTEUKPiAjIGRlZmluZSBBVF9GRENXRCAtMTAwICAgLyogU3BlY2lhbCB2
YWx1ZSB1c2VkIHRvIGluZGljYXRlCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdGhlICphdCBmdW5jdGlvbnMgc2hvdWxkCj4gdXNlIHRoZQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN1cnJlbnQgd29ya2lu
ZyBkaXJlY3RvcnkuCj4gKi8KClNvIGlzIHRoaXMgZGlmZiB0byB2NyBiZXR0ZXI/CgpLaW5kIHJl
Z2FyZHMsClBldHIKCmRpZmYgLS1naXQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mc21vdW50
L2ZzbW91bnQwMS5jIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnNtb3VudC9mc21vdW50MDEu
YwppbmRleCA0NjQ0NTgwODAuLjIxZDBhZTUwYiAxMDA2NDQKLS0tIHRlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvZnNtb3VudC9mc21vdW50MDEuYworKysgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9mc21vdW50L2ZzbW91bnQwMS5jCkBAIC03LDEwICs3LDExIEBACiAgKiB0byBtb3VudCBhIGZp
bGVzeXN0ZW0gd2l0aG91dCBhbnkgc3BlY2lmaWVkIG1vdW50IG9wdGlvbnMuCiAgKi8KIAorI2Rl
ZmluZSBfR05VX1NPVVJDRQogI2luY2x1ZGUgPHN5cy9tb3VudC5oPgorI2luY2x1ZGUgPGZjbnRs
Lmg+CiAKICNpbmNsdWRlICJ0c3RfdGVzdC5oIgotI2luY2x1ZGUgImxhcGkvZmNudGwuaCIKICNp
bmNsdWRlICJsYXBpL2ZzbW91bnQuaCIKICNpbmNsdWRlICJ0c3Rfc2FmZV9zdGRpby5oIgogCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
