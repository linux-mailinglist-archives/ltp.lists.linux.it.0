Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BFC160DE1
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:58:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB0303C23DC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:58:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EAF103C0302
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:58:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 64F50200DC2
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:58:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59169BAD0;
 Mon, 17 Feb 2020 08:58:20 +0000 (UTC)
Date: Mon, 17 Feb 2020 09:58:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200217085818.GA11345@dell5510>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <1c61c673a02152c30edac0e25438257c23c3322e.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2f2pR1KhLAoKKphzh9fP++yyALbv4TiAh=4Vyv0M3SEdw@mail.gmail.com>
 <20200217082931.vbjkg2f53lek4uf3@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217082931.vbjkg2f53lek4uf3@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

PiBPbiAxNy0wMi0yMCwgMTY6MTcsIExpIFdhbmcgd3JvdGU6Cj4gPiBWaXJlc2ggS3VtYXIgPHZp
cmVzaC5rdW1hckBsaW5hcm8ub3JnPiB3cm90ZToKCj4gPiAuLi4uCj4gPiA+ICsvKgo+ID4gPiAr
ICogQ29weXJpZ2h0IChjKSAyMDIwIFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5v
cmc+Cj4gPiA+ICsgKgo+ID4gPiArICogRGVzY3JpcHRpb246Cj4gPiA+ICsgKiBCYXNpYyBmc21v
dW50KCkgdGVzdC4KPiA+ID4gKyAqLwo+ID4gPiArI2luY2x1ZGUgInRzdF90ZXN0LmgiCj4gPiA+
ICsjaW5jbHVkZSAibGFwaS9mc21vdW50LmgiCgoKPiA+IEFkZGluZyAjaW5jbHVkZSAibGFwaS9m
Y250bC5oIiBpbiBjYXNlIG9mIOKAmEFUX0ZEQ1dE4oCZIHVuZGVjbGFyZWQuIEl0IHNlZW1zCj4g
PiB3ZSBoYXZlIHRvIGRvIHRoaXMgZm9yIGFsbCB0aGUgdGVzdHMgaW52b2x2ZXMgIOKAmEFUX0ZE
Q1dE4oCZLgoKPiBteSBmc21vdW50LmggaGVhZGVyIGluY2x1ZGVzIDxmY250bC5oPiwgd29uJ3Qg
dGhhdCBiZSBlbm91Z2ggPwpVbmZvcnR1bmF0ZWx5IGl0IHdvbid0IGJlIGVub3VnaC4gTEFQSSBm
aWxlcyBhcmUgaGVyZSBmb3IgYWRkaW5nIG1pc3NpbmcKZGVmaW5pdGlvbnMgaW4gb2xkIGRpc3Ry
b3MsIHdoaWNoIGlzIGV4YWN0bHkgdGhlIGNhc2UgZm9yIEFUX0ZEQ1dEIG9uIG9sZCBSSEVMLgoK
SSBhbHNvIHN1Z2dlc3QgZm9sbG93aW5nIGNoYW5nZSB0byB2Nywgc2VlIGRpZmYgYmVsb3cgKGZz
bW91bnQuaCB1c2luZwoibGFwaS9mY250bC5oIiwgdGh1cyBub3QgbmVlZGVkIGluIGZzbW91bnQw
MS5jKS4KCj4gPiA+ICtzdGF0aWMgdm9pZCBydW4odm9pZCkKPiA+ID4gK3sKPiA+ID4gLi4uCj4g
PiA+ICsKPiA+ID4gKyAgICAgICBURVNUKGZzbW91bnQoZmQsIDAsIDApKTsKCgo+ID4gQXMgdGhp
cyBmc21vdW50MDEuYyBpcyBkdXBsaWNhdGVkIHdpdGggemxhbmdAJ3MgcGF0Y2gsIEkgc3VnZ2Vz
dCByZXdyaXRpbmcKPiA+IGFuIGVuaGFuY2VtZW50IHZlcnNpb24gbWF5YmUgbmFtZSBmc21vdW50
MDIuYyB0byBjb3ZlciBtb3JlIGZzbW91bnQKPiA+IGF0dHJpYnV0ZXMuIFNpbmNlIGl0IGlzIG5h
bWVkIGJhc2ljIGZzbW91bnQoKSB0ZXN0LCBpdCBzaG91bGRuJ3Qgb25seSB0ZXN0Cj4gPiBmc21v
dW50KGZkLCAwLCAwKSwgcmlnaHQ/CisxLgoKPiA+ICsjZGVmaW5lIE1PVU5UX0FUVFJfUkRPTkxZ
ICAgICAgMHgwMDAwMDAwMSAvKiBNb3VudCByZWFkLW9ubHkgKi8KPiA+ICsjZGVmaW5lIE1PVU5U
X0FUVFJfTk9TVUlEICAgICAgMHgwMDAwMDAwMiAvKiBJZ25vcmUgc3VpZCBhbmQgc2dpZCBiaXRz
ICovCj4gPiArI2RlZmluZSBNT1VOVF9BVFRSX05PREVWICAgICAgIDB4MDAwMDAwMDQgLyogRGlz
YWxsb3cgYWNjZXNzIHRvIGRldmljZQo+ID4gc3BlY2lhbCBmaWxlcyAqLwo+ID4gKyNkZWZpbmUg
TU9VTlRfQVRUUl9OT0VYRUMgICAgICAweDAwMDAwMDA4IC8qIERpc2FsbG93IHByb2dyYW0gZXhl
Y3V0aW9uICovCj4gPiArI2RlZmluZSBNT1VOVF9BVFRSX19BVElNRSAgICAgIDB4MDAwMDAwNzAg
LyogU2V0dGluZyBvbiBob3cgYXRpbWUgc2hvdWxkCj4gPiBiZSB1cGRhdGVkICovCj4gPiArI2Rl
ZmluZSBNT1VOVF9BVFRSX1JFTEFUSU1FICAgIDB4MDAwMDAwMDAgLyogLSBVcGRhdGUgYXRpbWUg
cmVsYXRpdmUgdG8KPiA+IG10aW1lL2N0aW1lLiAqLwo+ID4gKyNkZWZpbmUgTU9VTlRfQVRUUl9O
T0FUSU1FICAgICAweDAwMDAwMDEwIC8qIC0gRG8gbm90IHVwZGF0ZSBhY2Nlc3MgdGltZXMuCj4g
PiAqLwo+ID4gKyNkZWZpbmUgTU9VTlRfQVRUUl9TVFJJQ1RBVElNRSAweDAwMDAwMDIwIC8qIC0g
QWx3YXlzIHBlcmZvcm0gYXRpbWUKPiA+IHVwZGF0ZXMgKi8KPiA+ICsjZGVmaW5lIE1PVU5UX0FU
VFJfTk9ESVJBVElNRSAgMHgwMDAwMDA4MCAvKiBEbyBub3QgdXBkYXRlIGRpcmVjdG9yeQo+ID4g
YWNjZXNzIHRpbWVzICovCgo+IE9rYXksIEkgd2lsbCBnaXZlIGl0IGEgdHJ5LgpHcmVhdCB0aGFu
a3MhCgo+ID4gPiArICAgICAgIGlmIChUU1RfUkVUID09IC0xKQo+ID4gPiArICAgICAgICAgICAg
ICAgdHN0X2JyayhURkFJTCB8IFRFUlJOTywgImZzbW91bnQoKSBmYWlsZWQiKTsKPiA+ID4gKwo+
ID4gPiArICAgICAgIGZzbWZkID0gVFNUX1JFVDsKPiA+ID4gKwo+ID4gPiArICAgICAgIFRFU1Qo
bW92ZV9tb3VudChmc21mZCwgIiIsIEFUX0ZEQ1dELCBNTlRQT0lOVCwKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgTU9WRV9NT1VOVF9GX0VNUFRZX1BBVEgpKTsKPiA+ID4gKyAgICAgICBT
QUZFX0NMT1NFKGZzbWZkKTsKCgo+ID4gSSBndWVzcyB3ZSBwcm9iYWJseSBuZWVkIGEgd2F5IHRv
IHZlcmlmeSB0aGUgbW92ZV9tb3VudCgpIGRvZXMgd29yay4gVGhlCj4gPiBmdW5jdGlvbiBpc21v
dW50KCkgaW4gemxhbmdAJ3MgcGF0Y2ggY291bGQgYmUgZXh0cmFjdGVkIGludG8gdGhlIGxpYnJh
cnkgYXMKPiA+IHRzdF9pc21vdW50KCkgZm9yIGFsbCBvZiB0aGVzZSB0ZXN0cy4KPiA+IEBQZXRy
IFZvcmVsIDxwdm9yZWxAc3VzZS5jej4gIFdEVD8KCj4gWWVhaCwgSSB3aWxsIGRvIHRoYXQuCisx
LiBCdXQgSSdkIHN1Z2dlc3QgdG8gZmlyc3QgbWVyZ2UgdGVzdHMgd2hpY2ggSSBzZW50IGFzIHY3
IFsxXSAod2l0aCBjaGFuZ2UKYmVsb3cpIGFuZCB0aGVuIGRvaW5nIHRoaXMuCgpLaW5kIHJlZ2Fy
ZHMsClBldHIKClsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbHRwL2xp
c3QvP3Nlcmllcz0xNTg5MDImc3RhdGU9KgpbMl0gaHR0cHM6Ly90cmF2aXMtY2kub3JnL3Bldmlr
L2x0cC9idWlsZHMvNjUxMzkwNzQ5CgpkaWZmIC0tZ2l0IGluY2x1ZGUvbGFwaS9mc21vdW50Lmgg
aW5jbHVkZS9sYXBpL2ZzbW91bnQuaAppbmRleCA4N2YyZjIyOWMuLjk3YzQxNjI5YyAxMDA2NDQK
LS0tIGluY2x1ZGUvbGFwaS9mc21vdW50LmgKKysrIGluY2x1ZGUvbGFwaS9mc21vdW50LmgKQEAg
LTcsMTIgKzcsMTIgQEAKICNpZm5kZWYgRlNNT1VOVF9IX18KICNkZWZpbmUgRlNNT1VOVF9IX18K
IAotI2luY2x1ZGUgPGZjbnRsLmg+CisjaW5jbHVkZSAiY29uZmlnLmgiCiAjaW5jbHVkZSA8c3lz
L21vdW50Lmg+CiAjaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KICNpbmNsdWRlIDxzeXMvdHlwZXMu
aD4KIAotI2luY2x1ZGUgImNvbmZpZy5oIgorI2luY2x1ZGUgImxhcGkvZmNudGwuaCIKICNpbmNs
dWRlICJsYXBpL3N5c2NhbGxzLmgiCiAKICNpZm5kZWYgSEFWRV9GU09QRU4KZGlmZiAtLWdpdCB0
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzbW91bnQvZnNtb3VudDAxLmMgdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9mc21vdW50L2ZzbW91bnQwMS5jCmluZGV4IDQ2NDQ1ODA4MC4uNmJhMjI2
YWNjIDEwMDY0NAotLS0gdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mc21vdW50L2ZzbW91bnQw
MS5jCisrKyB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzbW91bnQvZnNtb3VudDAxLmMKQEAg
LTEwLDcgKzEwLDYgQEAKICNpbmNsdWRlIDxzeXMvbW91bnQuaD4KIAogI2luY2x1ZGUgInRzdF90
ZXN0LmgiCi0jaW5jbHVkZSAibGFwaS9mY250bC5oIgogI2luY2x1ZGUgImxhcGkvZnNtb3VudC5o
IgogI2luY2x1ZGUgInRzdF9zYWZlX3N0ZGlvLmgiCiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
