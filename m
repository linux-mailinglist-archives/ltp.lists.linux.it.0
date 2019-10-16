Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3640D9316
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 15:54:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DBD03C22B4
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 15:54:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 04A103C2034
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 15:54:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7D37C600F3A
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 15:54:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9D11BC3D
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 13:54:15 +0000 (UTC)
To: ltp@lists.linux.it
References: <20191016131506.17193-1-chrubis@suse.cz>
From: Michael Moese <mmoese@suse.de>
Autocrypt: addr=mmoese@suse.de; keydata=
 mQENBFpMxXQBCAC7Z72NqEDJW9vUrNbkIaAxobHAoZBtLK1RsorBlqYgqsUilu5ACfDazfox
 u7uw07rkSIFdBZU2ghPwdWr8j0LM/5DEpf6+jY+PU6AUiKzji4UHbJVLViHVsV7q8UsDTmIf
 XTkZVVVFGCBerfHpWKRJfkreL5g2TA6tDFkBE+eeJEgWmubMP/XYEmtSStSzXBmCiA1QZ08k
 66ETcgEFok6iB5EJb1eYmkVZO5kUeCvl0EHkeBpybSuaEd+/Ux3OAfhh0nyYZwDNXJMNR8Uu
 CrQtJPKdR1LXial5ycKbtoe7mN9cxLAbHZWLLna9VaRA/C7iIfhEqO70IAgY4vcnXFgvABEB
 AAG0Hk1pY2hhZWwgTW9lc2UgPG1tb2VzZUBzdXNlLmRlPokBPwQTAQIAKQUCWkzHqwIbAwUJ
 B4TOAAcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEGAhN1yGNX50quMIALiRNQ2Jt0Fz
 pr/K1s0IS3VglbWbDIDVlauZixQ02+IU+cywcc9Bm7A9KnXT8MjN6+dNlBuBsK7KXmqrnwn0
 gMVb+KTXKVVZR0k3lvWrlH+zQ3FPY/xTSuZyPAYcuZVAUly7VLyN8UDGuAeJF7WrqfO4I/jF
 7s9DffubVA5Umyl0yhQxHcTjEozCfmUBukEVCTZ2zIsKqBMp7eUPMWRDe+QauId+BSRC9gMF
 KeEOVHi/VVi+Vr3A0U4zFxXjAcrbQZhjNS1GJ6jOPjy+MX3edY9WlkYQtx/tu2xZMhePw1I1
 4W4sTLCqAvHN59KZiACRGsd0/20pZN+T3rIIQOfTnM+5AQ0EWkzFdAEIALh+XBKEnfViYecZ
 B1suj0OBg9nnBk6j1FpQCx09ACooTiVmBQFqfMrvm1JiizombQ80kBRyiwcZ1BDmzjWLoeYB
 VovPZh4Mx+YPLSt1L7WmflGC7oWoAL3HtDKe7HCRUR17czTQXuDmeKuAggO8PV/FexHD70N/
 6EeKRPh9Dtzlo5hbC6/sqp8RmVf0E71LLBpxej1GHn8FvH2N0CA/RI/mvtuo311NudEUiR5e
 FML1oeW63Iknr0jTLutSOhZEKjeaRwFZOCt0X8ECiyuXYZU970GHhqUfVtnM8/q5qU2l18Rp
 /stWAmVyDQ7TGjECc6AvV9VSnaq6aDxgHOJi5EUAEQEAAYkBJQQYAQIADwUCWkzFdAIbDAUJ
 B4TOAAAKCRBgITdchjV+dAHWB/9VrimlVzbdURLP0ZSttHtO8WdxPiYdmvl8G08a6yy59nc7
 5qnkc7EKQ9XMisejZqsbSXbWxmgpA65rBtXrFomi0qoaDHzUlKVGlEU9YkkJo+/PEsgvxnWF
 J4vR0aLRYNOO9PvWRhJ6aHkWlCz2i9n6xsVA6PILYBiSQW22rvpH6AHu7WH7k3ddHmh4hmfw
 yxpDl1qL127wmZGUMLArb+mIEbG+Ftre84TwpvHLq9J1+xwo7/A+dEDfWwzDb3GjeL+TNar9
 ZpY8cPYiHNDqnPUoNhHdhSJuvoIuNBhUU3RalPbNRYkuitKUWfJYMvIypGO4+YBj61TIvOaY
 nDZS/ArT
