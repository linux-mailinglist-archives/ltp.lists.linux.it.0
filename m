Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0342C33E98A
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 07:12:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 496313C60A5
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 07:12:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AB33A3C2D08
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 07:12:10 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1B7C76007BB
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 07:12:09 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.4.45])
 by mail.jv-coder.de (Postfix) with ESMTPSA id A3B269F7F6;
 Wed, 17 Mar 2021 06:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1615961528; bh=a72jQJnlYJjOpjeAN9+NyyQleoXOkBgYnK4Gh9auuEU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=FhynpOoblMu2urT1stBUzCMQzrXLr9FpEoELc/fwJvgKn6JmhYwkrDt2Xbsgk2gjP
 8XU7ARkke8vJI8XDmkzOZiGh3VfXweY2V47X4i0MkOxLiopGfd/hXk7YSr6RuyoKgX
 hATD+K4HqT4Yisp/bchLAXwVP88VzbpVu38Q0Wfs=
To: Li Wang <liwang@redhat.com>
References: <20210316130036.1838169-1-lkml@jv-coder.de>
 <CAEemH2dxiFi_6VUOpyaufkOecE8TCi-m8bVT=xY9GREzOfKW-A@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <4e99e625-07f1-e0c1-ab23-30f0ee8e59ef@jv-coder.de>
Date: Wed, 17 Mar 2021 07:13:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2dxiFi_6VUOpyaufkOecE8TCi-m8bVT=xY9GREzOfKW-A@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] open_posix: Remove hardcoded /tmp
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCj4gSXQnZCBiZSBncmVhdCBpZiBhwqBwYXNzaW5nIHN0cmluZyBlbmTCoHdpdGggdGhlIHN1
ZmZpeCAiXyIsIGJlIHVzZWQgdG8gCj4gY2xlYXJseSBkaXN0aW5ndWlzaCB0aGUgUElEIG51bWJl
ci4KPgo+IFNvbWV0aGluZyBsaWtlOgo+IExUUF9HRVRfVE1QX0ZJTEVOQU1FKHRtcGZuYW1lLCAi
cHRzX2Fpb19jYW5jZWxfMV8xXyIpOwo+Cj4gVGhpcyBjb21tZW50IGFwcGxpZXMgdG8gYWxsIG9m
IHRoZSBjaGFuZ2luZyBmaWxlcyBpbiB0aGlzIHBhdGNoLCBvciB3ZSAKPiBjYW4gbW9kaWZ5IGl0
IGluIHRoZSBtYWNybyBwcm90b3R5cGUuCklzIHRoaXMgcmVhbGx5IG9mIGFueSB1c2U/IEkgd2Fz
IGFsc28gdGhpbmtpbmcgYWJvdXQgcmVtb3ZpbmcgdGhlIHByZWZpeCAKcGFydCBvZiB0aGUgZmls
ZW5hbWUgY29tcGxldGVseS4KSSBqdXN0IGRlY2lkZWQgdG8ga2VlcCBpdCwgc28gZmlsZXMsIHRo
YXQgYXJlIG5vdCBkZWxldGVkIGF1dG9tYXRpY2FsbHkgCmNhbiBiZSBpZGVudGlmaWVkIGFzIGJl
bG9uZ2luZyB0byB0aGUgdGVzdC4KSWYgSSB3b3VsZCBpbXBsZW1lbnQgdGhpcywgdGhlbiBvbmx5
IGluIHRoZSBtYWNybyBkZWZpbml0aW9uLgoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
