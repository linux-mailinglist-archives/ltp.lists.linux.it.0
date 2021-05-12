Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F8B37BA9F
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 12:32:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F107A3C6472
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 12:32:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 02A4D3C4CA2
 for <ltp@lists.linux.it>; Wed, 12 May 2021 12:32:48 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 596071A0116A
 for <ltp@lists.linux.it>; Wed, 12 May 2021 12:32:48 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 9AE4A9FBCC;
 Wed, 12 May 2021 10:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1620815566; bh=WmPF1bPNCyBoim+AfT0TVnsckQ+qAgDWqKm6kxyW9mw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=VEEM3Bn5nOSlAU5zeRVAT5inTN0p+qeHq7tgwB5WCOZhdAgegUFGaGfpfBAIyLzPU
 7rO/fWht/mMrhy1MjD1KdrJxQvLEwkhIiJygbU5KcIDMj0W3VVEMvoh+MaIzsSYWPw
 Je6iNGMpn5mSDzmqCUHDlpO1rPpA6x1AifLb2lnU=
To: Li Wang <liwang@redhat.com>
References: <20210508055109.16914-4-liwang@redhat.com>
 <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
 <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <c83db09b-81b7-abad-1c8c-6375f7c2c63d@jv-coder.de>
Date: Wed, 12 May 2021 12:34:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 3/4] lib: ignore SIGINT in _tst_kill_test
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCj4+IEEgcG9zc2libGUgZml4IGNvdWxkIGJlIHVzaW5nIFNJR1RFUk0gaW5zdGVhZCBv
ZiBTSUdJTlQuIFRoaXMgc2lnbmFsCj4+IGRvZXMgbm90IHNlZW0gdG8gaGF2ZSBzb21lICJpbnRl
bGxpZ2VudCIgaGFuZGxpbmcgZm9yIGJhY2tncm91bmQgcHJvY2Vzc2VzLgo+IEkgYWdyZWUuIENh
biB5b3UgbWFrZSBhIHBhdGNoIHRvIHJlcGxhY2UgdGhhdCBJTlQ/Cj4KPiAoYW5kIHRoaXMgaXMg
b25seSBhIHRpbWVvdXQgaXNzdWUsIHNvIHBhdGNoIG1lcmdpbmcgbWF5IGJlIGRlbGF5ZWQgZHVl
Cj4gdG8gTFRQIG5ldyByZWxlYXNlKQpJJ2QgbGlrZSB0byBzdXBwbHkgdGhlIHBhdGNoLCBJJ3Zl
IHBsYWNlZCBpdCBvbiBteSB0b2RvIGxpc3QuIEkgd2lsbCAKcHJvYmFibHkgbm90IGZpbmlzaCBp
dCBiZWZvcmUgdGhlIHJlbGVhc2UsCmJ1dCBzaW5jZSBpdCB3aWxsIHByb2JhYmx5IG5vdCBiZSBp
bmNsdWRlZCBhbnl3YXksIGl0IGRvZXNuJ3QgbWF0dGVyLgpJIGRvIG5vdCBrbm93IHdoeSBMVFAg
dXNlZCBTSUdJTlQgaW4gdGhlIGZpcnN0IHBsYWNlLiBNeSBmaXJzdCB0aG91Z2h0Cj4+IHdvdWxk
IGhhdmUgYmVlbiB0byB1c2UgU0lHVEVSTS4gIEl0IGlzIHRoZSB3YXkgdG8gInBvbGl0ZWx5IGFz
awo+PiBwcm9jZXNzZXMgdG8gdGVybWluYXRlIgo+IFllcywgYnV0IHRoYXQgbm90IHN0cmFuZ2Ug
dG8gbWUsIHRoZSBwb3NzaWJsZSByZWFzb24gaXMganVzdCB0bwo+IHN0b3AoY3RybCBeYykgdGhl
IExUUCB0ZXN0IG1hbnVhbGx5IGZvciBkZWJ1Z2dpbmcsIHNvIHdlIHdlbnQKPiB0b28gZmFyIGZv
ciB1c2luZyBTSUdJTlQgYnV0IGZvcmdldCB0aGUgb3JpZ2luYWwgcHVycG9zZSA6KS4KT2sgc291
bmRzIHJlYXNvbmFibGUuIFRoZSBuaWNlIHRoaW5rIGFib3V0IGNoYW5naW5nIHRpbWVvdXQgdG8g
U0lHVEVSTSAKd291bGQgYmUsCnRoYXQgYWJvcnQgdXNpbmcgQ1RSTCtDIGlzIGNsZWFybHkgZGlz
dGluZ3Vpc2hhYmxlIGZyb20gYSB0aW1lb3V0LgoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
