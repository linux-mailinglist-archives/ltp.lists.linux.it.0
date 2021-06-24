Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEA43B2B6E
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 11:30:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3711B3C6F41
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 11:29:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 854C03C2025
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 11:29:58 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 55EC01A01237
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 11:29:54 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 4AD7B9FB10;
 Thu, 24 Jun 2021 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1624526992; bh=NoEwMFBdmYghCA6i16bVvQpKCbCxeCWQXtxUNQQ8vH8=;
 h=To:From:Subject:Message-ID:Date:MIME-Version;
 b=sug0+adwjA4wIf+tUUAfmW/wHc1TJqI0qpkdNYCehMb8vYPN642hTc50MwmMhtcUM
 wZznkPo5X0DvUyVPNZLbecBlkmau7mrs7GwfRzaTvO1opyR85jwy7KI5cnrp6HyOU9
 OmOVL3Jus5+pK2VTV4MMXxQX93uzjuB/jzT5Rrt8=
To: LTP List <ltp@lists.linux.it>, Petr Vorel <pvorel@suse.cz>,
 Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>,
 Richard Palethorpe <rpalethorpe@suse.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <fc235ab1-4796-c1d4-d5b0-f1f112c9ce54@jv-coder.de>
Date: Thu, 24 Jun 2021 11:29:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [RFC] fs_bind rework
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

SGksCgppcyB0aGVyZSBhbnkgcmVhc29uLCB3aHkgdGhlIGZzX2JpbmQgc3VpdGUgY2Fubm90IGJl
IHJld29ya2VkIGludG8gCiJyZWFsIiBsdHAgdGVzdHM/CkF0IHRoZSBtb21lbnQgYWxsIHRlc3Rz
IGZyb20gdGhlIHN1aXRlIGFyZSBydW4gYnkgdGhlIHdyYXBwZXIgc2NyaXB0LgoKSWYgSSB3b3Vs
ZCBjb252ZXJ0IHRoZW0sIEknZCB0cnkgdGhpcyBwcm9ncmFtbWF0aWNhbGx5LCBiZWNhdXNlIG9m
IHRoZSAKaHVnZSBudW1iZXIgb2YgdGVzdHMuCjEuIE1vdmUgc3R1ZmYgZnJvbSB0ZXN0X2ZzX2Jp
bmQuc2ggdG8gYSBsaWJyYXJ5IGZpbGUKMi4gQ29udmVydCBhbGwgdGVzdHMgaW4gZnNfYmluZC8q
IHRvIGx0cCB0ZXN0cyB1c2luZyB0aGUgbGlicmFyeSBhbmQgCmFkZGluZyB0aGVtIHRvIHRoZSBy
dW50ZXN0IGZpbGUKClRoaXMgd291bGQgbWFrZSBldmVyeSBzaW5nbGUgZnNfYmluZCB0ZXN0IGEg
c2luZ2xlIGx0cCB0ZXN0ICh+MTAwKS4KSSBkbyBub3QgdGhpbmsgdGhhdCBydW50aW1lIGluY3Jl
YXNlcyBzaWduaWZpY2FudGx5LCBiZWNhdXNlIGFzIGZhciBhcyBJIApzZWUgaXQgZnJvbSBmaXJz
dCBnbGFuY2UsIHRlc3RfZnNfYmluZC5zaCByZXNldHMgdGhlICJzYW5kYm94IiB1c2VkIGZvciAK
dGhlIHRlc3RzIGJlZm9yZSBldmVyeSB0ZXN0IGFueXdheS4KCklmIHRoZXJlIGlzIG5vIG9iamVj
dGlvbiwgSSB3b3VsZCBnaXZlIGNvbnZlcnRpbmcgdGhlIHRlc3RzIGEgc2hvdC4KCkrDtnJnCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
