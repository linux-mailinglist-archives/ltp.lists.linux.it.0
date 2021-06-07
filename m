Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA5539D87A
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:19:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 662F33C7C68
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:19:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 525D03C0BB1
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:18:57 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CC3A0200B8E
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:18:56 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 7D5DB9F75F;
 Mon,  7 Jun 2021 09:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1623057535; bh=t1Un524D5y++/MjGmJW1mdsqqwsxN5ENKQ1De/54qHc=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=QFJpqLtHoBgq5HrpjhsoL12l42BNKQhrRPYiwh0t82kH0p/500z3uXZilfotQ7b56
 NzYTHGAFk9PMfTgZ6HY0cGR8LftW65q0SyQUI2WSVou1z+w8+DqqAvKAKm3Cbi2Dtx
 eb4nKgYYaOFUmMho0W+ityhVY+Qattrqq2CuqTP8=
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <20210604111434.21422-2-rpalethorpe@suse.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <e6efb099-1c51-9f68-4996-7ce917107929@jv-coder.de>
Date: Mon, 7 Jun 2021 11:18:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210604111434.21422-2-rpalethorpe@suse.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC PATCH v2 1/2] Add 'make check' and clang-check to
 build system
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

SGksCgpPbiA2LzQvMjAyMSAxOjE0IFBNLCBSaWNoYXJkIFBhbGV0aG9ycGUgdmlhIGx0cCB3cm90
ZToKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvY2xhbmctY2hlY2svTWFrZWZpbGUgYi90b29scy9jbGFu
Zy1jaGVjay9NYWtlZmlsZQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
Li40NjUwZDYwNTcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdG9vbHMvY2xhbmctY2hlY2svTWFr
ZWZpbGUKPiBAQCAtMCwwICsxLDE0IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb3ItbGF0ZXIKPiArIyBDb3B5cmlnaHQgKGMpIDIwMjEgU1VTRSBMTEMgPHJwYWxldGhv
cnBlQHN1c2UuY29tPgo+ICsjIENvcHlyaWdodCAoYykgMjAxOSBDeXJpbCBIcnViaXMgPGNocnVi
aXNAc3VzZS5jej4KPiArIyBDb3B5cmlnaHQgKGMpIDIwMjAgUGV0ciBWb3JlbCA8cHZvcmVsQHN1
c2UuY3o+Cj4gKwo+ICt0b3Bfc3JjZGlyCQk/PSAuLi8uLgo+ICsKPiAraW5jbHVkZSAkKHRvcF9z
cmNkaXIpL2luY2x1ZGUvbWsvZW52X3ByZS5tawo+ICtpbmNsdWRlICQodG9wX3NyY2RpcikvaW5j
bHVkZS9tay9mdW5jdGlvbnMubWsKPiArCj4gK0hPU1RfTUFLRV9UQVJHRVRTCTo9IG1haW4KPiAr
SE9TVF9MREZMQUdTIAkJKz0gLWxjbGFuZwpJZiBhbnlvbmUgZWxzZSB0cnlpbmcgdGhpcyBoYXMg
cHJvYmxlbXMgbGlua2luZyB0aGUgdG9vbCwgYXQgbGVhc3QgZm9yIAptZSwgdGhpcyBtdXN0IGJl
CkhPU1RfTERMSUJTIMKgwqDCoCDCoMKgwqAgKz0gLWxjbGFuZwoKT3RoZXJ3aXNlIHRoZSBsaW5r
IG9yZGVyIGlzIHdyb25nIChtYWluLmMgYWZ0ZXIgLWxjbGFuZykgYW5kIGFsbCBzeW1ib2xzIApm
cm9tIGxpYmNsYW5nIGFyZSB1bmRlZmluZWQuCgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
