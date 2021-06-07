Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C139DE0E
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 15:49:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B17A3C574C
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 15:49:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 88F063C4DBE
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 15:49:35 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 67372600CF6
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 15:49:34 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D348921A97;
 Mon,  7 Jun 2021 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623073773;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVPRcG9saN2eRdoneYVTV2a7LNflWheNBXCPEpyoPdg=;
 b=gJoWGoM7CSo79l8etvbxyodiwzVgsd9E6tAXVtBu3E5WlCK4Bd3A3LPWUjUaMqjSMNcavA
 CNCbuW3xDfGiRfTVO+qiXjmRpNyYOZtVOeg4kbQ2VCocVnulllMiwnlCoP1Un2QOex5mi3
 FGQbW0ru+CRsbYiWZqpHBOWmBc8mxbE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623073773;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVPRcG9saN2eRdoneYVTV2a7LNflWheNBXCPEpyoPdg=;
 b=WyA7mPgHsYimu2ZKzq9GzQIz/M0uXT6ZWfcH8rhpdbV86fqkBnKx7J6OVugcnycoNQyEMp
 PxkonUWpUhLKHwBQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9DAB9A3B81;
 Mon,  7 Jun 2021 13:49:33 +0000 (UTC)
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <85bddc61-f6dc-de7c-3a62-daeefcd0a058@jv-coder.de>
 <87bl8i563x.fsf@suse.de>
 <52c808d5-c5d7-3a79-122b-428fe2802957@jv-coder.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <52c808d5-c5d7-3a79-122b-428fe2802957@jv-coder.de>
