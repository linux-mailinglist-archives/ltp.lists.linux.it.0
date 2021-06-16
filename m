Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB8C3A95D0
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:16:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E5F03C4CB9
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:16:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BD1B63C1C51
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:16:31 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E6A9A1A010DE
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:16:30 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id B87599FBCA
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1623834989; bh=2ZI0voiK06cjMOXJzN3gr4VnkAJmiN5icXrZVQcbaC8=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=ItT5dMO77ArTjfalntr7ctoXZrEtdFxAk8RLkQGP5TS7XYzDSDtbU4GB/Pcvetmoy
 z0kYnccpRwh9a7PVUShzLEGh63RBnxx3RXNkiVasC0bmXbwEW1ihaLynxaZQ2rjcWz
 5HikgQcUjxSA7/UwgXOi+cPNmhk18/hLx0+EuS64=
To: ltp@lists.linux.it
References: <YKzX7FPWGGROn6kR@pevik>
 <1622713444-21197-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YMmiQfWgvqtCzOmg@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <da3974e4-76ee-1eee-b730-c49953c21120@jv-coder.de>
Date: Wed, 16 Jun 2021 11:16:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMmiQfWgvqtCzOmg@pevik>
Content-Language: en-US
X-Spam-Status: No, score=-0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] syscalls/mallinfo2_01: Add a basic test for
 mallinfo2 when setting 2G size
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

SGksCgpPbiA2LzE2LzIwMjEgOTowMyBBTSwgUGV0ciBWb3JlbCB3cm90ZToKPgo+IEJUVyBDeXJp
bCBhbHNvIHN1Z2dlc3RlZCByZWNlbnRseSB0byBkcm9wIG91dCBvZiB0cmVlIHN1cHBvcnQsIGJl
Y2F1c2UgYnVpbGQKPiBzeXN0ZW0gZGVwZW5kZW5jaWVzIGFyZSBicm9rZW4gYW5kIGZpeGluZyBp
dCB3b3VsZCBiZSBtdWNoIGVhc2llciB3aGVuCj4gc3VwcG9ydGluZyBvbmx5IGluIHRyZWUgYnVp
bGQuClJlYWxseT8gSSBnb3QgdGhlIGZlZWxpbmcgb3V0LW9mLXRyZWUgYnVpbGRzIGFyZSBiZWNv
bWluZyB0aGUgbmV3IG5vcm1hbCAKYW5kIGV2ZW4gY29tcGxleCBwaWVjZXMgb2Ygc29mdHdhcmUg
bGlrZSB0aGUga2VybmVsLCBnbGliYyBhbmQgZ2NjIGFyZSAKYWJsZSB0byBiZSBidWlsdCBvdXQt
b2YtdHJlZSBvciBldmVuIGVuZm9yY2UgaXQuCk1heWJlIGl0IGlzIHRpbWUgdG8gYWJhbmRvbiBh
dXRvY29uZi9hdXRvbWFrZSBhbmQgc3dpdGNoIHRvIGEgYmV0dGVyIApidWlsZCBjb25maWd1cmF0
aW9uIHN5c3RlbXMgbGlrZSBjbWFrZSBpbnN0ZWFkIG9mIGFiYW5kb25pbmcgb3V0LW9mLXRyZWUg
CmJ1aWxkcy4KCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
