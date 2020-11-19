Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1142B91F9
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 13:05:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75B5E3C59F5
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 13:05:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5EA9F3C25DB
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 13:05:40 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B51F2200B78
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 13:05:39 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 6A4DAA097D;
 Thu, 19 Nov 2020 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605787536; bh=No0j40f2YPBbXSQYo/Z4CrZYeSEVirZfMNwLujC3LBY=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=HuwwgGZQDh/7UAU19Hn6M/p+Bf+14Qei+J2/WQ3OWJCCUzsmY17nAeFD4woWJtml0
 xUjPUt7fYohlIPNiGBZmFCkQPqh90Kdq7I9mtr8vKwC/9DoxwBuvjFvYB4tw/gQzbu
 9mnemLzEVusU93lW1A25woT3W9p42nVvxpzPk0AI=
To: Alexey Kodanev <alexey.kodanev@oracle.com>, ltp@lists.linux.it
References: <20201117124320.783802-1-lkml@jv-coder.de>
 <057bc703-d3b6-5d8a-4831-609e332fdc36@oracle.com>
 <98732a50-84e4-97b2-5124-757d91eba7a4@jv-coder.de>
 <5f17f668-87c3-cd89-fdd9-7d6835b8ba65@oracle.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <062b0766-3d8c-e907-29f2-eeef7ce5b7cf@jv-coder.de>
Date: Thu, 19 Nov 2020 13:05:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <5f17f668-87c3-cd89-fdd9-7d6835b8ba65@oracle.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/3] network/stress/multicast/packet-flood:
 Update to new API
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

SGksCj4gSSBzZWUsIGZpbmRfcG9ydGJ1bmRsZSBpcyBqdXN0IGEgd3JhcHBlciBmb3IgbmV0c3Rh
dCBhbmQgaXQncyBub3Qgc2V0dGluZwo+IGFueSBhZGRyZXNzIGZhbWlseSwgc28gbmV0c3RhdCBs
aXN0IGFsbC4KVGhhdCdzIHdoYXQgSSB3YXMgdGFsa2luZyBhYm91dC4gSXQgbGlzdHMgYWxsIHVz
ZWQgcG9ydHMgYW5kIHNlbGVjdHMgCm9ubHkgcG9ydHMsIHRoYXQgYXJlIGZyZWUgb24gaXB2NCBh
bmQgaXB2Ni4gRm9yIHRoYXQgcmVhc29uIGl0IHdhcyAiZ29vZCAKZW5vdWdoIi4gQnV0IEkgYWxy
ZWFkeSBjaGFuZ2VkIGl0IGZvciB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4KCj4+IEkg
dGhpbmsgdGhlICJ0aGluZy11bmRlci10ZXN0IiBoZXJlIGlzIHRoZSByZWNlaXZlciwgbm90IHRo
ZSBzZW5kZXIuIEkKPj4gZG9uJ3Qgc2VlIGFueSBiZW5lZml0IHN3YXBwaW5nIHRoaXMsIGl0IHdp
bGwgb25seSBtb3ZlIHRoZSB0ZXN0IHRvIHRoZQo+PiB3cm9uZyBtYWNoaW5lLCBpZiBuZXR3b3Jr
IG5hbWVzcGFjZXMgYXJlIG5vdCBpbiB1cwo+Pgo+PiBCb3RoIG1hY2hpbmVzIGFyZSB1bmRlciB0
ZXN0LgpBY2NvcmRpbmcgdG8gdGhlIHRlc3QgZGVzY3JpcHRpb24sIHRoZSB0ZXN0IGlzIGFib3V0
IHRlc3RpbmcsIGlmIHRoZSAKa2VybmVsIGNyYXNoZXMsIGlmIGEgaHVnZSBudW1iZXIgb2YgdWRw
IHBhY2tldHMgaXMgUkVDRUlWRUQuIFRvIG1lIHRoaXMgCnNvdW5kcyBsaWtlIHRoZSByZWNlaXZl
ciBzaG91bGQgYmUgdW5kZXIgdGVzdCBhbmQgdGhlIHNlbmRlciBpcyBqdXN0IApzb21lIGR1bW15
LiBPZiBjb3Vyc2UgYm90aCBpcyB0ZXN0ZWQgaGVyZSBpZiBpdCBydW5zIG9uIHRoZSBzYW1lIHN5
c3RlbSAKd2l0aCBuYW1lc3BhY2VzLiBXaGF0IEkgc3RpbGwgZG9uJ3Qgc2VlIGlzIHRoZSBiZW5l
Zml0IG9mIGNoYW5naW5nIApzZW5kZXIgYW5kIHJlY2VpdmVyLgoKSsO2cmcKCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
