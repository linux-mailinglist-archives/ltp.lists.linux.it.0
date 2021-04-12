Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB235C56F
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 13:39:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 30C413C7454
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 13:39:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 48DFD3C1CB7
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 13:39:55 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 87FD4100098F
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 13:39:54 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 63DE29F815;
 Mon, 12 Apr 2021 11:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1618227592; bh=n/JnF3D+EY1UcIudByG1QzcZfgSeTr2bArQf79VLhxk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=VQOZkZWsdzEjKhDmmBW+6EcYqlSsg/ARX3Qhm+o8HRwm/kN1E7pjwoL7hHggCIzb3
 Oqq8ZhSE0Uv2ekeOWUrUDxK/7W0L/ESk7lhQ0v8bk4BvEEWdTpCXS/LPXUPHcvkFGX
 VH0Cqgpm3ZXftMUCtQagBGww+XN256IDxAraPvE8=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210330072727.16565-1-pvorel@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <adcaa3fe-5ef2-8cc4-381b-2a753f3207a9@jv-coder.de>
Date: Mon, 12 Apr 2021 13:41:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330072727.16565-1-pvorel@suse.cz>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/1] pec: Convert to the new API
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0ciwKCgpPbiAzLzMwLzIwMjEgOToyNyBBTSwgUGV0ciBWb3JlbCB3cm90ZToKPiBGcm9t
OiBKb2VyZyBWZWhsb3cgPGpvZXJnLnZlaGxvd0Bhb3gtdGVjaC5kZT4KPgo+IFJldmlld2VkLWJ5
OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KPiBTaWduZWQtb2ZmLWJ5OiBKb2VyZyBWZWhs
b3cgPGpvZXJnLnZlaGxvd0Bhb3gtdGVjaC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVs
IDxwdm9yZWxAc3VzZS5jej4KPiAtLS0KPiBIaSBKb2VyZywKPgo+IGZldyBmaXhlcyBmb3IgdGhp
cyBjb21taXQ6Cj4gKiBldmVudF9nZW5lcmF0b3IgdXNlcyBTQUZFX0VYRUNWUCgpIGluc3RlYWQg
b2YgU0FGRV9FWEVDVigpCj4gKiB1c2UgUk9EIGZvciBldmVudF9nZW5lcmF0b3IgKGl0IGNoZWNr
cyBzdGFydHVwIGZhaWx1cmUgZm9yIHVzKQo+ICogcmVtb3ZlIGJhc2hpc20gKFNJR0lOVCA9PiBJ
TlQpLCB1c2UgIyEvYmluL3NoCj4gKiByZW1vdmUgdXNlbGVzcyBleGl0IDAKPiAqIGFkZCBsb2Nh
bAo+ICogZmV3IG1pbm9yIHJld29yZAo+Cj4gSXQgYWxzbyBleHBlY3RzIHRzdF9zYWZlX21hY3Jv
czogQWRkIFNBRkVfRVhFQ1ZQKCkgcGF0Y2ggWzFdLgo+Cj4gS2luZCByZWdhcmRzLAo+IFBldHIK
Pgo+IFsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbHRwL3BhdGNoLzIw
MjEwMzI5MTc0MTM1LjIzODkwLTEtcHZvcmVsQHN1c2UuY3ovCnNvcnJ5IGZvciB0aGUgbG9uZyBk
ZWxheSwgSSB3YXMgb24gdmFjYXRpb24uCkknbGwgY2F0Y2ggdXAgd2l0aCB0aGlzIGluIHRoZSBu
ZXh0IGZldyBkYXlzLgoKSsO2cmcKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