Message-ID: <bc2f54f1-3be1-cf77-7475-3c08cbd24850@suse.de>
Date: Wed, 16 Oct 2019 15:54:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191016131506.17193-1-chrubis@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: tst_taint: Ignore WARN taint flag if already
 set
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpPbiAxNi4xMC4xOSAxNToxNSwgQ3lyaWwgSHJ1YmlzIHdyb3RlOgo+IFRoaXMgY29tbWl0
IGNoYW5nZXMgdGhlIGxpYnJhcnkgc28gdGhhdCBpdCBpZ25vcmVzIHRoZSB0YWludCB3YXJuIGZs
YWcKPiBpZiBpdCB3YXMgc2V0IHByaW9yIHRvIHRoZSB0ZXN0IHJ1bi4gSXQgdHVybnMgb3V0IHRo
YXQgdGhlIHdhcm4gdGFpbnQKPiBmbGFnIGlzIG5vdCB3ZWxsIGRlZmluZWQgYW5kIGNvdWxkIGJl
IGVhc2lseSBzZXQgb24gYSBmcmVzaGx5IGJvb3RlZAo+IGtlcm5lbCBmb3IgZXhhbXBsZSB3aGVu
IGJ1Z2d5IEJJT1MgaXMgZGV0ZWN0ZWQuPgo+IFNpZ25lZC1vZmYtYnk6IEN5cmlsIEhydWJpcyA8
Y2hydWJpc0BzdXNlLmN6Pgo+IENDOiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4K
PiBDQzogQ2hhbmcgWWluIDxjeWluQHJlZGhhdC5jb20+Cj4gLS0tCj4gCj4gSSBoYXZlbid0IHRl
c3RlZCB0aGlzLCBzaW5jZSBJIGRvbid0IGhhdmUgYSBzeXN0ZW0gd2hlcmUgdGhlIGZsYWcgaXMg
c2V0Cj4gYXQgaGFuZCwgYnV0IGl0J3Mgc2ltcGxlIGVub3VnaCBzbyB0aGF0IGl0IHNob3VsZCB3
b3JrIGFzIGV4cGVjdGVkLgo+IAo+ICBsaWIvdHN0X3RhaW50LmMgfCA3ICsrKysrKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9saWIvdHN0X3RhaW50LmMgYi9saWIvdHN0X3RhaW50LmMKPiBpbmRleCBhNWRiZjc3ZDIu
LjNkZTZkNzJmNCAxMDA2NDQKPiAtLS0gYS9saWIvdHN0X3RhaW50LmMKPiArKysgYi9saWIvdHN0
X3RhaW50LmMKPiBAQCAtODIsOCArODIsMTMgQEAgdm9pZCB0c3RfdGFpbnRfaW5pdCh1bnNpZ25l
ZCBpbnQgbWFzaykKPiAgCQl0c3RfcmVzKFRDT05GLCAiS2VybmVsIGlzIHRvbyBvbGQgZm9yIHJl
cXVlc3RlZCBtYXNrIik7Cj4gIAo+ICAJdGFpbnRfbWFzayA9IG1hc2s7Cj4gLQo+ICAJdGFpbnQg
PSB0c3RfdGFpbnRfcmVhZCgpOwo+ICsKPiArCWlmIChtYXNrICYgVFNUX1RBSU5UX1cgJiYgdGFp
bnQgJiBUU1RfVEFJTlRfVykgewo+ICsJCXRzdF9yZXMoVENPTkYsICJJZ25vcmluZyBhbHJlYWR5
IHNldCBrZXJuZWwgd2FybmluZyB0YWludCIpOwo+ICsJCW1hc2sgJj0gflRTVF9UQUlOVF9XOwo+
ICsJfQo+ICsKPiAgCWlmICgodGFpbnQgJiBtYXNrKSAhPSAwKQo+ICAJCXRzdF9icmsoVEJST0ss
ICJLZXJuZWwgaXMgYWxyZWFkeSB0YWludGVkOiAldSIsIHRhaW50KTsKPiAgfQo+IAoKVGVzdHMg
bWF5IHJlbHkgb24gVEFJTlRfVyB0byBkZWNpZGUgdGhlIHJlc3VsdC4gSWYgd2UgbmVlZCBUQUlO
VF9XLCB3ZQpjYW4gb25seSBydW4gdGhlIHRlc3Qgd2hlbiBpdCB3YXMgbm90IHNldCBiZWZvcmUu
IEZvciBleGFtcGxlLAp0ZXN0Y2FzZXMvY3ZlL2N2ZS0yMDE3LTE3MDUzLmMgcmVsaWVzIG9uIHRo
aXMuClRoaXMgbWF5IHJlbmRlciB0aGlzIHRlc3RjYXNlIHVudXNhYmxlLCBvciBkbyBJIGdldCB0
aGlzIHdyb25nPwoKLS0gCk1pY2hhZWwgTW9lc2UgPG1tb2VzZUBzdXNlLmRlPgpRQSBFbmdpbmVl
cgpQR1AgRmluZ2VycHJpbnQ6IDRDQ0UgMzg5NiBGODczIDJDQTUgMjM4MiAgM0M2RiA2MDIxIDM3
NUMgODYzNSA3RTc0CgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKTWF4ZmVs
ZHN0ci4gNQo5MDQwOSBOw7xybmJlcmcKR2VybWFueQoKKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQpHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
