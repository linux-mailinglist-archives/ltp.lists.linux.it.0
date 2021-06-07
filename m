Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F9639D788
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:37:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 192F73C7C18
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:37:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC59A3C2691
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:37:48 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DB3971A00CBA
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:37:47 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id C5B6E9F75F;
 Mon,  7 Jun 2021 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1623055065; bh=YBzf8KLE2k963HHJY7Nad7mYQ3kLcGgJiHrYEzsi/C4=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=h8jliliXUbTNjM8SKbeOyoeNpHA2i+/eDsHeqW8Ur/NQ6vRrwItsTSg8Moms12q8/
 PGLhDIgitDSpi7cq6tuctClfkDHJ6lyymYIEEdv9PxszsZVtsSbZsNN/w5piYzgltZ
 uivXfjA2N1de4j48We0xbjH/H2QN8GrMt1r1p4UM=
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210604111434.21422-1-rpalethorpe@suse.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <85bddc61-f6dc-de7c-3a62-daeefcd0a058@jv-coder.de>
Date: Mon, 7 Jun 2021 10:37:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210604111434.21422-1-rpalethorpe@suse.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpqdXN0IG9uZSBxdWljayByZW1hcmsuIEkgZ3Vlc3MgdGhlIHdob2xlIHJlYXNvbiBmb3Ig
dXNpbmcgY2xhbmcgb3ZlciAKY29jY2luZWxsZSB3YXMgYXZhaWxhYmlsaXR5IG9mIGNsYW5nIG9u
IGRldmVsb3BlciBzeXN0ZW1zLgpJIGp1c3Qgd2FudGVkIHRvIHF1aWNrbHkgY2hlY2sgeW91ciB3
b3JrLCBidXQgaGFkIG5vIGNsYW5nIGluc3RhbGxlZC4gCkJ1aWxkIGZhaWwsIGV2ZW4gd2l0aCBj
eXJpbCdzIHBhdGNoIGZvciBDSEVDS19UQVJHRVRTLCBiZWNhdXNlIApjbGFuZy1jL0luZGV4Lmgg
aXMgbm90IGZvdW5kLgoKT24gdWJ1bnR1IDIwLjA0LCB0aGlzIGZpbGUgaXMgcGFydCBvZiBsaWJj
bGFuZy1kZXYsIGJ1dCBpbnN0YWxsaW5nIGl0IApkaWQgbm90IGhlbHAgZWl0aGVyLCBiZWNhdXNl
IGl0IGlzIGluc3RhbGxlZCB0byBhbiBpbmNsdWRlIHBhdGggbm90IGtub3cgCnRvIGdjYyAoL3Vz
ci9saWIvbGx2bS0xMC9pbmNsdWRlL2NsYW5nLWMpLgpJIGFkZGVkIGl0IHRvIHRoZSBpbmNsdWRl
IHBhdGggYW5kIGl0IHdhcyBmb3VuZCwgYnV0IHRoZSBuZXh0IHByb2JsZW0gCmlzLCB0aGF0IHNv
bWUgdXNlZCBmdW5jdGlvbnMgKGxpa2UgY2xhbmdfQ3Vyc29yX2dldFZhckRlY2xJbml0aWFsaXpl
cikgCmFyZSBvbmx5IGF2YWlsYWJsZSBzdGFydGluZyB3aXRoIGxpYmNsYW5nIDEyLgoKClNvIGlu
IGNvbmNsdXNpb24sIEkgZG8gbm90IHRoaW5rIHdlIGNhbiBhc3N1bWUgbGliY2xhbmcgdG8gYmUg
YXZhaWxhYmxlIApmb3IgYWxsIGRldmVsb3BlcnMgYW5kIGluc3RhbGxpbmcgaXQgaXMgcHJvYmFi
bHkgbW9yZSB3b3JrLCBhdCBsZWFzdCAKd2hlbiBuZXdlciBmdW5jdGlvbnMgZnJvbSBsaWJjbGFu
ZyBhcmUgdXNlZCwgdGhhbiBpbnN0YWxsaW5nIGNvY2NpbmVsbGUuCkFuZCB2ZXJ5IGltcG9ydGFu
dCBmb3IgZmluYWwgc2V0dXA6IEl0IG11c3QgYmUgcG9zc2libGUgdG8gc3VjY2Vzc2Z1bGx5IApj
b21waWxlIGx0cCwgd2l0aG91dCBsaWJjbGFuZy9jb2NjaW5lbGxlIGF2YWlsYWJsZS4gVGhlcmUg
aXMgbm8gcmVhc29uIAp0byBmb3JjZSB0aGlzIGxpYnJhcmllcy90b29scyBmb3IgcHVyZSAidXNl
cnMiIG9mIGx0cC4KCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
