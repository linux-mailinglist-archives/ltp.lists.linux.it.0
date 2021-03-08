Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D157E330924
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 09:06:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B0FC3C4C04
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 09:06:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9B9053C1CDB
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 09:06:11 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E4E8F600804
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 09:06:10 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 07AA7A14EB;
 Mon,  8 Mar 2021 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1615190769; bh=fjAvM4EzNR1mKt2wD7DI0R/8JDj14htbO4Ro67Cv1mQ=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=EfP2ZHnTA25jUm3Lj4iby9sHGxIpj26exVDTfH9GTSZQRBCp2Ddpjp+iaIS92WKB7
 SKZAq24mAiLAdk0qD4CaSo9iqTlkSNcNJJUgkUlPsf5N189p24E0CDze61gSy69D+5
 XC3S1ccM1dYnvUWjdvzCbz7kQ6kHidfPReqtyJxs=
To: Masayoshi Mizuma <msys.mizuma@gmail.com>, ltp@lists.linux.it
References: <20210305222714.257839-1-msys.mizuma@gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <a47ecbd7-ba4a-ff2c-ead9-e731040cb845@jv-coder.de>
Date: Mon, 8 Mar 2021 09:07:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305222714.257839-1-msys.mizuma@gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] memcg: memcg_subgroup_charge.sh: Fix the parent
 memory limit
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpPbiAzLzUvMjAyMSAxMToyNyBQTSwgTWFzYXlvc2hpIE1penVtYSB3cm90ZToKPiBGcm9t
OiBNYXNheW9zaGkgTWl6dW1hIDxtLm1penVtYUBqcC5mdWppdHN1LmNvbT4KPgo+IG1lbWNnX3N1
Ymdyb3VwX2NoYXJnZS5zaCBmYWlscyBvbiB2NS45IGFuZCBsYXRlciBrZXJuZWwuCj4gVGhhdCdz
IGJlY2F1c2UgbWVtb3J5LmxpbWl0X2luX2J5dGVzIGlzbid0IHNldCB0aGUgc3VpdGFibGUgdmFs
dWUKPiBzbyBtZW1fcHJvY2VzcyBpcyBraWxsZWQgYnkgT09NIGFjY2lkZW50YWxseS4KPgo+IFRo
ZSBtZW1vcnkubGltaXRfaW5fYnl0ZXMgaXMgbm93IHdyb25nIHZhbHVlIGJlY2F1c2UgY29tbWl0
Cj4gM2UzOGUwYWFjYTllICgibW06IG1lbWNnOiBjaGFyZ2UgbWVtY2cgcGVyY3B1IG1lbW9yeSB0
byB0aGUgcGFyZW50IGNncm91cCIpCj4gY2hhbmdlZCB0aGUgY2hhcmdpbmcgbWVtb3J5IHVzYWdl
LiBUaGUgcGVyY3B1IG1lbW9yeSwgd2hpY2ggaXMKPiBuZWVkZWQgdG8gY3JlYXRlIHRoZSBzdWJn
cm91cCwgaXMgY2hhcmdlZCB0byB0aGUgcGFyZW50J3MgdXNhZ2UuCj4KPiBTaW5jZSB3ZSBjYW4g
Z2V0IHRoZSBhbW91bnQgb2YgdGhlIHBlcmNwdSBtZW1vcnkgYXMgbWVtb3J5LnVzYWdlX2luX2J5
dGVzCj4gYWZ0ZXIgdGhlIHN1Ymdyb3VwIGlzIGNyZWF0ZWQsIGV4dGVuZCB0aGUgbGltaXQgdG8g
bGltaXRfaW5fYnl0ZXMgKyB1c2FnZV9pbl9ieXRlcy4KU291bmRzIHJlYXNvbmFibGUsIEkgZ3Vl
c3MgdGhlIHRlc3QgYWx3YXlzIGZhaWxzIG9uIDUuOT8KQnV0IHRoZSBwcm9ibGVtIGlzLCB0aGlz
IHRlc3QgYWxzbyBmYWlscyBvbiBvbGRlciBrZXJuZWxzIHNvbWV0aW1lcy4gCldoZW4gSSBsb29r
ZWQgYXQgdGhpcyB0aGUgbGFzdCB0aW1lLCBJIHRob3VnaHQgaXQgd2FzIGJlY2F1c2Ugc29tZXRp
bWVzIAp0aGUga2VybmVsIHJlcXVpcmVzIG5ldyBwYWdlcyBmb3IgdGhlIHBhZ2UgdGFibGUgYW5k
IHRoYXQgaXMgYWxzbyB0YWtlbiAKaW50byBhY2NvdW50IGZvciB0aGUgbWVtb3J5IGxpbWl0LgpJ
IHN0aWxsIGRvbid0IGtub3cgd2h5IHRoZSB0ZXN0IGV2ZW4gc2V0cyBhIGxpbWl0IGZvciB0aGUg
cGFyZW50IGdyb3VwIAphbmQgd291bGQgdm90ZSBmb3IgY29tcGxldGVseSByZW1vdmluZyB0aGUg
bWVtb3J5IHNldHRpbmcgb24gdGhlIHBhcmVudC4KCkrDtnJnCgoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
