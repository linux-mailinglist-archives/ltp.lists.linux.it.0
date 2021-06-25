Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E79EE3B404E
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 11:24:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A20CE3C6F27
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 11:24:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E8F873C201B
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 11:24:21 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1CB301000EA7
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 11:24:20 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 7C7B79F8E2;
 Fri, 25 Jun 2021 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1624613059; bh=jUFoKERkcY/aNMDKNir5N5I0QCkPXkV8rmRlVNoMOHw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=vCJEq6SpY6G+9WnDJtxN/IxOJRBEbJ3qpw9irIFiOCM6RpeEZ+l4ZGK6q5FyZLaze
 G20Kw35xhrCfEeOP4w/0FLfi+3cllgGD7YK1WD1IMr28pEk25Kzul+cHc3SfWmEmKT
 mXdb2yqwUPWyy9t07Gad3eNeF/9IM9rKHt5ZwobQ=
To: Li Wang <liwang@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
 <bd56facc-55a3-4e8a-4e9d-304d5177462d@canonical.com>
 <CAEemH2dqM29Y5s5U2QbeONH30h6aR1B4DZxSnSdowWKSXzfgYQ@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <0042989e-08b8-88d8-75e5-00c09f6c25bb@jv-coder.de>
Date: Fri, 25 Jun 2021 11:24:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2dqM29Y5s5U2QbeONH30h6aR1B4DZxSnSdowWKSXzfgYQ@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 0/3] controllers/memcg: fixes for newer kernels
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

SGksCgpPbiA2LzI1LzIwMjEgMTA6MjEgQU0sIExpIFdhbmcgd3JvdGU6Cj4gT24gRnJpLCBKdW4g
MjUsIDIwMjEgYXQgMzozMSBBTSBLcnp5c3p0b2YgS296bG93c2tpIAo+IDxrcnp5c3p0b2Yua296
bG93c2tpQGNhbm9uaWNhbC5jb20gCj4gPG1haWx0bzprcnp5c3p0b2Yua296bG93c2tpQGNhbm9u
aWNhbC5jb20+PiB3cm90ZToKPgo+ICAgICBPbiAxNy8wNi8yMDIxIDA5OjA3LCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOgo+Cj4KPiAgICAgVGhlIHBhdGNoc2V0IGdvdCBwb3NpdGl2ZSBMR1RN
IG9uIHRoZSBHaXRodWIuIEFueSBmdXJ0aGVyIGNvbW1lbnRzIGZvcgo+ICAgICBpdCBvciBjYW4g
aXQgYmUgYXBwbGllZD8KPgo+Cj4gSSBzbGlnaHRseSBhZ3JlZSB3aXRoIFJpY2hhcmQgdGhhdCB3
ZSBuZWVkIGFuIGV4cGxhbmF0aW9uL2ludmVzdGlnYXRpb24KPiBvbiB3aGVyZSB0aGUgMzIqUEFH
RV9TSVpFIGNvbWVzIGZyb20uIE90aGVyd2lzZSwgd2UgYXJlIHZlcnkgcG9zc2libGUKPiB0byBt
YXNrIGEgY291bnRlciBidWcgaWYgb25seSB0byBtYWtlIHRoZSB0ZXN0IGhhcHB5LgorMS4gSSB0
aGluayBpdCBoYXMgc29tZXRoaW5nIHRvIGRvIHdpdGggYmF0Y2ggcHJvY2Vzc2luZyBvZiBjb3Vu
dGVyIHVwZGF0ZXMuClRoZSBtZW1vcnkgaGFuZGxpbmcgY29kZSBpcyBoZWF2aWx5IGJhdGNoZWQg
cGVyIGNwdSBhbmQgb25seSBjb21taXR0ZWQgCnRvIGEgZ2xvYmFsIGNvdW50ZXIgYWZ0ZXIgdGhl
IGJhdGNoIHNpemUgb3ZlcmZsb3dzLgpBdCBsZWFzdCBmb3IgdGhlIHN1Ymdyb3VwX2NoYXJnZSB0
ZXN0IEkgb25jZSBmb3VuZCB0aGF0IHBhZ2UgdGFibGUgY2FjaGUgCnN0b3JlZCBpbiBrbWVtIGNv
bnRyaWJ1dGVzIHRvIHRoZSBtZW1vcnkgY291bnRlciB1c2VkIGluIHRoZSB0ZXN0LgpNYXliZSBz
b21ldGhpbmcgaW4gdGhhdCByZWdpb24gd2FzIGNoYW5nZWQgaW4gcmVjZW50IGtlcm5lbCB2ZXJz
aW9uLiAKTWF5YmUgeW91IGNvdWxkIGFzayBvbiB0aGUga2VybmVsIG1haWxpbmcgbGlzdD8KCgo+
Cj4gRm9yZ2l2ZSBtZSBwb3VyIGNvbGQgd2F0ZXIgb24gdGhlIG1ldGhvZCB0aG91Z2ggaXQgbG9v
a3MgZ29vZCBpbiBjb2Rpbmc6KS4KSSB3b3VsZCBqdXN0IHN1Z2dlc3QgdG8gbWFrZSAzMiAqIFBB
R0VTSVpFIGEgY29uc3RhbnQgY2FsY3VsYXRlZCBpbiAKbWVtY2dfbGliLnNoLCBpbnN0ZWFkIG9m
IGNhbGN1bGF0aW5nIChhbmQgZGVmaW5pbmcpIGl0IGV2ZXJ5d2hlcmUuCj4KPiAtLSAKPiBSZWdh
cmRzLAo+IExpIFdhbmcKPgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
