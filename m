Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 260753BCA31
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 12:36:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA3593C89F0
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 12:36:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 214B53C6886
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 12:36:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 355F1600BAC
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 12:36:23 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7A38B220B1;
 Tue,  6 Jul 2021 10:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625567783;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFch+fsesntTufu4aGeEG/dLYiBam1TMQU9bE1GZJWk=;
 b=dsBRUV22j2cpY+OxvVtANLMLhS9XW3yiv9BDqXJ/6HA7+i1TGSgom5xxdWM2wwACWeXUPV
 Y6Smmj/CZx+wjabauRXtFgyrf5gjDaWi8Rt4G8KgsEQD9tsPUjI0gpNMhsgvRKpZoc028E
 Scgq/p5ZPn5yrX+ZVIKJ6zQxbuL/UcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625567783;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFch+fsesntTufu4aGeEG/dLYiBam1TMQU9bE1GZJWk=;
 b=vbxnQw+Xm2s/uAzbhCSazswMFlzQOVy8dfhn/c5Sz66tkAgothilJynNyvUGiavVYai4x4
 B2k92MqGwd8zrSCw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 2ABF0A3B9F;
 Tue,  6 Jul 2021 10:36:23 +0000 (UTC)
References: <20210705135014.679200-1-lkml@jv-coder.de> <87wnq37p2j.fsf@suse.de>
 <a4595bcc-15e5-e79a-bd95-143630a33774@jv-coder.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <a4595bcc-15e5-e79a-bd95-143630a33774@jv-coder.de>
Date: Tue, 06 Jul 2021 11:36:22 +0100
Message-ID: <87tul77mqh.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/1] fs_bind: Convert to ltp tests
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
SGkgUmljaGFyZCwKPgo+IE9uIDcvNi8yMDIxIDExOjQ1IEFNLCBSaWNoYXJkIFBhbGV0aG9ycGUg
d3JvdGU6Cj4+IEhlbGxvIEpvZXJnLAo+Pgo+PiBKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIu
ZGU+IHdyaXRlczoKPj4KPj4+IEhpIGV2ZXJ5b25lLAo+Pj4KPj4+IEkga25vdyB0aGlzIGlzIGEg
aHVnZSBjaGFuZ2VzZXQsIGJ1dCB0aGVyZSBpcyBub3QgcmVhbGx5IGEgZ29vZCB3YXkgdG8KPj4+
IGJyZWFrIGl0IGRvd24gaW50byBtdWx0aXBsZSBjb21taXRzLiBFdmVyeSBzdGVwIGluIGJldHdl
ZW4gd291bGQgZWl0aGVyCj4+PiBsZWFkIHRvIGEgYnJva2VuIHRlc3Qgc3VpdGUgb3IgYSBjaGFu
Z2UsIHRoYXQgaXMgdGhlbiBjaGFuZ2VkIGFnYWluLgo+Pj4gU28gSSBtYWRlIHRoaXMgb25lIGh1
Z2UgY29tbWl0LCB0aGF0IGNvbnZlcnRzIGFsbCBvZiB0aGUgdGVzdHMgb2YgdGhlCj4+PiB0ZXN0
c3VpdGUgaW4gb25lIGdvLgo+PiBJdCBzZWVtcyBsaWtlIHRoZXJlIGFyZSBubyBmaWxlIHJlbmFt
ZXMgKGFjY29yZGluZyB0byBHaXQpLCBidXQgbWFueQo+PiBmaWxlcyBhcmUgZGVsZXRlZCBhbmQg
Y3JlYXRlZC4gU28geW91IGNvdWxkIHNwbGl0IHRoZSBjb21taXQgaW50byBhCj4+IGRlbGV0aW9u
IHBhdGNoIGFuZCBhIGNyZWF0aW9uIHBhdGNoLgo+Pgo+PiBJIGd1ZXNzIHRoZSBkZWxldGlvbiBw
YXRjaCBtaWdodCBoYXZlIHRvIHJlbW92ZSBzb21lIHJ1bnRlc3QgZmlsZQo+PiBlbnRyaWVzIHRl
bXBvcmFyaWx5PyBIb3dldmVyIEkgZG9uJ3Qgc2VlIGEgYmlnIHByb2JsZW0gd2l0aCB0aGF0Lgo+
IEFjdHVhbGx5IG1vc3QgZGVsZXRpb25zIGFyZSByZW5hbWVzLCB0aGF0IGdpdCBqdXN0IGRpZCBu
b3QgcGljayB1cCwKPiBiZWNhdXNlIG9mIHRoZSBpbW1lbnNlCj4gY2hhbmdlcyBpbiB0aGUgdGVz
dHMuCj4gSSBjb3VsZCBhZGQgdHdvIHBhdGNoZXM6Cj4gMS4gcmVuYW1lIChBbmQgZGVsZXRlIG9s
ZCB0ZXN0cnVubmVyIHN0dWZmIGFuZCBydW50ZXN0IGVudHJpZXMpCj4gMi4gQXBwbHkgYWxsIGNo
YW5nZXMKPgo+IFRoaXMgc2hvdWxkIGFsbG93IGJldHRlciByZXZpZXcgb2YgdGhlIGFjdHVhbCBj
aGFuZ2VzLCBhdCBsZWFzdCBmb3IKPiBtb3N0IHRlc3RzLgoKU291bmRzIGdvb2QuIEFsc28gd2ls
bCBpbXByb3ZlIHRoZSBHaXQgaGlzdG9yeS4KCj4KPiBKw7ZyZwoKCi0tIApUaGFuayB5b3UsClJp
Y2hhcmQuCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
