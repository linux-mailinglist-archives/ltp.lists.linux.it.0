Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 276208C3ABC
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2024 06:34:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1EEE3CEE94
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2024 06:34:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 956E93CC2A0
 for <ltp@lists.linux.it>; Mon, 13 May 2024 06:34:50 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=jv-coder.de (client-ip=5.9.79.73; helo=mail.jv-coder.de;
 envelope-from=lkml@jv-coder.de; receiver=lists.linux.it)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D08AA2009B7
 for <ltp@lists.linux.it>; Mon, 13 May 2024 06:34:49 +0200 (CEST)
Received: from [192.168.178.28] (unknown [93.210.185.136])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 978469F778;
 Mon, 13 May 2024 04:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1715574888; bh=nxwed/g4LO3DQWSD/2Id/VvN8OOR14H9wdCBJn/JRJQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=uxm+xSdHfnhlFlQAneQvrusJSSSJ2CkafqPXt9uxSt6c/HjAEtEbKP3YrZfDlkfpR
 phs3t+Mn7qLy/1oFto2pk3Otx+Lt78WRxckt+U4tnnezQRDL9MxFCgiP9+pMvDLSig
 NcFSmvZBaQ35vXWnMO2PkzmcqvqtKzmu6SCqGHhM=
Message-ID: <a182355e-d425-4646-90da-a6c86d11262c@jv-coder.de>
Date: Mon, 13 May 2024 06:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>, Detlef Riekenberg <wine.dev@web.de>
References: <trinity-73a44add-26d5-4c8b-b6ad-0576beafb79a-1715202092298@3c-app-webde-bap44>
 <ZjyVgVUs6wWt5cd2@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Content-Language: en-US
Organization: AOX Technologies GmbH
In-Reply-To: <ZjyVgVUs6wWt5cd2@yuki>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] open_posix_testsuite: Remove inclomplete warning
 commandline argument
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
Reply-To: Joerg.Vehlow@aox.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpBbSA1LzkvMjAyNCB1bSAxMToyMSBBTSBzY2hyaWViIEN5cmlsIEhydWJpczoKPiBIaSEK
Pj4gVGhlIE9wZW4gUG9zaXggdGVzdHN1aXRlIGNhbGxzIHRoZSBjb21waWxlciB3aXRoIHRoZSBj
b21tYW5kbGluZSBhcmd1bWVudAo+PiAiLVciLCBidXQgdGhhdCBpcyBub3QgYSBzdXBwb3J0ZWQg
Z2NjIHdhcm5pbmcgb3B0aW9uCj4+IGFuZCBicmVha3Mgb3RoZXIgY29tcGlsZXIuCj4+Cj4+IFRo
aXMgcGF0Y2ggcmVtb3ZlcyB0aGUgYnJva2VuICItVyIgY29tbWFuZGxpbmUgYXJndW1lbnQuCj4g
Cj4gSXNuJ3QgLVcgb2xkIG5hbWUgZm9yIC1XZXh0cmE/CmV4YWN0bHkgdGhhdCBpcyB3aGF0IGdj
YyBhbmQgY2xhbmcgZG9jdW1lbnRhdGlvbiBzdGF0ZXMuCgpPbiB0b3Agb2YgdGhhdAoKQWRkaXRp
b25hbGx5IGl0IGlzIG5vdGhpbmcgaW50cm9kdWNlZCBieSA4MDcxYmE3LCBidXQgYWxyZWFkeSBi
eQpmZjRlNjkzMTRjMSBiYWNrIGluIDIwMTMgYnkgbm8gb25lIGVsc2UgYnV0IHlvdSBDeXJpbCA7
KQoKSSBndWVzcyBjaGFuZ2luZyBpdCB0byAtV2V4dHJhIHdvdWxkbid0IGh1cnQgYW5kIGlzIHdo
YXQgZ2NjIHJlY29tbWVuZHMuCgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
