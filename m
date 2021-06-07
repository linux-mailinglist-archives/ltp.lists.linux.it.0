Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D98339DB6C
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 13:35:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18F603C4DEC
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 13:35:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 750B83C4DAC
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 13:34:59 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 43F5C600911
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 13:34:57 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 7E4969F75F;
 Mon,  7 Jun 2021 11:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1623065696; bh=nlgoMi9h3ZBVpgrJYcTLsMhInDSssE+OoQVNLC5AIgM=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=rQxGH1OuePD8Pr09lZj/cpJEa+NUjiU7eR6oo8Ldl/jD1X5cE941ylA2CnwDx8jmR
 Ni+w03pk6CEPcu2Mmqx0CWWps6K17tc4g8uWsoqKcgi7SVOJYnWfViTaRa1f7iwWNB
 hedW9yPjkOMcTPdkv1RrB5AKaoOBbn3H+ekVeh0w=
To: rpalethorpe@suse.de
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <85bddc61-f6dc-de7c-3a62-daeefcd0a058@jv-coder.de> <87bl8i563x.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <52c808d5-c5d7-3a79-122b-428fe2802957@jv-coder.de>
Date: Mon, 7 Jun 2021 13:34:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87bl8i563x.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC PATCH v2 0/2] Libclang based analyzer
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

