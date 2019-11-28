Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E20E10C4C8
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 09:12:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33C943C2270
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 09:12:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A58FA3C1815
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:12:50 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A557314149D4
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:12:49 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 4631A9F640
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 08:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1574928768; bh=zFsjory9NrMuOyGoUw9ifI701QKsf+PK/C8XNSmU25Q=;
 h=To:From:Subject:Message-ID:Date:MIME-Version;
 b=N8MGduiSFSwzccInDebZfcQ98KL1fvSYpwPL8LKjkBZ/Kc2Ng0HZvJf2FOz0FNpCx
 7E1EmHEYLkDY7+BRAleZA0YKtrsfSu4jErTaRxfbKzOemsdD1fa//UWDGOzAyWbyv1
 q2A1yzzzXhGsLB6tvoR2GxR7CGwYz5mNb1Z0Ju98=
To: LTP List <ltp@lists.linux.it>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <0aac6253-f3dc-f2e5-effb-397e9a5487e9@jv-coder.de>
Date: Thu, 28 Nov 2019 09:12:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] cpuacct tests: Rational behind test
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

SGksCgpJIGFtIGxvb2tpbmcgYXQgdGhlIGNwdWFjY3QgdGVzdHMuIFRoZXNlIHRlc3RzIGNyZWF0
ZSBuIGNncm91cHMgYW5kCnN0YXJ0IG0gcHJvY2Vzc2VzIHdpdGhpbiBlYWNoIG9mIHRoZXNlIGNn
cm91cHMuIFRoZSBwcm9jZXNzIHJ1bnMgdW50aWwKaXQgdXNlZCAxMCBtcyBvZiBjcHUgdGltZSBh
bmQgdGVybWluYXRlcy4KClRoZSB0ZXN0IGlzIHJ1biB3aXRoIGRpZmZlcmVudCB2YWx1ZXMgZm9y
IG4gYW5kIG0gdXAgdG8gMTAwIGFuZCAxMDAuClRoaXMgY3JlYXRlcyAxMDAwMCBwcm9jZXNzZXMs
IHdoaWNoIENBTiBleGlzdCBhdCB0aGUgc2FtZSB0aW1lLCBiZWNhdXNlCnRoZSBwcm9jZXNzIGNh
biBhbHJlYWR5IHRlcm1pbmF0ZSwgd2hpbGUgdGhleSBhcmUgc3RpbGwgc3RhcnRlZC4KSSB3b25k
ZXIgd2hhdCB0aGUgcmF0aW9uYWwgYmVoaW5kIHRoaXMgaXMuCgpJIHF1ZXN0aW9uIHRoZSB0aGUg
bnVtYmVycyB1c2VkICh1cCB0byAxMDAvMTAwKSBhbmQgbW9yZSBpbXBvcnRhbnQgdGhlCnNwYXdu
L2tpbGwgdGltaW5ncy4KCklmIGl0IGlzIHJlcXVpcmVkLCB0aGF0IGFsbCBwcm9jZXNzZXMgcnVu
IGluIHBhcmFsbGVsLCBzeW5jaHJvbml6YXRpb24KaXMgcmVxdWlyZWQuIElmIGl0IGlzIG5vdCBy
ZXF1aXJlZCwgdGVzdCBwcm9jZXNzZXMgc2hvdWxkIGJlIHN0YXJ0ZWQKYW5kIHRlcm1pbmF0ZWQg
aW4gYmF0Y2hlcy4gVGhpcyB3b3VsZCBwcm9iYWJseSByZWR1Y2UgdGVzdCBydW50aW1lLApiZWNh
dXNlIHRoZSBzeXN0ZW0gaXMgbm90IHBlcm1hbmVudGx5IHN3aXRjaGluZyBjb250ZXh0cy4KCklz
IGl0IHJlYWxseSByZXF1aXJlZCB0byBydW4gaXQgd2l0aCAxMDAvMTAwPyBTaG91bGRuJ3QgaXQg
YmUgZW5vdWdoCnRvIHJ1biB0aGUgdGVzdCB3aXRoIDEwLzEwIDEvMTAwIGFuZCAxMDAvMT8gU2Fk
bHkgdGhlcmUgaXMgbm8gcmF0aW9uYWwKZm9yIHRoZSB0ZXN0IGF0IGFsbCBpbiB0aGUgc291cmNl
cy4KCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
