Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 715BA3B18C3
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:20:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 415C33C6FDA
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:20:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 359C03C2E72
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:20:37 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DA272100094A
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:20:36 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 2C4949F7F3;
 Wed, 23 Jun 2021 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1624447235; bh=WZjYl1Gi8kWIhS9RIS+odjQXXKwt0vKzIAFUlThhAvs=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=X/Bkcszv9j6oAQoOYidpq65r7SB2TOYGzCqYvRjkEAQfuA6PM8lerc2K5fPS9H2Js
 qcnkEu/E4D7TfUY+2oyX05niudgBf3W3VVKZVz/0iWFAnVYaZNSE2bZVfZsEdZna1V
 4MM6SilY19KBHGcDx6Up+nMYK4FZpgv7SpWD6NJY=
To: rpalethorpe@suse.de
References: <20210623071543.171021-1-lkml@jv-coder.de> <87mtrg4yz6.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <3a6d7a45-2205-34f9-aaab-2d039d132456@jv-coder.de>
Date: Wed, 23 Jun 2021 13:20:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87mtrg4yz6.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/3] cpuset_regression_test: convert and improve
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

SGkgUmljaGFyZCwKCk9uIDYvMjMvMjAyMSAxOjExIFBNLCBSaWNoYXJkIFBhbGV0aG9ycGUgd3Jv
dGU6Cj4gSGVsbG8gSm9lcmcsCj4KPiBKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdy
aXRlczoKPgo+PiBIaSwKPj4KPj4gdGhpcyBpcyBtb3JlIG9yIGxlc3MgYSB2MiBvZiBhIHBhdGNo
IEkgc2VuZCBwcmV2aW91c2x5IChwYXRjaCAzKS4KPj4gSSBrbm93IHRoYXQgcmljaGFyZCBpcyBu
b3QgZW50aXJlbHkgaGFwcHkgd2l0aCB0aGlzIHBhdGNoLCBJIHdpbGwKPj4gZ2l2ZSBpdCBhbm90
aGVyIHRyeSBhbnl3YXkuLi4KPj4gSXQgaXMgZWl0aGVyIHRoaXMgcGF0Y2ggb3IgYW5vdGhlciBw
YXRjaCwgdGhhdCBoYXMgdG8gbG9vayB0aHJvdWdoCj4+IHRoZSBjZ3JvdXAgaGllcmFyY2h5LCB0
byBjaGVjayBpZiB0aGVyZSBpcyBhbnkgZ3JvdXAsdGhhdCBleHBsaWNpdGVseQo+PiB1c2VzIGNw
dSAwLgo+IElmIGl0IGlzIGFscmVhZHkgYmVpbmcgdXNlZCB0aGVuIGNhbiB5b3Ugc2V0IGl0PwpU
aGUgdGVzdCBjYW4gdXNlIGFueSBjcHUsIHRoYXQgaXMgbm90IGV4cGxpY2l0bHkgYXNzaWduZWQg
dG8gYSBncm91cCAKYWxyZWFkeS4KV2hhdCBJIG1lYW4gYnkgImVpdGhlciB0aGlzIG9yIGFub3Ro
ZXIgcGF0Y2giIChhbmQgZm9yZ290IHRvIHR5cGUpLCB0aGUgCmFsdGVybmF0aXZlCnBhdGNoIGhh
cyB0byBjaGVjayBpZiBhbnl0aGluZyBpcyB1c2luZyBjcHUgMCBleHBsaWNpdGx5IGFuZCB0aGVu
IGZhaWwgCndpdGggVENPTkYuCk9yIGl0IGhhcyB0byBsb29rIGZvciBhbiB1c2VkIGNwdSBjb3Jl
LiBUaGF0IHdvdWxkIGJlIGFub3RoZXIgcG9zc2liaWxpdHkuLi4KCj4KPj4gVG8gbWUsIGl0IGlz
IGEgYmV0dGVyIHNvbHV0aW9uIHRvIGp1c3QgY2hhbmdlIGdyb3VwcyBmb3IgYSBzaG9ydCB0aW1l
LAo+PiBhbmQgY2hlY2sgaWYgdGhlIGJ1ZyBleGlzdHMuIElmIGx0cCB0ZXN0cyBhcmUgcnVubmlu
ZywgdGhlIGNoYW5jZSwgdGhhdAo+PiB0aGVyZSBpcyBhbnl0aGluZyBydW5uaW5nLCB0aGF0IHJl
YWxseSBuZWVkcyBhIGNvcnJlY3QgY3B1c2V0IGlzIHZlcnkgbG93Lgo+PiBJIGFtIGNvbW1pbmcg
ZnJvbSBhIHN5c3RlbSwgd2hlcmUgY2dyb3VwcyBhcmUgc2V0dXAgYnkgYSBjb250YWluZXIgbGF1
bmNoZXIsCj4+IHRoYXQganVzdCBoYXBwZW5zIHRvIGFzc2lnbiBjcHVzIHRvIHRoZSBjb250YWlu
ZXJzIC0gbm90IGV2ZW4gZXhjbHVzaXZlbHkuCj4+IExUUCB0ZXN0cyBhcmUgdXNlZCBhcyBzb21l
IHBhcnQgb2YgdGhlIHRlc3RzdWl0ZSwgdG8gdGVzdCBhcyBjbG9zZSB0byBhCj4+IHByb2R1Y3Rp
b24gc3lzdGVtIGFzIHBvc3NpYmxlLgo+IEkgd2FzIHRoaW5raW5nIHRoYXQgaWYgeW91IGFyZSBh
bHJlYWR5IHVzaW5nIENQVSBzZXRzIHRoZW4geW91IGVpdGhlcgo+IGRvbid0IGhhdmUgdGhlIGJ1
ZyBvciB5b3Ugd29uJ3QgaGl0IGl0IG9uIHlvdXIgc2V0dXAocyk/IElmIHNvIHRoZW4gdGhlCj4g
dGVzdCBpcyByZWR1bmRhbnQuClRydWUgYWJvdXQgdGhlICJkb24ndCBoaXQgaXQgcGFydCIsIGF0
IGxlYXN0IHdpdGggdGhlIHNldHVwLCBidXQgSSBndWVzcyAKdGhlIHJlYXNvbiBmb3IgYSByZWdy
ZXNzaW9uIHRlc3QsCmlzIHRvIHByZXZlbnQgcmVncmVzc2lvbnMuIFRoaXMgd2FzIGNsZWFybHkg
YSBidWcgaW4gdGhlIGtlcm5lbCBhbmQgbm90IApvbmx5IGFuIGluY29udmVuaWVuY2UuIEFuZCBz
aW5jZQp0aGVyZcKgIGlzIG5vdCAidGhlIG9uZSBrZXJuZWwgc291cmNlIiwgSSB0aGluayBpdCBp
cyBpbXBvcnRhbnQgdG8gcnVuIAp0ZXN0cyBsaWtlIHRoaXMgZm9yIGFzIG1hbnkgZGlmZmVyZW50
Cmtlcm5lbHMgYXMgcG9zc2libGUuIEFwYXJ0IGZyb20gdGhlIGFscmVhZHkgc2V0dXAgY2dyb3Vw
cywgdGhlcmUgbWF5IGJlIApvdGhlciB1c2VzIG9mIGNncm91cHMgYXMgd2VsbCwKdGhhdCB0cnkg
dG8gc2V0IHRoZW0gdXAgdGhlIG90aGVyIHdheSBhcm91bmQgKGZpcnN0IGV4Y2x1c2l2ZSwgdGhl
biBjcHVzKS4KPgo+PiBUaGUgb25seSB3YXkgSSBjb3VsZCB0aGluayBvZiBhIHByb2Nlc3MgbWlz
YmVoYXZpbmcgYnkgZGlzYWJlbGluZyBjcHUgcGlubmluZywKPj4gd291bGQgYmUgYSBiYWRseSB3
cml0dGVuIG11bHRpdGhyZWFkIGFwcGxpY2F0aW9uLCB0aGF0IGNhbm5vdCBjb3JyZWN0bHkgcnVu
LAo+PiBpZiB0aHJlYWRzIGFyZSByZWFsbHkgcnVubmluZyBpbiBwYXJhbGxlbCwgYnV0IHRoaXMg
d291bGQgYWxzbyByZXF1aXJlIGEgc2NoZWR1bGluZwo+PiBwb2xpY3ksIHRoYXQgbWFrZXMgc2No
ZWR1bGluZyBwb2ludHMgcHJlZGljYXRhYmxlLiBXaGlsZSBJIGtub3cgdGhhdCBzb2Z0d2FyZSBs
aWtlCj4+IHRoYXQgZXhpc3RzIChpbiBmYWN0IEkgd2FzIHdvcmtpbmcgb24gc29tZXRoaW5nIGxp
a2UgdGhhdCBpbiB0aGUgcGFzdCksIEkgdGhpbmsgaXQKPj4gaXMgaGlnaGx5IHVubGlrZWx5LCB0
aGF0IGl0IGlzIHJ1bm5pbmcgcGFyYWxsZWwgdG8gbHRwLgo+PiBBbmQgZXZlbiB0aGVuLCB0aGlz
IGNvdWxkIGJlIG1pdGlnYXRlZCBieSBub3QganVzdCBzZXR0aW5nIGNwdSBiaW5kaW5nIHRvIHVu
ZGVmaW5lZCwKPj4gYnV0IHRvIG9uZSBmaXhlZCBjb3JlLiBCdXQgd2l0aCB0aGUgY2hhbmdlcyBp
biBwYXRjaCAyLCB0aGlzIGlzIG5vdAo+PiBwb3NzaWJsZS4KPj4KPj4gQnV0IGFueWhvdyBsdHAg
ZmlkZGxlcyB3aXRoIGxvdHMgb2YgY3JpdGljYWwgc3lzdGVtIHBhcmFtZXRlcnMgZHVyaW5nIGl0
J3MgcnVudGltZSwKPj4gdGhlcmUgaXMgbm8gZ3VhcmFudGVlLCB0aGF0IGFuIGFwcGxpY2F0aW9u
IHRoYXQgcmVxdWlyZXMgc29tZSB2ZXJ5IHNwZWNpZmljIGtlcm5lbAo+PiBydW50aW1lIHNldHRp
bmdzIHN1cnZpdmVzIHRoaXMuIFRoYXQncyB3aHkgSSB3b3VsZCBzdGlsbCB2b3RlIGZvciB0aGlz
IHBhdGNoLgo+Pgo+PiBKw7ZyZwo+IEkgc3RpbGwgdGhpbmsgaXQgaGFzIGEgc21hbGwgY2hhbmNl
IG9mIGNhdXNpbmcgcHJvYmxlbXMgZm9yIHVzLiBUaGVyZQo+IGFyZSBzb21lIGhldGVyb2dlbmVv
dXMgQ1BVIHN5c3RlbXMgd2hlcmUgY29udHJvbCBzb2Z0d2FyZSBzaG91bGQgcnVuIG9uCj4gYSBn
aXZlbiBDUFUuIEkgZG9uJ3Qga25vdyB3aGV0aGVyIENHcm91cHMgYXJlIHVzZWQgdG8gY29udHJv
bCB0aGF0IG9yIGlmCj4gaXQgd291bGQgbWF0dGVyIGlmIHRoZSBwcm9jZXNzIGlzIG1vdmVkIHRl
bXBvcmFyaWx5LiBJdCdzIGp1c3QgYSBzbWFsbAo+IHJpc2sgSSB3b3VsZCBhdm9pZCBpZiB0aGUg
dGVzdCBpcyBub3QgcmVhbGx5IHdvcnRoIGl0LgpJIGdldCB0aGF0LCBidXQgdGhlc2Ugc3lzdGVt
cyBtYXkgaGF2ZSB0byBvcHQtb3V0IG9mIHNvbWUgdGVzdHMgYW55d2F5Lgo+Cj4gT1RPSCB0aGUg
cGF0Y2ggbG9va3MgZ29vZCBvdGhlcndpc2UsIHNvIGl0IHNob3VsZCBiZSBtZXJnZWQgaWYgbm8g
b25lCj4gZWxzZSBhZ3JlZXMgd2l0aCBtZS4KT2ssIGxldHMgc2VlIHdoYXQgdGhlIG90aGVycyBo
YXZlIHRvIHNheSA6KQoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