SGkgUmljaGFyZCwKCk9uIDYvNy8yMDIxIDEyOjIwIFBNLCBSaWNoYXJkIFBhbGV0aG9ycGUgd3Jv
dGU6Cj4gSGVsbG8gSm9lcmcsCj4KPiBPbiB1YnVudHUgMjAuMDQsIHRoaXMgZmlsZSBpcyBwYXJ0
IG9mIGxpYmNsYW5nLWRldiwgYnV0IGluc3RhbGxpbmcgaXQKPiBkaWQgbm90IGhlbHAgZWl0aGVy
LCBiZWNhdXNlIGl0IGlzIGluc3RhbGxlZCB0byBhbiBpbmNsdWRlIHBhdGggbm90Cj4ga25vdyB0
byBnY2MgKC91c3IvbGliL2xsdm0tMTAvaW5jbHVkZS9jbGFuZy1jKS4KPiBJcyBwYXJ0IG9mIHRo
aXMgcGF0aCB0aGUgc2FtZSB0aGF0ICdjbGFuZyAtcHJpbnQtcmVzb3VyY2UtZGlyJyBwcmludHM/
Cj4KPiBFaXRoZXIgd2F5IEkgZ3Vlc3Mgd2UgY2FuIHNlYXJjaCBmb3IgdGhpcyBkdXJpbmcgY29u
ZmlndXJhdGlvbi4gTExWTSBoYXMKPiBhIENNYWtlIG1vZHVsZSAob3Igdy9lKSB3aGljaCBwcm9i
YWJseSBmaW5kcyBhbGwgdGhpcyBhdXRvbWF0aWNhbGx5LgpyZXNvdXJjZSBkaXIgaXMgL3Vzci9s
aWIvbGx2bS0xMi9saWIvY2xhbmcvMTIuMC4xLgoKVGhlIGxsdm0tY29uZmlnIHRvb2wgY2FuIGJl
IHVzZWQgdG8gZmluZCB0aGUgbG9jYXRpb25zIG9mIHRoZSBpbmNsdWRlIAphbmQgbGliIGRpcmVj
dG9yeS4KT24gbXkgdWJ1bnR1LCBJIGluc3RhbGxlZCBjbGFuZy0xMiBmcm9tIGFwdC5sbHZtLm9y
ZyBhbmQgY2xhbmctMTAgZnJvbSAKdWJ1bnR1IHJlcG9zLgpJbiB0aGUgcGF0aCB0aGVyZSBpcyB0
aGUgbGx2bS1jb25maWcgdG9vbCBmcm9tIHVidW50dSBwb2ludGluZyB0byAKL3Vzci9saWIvbGx2
bS0xMC9iaW4vbGx2bS1jb25maWcgYW5kIGxsdm0tY29uZmlnLTEwIGFuZCBsbHZtLWNvbmZpZy0x
MiAKcG9pbnRpbmcgdG8gdGhlIHJlc3BlY3RpdmUgbGx2bS1jb25maWcgdG9vbC4KCkkgZ3Vlc3Mg
dXNpbmcgbGx2bS1jb25maWcgZnJvbSB0aGUgcGF0aCB0byBkZXRlY3QgdGhlIGNvcnJlY3QgaW5j
bHVkZSAKYW5kIGxpYnJhcnkgcGF0aCB3b3VsZCBiZSB0aGUgYmVzdCB3YXkgdG8gZ28uCklmIHNv
bWVvbmUgd2FudHMgdG8gdXNlIGEgZGlmZmVyZW50IHZlcnNpb24sIGhlIGNhbiBzdGlsbCBzZXQg
cHJlcGVuZCBpdCAKdG8gdGhlIHBhdGggZHVyaW5nIGNvbmZpZ3VyYXRpb246CgokIGxsdm0tY29u
ZmlnIC0taW5jbHVkZWRpcgovdXNyL2xpYi9sbHZtLTEwL2luY2x1ZGUKCiQgbGx2bS1jb25maWcg
LS1saWJkaXIKL3Vzci9saWIvbGx2bS0xMC9saWIKCiQgUEFUSD0iL3Vzci9saWIvbGx2bS0xMi9i
aW46JFBBVEgiIGxsdm0tY29uZmlnIC0taW5jbHVkZWRpcgovdXNyL2xpYi9sbHZtLTEyL2luY2x1
ZGUKCgpCb3RoIGluY2x1ZGVkaXIgYW5kIGxpYmRpciBhcmUgcmVxdWlyZWQsIHRvIGNvcnJlY3Rs
eSBsaW5rIGxpYmNsYW5nLiBJbiAKdGhlIGRlZmF1bHQgbGlicmFyeSBzZWFyY2ggcGF0aHMsIHRo
ZXJlIGFyZSBvbmx5IHZlcnNpb25lZCB2ZXJzaW9uZXMgb2YgCmxpYmNsYW5nIChlZy4gbGliY2xh
bmctMTIuc28pLgoKPj4gSSBhZGRlZCBpdCB0byB0aGUgaW5jbHVkZSBwYXRoIGFuZCBpdCB3YXMg
Zm91bmQsIGJ1dCB0aGUgbmV4dCBwcm9ibGVtCj4+IGlzLCB0aGF0IHNvbWUgdXNlZCBmdW5jdGlv
bnMgKGxpa2UgY2xhbmdfQ3Vyc29yX2dldFZhckRlY2xJbml0aWFsaXplcikKPj4gYXJlIG9ubHkg
YXZhaWxhYmxlIHN0YXJ0aW5nIHdpdGggbGliY2xhbmcgMTIuCj4+Cj4gSSBndWVzcyB0aGF0IHdl
IGNvdWxkIHJlcGxhY2UgdGhhdCBmdW5jdGlvbiBieSByZWN1cnNpbmcgZnVydGhlciBpbnRvCj4g
dGhlIEFTVCB0byBmaW5kIHRoZSBpbml0aWFsaXplciBvdXJzZWx2ZXMuCj4KPiBQcm9iYWJseSB3
ZSBjYW4gcmVzdHJpY3Qgb3Vyc2VsdmVzIHRvIG9ubHkgdXNlIGZ1bmN0aW9ucyBmcm9tIGJlZm9y
ZQo+IGxpYmNsYW5nIDExLgpTb3VuZHMgZ29vZCwgYnV0IGhvdyB0byBmb3JjZSB0aGlzPyBJIGRv
bid0IHRoaW5rIHRoZXJlIGlzIGEgImFsbG93IG9ubHkgCmxpYmNsYW5nIDEwIHN5bWJvbHMiLi4u
Cj4KPj4gU28gaW4gY29uY2x1c2lvbiwgSSBkbyBub3QgdGhpbmsgd2UgY2FuIGFzc3VtZSBsaWJj
bGFuZyB0byBiZQo+PiBhdmFpbGFibGUgZm9yIGFsbCBkZXZlbG9wZXJzIGFuZCBpbnN0YWxsaW5n
IGl0IGlzIHByb2JhYmx5IG1vcmUgd29yaywKPj4gYXQgbGVhc3Qgd2hlbiBuZXdlciBmdW5jdGlv
bnMgZnJvbSBsaWJjbGFuZyBhcmUgdXNlZCwgdGhhbiBpbnN0YWxsaW5nCj4+IGNvY2NpbmVsbGUu
Cj4gSUlSQyBDeXJpbCBzYWlkIHRoZSBDb2NjaW5lbGxlIHBhY2thZ2Ugb24gR2VudG9vIGlzIG5v
dCBtYWludGFpbmVkCj4gYW55bW9yZS4gQUZBSUNUIGl0IGV4aXN0cywgYnV0IGl0IGlzIG9uIGFu
IG9sZCB2ZXJzaW9uLiBJIGRvbid0IHRoaW5rCj4gbWFueSBwZW9wbGUgYXJlIGludGVyZXN0ZWQg
aW4gb3Igd2FudCB0byBtYWludGFpbiBPY2FtbAo+IHN0dWZmLiBMTFZNL0NsYW5nIE9UT0ggbG9v
a3MgdG8gYmUgdmVyeSBhY3RpdmUuClJpZ2h0LCBpdCBhY3R1YWxseSBpcyByZW1vdmVkIG5vdyBm
cm9tIGdlbnRvbyBwb3J0YWdlIHRyZWUgKFsxXSkuIEJ1dCBpcyAKaXQgdXNlZCBieSB0aGUga2Vy
bmVsIGRldmVsb3BlcnM/CgpKw7ZyZwoKWzFdIApodHRwczovL2dpdHdlYi5nZW50b28ub3JnL3Jl
cG8vZ2VudG9vLmdpdC9jb21taXQvP2lkPTU4Mzk1ZDNhMGMwNmUwNjBhMGE0MDE4MmZmZjRiZjM5
ZjE5MTA1MjkKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