Date: Mon, 07 Jun 2021 14:49:33 +0100
Message-ID: <878s3l6az6.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gSm9lcmcsCgpKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdyaXRlczoKCj4g
SGkgUmljaGFyZCwKPgo+IE9uIDYvNy8yMDIxIDEyOjIwIFBNLCBSaWNoYXJkIFBhbGV0aG9ycGUg
d3JvdGU6Cj4+IEhlbGxvIEpvZXJnLAo+Pgo+PiBPbiB1YnVudHUgMjAuMDQsIHRoaXMgZmlsZSBp
cyBwYXJ0IG9mIGxpYmNsYW5nLWRldiwgYnV0IGluc3RhbGxpbmcgaXQKPj4gZGlkIG5vdCBoZWxw
IGVpdGhlciwgYmVjYXVzZSBpdCBpcyBpbnN0YWxsZWQgdG8gYW4gaW5jbHVkZSBwYXRoIG5vdAo+
PiBrbm93IHRvIGdjYyAoL3Vzci9saWIvbGx2bS0xMC9pbmNsdWRlL2NsYW5nLWMpLgo+PiBJcyBw
YXJ0IG9mIHRoaXMgcGF0aCB0aGUgc2FtZSB0aGF0ICdjbGFuZyAtcHJpbnQtcmVzb3VyY2UtZGly
JyBwcmludHM/Cj4+Cj4+IEVpdGhlciB3YXkgSSBndWVzcyB3ZSBjYW4gc2VhcmNoIGZvciB0aGlz
IGR1cmluZyBjb25maWd1cmF0aW9uLiBMTFZNIGhhcwo+PiBhIENNYWtlIG1vZHVsZSAob3Igdy9l
KSB3aGljaCBwcm9iYWJseSBmaW5kcyBhbGwgdGhpcyBhdXRvbWF0aWNhbGx5Lgo+IHJlc291cmNl
IGRpciBpcyAvdXNyL2xpYi9sbHZtLTEyL2xpYi9jbGFuZy8xMi4wLjEuCj4KPiBUaGUgbGx2bS1j
b25maWcgdG9vbCBjYW4gYmUgdXNlZCB0byBmaW5kIHRoZSBsb2NhdGlvbnMgb2YgdGhlIGluY2x1
ZGUKPiBhbmQgbGliIGRpcmVjdG9yeS4KPiBPbiBteSB1YnVudHUsIEkgaW5zdGFsbGVkIGNsYW5n
LTEyIGZyb20gYXB0Lmxsdm0ub3JnIGFuZCBjbGFuZy0xMCBmcm9tCj4gdWJ1bnR1IHJlcG9zLgo+
IEluIHRoZSBwYXRoIHRoZXJlIGlzIHRoZSBsbHZtLWNvbmZpZyB0b29sIGZyb20gdWJ1bnR1IHBv
aW50aW5nIHRvCj4gL3Vzci9saWIvbGx2bS0xMC9iaW4vbGx2bS1jb25maWcgYW5kIGxsdm0tY29u
ZmlnLTEwIGFuZCBsbHZtLWNvbmZpZy0xMiAKPiBwb2ludGluZyB0byB0aGUgcmVzcGVjdGl2ZSBs
bHZtLWNvbmZpZyB0b29sLgo+Cj4gSSBndWVzcyB1c2luZyBsbHZtLWNvbmZpZyBmcm9tIHRoZSBw
YXRoIHRvIGRldGVjdCB0aGUgY29ycmVjdCBpbmNsdWRlCj4gYW5kIGxpYnJhcnkgcGF0aCB3b3Vs
ZCBiZSB0aGUgYmVzdCB3YXkgdG8gZ28uCj4gSWYgc29tZW9uZSB3YW50cyB0byB1c2UgYSBkaWZm
ZXJlbnQgdmVyc2lvbiwgaGUgY2FuIHN0aWxsIHNldCBwcmVwZW5kCj4gaXQgdG8gdGhlIHBhdGgg
ZHVyaW5nIGNvbmZpZ3VyYXRpb246Cj4KPiAkIGxsdm0tY29uZmlnIC0taW5jbHVkZWRpcgo+IC91
c3IvbGliL2xsdm0tMTAvaW5jbHVkZQo+Cj4gJCBsbHZtLWNvbmZpZyAtLWxpYmRpcgo+IC91c3Iv
bGliL2xsdm0tMTAvbGliCj4KPiAkIFBBVEg9Ii91c3IvbGliL2xsdm0tMTIvYmluOiRQQVRIIiBs
bHZtLWNvbmZpZyAtLWluY2x1ZGVkaXIKPiAvdXNyL2xpYi9sbHZtLTEyL2luY2x1ZGUKPgo+Cj4g
Qm90aCBpbmNsdWRlZGlyIGFuZCBsaWJkaXIgYXJlIHJlcXVpcmVkLCB0byBjb3JyZWN0bHkgbGlu
awo+IGxpYmNsYW5nLiBJbiB0aGUgZGVmYXVsdCBsaWJyYXJ5IHNlYXJjaCBwYXRocywgdGhlcmUg
YXJlIG9ubHkKPiB2ZXJzaW9uZWQgdmVyc2lvbmVzIG9mIGxpYmNsYW5nIChlZy4gbGliY2xhbmct
MTIuc28pLgoKT0suCgo+Cj4+PiBJIGFkZGVkIGl0IHRvIHRoZSBpbmNsdWRlIHBhdGggYW5kIGl0
IHdhcyBmb3VuZCwgYnV0IHRoZSBuZXh0IHByb2JsZW0KPj4+IGlzLCB0aGF0IHNvbWUgdXNlZCBm
dW5jdGlvbnMgKGxpa2UgY2xhbmdfQ3Vyc29yX2dldFZhckRlY2xJbml0aWFsaXplcikKPj4+IGFy
ZSBvbmx5IGF2YWlsYWJsZSBzdGFydGluZyB3aXRoIGxpYmNsYW5nIDEyLgo+Pj4KPj4gSSBndWVz
cyB0aGF0IHdlIGNvdWxkIHJlcGxhY2UgdGhhdCBmdW5jdGlvbiBieSByZWN1cnNpbmcgZnVydGhl
ciBpbnRvCj4+IHRoZSBBU1QgdG8gZmluZCB0aGUgaW5pdGlhbGl6ZXIgb3Vyc2VsdmVzLgo+Pgo+
PiBQcm9iYWJseSB3ZSBjYW4gcmVzdHJpY3Qgb3Vyc2VsdmVzIHRvIG9ubHkgdXNlIGZ1bmN0aW9u
cyBmcm9tIGJlZm9yZQo+PiBsaWJjbGFuZyAxMS4KPiBTb3VuZHMgZ29vZCwgYnV0IGhvdyB0byBm
b3JjZSB0aGlzPyBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGEgImFsbG93Cj4gb25seSBsaWJjbGFu
ZyAxMCBzeW1ib2xzIi4uLgoKTWFrZSBhIGxpc3Qgb2YgdGhlIHN5bWJvbHMgZXhwb3J0ZWQgYnkg
bGliY2xhbmcgMTAuIFRoZW4gY2hlY2sgdGhhdAphbnl0aGluZyB3aGljaCBzdGFydHMgd2l0aCBj
bGFuZ18gb3IgQ1ggaXMgaW4gdGhhdCBsaXN0LgoKT3IganVzdCBjb21waWxlIGl0IGFnYWluc3Qg
bGliY2xhbmcgMTAgaW4gQ0kuCgo+Pgo+Pj4gU28gaW4gY29uY2x1c2lvbiwgSSBkbyBub3QgdGhp
bmsgd2UgY2FuIGFzc3VtZSBsaWJjbGFuZyB0byBiZQo+Pj4gYXZhaWxhYmxlIGZvciBhbGwgZGV2
ZWxvcGVycyBhbmQgaW5zdGFsbGluZyBpdCBpcyBwcm9iYWJseSBtb3JlIHdvcmssCj4+PiBhdCBs
ZWFzdCB3aGVuIG5ld2VyIGZ1bmN0aW9ucyBmcm9tIGxpYmNsYW5nIGFyZSB1c2VkLCB0aGFuIGlu
c3RhbGxpbmcKPj4+IGNvY2NpbmVsbGUuCj4+IElJUkMgQ3lyaWwgc2FpZCB0aGUgQ29jY2luZWxs
ZSBwYWNrYWdlIG9uIEdlbnRvbyBpcyBub3QgbWFpbnRhaW5lZAo+PiBhbnltb3JlLiBBRkFJQ1Qg
aXQgZXhpc3RzLCBidXQgaXQgaXMgb24gYW4gb2xkIHZlcnNpb24uIEkgZG9uJ3QgdGhpbmsKPj4g
bWFueSBwZW9wbGUgYXJlIGludGVyZXN0ZWQgaW4gb3Igd2FudCB0byBtYWludGFpbiBPY2FtbAo+
PiBzdHVmZi4gTExWTS9DbGFuZyBPVE9IIGxvb2tzIHRvIGJlIHZlcnkgYWN0aXZlLgo+IFJpZ2h0
LCBpdCBhY3R1YWxseSBpcyByZW1vdmVkIG5vdyBmcm9tIGdlbnRvbyBwb3J0YWdlIHRyZWUgKFsx
XSkuIEJ1dAo+IGlzIGl0IHVzZWQgYnkgdGhlIGtlcm5lbCBkZXZlbG9wZXJzPwoKU29tZSBrZXJu
ZWwgZGV2ZWxvcGVycyB1c2UgaXQuIFRoZXJlIGFyZSBhIG51bWJlciBvZiBjaGVja2VycyBhbmQg
c29tZQptYWludGFpbmVycyBjYXJlIGFib3V0IHRoZW0gd2hpbGUgb3RoZXJzIGRvIG5vdC4KCj4K
PiBKw7ZyZwo+Cj4gWzFdCj4gaHR0cHM6Ly9naXR3ZWIuZ2VudG9vLm9yZy9yZXBvL2dlbnRvby5n
aXQvY29tbWl0Lz9pZD01ODM5NWQzYTBjMDZlMDYwYTBhNDAxODJmZmY0YmYzOWYxOTEwNTI5CgoK
LS0gClRoYW5rIHlvdSwKUmljaGFyZC4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
